package com.ankamagames.dofus.logic.game.common.actions.exchange
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class ExchangeObjectTransfertListToInvAction implements Action
   {
       
      
      public var ids:Vector.<uint>;
      
      public function ExchangeObjectTransfertListToInvAction()
      {
         super();
      }
      
      public static function create(pIds:Vector.<uint>) : ExchangeObjectTransfertListToInvAction
      {
         var a:ExchangeObjectTransfertListToInvAction = new ExchangeObjectTransfertListToInvAction();
         a.ids = pIds;
         return a;
      }
   }
}
