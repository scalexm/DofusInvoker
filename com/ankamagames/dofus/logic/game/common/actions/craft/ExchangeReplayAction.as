package com.ankamagames.dofus.logic.game.common.actions.craft
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class ExchangeReplayAction implements Action
   {
       
      
      public var count:int;
      
      public function ExchangeReplayAction()
      {
         super();
      }
      
      public static function create(pCount:int) : ExchangeReplayAction
      {
         var action:ExchangeReplayAction = new ExchangeReplayAction();
         action.count = pCount;
         return action;
      }
   }
}
