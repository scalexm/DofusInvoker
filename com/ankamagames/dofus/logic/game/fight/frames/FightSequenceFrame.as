package com.ankamagames.dofus.logic.game.fight.frames
{
   import com.ankama.dofus.enums.ActionIds;
   import com.ankamagames.atouin.managers.EntitiesManager;
   import com.ankamagames.atouin.managers.InteractiveCellManager;
   import com.ankamagames.atouin.types.GraphicCell;
   import com.ankamagames.atouin.types.sequences.AddWorldEntityStep;
   import com.ankamagames.atouin.types.sequences.ParableGfxMovementStep;
   import com.ankamagames.berilia.managers.KernelEventsManager;
   import com.ankamagames.berilia.managers.TooltipManager;
   import com.ankamagames.dofus.datacenter.effects.Effect;
   import com.ankamagames.dofus.datacenter.effects.EffectInstance;
   import com.ankamagames.dofus.datacenter.effects.instances.EffectInstanceDice;
   import com.ankamagames.dofus.datacenter.monsters.Monster;
   import com.ankamagames.dofus.datacenter.spells.Spell;
   import com.ankamagames.dofus.datacenter.spells.SpellLevel;
   import com.ankamagames.dofus.internalDatacenter.spells.SpellWrapper;
   import com.ankamagames.dofus.kernel.Kernel;
   import com.ankamagames.dofus.logic.game.common.frames.SpellInventoryManagementFrame;
   import com.ankamagames.dofus.logic.game.common.managers.EntitiesLooksManager;
   import com.ankamagames.dofus.logic.game.common.managers.MapMovementAdapter;
   import com.ankamagames.dofus.logic.game.common.managers.PlayedCharacterManager;
   import com.ankamagames.dofus.logic.game.common.managers.SpeakingItemManager;
   import com.ankamagames.dofus.logic.game.common.misc.DofusEntities;
   import com.ankamagames.dofus.logic.game.common.misc.ISpellCastProvider;
   import com.ankamagames.dofus.logic.game.fight.managers.BuffManager;
   import com.ankamagames.dofus.logic.game.fight.managers.CurrentPlayedFighterManager;
   import com.ankamagames.dofus.logic.game.fight.managers.MarkedCellsManager;
   import com.ankamagames.dofus.logic.game.fight.messages.GameActionFightLeaveMessage;
   import com.ankamagames.dofus.logic.game.fight.miscs.ActionIdProtocol;
   import com.ankamagames.dofus.logic.game.fight.miscs.SpellScriptBuffer;
   import com.ankamagames.dofus.logic.game.fight.miscs.TackleUtil;
   import com.ankamagames.dofus.logic.game.fight.steps.FightActionPointsLossDodgeStep;
   import com.ankamagames.dofus.logic.game.fight.steps.FightActionPointsVariationStep;
   import com.ankamagames.dofus.logic.game.fight.steps.FightCarryCharacterStep;
   import com.ankamagames.dofus.logic.game.fight.steps.FightChangeLookStep;
   import com.ankamagames.dofus.logic.game.fight.steps.FightChangeVisibilityStep;
   import com.ankamagames.dofus.logic.game.fight.steps.FightCloseCombatStep;
   import com.ankamagames.dofus.logic.game.fight.steps.FightDeathStep;
   import com.ankamagames.dofus.logic.game.fight.steps.FightDispellEffectStep;
   import com.ankamagames.dofus.logic.game.fight.steps.FightDispellSpellStep;
   import com.ankamagames.dofus.logic.game.fight.steps.FightDispellStep;
   import com.ankamagames.dofus.logic.game.fight.steps.FightDisplayBuffStep;
   import com.ankamagames.dofus.logic.game.fight.steps.FightEnteringStateStep;
   import com.ankamagames.dofus.logic.game.fight.steps.FightEntityMovementStep;
   import com.ankamagames.dofus.logic.game.fight.steps.FightEntitySlideStep;
   import com.ankamagames.dofus.logic.game.fight.steps.FightExchangePositionsStep;
   import com.ankamagames.dofus.logic.game.fight.steps.FightFighterStatsListStep;
   import com.ankamagames.dofus.logic.game.fight.steps.FightInvisibleTemporarilyDetectedStep;
   import com.ankamagames.dofus.logic.game.fight.steps.FightKillStep;
   import com.ankamagames.dofus.logic.game.fight.steps.FightLeavingStateStep;
   import com.ankamagames.dofus.logic.game.fight.steps.FightLifeVariationStep;
   import com.ankamagames.dofus.logic.game.fight.steps.FightLossAnimStep;
   import com.ankamagames.dofus.logic.game.fight.steps.FightMarkActivateStep;
   import com.ankamagames.dofus.logic.game.fight.steps.FightMarkCellsStep;
   import com.ankamagames.dofus.logic.game.fight.steps.FightMarkTriggeredStep;
   import com.ankamagames.dofus.logic.game.fight.steps.FightModifyEffectsDurationStep;
   import com.ankamagames.dofus.logic.game.fight.steps.FightMovementPointsLossDodgeStep;
   import com.ankamagames.dofus.logic.game.fight.steps.FightMovementPointsVariationStep;
   import com.ankamagames.dofus.logic.game.fight.steps.FightPlaySpellScriptStep;
   import com.ankamagames.dofus.logic.game.fight.steps.FightReducedDamagesStep;
   import com.ankamagames.dofus.logic.game.fight.steps.FightReflectedDamagesStep;
   import com.ankamagames.dofus.logic.game.fight.steps.FightReflectedSpellStep;
   import com.ankamagames.dofus.logic.game.fight.steps.FightRefreshFighterStep;
   import com.ankamagames.dofus.logic.game.fight.steps.FightShieldPointsVariationStep;
   import com.ankamagames.dofus.logic.game.fight.steps.FightSpellCastStep;
   import com.ankamagames.dofus.logic.game.fight.steps.FightSpellCooldownVariationStep;
   import com.ankamagames.dofus.logic.game.fight.steps.FightSpellImmunityStep;
   import com.ankamagames.dofus.logic.game.fight.steps.FightStealingKamasStep;
   import com.ankamagames.dofus.logic.game.fight.steps.FightSummonStep;
   import com.ankamagames.dofus.logic.game.fight.steps.FightTackledStep;
   import com.ankamagames.dofus.logic.game.fight.steps.FightTeleportStep;
   import com.ankamagames.dofus.logic.game.fight.steps.FightTemporaryBoostStep;
   import com.ankamagames.dofus.logic.game.fight.steps.FightThrowCharacterStep;
   import com.ankamagames.dofus.logic.game.fight.steps.FightTurnListStep;
   import com.ankamagames.dofus.logic.game.fight.steps.FightUnmarkCellsStep;
   import com.ankamagames.dofus.logic.game.fight.steps.FightVanishStep;
   import com.ankamagames.dofus.logic.game.fight.steps.FightVisibilityStep;
   import com.ankamagames.dofus.logic.game.fight.steps.IFightStep;
   import com.ankamagames.dofus.logic.game.fight.types.BasicBuff;
   import com.ankamagames.dofus.logic.game.fight.types.CastingSpell;
   import com.ankamagames.dofus.logic.game.fight.types.MarkInstance;
   import com.ankamagames.dofus.logic.game.fight.types.StatBuff;
   import com.ankamagames.dofus.logic.game.fight.types.StateBuff;
   import com.ankamagames.dofus.misc.EntityLookAdapter;
   import com.ankamagames.dofus.misc.lists.TriggerHookList;
   import com.ankamagames.dofus.misc.utils.GameDebugManager;
   import com.ankamagames.dofus.network.enums.FightSpellCastCriticalEnum;
   import com.ankamagames.dofus.network.messages.game.actions.AbstractGameActionMessage;
   import com.ankamagames.dofus.network.messages.game.actions.fight.GameActionFightActivateGlyphTrapMessage;
   import com.ankamagames.dofus.network.messages.game.actions.fight.GameActionFightCarryCharacterMessage;
   import com.ankamagames.dofus.network.messages.game.actions.fight.GameActionFightChangeLookMessage;
   import com.ankamagames.dofus.network.messages.game.actions.fight.GameActionFightCloseCombatMessage;
   import com.ankamagames.dofus.network.messages.game.actions.fight.GameActionFightDeathMessage;
   import com.ankamagames.dofus.network.messages.game.actions.fight.GameActionFightDispellEffectMessage;
   import com.ankamagames.dofus.network.messages.game.actions.fight.GameActionFightDispellMessage;
   import com.ankamagames.dofus.network.messages.game.actions.fight.GameActionFightDispellSpellMessage;
   import com.ankamagames.dofus.network.messages.game.actions.fight.GameActionFightDispellableEffectMessage;
   import com.ankamagames.dofus.network.messages.game.actions.fight.GameActionFightDodgePointLossMessage;
   import com.ankamagames.dofus.network.messages.game.actions.fight.GameActionFightDropCharacterMessage;
   import com.ankamagames.dofus.network.messages.game.actions.fight.GameActionFightExchangePositionsMessage;
   import com.ankamagames.dofus.network.messages.game.actions.fight.GameActionFightInvisibilityMessage;
   import com.ankamagames.dofus.network.messages.game.actions.fight.GameActionFightInvisibleDetectedMessage;
   import com.ankamagames.dofus.network.messages.game.actions.fight.GameActionFightKillMessage;
   import com.ankamagames.dofus.network.messages.game.actions.fight.GameActionFightLifeAndShieldPointsLostMessage;
   import com.ankamagames.dofus.network.messages.game.actions.fight.GameActionFightLifePointsGainMessage;
   import com.ankamagames.dofus.network.messages.game.actions.fight.GameActionFightLifePointsLostMessage;
   import com.ankamagames.dofus.network.messages.game.actions.fight.GameActionFightMarkCellsMessage;
   import com.ankamagames.dofus.network.messages.game.actions.fight.GameActionFightModifyEffectsDurationMessage;
   import com.ankamagames.dofus.network.messages.game.actions.fight.GameActionFightPointsVariationMessage;
   import com.ankamagames.dofus.network.messages.game.actions.fight.GameActionFightReduceDamagesMessage;
   import com.ankamagames.dofus.network.messages.game.actions.fight.GameActionFightReflectDamagesMessage;
   import com.ankamagames.dofus.network.messages.game.actions.fight.GameActionFightReflectSpellMessage;
   import com.ankamagames.dofus.network.messages.game.actions.fight.GameActionFightSlideMessage;
   import com.ankamagames.dofus.network.messages.game.actions.fight.GameActionFightSpellCastMessage;
   import com.ankamagames.dofus.network.messages.game.actions.fight.GameActionFightSpellCooldownVariationMessage;
   import com.ankamagames.dofus.network.messages.game.actions.fight.GameActionFightSpellImmunityMessage;
   import com.ankamagames.dofus.network.messages.game.actions.fight.GameActionFightStealKamaMessage;
   import com.ankamagames.dofus.network.messages.game.actions.fight.GameActionFightSummonMessage;
   import com.ankamagames.dofus.network.messages.game.actions.fight.GameActionFightTackledMessage;
   import com.ankamagames.dofus.network.messages.game.actions.fight.GameActionFightTeleportOnSameMapMessage;
   import com.ankamagames.dofus.network.messages.game.actions.fight.GameActionFightThrowCharacterMessage;
   import com.ankamagames.dofus.network.messages.game.actions.fight.GameActionFightTriggerEffectMessage;
   import com.ankamagames.dofus.network.messages.game.actions.fight.GameActionFightTriggerGlyphTrapMessage;
   import com.ankamagames.dofus.network.messages.game.actions.fight.GameActionFightUnmarkCellsMessage;
   import com.ankamagames.dofus.network.messages.game.actions.fight.GameActionFightVanishMessage;
   import com.ankamagames.dofus.network.messages.game.actions.sequence.SequenceEndMessage;
   import com.ankamagames.dofus.network.messages.game.actions.sequence.SequenceStartMessage;
   import com.ankamagames.dofus.network.messages.game.character.stats.FighterStatsListMessage;
   import com.ankamagames.dofus.network.messages.game.context.GameMapMovementMessage;
   import com.ankamagames.dofus.network.messages.game.context.fight.GameFightSynchronizeMessage;
   import com.ankamagames.dofus.network.messages.game.context.fight.GameFightTurnListMessage;
   import com.ankamagames.dofus.network.messages.game.context.fight.character.GameFightRefreshFighterMessage;
   import com.ankamagames.dofus.network.messages.game.context.fight.character.GameFightShowFighterMessage;
   import com.ankamagames.dofus.network.messages.game.context.fight.character.GameFightShowFighterRandomStaticPoseMessage;
   import com.ankamagames.dofus.network.types.game.actions.fight.AbstractFightDispellableEffect;
   import com.ankamagames.dofus.network.types.game.actions.fight.FightTemporaryBoostEffect;
   import com.ankamagames.dofus.network.types.game.actions.fight.GameActionMarkedCell;
   import com.ankamagames.dofus.network.types.game.character.characteristic.CharacterCharacteristicsInformations;
   import com.ankamagames.dofus.network.types.game.context.GameContextActorInformations;
   import com.ankamagames.dofus.network.types.game.context.fight.GameFightCharacterInformations;
   import com.ankamagames.dofus.network.types.game.context.fight.GameFightEntityInformation;
   import com.ankamagames.dofus.network.types.game.context.fight.GameFightFighterInformations;
   import com.ankamagames.dofus.network.types.game.context.fight.GameFightMonsterInformations;
   import com.ankamagames.dofus.network.types.game.context.fight.GameFightSpellCooldown;
   import com.ankamagames.dofus.network.types.game.look.EntityLook;
   import com.ankamagames.dofus.types.entities.AnimatedCharacter;
   import com.ankamagames.dofus.types.enums.AnimationEnum;
   import com.ankamagames.dofus.types.sequences.AddGfxEntityStep;
   import com.ankamagames.dofus.types.sequences.AddGfxInLineStep;
   import com.ankamagames.dofus.types.sequences.AddGlyphGfxStep;
   import com.ankamagames.jerakine.entities.interfaces.IEntity;
   import com.ankamagames.jerakine.logger.Log;
   import com.ankamagames.jerakine.logger.Logger;
   import com.ankamagames.jerakine.managers.OptionManager;
   import com.ankamagames.jerakine.messages.Frame;
   import com.ankamagames.jerakine.messages.Message;
   import com.ankamagames.jerakine.sequencer.AbstractSequencable;
   import com.ankamagames.jerakine.sequencer.CallbackStep;
   import com.ankamagames.jerakine.sequencer.ISequencable;
   import com.ankamagames.jerakine.sequencer.ISequencer;
   import com.ankamagames.jerakine.sequencer.ParallelStartSequenceStep;
   import com.ankamagames.jerakine.sequencer.SerialSequencer;
   import com.ankamagames.jerakine.types.Callback;
   import com.ankamagames.jerakine.types.enums.Priority;
   import com.ankamagames.jerakine.types.events.SequencerEvent;
   import com.ankamagames.jerakine.types.positions.MapPoint;
   import com.ankamagames.jerakine.types.positions.MovementPath;
   import com.ankamagames.jerakine.utils.display.spellZone.SpellShapeEnum;
   import com.ankamagames.tiphon.display.TiphonSprite;
   import com.ankamagames.tiphon.sequence.PlayAnimationStep;
   import com.ankamagames.tiphon.sequence.WaitAnimationEventStep;
   import com.ankamagames.tiphon.types.TiphonUtility;
   import com.ankamagames.tiphon.types.look.TiphonEntityLook;
   import flash.display.Sprite;
   import flash.geom.Point;
   import flash.utils.Dictionary;
   import flash.utils.getQualifiedClassName;
   import tools.enumeration.ElementEnum;
   import tools.enumeration.GameActionMarkTypeEnum;
   
   public class FightSequenceFrame implements Frame, ISpellCastProvider
   {
      
      protected static const _log:Logger = Log.getLogger(getQualifiedClassName(FightSequenceFrame));
      
      private static var _lastCastingSpell:CastingSpell;
      
      private static var _currentInstanceId:uint;
      
      public static const FIGHT_SEQUENCERS_CATEGORY:String = "FightSequencer";
       
      
      private var _castingSpell:CastingSpell;
      
      private var _castingSpells:Vector.<CastingSpell>;
      
      private var _stepsBuffer:Vector.<ISequencable>;
      
      public var mustAck:Boolean;
      
      public var ackIdent:int;
      
      private var _sequenceEndCallback:Function;
      
      private var _subSequenceWaitingCount:uint = 0;
      
      private var _scriptInit:Boolean;
      
      private var _sequencer:SerialSequencer;
      
      private var _parent:FightSequenceFrame;
      
      private var _fightBattleFrame:FightBattleFrame;
      
      private var _fightEntitiesFrame:FightEntitiesFrame;
      
      private var _instanceId:uint;
      
      private var _teleportThroughPortal:Boolean;
      
      private var _teleportPortalId:int;
      
      private var _updateMovementAreaAtSequenceEnd:Boolean;
      
      private var _playSpellScriptStep:FightPlaySpellScriptStep;
      
      private var _spellScriptTemporaryBuffer:SpellScriptBuffer;
      
      private var _permanentTooltipsCallback:Callback;
      
      public function FightSequenceFrame(pFightBattleFrame:FightBattleFrame, parent:FightSequenceFrame = null)
      {
         super();
         this._instanceId = _currentInstanceId++;
         this._fightBattleFrame = pFightBattleFrame;
         this._parent = parent;
         this.clearBuffer();
      }
      
      public static function get lastCastingSpell() : CastingSpell
      {
         return _lastCastingSpell;
      }
      
      public static function get currentInstanceId() : uint
      {
         return _currentInstanceId;
      }
      
      private static function deleteTooltip(fighterId:Number) : void
      {
         var fightContextFrame:FightContextFrame = Kernel.getWorker().getFrame(FightContextFrame) as FightContextFrame;
         if(FightContextFrame.fighterEntityTooltipId == fighterId && FightContextFrame.fighterEntityTooltipId != fightContextFrame.timelineOverEntityId)
         {
            if(fightContextFrame)
            {
               fightContextFrame.outEntity(fighterId);
            }
         }
      }
      
      public function get priority() : int
      {
         return Priority.HIGHEST;
      }
      
      public function get castingSpell() : CastingSpell
      {
         if(this._castingSpells && this._castingSpells.length > 1)
         {
            return this._castingSpells[this._castingSpells.length - 1];
         }
         return this._castingSpell;
      }
      
      public function get stepsBuffer() : Vector.<ISequencable>
      {
         return this._stepsBuffer;
      }
      
      public function get parent() : FightSequenceFrame
      {
         return this._parent;
      }
      
      public function get isWaiting() : Boolean
      {
         return this._subSequenceWaitingCount != 0 || !this._scriptInit;
      }
      
      public function get instanceId() : uint
      {
         return this._instanceId;
      }
      
      public function pushed() : Boolean
      {
         this._scriptInit = false;
         return true;
      }
      
      public function pulled() : Boolean
      {
         this._stepsBuffer = null;
         this._castingSpell = null;
         this._castingSpells = null;
         _lastCastingSpell = null;
         this._sequenceEndCallback = null;
         this._parent = null;
         this._fightBattleFrame = null;
         this._fightEntitiesFrame = null;
         this._sequencer.clear();
         return true;
      }
      
      public function get fightEntitiesFrame() : FightEntitiesFrame
      {
         if(!this._fightEntitiesFrame)
         {
            this._fightEntitiesFrame = Kernel.getWorker().getFrame(FightEntitiesFrame) as FightEntitiesFrame;
         }
         return this._fightEntitiesFrame;
      }
      
      public function addSubSequence(sequence:ISequencer) : void
      {
         this._subSequenceWaitingCount++;
         this._stepsBuffer.push(new ParallelStartSequenceStep([sequence],false));
      }
      
      public function process(msg:Message) : Boolean
      {
         /*
          * Decompilation error
          * Timeout (1 minute) was reached
          * Instruction count: 4938
          */
         throw new flash.errors.IllegalOperationError("Not decompiled due to timeout");
      }
      
      public function execute(callback:Function = null) : void
      {
         this._sequencer = new SerialSequencer(FIGHT_SEQUENCERS_CATEGORY);
         this._sequencer.addEventListener(SequencerEvent.SEQUENCE_STEP_FINISH,this.onStepEnd);
         if(this._parent)
         {
            _log.info("Process sub sequence");
            this._parent.addSubSequence(this._sequencer);
         }
         else
         {
            _log.info("Execute sequence");
         }
         this.executeBuffer(callback);
      }
      
      private function executeBuffer(callback:Function) : void
      {
         var step:ISequencable = null;
         var allowHitAnim:Boolean = false;
         var allowSpellEffects:Boolean = false;
         var startStep:Array = null;
         var endStep:Array = null;
         var removed:Boolean = false;
         var entityAttaqueAnimWait:Dictionary = null;
         var lifeLoseSum:Dictionary = null;
         var lifeLoseLastStep:Dictionary = null;
         var shieldLoseSum:Dictionary = null;
         var shieldLoseLastStep:Dictionary = null;
         var deathNumber:int = 0;
         var i:int = 0;
         var b:* = undefined;
         var index:* = undefined;
         var waitStep:WaitAnimationEventStep = null;
         var animStep:PlayAnimationStep = null;
         var deathStep:FightDeathStep = null;
         var deadEntityIndex:int = 0;
         var fapvs:FightActionPointsVariationStep = null;
         var fspvs:FightShieldPointsVariationStep = null;
         var flvs:FightLifeVariationStep = null;
         var idx:int = 0;
         var idx2:int = 0;
         var loseLifeTarget:* = undefined;
         var j:uint = 0;
         var cleanedBuffer:Array = [];
         var deathStepRef:Dictionary = new Dictionary(true);
         var hitStep:Dictionary = new Dictionary(true);
         var loseLifeStep:Dictionary = new Dictionary(true);
         var waitHitEnd:Boolean = false;
         for each(step in this._stepsBuffer)
         {
            switch(true)
            {
               case step is FightMarkTriggeredStep:
                  waitHitEnd = true;
                  continue;
               default:
                  continue;
            }
         }
         allowHitAnim = OptionManager.getOptionManager("dofus")["allowHitAnim"];
         allowSpellEffects = OptionManager.getOptionManager("dofus")["allowSpellEffects"];
         startStep = [];
         endStep = [];
         entityAttaqueAnimWait = new Dictionary();
         lifeLoseSum = new Dictionary(true);
         lifeLoseLastStep = new Dictionary(true);
         shieldLoseSum = new Dictionary(true);
         shieldLoseLastStep = new Dictionary(true);
         deathNumber = 0;
         for(i = this._stepsBuffer.length; --i >= 0; )
         {
            if(removed && step)
            {
               step.clear();
            }
            removed = true;
            step = this._stepsBuffer[i];
            switch(true)
            {
               case step is PlayAnimationStep:
                  animStep = step as PlayAnimationStep;
                  if(animStep.animation.indexOf(AnimationEnum.ANIM_HIT) != -1)
                  {
                     if(!allowHitAnim)
                     {
                        continue;
                     }
                     animStep.waitEvent = waitHitEnd;
                     if(animStep.target == null)
                     {
                        continue;
                     }
                     if(deathStepRef[EntitiesManager.getInstance().getEntityID(animStep.target as IEntity)])
                     {
                        continue;
                     }
                     if(hitStep[animStep.target])
                     {
                        continue;
                     }
                     if(animStep.animation != AnimationEnum.ANIM_HIT && animStep.animation != AnimationEnum.ANIM_HIT_CARRYING && !animStep.target.hasAnimation(animStep.animation,1))
                     {
                        animStep.animation = AnimationEnum.ANIM_HIT;
                     }
                     hitStep[animStep.target] = true;
                  }
                  if(this._castingSpell && this._castingSpell.casterId < 0)
                  {
                     if(entityAttaqueAnimWait[animStep.target])
                     {
                        cleanedBuffer.unshift(entityAttaqueAnimWait[animStep.target]);
                        delete entityAttaqueAnimWait[animStep.target];
                     }
                     if(animStep.animation.indexOf(AnimationEnum.ANIM_ATTAQUE_BASE) != -1)
                     {
                        entityAttaqueAnimWait[animStep.target] = new WaitAnimationEventStep(animStep);
                        break;
                     }
                     break;
                  }
                  break;
               case step is FightDeathStep:
                  deathStep = step as FightDeathStep;
                  deathStepRef[deathStep.entityId] = true;
                  deadEntityIndex = this._fightBattleFrame.targetedEntities.indexOf(deathStep.entityId);
                  if(deadEntityIndex != -1)
                  {
                     this._fightBattleFrame.targetedEntities.splice(deadEntityIndex,1);
                     TooltipManager.hide("tooltipOverEntity_" + deathStep.entityId);
                  }
                  deathNumber++;
                  break;
               case step is FightActionPointsVariationStep:
                  fapvs = step as FightActionPointsVariationStep;
                  if(fapvs.voluntarlyUsed)
                  {
                     startStep.push(fapvs);
                     removed = false;
                     continue;
                  }
                  break;
               case step is FightShieldPointsVariationStep:
                  fspvs = step as FightShieldPointsVariationStep;
                  if(fspvs.target == null)
                  {
                     break;
                  }
                  if(fspvs.value < 0)
                  {
                     fspvs.virtual = true;
                     if(shieldLoseSum[fspvs.target] == null)
                     {
                        shieldLoseSum[fspvs.target] = 0;
                     }
                     shieldLoseSum[fspvs.target] = shieldLoseSum[fspvs.target] + fspvs.value;
                     shieldLoseLastStep[fspvs.target] = fspvs;
                     break;
                  }
                  break;
               case step is FightLifeVariationStep:
                  flvs = step as FightLifeVariationStep;
                  if(flvs.target == null)
                  {
                     break;
                  }
                  if(flvs.delta < 0)
                  {
                     loseLifeStep[flvs.target] = flvs;
                  }
                  if(lifeLoseSum[flvs.target] == null)
                  {
                     lifeLoseSum[flvs.target] = 0;
                  }
                  lifeLoseSum[flvs.target] = lifeLoseSum[flvs.target] + flvs.delta;
                  lifeLoseLastStep[flvs.target] = flvs;
                  break;
               case step is AddGfxEntityStep:
               case step is AddGfxInLineStep:
               case step is AddGlyphGfxStep:
               case step is ParableGfxMovementStep:
               case step is AddWorldEntityStep:
                  if(!allowSpellEffects && PlayedCharacterManager.getInstance().isFighting)
                  {
                     continue;
                  }
                  break;
            }
            removed = false;
            cleanedBuffer.unshift(step);
         }
         this._fightBattleFrame.deathPlayingNumber = deathNumber;
         for each(b in cleanedBuffer)
         {
            if(b is FightLifeVariationStep && lifeLoseSum[b.target] == 0 && shieldLoseSum[b.target] != null)
            {
               b.skipTextEvent = true;
            }
         }
         for(index in lifeLoseSum)
         {
            if(index != "null" && lifeLoseSum[index] != 0)
            {
               idx = cleanedBuffer.indexOf(lifeLoseLastStep[index]);
               cleanedBuffer.splice(idx,0,new FightLossAnimStep(index,lifeLoseSum[index],FightLifeVariationStep.COLOR));
            }
            lifeLoseLastStep[index] = -1;
            lifeLoseSum[index] = 0;
         }
         for(index in shieldLoseSum)
         {
            if(index != "null" && shieldLoseSum[index] != 0)
            {
               idx2 = cleanedBuffer.indexOf(shieldLoseLastStep[index]);
               cleanedBuffer.splice(idx2,0,new FightLossAnimStep(index,shieldLoseSum[index],FightShieldPointsVariationStep.COLOR));
            }
            shieldLoseLastStep[index] = -1;
            shieldLoseSum[index] = 0;
         }
         for each(waitStep in entityAttaqueAnimWait)
         {
            endStep.push(waitStep);
         }
         if(allowHitAnim)
         {
            loop6:
            for(loseLifeTarget in loseLifeStep)
            {
               if(!hitStep[loseLifeTarget])
               {
                  for(j = 0; j < cleanedBuffer.length; )
                  {
                     if(cleanedBuffer[j] == loseLifeStep[loseLifeTarget])
                     {
                        cleanedBuffer.splice(j,0,new PlayAnimationStep(loseLifeTarget as TiphonSprite,AnimationEnum.ANIM_HIT,true,false));
                        continue loop6;
                     }
                     j++;
                  }
               }
            }
         }
         cleanedBuffer = startStep.concat(cleanedBuffer).concat(endStep);
         for each(step in cleanedBuffer)
         {
            this._sequencer.addStep(step);
         }
         this.clearBuffer();
         if(callback != null && !this._parent)
         {
            this._sequenceEndCallback = callback;
            this._permanentTooltipsCallback = new Callback(this.showPermanentTooltips,cleanedBuffer);
            this._sequencer.addEventListener(SequencerEvent.SEQUENCE_END,this.onSequenceEnd);
         }
         _lastCastingSpell = this._castingSpell;
         this._scriptInit = true;
         if(!this._parent)
         {
            if(!this._subSequenceWaitingCount)
            {
               this._sequencer.start();
            }
            else
            {
               _log.warn("Waiting sub sequence init end (" + this._subSequenceWaitingCount + " seq)");
            }
         }
         else
         {
            if(callback != null)
            {
               callback();
            }
            this._parent.subSequenceInitDone();
         }
      }
      
      private function onSequenceEnd(e:SequencerEvent) : void
      {
         this._sequencer.removeEventListener(SequencerEvent.SEQUENCE_END,this.onSequenceEnd);
         if(this._permanentTooltipsCallback)
         {
            this._permanentTooltipsCallback.exec();
         }
         this._sequenceEndCallback();
         this.updateMovementArea();
      }
      
      private function onStepEnd(e:SequencerEvent, isEnd:Boolean = true) : void
      {
         this._sequencer.removeEventListener(SequencerEvent.SEQUENCE_STEP_FINISH,this.onStepEnd);
      }
      
      private function subSequenceInitDone() : void
      {
         this._subSequenceWaitingCount--;
         if(!this.isWaiting && this._sequencer && !this._sequencer.running)
         {
            _log.warn("Sub sequence init end -- Run main sequence");
            this._sequencer.start();
         }
      }
      
      private function pushRefreshFighterStep(pFighterInfos:GameContextActorInformations) : void
      {
         this._stepsBuffer.push(new FightRefreshFighterStep(pFighterInfos));
      }
      
      private function pushMovementStep(fighterId:Number, path:MovementPath) : void
      {
         this._stepsBuffer.push(new CallbackStep(new Callback(deleteTooltip,fighterId)));
         var step:FightEntityMovementStep = new FightEntityMovementStep(fighterId,path);
         if(this.castingSpell != null)
         {
            step.castingSpellId = this.castingSpell.castingSpellId;
         }
         this._stepsBuffer.push(step);
      }
      
      private function pushTeleportStep(fighterId:Number, destinationCell:int) : void
      {
         var step:FightTeleportStep = null;
         this._stepsBuffer.push(new CallbackStep(new Callback(deleteTooltip,fighterId)));
         if(destinationCell != -1)
         {
            step = new FightTeleportStep(fighterId,MapPoint.fromCellId(destinationCell));
            if(this.castingSpell != null)
            {
               step.castingSpellId = this.castingSpell.castingSpellId;
            }
            this._stepsBuffer.push(step);
         }
      }
      
      private function pushExchangePositionsStep(fighterOneId:Number, fighterOneNewCell:int, fighterTwoId:Number, fighterTwoNewCell:int) : void
      {
         this._stepsBuffer.push(new CallbackStep(new Callback(deleteTooltip,fighterOneId)));
         this._stepsBuffer.push(new CallbackStep(new Callback(deleteTooltip,fighterTwoId)));
         var step:FightExchangePositionsStep = new FightExchangePositionsStep(fighterOneId,fighterOneNewCell,fighterTwoId,fighterTwoNewCell);
         if(this.castingSpell != null)
         {
            step.castingSpellId = this.castingSpell.castingSpellId;
         }
         this._stepsBuffer.push(step);
      }
      
      private function pushSlideStep(fighterId:Number, startCell:int, endCell:int) : void
      {
         if(startCell < 0 || endCell < 0)
         {
            return;
         }
         this._stepsBuffer.push(new CallbackStep(new Callback(deleteTooltip,fighterId)));
         var step:FightEntitySlideStep = new FightEntitySlideStep(fighterId,MapPoint.fromCellId(startCell),MapPoint.fromCellId(endCell));
         if(this.castingSpell != null)
         {
            step.castingSpellId = this.castingSpell.castingSpellId;
         }
         this._stepsBuffer.push(step);
      }
      
      private function pushSummonStep(summonerId:Number, summonInfos:GameFightFighterInformations) : void
      {
         var step:FightSummonStep = new FightSummonStep(summonerId,summonInfos);
         if(this.castingSpell != null)
         {
            step.castingSpellId = this.castingSpell.castingSpellId;
         }
         this._stepsBuffer.push(step);
      }
      
      private function pushVisibilityStep(fighterId:Number, visibility:Boolean) : void
      {
         var step:FightVisibilityStep = new FightVisibilityStep(fighterId,visibility);
         if(this.castingSpell != null)
         {
            step.castingSpellId = this.castingSpell.castingSpellId;
         }
         this._stepsBuffer.push(step);
      }
      
      private function pushMarkCellsStep(markId:int, markType:int, cells:Vector.<GameActionMarkedCell>, markSpellId:int, markSpellLevel:int, teamId:int, markImpactCell:int, markCasterId:Number) : void
      {
         var step:FightMarkCellsStep = new FightMarkCellsStep(markId,markType,cells,markSpellId,markSpellLevel,teamId,markImpactCell,markCasterId);
         if(this.castingSpell != null)
         {
            step.castingSpellId = this.castingSpell.castingSpellId;
         }
         this._stepsBuffer.push(step);
      }
      
      private function pushUnmarkCellsStep(markId:int) : void
      {
         var step:FightUnmarkCellsStep = new FightUnmarkCellsStep(markId);
         if(this.castingSpell != null)
         {
            step.castingSpellId = this.castingSpell.castingSpellId;
         }
         this._stepsBuffer.push(step);
      }
      
      private function pushChangeLookStep(fighterId:Number, newLook:EntityLook) : void
      {
         var step:FightChangeLookStep = new FightChangeLookStep(fighterId,EntityLookAdapter.fromNetwork(newLook));
         if(this.castingSpell != null)
         {
            step.castingSpellId = this.castingSpell.castingSpellId;
         }
         this._stepsBuffer.push(step);
      }
      
      private function pushChangeVisibilityStep(fighterId:Number, visibilityState:int) : void
      {
         var step:FightChangeVisibilityStep = new FightChangeVisibilityStep(fighterId,visibilityState);
         if(this.castingSpell != null)
         {
            step.castingSpellId = this.castingSpell.castingSpellId;
         }
         this._stepsBuffer.push(step);
      }
      
      private function pushFighterStatsListStep(stats:CharacterCharacteristicsInformations) : void
      {
         var step:FightFighterStatsListStep = new FightFighterStatsListStep(stats);
         if(this.castingSpell != null)
         {
            step.castingSpellId = this.castingSpell.castingSpellId;
         }
         this._stepsBuffer.push(step);
      }
      
      private function pushPointsVariationStep(fighterId:Number, actionId:uint, delta:int) : void
      {
         var step:IFightStep = null;
         switch(actionId)
         {
            case ActionIdProtocol.ACTION_CHARACTER_ACTION_POINTS_USE:
               step = new FightActionPointsVariationStep(fighterId,delta,true);
               break;
            case ActionIds.ACTION_CHARACTER_ACTION_POINTS_LOST:
            case ActionIds.ACTION_CHARACTER_ACTION_POINTS_WIN:
               step = new FightActionPointsVariationStep(fighterId,delta,false);
               break;
            case ActionIdProtocol.ACTION_CHARACTER_MOVEMENT_POINTS_USE:
               step = new FightMovementPointsVariationStep(fighterId,delta,true);
               break;
            case ActionIds.ACTION_CHARACTER_MOVEMENT_POINTS_LOST:
            case ActionIds.ACTION_CHARACTER_MOVEMENT_POINTS_WIN:
               step = new FightMovementPointsVariationStep(fighterId,delta,false);
               break;
            default:
               _log.warn("Points variation with unsupported action (" + actionId + "), skipping.");
               return;
         }
         if(this.castingSpell != null)
         {
            step.castingSpellId = this.castingSpell.castingSpellId;
         }
         this._stepsBuffer.push(step);
      }
      
      private function pushShieldPointsVariationStep(fighterId:Number, delta:int, elementId:int) : void
      {
         var step:FightShieldPointsVariationStep = new FightShieldPointsVariationStep(fighterId,delta,elementId);
         if(this.castingSpell != null)
         {
            step.castingSpellId = this.castingSpell.castingSpellId;
         }
         this._stepsBuffer.push(step);
      }
      
      private function pushTemporaryBoostStep(fighterId:Number, statName:String, duration:int, durationText:String, visible:Boolean = true, buff:BasicBuff = null) : void
      {
         var step:FightTemporaryBoostStep = new FightTemporaryBoostStep(fighterId,statName,duration,durationText,visible,buff);
         if(this.castingSpell != null)
         {
            step.castingSpellId = this.castingSpell.castingSpellId;
         }
         this._stepsBuffer.push(step);
      }
      
      private function pushPointsLossDodgeStep(fighterId:Number, actionId:uint, amount:int) : void
      {
         var step:IFightStep = null;
         switch(actionId)
         {
            case ActionIdProtocol.ACTION_FIGHT_SPELL_DODGED_PA:
               step = new FightActionPointsLossDodgeStep(fighterId,amount);
               break;
            case ActionIdProtocol.ACTION_FIGHT_SPELL_DODGED_PM:
               step = new FightMovementPointsLossDodgeStep(fighterId,amount);
               break;
            default:
               _log.warn("Points dodge with unsupported action (" + actionId + "), skipping.");
               return;
         }
         if(this.castingSpell != null)
         {
            step.castingSpellId = this.castingSpell.castingSpellId;
         }
         this._stepsBuffer.push(step);
      }
      
      private function pushLifePointsVariationStep(fighterId:Number, delta:int, permanentDamages:int, element:int) : void
      {
         var step:FightLifeVariationStep = new FightLifeVariationStep(fighterId,delta,permanentDamages,element);
         if(this.castingSpell != null)
         {
            step.castingSpellId = this.castingSpell.castingSpellId;
         }
         this._stepsBuffer.push(step);
      }
      
      private function pushDeathStep(fighterId:Number, naturalDeath:Boolean = true) : void
      {
         var step:FightDeathStep = new FightDeathStep(fighterId,naturalDeath);
         if(this.castingSpell != null)
         {
            step.castingSpellId = this.castingSpell.castingSpellId;
         }
         this._stepsBuffer.push(step);
      }
      
      private function pushVanishStep(fighterId:Number, sourceId:Number) : void
      {
         var step:FightVanishStep = new FightVanishStep(fighterId,sourceId);
         if(this.castingSpell != null)
         {
            step.castingSpellId = this.castingSpell.castingSpellId;
         }
         this._stepsBuffer.push(step);
      }
      
      private function pushDispellStep(fighterId:Number) : void
      {
         var step:FightDispellStep = new FightDispellStep(fighterId);
         if(this.castingSpell != null)
         {
            step.castingSpellId = this.castingSpell.castingSpellId;
         }
         this._stepsBuffer.push(step);
      }
      
      private function pushDispellEffectStep(fighterId:Number, boostUID:int) : void
      {
         var step:FightDispellEffectStep = new FightDispellEffectStep(fighterId,boostUID);
         if(this.castingSpell != null)
         {
            step.castingSpellId = this.castingSpell.castingSpellId;
         }
         this._stepsBuffer.push(step);
      }
      
      private function pushDispellSpellStep(fighterId:Number, spellId:int, verboseCast:Boolean) : void
      {
         var step:FightDispellSpellStep = new FightDispellSpellStep(fighterId,spellId,verboseCast);
         if(this.castingSpell != null)
         {
            step.castingSpellId = this.castingSpell.castingSpellId;
         }
         this._stepsBuffer.push(step);
      }
      
      private function pushSpellCooldownVariationStep(targetId:Number, actionId:int, spellId:int, delta:int) : void
      {
         var step:FightSpellCooldownVariationStep = new FightSpellCooldownVariationStep(targetId,actionId,spellId,delta);
         if(this.castingSpell != null)
         {
            step.castingSpellId = this.castingSpell.castingSpellId;
         }
         this._stepsBuffer.push(step);
      }
      
      private function pushSpellImmunityStep(targetId:Number) : void
      {
         var step:FightSpellImmunityStep = new FightSpellImmunityStep(targetId);
         if(this.castingSpell != null)
         {
            step.castingSpellId = this.castingSpell.castingSpellId;
         }
         this._stepsBuffer.push(step);
      }
      
      private function pushKillStep(fighterId:Number, killerId:Number) : void
      {
         var step:FightKillStep = new FightKillStep(fighterId,killerId);
         if(this.castingSpell != null)
         {
            step.castingSpellId = this.castingSpell.castingSpellId;
         }
         this._stepsBuffer.push(step);
      }
      
      private function pushReducedDamagesStep(fighterId:Number, amount:int) : void
      {
         var step:FightReducedDamagesStep = new FightReducedDamagesStep(fighterId,amount);
         if(this.castingSpell != null)
         {
            step.castingSpellId = this.castingSpell.castingSpellId;
         }
         this._stepsBuffer.push(step);
      }
      
      private function pushReflectedDamagesStep(fighterId:Number) : void
      {
         var step:FightReflectedDamagesStep = new FightReflectedDamagesStep(fighterId);
         if(this.castingSpell != null)
         {
            step.castingSpellId = this.castingSpell.castingSpellId;
         }
         this._stepsBuffer.push(step);
      }
      
      private function pushReflectedSpellStep(fighterId:Number) : void
      {
         var step:FightReflectedSpellStep = new FightReflectedSpellStep(fighterId);
         if(this.castingSpell != null)
         {
            step.castingSpellId = this.castingSpell.castingSpellId;
         }
         this._stepsBuffer.push(step);
      }
      
      private function pushPlaySpellScriptStep(fxScriptId:int, fighterId:Number, cellId:int, spellId:int, spellRank:uint, stepBuff:SpellScriptBuffer = null) : FightPlaySpellScriptStep
      {
         var step:FightPlaySpellScriptStep = new FightPlaySpellScriptStep(fxScriptId,fighterId,cellId,spellId,spellRank,!!stepBuff?stepBuff:this);
         if(this.castingSpell != null)
         {
            step.castingSpellId = this.castingSpell.castingSpellId;
         }
         this._stepsBuffer.push(step);
         return step;
      }
      
      private function pushSpellCastStep(fighterId:Number, cellId:int, sourceCellId:int, spellId:int, spellRank:uint, critical:uint, verboseCast:Boolean) : void
      {
         var step:FightSpellCastStep = new FightSpellCastStep(fighterId,cellId,sourceCellId,spellId,spellRank,critical,verboseCast);
         if(this.castingSpell != null)
         {
            step.castingSpellId = this.castingSpell.castingSpellId;
         }
         this._stepsBuffer.push(step);
      }
      
      private function pushCloseCombatStep(fighterId:Number, closeCombatWeaponId:uint, critical:uint, verboseCast:Boolean) : void
      {
         var step:FightCloseCombatStep = new FightCloseCombatStep(fighterId,closeCombatWeaponId,critical,verboseCast);
         if(this.castingSpell != null)
         {
            step.castingSpellId = this.castingSpell.castingSpellId;
         }
         this._stepsBuffer.push(step);
      }
      
      private function pushStealKamasStep(robberId:Number, victimId:Number, amount:Number) : void
      {
         var step:FightStealingKamasStep = new FightStealingKamasStep(robberId,victimId,amount);
         if(this.castingSpell != null)
         {
            step.castingSpellId = this.castingSpell.castingSpellId;
         }
         this._stepsBuffer.push(step);
      }
      
      private function pushTackledStep(fighterId:Number) : void
      {
         var step:FightTackledStep = new FightTackledStep(fighterId);
         if(this.castingSpell != null)
         {
            step.castingSpellId = this.castingSpell.castingSpellId;
         }
         this._stepsBuffer.push(step);
      }
      
      private function pushMarkTriggeredStep(fighterId:Number, casterId:Number, markId:int) : void
      {
         var step:FightMarkTriggeredStep = new FightMarkTriggeredStep(fighterId,casterId,markId);
         if(this.castingSpell != null)
         {
            step.castingSpellId = this.castingSpell.castingSpellId;
         }
         this._stepsBuffer.push(step);
      }
      
      private function pushMarkActivateStep(markId:int, active:Boolean) : void
      {
         var step:FightMarkActivateStep = new FightMarkActivateStep(markId,active);
         if(this.castingSpell != null)
         {
            step.castingSpellId = this.castingSpell.castingSpellId;
         }
         this._stepsBuffer.push(step);
      }
      
      private function pushDisplayBuffStep(buff:BasicBuff) : void
      {
         var step:FightDisplayBuffStep = new FightDisplayBuffStep(buff);
         if(this.castingSpell != null)
         {
            step.castingSpellId = this.castingSpell.castingSpellId;
         }
         this._stepsBuffer.push(step);
      }
      
      private function pushModifyEffectsDurationStep(sourceId:Number, targetId:Number, delta:int) : void
      {
         var step:FightModifyEffectsDurationStep = new FightModifyEffectsDurationStep(sourceId,targetId,delta);
         if(this.castingSpell != null)
         {
            step.castingSpellId = this.castingSpell.castingSpellId;
         }
         this._stepsBuffer.push(step);
      }
      
      private function pushCarryCharacterStep(fighterId:Number, carriedId:Number, cellId:int) : void
      {
         var step:FightCarryCharacterStep = new FightCarryCharacterStep(fighterId,carriedId,cellId);
         if(this.castingSpell != null)
         {
            step.castingSpellId = this.castingSpell.castingSpellId;
         }
         this._stepsBuffer.push(step);
         this._stepsBuffer.push(new CallbackStep(new Callback(deleteTooltip,carriedId)));
      }
      
      private function pushThrowCharacterStep(fighterId:Number, carriedId:Number, cellId:int) : void
      {
         var step:FightThrowCharacterStep = new FightThrowCharacterStep(fighterId,carriedId,cellId);
         if(this.castingSpell != null)
         {
            step.castingSpellId = this.castingSpell.castingSpellId;
            step.portals = this.castingSpell.portalMapPoints;
            step.portalIds = this.castingSpell.portalIds;
         }
         this._stepsBuffer.push(step);
      }
      
      private function pushFightInvisibleTemporarilyDetectedStep(targetId:Number, cellId:uint) : void
      {
         var targetSprite:AnimatedCharacter = DofusEntities.getEntity(targetId) as AnimatedCharacter;
         var step:FightInvisibleTemporarilyDetectedStep = new FightInvisibleTemporarilyDetectedStep(targetSprite,cellId);
         if(this.castingSpell != null)
         {
            step.castingSpellId = this.castingSpell.castingSpellId;
         }
         this._stepsBuffer.push(step);
      }
      
      private function pushTurnListStep(turnsList:Vector.<Number>, deadTurnsList:Vector.<Number>) : void
      {
         var step:FightTurnListStep = new FightTurnListStep(turnsList,deadTurnsList);
         if(this.castingSpell != null)
         {
            step.castingSpellId = this.castingSpell.castingSpellId;
         }
         this._stepsBuffer.push(step);
      }
      
      private function clearBuffer() : void
      {
         this._stepsBuffer = new Vector.<ISequencable>(0,false);
      }
      
      private function keepInMindToUpdateMovementArea() : void
      {
         if(this._updateMovementAreaAtSequenceEnd)
         {
            return;
         }
         var fightTurnFrame:FightTurnFrame = Kernel.getWorker().getFrame(FightTurnFrame) as FightTurnFrame;
         if(fightTurnFrame && fightTurnFrame.myTurn)
         {
            this._updateMovementAreaAtSequenceEnd = true;
         }
      }
      
      private function updateMovementArea() : void
      {
         if(!this._updateMovementAreaAtSequenceEnd)
         {
            return;
         }
         var fightTurnFrame:FightTurnFrame = Kernel.getWorker().getFrame(FightTurnFrame) as FightTurnFrame;
         if(fightTurnFrame && fightTurnFrame.myTurn)
         {
            fightTurnFrame.drawMovementArea();
            this._updateMovementAreaAtSequenceEnd = false;
         }
      }
      
      private function showTargetTooltip(pEntityId:Number) : void
      {
         var fcf:FightContextFrame = Kernel.getWorker().getFrame(FightContextFrame) as FightContextFrame;
         var entityInfos:GameFightFighterInformations = this.fightEntitiesFrame.getEntityInfos(pEntityId) as GameFightFighterInformations;
         if(entityInfos.alive && this._castingSpell && (this._castingSpell.casterId == PlayedCharacterManager.getInstance().id || fcf.battleFrame.playingSlaveEntity) && pEntityId != this.castingSpell.casterId && this._fightBattleFrame.targetedEntities.indexOf(pEntityId) == -1 && fcf.hiddenEntites.indexOf(pEntityId) == -1)
         {
            this._fightBattleFrame.targetedEntities.push(pEntityId);
            if(OptionManager.getOptionManager("dofus")["showPermanentTargetsTooltips"] == true)
            {
               fcf.displayEntityTooltip(pEntityId);
            }
         }
      }
      
      private function isSpellTeleportingToPreviousPosition() : Boolean
      {
         var spellEffect:EffectInstanceDice = null;
         if(this.castingSpell && this.castingSpell.spellRank)
         {
            for each(spellEffect in this.castingSpell.spellRank.effects)
            {
               if(spellEffect.effectId == ActionIds.ACTION_FIGHT_ROLLBACK_PREVIOUS_POSITION)
               {
                  return true;
               }
            }
         }
         return false;
      }
      
      private function showPermanentTooltips(pSteps:Array) : void
      {
         var step:AbstractSequencable = null;
         var targetId:Number = NaN;
         for each(step in pSteps)
         {
            if(step is IFightStep && !(step is FightTurnListStep))
            {
               for each(targetId in (step as IFightStep).targets)
               {
                  if(this.fightEntitiesFrame.getEntityInfos(targetId) && this.fightEntitiesFrame.getEntityInfos(targetId).disposition.cellId != -1)
                  {
                     this.showTargetTooltip(targetId);
                  }
               }
            }
         }
      }
   }
}
