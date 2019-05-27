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
   public class DareSubscribeRequestMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 6666;
       
      
      private var _isInitialized:Boolean = false;
      
      public var dareId:Number = 0;
      
      public var subscribe:Boolean = false;
      
      public function DareSubscribeRequestMessage()
      {
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 6666;
      }
      
      public function initDareSubscribeRequestMessage(dareId:Number = 0, subscribe:Boolean = false) : DareSubscribeRequestMessage
      {
         this.dareId = dareId;
         this.subscribe = subscribe;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.dareId = 0;
         this.subscribe = false;
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
         this.serializeAs_DareSubscribeRequestMessage(output);
      }
      
      public function serializeAs_DareSubscribeRequestMessage(output:ICustomDataOutput) : void
      {
         if(this.dareId < 0 || this.dareId > 9007199254740990)
         {
            throw new Error("Forbidden value (" + this.dareId + ") on element dareId.");
         }
         output.writeDouble(this.dareId);
         output.writeBoolean(this.subscribe);
      }
      
      public function deserialize(input:ICustomDataInput) : void
      {
         this.deserializeAs_DareSubscribeRequestMessage(input);
      }
      
      public function deserializeAs_DareSubscribeRequestMessage(input:ICustomDataInput) : void
      {
         this._dareIdFunc(input);
         this._subscribeFunc(input);
      }
      
      public function deserializeAsync(tree:FuncTree) : void
      {
         this.deserializeAsyncAs_DareSubscribeRequestMessage(tree);
      }
      
      public function deserializeAsyncAs_DareSubscribeRequestMessage(tree:FuncTree) : void
      {
         tree.addChild(this._dareIdFunc);
         tree.addChild(this._subscribeFunc);
      }
      
      private function _dareIdFunc(input:ICustomDataInput) : void
      {
         this.dareId = input.readDouble();
         if(this.dareId < 0 || this.dareId > 9007199254740990)
         {
            throw new Error("Forbidden value (" + this.dareId + ") on element of DareSubscribeRequestMessage.dareId.");
         }
      }
      
      private function _subscribeFunc(input:ICustomDataInput) : void
      {
         this.subscribe = input.readBoolean();
      }
   }
}
