package com.ankamagames.dofus.network.types.game.data.items
{
   import com.ankamagames.jerakine.network.ICustomDataInput;
   import com.ankamagames.jerakine.network.ICustomDataOutput;
   import com.ankamagames.jerakine.network.INetworkType;
   import com.ankamagames.jerakine.network.utils.FuncTree;
   
   public class ObjectItemGenericQuantityPrice extends ObjectItemGenericQuantity implements INetworkType
   {
      
      public static const protocolId:uint = 494;
       
      
      public var price:Number = 0;
      
      public function ObjectItemGenericQuantityPrice()
      {
         super();
      }
      
      override public function getTypeId() : uint
      {
         return 494;
      }
      
      public function initObjectItemGenericQuantityPrice(objectGID:uint = 0, quantity:uint = 0, price:Number = 0) : ObjectItemGenericQuantityPrice
      {
         super.initObjectItemGenericQuantity(objectGID,quantity);
         this.price = price;
         return this;
      }
      
      override public function reset() : void
      {
         super.reset();
         this.price = 0;
      }
      
      override public function serialize(output:ICustomDataOutput) : void
      {
         this.serializeAs_ObjectItemGenericQuantityPrice(output);
      }
      
      public function serializeAs_ObjectItemGenericQuantityPrice(output:ICustomDataOutput) : void
      {
         super.serializeAs_ObjectItemGenericQuantity(output);
         if(this.price < 0 || this.price > 9007199254740990)
         {
            throw new Error("Forbidden value (" + this.price + ") on element price.");
         }
         output.writeVarLong(this.price);
      }
      
      override public function deserialize(input:ICustomDataInput) : void
      {
         this.deserializeAs_ObjectItemGenericQuantityPrice(input);
      }
      
      public function deserializeAs_ObjectItemGenericQuantityPrice(input:ICustomDataInput) : void
      {
         super.deserialize(input);
         this._priceFunc(input);
      }
      
      override public function deserializeAsync(tree:FuncTree) : void
      {
         this.deserializeAsyncAs_ObjectItemGenericQuantityPrice(tree);
      }
      
      public function deserializeAsyncAs_ObjectItemGenericQuantityPrice(tree:FuncTree) : void
      {
         super.deserializeAsync(tree);
         tree.addChild(this._priceFunc);
      }
      
      private function _priceFunc(input:ICustomDataInput) : void
      {
         this.price = input.readVarUhLong();
         if(this.price < 0 || this.price > 9007199254740990)
         {
            throw new Error("Forbidden value (" + this.price + ") on element of ObjectItemGenericQuantityPrice.price.");
         }
      }
   }
}
