package com.ankamagames.dofus.uiApi
{
   import com.ankamagames.berilia.interfaces.IApi;
   import com.ankamagames.berilia.types.data.UiModule;
   import com.ankamagames.berilia.utils.errors.ApiError;
   import com.ankamagames.dofus.datacenter.effects.EffectInstance;
   import com.ankamagames.dofus.datacenter.effects.instances.EffectInstanceInteger;
   import com.ankamagames.dofus.datacenter.spells.Spell;
   import com.ankamagames.dofus.internalDatacenter.fight.FighterInformations;
   import com.ankamagames.dofus.internalDatacenter.spells.EffectsListWrapper;
   import com.ankamagames.dofus.internalDatacenter.spells.EffectsWrapper;
   import com.ankamagames.dofus.kernel.Kernel;
   import com.ankamagames.dofus.logic.game.common.managers.PlayedCharacterManager;
   import com.ankamagames.dofus.logic.game.fight.frames.FightBattleFrame;
   import com.ankamagames.dofus.logic.game.fight.frames.FightContextFrame;
   import com.ankamagames.dofus.logic.game.fight.frames.FightEntitiesFrame;
   import com.ankamagames.dofus.logic.game.fight.frames.FightPreparationFrame;
   import com.ankamagames.dofus.logic.game.fight.frames.FightSpellCastFrame;
   import com.ankamagames.dofus.logic.game.fight.managers.BuffManager;
   import com.ankamagames.dofus.logic.game.fight.managers.CurrentPlayedFighterManager;
   import com.ankamagames.dofus.logic.game.fight.types.BasicBuff;
   import com.ankamagames.dofus.network.enums.FightTypeEnum;
   import com.ankamagames.dofus.network.types.game.character.characteristic.CharacterCharacteristicsInformations;
   import com.ankamagames.dofus.network.types.game.context.fight.GameFightEntityInformation;
   import com.ankamagames.dofus.network.types.game.context.fight.GameFightFighterInformations;
   import com.ankamagames.dofus.network.types.game.context.fight.GameFightMonsterInformations;
   import com.ankamagames.jerakine.logger.Log;
   import com.ankamagames.jerakine.logger.Logger;
   import com.ankamagames.jerakine.messages.Frame;
   import flash.utils.Dictionary;
   import flash.utils.getQualifiedClassName;
   
   [InstanciedApi]
   public class FightApi implements IApi
   {
      
      private static var UNKNOWN_FIGHTER_NAME:String = "???";
      
      public static var slaveContext:Boolean;
       
      
      protected var _log:Logger;
      
      private var _module:UiModule;
      
      public function FightApi()
      {
         this._log = Log.getLogger(getQualifiedClassName(FightApi));
         super();
      }
      
      [ApiData(name="module")]
      public function set module(value:UiModule) : void
      {
         this._module = value;
      }
      
      [Untrusted]
      public function isSlaveContext() : Boolean
      {
         return slaveContext;
      }
      
      [Trusted]
      public function destroy() : void
      {
         this._module = null;
      }
      
      [Untrusted]
      public function getFighterInformations(fighterId:Number) : FighterInformations
      {
         var fighterInfos:FighterInformations = new FighterInformations(fighterId);
         return fighterInfos;
      }
      
      [Untrusted]
      public function getFighterName(fighterId:Number) : String
      {
         try
         {
            return this.getFightFrame().getFighterName(fighterId);
         }
         catch(apiErr:ApiError)
         {
            return UNKNOWN_FIGHTER_NAME;
         }
         return null;
      }
      
      [Untrusted]
      public function getFighterLevel(fighterId:Number) : uint
      {
         return this.getFightFrame().getFighterLevel(fighterId);
      }
      
      [Untrusted]
      public function getFighters() : Vector.<Number>
      {
         if(Kernel.getWorker().getFrame(FightBattleFrame) && !Kernel.getWorker().getFrame(FightPreparationFrame))
         {
            return this.getFightFrame().battleFrame.fightersList;
         }
         return this.getFightFrame().entitiesFrame.getOrdonnedPreFighters();
      }
      
      [Untrusted]
      public function getMonsterId(id:Number) : int
      {
         var gffi:GameFightFighterInformations = this.getFighterInfos(id);
         if(gffi is GameFightMonsterInformations)
         {
            return GameFightMonsterInformations(gffi).creatureGenericId;
         }
         return -1;
      }
      
      [Untrusted]
      public function getDeadFighters() : Vector.<Number>
      {
         if(Kernel.getWorker().getFrame(FightBattleFrame))
         {
            return this.getFightFrame().battleFrame.deadFightersList;
         }
         return new Vector.<Number>();
      }
      
      [Untrusted]
      public function getFightType() : uint
      {
         return this.getFightFrame().fightType;
      }
      
      [Untrusted]
      public function getBuffList(targetId:Number) : Array
      {
         return BuffManager.getInstance().getAllBuff(targetId);
      }
      
      [Untrusted]
      public function getBuffById(buffId:uint, playerId:Number) : BasicBuff
      {
         return BuffManager.getInstance().getBuff(buffId,playerId);
      }
      
      [Untrusted]
      public function createEffectsWrapper(spell:Spell, effects:Array, name:String) : EffectsWrapper
      {
         return new EffectsWrapper(effects,spell,name);
      }
      
      [Untrusted]
      public function getCastingSpellBuffEffects(targetId:Number, castingSpellId:uint) : EffectsWrapper
      {
         var spell:Spell = null;
         var buffItem:BasicBuff = null;
         var effects:EffectsWrapper = null;
         var ei:EffectInstance = null;
         var eii:EffectInstanceInteger = null;
         var res:Array = new Array();
         var buffs:Array = BuffManager.getInstance().getAllBuff(targetId);
         var triggerList:Array = new Array();
         for each(buffItem in buffs)
         {
            if(buffItem.castingSpell.castingSpellId == castingSpellId)
            {
               ei = buffItem.effect;
               if(ei.trigger && ei is EffectInstanceInteger)
               {
                  eii = ei as EffectInstanceInteger;
                  if(triggerList[eii.effectId + "," + eii.value])
                  {
                     continue;
                  }
                  triggerList[eii.effectId + "," + eii.value] = true;
                  res.push(ei);
               }
               else
               {
                  res.push(ei);
               }
               if(!spell)
               {
                  spell = buffItem.castingSpell.spell;
               }
            }
         }
         effects = new EffectsWrapper(res,spell,"");
         return effects;
      }
      
      [Untrusted]
      public function getAllBuffEffects(targetId:Number) : EffectsListWrapper
      {
         return new EffectsListWrapper(BuffManager.getInstance().getAllBuff(targetId));
      }
      
      [Untrusted]
      public function isCastingSpell() : Boolean
      {
         return Kernel.getWorker().contains(FightSpellCastFrame);
      }
      
      [Untrusted]
      public function cancelSpell() : void
      {
         if(Kernel.getWorker().contains(FightSpellCastFrame))
         {
            Kernel.getWorker().removeFrame(Kernel.getWorker().getFrame(FightSpellCastFrame));
         }
      }
      
      [Untrusted]
      public function getChallengeList() : Array
      {
         return this.getFightFrame().challengesList;
      }
      
      [Untrusted]
      public function getCurrentPlayedFighterId() : Number
      {
         return CurrentPlayedFighterManager.getInstance().currentFighterId;
      }
      
      [Untrusted]
      public function getPlayingFighterId() : Number
      {
         return this.getFightFrame().battleFrame.currentPlayerId;
      }
      
      [Untrusted]
      public function isCompanion(pFighterId:Number) : Boolean
      {
         return this.getFightFrame().entitiesFrame.getEntityInfos(pFighterId) is GameFightEntityInformation;
      }
      
      [Untrusted]
      public function getCurrentPlayedCharacteristicsInformations() : CharacterCharacteristicsInformations
      {
         return CurrentPlayedFighterManager.getInstance().getCharacteristicsInformations();
      }
      
      [Untrusted]
      public function preFightIsActive() : Boolean
      {
         return FightContextFrame.preFightIsActive;
      }
      
      [Untrusted]
      public function isWaitingBeforeFight() : Boolean
      {
         if(this.getFightFrame().fightType == FightTypeEnum.FIGHT_TYPE_PvMA || this.getFightFrame().fightType == FightTypeEnum.FIGHT_TYPE_PvT)
         {
            return true;
         }
         return false;
      }
      
      [Untrusted]
      public function isFightLeader() : Boolean
      {
         return this.getFightFrame().isFightLeader;
      }
      
      [Untrusted]
      public function isSpectator() : Boolean
      {
         return PlayedCharacterManager.getInstance().isSpectator;
      }
      
      [Untrusted]
      public function isDematerializated() : Boolean
      {
         return this.getFightFrame().entitiesFrame.dematerialization;
      }
      
      [Untrusted]
      public function getTurnsCount() : int
      {
         return this.getFightFrame().battleFrame.turnsCount;
      }
      
      [Untrusted]
      public function getFighterStatus(fighterId:Number) : int
      {
         var frame:FightEntitiesFrame = Kernel.getWorker().getFrame(FightEntitiesFrame) as FightEntitiesFrame;
         var fightersStatus:Dictionary = !!frame?frame.lastKnownPlayerStatus:null;
         if(fightersStatus && fightersStatus[fighterId])
         {
            return fightersStatus[fighterId];
         }
         return -1;
      }
      
      [Untrusted]
      public function isMouseOverFighter(fighterId:Number) : Boolean
      {
         var fcf:FightContextFrame = Kernel.getWorker().getFrame(FightContextFrame) as FightContextFrame;
         if(!fcf || !fcf.entitiesFrame.getEntityInfos(fighterId))
         {
            return false;
         }
         var fighterInfo:GameFightFighterInformations = this.getFighterInfos(fighterId);
         return fighterInfo.disposition.cellId == FightContextFrame.currentCell || fcf.timelineOverEntity && fighterId == fcf.timelineOverEntityId;
      }
      
      [Untrusted]
      public function updateSwapPositionRequestsIcons() : void
      {
         var fightPreparationFrame:FightPreparationFrame = Kernel.getWorker().getFrame(FightPreparationFrame) as FightPreparationFrame;
         if(fightPreparationFrame)
         {
            fightPreparationFrame.updateSwapPositionRequestsIcons();
         }
      }
      
      [Untrusted]
      public function setSwapPositionRequestsIconsVisibility(pVisible:Boolean) : void
      {
         var fightPreparationFrame:FightPreparationFrame = Kernel.getWorker().getFrame(FightPreparationFrame) as FightPreparationFrame;
         if(fightPreparationFrame)
         {
            fightPreparationFrame.setSwapPositionRequestsIconsVisibility(pVisible);
         }
      }
      
      private function getFighterInfos(fighterId:Number) : GameFightFighterInformations
      {
         return this.getFightFrame().entitiesFrame.getEntityInfos(fighterId) as GameFightFighterInformations;
      }
      
      private function getFightFrame() : FightContextFrame
      {
         var frame:Frame = Kernel.getWorker().getFrame(FightContextFrame);
         if(!frame)
         {
            throw new ApiError("Unallowed call of FightApi method while not fighting.");
         }
         return frame as FightContextFrame;
      }
   }
}
