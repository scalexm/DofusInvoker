package com.ankamagames.dofus.network.types.game.data.items
{
   import com.ankamagames.dofus.network.ProtocolTypeManager;
   import com.ankamagames.dofus.network.types.game.data.items.effects.ObjectEffect;
   import com.ankamagames.jerakine.network.ICustomDataInput;
   import com.ankamagames.jerakine.network.ICustomDataOutput;
   import com.ankamagames.jerakine.network.INetworkType;
   import com.ankamagames.jerakine.network.utils.FuncTree;
   
   public class BidExchangerObjectInfo implements INetworkType
   {
      
      public static const protocolId:uint = 122;
       
      
      public var objectUID:uint = 0;
      
      public var effects:Vector.<ObjectEffect>;
      
      public var prices:Vector.<Number>;
      
      private var _effectstree:FuncTree;
      
      private var _pricestree:FuncTree;
      
      public function BidExchangerObjectInfo()
      {
         this.effects = new Vector.<ObjectEffect>();
         this.prices = new Vector.<Number>();
         super();
      }
      
      public function getTypeId() : uint
      {
         return 122;
      }
      
      public function initBidExchangerObjectInfo(objectUID:uint = 0, effects:Vector.<ObjectEffect> = null, prices:Vector.<Number> = null) : BidExchangerObjectInfo
      {
         this.objectUID = objectUID;
         this.effects = effects;
         this.prices = prices;
         return this;
      }
      
      public function reset() : void
      {
         this.objectUID = 0;
         this.effects = new Vector.<ObjectEffect>();
         this.prices = new Vector.<Number>();
      }
      
      public function serialize(output:ICustomDataOutput) : void
      {
         this.serializeAs_BidExchangerObjectInfo(output);
      }
      
      public function serializeAs_BidExchangerObjectInfo(output:ICustomDataOutput) : void
      {
         if(this.objectUID < 0)
         {
            throw new Error("Forbidden value (" + this.objectUID + ") on element objectUID.");
         }
         output.writeVarInt(this.objectUID);
         output.writeShort(this.effects.length);
         for(var _i2:uint = 0; _i2 < this.effects.length; _i2++)
         {
            output.writeShort((this.effects[_i2] as ObjectEffect).getTypeId());
            (this.effects[_i2] as ObjectEffect).serialize(output);
         }
         output.writeShort(this.prices.length);
         for(var _i3:uint = 0; _i3 < this.prices.length; _i3++)
         {
            if(this.prices[_i3] < 0 || this.prices[_i3] > 9007199254740990)
            {
               throw new Error("Forbidden value (" + this.prices[_i3] + ") on element 3 (starting at 1) of prices.");
            }
            output.writeVarLong(this.prices[_i3]);
         }
      }
      
      public function deserialize(input:ICustomDataInput) : void
      {
         this.deserializeAs_BidExchangerObjectInfo(input);
      }
      
      public function deserializeAs_BidExchangerObjectInfo(input:ICustomDataInput) : void
      {
         var _id2:uint = 0;
         var _item2:ObjectEffect = null;
         var _val3:Number = NaN;
         this._objectUIDFunc(input);
         var _effectsLen:uint = input.readUnsignedShort();
         for(var _i2:uint = 0; _i2 < _effectsLen; _i2++)
         {
            _id2 = input.readUnsignedShort();
            _item2 = ProtocolTypeManager.getInstance(ObjectEffect,_id2);
            _item2.deserialize(input);
            this.effects.push(_item2);
         }
         var _pricesLen:uint = input.readUnsignedShort();
         for(var _i3:uint = 0; _i3 < _pricesLen; _i3++)
         {
            _val3 = input.readVarUhLong();
            if(_val3 < 0 || _val3 > 9007199254740990)
            {
               throw new Error("Forbidden value (" + _val3 + ") on elements of prices.");
            }
            this.prices.push(_val3);
         }
      }
      
      public function deserializeAsync(tree:FuncTree) : void
      {
         this.deserializeAsyncAs_BidExchangerObjectInfo(tree);
      }
      
      public function deserializeAsyncAs_BidExchangerObjectInfo(tree:FuncTree) : void
      {
         tree.addChild(this._objectUIDFunc);
         this._effectstree = tree.addChild(this._effectstreeFunc);
         this._pricestree = tree.addChild(this._pricestreeFunc);
      }
      
      private function _objectUIDFunc(input:ICustomDataInput) : void
      {
         this.objectUID = input.readVarUhInt();
         if(this.objectUID < 0)
         {
            throw new Error("Forbidden value (" + this.objectUID + ") on element of BidExchangerObjectInfo.objectUID.");
         }
      }
      
      private function _effectstreeFunc(input:ICustomDataInput) : void
      {
         var length:uint = input.readUnsignedShort();
         for(var i:uint = 0; i < length; i++)
         {
            this._effectstree.addChild(this._effectsFunc);
         }
      }
      
      private function _effectsFunc(input:ICustomDataInput) : void
      {
         var _id:uint = input.readUnsignedShort();
         var _item:ObjectEffect = ProtocolTypeManager.getInstance(ObjectEffect,_id);
         _item.deserialize(input);
         this.effects.push(_item);
      }
      
      private function _pricestreeFunc(input:ICustomDataInput) : void
      {
         var length:uint = input.readUnsignedShort();
         for(var i:uint = 0; i < length; i++)
         {
            this._pricestree.addChild(this._pricesFunc);
         }
      }
      
      private function _pricesFunc(input:ICustomDataInput) : void
      {
         var _val:Number = input.readVarUhLong();
         if(_val < 0 || _val > 9007199254740990)
         {
            throw new Error("Forbidden value (" + _val + ") on elements of prices.");
         }
         this.prices.push(_val);
      }
   }
}
