package com.ankamagames.dofus.logic.game.common.actions.craft
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class ExchangePlayerMultiCraftRequestAction implements Action
   {
       
      
      public var exchangeType:int;
      
      public var target:Number;
      
      public var skillId:uint;
      
      public function ExchangePlayerMultiCraftRequestAction()
      {
         super();
      }
      
      public static function create(pExchangeType:int, pTarget:Number, pSkillId:uint) : ExchangePlayerMultiCraftRequestAction
      {
         var action:ExchangePlayerMultiCraftRequestAction = new ExchangePlayerMultiCraftRequestAction();
         action.exchangeType = pExchangeType;
         action.target = pTarget;
         action.skillId = pSkillId;
         return action;
      }
   }
}
