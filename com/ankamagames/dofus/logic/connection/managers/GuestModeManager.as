package com.ankamagames.dofus.logic.connection.managers
{
   import by.blooddy.crypto.MD5;
   import com.ankamagames.berilia.managers.KernelEventsManager;
   import com.ankamagames.berilia.managers.UiModuleManager;
   import com.ankamagames.dofus.datacenter.items.Item;
   import com.ankamagames.dofus.datacenter.spells.SpellVariant;
   import com.ankamagames.dofus.kernel.Kernel;
   import com.ankamagames.dofus.logic.connection.actions.LoginValidationAsGuestAction;
   import com.ankamagames.dofus.logic.game.common.frames.ExternalGameFrame;
   import com.ankamagames.dofus.logic.game.common.frames.ProtectPishingFrame;
   import com.ankamagames.dofus.misc.lists.HookList;
   import com.ankamagames.dofus.misc.utils.RpcServiceCenter;
   import com.ankamagames.jerakine.data.I18n;
   import com.ankamagames.jerakine.data.XmlConfig;
   import com.ankamagames.jerakine.enum.WebBrowserEnum;
   import com.ankamagames.jerakine.interfaces.IDestroyable;
   import com.ankamagames.jerakine.logger.Log;
   import com.ankamagames.jerakine.logger.Logger;
   import com.ankamagames.jerakine.messages.Frame;
   import com.ankamagames.jerakine.types.CustomSharedObject;
   import com.ankamagames.jerakine.utils.errors.SingletonError;
   import com.ankamagames.jerakine.utils.system.CommandLineArguments;
   import com.ankamagames.jerakine.utils.system.SystemManager;
   import com.hurlant.crypto.Crypto;
   import com.hurlant.crypto.symmetric.ICipher;
   import com.hurlant.crypto.symmetric.PKCS5;
   import flash.events.ErrorEvent;
   import flash.events.IOErrorEvent;
   import flash.external.ExternalInterface;
   import flash.net.URLRequest;
   import flash.net.URLRequestMethod;
   import flash.net.URLVariables;
   import flash.net.navigateToURL;
   import flash.utils.ByteArray;
   import flash.utils.getQualifiedClassName;
   
   public class GuestModeManager implements IDestroyable
   {
      
      protected static const _log:Logger = Log.getLogger(getQualifiedClassName(GuestModeManager));
      
      private static var _self:GuestModeManager;
       
      
      private var _forceGuestMode:Boolean;
      
      private var _domainExtension:String;
      
      private var _locale:String;
      
      public var isLoggingAsGuest:Boolean = false;
      
      public function GuestModeManager()
      {
         super();
         if(_self != null)
         {
            throw new SingletonError("GuestModeManager is a singleton and should not be instanciated directly.");
         }
         this._forceGuestMode = false;
         this._domainExtension = RpcServiceCenter.getInstance().apiDomain.split(".").pop() as String;
         this._locale = XmlConfig.getInstance().getEntry("config.lang.current");
         if(CommandLineArguments.getInstance().hasArgument("guest"))
         {
            this._forceGuestMode = CommandLineArguments.getInstance().getArgument("guest") == "true";
         }
      }
      
      public static function getInstance() : GuestModeManager
      {
         if(_self == null)
         {
            _self = new GuestModeManager();
         }
         return _self;
      }
      
      public function get forceGuestMode() : Boolean
      {
         return this._forceGuestMode;
      }
      
      public function set forceGuestMode(v:Boolean) : void
      {
         this._forceGuestMode = v;
      }
      
      public function logAsGuest() : void
      {
         var methodParams:Array = null;
         var credentials:Object = this.getStoredCredentials();
         if(!credentials)
         {
            methodParams = [this._locale];
            if(CommandLineArguments.getInstance().hasArgument("webParams"))
            {
               methodParams.push(CommandLineArguments.getInstance().getArgument("webParams"));
            }
            RpcServiceCenter.getInstance().makeRpcCall(RpcServiceCenter.getInstance().apiDomain + "/ankama/guest.json","json","1.0","Create",methodParams,this.onGuestAccountCreated,true,false);
         }
         else
         {
            Kernel.getWorker().process(LoginValidationAsGuestAction.create(credentials.login,credentials.password));
         }
      }
      
      public function convertGuestAccount() : void
      {
         var commonMod:Object = null;
         var egf:ExternalGameFrame = Kernel.getWorker().getFrame(ExternalGameFrame) as ExternalGameFrame;
         if(egf)
         {
            egf.getIceToken(this.onIceTokenReceived);
         }
         else
         {
            commonMod = UiModuleManager.getInstance().getModule("Ankama_Common").mainClass;
            commonMod.openPopup(I18n.getUiText("ui.common.error"),I18n.getUiText("ui.secureMode.error.default"),[I18n.getUiText("ui.common.ok")]);
         }
      }
      
      public function clearStoredCredentials() : void
      {
         var so:CustomSharedObject = CustomSharedObject.getLocal("Dofus_Guest");
         if(so && so.data)
         {
            so.data = new Object();
            so.flush();
         }
      }
      
      public function hasGuestAccount() : Boolean
      {
         return this.getStoredCredentials() != null;
      }
      
      public function destroy() : void
      {
         _self = null;
      }
      
      private function storeCredentials(login:String, password:String) : void
      {
         var md5:String = MD5.hash(login);
         var key:ByteArray = new ByteArray();
         key.writeUTFBytes(md5);
         var pad:PKCS5 = new PKCS5();
         var mode:ICipher = Crypto.getCipher("simple-aes",key,pad);
         pad.setBlockSize(mode.getBlockSize());
         var encryptedPassword:ByteArray = new ByteArray();
         encryptedPassword.writeUTFBytes(password);
         mode.encrypt(encryptedPassword);
         var so:CustomSharedObject = CustomSharedObject.getLocal("Dofus_Guest");
         if(so)
         {
            if(!so.data)
            {
               so.data = new Object();
            }
            so.data.login = login;
            so.data.password = encryptedPassword;
            so.flush();
         }
      }
      
      private function getStoredCredentials() : Object
      {
         var md5:String = null;
         var key:ByteArray = null;
         var pad:PKCS5 = null;
         var mode:ICipher = null;
         var cryptedPassword:ByteArray = null;
         var decryptedPassword:ByteArray = null;
         var guestLogin:String = null;
         var guestPassword:String = null;
         var so:CustomSharedObject = CustomSharedObject.getLocal("Dofus_Guest");
         if(so && so.data && so.data.hasOwnProperty("login") && so.data.hasOwnProperty("password"))
         {
            md5 = MD5.hash(so.data.login);
            key = new ByteArray();
            key.writeUTFBytes(md5);
            pad = new PKCS5();
            mode = Crypto.getCipher("simple-aes",key,pad);
            pad.setBlockSize(mode.getBlockSize());
            cryptedPassword = so.data.password as ByteArray;
            decryptedPassword = new ByteArray();
            decryptedPassword.writeBytes(cryptedPassword);
            mode.decrypt(decryptedPassword);
            decryptedPassword.position = 0;
            guestLogin = so.data.login;
            guestPassword = decryptedPassword.readUTFBytes(decryptedPassword.length);
            return {
               "login":guestLogin,
               "password":guestPassword
            };
         }
         return null;
      }
      
      private function onGuestAccountCreated(success:Boolean, params:*, request:*) : void
      {
         _log.debug("onGuestAccountCreated - " + success);
         if(success)
         {
            if(params.error)
            {
               this.onGuestAccountError(params.error);
            }
            else
            {
               this.storeCredentials(params.login,params.password);
               Kernel.getWorker().process(LoginValidationAsGuestAction.create(params.login,params.password));
            }
         }
         else
         {
            this.onGuestAccountError(params);
         }
      }
      
      private function onGuestAccountError(error:*) : void
      {
         var errorMsg:String = null;
         var f:Frame = null;
         var className:String = null;
         var split:Array = null;
         _log.error(error);
         var commonMod:Object = UiModuleManager.getInstance().getModule("Ankama_Common").mainClass;
         if(error is ErrorEvent && error.type == IOErrorEvent.NETWORK_ERROR || error is IOErrorEvent)
         {
            commonMod.openPopup(I18n.getUiText("ui.common.error"),I18n.getUiText("ui.connection.guestAccountCreationTimedOut"),[I18n.getUiText("ui.common.ok")]);
         }
         else if(error is String)
         {
            commonMod.openPopup(I18n.getUiText("ui.common.error"),error,[I18n.getUiText("ui.common.ok")]);
         }
         else
         {
            errorMsg = I18n.getUiText("ui.secureMode.error.default");
            if(error is ErrorEvent)
            {
               errorMsg = errorMsg + (" (#" + (error as ErrorEvent).errorID + ")");
            }
            commonMod.openPopup(I18n.getUiText("ui.common.error"),errorMsg,[I18n.getUiText("ui.common.ok")]);
         }
         KernelEventsManager.getInstance().processCallback(HookList.IdentificationFailed,0);
         if(this._forceGuestMode)
         {
            this._forceGuestMode = false;
            if(Kernel.getWorker().contains(ProtectPishingFrame))
            {
               _log.error("Oh oh ! ProtectPishingFrame is still here, it shoudln\'t be. Who else is in here ?");
               for each(f in Kernel.getWorker().framesList)
               {
                  className = getQualifiedClassName(f);
                  split = className.split("::");
                  _log.error(" - " + split[split.length - 1]);
               }
               Kernel.getWorker().removeFrame(Kernel.getWorker().getFrame(ProtectPishingFrame));
            }
            KernelEventsManager.getInstance().processCallback(HookList.AuthentificationStart,false);
         }
      }
      
      private function onIceTokenReceived(token:String) : void
      {
         var commonMod:Object = null;
         var ur:URLRequest = null;
         if(!token)
         {
            commonMod = UiModuleManager.getInstance().getModule("Ankama_Common").mainClass;
            commonMod.openPopup(I18n.getUiText("ui.common.error"),I18n.getUiText("ui.secureMode.error.default"),[I18n.getUiText("ui.common.ok")]);
            return;
         }
         var url:String = "https://go.ankama." + this._domainExtension + "/" + this._locale + "/go/dofus/complete-guest";
         var urlVars:URLVariables = new URLVariables();
         urlVars.key = token;
         if(SystemManager.getSingleton().browser == WebBrowserEnum.CHROME && ExternalInterface.available)
         {
            ExternalInterface.call("window.open",url + "?" + urlVars.toString(),"_blank");
         }
         else
         {
            ur = new URLRequest(url);
            ur.method = URLRequestMethod.GET;
            ur.data = urlVars;
            navigateToURL(ur,"_blank");
         }
      }
   }
}
