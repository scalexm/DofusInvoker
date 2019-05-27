package com.ankamagames.dofus.kernel.updaterv2
{
   import com.ankamagames.berilia.interfaces.IApi;
   import com.ankamagames.dofus.kernel.updaterv2.messages.impl.GetSystemConfiguration;
   import com.ankamagames.dofus.kernel.updaterv2.messages.impl.RequestApiTokenMessage;
   import com.ankamagames.dofus.kernel.updaterv2.messages.impl.RequestLanguageMessage;
   import com.ankamagames.dofus.kernel.updaterv2.messages.impl.RequestZaapSettingMessage;
   import com.ankamagames.dofus.kernel.updaterv2.messages.impl.RequestZaapUserInfosMessage;
   import com.ankamagames.dofus.misc.utils.GameID;
   
   public class UpdaterApi implements IApi
   {
      
      public static var updaterConnection:UpdaterConnexionHelper = new UpdaterConnexionHelper();
       
      
      public function UpdaterApi(handler:IUpdaterMessageHandler)
      {
         super();
         updaterConnection.addObserver(handler);
      }
      
      public static function init() : void
      {
         updaterConnection.connect();
      }
      
      public static function isConnected() : Boolean
      {
         return updaterConnection.isConnected();
      }
      
      public static function isUsingZaap() : Boolean
      {
         return updaterConnection.isUsingZaap();
      }
      
      public static function isUsingZaapLogin() : Boolean
      {
         return updaterConnection.isUsingZaapLogin();
      }
      
      public static function canLoginWithZaap() : Boolean
      {
         return updaterConnection.canLoginWithZaap();
      }
      
      public static function isDisconnected() : Boolean
      {
         return updaterConnection.isDisconnected();
      }
      
      public static function disableZaapLogin() : void
      {
         updaterConnection.disableZaapLogin();
      }
      
      public static function requestZaapRestart(callback:Function) : void
      {
         updaterConnection.requestZaapRestart(callback);
      }
      
      public function detach(handler:IUpdaterMessageHandler) : void
      {
         updaterConnection.removeObserver(handler);
      }
      
      public function getLanguage() : void
      {
         updaterConnection.sendMessage(new RequestLanguageMessage());
      }
      
      public function getZaapSetting(name:String) : void
      {
         updaterConnection.sendMessage(new RequestZaapSettingMessage(name));
      }
      
      public function getUserInfos() : void
      {
         updaterConnection.sendMessage(new RequestZaapUserInfosMessage());
      }
      
      public function getIdentificationToken() : void
      {
         updaterConnection.sendMessage(new RequestApiTokenMessage(GameID.current));
      }
      
      public function getSystemConfiguration(key:String = "") : void
      {
         updaterConnection.sendMessage(new GetSystemConfiguration(key));
      }
   }
}
