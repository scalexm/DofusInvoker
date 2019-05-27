package com.ankamagames.dofus.logic.game.fight.types
{
   import com.ankamagames.dofus.datacenter.spells.SpellState;
   import com.ankamagames.dofus.internalDatacenter.spells.SpellWrapper;
   import com.ankamagames.dofus.kernel.Kernel;
   import com.ankamagames.dofus.logic.game.common.managers.PlayedCharacterManager;
   import com.ankamagames.dofus.logic.game.fight.fightEvents.FightEventsHelper;
   import com.ankamagames.dofus.logic.game.fight.frames.FightBattleFrame;
   import com.ankamagames.dofus.logic.game.fight.frames.FightEntitiesFrame;
   import com.ankamagames.dofus.logic.game.fight.managers.FightersStateManager;
   import com.ankamagames.dofus.network.types.game.actions.fight.FightTemporaryBoostStateEffect;
   import com.ankamagames.dofus.network.types.game.context.fight.GameFightCharacterInformations;
   import com.ankamagames.dofus.network.types.game.context.fight.GameFightFighterInformations;
   import com.ankamagames.dofus.types.enums.EntityIconEnum;
   import com.ankamagames.dofus.types.enums.SpellStateIconVisibilityMaskEnum;
   import com.ankamagames.jerakine.logger.Log;
   import com.ankamagames.jerakine.logger.Logger;
   import flash.utils.getQualifiedClassName;
   import tools.ActionIdHelper;
   
   public class StateBuff extends BasicBuff
   {
      
      protected static const _log:Logger = Log.getLogger(getQualifiedClassName(StateBuff));
       
      
      private var _statName:String;
      
      private var _isSilent:Boolean = true;
      
      public var stateId:int;
      
      public var delta:int;
      
      public function StateBuff(effect:FightTemporaryBoostStateEffect = null, castingSpell:CastingSpell = null, actionId:uint = 0)
      {
         if(effect)
         {
            super(effect,castingSpell,actionId,null,null,effect.stateId);
            this._statName = ActionIdHelper.getActionIdStatName(actionId);
            this.stateId = effect.stateId;
            this.delta = effect.delta;
            this._isSilent = SpellState.getSpellStateById(this.stateId).isSilent;
         }
      }
      
      override public function get type() : String
      {
         return "StateBuff";
      }
      
      public function get statName() : String
      {
         return this._statName;
      }
      
      public function get isSilent() : Boolean
      {
         return this._isSilent;
      }
      
      override public function onApplied() : void
      {
         this.addBuffState();
         SpellWrapper.refreshAllPlayerSpellHolder(targetId);
         super.onApplied();
      }
      
      override public function onRemoved() : void
      {
         this.removeBuffState();
         SpellWrapper.refreshAllPlayerSpellHolder(targetId);
         super.onRemoved();
      }
      
      override public function clone(id:int = 0) : BasicBuff
      {
         var sb:StateBuff = new StateBuff();
         sb._statName = this._statName;
         sb.stateId = this.stateId;
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
      
      private function addBuffState() : void
      {
         var statePreviouslyActivated:Boolean = FightersStateManager.getInstance().hasState(targetId,this.stateId);
         FightersStateManager.getInstance().addStateOnTarget(targetId,this.stateId,this.delta);
         var stateActivated:Boolean = FightersStateManager.getInstance().hasState(targetId,this.stateId);
         if(!statePreviouslyActivated && stateActivated)
         {
            this.addStateIcon();
         }
         else if(statePreviouslyActivated && !stateActivated)
         {
            this.removeStateIcon();
         }
      }
      
      private function removeBuffState() : void
      {
         var statePreviouslyActivated:Boolean = FightersStateManager.getInstance().hasState(targetId,this.stateId);
         FightersStateManager.getInstance().removeStateOnTarget(targetId,this.stateId,this.delta);
         var stateActivated:Boolean = FightersStateManager.getInstance().hasState(targetId,this.stateId);
         var chatLog:Boolean = false;
         var fbf:FightBattleFrame = Kernel.getWorker().getFrame(FightBattleFrame) as FightBattleFrame;
         if(fbf && !fbf.executingSequence && fbf.deadFightersList.indexOf(targetId) == -1 && !this.isSilent)
         {
            chatLog = true;
         }
         if(!stateActivated)
         {
            this.removeStateIcon();
            if(statePreviouslyActivated && chatLog)
            {
               FightEventsHelper.sendFightEvent(FightEventEnum.FIGHTER_LEAVING_STATE,[targetId,this.stateId],targetId,-1,false,2);
            }
         }
         else if(!statePreviouslyActivated && stateActivated)
         {
            this.addStateIcon();
            if(chatLog)
            {
               FightEventsHelper.sendFightEvent(FightEventEnum.FIGHTER_ENTERING_STATE,[targetId,this.stateId],targetId,-1,false,2);
            }
         }
      }
      
      private function addStateIcon() : void
      {
         var spellState:SpellState = SpellState.getSpellStateById(this.stateId);
         var icon:String = spellState.icon;
         if(!icon || icon == "")
         {
            return;
         }
         var displayIcon:Boolean = this.displayIconForThisPlayer(spellState.iconVisibilityMask);
         if(displayIcon)
         {
            FightEntitiesFrame.getCurrentInstance().addEntityIcon(targetId,icon,EntityIconEnum.FIGHT_STATE_CATEGORY);
            FightEntitiesFrame.getCurrentInstance().forceIconUpdate(targetId);
         }
      }
      
      private function removeStateIcon() : void
      {
         var spellState:SpellState = SpellState.getSpellStateById(this.stateId);
         var icon:String = spellState.icon;
         if(!icon || icon == "")
         {
            return;
         }
         var displayIcon:Boolean = this.displayIconForThisPlayer(spellState.iconVisibilityMask);
         if(displayIcon)
         {
            FightEntitiesFrame.getCurrentInstance().removeIcon(targetId,icon);
         }
      }
      
      private function displayIconForThisPlayer(iconVisibility:int) : Boolean
      {
         var playerInfos:GameFightFighterInformations = null;
         var casterInfos:GameFightFighterInformations = null;
         var playerBreed:int = 0;
         var summonerInfos:GameFightFighterInformations = null;
         var casterInfos2:GameFightFighterInformations = null;
         var displayIcon:Boolean = false;
         var playerId:Number = PlayedCharacterManager.getInstance().id;
         switch(iconVisibility)
         {
            case SpellStateIconVisibilityMaskEnum.ALL_VISIBILITY:
               displayIcon = true;
               break;
            case SpellStateIconVisibilityMaskEnum.TARGET_VISIBILITY:
               if(targetId == playerId)
               {
                  displayIcon = true;
                  break;
               }
               break;
            case SpellStateIconVisibilityMaskEnum.CASTER_VISIBILITY:
               if(!castingSpell)
               {
                  break;
               }
               if(castingSpell.casterId == playerId)
               {
                  displayIcon = true;
                  break;
               }
               casterInfos = FightEntitiesFrame.getCurrentInstance().getEntityInfos(castingSpell.casterId) as GameFightFighterInformations;
               if(!casterInfos)
               {
                  break;
               }
               if(casterInfos.stats.summoner == playerId)
               {
                  displayIcon = true;
                  break;
               }
               playerBreed = PlayedCharacterManager.getInstance().infos.breed;
               playerInfos = FightEntitiesFrame.getCurrentInstance().getEntityInfos(playerId) as GameFightFighterInformations;
               if(!playerInfos)
               {
                  break;
               }
               if(casterInfos is GameFightCharacterInformations)
               {
                  if(casterInfos.teamId == playerInfos.teamId && (casterInfos as GameFightCharacterInformations).breed == playerBreed)
                  {
                     displayIcon = true;
                     break;
                  }
                  break;
               }
               summonerInfos = FightEntitiesFrame.getCurrentInstance().getEntityInfos(casterInfos.stats.summoner) as GameFightFighterInformations;
               if(summonerInfos is GameFightCharacterInformations)
               {
                  if(summonerInfos.teamId == playerInfos.teamId && (summonerInfos as GameFightCharacterInformations).breed == playerBreed)
                  {
                     displayIcon = true;
                     break;
                  }
                  break;
               }
               break;
            case SpellStateIconVisibilityMaskEnum.CASTER_ALLIES_VISIBILITY:
               if(!castingSpell)
               {
                  break;
               }
               if(castingSpell.casterId == playerId)
               {
                  displayIcon = true;
                  break;
               }
               casterInfos2 = FightEntitiesFrame.getCurrentInstance().getEntityInfos(castingSpell.casterId) as GameFightFighterInformations;
               if(casterInfos2 && casterInfos2.stats.summoner == playerId)
               {
                  displayIcon = true;
                  break;
               }
               playerInfos = FightEntitiesFrame.getCurrentInstance().getEntityInfos(playerId) as GameFightFighterInformations;
               if(!playerInfos)
               {
                  break;
               }
               if(casterInfos2.teamId == playerInfos.teamId)
               {
                  displayIcon = true;
                  break;
               }
               break;
         }
         return displayIcon;
      }
   }
}
