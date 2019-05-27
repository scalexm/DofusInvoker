package com.ankamagames.dofus.logic.game.common.actions.craft
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class ExchangeCraftPaymentModificationAction implements Action
   {
       
      
      public var kamas:Number = 0;
      
      public function ExchangeCraftPaymentModificationAction()
      {
         super();
      }
      
      public static function create(pKamas:Number) : ExchangeCraftPaymentModificationAction
      {
         var action:ExchangeCraftPaymentModificationAction = new ExchangeCraftPaymentModificationAction();
         action.kamas = pKamas;
         return action;
      }
   }
}
