package com.ankamagames.dofus.logic.game.common.actions
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class HouseSellAction implements Action
   {
       
      
      public var instanceId:int = 0;
      
      public var amount:Number = 0;
      
      public var forSale:Boolean;
      
      public function HouseSellAction()
      {
         super();
      }
      
      public static function create(instanceId:int, amount:Number, forSale:Boolean = true) : HouseSellAction
      {
         var action:HouseSellAction = new HouseSellAction();
         action.instanceId = instanceId;
         action.amount = amount;
         action.forSale = forSale;
         return action;
      }
   }
}
