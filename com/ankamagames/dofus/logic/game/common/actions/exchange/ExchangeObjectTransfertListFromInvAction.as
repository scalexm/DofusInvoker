package com.ankamagames.dofus.logic.game.common.actions.exchange
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class ExchangeObjectTransfertListFromInvAction implements Action
   {
       
      
      public var ids:Vector.<uint>;
      
      public function ExchangeObjectTransfertListFromInvAction()
      {
         super();
      }
      
      public static function create(pIds:Vector.<uint>) : ExchangeObjectTransfertListFromInvAction
      {
         var a:ExchangeObjectTransfertListFromInvAction = new ExchangeObjectTransfertListFromInvAction();
         a.ids = pIds;
         return a;
      }
   }
}
