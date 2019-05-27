package com.ankamagames.dofus.logic.game.fight.types.castSpellManager
{
   import com.ankamagames.dofus.datacenter.spells.Spell;
   import com.ankamagames.dofus.datacenter.spells.SpellLevel;
   import com.ankamagames.dofus.internalDatacenter.spells.SpellWrapper;
   import com.ankamagames.dofus.logic.game.common.managers.PlayedCharacterManager;
   import com.ankamagames.dofus.logic.game.common.misc.SpellModificator;
   import com.ankamagames.dofus.logic.game.fight.types.SpellCastInFightManager;
   import com.ankamagames.dofus.network.enums.CharacterSpellModificationTypeEnum;
   import com.ankamagames.dofus.network.types.game.character.characteristic.CharacterCharacteristicsInformations;
   import com.ankamagames.dofus.network.types.game.character.characteristic.CharacterSpellModification;
   import com.ankamagames.jerakine.logger.Log;
   import com.ankamagames.jerakine.logger.Logger;
   import flash.utils.Dictionary;
   import flash.utils.getQualifiedClassName;
   
   public class SpellManager
   {
      
      protected static const _log:Logger = Log.getLogger(getQualifiedClassName(SpellManager));
       
      
      private var _spellId:uint;
      
      private var _spellLevel:uint;
      
      private var _lastCastTurn:int;
      
      private var _lastInitialCooldownReset:int;
      
      private var _castThisTurn:uint;
      
      private var _targetsThisTurn:Dictionary;
      
      private var _spellCastManager:SpellCastInFightManager;
      
      private var _castIntervalModificator:int;
      
      private var _castIntervalSetModificator:int;
      
      public function SpellManager(spellCastManager:SpellCastInFightManager, pSpellId:uint, pSpellLevel:uint)
      {
         super();
         this._spellCastManager = spellCastManager;
         this._spellId = pSpellId;
         this._spellLevel = pSpellLevel;
         this._targetsThisTurn = new Dictionary();
      }
      
      public function get lastCastTurn() : int
      {
         return this._lastCastTurn;
      }
      
      public function get numberCastThisTurn() : uint
      {
         return this._castThisTurn;
      }
      
      public function set spellLevel(pSpellLevel:uint) : void
      {
         this._spellLevel = pSpellLevel;
      }
      
      public function get spellLevel() : uint
      {
         return this._spellLevel;
      }
      
      public function get spell() : Spell
      {
         return Spell.getSpellById(this._spellId);
      }
      
      public function get spellLevelObject() : SpellLevel
      {
         return Spell.getSpellById(this._spellId).getSpellLevel(this._spellLevel);
      }
      
      public function cast(pTurn:int, pTarget:Array, pCountForCooldown:Boolean = true) : void
      {
         var target:Number = NaN;
         this._castIntervalModificator = this._castIntervalSetModificator = 0;
         this._lastCastTurn = pTurn;
         for each(target in pTarget)
         {
            if(this._targetsThisTurn[target] == null)
            {
               this._targetsThisTurn[target] = 0;
            }
            this._targetsThisTurn[target] = this._targetsThisTurn[target] + 1;
         }
         if(pCountForCooldown)
         {
            this._castThisTurn++;
         }
         this.updateSpellWrapper();
      }
      
      public function resetInitialCooldown(pTurn:int) : void
      {
         this._lastInitialCooldownReset = pTurn;
         this.updateSpellWrapper();
      }
      
      public function getCastOnEntity(pEntityId:Number) : uint
      {
         if(this._targetsThisTurn[pEntityId] == null)
         {
            return 0;
         }
         return this._targetsThisTurn[pEntityId];
      }
      
      public function newTurn() : void
      {
         this._castThisTurn = 0;
         this._targetsThisTurn = new Dictionary();
         this.updateSpellWrapper();
      }
      
      public function get cooldown() : int
      {
         var spellModification:CharacterSpellModification = null;
         var interval:int = 0;
         var castIntervalModificator:int = 0;
         var castIntervalSetModificator:int = 0;
         var cooldown:int = 0;
         var castIntervalBonus:int = 0;
         var spell:Spell = Spell.getSpellById(this._spellId);
         var spellLevel:SpellLevel = spell.getSpellLevel(this._spellLevel);
         var spellModifs:SpellModificator = new SpellModificator();
         var characteristics:CharacterCharacteristicsInformations = PlayedCharacterManager.getInstance().characteristics;
         for each(spellModification in characteristics.spellModifications)
         {
            if(spellModification.spellId == this._spellId)
            {
               switch(spellModification.modificationType)
               {
                  case CharacterSpellModificationTypeEnum.CAST_INTERVAL:
                     spellModifs.castInterval = spellModification.value;
                     continue;
                  case CharacterSpellModificationTypeEnum.CAST_INTERVAL_SET:
                     spellModifs.castIntervalSet = spellModification.value;
                     continue;
                  default:
                     continue;
               }
            }
            else
            {
               continue;
            }
         }
         castIntervalModificator = spellModifs.getTotalBonus(spellModifs.castInterval);
         castIntervalSetModificator = spellModifs.getTotalBonus(spellModifs.castIntervalSet);
         if(castIntervalModificator)
         {
            this._castIntervalModificator = castIntervalModificator;
         }
         else
         {
            castIntervalModificator = this._castIntervalModificator;
         }
         if(castIntervalSetModificator)
         {
            this._castIntervalSetModificator = castIntervalSetModificator;
         }
         else
         {
            castIntervalSetModificator = this._castIntervalSetModificator;
         }
         if(castIntervalSetModificator)
         {
            interval = -castIntervalModificator + castIntervalSetModificator;
         }
         else
         {
            castIntervalBonus = castIntervalModificator;
            interval = spellLevel.minCastInterval - (castIntervalBonus < 0?0:castIntervalBonus);
         }
         if(interval == 63)
         {
            return 63;
         }
         var initialCooldown:int = this._lastInitialCooldownReset + spellLevel.initialCooldown - this._spellCastManager.currentTurn;
         if(this._lastCastTurn >= this._lastInitialCooldownReset + spellLevel.initialCooldown || spellLevel.initialCooldown == 0)
         {
            cooldown = interval + this._lastCastTurn - this._spellCastManager.currentTurn;
         }
         else
         {
            cooldown = initialCooldown;
         }
         if(cooldown <= 0)
         {
            cooldown = 0;
         }
         return cooldown;
      }
      
      public function forceCooldown(cooldown:int) : void
      {
         var spell:Spell = Spell.getSpellById(this._spellId);
         var spellL:SpellLevel = spell.getSpellLevel(this._spellLevel);
         this._lastCastTurn = cooldown + this._spellCastManager.currentTurn - spellL.minCastInterval;
         var spellW:SpellWrapper = SpellWrapper.getSpellWrapperById(this._spellId,this._spellCastManager.entityId);
         spellW.actualCooldown = cooldown;
      }
      
      public function forceLastCastTurn(pLastCastTurn:int, reallyForceNoKidding:Boolean = false) : void
      {
         this._lastCastTurn = pLastCastTurn;
         this.updateSpellWrapper(reallyForceNoKidding);
      }
      
      private function updateSpellWrapper(forceLastCastTurn:Boolean = false) : void
      {
         var spellW:SpellWrapper = SpellWrapper.getSpellWrapperById(this._spellId,this._spellCastManager.entityId);
         var spell:Spell = Spell.getSpellById(this._spellId);
         var spellLevel:SpellLevel = spell.getSpellLevel(this._spellLevel);
         if(spellW && spellW.actualCooldown != 63)
         {
            spellW.actualCooldown = this.cooldown;
         }
      }
   }
}
