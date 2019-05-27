package com.ankamagames.dofus.logic.game.common.actions.party
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class PartyCancelInvitationAction implements Action
   {
       
      
      public var guestId:Number;
      
      public var partyId:int;
      
      public function PartyCancelInvitationAction()
      {
         super();
      }
      
      public static function create(partyId:int, guestId:Number) : PartyCancelInvitationAction
      {
         var a:PartyCancelInvitationAction = new PartyCancelInvitationAction();
         a.partyId = partyId;
         a.guestId = guestId;
         return a;
      }
   }
}
