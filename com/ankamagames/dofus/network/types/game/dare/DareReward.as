package com.ankamagames.dofus.network.types.game.dare
{
   import com.ankamagames.jerakine.network.ICustomDataInput;
   import com.ankamagames.jerakine.network.ICustomDataOutput;
   import com.ankamagames.jerakine.network.INetworkType;
   import com.ankamagames.jerakine.network.utils.FuncTree;
   
   public class DareReward implements INetworkType
   {
      
      public static const protocolId:uint = 505;
       
      
      public var type:uint = 0;
      
      public var monsterId:uint = 0;
      
      public var kamas:Number = 0;
      
      public var dareId:Number = 0;
      
      public function DareReward()
      {
         super();
      }
      
      public function getTypeId() : uint
      {
         return 505;
      }
      
      public function initDareReward(type:uint = 0, monsterId:uint = 0, kamas:Number = 0, dareId:Number = 0) : DareReward
      {
         this.type = type;
         this.monsterId = monsterId;
         this.kamas = kamas;
         this.dareId = dareId;
         return this;
      }
      
      public function reset() : void
      {
         this.type = 0;
         this.monsterId = 0;
         this.kamas = 0;
         this.dareId = 0;
      }
      
      public function serialize(output:ICustomDataOutput) : void
      {
         this.serializeAs_DareReward(output);
      }
      
      public function serializeAs_DareReward(output:ICustomDataOutput) : void
      {
         output.writeByte(this.type);
         if(this.monsterId < 0)
         {
            throw new Error("Forbidden value (" + this.monsterId + ") on element monsterId.");
         }
         output.writeVarShort(this.monsterId);
         if(this.kamas < 0 || this.kamas > 9007199254740990)
         {
            throw new Error("Forbidden value (" + this.kamas + ") on element kamas.");
         }
         output.writeVarLong(this.kamas);
         if(this.dareId < 0 || this.dareId > 9007199254740990)
         {
            throw new Error("Forbidden value (" + this.dareId + ") on element dareId.");
         }
         output.writeDouble(this.dareId);
      }
      
      public function deserialize(input:ICustomDataInput) : void
      {
         this.deserializeAs_DareReward(input);
      }
      
      public function deserializeAs_DareReward(input:ICustomDataInput) : void
      {
         this._typeFunc(input);
         this._monsterIdFunc(input);
         this._kamasFunc(input);
         this._dareIdFunc(input);
      }
      
      public function deserializeAsync(tree:FuncTree) : void
      {
         this.deserializeAsyncAs_DareReward(tree);
      }
      
      public function deserializeAsyncAs_DareReward(tree:FuncTree) : void
      {
         tree.addChild(this._typeFunc);
         tree.addChild(this._monsterIdFunc);
         tree.addChild(this._kamasFunc);
         tree.addChild(this._dareIdFunc);
      }
      
      private function _typeFunc(input:ICustomDataInput) : void
      {
         this.type = input.readByte();
         if(this.type < 0)
         {
            throw new Error("Forbidden value (" + this.type + ") on element of DareReward.type.");
         }
      }
      
      private function _monsterIdFunc(input:ICustomDataInput) : void
      {
         this.monsterId = input.readVarUhShort();
         if(this.monsterId < 0)
         {
            throw new Error("Forbidden value (" + this.monsterId + ") on element of DareReward.monsterId.");
         }
      }
      
      private function _kamasFunc(input:ICustomDataInput) : void
      {
         this.kamas = input.readVarUhLong();
         if(this.kamas < 0 || this.kamas > 9007199254740990)
         {
            throw new Error("Forbidden value (" + this.kamas + ") on element of DareReward.kamas.");
         }
      }
      
      private function _dareIdFunc(input:ICustomDataInput) : void
      {
         this.dareId = input.readDouble();
         if(this.dareId < 0 || this.dareId > 9007199254740990)
         {
            throw new Error("Forbidden value (" + this.dareId + ") on element of DareReward.dareId.");
         }
      }
   }
}
