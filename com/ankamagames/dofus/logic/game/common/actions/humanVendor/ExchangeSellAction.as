package com.ankamagames.dofus.logic.game.common.actions.humanVendor
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class ExchangeSellAction implements Action
   {
       
      
      public var objectUID:uint;
      
      public var quantity:uint;
      
      public function ExchangeSellAction()
      {
         super();
      }
      
      public static function create(pObjectUID:uint, pQuantity:uint) : ExchangeSellAction
      {
         var a:ExchangeSellAction = new ExchangeSellAction();
         a.objectUID = pObjectUID;
         a.quantity = pQuantity;
         return a;
      }
   }
}
