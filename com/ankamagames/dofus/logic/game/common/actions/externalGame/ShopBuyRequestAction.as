package com.ankamagames.dofus.logic.game.common.actions.externalGame
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class ShopBuyRequestAction implements Action
   {
       
      
      public var articleId:int;
      
      public var quantity:int;
      
      public var currencyId:int;
      
      public function ShopBuyRequestAction()
      {
         super();
      }
      
      public static function create(articleId:int, quantity:int, currencyId:int) : ShopBuyRequestAction
      {
         var action:ShopBuyRequestAction = new ShopBuyRequestAction();
         action.articleId = articleId;
         action.quantity = quantity;
         action.currencyId = currencyId;
         return action;
      }
   }
}
