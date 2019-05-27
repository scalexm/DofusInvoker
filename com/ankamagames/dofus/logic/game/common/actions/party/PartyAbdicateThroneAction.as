package com.ankamagames.dofus.logic.game.common.actions.party
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class PartyAbdicateThroneAction implements Action
   {
       
      
      public var playerId:Number;
      
      public var partyId:int;
      
      public function PartyAbdicateThroneAction()
      {
         super();
      }
      
      public static function create(partyId:int, pPlayerId:Number) : PartyAbdicateThroneAction
      {
         var a:PartyAbdicateThroneAction = new PartyAbdicateThroneAction();
         a.partyId = partyId;
         a.playerId = pPlayerId;
         return a;
      }
   }
}
