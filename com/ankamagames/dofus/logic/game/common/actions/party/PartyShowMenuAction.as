package com.ankamagames.dofus.logic.game.common.actions.party
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class PartyShowMenuAction implements Action
   {
       
      
      public var playerId:Number;
      
      public var partyId:int;
      
      public function PartyShowMenuAction()
      {
         super();
      }
      
      public static function create(pPlayerId:Number, pPartyId:int) : PartyShowMenuAction
      {
         var a:PartyShowMenuAction = new PartyShowMenuAction();
         a.playerId = pPlayerId;
         a.partyId = pPartyId;
         return a;
      }
   }
}
