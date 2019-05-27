package com.ankamagames.dofus.breach
{
   import com.ankamagames.dofus.datacenter.items.criterion.GroupItemCriterion;
   import com.ankamagames.dofus.network.types.game.context.roleplay.breach.BreachReward;
   import com.ankamagames.jerakine.interfaces.IDataCenter;
   
   public class BreachRewardWrapper implements IDataCenter
   {
       
      
      public var id:uint = 0;
      
      public var buyLocks:Vector.<uint>;
      
      public var bought:Boolean = false;
      
      public var buyCriterion:GroupItemCriterion;
      
      public var price:uint = 0;
      
      public function BreachRewardWrapper(breachReward:BreachReward)
      {
         this.buyLocks = new Vector.<uint>();
         super();
         this.id = breachReward.id;
         this.buyLocks = breachReward.buyLocks;
         this.bought = breachReward.bought;
         this.price = breachReward.price;
         this.buyCriterion = new GroupItemCriterion(breachReward.buyCriterion);
      }
   }
}
