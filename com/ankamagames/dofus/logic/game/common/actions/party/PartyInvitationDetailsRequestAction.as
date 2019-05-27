package com.ankamagames.dofus.logic.game.common.actions.party
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class PartyInvitationDetailsRequestAction implements Action
   {
       
      
      public var partyId:int;
      
      public function PartyInvitationDetailsRequestAction()
      {
         super();
      }
      
      public static function create(partyId:int) : PartyInvitationDetailsRequestAction
      {
         var a:PartyInvitationDetailsRequestAction = new PartyInvitationDetailsRequestAction();
         a.partyId = partyId;
         return a;
      }
   }
}
