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
   public class DareCreatedListMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 6663;
       
      
      private var _isInitialized:Boolean = false;
      
      public var daresFixedInfos:Vector.<DareInformations>;
      
      public var daresVersatilesInfos:Vector.<DareVersatileInformations>;
      
      private var _daresFixedInfostree:FuncTree;
      
      private var _daresVersatilesInfostree:FuncTree;
      
      public function DareCreatedListMessage()
      {
         this.daresFixedInfos = new Vector.<DareInformations>();
         this.daresVersatilesInfos = new Vector.<DareVersatileInformations>();
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 6663;
      }
      
      public function initDareCreatedListMessage(daresFixedInfos:Vector.<DareInformations> = null, daresVersatilesInfos:Vector.<DareVersatileInformations> = null) : DareCreatedListMessage
      {
         this.daresFixedInfos = daresFixedInfos;
         this.daresVersatilesInfos = daresVersatilesInfos;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.daresFixedInfos = new Vector.<DareInformations>();
         this.daresVersatilesInfos = new Vector.<DareVersatileInformations>();
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
         this.serializeAs_DareCreatedListMessage(output);
      }
      
      public function serializeAs_DareCreatedListMessage(output:ICustomDataOutput) : void
      {
         output.writeShort(this.daresFixedInfos.length);
         for(var _i1:uint = 0; _i1 < this.daresFixedInfos.length; _i1++)
         {
            (this.daresFixedInfos[_i1] as DareInformations).serializeAs_DareInformations(output);
         }
         output.writeShort(this.daresVersatilesInfos.length);
         for(var _i2:uint = 0; _i2 < this.daresVersatilesInfos.length; _i2++)
         {
            (this.daresVersatilesInfos[_i2] as DareVersatileInformations).serializeAs_DareVersatileInformations(output);
         }
      }
      
      public function deserialize(input:ICustomDataInput) : void
      {
         this.deserializeAs_DareCreatedListMessage(input);
      }
      
      public function deserializeAs_DareCreatedListMessage(input:ICustomDataInput) : void
      {
         var _item1:DareInformations = null;
         var _item2:DareVersatileInformations = null;
         var _daresFixedInfosLen:uint = input.readUnsignedShort();
         for(var _i1:uint = 0; _i1 < _daresFixedInfosLen; _i1++)
         {
            _item1 = new DareInformations();
            _item1.deserialize(input);
            this.daresFixedInfos.push(_item1);
         }
         var _daresVersatilesInfosLen:uint = input.readUnsignedShort();
         for(var _i2:uint = 0; _i2 < _daresVersatilesInfosLen; _i2++)
         {
            _item2 = new DareVersatileInformations();
            _item2.deserialize(input);
            this.daresVersatilesInfos.push(_item2);
         }
      }
      
      public function deserializeAsync(tree:FuncTree) : void
      {
         this.deserializeAsyncAs_DareCreatedListMessage(tree);
      }
      
      public function deserializeAsyncAs_DareCreatedListMessage(tree:FuncTree) : void
      {
         this._daresFixedInfostree = tree.addChild(this._daresFixedInfostreeFunc);
         this._daresVersatilesInfostree = tree.addChild(this._daresVersatilesInfostreeFunc);
      }
      
      private function _daresFixedInfostreeFunc(input:ICustomDataInput) : void
      {
         var length:uint = input.readUnsignedShort();
         for(var i:uint = 0; i < length; i++)
         {
            this._daresFixedInfostree.addChild(this._daresFixedInfosFunc);
         }
      }
      
      private function _daresFixedInfosFunc(input:ICustomDataInput) : void
      {
         var _item:DareInformations = new DareInformations();
         _item.deserialize(input);
         this.daresFixedInfos.push(_item);
      }
      
      private function _daresVersatilesInfostreeFunc(input:ICustomDataInput) : void
      {
         var length:uint = input.readUnsignedShort();
         for(var i:uint = 0; i < length; i++)
         {
            this._daresVersatilesInfostree.addChild(this._daresVersatilesInfosFunc);
         }
      }
      
      private function _daresVersatilesInfosFunc(input:ICustomDataInput) : void
      {
         var _item:DareVersatileInformations = new DareVersatileInformations();
         _item.deserialize(input);
         this.daresVersatilesInfos.push(_item);
      }
   }
}
