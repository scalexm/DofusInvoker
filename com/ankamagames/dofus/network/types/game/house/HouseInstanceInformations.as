package com.ankamagames.dofus.network.types.game.house
{
   import com.ankamagames.jerakine.network.ICustomDataInput;
   import com.ankamagames.jerakine.network.ICustomDataOutput;
   import com.ankamagames.jerakine.network.INetworkType;
   import com.ankamagames.jerakine.network.utils.BooleanByteWrapper;
   import com.ankamagames.jerakine.network.utils.FuncTree;
   
   public class HouseInstanceInformations implements INetworkType
   {
      
      public static const protocolId:uint = 511;
       
      
      public var instanceId:uint = 0;
      
      public var secondHand:Boolean = false;
      
      public var isLocked:Boolean = false;
      
      public var ownerName:String = "";
      
      public var price:Number = 0;
      
      public var isSaleLocked:Boolean = false;
      
      public function HouseInstanceInformations()
      {
         super();
      }
      
      public function getTypeId() : uint
      {
         return 511;
      }
      
      public function initHouseInstanceInformations(instanceId:uint = 0, secondHand:Boolean = false, isLocked:Boolean = false, ownerName:String = "", price:Number = 0, isSaleLocked:Boolean = false) : HouseInstanceInformations
      {
         this.instanceId = instanceId;
         this.secondHand = secondHand;
         this.isLocked = isLocked;
         this.ownerName = ownerName;
         this.price = price;
         this.isSaleLocked = isSaleLocked;
         return this;
      }
      
      public function reset() : void
      {
         this.instanceId = 0;
         this.secondHand = false;
         this.isLocked = false;
         this.ownerName = "";
         this.price = 0;
         this.isSaleLocked = false;
      }
      
      public function serialize(output:ICustomDataOutput) : void
      {
         this.serializeAs_HouseInstanceInformations(output);
      }
      
      public function serializeAs_HouseInstanceInformations(output:ICustomDataOutput) : void
      {
         var _box0:uint = 0;
         _box0 = BooleanByteWrapper.setFlag(_box0,0,this.secondHand);
         _box0 = BooleanByteWrapper.setFlag(_box0,1,this.isLocked);
         _box0 = BooleanByteWrapper.setFlag(_box0,2,this.isSaleLocked);
         output.writeByte(_box0);
         if(this.instanceId < 0)
         {
            throw new Error("Forbidden value (" + this.instanceId + ") on element instanceId.");
         }
         output.writeInt(this.instanceId);
         output.writeUTF(this.ownerName);
         if(this.price < -9007199254740990 || this.price > 9007199254740990)
         {
            throw new Error("Forbidden value (" + this.price + ") on element price.");
         }
         output.writeVarLong(this.price);
      }
      
      public function deserialize(input:ICustomDataInput) : void
      {
         this.deserializeAs_HouseInstanceInformations(input);
      }
      
      public function deserializeAs_HouseInstanceInformations(input:ICustomDataInput) : void
      {
         this.deserializeByteBoxes(input);
         this._instanceIdFunc(input);
         this._ownerNameFunc(input);
         this._priceFunc(input);
      }
      
      public function deserializeAsync(tree:FuncTree) : void
      {
         this.deserializeAsyncAs_HouseInstanceInformations(tree);
      }
      
      public function deserializeAsyncAs_HouseInstanceInformations(tree:FuncTree) : void
      {
         tree.addChild(this.deserializeByteBoxes);
         tree.addChild(this._instanceIdFunc);
         tree.addChild(this._ownerNameFunc);
         tree.addChild(this._priceFunc);
      }
      
      private function deserializeByteBoxes(input:ICustomDataInput) : void
      {
         var _box0:uint = input.readByte();
         this.secondHand = BooleanByteWrapper.getFlag(_box0,0);
         this.isLocked = BooleanByteWrapper.getFlag(_box0,1);
         this.isSaleLocked = BooleanByteWrapper.getFlag(_box0,2);
      }
      
      private function _instanceIdFunc(input:ICustomDataInput) : void
      {
         this.instanceId = input.readInt();
         if(this.instanceId < 0)
         {
            throw new Error("Forbidden value (" + this.instanceId + ") on element of HouseInstanceInformations.instanceId.");
         }
      }
      
      private function _ownerNameFunc(input:ICustomDataInput) : void
      {
         this.ownerName = input.readUTF();
      }
      
      private function _priceFunc(input:ICustomDataInput) : void
      {
         this.price = input.readVarLong();
         if(this.price < -9007199254740990 || this.price > 9007199254740990)
         {
            throw new Error("Forbidden value (" + this.price + ") on element of HouseInstanceInformations.price.");
         }
      }
   }
}
