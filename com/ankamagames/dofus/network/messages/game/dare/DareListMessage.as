package com.ankamagames.dofus.network.messages.game.dare
{
   import com.ankamagames.dofus.network.types.game.dare.DareInformations;
   import com.ankamagames.jerakine.network.CustomDataWrapper;
   import com.ankamagames.jerakine.network.ICustomDataInput;
   import com.ankamagames.jerakine.network.ICustomDataOutput;
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import com.ankamagames.jerakine.network.utils.FuncTree;
   import flash.utils.ByteArray;
   
   [Trusted]
   public class DareListMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 6661;
       
      
      private var _isInitialized:Boolean = false;
      
      public var dares:Vector.<DareInformations>;
      
      private var _darestree:FuncTree;
      
      public function DareListMessage()
      {
         this.dares = new Vector.<DareInformations>();
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 6661;
      }
      
      public function initDareListMessage(dares:Vector.<DareInformations> = null) : DareListMessage
      {
         this.dares = dares;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.dares = new Vector.<DareInformations>();
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
         this.serializeAs_DareListMessage(output);
      }
      
      public function serializeAs_DareListMessage(output:ICustomDataOutput) : void
      {
         output.writeShort(this.dares.length);
         for(var _i1:uint = 0; _i1 < this.dares.length; _i1++)
         {
            (this.dares[_i1] as DareInformations).serializeAs_DareInformations(output);
         }
      }
      
      public function deserialize(input:ICustomDataInput) : void
      {
         this.deserializeAs_DareListMessage(input);
      }
      
      public function deserializeAs_DareListMessage(input:ICustomDataInput) : void
      {
         var _item1:DareInformations = null;
         var _daresLen:uint = input.readUnsignedShort();
         for(var _i1:uint = 0; _i1 < _daresLen; _i1++)
         {
            _item1 = new DareInformations();
            _item1.deserialize(input);
            this.dares.push(_item1);
         }
      }
      
      public function deserializeAsync(tree:FuncTree) : void
      {
         this.deserializeAsyncAs_DareListMessage(tree);
      }
      
      public function deserializeAsyncAs_DareListMessage(tree:FuncTree) : void
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
         var _item:DareInformations = new DareInformations();
         _item.deserialize(input);
         this.dares.push(_item);
      }
   }
}
