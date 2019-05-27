package com.ankamagames.dofus.logic.game.fight.types
{
   import com.ankamagames.dofus.datacenter.effects.Effect;
   import com.ankamagames.dofus.datacenter.effects.instances.EffectInstanceDice;
   import com.ankamagames.dofus.internalDatacenter.spells.SpellWrapper;
   import com.ankamagames.dofus.logic.game.fight.frames.FightEntitiesFrame;
   import com.ankamagames.dofus.logic.game.fight.frames.FightSpellCastFrame;
   import com.ankamagames.dofus.logic.game.fight.managers.CurrentPlayedFighterManager;
   import com.ankamagames.dofus.misc.utils.GameDebugManager;
   import com.ankamagames.dofus.network.types.game.actions.fight.FightTemporaryBoostEffect;
   import com.ankamagames.dofus.network.types.game.character.characteristic.CharacterBaseCharacteristic;
   import com.ankamagames.dofus.network.types.game.character.characteristic.CharacterCharacteristicsInformations;
   import com.ankamagames.dofus.network.types.game.context.fight.GameFightFighterInformations;
   import com.ankamagames.jerakine.logger.Log;
   import com.ankamagames.jerakine.logger.Logger;
   import flash.utils.getQualifiedClassName;
   import tools.ActionIdHelper;
   
   public class StatBuff extends BasicBuff
   {
      
      protected static const _log:Logger = Log.getLogger(getQualifiedClassName(StatBuff));
       
      
      private var _statName:String;
      
      private var _isABoost:Boolean;
      
      private var _zeroDiff:int;
      
      public var isRecent:Boolean;
      
      public function StatBuff(effect:FightTemporaryBoostEffect = null, castingSpell:CastingSpell = null, actionId:int = 0, isRecent:Boolean = false)
      {
         if(effect)
         {
            super(effect,castingSpell,actionId,effect.delta,null,null);
            this._statName = ActionIdHelper.getActionIdStatName(actionId);
            this._isABoost = ActionIdHelper.isPositiveBoost(actionId);
            this.isRecent = isRecent;
         }
      }
      
      override public function get type() : String
      {
         return "StatBuff";
      }
      
      public function get statName() : String
      {
         return this._statName;
      }
      
      public function get delta() : int
      {
         if(_effect is EffectInstanceDice)
         {
            return !!this._isABoost?int(EffectInstanceDice(_effect).diceNum):int(-EffectInstanceDice(_effect).diceNum);
         }
         return 0;
      }
      
      public function get zeroDiff() : int
      {
         return this._zeroDiff;
      }
      
      override public function onApplied() : void
      {
         var tempValue:int = 0;
         var statsCount:int = 0;
         var i:int = 0;
         if(!this._statName)
         {
            return;
         }
         if(GameDebugManager.getInstance().buffsDebugActivated)
         {
            _log.debug("[BUFFS DEBUG] Buff " + this.uid + " en cours d\'application sur la stat " + this._statName + " (delta " + this.delta + ")");
         }
         var statNamesForLog:Array = [];
         var oldValuesForLog:Array = [];
         var newValuesForLog:Array = [];
         var targetCaracs:CharacterCharacteristicsInformations = CurrentPlayedFighterManager.getInstance().getCharacteristicsInformations(targetId);
         if(targetCaracs)
         {
            if(targetCaracs.hasOwnProperty(this._statName))
            {
               statNamesForLog.push(this._statName + ".contextModif");
               oldValuesForLog.push(CharacterBaseCharacteristic(targetCaracs[this._statName]).contextModif);
               CharacterBaseCharacteristic(targetCaracs[this._statName]).contextModif = CharacterBaseCharacteristic(targetCaracs[this._statName]).contextModif + this.delta;
               newValuesForLog.push(CharacterBaseCharacteristic(targetCaracs[this._statName]).contextModif);
            }
            switch(this._statName)
            {
               case "vitality":
                  statNamesForLog.push("maxLifePoints");
                  oldValuesForLog.push(targetCaracs.maxLifePoints);
                  tempValue = targetCaracs.maxLifePoints;
                  if(tempValue + this.delta < 0)
                  {
                     targetCaracs.maxLifePoints = 0;
                  }
                  else
                  {
                     targetCaracs.maxLifePoints = targetCaracs.maxLifePoints + this.delta;
                  }
                  newValuesForLog.push(targetCaracs.maxLifePoints);
                  statNamesForLog.push("lifePoints");
                  oldValuesForLog.push(targetCaracs.lifePoints);
                  tempValue = targetCaracs.lifePoints;
                  if(tempValue + this.delta < 0)
                  {
                     targetCaracs.lifePoints = 0;
                  }
                  else
                  {
                     targetCaracs.lifePoints = targetCaracs.lifePoints + this.delta;
                  }
                  newValuesForLog.push(targetCaracs.lifePoints);
                  break;
               case "lifePoints":
               case "lifePointsMalus":
                  statNamesForLog.push("lifePoints");
                  oldValuesForLog.push(targetCaracs.lifePoints);
                  tempValue = targetCaracs.lifePoints;
                  if(tempValue + this.delta < 0)
                  {
                     targetCaracs.lifePoints = 0;
                  }
                  else
                  {
                     targetCaracs.lifePoints = targetCaracs.lifePoints + this.delta;
                  }
                  newValuesForLog.push(targetCaracs.lifePoints);
                  break;
               case "movementPoints":
                  statNamesForLog.push("movementPointsCurrent");
                  oldValuesForLog.push(targetCaracs.movementPointsCurrent);
                  targetCaracs.movementPointsCurrent = targetCaracs.movementPointsCurrent + this.delta;
                  newValuesForLog.push(targetCaracs.movementPointsCurrent);
                  break;
               case "actionPoints":
                  statNamesForLog.push("actionPointsCurrent");
                  oldValuesForLog.push(targetCaracs.actionPointsCurrent);
                  targetCaracs.actionPointsCurrent = targetCaracs.actionPointsCurrent + this.delta;
                  newValuesForLog.push(targetCaracs.actionPointsCurrent);
                  break;
               case "summonableCreaturesBoost":
                  SpellWrapper.refreshAllPlayerSpellHolder(targetId);
                  break;
               case "range":
                  FightSpellCastFrame.updateRangeAndTarget();
                  break;
               case "globalResistPercentBonus":
               case "globalResistPercentMalus":
                  targetCaracs.neutralElementResistPercent.contextModif = targetCaracs.neutralElementResistPercent.contextModif + this.delta;
                  targetCaracs.airElementResistPercent.contextModif = targetCaracs.airElementResistPercent.contextModif + this.delta;
                  targetCaracs.waterElementResistPercent.contextModif = targetCaracs.waterElementResistPercent.contextModif + this.delta;
                  targetCaracs.earthElementResistPercent.contextModif = targetCaracs.earthElementResistPercent.contextModif + this.delta;
                  targetCaracs.fireElementResistPercent.contextModif = targetCaracs.fireElementResistPercent.contextModif + this.delta;
            }
         }
         var infos:GameFightFighterInformations = FightEntitiesFrame.getCurrentInstance().getEntityInfos(targetId) as GameFightFighterInformations;
         switch(this._statName)
         {
            case "vitality":
               statNamesForLog.push("lifePoints");
               statNamesForLog.push("maxLifePoints");
               oldValuesForLog.push(infos.stats["lifePoints"]);
               oldValuesForLog.push(infos.stats["maxLifePoints"]);
               infos.stats["lifePoints"] = infos.stats["lifePoints"] + this.delta;
               infos.stats["maxLifePoints"] = infos.stats["maxLifePoints"] + this.delta;
               newValuesForLog.push(infos.stats["lifePoints"]);
               newValuesForLog.push(infos.stats["maxLifePoints"]);
               break;
            case "lifePointsMalus":
               statNamesForLog.push("lifePoints");
               oldValuesForLog.push(infos.stats["lifePoints"]);
               infos.stats["lifePoints"] = infos.stats["lifePoints"] + this.delta;
               newValuesForLog.push(infos.stats["lifePoints"]);
               break;
            case "lifePoints":
            case "dodgePALostProbability":
            case "dodgePMLostProbability":
               statNamesForLog.push(this._statName);
               oldValuesForLog.push(infos.stats[this._statName]);
               tempValue = infos.stats[this._statName];
               if(tempValue + this.delta < 0)
               {
                  infos.stats[this._statName] = 0;
               }
               else
               {
                  infos.stats[this._statName] = infos.stats[this._statName] + this.delta;
               }
               newValuesForLog.push(infos.stats[this._statName]);
               break;
            case "agility":
               statNamesForLog.push("tackleEvade");
               statNamesForLog.push("tackleBlock");
               oldValuesForLog.push(infos.stats["tackleEvade"]);
               oldValuesForLog.push(infos.stats["tackleBlock"]);
               infos.stats["tackleEvade"] = infos.stats["tackleEvade"] + this.delta / 10;
               infos.stats["tackleBlock"] = infos.stats["tackleBlock"] + this.delta / 10;
               newValuesForLog.push(infos.stats["tackleEvade"]);
               newValuesForLog.push(infos.stats["tackleBlock"]);
               break;
            case "globalResistPercentBonus":
            case "globalResistPercentMalus":
               statNamesForLog.push("neutralElementResistPercent");
               statNamesForLog.push("airElementResistPercent");
               statNamesForLog.push("waterElementResistPercent");
               statNamesForLog.push("earthElementResistPercent");
               statNamesForLog.push("fireElementResistPercent");
               oldValuesForLog.push(infos.stats["neutralElementResistPercent"]);
               oldValuesForLog.push(infos.stats["airElementResistPercent"]);
               oldValuesForLog.push(infos.stats["waterElementResistPercent"]);
               oldValuesForLog.push(infos.stats["earthElementResistPercent"]);
               oldValuesForLog.push(infos.stats["fireElementResistPercent"]);
               infos.stats["neutralElementResistPercent"] = infos.stats["neutralElementResistPercent"] + this.delta;
               infos.stats["airElementResistPercent"] = infos.stats["airElementResistPercent"] + this.delta;
               infos.stats["waterElementResistPercent"] = infos.stats["waterElementResistPercent"] + this.delta;
               infos.stats["earthElementResistPercent"] = infos.stats["earthElementResistPercent"] + this.delta;
               infos.stats["fireElementResistPercent"] = infos.stats["fireElementResistPercent"] + this.delta;
               newValuesForLog.push(infos.stats["neutralElementResistPercent"]);
               newValuesForLog.push(infos.stats["airElementResistPercent"]);
               newValuesForLog.push(infos.stats["waterElementResistPercent"]);
               newValuesForLog.push(infos.stats["earthElementResistPercent"]);
               newValuesForLog.push(infos.stats["fireElementResistPercent"]);
               break;
            case "actionPoints":
               statNamesForLog.push("actionPoints");
               statNamesForLog.push("maxActionPoints");
               oldValuesForLog.push(infos.stats["actionPoints"]);
               oldValuesForLog.push(infos.stats["maxActionPoints"]);
               infos.stats["actionPoints"] = infos.stats["actionPoints"] + this.delta;
               infos.stats["maxActionPoints"] = infos.stats["maxActionPoints"] + this.delta;
               newValuesForLog.push(infos.stats["actionPoints"]);
               newValuesForLog.push(infos.stats["maxActionPoints"]);
               break;
            case "movementPoints":
               statNamesForLog.push("movementPoints");
               statNamesForLog.push("maxMovementPoints");
               oldValuesForLog.push(infos.stats["movementPoints"]);
               oldValuesForLog.push(infos.stats["maxMovementPoints"]);
               infos.stats["movementPoints"] = infos.stats["movementPoints"] + this.delta;
               infos.stats["maxMovementPoints"] = infos.stats["maxMovementPoints"] + this.delta;
               newValuesForLog.push(infos.stats["movementPoints"]);
               newValuesForLog.push(infos.stats["maxMovementPoints"]);
               break;
            case "tackleBlock":
            case "tackleEvade":
               statNamesForLog.push(this._statName);
               oldValuesForLog.push(infos.stats[this._statName]);
               if(infos.stats[this._statName] + this.delta < 0)
               {
                  this._zeroDiff = infos.stats[this._statName] + this.delta;
                  infos.stats[this._statName] = 0;
               }
               else
               {
                  infos.stats[this._statName] = infos.stats[this._statName] + this.delta;
               }
               newValuesForLog.push(infos.stats[this._statName]);
               break;
            case "invisibilityState":
               break;
            default:
               if(infos)
               {
                  if(infos.stats.hasOwnProperty(this._statName))
                  {
                     statNamesForLog.push(this._statName);
                     oldValuesForLog.push(infos.stats[this._statName]);
                     infos.stats[this._statName] = infos.stats[this._statName] + this.delta;
                     newValuesForLog.push(infos.stats[this._statName]);
                     break;
                  }
                  break;
               }
               _log.fatal("ATTENTION, le serveur essaye de buffer une entité qui n\'existe plus ! id=" + targetId);
               break;
         }
         if(GameDebugManager.getInstance().buffsDebugActivated)
         {
            statsCount = statNamesForLog.length;
            for(i = 0; i < statsCount; )
            {
               _log.debug("[BUFFS DEBUG]   - Stat " + statNamesForLog[i] + " de " + targetId + " modifiée de " + oldValuesForLog[i] + " à " + newValuesForLog[i]);
               i++;
            }
         }
         super.onApplied();
      }
      
      override public function onRemoved() : void
      {
         var effect:Effect = null;
         if(!_removed)
         {
            effect = Effect.getEffectById(actionId);
            if(GameDebugManager.getInstance().buffsDebugActivated)
            {
               _log.debug("[BUFFS DEBUG] Buff " + this.uid + " en cours de retrait,  decrementation de la stat associée ? " + !effect.active);
            }
            if(!effect.active)
            {
               this.decrementStats();
            }
         }
         super.onRemoved();
      }
      
      override public function onDisabled() : void
      {
         var effect:Effect = null;
         if(!_disabled)
         {
            effect = Effect.getEffectById(actionId);
            if(GameDebugManager.getInstance().buffsDebugActivated)
            {
               _log.debug("[BUFFS DEBUG] Buff " + this.uid + " en cours de desactivation,  decrementation de la stat associée ? " + effect.active);
            }
            if(effect.active)
            {
               this.decrementStats();
            }
         }
         super.onDisabled();
      }
      
      override public function onReenable() : void
      {
         super.onReenable();
         this.onApplied();
      }
      
      private function decrementStats() : void
      {
         var i:int = 0;
         var tempValue:int = 0;
         var zeroDiff:int = 0;
         var stackLen:int = 0;
         var statsCount:int = 0;
         if(!this._statName)
         {
            return;
         }
         if(GameDebugManager.getInstance().buffsDebugActivated)
         {
            _log.debug("[BUFFS DEBUG]   Décrementation de la stat " + this._statName + " (delta " + this.delta + ")");
         }
         var statNamesForLog:Array = [];
         var oldValuesForLog:Array = [];
         var newValuesForLog:Array = [];
         var targetCaracs:CharacterCharacteristicsInformations = CurrentPlayedFighterManager.getInstance().getCharacteristicsInformations(targetId);
         if(targetCaracs)
         {
            if(targetCaracs.hasOwnProperty(this._statName))
            {
               statNamesForLog.push(this._statName + ".contextModif");
               oldValuesForLog.push(CharacterBaseCharacteristic(targetCaracs[this._statName]).contextModif);
               CharacterBaseCharacteristic(targetCaracs[this._statName]).contextModif = CharacterBaseCharacteristic(targetCaracs[this._statName]).contextModif - this.delta;
               newValuesForLog.push(CharacterBaseCharacteristic(targetCaracs[this._statName]).contextModif);
            }
            switch(this._statName)
            {
               case "vitality":
                  statNamesForLog.push("maxLifePoints");
                  oldValuesForLog.push(targetCaracs.maxLifePoints);
                  targetCaracs.maxLifePoints = targetCaracs.maxLifePoints - this.delta;
                  newValuesForLog.push(targetCaracs.maxLifePoints);
                  statNamesForLog.push("lifePoints");
                  oldValuesForLog.push(targetCaracs.lifePoints);
                  if(targetCaracs.lifePoints > this.delta)
                  {
                     targetCaracs.lifePoints = targetCaracs.lifePoints - this.delta;
                  }
                  else
                  {
                     targetCaracs.lifePoints = 0;
                  }
                  newValuesForLog.push(targetCaracs.lifePoints);
                  break;
               case "lifePoints":
               case "lifePointsMalus":
                  statNamesForLog.push("lifePoints");
                  oldValuesForLog.push(targetCaracs.lifePoints);
                  if(targetCaracs.lifePoints > this.delta)
                  {
                     if(targetCaracs.maxLifePoints >= targetCaracs.lifePoints - this.delta)
                     {
                        targetCaracs.lifePoints = targetCaracs.lifePoints - this.delta;
                     }
                     else
                     {
                        targetCaracs.lifePoints = targetCaracs.maxLifePoints;
                     }
                  }
                  else
                  {
                     targetCaracs.lifePoints = 0;
                  }
                  newValuesForLog.push(targetCaracs.lifePoints);
                  break;
               case "movementPoints":
                  statNamesForLog.push("movementPointsCurrent");
                  oldValuesForLog.push(targetCaracs.movementPointsCurrent);
                  targetCaracs.movementPointsCurrent = targetCaracs.movementPointsCurrent - this.delta;
                  newValuesForLog.push(targetCaracs.movementPointsCurrent);
                  break;
               case "actionPoints":
                  statNamesForLog.push("actionPointsCurrent");
                  oldValuesForLog.push(targetCaracs.actionPointsCurrent);
                  targetCaracs.actionPointsCurrent = targetCaracs.actionPointsCurrent - this.delta;
                  newValuesForLog.push(targetCaracs.actionPointsCurrent);
                  break;
               case "globalResistPercentBonus":
               case "globalResistPercentMalus":
                  targetCaracs.neutralElementResistPercent.contextModif = targetCaracs.neutralElementResistPercent.contextModif - this.delta;
                  targetCaracs.airElementResistPercent.contextModif = targetCaracs.airElementResistPercent.contextModif - this.delta;
                  targetCaracs.waterElementResistPercent.contextModif = targetCaracs.waterElementResistPercent.contextModif - this.delta;
                  targetCaracs.earthElementResistPercent.contextModif = targetCaracs.earthElementResistPercent.contextModif - this.delta;
                  targetCaracs.fireElementResistPercent.contextModif = targetCaracs.fireElementResistPercent.contextModif - this.delta;
            }
         }
         var infos:GameFightFighterInformations = FightEntitiesFrame.getCurrentInstance().getEntityInfos(targetId) as GameFightFighterInformations;
         switch(this._statName)
         {
            case "vitality":
               statNamesForLog.push("lifePoints");
               statNamesForLog.push("maxLifePoints");
               oldValuesForLog.push(infos.stats["lifePoints"]);
               oldValuesForLog.push(infos.stats["maxLifePoints"]);
               infos.stats["lifePoints"] = infos.stats["lifePoints"] - this.delta;
               infos.stats["maxLifePoints"] = infos.stats["maxLifePoints"] - this.delta;
               newValuesForLog.push(infos.stats["lifePoints"]);
               newValuesForLog.push(infos.stats["maxLifePoints"]);
               break;
            case "lifePointsMalus":
               statNamesForLog.push("lifePoints");
               oldValuesForLog.push(infos.stats["lifePoints"]);
               infos.stats["lifePoints"] = infos.stats["lifePoints"] - this.delta;
               if(infos.stats["lifePoints"] > infos.stats["maxLifePoints"])
               {
                  infos.stats["lifePoints"] = infos.stats["maxLifePoints"];
               }
               newValuesForLog.push(infos.stats["lifePoints"]);
               break;
            case "shieldPoints":
               statNamesForLog.push(this._statName);
               oldValuesForLog.push(infos.stats[this._statName]);
               tempValue = infos.stats[this._statName];
               infos.stats[this._statName] = infos.stats[this._statName] - this.delta;
               newValuesForLog.push(infos.stats[this._statName]);
               break;
            case "lifePoints":
            case "dodgePALostProbability":
            case "dodgePMLostProbability":
               statNamesForLog.push(this._statName);
               oldValuesForLog.push(infos.stats[this._statName]);
               tempValue = infos.stats[this._statName];
               if(tempValue - this.delta < 0)
               {
                  infos.stats[this._statName] = 0;
               }
               else
               {
                  infos.stats[this._statName] = infos.stats[this._statName] - this.delta;
               }
               newValuesForLog.push(infos.stats[this._statName]);
               break;
            case "agility":
               statNamesForLog.push("tackleEvade");
               statNamesForLog.push("tackleBlock");
               oldValuesForLog.push(infos.stats["tackleEvade"]);
               oldValuesForLog.push(infos.stats["tackleBlock"]);
               infos.stats["tackleEvade"] = infos.stats["tackleEvade"] - this.delta / 10;
               infos.stats["tackleBlock"] = infos.stats["tackleBlock"] - this.delta / 10;
               newValuesForLog.push(infos.stats["tackleEvade"]);
               newValuesForLog.push(infos.stats["tackleBlock"]);
               break;
            case "globalResistPercentBonus":
            case "globalResistPercentMalus":
               statNamesForLog.push("neutralElementResistPercent");
               statNamesForLog.push("airElementResistPercent");
               statNamesForLog.push("waterElementResistPercent");
               statNamesForLog.push("earthElementResistPercent");
               statNamesForLog.push("fireElementResistPercent");
               oldValuesForLog.push(infos.stats["neutralElementResistPercent"]);
               oldValuesForLog.push(infos.stats["airElementResistPercent"]);
               oldValuesForLog.push(infos.stats["waterElementResistPercent"]);
               oldValuesForLog.push(infos.stats["earthElementResistPercent"]);
               oldValuesForLog.push(infos.stats["fireElementResistPercent"]);
               infos.stats["neutralElementResistPercent"] = infos.stats["neutralElementResistPercent"] - this.delta;
               infos.stats["airElementResistPercent"] = infos.stats["airElementResistPercent"] - this.delta;
               infos.stats["waterElementResistPercent"] = infos.stats["waterElementResistPercent"] - this.delta;
               infos.stats["earthElementResistPercent"] = infos.stats["earthElementResistPercent"] - this.delta;
               infos.stats["fireElementResistPercent"] = infos.stats["fireElementResistPercent"] - this.delta;
               newValuesForLog.push(infos.stats["neutralElementResistPercent"]);
               newValuesForLog.push(infos.stats["airElementResistPercent"]);
               newValuesForLog.push(infos.stats["waterElementResistPercent"]);
               newValuesForLog.push(infos.stats["earthElementResistPercent"]);
               newValuesForLog.push(infos.stats["fireElementResistPercent"]);
               break;
            case "actionPoints":
               statNamesForLog.push("actionPoints");
               statNamesForLog.push("maxActionPoints");
               oldValuesForLog.push(infos.stats["actionPoints"]);
               oldValuesForLog.push(infos.stats["maxActionPoints"]);
               infos.stats["actionPoints"] = infos.stats["actionPoints"] - this.delta;
               infos.stats["maxActionPoints"] = infos.stats["maxActionPoints"] - this.delta;
               newValuesForLog.push(infos.stats["actionPoints"]);
               newValuesForLog.push(infos.stats["maxActionPoints"]);
               break;
            case "movementPoints":
               statNamesForLog.push("movementPoints");
               statNamesForLog.push("maxMovementPoints");
               oldValuesForLog.push(infos.stats["movementPoints"]);
               oldValuesForLog.push(infos.stats["maxMovementPoints"]);
               infos.stats["movementPoints"] = infos.stats["movementPoints"] - this.delta;
               infos.stats["maxMovementPoints"] = infos.stats["maxMovementPoints"] - this.delta;
               newValuesForLog.push(infos.stats["movementPoints"]);
               newValuesForLog.push(infos.stats["maxMovementPoints"]);
               break;
            case "tackleBlock":
            case "tackleEvade":
               statNamesForLog.push(this._statName);
               oldValuesForLog.push(infos.stats[this._statName]);
               if(infos.stats[this._statName] == 0)
               {
                  zeroDiff = this._zeroDiff;
                  if(stack)
                  {
                     stackLen = stack.length;
                     for(i = 1; i < stackLen; i++)
                     {
                        zeroDiff = zeroDiff + (stack[i] as StatBuff).zeroDiff;
                     }
                  }
                  infos.stats[this._statName] = infos.stats[this._statName] - this.delta + zeroDiff;
               }
               else
               {
                  infos.stats[this._statName] = infos.stats[this._statName] - this.delta;
               }
               newValuesForLog.push(infos.stats[this._statName]);
               break;
            case "invisibilityState":
               break;
            default:
               if(infos)
               {
                  if(infos.stats.hasOwnProperty(this._statName))
                  {
                     statNamesForLog.push(this._statName);
                     oldValuesForLog.push(infos.stats[this._statName]);
                     infos.stats[this._statName] = infos.stats[this._statName] - this.delta;
                     newValuesForLog.push(infos.stats[this._statName]);
                     break;
                  }
                  _log.fatal("On essaye de supprimer une stat non prise en compte : " + this._statName);
                  break;
               }
               _log.fatal("ATTENTION, Le serveur essaye de buffer une entité qui n\'existe plus ! id=" + targetId);
               break;
         }
         if(GameDebugManager.getInstance().buffsDebugActivated)
         {
            statsCount = statNamesForLog.length;
            for(i = 0; i < statsCount; )
            {
               _log.debug("[BUFFS DEBUG]   - Stat " + statNamesForLog[i] + " de " + targetId + " modifiée de " + oldValuesForLog[i] + " à " + newValuesForLog[i]);
               i++;
            }
         }
      }
      
      override public function clone(id:int = 0) : BasicBuff
      {
         var sb:StatBuff = new StatBuff();
         sb._statName = this._statName;
         sb._isABoost = this._isABoost;
         sb.id = uid;
         sb.uid = uid;
         sb.dataUid = dataUid;
         sb.actionId = actionId;
         sb.targetId = targetId;
         sb.castingSpell = castingSpell;
         sb.duration = duration;
         sb.dispelable = dispelable;
         sb.source = source;
         sb.aliveSource = aliveSource;
         sb.sourceJustReaffected = sourceJustReaffected;
         sb.parentBoostUid = parentBoostUid;
         sb.initParam(param1,param2,param3);
         return sb;
      }
   }
}
