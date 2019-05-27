package com.ankamagames.dofus.logic.game.common.actions.mount
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class PaddockSellRequestAction implements Action
   {
       
      
      public var price:Number = 0;
      
      public var forSale:Boolean;
      
      public function PaddockSellRequestAction()
      {
         super();
      }
      
      public static function create(price:Number, forSale:Boolean = true) : PaddockSellRequestAction
      {
         var o:PaddockSellRequestAction = new PaddockSellRequestAction();
         o.price = price;
         o.forSale = forSale;
         return o;
      }
   }
}
