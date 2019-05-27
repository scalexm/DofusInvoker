package com.ankamagames.jerakine.logger.targets
{
   import com.ankamagames.jerakine.logger.LogEvent;
   
   public class TraceTarget extends AbstractTarget
   {
       
      
      public function TraceTarget()
      {
         super();
      }
      
      override public function logEvent(event:LogEvent) : void
      {
      }
   }
}
