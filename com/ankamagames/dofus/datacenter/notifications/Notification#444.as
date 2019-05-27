package com.ankamagames.dofus.datacenter.notifications
{
   import com.ankamagames.jerakine.data.GameData;
   import com.ankamagames.jerakine.data.I18n;
   import com.ankamagames.jerakine.interfaces.IDataCenter;
   import com.ankamagames.jerakine.logger.Log;
   import com.ankamagames.jerakine.logger.Logger;
   import flash.utils.getQualifiedClassName;
   
   public class Notification#444 implements IDataCenter
   {
      
      public static const MODULE:String = "Notifications";
      
      protected static const _log:Logger = Log.getLogger(getQualifiedClassName(Notification#444));
       
      
      public var id:int;
      
      public var titleId:uint;
      
      public var messageId:uint;
      
      public var iconId:int;
      
      public var typeId:int;
      
      public var trigger:String;
      
      private var _title:String;
      
      private var _message:String;
      
      public function Notification#444()
      {
         super();
      }
      
      public static function getNotificationById(id:int) : Notification#444
      {
         return GameData.getObject(MODULE,id) as Notification#444;
      }
      
      public static function getNotifications() : Array
      {
         return GameData.getObjects(MODULE);
      }
      
      public function get title() : String
      {
         if(!this._title)
         {
            this._title = I18n.getText(this.titleId);
         }
         return this._title;
      }
      
      public function get message() : String
      {
         if(!this._message)
         {
            this._message = I18n.getText(this.messageId);
         }
         return this._message;
      }
   }
}
