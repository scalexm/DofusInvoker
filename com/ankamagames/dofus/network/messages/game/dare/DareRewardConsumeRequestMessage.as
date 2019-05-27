package com.ankamagames.dofus.network.messages.game.dare
{
   import com.ankamagames.jerakine.network.CustomDataWrapper;
   import com.ankamagames.jerakine.network.ICustomDataInput;
   import com.ankamagames.jerakine.network.ICustomDataOutput;
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import com.ankamagames.jerakine.network.utils.FuncTree;
   import flash.utils.ByteArray;
   
   [Trusted]
   public class DareRewardConsumeRequestMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 6676;
       
      
      private var _isInitialized:Boolean = false;
      
      public var dareId:Number = 0;
      
      public var type:uint = 0;
      
      public function DareRewardConsumeRequestMessage()
      {
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 6676;
      }
      
      public function initDareRewardConsumeRequestMessage(dareId:Number = 0, type:uint = 0) : DareRewardConsumeRequestMessage
      {
         this.dareId = dareId;
         this.type = type;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.dareId = 0;
         this.type = 0;
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
         this.serializeAs_DareRewardConsumeRequestMessage(output);
      }
      
      public function serializeAs_DareRewardConsumeRequestMessage(output:ICustomDataOutput) : void
      {
         if(this.dareId < -9007199254740990 || this.dareId > 9007199254740990)
         {
            throw new Error("Forbidden value (" + this.dareId + ") on element dareId.");
         }
         output.writeDouble(this.dareId);
         output.writeByte(this.type);
      }
      
      public function deserialize(input:ICustomDataInput) : void
      {
         this.deserializeAs_DareRewardConsumeRequestMessage(input);
      }
      
      public function deserializeAs_DareRewardConsumeRequestMessage(input:ICustomDataInput) : void
      {
         this._dareIdFunc(input);
         this._typeFunc(input);
      }
      
      public function deserializeAsync(tree:FuncTree) : void
      {
         this.deserializeAsyncAs_DareRewardConsumeRequestMessage(tree);
      }
      
      public function deserializeAsyncAs_DareRewardConsumeRequestMessage(tree:FuncTree) : void
      {
         tree.addChild(this._dareIdFunc);
         tree.addChild(this._typeFunc);
      }
      
      private function _dareIdFunc(input:ICustomDataInput) : void
      {
         this.dareId = input.readDouble();
         if(this.dareId < -9007199254740990 || this.dareId > 9007199254740990)
         {
            throw new Error("Forbidden value (" + this.dareId + ") on element of DareRewardConsumeRequestMessage.dareId.");
         }
      }
      
      private function _typeFunc(input:ICustomDataInput) : void
      {
         this.type = input.readByte();
         if(this.type < 0)
         {
            throw new Error("Forbidden value (" + this.type + ") on element of DareRewardConsumeRequestMessage.type.");
         }
      }
   }
}
