package com.ankamagames.dofus.network.messages.game.inventory.exchanges
{
   import com.ankamagames.dofus.network.types.game.data.items.BidExchangerObjectInfo;
   import com.ankamagames.jerakine.network.CustomDataWrapper;
   import com.ankamagames.jerakine.network.ICustomDataInput;
   import com.ankamagames.jerakine.network.ICustomDataOutput;
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import com.ankamagames.jerakine.network.utils.FuncTree;
   import flash.utils.ByteArray;
   
   [Trusted]
   public class ExchangeTypesItemsExchangerDescriptionForUserMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 5752;
       
      
      private var _isInitialized:Boolean = false;
      
      public var itemTypeDescriptions:Vector.<BidExchangerObjectInfo>;
      
      private var _itemTypeDescriptionstree:FuncTree;
      
      public function ExchangeTypesItemsExchangerDescriptionForUserMessage()
      {
         this.itemTypeDescriptions = new Vector.<BidExchangerObjectInfo>();
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 5752;
      }
      
      public function initExchangeTypesItemsExchangerDescriptionForUserMessage(itemTypeDescriptions:Vector.<BidExchangerObjectInfo> = null) : ExchangeTypesItemsExchangerDescriptionForUserMessage
      {
         this.itemTypeDescriptions = itemTypeDescriptions;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.itemTypeDescriptions = new Vector.<BidExchangerObjectInfo>();
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
         this.serializeAs_ExchangeTypesItemsExchangerDescriptionForUserMessage(output);
      }
      
      public function serializeAs_ExchangeTypesItemsExchangerDescriptionForUserMessage(output:ICustomDataOutput) : void
      {
         output.writeShort(this.itemTypeDescriptions.length);
         for(var _i1:uint = 0; _i1 < this.itemTypeDescriptions.length; _i1++)
         {
            (this.itemTypeDescriptions[_i1] as BidExchangerObjectInfo).serializeAs_BidExchangerObjectInfo(output);
         }
      }
      
      public function deserialize(input:ICustomDataInput) : void
      {
         this.deserializeAs_ExchangeTypesItemsExchangerDescriptionForUserMessage(input);
      }
      
      public function deserializeAs_ExchangeTypesItemsExchangerDescriptionForUserMessage(input:ICustomDataInput) : void
      {
         var _item1:BidExchangerObjectInfo = null;
         var _itemTypeDescriptionsLen:uint = input.readUnsignedShort();
         for(var _i1:uint = 0; _i1 < _itemTypeDescriptionsLen; _i1++)
         {
            _item1 = new BidExchangerObjectInfo();
            _item1.deserialize(input);
            this.itemTypeDescriptions.push(_item1);
         }
      }
      
      public function deserializeAsync(tree:FuncTree) : void
      {
         this.deserializeAsyncAs_ExchangeTypesItemsExchangerDescriptionForUserMessage(tree);
      }
      
      public function deserializeAsyncAs_ExchangeTypesItemsExchangerDescriptionForUserMessage(tree:FuncTree) : void
      {
         this._itemTypeDescriptionstree = tree.addChild(this._itemTypeDescriptionstreeFunc);
      }
      
      private function _itemTypeDescriptionstreeFunc(input:ICustomDataInput) : void
      {
         var length:uint = input.readUnsignedShort();
         for(var i:uint = 0; i < length; i++)
         {
            this._itemTypeDescriptionstree.addChild(this._itemTypeDescriptionsFunc);
         }
      }
      
      private function _itemTypeDescriptionsFunc(input:ICustomDataInput) : void
      {
         var _item:BidExchangerObjectInfo = new BidExchangerObjectInfo();
         _item.deserialize(input);
         this.itemTypeDescriptions.push(_item);
      }
   }
}
