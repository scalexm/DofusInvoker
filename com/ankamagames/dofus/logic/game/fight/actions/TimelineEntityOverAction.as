package com.ankamagames.dofus.logic.game.fight.actions
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   import com.ankamagames.jerakine.interfaces.IRectangle;
   
   public class TimelineEntityOverAction implements Action
   {
       
      
      public var targetId:Number;
      
      public var showRange:Boolean;
      
      public var highlightTimelineFighter:Boolean;
      
      public var timelineTarget:IRectangle;
      
      public function TimelineEntityOverAction()
      {
         super();
      }
      
      public static function create(target:Number, showRange:Boolean, highlightTimelineFighter:Boolean = true, timelineTarget:IRectangle = null) : TimelineEntityOverAction
      {
         var a:TimelineEntityOverAction = new TimelineEntityOverAction();
         a.targetId = target;
         a.showRange = showRange;
         a.highlightTimelineFighter = highlightTimelineFighter;
         a.timelineTarget = timelineTarget;
         return a;
      }
   }
}
