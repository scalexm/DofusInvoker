package com.ankamagames.dofus.logic.game.common.actions.exchange
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class ExchangeObjectMoveKamaAction implements Action
   {
       
      
      public var kamas:Number = 0;
      
      public function ExchangeObjectMoveKamaAction()
      {
         super();
      }
      
      public static function create(pKamas:Number) : ExchangeObjectMoveKamaAction
      {
         var a:ExchangeObjectMoveKamaAction = new ExchangeObjectMoveKamaAction();
         a.kamas = pKamas;
         return a;
      }
   }
}
