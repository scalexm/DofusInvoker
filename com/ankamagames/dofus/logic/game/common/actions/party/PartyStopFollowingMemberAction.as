package com.ankamagames.dofus.logic.game.common.actions.party
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class PartyStopFollowingMemberAction implements Action
   {
       
      
      public var playerId:Number;
      
      public var partyId:int;
      
      public function PartyStopFollowingMemberAction()
      {
         super();
      }
      
      public static function create(partyId:int, pPlayerId:Number) : PartyStopFollowingMemberAction
      {
         var a:PartyStopFollowingMemberAction = new PartyStopFollowingMemberAction();
         a.partyId = partyId;
         a.playerId = pPlayerId;
         return a;
      }
   }
}
