package com.ankamagames.dofus.logic.game.common.actions.exchange
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class ExchangePlayerRequestAction implements Action
   {
       
      
      public var exchangeType:int;
      
      public var target:Number;
      
      public function ExchangePlayerRequestAction()
      {
         super();
      }
      
      public static function create(exchangeType:int, target:Number) : ExchangePlayerRequestAction
      {
         var a:ExchangePlayerRequestAction = new ExchangePlayerRequestAction();
         a.exchangeType = exchangeType;
         a.target = target;
         return a;
      }
   }
}
