package com.ankamagames.dofus.logic.game.fight.frames.Preview
{
   import com.ankamagames.dofus.datacenter.monsters.Monster;
   import com.ankamagames.dofus.datacenter.monsters.MonsterGrade;
   import com.ankamagames.dofus.kernel.Kernel;
   import com.ankamagames.dofus.logic.game.fight.frames.FightContextFrame;
   import com.ankamagames.dofus.logic.game.fight.managers.CurrentPlayedFighterManager;
   import com.ankamagames.dofus.network.enums.CharacterSpellModificationTypeEnum;
   import com.ankamagames.dofus.network.types.game.character.characteristic.CharacterBaseCharacteristic;
   import com.ankamagames.dofus.network.types.game.character.characteristic.CharacterCharacteristicsInformations;
   import com.ankamagames.dofus.network.types.game.character.characteristic.CharacterSpellModification;
   import com.ankamagames.dofus.network.types.game.context.fight.GameFightCharacterInformations;
   import com.ankamagames.dofus.network.types.game.context.fight.GameFightFighterInformations;
   import com.ankamagames.dofus.network.types.game.context.fight.GameFightMonsterInformations;
   import damageCalculation.fighterManagement.IFighterData;
   import damageCalculation.tools.Const;
   import mapTools.MapTools;
   
   public class FighterDataTranslator implements IFighterData
   {
       
      
      private var _fighterInfos:GameFightFighterInformations;
      
      private var _id:Number;
      
      private var _monsterGrade:MonsterGrade = null;
      
      private var _monsterProperties:Monster = null;
      
      public function FighterDataTranslator(fighterInfos:GameFightFighterInformations, fighterId:Number)
      {
         var monsterInfos:GameFightMonsterInformations = null;
         var monster:Monster = null;
         super();
         this._fighterInfos = fighterInfos;
         this._id = fighterId;
         if(this._fighterInfos is GameFightMonsterInformations)
         {
            monsterInfos = this._fighterInfos as GameFightMonsterInformations;
            monster = Monster.getMonsterById(monsterInfos.creatureGenericId);
            this._monsterProperties = monster;
            this._monsterGrade = monster.getMonsterGrade(monsterInfos.creatureGrade);
         }
      }
      
      public static function totalPoint(c:CharacterBaseCharacteristic) : int
      {
         return c.base + c.additionnal + c.alignGiftBonus + c.objectsAndMountBonus;
      }
      
      public function getUsedPM() : int
      {
         return Math.max(0,this._fighterInfos.stats.maxMovementPoints - this._fighterInfos.stats.movementPoints);
      }
      
      public function isSummon() : Boolean
      {
         return this._fighterInfos.stats.summoned;
      }
      
      public function getSummonerId() : Number
      {
         return this._fighterInfos.stats.summoner;
      }
      
      public function getBreed() : int
      {
         if(this._fighterInfos is GameFightCharacterInformations)
         {
            return (this._fighterInfos as GameFightCharacterInformations).breed;
         }
         if(this._fighterInfos is GameFightMonsterInformations)
         {
            return (this._fighterInfos as GameFightMonsterInformations).creatureGenericId;
         }
         return -1;
      }
      
      public function getBaseCharacteristicValue(name:String) : int
      {
         var charStats:CharacterCharacteristicsInformations = null;
         var value:int = 0;
         var valueIsSet:Boolean = false;
         if(CurrentPlayedFighterManager.getInstance().currentFighterId == this._id && this._id != 0)
         {
            valueIsSet = true;
            charStats = CurrentPlayedFighterManager.getInstance().getCharacteristicsInformations();
            switch(name)
            {
               case Const.STRENGTH:
                  value = totalPoint(charStats.strength);
                  break;
               case Const.VITALITY:
                  value = totalPoint(charStats.vitality);
                  break;
               case Const.CHANCE:
                  value = totalPoint(charStats.chance);
                  break;
               case Const.AGILITY:
                  value = totalPoint(charStats.agility);
                  break;
               case Const.INTELLIGENCE:
                  value = totalPoint(charStats.intelligence);
                  break;
               case Const.WISDOM:
                  value = totalPoint(charStats.wisdom);
                  break;
               case Const.EARTH_DAMAGE_BONUS:
                  value = totalPoint(charStats.earthDamageBonus);
                  break;
               case Const.FIRE_DAMAGE_BONUS:
                  value = totalPoint(charStats.fireDamageBonus);
                  break;
               case Const.WATER_DAMAGE_BONUS:
                  value = totalPoint(charStats.waterDamageBonus);
                  break;
               case Const.AIR_DAMAGE_BONUS:
                  value = totalPoint(charStats.airDamageBonus);
                  break;
               case Const.NEUTRAL_DAMAGE_BONUS:
                  value = totalPoint(charStats.neutralDamageBonus);
                  break;
               case Const.DAMAGES_PERCENT:
                  value = totalPoint(charStats.damagesBonusPercent);
                  break;
               case Const.ALL_DAMAGES_BONUS:
                  value = totalPoint(charStats.allDamagesBonus);
                  break;
               case Const.WEAPON_DAMAGES_PERCENT:
                  value = totalPoint(charStats.weaponDamagesBonusPercent);
                  break;
               case Const.WEAPON_POWER:
                  value = 0;
                  break;
               case Const.DAMAGES_PERCENT_SPELL:
                  value = 0;
                  break;
               case Const.PUSH_DAMAGE_BONUS:
                  value = totalPoint(charStats.pushDamageBonus);
                  break;
               case Const.CRITICAL_DAMAGE_BONUS:
                  value = totalPoint(charStats.criticalDamageBonus);
                  break;
               case Const.CRITICAL_HIT:
                  value = totalPoint(charStats.criticalHit);
                  break;
               case Const.CRITICAL_MISS:
                  value = totalPoint(charStats.criticalMiss);
                  break;
               case Const.DEALT_DAMAGE_MULTIPLIER_MELEE:
                  value = totalPoint(charStats.meleeDamageDonePercent);
                  break;
               case Const.DEALT_DAMAGE_MULTIPLIER_DISTANCE:
                  value = totalPoint(charStats.rangedDamageDonePercent);
                  break;
               case Const.DEALT_DAMAGE_MULTIPLIER_SPELLS:
                  value = totalPoint(charStats.spellDamageDonePercent);
                  break;
               case Const.DEALT_DAMAGE_MULTIPLIER_WEAPON:
                  value = totalPoint(charStats.weaponDamageDonePercent);
                  break;
               case Const.HEAL_BONUS:
                  value = totalPoint(charStats.healBonus);
                  break;
               case Const.TRAP_DAMAGE_BONUS_PERCENT:
                  value = totalPoint(charStats.trapBonusPercent);
                  break;
               case Const.TRAP_DAMAGE_BONUS:
                  value = totalPoint(charStats.trapBonus);
                  break;
               case Const.GLYPH_POWER:
                  value = totalPoint(charStats.glyphBonusPercent);
                  break;
               case Const.RUNE_POWER:
                  value = totalPoint(charStats.runeBonusPercent);
                  break;
               case Const.MAX_SUMMONABLE_CREATURES:
                  value = totalPoint(charStats.summonableCreaturesBoost);
                  break;
               default:
                  valueIsSet = false;
            }
         }
         if(!valueIsSet && this._monsterGrade != null)
         {
            valueIsSet = true;
            switch(name)
            {
               case Const.STRENGTH:
                  value = this._monsterGrade.strength;
                  break;
               case Const.CHANCE:
                  value = this._monsterGrade.chance;
                  break;
               case Const.AGILITY:
                  value = this._monsterGrade.agility;
                  break;
               case Const.INTELLIGENCE:
                  value = this._monsterGrade.intelligence;
                  break;
               default:
                  valueIsSet = false;
            }
         }
         if(!valueIsSet)
         {
            switch(name)
            {
               case Const.MAX_LIFE:
                  value = this._fighterInfos.stats.maxLifePoints;
                  break;
               case Const.BASE_MAX_LIFE:
                  value = this._fighterInfos.stats.baseMaxLifePoints;
                  break;
               case Const.LIFE_POINTS:
                  value = this._fighterInfos.stats.lifePoints;
                  break;
               case Const.PERMANENT_DAMAGE:
                  value = this._fighterInfos.stats.permanentDamagePercent;
                  break;
               case Const.SHIELD:
                  value = 0;
                  break;
               case Const.ACTION_POINTS:
                  value = this._fighterInfos.stats.actionPoints;
                  break;
               case Const.MOVEMENT_POINTS:
                  value = this._fighterInfos.stats.movementPoints;
                  break;
               case Const.MAX_MOVEMENT_POINTS:
                  value = this._fighterInfos.stats.maxMovementPoints;
                  break;
               case Const.DODGE_PA_LOST_PROBABILITY:
                  value = this._fighterInfos.stats.dodgePALostProbability;
                  break;
               case Const.DODGE_PM_LOST_PROBABILITY:
                  value = this._fighterInfos.stats.dodgePMLostProbability;
                  break;
               case Const.EARTH_ELEMENT_RESIST_PERCENT:
                  value = this._fighterInfos.stats.earthElementResistPercent;
                  break;
               case Const.FIRE_ELEMENT_RESIST_PERCENT:
                  value = this._fighterInfos.stats.fireElementResistPercent;
                  break;
               case Const.WATER_ELEMENT_RESIST_PERCENT:
                  value = this._fighterInfos.stats.waterElementResistPercent;
                  break;
               case Const.AIR_ELEMENT_RESIST_PERCENT:
                  value = this._fighterInfos.stats.airElementResistPercent;
                  break;
               case Const.NEUTRAL_ELEMENT_RESIST_PERCENT:
                  value = this._fighterInfos.stats.neutralElementResistPercent;
                  break;
               case Const.EARTH_ELEMENT_REDUCTION:
                  value = this._fighterInfos.stats.earthElementReduction;
                  break;
               case Const.FIRE_ELEMENT_REDUCTION:
                  value = this._fighterInfos.stats.fireElementReduction;
                  break;
               case Const.WATER_ELEMENT_REDUCTION:
                  value = this._fighterInfos.stats.waterElementReduction;
                  break;
               case Const.AIR_ELEMENT_REDUCTION:
                  value = this._fighterInfos.stats.airElementReduction;
                  break;
               case Const.NEUTRAL_ELEMENT_REDUCTION:
                  value = this._fighterInfos.stats.neutralElementReduction;
                  break;
               case Const.PUSH_DAMAGE_REDUCTION:
                  value = this._fighterInfos.stats.pushDamageFixedResist;
                  break;
               case Const.CRITICAL_DAMAGE_REDUCTION:
                  value = this._fighterInfos.stats.criticalDamageFixedResist;
                  break;
               case Const.RESIST_PERCENT:
                  value = 0;
                  break;
               case Const.RECEIVED_DAMAGE_MULTIPLIER_MELEE:
                  value = this._fighterInfos.stats.meleeDamageReceivedPercent;
                  break;
               case Const.RECEIVED_DAMAGE_MULTIPLIER_DISTANCE:
                  value = this._fighterInfos.stats.rangedDamageReceivedPercent;
                  break;
               case Const.RECEIVED_DAMAGE_MULTIPLIER_SPELLS:
                  value = this._fighterInfos.stats.spellDamageReceivedPercent;
                  break;
               case Const.RECEIVED_DAMAGE_MULTIPLIER_WEAPON:
                  value = this._fighterInfos.stats.weaponDamageReceivedPercent;
                  break;
               case Const.INCOMING_DAMAGE_PERCENT_MULTIPLICATOR:
                  value = 0;
                  break;
               case Const.INCOMING_DAMAGE_HEAL_PERCENT_MULTIPLICATOR:
                  value = 0;
                  break;
               case Const.DEALT_DAMAGE_MULTIPLIER:
                  value = 0;
                  break;
               case Const.REFLECT_DAMAGE:
                  value = this._fighterInfos.stats.fixedDamageReflection;
                  break;
               case Const.INVISIBILITY:
                  value = this._fighterInfos.stats.invisibilityState;
            }
         }
         return value;
      }
      
      public function resolveDodge() : int
      {
         return -1;
      }
      
      public function getItemSpellDamageModification(spellId:int) : int
      {
         var spellModification:CharacterSpellModification = null;
         var totalModif:int = 0;
         var characteristics:CharacterCharacteristicsInformations = CurrentPlayedFighterManager.getInstance().getCharacteristicsInformations();
         if(characteristics)
         {
            for each(spellModification in characteristics.spellModifications)
            {
               if(spellModification.spellId == spellId && spellModification.modificationType == CharacterSpellModificationTypeEnum.DAMAGE)
               {
                  totalModif = totalModif + totalPoint(spellModification.value);
               }
            }
         }
         return totalModif;
      }
      
      public function getItemSpellBaseDamageModification(spellId:int) : int
      {
         var spellModification:CharacterSpellModification = null;
         var totalModif:int = 0;
         var characteristics:CharacterCharacteristicsInformations = CurrentPlayedFighterManager.getInstance().getCharacteristicsInformations();
         if(characteristics)
         {
            for each(spellModification in characteristics.spellModifications)
            {
               if(spellModification.spellId == spellId && spellModification.modificationType == CharacterSpellModificationTypeEnum.BASE_DAMAGE)
               {
                  totalModif = totalModif + totalPoint(spellModification.value);
               }
            }
         }
         return totalModif;
      }
      
      public function canBreedSwitchPos() : Boolean
      {
         return !(this._monsterProperties != null && !this._monsterProperties.canSwitchPos);
      }
      
      public function canBreedUsePortals() : Boolean
      {
         return !(this._monsterProperties != null && !this._monsterProperties.canUsePortal);
      }
      
      public function canBreedBePushed() : Boolean
      {
         return !(this._monsterProperties != null && !this._monsterProperties.canBePushed);
      }
      
      public function canBreedBeCarried() : Boolean
      {
         return !(this._monsterProperties != null && !this._monsterProperties.canBeCarried);
      }
      
      public function getStartedPositionCell() : int
      {
         return this._fighterInfos.disposition.cellId;
      }
      
      public function getTurnBeginPosition() : int
      {
         return (Kernel.getWorker().getFrame(FightContextFrame) as FightContextFrame).getFighterRoundStartPosition(this._id);
      }
      
      public function getPreviousPosition() : int
      {
         var fcf:FightContextFrame = Kernel.getWorker().getFrame(FightContextFrame) as FightContextFrame;
         if(fcf != null && fcf.getFighterPreviousPosition(this._id) != MapTools.INVALID_CELL_ID)
         {
            return fcf.getFighterPreviousPosition(this._id);
         }
         if(this._fighterInfos.previousPositions.length > 0)
         {
            return this._fighterInfos.previousPositions[0];
         }
         return MapTools.INVALID_CELL_ID;
      }
   }
}
