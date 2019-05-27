package com.ankamagames.dofus.logic.game.common.actions.party
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class PartyAllStopFollowingMemberAction implements Action
   {
       
      
      public var playerId:Number;
      
      public var partyId:int;
      
      public function PartyAllStopFollowingMemberAction()
      {
         super();
      }
      
      public static function create(partyId:int, pPlayerId:Number) : PartyAllStopFollowingMemberAction
      {
         var a:PartyAllStopFollowingMemberAction = new PartyAllStopFollowingMemberAction();
         a.partyId = partyId;
         a.playerId = pPlayerId;
         return a;
      }
   }
}
