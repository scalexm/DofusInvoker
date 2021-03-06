package com.ankamagames.dofus.logic.game.common.actions.exchange
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class ExchangeObjectModifyPricedAction implements Action
   {
       
      
      public var objectUID:uint;
      
      public var quantity:int;
      
      public var price:Number = 0;
      
      public function ExchangeObjectModifyPricedAction()
      {
         super();
      }
      
      public static function create(pObjectUID:uint, pQuantity:int, pPrice:Number) : ExchangeObjectModifyPricedAction
      {
         var a:ExchangeObjectModifyPricedAction = new ExchangeObjectModifyPricedAction();
         a.objectUID = pObjectUID;
         a.quantity = pQuantity;
         a.price = pPrice;
         return a;
      }
   }
}
