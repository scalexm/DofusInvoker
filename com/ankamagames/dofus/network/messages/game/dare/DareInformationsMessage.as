package com.ankamagames.dofus.network.messages.game.dare
{
   import com.ankamagames.dofus.network.types.game.dare.DareInformations;
   import com.ankamagames.dofus.network.types.game.dare.DareVersatileInformations;
   import com.ankamagames.jerakine.network.CustomDataWrapper;
   import com.ankamagames.jerakine.network.ICustomDataInput;
   import com.ankamagames.jerakine.network.ICustomDataOutput;
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import com.ankamagames.jerakine.network.utils.FuncTree;
   import flash.utils.ByteArray;
   
   [Trusted]
   public class DareInformationsMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 6656;
       
      
      private var _isInitialized:Boolean = false;
      
      public var dareFixedInfos:DareInformations;
      
      public var dareVersatilesInfos:DareVersatileInformations;
      
      private var _dareFixedInfostree:FuncTree;
      
      private var _dareVersatilesInfostree:FuncTree;
      
      public function DareInformationsMessage()
      {
         this.dareFixedInfos = new DareInformations();
         this.dareVersatilesInfos = new DareVersatileInformations();
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 6656;
      }
      
      public function initDareInformationsMessage(dareFixedInfos:DareInformations = null, dareVersatilesInfos:DareVersatileInformations = null) : DareInformationsMessage
      {
         this.dareFixedInfos = dareFixedInfos;
         this.dareVersatilesInfos = dareVersatilesInfos;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.dareFixedInfos = new DareInformations();
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
         this.serializeAs_DareInformationsMessage(output);
      }
      
      public function serializeAs_DareInformationsMessage(output:ICustomDataOutput) : void
      {
         this.dareFixedInfos.serializeAs_DareInformations(output);
         this.dareVersatilesInfos.serializeAs_DareVersatileInformations(output);
      }
      
      public function deserialize(input:ICustomDataInput) : void
      {
         this.deserializeAs_DareInformationsMessage(input);
      }
      
      public function deserializeAs_DareInformationsMessage(input:ICustomDataInput) : void
      {
         this.dareFixedInfos = new DareInformations();
         this.dareFixedInfos.deserialize(input);
         this.dareVersatilesInfos = new DareVersatileInformations();
         this.dareVersatilesInfos.deserialize(input);
      }
      
      public function deserializeAsync(tree:FuncTree) : void
      {
         this.deserializeAsyncAs_DareInformationsMessage(tree);
      }
      
      public function deserializeAsyncAs_DareInformationsMessage(tree:FuncTree) : void
      {
         this._dareFixedInfostree = tree.addChild(this._dareFixedInfostreeFunc);
         this._dareVersatilesInfostree = tree.addChild(this._dareVersatilesInfostreeFunc);
      }
      
      private function _dareFixedInfostreeFunc(input:ICustomDataInput) : void
      {
         this.dareFixedInfos = new DareInformations();
         this.dareFixedInfos.deserializeAsync(this._dareFixedInfostree);
      }
      
      private function _dareVersatilesInfostreeFunc(input:ICustomDataInput) : void
      {
         this.dareVersatilesInfos = new DareVersatileInformations();
         this.dareVersatilesInfos.deserializeAsync(this._dareVersatilesInfostree);
      }
   }
}
