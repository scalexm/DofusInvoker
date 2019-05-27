package com.ankamagames.dofus.network.types.game.context.fight
{
   import com.ankamagames.jerakine.network.ICustomDataInput;
   import com.ankamagames.jerakine.network.ICustomDataOutput;
   import com.ankamagames.jerakine.network.INetworkType;
   import com.ankamagames.jerakine.network.utils.FuncTree;
   
   public class GameFightMinimalStats implements INetworkType
   {
      
      public static const protocolId:uint = 31;
       
      
      public var lifePoints:uint = 0;
      
      public var maxLifePoints:uint = 0;
      
      public var baseMaxLifePoints:uint = 0;
      
      public var permanentDamagePercent:uint = 0;
      
      public var shieldPoints:uint = 0;
      
      public var actionPoints:int = 0;
      
      public var maxActionPoints:int = 0;
      
      public var movementPoints:int = 0;
      
      public var maxMovementPoints:int = 0;
      
      public var summoner:Number = 0;
      
      public var summoned:Boolean = false;
      
      public var neutralElementResistPercent:int = 0;
      
      public var earthElementResistPercent:int = 0;
      
      public var waterElementResistPercent:int = 0;
      
      public var airElementResistPercent:int = 0;
      
      public var fireElementResistPercent:int = 0;
      
      public var neutralElementReduction:int = 0;
      
      public var earthElementReduction:int = 0;
      
      public var waterElementReduction:int = 0;
      
      public var airElementReduction:int = 0;
      
      public var fireElementReduction:int = 0;
      
      public var criticalDamageFixedResist:int = 0;
      
      public var pushDamageFixedResist:int = 0;
      
      public var pvpNeutralElementResistPercent:int = 0;
      
      public var pvpEarthElementResistPercent:int = 0;
      
      public var pvpWaterElementResistPercent:int = 0;
      
      public var pvpAirElementResistPercent:int = 0;
      
      public var pvpFireElementResistPercent:int = 0;
      
      public var pvpNeutralElementReduction:int = 0;
      
      public var pvpEarthElementReduction:int = 0;
      
      public var pvpWaterElementReduction:int = 0;
      
      public var pvpAirElementReduction:int = 0;
      
      public var pvpFireElementReduction:int = 0;
      
      public var dodgePALostProbability:uint = 0;
      
      public var dodgePMLostProbability:uint = 0;
      
      public var tackleBlock:int = 0;
      
      public var tackleEvade:int = 0;
      
      public var fixedDamageReflection:int = 0;
      
      public var invisibilityState:uint = 0;
      
      public var meleeDamageReceivedPercent:uint = 0;
      
      public var rangedDamageReceivedPercent:uint = 0;
      
      public var weaponDamageReceivedPercent:uint = 0;
      
      public var spellDamageReceivedPercent:uint = 0;
      
      public function GameFightMinimalStats()
      {
         super();
      }
      
      public function getTypeId() : uint
      {
         return 31;
      }
      
      public function initGameFightMinimalStats(lifePoints:uint = 0, maxLifePoints:uint = 0, baseMaxLifePoints:uint = 0, permanentDamagePercent:uint = 0, shieldPoints:uint = 0, actionPoints:int = 0, maxActionPoints:int = 0, movementPoints:int = 0, maxMovementPoints:int = 0, summoner:Number = 0, summoned:Boolean = false, neutralElementResistPercent:int = 0, earthElementResistPercent:int = 0, waterElementResistPercent:int = 0, airElementResistPercent:int = 0, fireElementResistPercent:int = 0, neutralElementReduction:int = 0, earthElementReduction:int = 0, waterElementReduction:int = 0, airElementReduction:int = 0, fireElementReduction:int = 0, criticalDamageFixedResist:int = 0, pushDamageFixedResist:int = 0, pvpNeutralElementResistPercent:int = 0, pvpEarthElementResistPercent:int = 0, pvpWaterElementResistPercent:int = 0, pvpAirElementResistPercent:int = 0, pvpFireElementResistPercent:int = 0, pvpNeutralElementReduction:int = 0, pvpEarthElementReduction:int = 0, pvpWaterElementReduction:int = 0, pvpAirElementReduction:int = 0, pvpFireElementReduction:int = 0, dodgePALostProbability:uint = 0, dodgePMLostProbability:uint = 0, tackleBlock:int = 0, tackleEvade:int = 0, fixedDamageReflection:int = 0, invisibilityState:uint = 0, meleeDamageReceivedPercent:uint = 0, rangedDamageReceivedPercent:uint = 0, weaponDamageReceivedPercent:uint = 0, spellDamageReceivedPercent:uint = 0) : GameFightMinimalStats
      {
         this.lifePoints = lifePoints;
         this.maxLifePoints = maxLifePoints;
         this.baseMaxLifePoints = baseMaxLifePoints;
         this.permanentDamagePercent = permanentDamagePercent;
         this.shieldPoints = shieldPoints;
         this.actionPoints = actionPoints;
         this.maxActionPoints = maxActionPoints;
         this.movementPoints = movementPoints;
         this.maxMovementPoints = maxMovementPoints;
         this.summoner = summoner;
         this.summoned = summoned;
         this.neutralElementResistPercent = neutralElementResistPercent;
         this.earthElementResistPercent = earthElementResistPercent;
         this.waterElementResistPercent = waterElementResistPercent;
         this.airElementResistPercent = airElementResistPercent;
         this.fireElementResistPercent = fireElementResistPercent;
         this.neutralElementReduction = neutralElementReduction;
         this.earthElementReduction = earthElementReduction;
         this.waterElementReduction = waterElementReduction;
         this.airElementReduction = airElementReduction;
         this.fireElementReduction = fireElementReduction;
         this.criticalDamageFixedResist = criticalDamageFixedResist;
         this.pushDamageFixedResist = pushDamageFixedResist;
         this.pvpNeutralElementResistPercent = pvpNeutralElementResistPercent;
         this.pvpEarthElementResistPercent = pvpEarthElementResistPercent;
         this.pvpWaterElementResistPercent = pvpWaterElementResistPercent;
         this.pvpAirElementResistPercent = pvpAirElementResistPercent;
         this.pvpFireElementResistPercent = pvpFireElementResistPercent;
         this.pvpNeutralElementReduction = pvpNeutralElementReduction;
         this.pvpEarthElementReduction = pvpEarthElementReduction;
         this.pvpWaterElementReduction = pvpWaterElementReduction;
         this.pvpAirElementReduction = pvpAirElementReduction;
         this.pvpFireElementReduction = pvpFireElementReduction;
         this.dodgePALostProbability = dodgePALostProbability;
         this.dodgePMLostProbability = dodgePMLostProbability;
         this.tackleBlock = tackleBlock;
         this.tackleEvade = tackleEvade;
         this.fixedDamageReflection = fixedDamageReflection;
         this.invisibilityState = invisibilityState;
         this.meleeDamageReceivedPercent = meleeDamageReceivedPercent;
         this.rangedDamageReceivedPercent = rangedDamageReceivedPercent;
         this.weaponDamageReceivedPercent = weaponDamageReceivedPercent;
         this.spellDamageReceivedPercent = spellDamageReceivedPercent;
         return this;
      }
      
      public function reset() : void
      {
         this.lifePoints = 0;
         this.maxLifePoints = 0;
         this.baseMaxLifePoints = 0;
         this.permanentDamagePercent = 0;
         this.shieldPoints = 0;
         this.actionPoints = 0;
         this.maxActionPoints = 0;
         this.movementPoints = 0;
         this.maxMovementPoints = 0;
         this.summoner = 0;
         this.summoned = false;
         this.neutralElementResistPercent = 0;
         this.earthElementResistPercent = 0;
         this.waterElementResistPercent = 0;
         this.airElementResistPercent = 0;
         this.fireElementResistPercent = 0;
         this.neutralElementReduction = 0;
         this.earthElementReduction = 0;
         this.waterElementReduction = 0;
         this.airElementReduction = 0;
         this.fireElementReduction = 0;
         this.criticalDamageFixedResist = 0;
         this.pushDamageFixedResist = 0;
         this.pvpNeutralElementResistPercent = 0;
         this.pvpEarthElementResistPercent = 0;
         this.pvpWaterElementResistPercent = 0;
         this.pvpAirElementResistPercent = 0;
         this.pvpFireElementResistPercent = 0;
         this.pvpNeutralElementReduction = 0;
         this.pvpEarthElementReduction = 0;
         this.pvpWaterElementReduction = 0;
         this.pvpAirElementReduction = 0;
         this.pvpFireElementReduction = 0;
         this.dodgePALostProbability = 0;
         this.dodgePMLostProbability = 0;
         this.tackleBlock = 0;
         this.tackleEvade = 0;
         this.fixedDamageReflection = 0;
         this.invisibilityState = 0;
         this.meleeDamageReceivedPercent = 0;
         this.rangedDamageReceivedPercent = 0;
         this.weaponDamageReceivedPercent = 0;
         this.spellDamageReceivedPercent = 0;
      }
      
      public function serialize(output:ICustomDataOutput) : void
      {
         this.serializeAs_GameFightMinimalStats(output);
      }
      
      public function serializeAs_GameFightMinimalStats(output:ICustomDataOutput) : void
      {
         if(this.lifePoints < 0)
         {
            throw new Error("Forbidden value (" + this.lifePoints + ") on element lifePoints.");
         }
         output.writeVarInt(this.lifePoints);
         if(this.maxLifePoints < 0)
         {
            throw new Error("Forbidden value (" + this.maxLifePoints + ") on element maxLifePoints.");
         }
         output.writeVarInt(this.maxLifePoints);
         if(this.baseMaxLifePoints < 0)
         {
            throw new Error("Forbidden value (" + this.baseMaxLifePoints + ") on element baseMaxLifePoints.");
         }
         output.writeVarInt(this.baseMaxLifePoints);
         if(this.permanentDamagePercent < 0)
         {
            throw new Error("Forbidden value (" + this.permanentDamagePercent + ") on element permanentDamagePercent.");
         }
         output.writeVarInt(this.permanentDamagePercent);
         if(this.shieldPoints < 0)
         {
            throw new Error("Forbidden value (" + this.shieldPoints + ") on element shieldPoints.");
         }
         output.writeVarInt(this.shieldPoints);
         output.writeVarShort(this.actionPoints);
         output.writeVarShort(this.maxActionPoints);
         output.writeVarShort(this.movementPoints);
         output.writeVarShort(this.maxMovementPoints);
         if(this.summoner < -9007199254740990 || this.summoner > 9007199254740990)
         {
            throw new Error("Forbidden value (" + this.summoner + ") on element summoner.");
         }
         output.writeDouble(this.summoner);
         output.writeBoolean(this.summoned);
         output.writeVarShort(this.neutralElementResistPercent);
         output.writeVarShort(this.earthElementResistPercent);
         output.writeVarShort(this.waterElementResistPercent);
         output.writeVarShort(this.airElementResistPercent);
         output.writeVarShort(this.fireElementResistPercent);
         output.writeVarShort(this.neutralElementReduction);
         output.writeVarShort(this.earthElementReduction);
         output.writeVarShort(this.waterElementReduction);
         output.writeVarShort(this.airElementReduction);
         output.writeVarShort(this.fireElementReduction);
         output.writeVarShort(this.criticalDamageFixedResist);
         output.writeVarShort(this.pushDamageFixedResist);
         output.writeVarShort(this.pvpNeutralElementResistPercent);
         output.writeVarShort(this.pvpEarthElementResistPercent);
         output.writeVarShort(this.pvpWaterElementResistPercent);
         output.writeVarShort(this.pvpAirElementResistPercent);
         output.writeVarShort(this.pvpFireElementResistPercent);
         output.writeVarShort(this.pvpNeutralElementReduction);
         output.writeVarShort(this.pvpEarthElementReduction);
         output.writeVarShort(this.pvpWaterElementReduction);
         output.writeVarShort(this.pvpAirElementReduction);
         output.writeVarShort(this.pvpFireElementReduction);
         if(this.dodgePALostProbability < 0)
         {
            throw new Error("Forbidden value (" + this.dodgePALostProbability + ") on element dodgePALostProbability.");
         }
         output.writeVarShort(this.dodgePALostProbability);
         if(this.dodgePMLostProbability < 0)
         {
            throw new Error("Forbidden value (" + this.dodgePMLostProbability + ") on element dodgePMLostProbability.");
         }
         output.writeVarShort(this.dodgePMLostProbability);
         output.writeVarShort(this.tackleBlock);
         output.writeVarShort(this.tackleEvade);
         output.writeVarShort(this.fixedDamageReflection);
         output.writeByte(this.invisibilityState);
         if(this.meleeDamageReceivedPercent < 0)
         {
            throw new Error("Forbidden value (" + this.meleeDamageReceivedPercent + ") on element meleeDamageReceivedPercent.");
         }
         output.writeVarShort(this.meleeDamageReceivedPercent);
         if(this.rangedDamageReceivedPercent < 0)
         {
            throw new Error("Forbidden value (" + this.rangedDamageReceivedPercent + ") on element rangedDamageReceivedPercent.");
         }
         output.writeVarShort(this.rangedDamageReceivedPercent);
         if(this.weaponDamageReceivedPercent < 0)
         {
            throw new Error("Forbidden value (" + this.weaponDamageReceivedPercent + ") on element weaponDamageReceivedPercent.");
         }
         output.writeVarShort(this.weaponDamageReceivedPercent);
         if(this.spellDamageReceivedPercent < 0)
         {
            throw new Error("Forbidden value (" + this.spellDamageReceivedPercent + ") on element spellDamageReceivedPercent.");
         }
         output.writeVarShort(this.spellDamageReceivedPercent);
      }
      
      public function deserialize(input:ICustomDataInput) : void
      {
         this.deserializeAs_GameFightMinimalStats(input);
      }
      
      public function deserializeAs_GameFightMinimalStats(input:ICustomDataInput) : void
      {
         this._lifePointsFunc(input);
         this._maxLifePointsFunc(input);
         this._baseMaxLifePointsFunc(input);
         this._permanentDamagePercentFunc(input);
         this._shieldPointsFunc(input);
         this._actionPointsFunc(input);
         this._maxActionPointsFunc(input);
         this._movementPointsFunc(input);
         this._maxMovementPointsFunc(input);
         this._summonerFunc(input);
         this._summonedFunc(input);
         this._neutralElementResistPercentFunc(input);
         this._earthElementResistPercentFunc(input);
         this._waterElementResistPercentFunc(input);
         this._airElementResistPercentFunc(input);
         this._fireElementResistPercentFunc(input);
         this._neutralElementReductionFunc(input);
         this._earthElementReductionFunc(input);
         this._waterElementReductionFunc(input);
         this._airElementReductionFunc(input);
         this._fireElementReductionFunc(input);
         this._criticalDamageFixedResistFunc(input);
         this._pushDamageFixedResistFunc(input);
         this._pvpNeutralElementResistPercentFunc(input);
         this._pvpEarthElementResistPercentFunc(input);
         this._pvpWaterElementResistPercentFunc(input);
         this._pvpAirElementResistPercentFunc(input);
         this._pvpFireElementResistPercentFunc(input);
         this._pvpNeutralElementReductionFunc(input);
         this._pvpEarthElementReductionFunc(input);
         this._pvpWaterElementReductionFunc(input);
         this._pvpAirElementReductionFunc(input);
         this._pvpFireElementReductionFunc(input);
         this._dodgePALostProbabilityFunc(input);
         this._dodgePMLostProbabilityFunc(input);
         this._tackleBlockFunc(input);
         this._tackleEvadeFunc(input);
         this._fixedDamageReflectionFunc(input);
         this._invisibilityStateFunc(input);
         this._meleeDamageReceivedPercentFunc(input);
         this._rangedDamageReceivedPercentFunc(input);
         this._weaponDamageReceivedPercentFunc(input);
         this._spellDamageReceivedPercentFunc(input);
      }
      
      public function deserializeAsync(tree:FuncTree) : void
      {
         this.deserializeAsyncAs_GameFightMinimalStats(tree);
      }
      
      public function deserializeAsyncAs_GameFightMinimalStats(tree:FuncTree) : void
      {
         tree.addChild(this._lifePointsFunc);
         tree.addChild(this._maxLifePointsFunc);
         tree.addChild(this._baseMaxLifePointsFunc);
         tree.addChild(this._permanentDamagePercentFunc);
         tree.addChild(this._shieldPointsFunc);
         tree.addChild(this._actionPointsFunc);
         tree.addChild(this._maxActionPointsFunc);
         tree.addChild(this._movementPointsFunc);
         tree.addChild(this._maxMovementPointsFunc);
         tree.addChild(this._summonerFunc);
         tree.addChild(this._summonedFunc);
         tree.addChild(this._neutralElementResistPercentFunc);
         tree.addChild(this._earthElementResistPercentFunc);
         tree.addChild(this._waterElementResistPercentFunc);
         tree.addChild(this._airElementResistPercentFunc);
         tree.addChild(this._fireElementResistPercentFunc);
         tree.addChild(this._neutralElementReductionFunc);
         tree.addChild(this._earthElementReductionFunc);
         tree.addChild(this._waterElementReductionFunc);
         tree.addChild(this._airElementReductionFunc);
         tree.addChild(this._fireElementReductionFunc);
         tree.addChild(this._criticalDamageFixedResistFunc);
         tree.addChild(this._pushDamageFixedResistFunc);
         tree.addChild(this._pvpNeutralElementResistPercentFunc);
         tree.addChild(this._pvpEarthElementResistPercentFunc);
         tree.addChild(this._pvpWaterElementResistPercentFunc);
         tree.addChild(this._pvpAirElementResistPercentFunc);
         tree.addChild(this._pvpFireElementResistPercentFunc);
         tree.addChild(this._pvpNeutralElementReductionFunc);
         tree.addChild(this._pvpEarthElementReductionFunc);
         tree.addChild(this._pvpWaterElementReductionFunc);
         tree.addChild(this._pvpAirElementReductionFunc);
         tree.addChild(this._pvpFireElementReductionFunc);
         tree.addChild(this._dodgePALostProbabilityFunc);
         tree.addChild(this._dodgePMLostProbabilityFunc);
         tree.addChild(this._tackleBlockFunc);
         tree.addChild(this._tackleEvadeFunc);
         tree.addChild(this._fixedDamageReflectionFunc);
         tree.addChild(this._invisibilityStateFunc);
         tree.addChild(this._meleeDamageReceivedPercentFunc);
         tree.addChild(this._rangedDamageReceivedPercentFunc);
         tree.addChild(this._weaponDamageReceivedPercentFunc);
         tree.addChild(this._spellDamageReceivedPercentFunc);
      }
      
      private function _lifePointsFunc(input:ICustomDataInput) : void
      {
         this.lifePoints = input.readVarUhInt();
         if(this.lifePoints < 0)
         {
            throw new Error("Forbidden value (" + this.lifePoints + ") on element of GameFightMinimalStats.lifePoints.");
         }
      }
      
      private function _maxLifePointsFunc(input:ICustomDataInput) : void
      {
         this.maxLifePoints = input.readVarUhInt();
         if(this.maxLifePoints < 0)
         {
            throw new Error("Forbidden value (" + this.maxLifePoints + ") on element of GameFightMinimalStats.maxLifePoints.");
         }
      }
      
      private function _baseMaxLifePointsFunc(input:ICustomDataInput) : void
      {
         this.baseMaxLifePoints = input.readVarUhInt();
         if(this.baseMaxLifePoints < 0)
         {
            throw new Error("Forbidden value (" + this.baseMaxLifePoints + ") on element of GameFightMinimalStats.baseMaxLifePoints.");
         }
      }
      
      private function _permanentDamagePercentFunc(input:ICustomDataInput) : void
      {
         this.permanentDamagePercent = input.readVarUhInt();
         if(this.permanentDamagePercent < 0)
         {
            throw new Error("Forbidden value (" + this.permanentDamagePercent + ") on element of GameFightMinimalStats.permanentDamagePercent.");
         }
      }
      
      private function _shieldPointsFunc(input:ICustomDataInput) : void
      {
         this.shieldPoints = input.readVarUhInt();
         if(this.shieldPoints < 0)
         {
            throw new Error("Forbidden value (" + this.shieldPoints + ") on element of GameFightMinimalStats.shieldPoints.");
         }
      }
      
      private function _actionPointsFunc(input:ICustomDataInput) : void
      {
         this.actionPoints = input.readVarShort();
      }
      
      private function _maxActionPointsFunc(input:ICustomDataInput) : void
      {
         this.maxActionPoints = input.readVarShort();
      }
      
      private function _movementPointsFunc(input:ICustomDataInput) : void
      {
         this.movementPoints = input.readVarShort();
      }
      
      private function _maxMovementPointsFunc(input:ICustomDataInput) : void
      {
         this.maxMovementPoints = input.readVarShort();
      }
      
      private function _summonerFunc(input:ICustomDataInput) : void
      {
         this.summoner = input.readDouble();
         if(this.summoner < -9007199254740990 || this.summoner > 9007199254740990)
         {
            throw new Error("Forbidden value (" + this.summoner + ") on element of GameFightMinimalStats.summoner.");
         }
      }
      
      private function _summonedFunc(input:ICustomDataInput) : void
      {
         this.summoned = input.readBoolean();
      }
      
      private function _neutralElementResistPercentFunc(input:ICustomDataInput) : void
      {
         this.neutralElementResistPercent = input.readVarShort();
      }
      
      private function _earthElementResistPercentFunc(input:ICustomDataInput) : void
      {
         this.earthElementResistPercent = input.readVarShort();
      }
      
      private function _waterElementResistPercentFunc(input:ICustomDataInput) : void
      {
         this.waterElementResistPercent = input.readVarShort();
      }
      
      private function _airElementResistPercentFunc(input:ICustomDataInput) : void
      {
         this.airElementResistPercent = input.readVarShort();
      }
      
      private function _fireElementResistPercentFunc(input:ICustomDataInput) : void
      {
         this.fireElementResistPercent = input.readVarShort();
      }
      
      private function _neutralElementReductionFunc(input:ICustomDataInput) : void
      {
         this.neutralElementReduction = input.readVarShort();
      }
      
      private function _earthElementReductionFunc(input:ICustomDataInput) : void
      {
         this.earthElementReduction = input.readVarShort();
      }
      
      private function _waterElementReductionFunc(input:ICustomDataInput) : void
      {
         this.waterElementReduction = input.readVarShort();
      }
      
      private function _airElementReductionFunc(input:ICustomDataInput) : void
      {
         this.airElementReduction = input.readVarShort();
      }
      
      private function _fireElementReductionFunc(input:ICustomDataInput) : void
      {
         this.fireElementReduction = input.readVarShort();
      }
      
      private function _criticalDamageFixedResistFunc(input:ICustomDataInput) : void
      {
         this.criticalDamageFixedResist = input.readVarShort();
      }
      
      private function _pushDamageFixedResistFunc(input:ICustomDataInput) : void
      {
         this.pushDamageFixedResist = input.readVarShort();
      }
      
      private function _pvpNeutralElementResistPercentFunc(input:ICustomDataInput) : void
      {
         this.pvpNeutralElementResistPercent = input.readVarShort();
      }
      
      private function _pvpEarthElementResistPercentFunc(input:ICustomDataInput) : void
      {
         this.pvpEarthElementResistPercent = input.readVarShort();
      }
      
      private function _pvpWaterElementResistPercentFunc(input:ICustomDataInput) : void
      {
         this.pvpWaterElementResistPercent = input.readVarShort();
      }
      
      private function _pvpAirElementResistPercentFunc(input:ICustomDataInput) : void
      {
         this.pvpAirElementResistPercent = input.readVarShort();
      }
      
      private function _pvpFireElementResistPercentFunc(input:ICustomDataInput) : void
      {
         this.pvpFireElementResistPercent = input.readVarShort();
      }
      
      private function _pvpNeutralElementReductionFunc(input:ICustomDataInput) : void
      {
         this.pvpNeutralElementReduction = input.readVarShort();
      }
      
      private function _pvpEarthElementReductionFunc(input:ICustomDataInput) : void
      {
         this.pvpEarthElementReduction = input.readVarShort();
      }
      
      private function _pvpWaterElementReductionFunc(input:ICustomDataInput) : void
      {
         this.pvpWaterElementReduction = input.readVarShort();
      }
      
      private function _pvpAirElementReductionFunc(input:ICustomDataInput) : void
      {
         this.pvpAirElementReduction = input.readVarShort();
      }
      
      private function _pvpFireElementReductionFunc(input:ICustomDataInput) : void
      {
         this.pvpFireElementReduction = input.readVarShort();
      }
      
      private function _dodgePALostProbabilityFunc(input:ICustomDataInput) : void
      {
         this.dodgePALostProbability = input.readVarUhShort();
         if(this.dodgePALostProbability < 0)
         {
            throw new Error("Forbidden value (" + this.dodgePALostProbability + ") on element of GameFightMinimalStats.dodgePALostProbability.");
         }
      }
      
      private function _dodgePMLostProbabilityFunc(input:ICustomDataInput) : void
      {
         this.dodgePMLostProbability = input.readVarUhShort();
         if(this.dodgePMLostProbability < 0)
         {
            throw new Error("Forbidden value (" + this.dodgePMLostProbability + ") on element of GameFightMinimalStats.dodgePMLostProbability.");
         }
      }
      
      private function _tackleBlockFunc(input:ICustomDataInput) : void
      {
         this.tackleBlock = input.readVarShort();
      }
      
      private function _tackleEvadeFunc(input:ICustomDataInput) : void
      {
         this.tackleEvade = input.readVarShort();
      }
      
      private function _fixedDamageReflectionFunc(input:ICustomDataInput) : void
      {
         this.fixedDamageReflection = input.readVarShort();
      }
      
      private function _invisibilityStateFunc(input:ICustomDataInput) : void
      {
         this.invisibilityState = input.readByte();
         if(this.invisibilityState < 0)
         {
            throw new Error("Forbidden value (" + this.invisibilityState + ") on element of GameFightMinimalStats.invisibilityState.");
         }
      }
      
      private function _meleeDamageReceivedPercentFunc(input:ICustomDataInput) : void
      {
         this.meleeDamageReceivedPercent = input.readVarUhShort();
         if(this.meleeDamageReceivedPercent < 0)
         {
            throw new Error("Forbidden value (" + this.meleeDamageReceivedPercent + ") on element of GameFightMinimalStats.meleeDamageReceivedPercent.");
         }
      }
      
      private function _rangedDamageReceivedPercentFunc(input:ICustomDataInput) : void
      {
         this.rangedDamageReceivedPercent = input.readVarUhShort();
         if(this.rangedDamageReceivedPercent < 0)
         {
            throw new Error("Forbidden value (" + this.rangedDamageReceivedPercent + ") on element of GameFightMinimalStats.rangedDamageReceivedPercent.");
         }
      }
      
      private function _weaponDamageReceivedPercentFunc(input:ICustomDataInput) : void
      {
         this.weaponDamageReceivedPercent = input.readVarUhShort();
         if(this.weaponDamageReceivedPercent < 0)
         {
            throw new Error("Forbidden value (" + this.weaponDamageReceivedPercent + ") on element of GameFightMinimalStats.weaponDamageReceivedPercent.");
         }
      }
      
      private function _spellDamageReceivedPercentFunc(input:ICustomDataInput) : void
      {
         this.spellDamageReceivedPercent = input.readVarUhShort();
         if(this.spellDamageReceivedPercent < 0)
         {
            throw new Error("Forbidden value (" + this.spellDamageReceivedPercent + ") on element of GameFightMinimalStats.spellDamageReceivedPercent.");
         }
      }
   }
}
