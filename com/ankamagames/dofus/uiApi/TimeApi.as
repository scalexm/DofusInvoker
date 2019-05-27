package com.ankamagames.dofus.uiApi
{
   import com.ankamagames.berilia.interfaces.IApi;
   import com.ankamagames.berilia.types.data.UiModule;
   import com.ankamagames.dofus.logic.game.common.managers.TimeManager;
   import com.ankamagames.jerakine.logger.Log;
   import com.ankamagames.jerakine.logger.Logger;
   import flash.utils.getQualifiedClassName;
   
   [InstanciedApi]
   public class TimeApi implements IApi
   {
      
      private static const MINUTE_TO_MILLISECOND:Number = 60000;
       
      
      private var _module:UiModule;
      
      protected var _log:Logger;
      
      public function TimeApi()
      {
         this._log = Log.getLogger(getQualifiedClassName(TimeApi));
         super();
      }
      
      [ApiData(name="module")]
      public function set module(value:UiModule) : void
      {
         this._module = value;
      }
      
      [Trusted]
      public function destroy() : void
      {
         this._module = null;
      }
      
      [Untrusted]
      public function getTimestamp() : Number
      {
         return TimeManager.getInstance().getTimestamp();
      }
      
      [Untrusted]
      public function getUtcTimestamp() : Number
      {
         return TimeManager.getInstance().getUtcTimestamp();
      }
      
      [Untrusted]
      public function getClock(time:Number = 0, unchanged:Boolean = false, useTimezoneOffset:Boolean = false) : String
      {
         return TimeManager.getInstance().formatClock(time,unchanged,useTimezoneOffset);
      }
      
      [Untrusted]
      public function getClockNumbers() : Object
      {
         var time:Array = TimeManager.getInstance().getDateFromTime(0);
         return [time[0],time[1]];
      }
      
      [Untrusted]
      public function getDate(time:Number = 0, useTimezoneOffset:Boolean = false, unchanged:Boolean = false) : String
      {
         return TimeManager.getInstance().formatDateIRL(time,useTimezoneOffset,unchanged);
      }
      
      [Untrusted]
      public function getDofusDate(time:Number = 0) : String
      {
         return TimeManager.getInstance().formatDateIG(time);
      }
      
      [Untrusted]
      public function getDofusDay(time:Number = 0) : int
      {
         return TimeManager.getInstance().getDateIG(time)[0];
      }
      
      [Untrusted]
      public function getDofusMonth(time:Number = 0) : String
      {
         return TimeManager.getInstance().getDateIG(time)[1];
      }
      
      [Untrusted]
      public function getDofusYear(time:Number = 0) : String
      {
         return TimeManager.getInstance().getDateIG(time)[2];
      }
      
      [Untrusted]
      public function getDurationTimeSinceEpoch(pTime:Number = 0) : Number
      {
         var date:Date = new Date();
         var dateTime:Number = date.getTime() / 1000;
         var timezoneOffset:Number = TimeManager.getInstance().timezoneOffset / 1000;
         var serverTimeLag:Number = TimeManager.getInstance().serverTimeLag / 1000;
         return Math.floor(dateTime - pTime + timezoneOffset - serverTimeLag);
      }
      
      [Untrusted]
      public function serverTimeToLocalTime(clientDate:Date) : Number
      {
         var serverTimeLag:Number = TimeManager.getInstance().serverTimeLag;
         return clientDate.getTime() - serverTimeLag - clientDate.timezoneOffset * MINUTE_TO_MILLISECOND;
      }
      
      [Untrusted]
      public function getDuration(time:Number, second:Boolean = false) : String
      {
         return TimeManager.getInstance().getDuration(time,false,second);
      }
      
      [Untrusted]
      public function getShortDuration(time:Number, second:Boolean = false) : String
      {
         return TimeManager.getInstance().getDuration(time,true,second);
      }
      
      [Untrusted]
      public function getTimezoneOffset() : Number
      {
         return TimeManager.getInstance().timezoneOffset;
      }
   }
}
