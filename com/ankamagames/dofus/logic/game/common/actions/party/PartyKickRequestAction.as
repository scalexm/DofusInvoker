package com.ankamagames.dofus.logic.game.common.actions.party
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class PartyKickRequestAction implements Action
   {
       
      
      public var playerId:Number;
      
      public var partyId:int;
      
      public function PartyKickRequestAction()
      {
         super();
      }
      
      public static function create(partyId:int, playerId:Number) : PartyKickRequestAction
      {
         var a:PartyKickRequestAction = new PartyKickRequestAction();
         a.partyId = partyId;
         a.playerId = playerId;
         return a;
      }
   }
}
