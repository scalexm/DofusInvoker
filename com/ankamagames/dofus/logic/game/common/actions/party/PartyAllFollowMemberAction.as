package com.ankamagames.dofus.logic.game.common.actions.party
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class PartyAllFollowMemberAction implements Action
   {
       
      
      public var playerId:Number;
      
      public var partyId:int;
      
      public function PartyAllFollowMemberAction()
      {
         super();
      }
      
      public static function create(partyId:int, pPlayerId:Number) : PartyAllFollowMemberAction
      {
         var a:PartyAllFollowMemberAction = new PartyAllFollowMemberAction();
         a.partyId = partyId;
         a.playerId = pPlayerId;
         return a;
      }
   }
}
