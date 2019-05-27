package com.ankamagames.dofus.logic.game.fight.actions
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class TimelineEntityClickAction implements Action
   {
       
      
      public var fighterId:Number;
      
      public function TimelineEntityClickAction()
      {
         super();
      }
      
      public static function create(id:Number) : TimelineEntityClickAction
      {
         var a:TimelineEntityClickAction = new TimelineEntityClickAction();
         a.fighterId = id;
         return a;
      }
   }
}
