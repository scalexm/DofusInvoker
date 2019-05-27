package com.ankamagames.dofus.logic.game.fight.steps
{
   import com.ankamagames.berilia.managers.TooltipManager;
   import com.ankamagames.dofus.logic.game.common.managers.PlayedCharacterManager;
   import com.ankamagames.dofus.logic.game.common.managers.SpeakingItemManager;
   import com.ankamagames.dofus.logic.game.fight.fightEvents.FightEventsHelper;
   import com.ankamagames.dofus.logic.game.fight.frames.FightEntitiesFrame;
   import com.ankamagames.dofus.logic.game.fight.managers.CurrentPlayedFighterManager;
   import com.ankamagames.dofus.logic.game.fight.steps.abstract.AbstractStatContextualStep;
   import com.ankamagames.dofus.logic.game.fight.types.FightEventEnum;
   import com.ankamagames.dofus.network.enums.GameContextEnum;
   import com.ankamagames.dofus.network.types.game.character.characteristic.CharacterCharacteristicsInformations;
   import com.ankamagames.dofus.network.types.game.context.fight.GameFightCharacterInformations;
   import com.ankamagames.dofus.network.types.game.context.fight.GameFightFighterInformations;
   
   public class FightLifeVariationStep extends AbstractStatContextualStep implements IFightStep
   {
      
      public static const COLOR:uint = 16711680;
      
      private static const BLOCKING:Boolean = false;
       
      
      private var _delta:int;
      
      private var _permanentDamages:int;
      
      private var _elementId:int;
      
      public var skipTextEvent:Boolean = false;
      
      public function FightLifeVariationStep(entityId:Number, delta:int, permanentDamages:int, elementId:int)
      {
         super(COLOR,delta.toString(),entityId,GameContextEnum.FIGHT,BLOCKING);
         _virtual = true;
         this._delta = delta;
         this._permanentDamages = permanentDamages;
         this._elementId = elementId;
      }
      
      public function get stepType() : String
      {
         return "lifeVariation";
      }
      
      public function get value() : int
      {
         return this._delta;
      }
      
      public function get delta() : int
      {
         return this._delta;
      }
      
      public function get permanentDamages() : int
      {
         return this._permanentDamages;
      }
      
      public function get elementId() : int
      {
         return this._elementId;
      }
      
      override public function start() : void
      {
         var fighterInfos:GameFightFighterInformations = FightEntitiesFrame.getCurrentInstance().getEntityInfos(_targetId) as GameFightFighterInformations;
         if(!fighterInfos)
         {
            super.executeCallbacks();
            return;
         }
         var res:int = fighterInfos.stats.lifePoints + this._delta;
         fighterInfos.stats.lifePoints = Math.max(0,res);
         fighterInfos.stats.maxLifePoints = Math.max(1,fighterInfos.stats.maxLifePoints + this._permanentDamages);
         if(fighterInfos.stats.lifePoints > fighterInfos.stats.maxLifePoints)
         {
            fighterInfos.stats.lifePoints = fighterInfos.stats.maxLifePoints;
         }
         if(fighterInfos is GameFightCharacterInformations)
         {
            TooltipManager.updateContent("PlayerShortInfos" + fighterInfos.contextualId,"tooltipOverEntity_" + fighterInfos.contextualId,fighterInfos);
         }
         else
         {
            TooltipManager.updateContent("EntityShortInfos" + fighterInfos.contextualId,"tooltipOverEntity_" + fighterInfos.contextualId,fighterInfos);
         }
         var characteristics:CharacterCharacteristicsInformations = CurrentPlayedFighterManager.getInstance().getCharacteristicsInformations(_targetId);
         if(characteristics)
         {
            characteristics.lifePoints = fighterInfos.stats.lifePoints;
            characteristics.maxLifePoints = fighterInfos.stats.maxLifePoints;
         }
         if(this._delta < 0 || this._delta == 0 && !this.skipTextEvent)
         {
            FightEventsHelper.sendFightEvent(FightEventEnum.FIGHTER_LIFE_LOSS,[_targetId,Math.abs(this._delta),this._elementId],_targetId,castingSpellId,false,2);
            if(_targetId == PlayedCharacterManager.getInstance().id)
            {
               SpeakingItemManager.getInstance().triggerEvent(SpeakingItemManager.SPEAK_TRIGGER_PLAYER_LOOSE_LIFE);
            }
            else if(fighterInfos.teamId == PlayedCharacterManager.getInstance().teamId)
            {
               SpeakingItemManager.getInstance().triggerEvent(SpeakingItemManager.SPEAK_TRIGGER_ALLIED_LOOSE_LIFE);
            }
            else
            {
               SpeakingItemManager.getInstance().triggerEvent(SpeakingItemManager.SPEAK_TRIGGER_ENEMY_LOOSE_LIFE);
            }
         }
         else if(this._delta > 0)
         {
            FightEventsHelper.sendFightEvent(FightEventEnum.FIGHTER_LIFE_GAIN,[_targetId,Math.abs(this._delta),this._elementId],_targetId,castingSpellId,false,2);
         }
         super.start();
      }
   }
}
