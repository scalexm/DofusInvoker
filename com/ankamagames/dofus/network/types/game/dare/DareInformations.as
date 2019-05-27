package com.ankamagames.dofus.network.types.game.dare
{
   import com.ankamagames.dofus.network.types.game.character.CharacterBasicMinimalInformations;
   import com.ankamagames.jerakine.network.ICustomDataInput;
   import com.ankamagames.jerakine.network.ICustomDataOutput;
   import com.ankamagames.jerakine.network.INetworkType;
   import com.ankamagames.jerakine.network.utils.FuncTree;
   
   public class DareInformations implements INetworkType
   {
      
      public static const protocolId:uint = 502;
       
      
      public var dareId:Number = 0;
      
      public var creator:CharacterBasicMinimalInformations;
      
      public var subscriptionFee:Number = 0;
      
      public var jackpot:Number = 0;
      
      public var maxCountWinners:uint = 0;
      
      public var endDate:Number = 0;
      
      public var isPrivate:Boolean = false;
      
      public var guildId:uint = 0;
      
      public var allianceId:uint = 0;
      
      public var criterions:Vector.<DareCriteria>;
      
      public var startDate:Number = 0;
      
      private var _creatortree:FuncTree;
      
      private var _criterionstree:FuncTree;
      
      public function DareInformations()
      {
         this.creator = new CharacterBasicMinimalInformations();
         this.criterions = new Vector.<DareCriteria>();
         super();
      }
      
      public function getTypeId() : uint
      {
         return 502;
      }
      
      public function initDareInformations(dareId:Number = 0, creator:CharacterBasicMinimalInformations = null, subscriptionFee:Number = 0, jackpot:Number = 0, maxCountWinners:uint = 0, endDate:Number = 0, isPrivate:Boolean = false, guildId:uint = 0, allianceId:uint = 0, criterions:Vector.<DareCriteria> = null, startDate:Number = 0) : DareInformations
      {
         this.dareId = dareId;
         this.creator = creator;
         this.subscriptionFee = subscriptionFee;
         this.jackpot = jackpot;
         this.maxCountWinners = maxCountWinners;
         this.endDate = endDate;
         this.isPrivate = isPrivate;
         this.guildId = guildId;
         this.allianceId = allianceId;
         this.criterions = criterions;
         this.startDate = startDate;
         return this;
      }
      
      public function reset() : void
      {
         this.dareId = 0;
         this.creator = new CharacterBasicMinimalInformations();
         this.jackpot = 0;
         this.maxCountWinners = 0;
         this.endDate = 0;
         this.isPrivate = false;
         this.guildId = 0;
         this.allianceId = 0;
         this.criterions = new Vector.<DareCriteria>();
         this.startDate = 0;
      }
      
      public function serialize(output:ICustomDataOutput) : void
      {
         this.serializeAs_DareInformations(output);
      }
      
      public function serializeAs_DareInformations(output:ICustomDataOutput) : void
      {
         if(this.dareId < 0 || this.dareId > 9007199254740990)
         {
            throw new Error("Forbidden value (" + this.dareId + ") on element dareId.");
         }
         output.writeDouble(this.dareId);
         this.creator.serializeAs_CharacterBasicMinimalInformations(output);
         if(this.subscriptionFee < 0 || this.subscriptionFee > 9007199254740990)
         {
            throw new Error("Forbidden value (" + this.subscriptionFee + ") on element subscriptionFee.");
         }
         output.writeVarLong(this.subscriptionFee);
         if(this.jackpot < 0 || this.jackpot > 9007199254740990)
         {
            throw new Error("Forbidden value (" + this.jackpot + ") on element jackpot.");
         }
         output.writeVarLong(this.jackpot);
         if(this.maxCountWinners < 0 || this.maxCountWinners > 65535)
         {
            throw new Error("Forbidden value (" + this.maxCountWinners + ") on element maxCountWinners.");
         }
         output.writeShort(this.maxCountWinners);
         if(this.endDate < 0 || this.endDate > 9007199254740990)
         {
            throw new Error("Forbidden value (" + this.endDate + ") on element endDate.");
         }
         output.writeDouble(this.endDate);
         output.writeBoolean(this.isPrivate);
         if(this.guildId < 0)
         {
            throw new Error("Forbidden value (" + this.guildId + ") on element guildId.");
         }
         output.writeVarInt(this.guildId);
         if(this.allianceId < 0)
         {
            throw new Error("Forbidden value (" + this.allianceId + ") on element allianceId.");
         }
         output.writeVarInt(this.allianceId);
         output.writeShort(this.criterions.length);
         for(var _i10:uint = 0; _i10 < this.criterions.length; _i10++)
         {
            (this.criterions[_i10] as DareCriteria).serializeAs_DareCriteria(output);
         }
         if(this.startDate < 0 || this.startDate > 9007199254740990)
         {
            throw new Error("Forbidden value (" + this.startDate + ") on element startDate.");
         }
         output.writeDouble(this.startDate);
      }
      
      public function deserialize(input:ICustomDataInput) : void
      {
         this.deserializeAs_DareInformations(input);
      }
      
      public function deserializeAs_DareInformations(input:ICustomDataInput) : void
      {
         var _item10:DareCriteria = null;
         this._dareIdFunc(input);
         this.creator = new CharacterBasicMinimalInformations();
         this.creator.deserialize(input);
         this._subscriptionFeeFunc(input);
         this._jackpotFunc(input);
         this._maxCountWinnersFunc(input);
         this._endDateFunc(input);
         this._isPrivateFunc(input);
         this._guildIdFunc(input);
         this._allianceIdFunc(input);
         var _criterionsLen:uint = input.readUnsignedShort();
         for(var _i10:uint = 0; _i10 < _criterionsLen; _i10++)
         {
            _item10 = new DareCriteria();
            _item10.deserialize(input);
            this.criterions.push(_item10);
         }
         this._startDateFunc(input);
      }
      
      public function deserializeAsync(tree:FuncTree) : void
      {
         this.deserializeAsyncAs_DareInformations(tree);
      }
      
      public function deserializeAsyncAs_DareInformations(tree:FuncTree) : void
      {
         tree.addChild(this._dareIdFunc);
         this._creatortree = tree.addChild(this._creatortreeFunc);
         tree.addChild(this._subscriptionFeeFunc);
         tree.addChild(this._jackpotFunc);
         tree.addChild(this._maxCountWinnersFunc);
         tree.addChild(this._endDateFunc);
         tree.addChild(this._isPrivateFunc);
         tree.addChild(this._guildIdFunc);
         tree.addChild(this._allianceIdFunc);
         this._criterionstree = tree.addChild(this._criterionstreeFunc);
         tree.addChild(this._startDateFunc);
      }
      
      private function _dareIdFunc(input:ICustomDataInput) : void
      {
         this.dareId = input.readDouble();
         if(this.dareId < 0 || this.dareId > 9007199254740990)
         {
            throw new Error("Forbidden value (" + this.dareId + ") on element of DareInformations.dareId.");
         }
      }
      
      private function _creatortreeFunc(input:ICustomDataInput) : void
      {
         this.creator = new CharacterBasicMinimalInformations();
         this.creator.deserializeAsync(this._creatortree);
      }
      
      private function _subscriptionFeeFunc(input:ICustomDataInput) : void
      {
         this.subscriptionFee = input.readVarUhLong();
         if(this.subscriptionFee < 0 || this.subscriptionFee > 9007199254740990)
         {
            throw new Error("Forbidden value (" + this.subscriptionFee + ") on element of DareInformations.subscriptionFee.");
         }
      }
      
      private function _jackpotFunc(input:ICustomDataInput) : void
      {
         this.jackpot = input.readVarUhLong();
         if(this.jackpot < 0 || this.jackpot > 9007199254740990)
         {
            throw new Error("Forbidden value (" + this.jackpot + ") on element of DareInformations.jackpot.");
         }
      }
      
      private function _maxCountWinnersFunc(input:ICustomDataInput) : void
      {
         this.maxCountWinners = input.readUnsignedShort();
         if(this.maxCountWinners < 0 || this.maxCountWinners > 65535)
         {
            throw new Error("Forbidden value (" + this.maxCountWinners + ") on element of DareInformations.maxCountWinners.");
         }
      }
      
      private function _endDateFunc(input:ICustomDataInput) : void
      {
         this.endDate = input.readDouble();
         if(this.endDate < 0 || this.endDate > 9007199254740990)
         {
            throw new Error("Forbidden value (" + this.endDate + ") on element of DareInformations.endDate.");
         }
      }
      
      private function _isPrivateFunc(input:ICustomDataInput) : void
      {
         this.isPrivate = input.readBoolean();
      }
      
      private function _guildIdFunc(input:ICustomDataInput) : void
      {
         this.guildId = input.readVarUhInt();
         if(this.guildId < 0)
         {
            throw new Error("Forbidden value (" + this.guildId + ") on element of DareInformations.guildId.");
         }
      }
      
      private function _allianceIdFunc(input:ICustomDataInput) : void
      {
         this.allianceId = input.readVarUhInt();
         if(this.allianceId < 0)
         {
            throw new Error("Forbidden value (" + this.allianceId + ") on element of DareInformations.allianceId.");
         }
      }
      
      private function _criterionstreeFunc(input:ICustomDataInput) : void
      {
         var length:uint = input.readUnsignedShort();
         for(var i:uint = 0; i < length; i++)
         {
            this._criterionstree.addChild(this._criterionsFunc);
         }
      }
      
      private function _criterionsFunc(input:ICustomDataInput) : void
      {
         var _item:DareCriteria = new DareCriteria();
         _item.deserialize(input);
         this.criterions.push(_item);
      }
      
      private function _startDateFunc(input:ICustomDataInput) : void
      {
         this.startDate = input.readDouble();
         if(this.startDate < 0 || this.startDate > 9007199254740990)
         {
            throw new Error("Forbidden value (" + this.startDate + ") on element of DareInformations.startDate.");
         }
      }
   }
}
