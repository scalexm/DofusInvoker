package com.ankamagames.dofus.logic.game.fight.steps
{
   import com.ankamagames.dofus.internalDatacenter.spells.SpellWrapper;
   import com.ankamagames.dofus.kernel.Kernel;
   import com.ankamagames.dofus.logic.game.common.frames.PlayedCharacterUpdatesFrame;
   import com.ankamagames.dofus.logic.game.common.managers.PlayedCharacterManager;
   import com.ankamagames.dofus.logic.game.fight.managers.CurrentPlayedFighterManager;
   import com.ankamagames.dofus.misc.utils.GameDebugManager;
   import com.ankamagames.dofus.network.types.game.character.alignment.ActorExtendedAlignmentInformations;
   import com.ankamagames.dofus.network.types.game.character.characteristic.CharacterBaseCharacteristic;
   import com.ankamagames.dofus.network.types.game.character.characteristic.CharacterCharacteristicsInformations;
   import com.ankamagames.dofus.network.types.game.character.characteristic.CharacterSpellModification;
   import com.ankamagames.jerakine.sequencer.AbstractSequencable;
   import com.ankamagames.jerakine.utils.misc.DescribeTypeCache;
   
   public class FightFighterStatsListStep extends AbstractSequencable implements IFightStep
   {
       
      
      private var _playerId:Number;
      
      private var _stats:CharacterCharacteristicsInformations;
      
      public function FightFighterStatsListStep(stats:CharacterCharacteristicsInformations)
      {
         super();
         this._stats = stats;
      }
      
      public function get stepType() : String
      {
         return "fighterStatsList";
      }
      
      override public function start() : void
      {
         var changesText:String = null;
         var oldStats:CharacterCharacteristicsInformations = null;
         var oldStat:Object = null;
         var newStat:Object = null;
         var statName:String = null;
         var characterBaseCharacteristicChangeDetails:String = null;
         var statsName:Vector.<String> = null;
         var spellModifsLength:int = 0;
         var i:int = 0;
         this._playerId = PlayedCharacterManager.getInstance().id;
         if(GameDebugManager.getInstance().buffsDebugActivated)
         {
            changesText = "";
            oldStats = CurrentPlayedFighterManager.getInstance().getCharacteristicsInformations(this._playerId);
            characterBaseCharacteristicChangeDetails = "";
            statsName = DescribeTypeCache.getVariables(this._stats,true);
            for each(statName in statsName)
            {
               newStat = this._stats[statName];
               oldStat = oldStats[statName];
               if(!(newStat is ActorExtendedAlignmentInformations))
               {
                  if(newStat is Vector.<CharacterSpellModification>)
                  {
                     spellModifsLength = Math.max(oldStat.length,newStat.length);
                     for(i = 0; i < spellModifsLength; )
                     {
                        if(newStat.length <= i || !newStat[i])
                        {
                           changesText = changesText + ("\r    - suppression du modificateur " + oldStat[i].modificationType + " du sort " + oldStat[i].spellId + " (valeur " + oldStat[i].value + ")");
                        }
                        else if(oldStat.length <= i || !oldStat[i])
                        {
                           changesText = changesText + ("\r    - ajout du modificateur " + newStat[i].modificationType + " du sort " + newStat[i].spellId + " (valeur " + newStat[i].value + ")");
                        }
                        else if(oldStat[i].spellId != newStat[i].spellId || oldStat[i].modificationType != newStat[i].modificationType)
                        {
                           changesText = changesText + ("\r    - Modificateur  type " + oldStat[i].modificationType + " à " + newStat[i].modificationType + " du sort " + oldStat[i].spellId + " à " + newStat[i].spellId + ", valeur " + oldStat[i].value + " à " + newStat[i].value);
                        }
                        else if(oldStat[i].value != newStat[i].value)
                        {
                           characterBaseCharacteristicChangeDetails = this.displayDetailedStatsDifferences(oldStat[i].value as CharacterBaseCharacteristic,oldStat[i].value as CharacterBaseCharacteristic);
                           if(characterBaseCharacteristicChangeDetails != "")
                           {
                              changesText = changesText + ("\r    - Modification du modificateur " + oldStat[i].modificationType + " du sort " + oldStat[i].spellId + " valeur : " + characterBaseCharacteristicChangeDetails);
                           }
                        }
                        i++;
                     }
                  }
                  else if(newStat is CharacterBaseCharacteristic)
                  {
                     characterBaseCharacteristicChangeDetails = this.displayDetailedStatsDifferences(oldStat as CharacterBaseCharacteristic,newStat as CharacterBaseCharacteristic);
                     if(characterBaseCharacteristicChangeDetails != "")
                     {
                        changesText = changesText + ("\r    - " + statName + " : ");
                        changesText = changesText + characterBaseCharacteristicChangeDetails;
                     }
                  }
                  else if(newStat != oldStat)
                  {
                     changesText = changesText + ("\r    - " + statName + " : " + oldStat + " à " + newStat);
                  }
               }
            }
            if(changesText == "")
            {
               changesText = "aucun changement";
            }
            else
            {
               changesText.replace("\n","\r");
            }
            _log.debug("[BUFFS DEBUG] Mise a jour des caracteristiques de " + this._playerId + " : " + changesText);
         }
         CurrentPlayedFighterManager.getInstance().setCharacteristicsInformations(this._playerId,this._stats);
         var characterFrame:PlayedCharacterUpdatesFrame = Kernel.getWorker().getFrame(PlayedCharacterUpdatesFrame) as PlayedCharacterUpdatesFrame;
         if(characterFrame)
         {
            characterFrame.updateCharacterStatsList(this._stats);
         }
         SpellWrapper.refreshAllPlayerSpellHolder(this._playerId);
         executeCallbacks();
      }
      
      public function get targets() : Vector.<Number>
      {
         return new <Number>[this._playerId];
      }
      
      private function displayDetailedStatsDifferences(oldStat:CharacterBaseCharacteristic, newStat:CharacterBaseCharacteristic) : String
      {
         var characterBaseCharacteristicChangeDetails:String = "";
         if(newStat.base != oldStat.base)
         {
            characterBaseCharacteristicChangeDetails = characterBaseCharacteristicChangeDetails + ("\r        - base : " + oldStat.base + " à " + newStat.base);
         }
         if(newStat.additionnal != oldStat.additionnal)
         {
            characterBaseCharacteristicChangeDetails = characterBaseCharacteristicChangeDetails + ("\r        - additionnal : " + oldStat.additionnal + " à " + newStat.additionnal);
         }
         if(newStat.objectsAndMountBonus != oldStat.objectsAndMountBonus)
         {
            characterBaseCharacteristicChangeDetails = characterBaseCharacteristicChangeDetails + ("\r        - objectsAndMountBonus : " + oldStat.objectsAndMountBonus + " à " + newStat.objectsAndMountBonus);
         }
         if(newStat.alignGiftBonus != oldStat.alignGiftBonus)
         {
            characterBaseCharacteristicChangeDetails = characterBaseCharacteristicChangeDetails + ("\r        - alignGiftBonus : " + oldStat.alignGiftBonus + " à " + newStat.alignGiftBonus);
         }
         if(newStat.contextModif != oldStat.contextModif)
         {
            characterBaseCharacteristicChangeDetails = characterBaseCharacteristicChangeDetails + ("\r        - contextModif : " + oldStat.contextModif + " à " + newStat.contextModif);
         }
         return characterBaseCharacteristicChangeDetails;
      }
   }
}
