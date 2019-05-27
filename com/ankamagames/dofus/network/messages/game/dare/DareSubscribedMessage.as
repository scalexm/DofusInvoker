package com.ankamagames.dofus.network.messages.game.dare
{
   import com.ankamagames.dofus.network.types.game.dare.DareVersatileInformations;
   import com.ankamagames.jerakine.network.CustomDataWrapper;
   import com.ankamagames.jerakine.network.ICustomDataInput;
   import com.ankamagames.jerakine.network.ICustomDataOutput;
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import com.ankamagames.jerakine.network.utils.BooleanByteWrapper;
   import com.ankamagames.jerakine.network.utils.FuncTree;
   import flash.utils.ByteArray;
   
   [Trusted]
   public class DareSubscribedMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 6660;
       
      
      private var _isInitialized:Boolean = false;
      
      public var dareId:Number = 0;
      
      public var success:Boolean = false;
      
      public var subscribe:Boolean = false;
      
      public var dareVersatilesInfos:DareVersatileInformations;
      
      private var _dareVersatilesInfostree:FuncTree;
      
      public function DareSubscribedMessage()
      {
         this.dareVersatilesInfos = new DareVersatileInformations();
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 6660;
      }
      
      public function initDareSubscribedMessage(dareId:Number = 0, success:Boolean = false, subscribe:Boolean = false, dareVersatilesInfos:DareVersatileInformations = null) : DareSubscribedMessage
      {
         this.dareId = dareId;
         this.success = success;
         this.subscribe = subscribe;
         this.dareVersatilesInfos = dareVersatilesInfos;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.dareId = 0;
         this.success = false;
         this.subscribe = false;
         this.dareVersatilesInfos = new DareVersatileInformations();
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
         this.serializeAs_DareSubscribedMessage(output);
      }
      
      public function serializeAs_DareSubscribedMessage(output:ICustomDataOutput) : void
      {
         var _box0:uint = 0;
         _box0 = BooleanByteWrapper.setFlag(_box0,0,this.success);
         _box0 = BooleanByteWrapper.setFlag(_box0,1,this.subscribe);
         output.writeByte(_box0);
         if(this.dareId < 0 || this.dareId > 9007199254740990)
         {
            throw new Error("Forbidden value (" + this.dareId + ") on element dareId.");
         }
         output.writeDouble(this.dareId);
         this.dareVersatilesInfos.serializeAs_DareVersatileInformations(output);
      }
      
      public function deserialize(input:ICustomDataInput) : void
      {
         this.deserializeAs_DareSubscribedMessage(input);
      }
      
      public function deserializeAs_DareSubscribedMessage(input:ICustomDataInput) : void
      {
         this.deserializeByteBoxes(input);
         this._dareIdFunc(input);
         this.dareVersatilesInfos = new DareVersatileInformations();
         this.dareVersatilesInfos.deserialize(input);
      }
      
      public function deserializeAsync(tree:FuncTree) : void
      {
         this.deserializeAsyncAs_DareSubscribedMessage(tree);
      }
      
      public function deserializeAsyncAs_DareSubscribedMessage(tree:FuncTree) : void
      {
         tree.addChild(this.deserializeByteBoxes);
         tree.addChild(this._dareIdFunc);
         this._dareVersatilesInfostree = tree.addChild(this._dareVersatilesInfostreeFunc);
      }
      
      private function deserializeByteBoxes(input:ICustomDataInput) : void
      {
         var _box0:uint = input.readByte();
         this.success = BooleanByteWrapper.getFlag(_box0,0);
         this.subscribe = BooleanByteWrapper.getFlag(_box0,1);
      }
      
      private function _dareIdFunc(input:ICustomDataInput) : void
      {
         this.dareId = input.readDouble();
         if(this.dareId < 0 || this.dareId > 9007199254740990)
         {
            throw new Error("Forbidden value (" + this.dareId + ") on element of DareSubscribedMessage.dareId.");
         }
      }
      
      private function _dareVersatilesInfostreeFunc(input:ICustomDataInput) : void
      {
         this.dareVersatilesInfos = new DareVersatileInformations();
         this.dareVersatilesInfos.deserializeAsync(this._dareVersatilesInfostree);
      }
   }
}
