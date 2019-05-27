package com.ankamagames.dofus.network.messages.game.inventory.exchanges
{
   import com.ankamagames.jerakine.network.CustomDataWrapper;
   import com.ankamagames.jerakine.network.ICustomDataInput;
   import com.ankamagames.jerakine.network.ICustomDataOutput;
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import com.ankamagames.jerakine.network.utils.FuncTree;
   import flash.utils.ByteArray;
   
   [Trusted]
   public class ExchangeTypesExchangerDescriptionForUserMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 5765;
       
      
      private var _isInitialized:Boolean = false;
      
      public var typeDescription:Vector.<uint>;
      
      private var _typeDescriptiontree:FuncTree;
      
      public function ExchangeTypesExchangerDescriptionForUserMessage()
      {
         this.typeDescription = new Vector.<uint>();
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 5765;
      }
      
      public function initExchangeTypesExchangerDescriptionForUserMessage(typeDescription:Vector.<uint> = null) : ExchangeTypesExchangerDescriptionForUserMessage
      {
         this.typeDescription = typeDescription;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.typeDescription = new Vector.<uint>();
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
         this.serializeAs_ExchangeTypesExchangerDescriptionForUserMessage(output);
      }
      
      public function serializeAs_ExchangeTypesExchangerDescriptionForUserMessage(output:ICustomDataOutput) : void
      {
         output.writeShort(this.typeDescription.length);
         for(var _i1:uint = 0; _i1 < this.typeDescription.length; _i1++)
         {
            if(this.typeDescription[_i1] < 0)
            {
               throw new Error("Forbidden value (" + this.typeDescription[_i1] + ") on element 1 (starting at 1) of typeDescription.");
            }
            output.writeVarInt(this.typeDescription[_i1]);
         }
      }
      
      public function deserialize(input:ICustomDataInput) : void
      {
         this.deserializeAs_ExchangeTypesExchangerDescriptionForUserMessage(input);
      }
      
      public function deserializeAs_ExchangeTypesExchangerDescriptionForUserMessage(input:ICustomDataInput) : void
      {
         var _val1:uint = 0;
         var _typeDescriptionLen:uint = input.readUnsignedShort();
         for(var _i1:uint = 0; _i1 < _typeDescriptionLen; _i1++)
         {
            _val1 = input.readVarUhInt();
            if(_val1 < 0)
            {
               throw new Error("Forbidden value (" + _val1 + ") on elements of typeDescription.");
            }
            this.typeDescription.push(_val1);
         }
      }
      
      public function deserializeAsync(tree:FuncTree) : void
      {
         this.deserializeAsyncAs_ExchangeTypesExchangerDescriptionForUserMessage(tree);
      }
      
      public function deserializeAsyncAs_ExchangeTypesExchangerDescriptionForUserMessage(tree:FuncTree) : void
      {
         this._typeDescriptiontree = tree.addChild(this._typeDescriptiontreeFunc);
      }
      
      private function _typeDescriptiontreeFunc(input:ICustomDataInput) : void
      {
         var length:uint = input.readUnsignedShort();
         for(var i:uint = 0; i < length; i++)
         {
            this._typeDescriptiontree.addChild(this._typeDescriptionFunc);
         }
      }
      
      private function _typeDescriptionFunc(input:ICustomDataInput) : void
      {
         var _val:uint = input.readVarUhInt();
         if(_val < 0)
         {
            throw new Error("Forbidden value (" + _val + ") on elements of typeDescription.");
         }
         this.typeDescription.push(_val);
      }
   }
}
