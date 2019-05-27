package com.ankamagames.dofus.logic.game.fight.actions
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class TimelineEntityOutAction implements Action
   {
       
      
      public var targetId:Number;
      
      public function TimelineEntityOutAction()
      {
         super();
      }
      
      public static function create(target:Number) : TimelineEntityOutAction
      {
         var a:TimelineEntityOutAction = new TimelineEntityOutAction();
         a.targetId = target;
         return a;
      }
   }
}
