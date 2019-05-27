package com.ankamagames.dofus.logic.game.common.actions.breach
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class BreachInvitationRequestAction implements Action
   {
       
      
      public var guestId:Number;
      
      public function BreachInvitationRequestAction()
      {
         super();
      }
      
      public static function create(guestId:Number) : BreachInvitationRequestAction
      {
         var a:BreachInvitationRequestAction = new BreachInvitationRequestAction();
         a.guestId = guestId;
         return a;
      }
   }
}
