package com.ankamagames.dofus.network.messages.game.dare
{
   import com.ankamagames.dofus.network.types.game.dare.DareVersatileInformations;
   import com.ankamagames.jerakine.network.CustomDataWrapper;
   import com.ankamagames.jerakine.network.ICustomDataInput;
   import com.ankamagames.jerakine.network.ICustomDataOutput;
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import com.ankamagames.jerakine.network.utils.FuncTree;
   import flash.utils.ByteArray;
   
   [Trusted]
   public class DareVersatileListMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 6657;
       
      
      private var _isInitialized:Boolean = false;
      
      public var dares:Vector.<DareVersatileInformations>;
      
      private var _darestree:FuncTree;
      
      public function DareVersatileListMessage()
      {
         this.dares = new Vector.<DareVersatileInformations>();
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 6657;
      }
      
      public function initDareVersatileListMessage(dares:Vector.<DareVersatileInformations> = null) : DareVersatileListMessage
      {
         this.dares = dares;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.dares = new Vector.<DareVersatileInformations>();
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
         this.serializeAs_DareVersatileListMessage(output);
      }
      
      public function serializeAs_DareVersatileListMessage(output:ICustomDataOutput) : void
      {
         output.writeShort(this.dares.length);
         for(var _i1:uint = 0; _i1 < this.dares.length; _i1++)
         {
            (this.dares[_i1] as DareVersatileInformations).serializeAs_DareVersatileInformations(output);
         }
      }
      
      public function deserialize(input:ICustomDataInput) : void
      {
         this.deserializeAs_DareVersatileListMessage(input);
      }
      
      public function deserializeAs_DareVersatileListMessage(input:ICustomDataInput) : void
      {
         var _item1:DareVersatileInformations = null;
         var _daresLen:uint = input.readUnsignedShort();
         for(var _i1:uint = 0; _i1 < _daresLen; _i1++)
         {
            _item1 = new DareVersatileInformations();
            _item1.deserialize(input);
            this.dares.push(_item1);
         }
      }
      
      public function deserializeAsync(tree:FuncTree) : void
      {
         this.deserializeAsyncAs_DareVersatileListMessage(tree);
      }
      
      public function deserializeAsyncAs_DareVersatileListMessage(tree:FuncTree) : void
      {
         this._darestree = tree.addChild(this._darestreeFunc);
      }
      
      private function _darestreeFunc(input:ICustomDataInput) : void
      {
         var length:uint = input.readUnsignedShort();
         for(var i:uint = 0; i < length; i++)
         {
            this._darestree.addChild(this._daresFunc);
         }
      }
      
      private function _daresFunc(input:ICustomDataInput) : void
      {
         var _item:DareVersatileInformations = new DareVersatileInformations();
         _item.deserialize(input);
         this.dares.push(_item);
      }
   }
}
