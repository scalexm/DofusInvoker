package com.ankamagames.dofus.misc.utils.errormanager
{
   public class DataExceptionModel
   {
       
      
      public var hash:String;
      
      public var stacktrace:String;
      
      public var date:int;
      
      public var isBlockerAndReboot:Boolean;
      
      public var isBlockerAndChangeCharacter:Boolean;
      
      public var buildType:String;
      
      public var buildVersion:String;
      
      public var osType:String;
      
      public var osVersion:String;
      
      public var serverId:uint;
      
      public var characterId:Number;
      
      public var mapId:Number;
      
      public var isMultiAccount:Boolean;
      
      public var isInFight:Boolean;
      
      public var logsSos:String;
      
      public var framesList:String;
      
      public var replayFile:String;
      
      public var reportFile:String;
      
      public var customInfo;
      
      public var sent:Boolean = false;
      
      public function DataExceptionModel()
      {
         super();
      }
      
      public function get errorType() : String
      {
         if(this.isBlockerAndReboot)
         {
            return "reboot";
         }
         if(this.isBlockerAndChangeCharacter)
         {
            return "changeCharacter";
         }
         return "";
      }
   }
}
