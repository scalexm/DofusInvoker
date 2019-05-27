package com.ankamagames.dofus.logic.game.common.actions.exchange
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class ExchangeReadyCrushAction implements Action
   {
       
      
      public var isReady:Boolean;
      
      public var focusActionId:uint;
      
      public function ExchangeReadyCrushAction()
      {
         super();
      }
      
      public static function create(pIsReady:Boolean, pFocusActionId:uint) : ExchangeReadyCrushAction
      {
         var a:ExchangeReadyCrushAction = new ExchangeReadyCrushAction();
         a.isReady = pIsReady;
         a.focusActionId = pFocusActionId;
         return a;
      }
   }
}
