package com.ankamagames.dofus.logic.game.common.actions.breach
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class BreachRewardBuyAction implements Action
   {
       
      
      public var id:uint;
      
      public function BreachRewardBuyAction()
      {
         super();
      }
      
      public static function create(rewardId:uint) : BreachRewardBuyAction
      {
         var a:BreachRewardBuyAction = new BreachRewardBuyAction();
         a.id = rewardId;
         return a;
      }
   }
}
