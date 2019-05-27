package com.ankamagames.dofus.logic.common.frames
{
   import by.blooddy.crypto.MD5;
   import com.ankamagames.berilia.managers.KernelEventsManager;
   import com.ankamagames.dofus.datacenter.misc.Url;
   import com.ankamagames.dofus.kernel.Kernel;
   import com.ankamagames.dofus.logic.common.managers.PlayerManager;
   import com.ankamagames.dofus.logic.connection.frames.AuthentificationFrame;
   import com.ankamagames.dofus.logic.shield.SecureModeManager;
   import com.ankamagames.dofus.misc.lists.HookList;
   import com.ankamagames.dofus.misc.utils.HaapiKeyManager;
   import com.ankamagames.dofus.network.messages.game.script.URLOpenMessage;
   import com.ankamagames.dofus.network.messages.secure.TrustStatusMessage;
   import com.ankamagames.dofus.network.messages.security.RawDataMessage;
   import com.ankamagames.dofus.types.enums.WebLocationEnum;
   import com.ankamagames.jerakine.logger.Log;
   import com.ankamagames.jerakine.logger.Logger;
   import com.ankamagames.jerakine.managers.ErrorManager;
   import com.ankamagames.jerakine.messages.Frame;
   import com.ankamagames.jerakine.messages.Message;
   import com.ankamagames.jerakine.types.enums.Priority;
   import com.ankamagames.jerakine.utils.crypto.Signature;
   import com.ankamagames.jerakine.utils.crypto.SignatureKey;
   import com.ankamagames.jerakine.utils.system.AirScanner;
   import com.hurlant.crypto.rsa.RSAKey;
   import com.hurlant.util.der.PEM;
   import flash.display.Loader;
   import flash.events.UncaughtErrorEvent;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   import flash.system.ApplicationDomain;
   import flash.system.LoaderContext;
   import flash.utils.ByteArray;
   import flash.utils.getQualifiedClassName;
   
   public class ServerControlFrame implements Frame
   {
      
      private static const PUBLIC_KEY_V1:Class = ServerControlFrame_PUBLIC_KEY_V1;
      
      private static const SIGNATURE_KEY_V1:SignatureKey = SignatureKey.fromByte(new PUBLIC_KEY_V1() as ByteArray);
      
      private static const PUBLIC_KEY_V2:Class = ServerControlFrame_PUBLIC_KEY_V2;
      
      private static var SIGNATURE_KEY_V2:RSAKey;
      
      protected static const _log:Logger = Log.getLogger(getQualifiedClassName(ServerControlFrame));
       
      
      public function ServerControlFrame()
      {
         super();
         var rawPem:ByteArray = new PUBLIC_KEY_V2() as ByteArray;
         SIGNATURE_KEY_V2 = PEM.readRSAPublicKey(rawPem.readUTFBytes(rawPem.bytesAvailable));
      }
      
      public function get priority() : int
      {
         return Priority.NORMAL;
      }
      
      public function pushed() : Boolean
      {
         return true;
      }
      
      public function pulled() : Boolean
      {
         return true;
      }
      
      public function process(msg:Message) : Boolean
      {
         var rdMsg:RawDataMessage = null;
         var content:ByteArray = null;
         var signature:Signature = null;
         var urlmsg:URLOpenMessage = null;
         var urlData:Url = null;
         var tsMsg:TrustStatusMessage = null;
         var l:Loader = null;
         var lc:LoaderContext = null;
         switch(true)
         {
            case msg is RawDataMessage:
               rdMsg = msg as RawDataMessage;
               if(Kernel.getWorker().contains(AuthentificationFrame))
               {
                  _log.error("Impossible de traiter le paquet RawDataMessage durant cette phase.");
                  return false;
               }
               content = new ByteArray();
               signature = new Signature(SIGNATURE_KEY_V1,SIGNATURE_KEY_V2);
               _log.info("Bytecode len: " + rdMsg.content.length + ", hash: " + MD5.hashBytes(rdMsg.content));
               rdMsg.content.position = 0;
               if(signature.verify(rdMsg.content,content))
               {
                  l = new Loader();
                  l.uncaughtErrorEvents.addEventListener(UncaughtErrorEvent.UNCAUGHT_ERROR,ErrorManager.onUncaughtError,false,0,true);
                  lc = new LoaderContext(false,new ApplicationDomain(ApplicationDomain.currentDomain));
                  AirScanner.allowByteCodeExecution(lc,true);
                  l.loadBytes(content,lc);
               }
               else
               {
                  _log.error("Signature incorrecte");
               }
               return true;
            case msg is URLOpenMessage:
               urlmsg = msg as URLOpenMessage;
               urlData = Url.getUrlById(urlmsg.urlId);
               switch(urlData.browserId)
               {
                  case 1:
                     HaapiKeyManager.getInstance().callWithApiKey(function(apiKey:String):void
                     {
                        var req:URLRequest = new URLRequest(urlData.url);
                        req.method = urlData.method == ""?"GET":urlData.method.toUpperCase();
                        req.data = urlData.getVariables(apiKey);
                        navigateToURL(req);
                     });
                     return true;
                  case 2:
                     KernelEventsManager.getInstance().processCallback(HookList.OpenWebPortal,WebLocationEnum.WEB_LOCATION_OGRINE);
                     return true;
                  case 3:
                     return true;
                  case 4:
                     if(HookList[urlData.url])
                     {
                        KernelEventsManager.getInstance().processCallback(HookList[urlData.url]);
                     }
                     return true;
                  default:
                     return true;
               }
            case msg is TrustStatusMessage:
               tsMsg = msg as TrustStatusMessage;
               SecureModeManager.getInstance().active = !tsMsg.trusted;
               PlayerManager.getInstance().isSafe = tsMsg.certified;
               return true;
            default:
               return false;
         }
      }
   }
}
