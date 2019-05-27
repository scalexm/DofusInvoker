package com.ankamagames.dofus.logic.game.common.actions.breach
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class BreachKickRequestAction implements Action
   {
       
      
      public var guestId:Number;
      
      public function BreachKickRequestAction()
      {
         super();
      }
      
      public static function create(guestId:Number) : BreachKickRequestAction
      {
         var a:BreachKickRequestAction = new BreachKickRequestAction();
         a.guestId = guestId;
         return a;
      }
   }
}
