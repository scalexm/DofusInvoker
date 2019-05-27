package com.ankamagames.jerakine.logger
{
   public class LogLogger implements Logger
   {
      
      private static var _enabled:Boolean = true;
      
      private static var _useModuleLoggerHasOutputLog:Boolean = false;
       
      
      private var _category:String;
      
      private var _deactivatedTarget:Vector.<int>;
      
      public function LogLogger(category:String)
      {
         this._deactivatedTarget = new Vector.<int>();
         super();
         this._category = category;
      }
      
      public static function useModuleLoggerHasOutputLog(value:Boolean) : void
      {
         _useModuleLoggerHasOutputLog = value;
      }
      
      public static function activeLog(active:Boolean) : void
      {
         _enabled = active;
      }
      
      public static function logIsActive() : Boolean
      {
         return _enabled;
      }
      
      public function get category() : String
      {
         return this._category;
      }
      
      public function trace(message:Object) : void
      {
         this.log(LogLevel.TRACE,message);
      }
      
      public function debug(message:Object) : void
      {
         this.log(LogLevel.DEBUG,message);
      }
      
      public function info(message:Object) : void
      {
         this.log(LogLevel.INFO,message);
      }
      
      public function warn(message:Object) : void
      {
         this.log(LogLevel.WARN,message);
      }
      
      public function error(message:Object) : void
      {
         this.log(LogLevel.ERROR,message);
      }
      
      public function fatal(message:Object) : void
      {
         this.log(LogLevel.FATAL,message);
      }
      
      public function logDirectly(logEvent:LogEvent) : void
      {
         if(_enabled)
         {
            Log.broadcastToTargets(logEvent);
         }
      }
      
      public function log(level:uint, object:Object) : void
      {
         var message:String = null;
         var formatedMessage:String = null;
         if(_enabled && this._deactivatedTarget.indexOf(level) == -1)
         {
            if(object)
            {
               message = object.toString();
               formatedMessage = this.getFormatedMessage(message);
            }
            else
            {
               message = "null";
               formatedMessage = "null";
            }
            Log.broadcastToTargets(new TextLogEvent(this._category,level != LogLevel.COMMANDS?formatedMessage:message,level));
            if(_useModuleLoggerHasOutputLog)
            {
               ModuleLogger.log(formatedMessage,level);
            }
         }
      }
      
      public function setLevelDectivation(level:uint, deactivate:Boolean) : void
      {
         if(deactivate && this._deactivatedTarget.indexOf(level) == -1)
         {
            this._deactivatedTarget.push(level);
         }
         else if(this._deactivatedTarget.indexOf(level) != -1)
         {
            this._deactivatedTarget.splice(this._deactivatedTarget.indexOf(level),1);
         }
      }
      
      private function getFormatedMessage(message:String) : String
      {
         if(!message)
         {
            message = "";
         }
         var catSplit:Array = this._category.split("::");
         var head:* = (Log.PREFIX != ""?"[" + Log.PREFIX + "] ":"") + "[" + catSplit[catSplit.length - 1] + "] ";
         var indent:* = "";
         for(var i:uint = 0; i < head.length; i++)
         {
            indent = indent + " ";
         }
         message = message.replace("\n","\n" + indent);
         return head + message;
      }
      
      public function clear() : void
      {
         this.log(LogLevel.COMMANDS,"clear");
      }
   }
}
