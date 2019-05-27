package com.ankamagames.dofus.logic.game.common.actions.party
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class PartyFollowMemberAction implements Action
   {
       
      
      public var playerId:Number;
      
      public var partyId:int;
      
      public function PartyFollowMemberAction()
      {
         super();
      }
      
      public static function create(partyId:int, pPlayerId:Number) : PartyFollowMemberAction
      {
         var a:PartyFollowMemberAction = new PartyFollowMemberAction();
         a.partyId = partyId;
         a.playerId = pPlayerId;
         return a;
      }
   }
}
