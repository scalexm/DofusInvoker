package com.ankamagames.dofus.network.messages.game.dare
{
   import com.ankamagames.dofus.network.types.game.dare.DareReward;
   import com.ankamagames.jerakine.network.CustomDataWrapper;
   import com.ankamagames.jerakine.network.ICustomDataInput;
   import com.ankamagames.jerakine.network.ICustomDataOutput;
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import com.ankamagames.jerakine.network.utils.FuncTree;
   import flash.utils.ByteArray;
   
   [Trusted]
   public class DareRewardWonMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 6678;
       
      
      private var _isInitialized:Boolean = false;
      
      public var reward:DareReward;
      
      private var _rewardtree:FuncTree;
      
      public function DareRewardWonMessage()
      {
         this.reward = new DareReward();
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 6678;
      }
      
      public function initDareRewardWonMessage(reward:DareReward = null) : DareRewardWonMessage
      {
         this.reward = reward;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.reward = new DareReward();
         this._isInitialized = false;
      }
      
      override public function pack(output:ICustomDataOutput) : void
      {
         var data:ByteArray = new ByteArray();
         this.serialize(new CustomDataWrapper(data));
         writePacket(output,this.getMessageId(),data);
      }
      
      override public function unpack(input:ICustomDataInput, length:uint) : void
      {
         this.deserialize(input);
      }
      
      override public function unpackAsync(input:ICustomDataInput, length:uint) : FuncTree
      {
         var tree:FuncTree = new FuncTree();
         tree.setRoot(input);
         this.deserializeAsync(tree);
         return tree;
      }
      
      public function serialize(output:ICustomDataOutput) : void
      {
         this.serializeAs_DareRewardWonMessage(output);
      }
      
      public function serializeAs_DareRewardWonMessage(output:ICustomDataOutput) : void
      {
         this.reward.serializeAs_DareReward(output);
      }
      
      public function deserialize(input:ICustomDataInput) : void
      {
         this.deserializeAs_DareRewardWonMessage(input);
      }
      
      public function deserializeAs_DareRewardWonMessage(input:ICustomDataInput) : void
      {
         this.reward = new DareReward();
         this.reward.deserialize(input);
      }
      
      public function deserializeAsync(tree:FuncTree) : void
      {
         this.deserializeAsyncAs_DareRewardWonMessage(tree);
      }
      
      public function deserializeAsyncAs_DareRewardWonMessage(tree:FuncTree) : void
      {
         this._rewardtree = tree.addChild(this._rewardtreeFunc);
      }
      
      private function _rewardtreeFunc(input:ICustomDataInput) : void
      {
         this.reward = new DareReward();
         this.reward.deserializeAsync(this._rewardtree);
      }
   }
}
