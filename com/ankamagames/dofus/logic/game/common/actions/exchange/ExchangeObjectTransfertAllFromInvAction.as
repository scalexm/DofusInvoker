package com.ankamagames.dofus.logic.game.common.actions.exchange
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class ExchangeObjectTransfertAllFromInvAction implements Action
   {
       
      
      public function ExchangeObjectTransfertAllFromInvAction()
      {
         super();
      }
      
      public static function create() : ExchangeObjectTransfertAllFromInvAction
      {
         return new ExchangeObjectTransfertAllFromInvAction();
      }
   }
}
