package com.ankamagames.dofus.uiApi
{
   import com.ankamagames.berilia.interfaces.IApi;
   import com.ankamagames.berilia.types.data.UiModule;
   import com.ankamagames.dofus.breach.BreachRewardWrapper;
   import com.ankamagames.dofus.datacenter.misc.BreachPrize;
   import com.ankamagames.dofus.internalDatacenter.people.PartyMemberWrapper;
   import com.ankamagames.dofus.kernel.Kernel;
   import com.ankamagames.dofus.logic.game.common.frames.BreachFrame;
   import com.ankamagames.dofus.logic.game.common.frames.PartyManagementFrame;
   import com.ankamagames.dofus.logic.game.common.managers.PlayedCharacterManager;
   import com.ankamagames.jerakine.logger.Log;
   import com.ankamagames.jerakine.logger.Logger;
   import flash.utils.Dictionary;
   import flash.utils.getQualifiedClassName;
   
   [InstanciedApi]
   public class BreachApi implements IApi
   {
       
      
      private var _module:UiModule;
      
      protected var _log:Logger;
      
      public function BreachApi()
      {
         this._log = Log.getLogger(getQualifiedClassName(BreachApi));
         super();
      }
      
      [ApiData(name="module")]
      public function set module(value:UiModule) : void
      {
         this._module = value;
      }
      
      private function get breachFrame() : BreachFrame
      {
         return Kernel.getWorker().getFrame(BreachFrame) as BreachFrame;
      }
      
      [Trusted]
      public function destroy() : void
      {
         this._module = null;
      }
      
      [Trusted]
      public function getBudget() : uint
      {
         return this.breachFrame.budget;
      }
      
      [Trusted]
      public function getFloor() : uint
      {
         return this.breachFrame.floor;
      }
      
      [Trusted]
      public function getRoom() : uint
      {
         return this.breachFrame.room;
      }
      
      [Trusted]
      public function getOwnerId() : Number
      {
         return this.breachFrame.ownerId;
      }
      
      [Untrusted]
      public function getBranches() : Dictionary
      {
         return this.breachFrame.branches;
      }
      
      [Untrusted]
      public function getBreachPlayers() : Vector.<Number>
      {
         var breachFrame:BreachFrame = Kernel.getWorker().getFrame(BreachFrame) as BreachFrame;
         if(breachFrame)
         {
            return breachFrame.breachCharacterList;
         }
         return new Vector.<Number>();
      }
      
      [Untrusted]
      public function getBreachGroupPlayers() : Vector.<PartyMemberWrapper>
      {
         var partyMembers:Object = null;
         var player:Number = NaN;
         var partyPlayer:PartyMemberWrapper = null;
         var players:Vector.<Number> = new Vector.<Number>();
         var playersInPartyAndBreach:Vector.<PartyMemberWrapper> = new Vector.<PartyMemberWrapper>();
         var breachFrame:BreachFrame = Kernel.getWorker().getFrame(BreachFrame) as BreachFrame;
         if(breachFrame)
         {
            players = breachFrame.breachCharacterList;
         }
         var partyFrame:PartyManagementFrame = Kernel.getWorker().getFrame(PartyManagementFrame) as PartyManagementFrame;
         if(partyFrame)
         {
            partyMembers = partyFrame.partyMembers;
            for each(player in players)
            {
               for each(partyPlayer in partyMembers)
               {
                  if(player == partyPlayer.id)
                  {
                     playersInPartyAndBreach.push(partyPlayer);
                     break;
                  }
               }
            }
         }
         return playersInPartyAndBreach;
      }
      
      [Untrusted]
      public function isInBreach() : Boolean
      {
         return PlayedCharacterManager.getInstance().isInBreach;
      }
      
      [Untrusted]
      public function sortByCurrency(firstReward:BreachRewardWrapper, secondReward:BreachRewardWrapper) : Number
      {
         var firstRewardCurrency:int = BreachPrize.getBreachPrizeById(firstReward.id).currency;
         var secondRewardCurrency:int = BreachPrize.getBreachPrizeById(secondReward.id).currency;
         if(firstRewardCurrency > secondRewardCurrency)
         {
            return 1;
         }
         if(firstRewardCurrency < secondRewardCurrency)
         {
            return -1;
         }
         return 0;
      }
   }
}
