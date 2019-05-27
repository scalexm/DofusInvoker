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
   public class DareRewardsListMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 6677;
       
      
      private var _isInitialized:Boolean = false;
      
      public var rewards:Vector.<DareReward>;
      
      private var _rewardstree:FuncTree;
      
      public function DareRewardsListMessage()
      {
         this.rewards = new Vector.<DareReward>();
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 6677;
      }
      
      public function initDareRewardsListMessage(rewards:Vector.<DareReward> = null) : DareRewardsListMessage
      {
         this.rewards = rewards;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.rewards = new Vector.<DareReward>();
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
         this.serializeAs_DareRewardsListMessage(output);
      }
      
      public function serializeAs_DareRewardsListMessage(output:ICustomDataOutput) : void
      {
         output.writeShort(this.rewards.length);
         for(var _i1:uint = 0; _i1 < this.rewards.length; _i1++)
         {
            (this.rewards[_i1] as DareReward).serializeAs_DareReward(output);
         }
      }
      
      public function deserialize(input:ICustomDataInput) : void
      {
         this.deserializeAs_DareRewardsListMessage(input);
      }
      
      public function deserializeAs_DareRewardsListMessage(input:ICustomDataInput) : void
      {
         var _item1:DareReward = null;
         var _rewardsLen:uint = input.readUnsignedShort();
         for(var _i1:uint = 0; _i1 < _rewardsLen; _i1++)
         {
            _item1 = new DareReward();
            _item1.deserialize(input);
            this.rewards.push(_item1);
         }
      }
      
      public function deserializeAsync(tree:FuncTree) : void
      {
         this.deserializeAsyncAs_DareRewardsListMessage(tree);
      }
      
      public function deserializeAsyncAs_DareRewardsListMessage(tree:FuncTree) : void
      {
         this._rewardstree = tree.addChild(this._rewardstreeFunc);
      }
      
      private function _rewardstreeFunc(input:ICustomDataInput) : void
      {
         var length:uint = input.readUnsignedShort();
         for(var i:uint = 0; i < length; i++)
         {
            this._rewardstree.addChild(this._rewardsFunc);
         }
      }
      
      private function _rewardsFunc(input:ICustomDataInput) : void
      {
         var _item:DareReward = new DareReward();
         _item.deserialize(input);
         this.rewards.push(_item);
      }
   }
}
