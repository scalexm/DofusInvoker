package com.ankamagames.dofus.logic.game.fight.frames
{
   import com.ankamagames.atouin.Atouin;
   import com.ankamagames.atouin.enums.PlacementStrataEnums;
   import com.ankamagames.atouin.managers.EntitiesManager;
   import com.ankamagames.atouin.managers.InteractiveCellManager;
   import com.ankamagames.atouin.managers.MapDisplayManager;
   import com.ankamagames.atouin.managers.SelectionManager;
   import com.ankamagames.atouin.messages.CellOutMessage;
   import com.ankamagames.atouin.messages.CellOverMessage;
   import com.ankamagames.atouin.messages.MapLoadedMessage;
   import com.ankamagames.atouin.messages.MapsLoadingCompleteMessage;
   import com.ankamagames.atouin.renderers.ZoneDARenderer;
   import com.ankamagames.atouin.types.Selection;
   import com.ankamagames.berilia.Berilia;
   import com.ankamagames.berilia.enums.StrataEnum;
   import com.ankamagames.berilia.managers.KernelEventsManager;
   import com.ankamagames.berilia.managers.SecureCenter;
   import com.ankamagames.berilia.managers.TooltipManager;
   import com.ankamagames.berilia.managers.UiModuleManager;
   import com.ankamagames.berilia.types.LocationEnum;
   import com.ankamagames.berilia.types.event.UiUnloadEvent;
   import com.ankamagames.berilia.types.tooltip.TooltipPlacer;
   import com.ankamagames.berilia.types.tooltip.event.TooltipEvent;
   import com.ankamagames.dofus.datacenter.monsters.Companion;
   import com.ankamagames.dofus.datacenter.monsters.Monster;
   import com.ankamagames.dofus.datacenter.npcs.TaxCollectorFirstname;
   import com.ankamagames.dofus.datacenter.npcs.TaxCollectorName;
   import com.ankamagames.dofus.datacenter.spells.Spell;
   import com.ankamagames.dofus.datacenter.spells.SpellLevel;
   import com.ankamagames.dofus.datacenter.world.SubArea;
   import com.ankamagames.dofus.internalDatacenter.fight.ChallengeWrapper;
   import com.ankamagames.dofus.internalDatacenter.fight.FightResultEntryWrapper;
   import com.ankamagames.dofus.internalDatacenter.items.ItemWrapper;
   import com.ankamagames.dofus.internalDatacenter.spells.SpellWrapper;
   import com.ankamagames.dofus.internalDatacenter.world.WorldPointWrapper;
   import com.ankamagames.dofus.kernel.Kernel;
   import com.ankamagames.dofus.kernel.net.ConnectionsHandler;
   import com.ankamagames.dofus.kernel.sound.SoundManager;
   import com.ankamagames.dofus.kernel.sound.enum.UISoundEnum;
   import com.ankamagames.dofus.logic.common.managers.HyperlinkShowCellManager;
   import com.ankamagames.dofus.logic.common.managers.PlayerManager;
   import com.ankamagames.dofus.logic.game.common.frames.BreachFrame;
   import com.ankamagames.dofus.logic.game.common.frames.PartyManagementFrame;
   import com.ankamagames.dofus.logic.game.common.frames.PointCellFrame;
   import com.ankamagames.dofus.logic.game.common.frames.QuestFrame;
   import com.ankamagames.dofus.logic.game.common.frames.SpellInventoryManagementFrame;
   import com.ankamagames.dofus.logic.game.common.managers.PlayedCharacterManager;
   import com.ankamagames.dofus.logic.game.common.managers.SpeakingItemManager;
   import com.ankamagames.dofus.logic.game.common.managers.SubhintManager;
   import com.ankamagames.dofus.logic.game.common.messages.FightEndingMessage;
   import com.ankamagames.dofus.logic.game.common.misc.DofusEntities;
   import com.ankamagames.dofus.logic.game.fight.actions.ChallengeTargetsListRequestAction;
   import com.ankamagames.dofus.logic.game.fight.actions.ShowTacticModeAction;
   import com.ankamagames.dofus.logic.game.fight.actions.TimelineEntityOutAction;
   import com.ankamagames.dofus.logic.game.fight.actions.TimelineEntityOverAction;
   import com.ankamagames.dofus.logic.game.fight.actions.TogglePointCellAction;
   import com.ankamagames.dofus.logic.game.fight.fightEvents.FightEventsHelper;
   import com.ankamagames.dofus.logic.game.fight.frames.Preview.DamagePreview;
   import com.ankamagames.dofus.logic.game.fight.managers.BuffManager;
   import com.ankamagames.dofus.logic.game.fight.managers.CurrentPlayedFighterManager;
   import com.ankamagames.dofus.logic.game.fight.managers.LinkedCellsManager;
   import com.ankamagames.dofus.logic.game.fight.managers.MarkedCellsManager;
   import com.ankamagames.dofus.logic.game.fight.managers.SpellDamagesManager;
   import com.ankamagames.dofus.logic.game.fight.managers.TacticModeManager;
   import com.ankamagames.dofus.logic.game.fight.miscs.FightReachableCellsMaker;
   import com.ankamagames.dofus.logic.game.fight.types.BasicBuff;
   import com.ankamagames.dofus.logic.game.fight.types.CastingSpell;
   import com.ankamagames.dofus.logic.game.fight.types.FightEventEnum;
   import com.ankamagames.dofus.logic.game.fight.types.MarkInstance;
   import com.ankamagames.dofus.logic.game.fight.types.SpellCastInFightManager;
   import com.ankamagames.dofus.logic.game.fight.types.StatBuff;
   import com.ankamagames.dofus.logic.game.roleplay.frames.EntitiesTooltipsFrame;
   import com.ankamagames.dofus.logic.game.roleplay.managers.MountAutoTripManager;
   import com.ankamagames.dofus.misc.lists.FightHookList;
   import com.ankamagames.dofus.misc.lists.HookList;
   import com.ankamagames.dofus.misc.lists.TriggerHookList;
   import com.ankamagames.dofus.network.enums.FightOutcomeEnum;
   import com.ankamagames.dofus.network.enums.FightTypeEnum;
   import com.ankamagames.dofus.network.enums.GameActionFightInvisibilityStateEnum;
   import com.ankamagames.dofus.network.enums.MapObstacleStateEnum;
   import com.ankamagames.dofus.network.enums.TeamEnum;
   import com.ankamagames.dofus.network.messages.game.actions.fight.GameActionFightCarryCharacterMessage;
   import com.ankamagames.dofus.network.messages.game.actions.fight.GameActionFightNoSpellCastMessage;
   import com.ankamagames.dofus.network.messages.game.context.GameContextDestroyMessage;
   import com.ankamagames.dofus.network.messages.game.context.GameContextReadyMessage;
   import com.ankamagames.dofus.network.messages.game.context.fight.GameFightEndMessage;
   import com.ankamagames.dofus.network.messages.game.context.fight.GameFightJoinMessage;
   import com.ankamagames.dofus.network.messages.game.context.fight.GameFightLeaveMessage;
   import com.ankamagames.dofus.network.messages.game.context.fight.GameFightResumeMessage;
   import com.ankamagames.dofus.network.messages.game.context.fight.GameFightResumeWithSlavesMessage;
   import com.ankamagames.dofus.network.messages.game.context.fight.GameFightSpectateMessage;
   import com.ankamagames.dofus.network.messages.game.context.fight.GameFightSpectatorJoinMessage;
   import com.ankamagames.dofus.network.messages.game.context.fight.GameFightStartMessage;
   import com.ankamagames.dofus.network.messages.game.context.fight.GameFightStartingMessage;
   import com.ankamagames.dofus.network.messages.game.context.fight.GameFightUpdateTeamMessage;
   import com.ankamagames.dofus.network.messages.game.context.fight.arena.ArenaFighterLeaveMessage;
   import com.ankamagames.dofus.network.messages.game.context.fight.breach.BreachGameFightEndMessage;
   import com.ankamagames.dofus.network.messages.game.context.fight.challenge.ChallengeInfoMessage;
   import com.ankamagames.dofus.network.messages.game.context.fight.challenge.ChallengeResultMessage;
   import com.ankamagames.dofus.network.messages.game.context.fight.challenge.ChallengeTargetUpdateMessage;
   import com.ankamagames.dofus.network.messages.game.context.fight.challenge.ChallengeTargetsListMessage;
   import com.ankamagames.dofus.network.messages.game.context.fight.challenge.ChallengeTargetsListRequestMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.CurrentMapInstanceMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.CurrentMapMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.MapObstacleUpdateMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.breach.BreachEnterMessage;
   import com.ankamagames.dofus.network.types.game.action.fight.FightDispellableEffectExtendedInformations;
   import com.ankamagames.dofus.network.types.game.actions.fight.GameActionMark;
   import com.ankamagames.dofus.network.types.game.actions.fight.GameActionMarkedCell;
   import com.ankamagames.dofus.network.types.game.context.fight.FightResultFighterListEntry;
   import com.ankamagames.dofus.network.types.game.context.fight.FightResultListEntry;
   import com.ankamagames.dofus.network.types.game.context.fight.FightResultPlayerListEntry;
   import com.ankamagames.dofus.network.types.game.context.fight.FightResultTaxCollectorListEntry;
   import com.ankamagames.dofus.network.types.game.context.fight.GameFightCharacterInformations;
   import com.ankamagames.dofus.network.types.game.context.fight.GameFightEntityInformation;
   import com.ankamagames.dofus.network.types.game.context.fight.GameFightFighterInformations;
   import com.ankamagames.dofus.network.types.game.context.fight.GameFightFighterNamedInformations;
   import com.ankamagames.dofus.network.types.game.context.fight.GameFightMonsterInformations;
   import com.ankamagames.dofus.network.types.game.context.fight.GameFightMutantInformations;
   import com.ankamagames.dofus.network.types.game.context.fight.GameFightResumeSlaveInfo;
   import com.ankamagames.dofus.network.types.game.context.fight.GameFightTaxCollectorInformations;
   import com.ankamagames.dofus.network.types.game.context.roleplay.party.NamedPartyTeam;
   import com.ankamagames.dofus.network.types.game.context.roleplay.party.NamedPartyTeamWithOutcome;
   import com.ankamagames.dofus.network.types.game.idol.Idol;
   import com.ankamagames.dofus.network.types.game.interactive.MapObstacle;
   import com.ankamagames.dofus.types.entities.AnimatedCharacter;
   import com.ankamagames.dofus.types.entities.Glyph;
   import com.ankamagames.dofus.types.sequences.AddGlyphGfxStep;
   import com.ankamagames.dofus.uiApi.PlayedCharacterApi;
   import com.ankamagames.jerakine.data.I18n;
   import com.ankamagames.jerakine.data.XmlConfig;
   import com.ankamagames.jerakine.entities.interfaces.IDisplayable;
   import com.ankamagames.jerakine.entities.interfaces.IEntity;
   import com.ankamagames.jerakine.entities.interfaces.IInteractive;
   import com.ankamagames.jerakine.entities.messages.EntityMouseOutMessage;
   import com.ankamagames.jerakine.entities.messages.EntityMouseOverMessage;
   import com.ankamagames.jerakine.interfaces.IRectangle;
   import com.ankamagames.jerakine.logger.Log;
   import com.ankamagames.jerakine.logger.Logger;
   import com.ankamagames.jerakine.managers.OptionManager;
   import com.ankamagames.jerakine.messages.Frame;
   import com.ankamagames.jerakine.messages.Message;
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.sequencer.SerialSequencer;
   import com.ankamagames.jerakine.types.Color;
   import com.ankamagames.jerakine.types.enums.Priority;
   import com.ankamagames.jerakine.types.events.PropertyChangeEvent;
   import com.ankamagames.jerakine.types.positions.MapPoint;
   import com.ankamagames.jerakine.types.zones.Custom;
   import com.ankamagames.jerakine.utils.display.spellZone.SpellShapeEnum;
   import com.ankamagames.jerakine.utils.memory.WeakReference;
   import com.hurlant.util.Hex;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.TimerEvent;
   import flash.filters.ColorMatrixFilter;
   import flash.filters.GlowFilter;
   import flash.utils.ByteArray;
   import flash.utils.Dictionary;
   import flash.utils.Timer;
   import flash.utils.getQualifiedClassName;
   import flash.utils.getTimer;
   import tools.enumeration.GameActionMarkTypeEnum;
   
   public class FightContextFrame implements Frame
   {
      
      protected static const _log:Logger = Log.getLogger(getQualifiedClassName(FightContextFrame));
      
      public static var preFightIsActive:Boolean = true;
      
      public static var fighterEntityTooltipId:Number;
      
      public static var currentCell:int = -1;
       
      
      private const INVISIBLE_POSITION_SELECTION:String = "invisible_position";
      
      protected const REACHABLE_CELL_COLOR:int = 26112;
      
      protected const UNREACHABLE_CELL_COLOR:int = 6684672;
      
      private var _entitiesFrame:FightEntitiesFrame;
      
      private var _preparationFrame:FightPreparationFrame;
      
      private var _battleFrame:FightBattleFrame;
      
      private var _overEffectOk:GlowFilter;
      
      private var _overEffectKo:GlowFilter;
      
      private var _linkedEffect:ColorMatrixFilter;
      
      private var _linkedMainEffect:ColorMatrixFilter;
      
      private var _lastEffectEntity:WeakReference;
      
      private var _timerFighterInfo:Timer;
      
      private var _timerMovementRange:Timer;
      
      private var _currentFighterInfo:GameFightFighterInformations;
      
      private var _currentMapRenderId:int = -1;
      
      private var _timelineOverEntity:Boolean;
      
      private var _timelineOverEntityId:Number;
      
      private var _showPermanentTooltips:Boolean;
      
      private var _hiddenEntites:Array;
      
      public var _challengesList:Array;
      
      private var _fightType:uint;
      
      private var _fightAttackerId:Number;
      
      private var _spellTargetsTooltips:Dictionary;
      
      private var _tooltipLastUpdate:Dictionary;
      
      private var _namedPartyTeams:Vector.<NamedPartyTeam>;
      
      private var _fightersPositionsHistory:Dictionary;
      
      private var _fightersRoundStartPosition:Dictionary;
      
      private var _fightIdols:Vector.<Idol>;
      
      private var _mustShowTreasureHuntMask:Boolean = false;
      
      private var _roleplayGridDisplayed:Boolean;
      
      public var isFightLeader:Boolean;
      
      public var onlyTheOtherTeamCanPlace:Boolean = false;
      
      public function FightContextFrame()
      {
         this._hiddenEntites = [];
         this._spellTargetsTooltips = new Dictionary();
         this._tooltipLastUpdate = new Dictionary();
         this._fightersPositionsHistory = new Dictionary();
         this._fightersRoundStartPosition = new Dictionary();
         super();
         DamagePreview.init();
      }
      
      public function get priority() : int
      {
         return Priority.NORMAL;
      }
      
      public function get entitiesFrame() : FightEntitiesFrame
      {
         return this._entitiesFrame;
      }
      
      public function get battleFrame() : FightBattleFrame
      {
         return this._battleFrame;
      }
      
      public function get preparationFrame() : FightPreparationFrame
      {
         return this._preparationFrame;
      }
      
      public function get challengesList() : Array
      {
         return this._challengesList;
      }
      
      public function get fightType() : uint
      {
         return this._fightType;
      }
      
      public function set fightType(t:uint) : void
      {
         this._fightType = t;
         var partyFrame:PartyManagementFrame = Kernel.getWorker().getFrame(PartyManagementFrame) as PartyManagementFrame;
         partyFrame.lastFightType = t;
      }
      
      public function get timelineOverEntity() : Boolean
      {
         return this._timelineOverEntity;
      }
      
      public function get timelineOverEntityId() : Number
      {
         return this._timelineOverEntityId;
      }
      
      public function get showPermanentTooltips() : Boolean
      {
         return this._showPermanentTooltips;
      }
      
      public function get hiddenEntites() : Array
      {
         return this._hiddenEntites;
      }
      
      public function get fightersPositionsHistory() : Dictionary
      {
         return this._fightersPositionsHistory;
      }
      
      public function pushed() : Boolean
      {
         if(!Kernel.beingInReconection)
         {
            this._roleplayGridDisplayed = Atouin.getInstance().options.alwaysShowGrid;
            if(Berilia.getInstance().getUi("banner").uiClass.tacticModeActivated && OptionManager.getOptionManager("dofus")["useNewTacticalMode"])
            {
               Atouin.getInstance().displayGrid(false,true);
            }
            else
            {
               Atouin.getInstance().displayGrid(true,true);
            }
         }
         currentCell = -1;
         this._overEffectOk = new GlowFilter(16777215,1,4,4,3,1);
         this._overEffectKo = new GlowFilter(14090240,1,4,4,3,1);
         var matrix:Array = [0.5,0,0,0,100,0,0.5,0,0,100,0,0,0.5,0,100,0,0,0,1,0];
         this._linkedEffect = new ColorMatrixFilter(matrix);
         var matrix2:Array = [0.5,0,0,0,0,0,0.5,0,0,0,0,0,0.5,0,0,0,0,0,1,0];
         this._linkedMainEffect = new ColorMatrixFilter(matrix2);
         this._entitiesFrame = new FightEntitiesFrame();
         this._preparationFrame = new FightPreparationFrame(this);
         this._battleFrame = new FightBattleFrame();
         this._challengesList = [];
         this._timerFighterInfo = new Timer(100,1);
         this._timerFighterInfo.addEventListener(TimerEvent.TIMER,this.showFighterInfo,false,0,true);
         this._timerMovementRange = new Timer(200,1);
         this._timerMovementRange.addEventListener(TimerEvent.TIMER,this.showMovementRange,false,0,true);
         if(MapDisplayManager.getInstance().getDataMapContainer())
         {
            MapDisplayManager.getInstance().getDataMapContainer().setTemporaryAnimatedElementState(false);
         }
         if(Kernel.getWorker().contains(EntitiesTooltipsFrame))
         {
            Kernel.getWorker().removeFrame(Kernel.getWorker().getFrame(EntitiesTooltipsFrame) as EntitiesTooltipsFrame);
         }
         this._showPermanentTooltips = OptionManager.getOptionManager("dofus")["showPermanentTargetsTooltips"];
         OptionManager.getOptionManager("dofus").addEventListener(PropertyChangeEvent.PROPERTY_CHANGED,this.onPropertyChanged);
         Berilia.getInstance().addEventListener(UiUnloadEvent.UNLOAD_UI_COMPLETE,this.onUiUnloaded);
         Berilia.getInstance().addEventListener(UiUnloadEvent.UNLOAD_UI_STARTED,this.onUiUnloadStarted);
         Berilia.getInstance().addEventListener(TooltipEvent.TOOLTIPS_ORDERED,this.onTooltipsOrdered);
         try
         {
            Berilia.getInstance().uiSavedModificationPresetName = "fight";
         }
         catch(error:Error)
         {
            _log.error("Failed to set uiSavedModificationPresetName to \'fight\'!\n" + error.message + "\n" + error.getStackTrace());
         }
         return true;
      }
      
      private function onUiUnloaded(pEvent:UiUnloadEvent) : void
      {
         var entityId:Number = NaN;
         if(this._showPermanentTooltips && this.battleFrame)
         {
            for each(entityId in this.battleFrame.targetedEntities)
            {
               this.displayEntityTooltip(entityId);
            }
         }
      }
      
      public function getFighterName(fighterId:Number) : String
      {
         var fighterInfos:GameFightFighterInformations = null;
         var compInfos:GameFightEntityInformation = null;
         var name:String = null;
         var genericName:String = null;
         var taxInfos:GameFightTaxCollectorInformations = null;
         var masterName:String = null;
         fighterInfos = this.getFighterInfos(fighterId);
         if(!fighterInfos)
         {
            return "Unknown Fighter";
         }
         switch(true)
         {
            case fighterInfos is GameFightFighterNamedInformations:
               return (fighterInfos as GameFightFighterNamedInformations).name;
            case fighterInfos is GameFightMonsterInformations:
               return Monster.getMonsterById((fighterInfos as GameFightMonsterInformations).creatureGenericId).name;
            case fighterInfos is GameFightEntityInformation:
               compInfos = fighterInfos as GameFightEntityInformation;
               genericName = Companion.getCompanionById(compInfos.entityModelId).name;
               if(compInfos.masterId != PlayedCharacterManager.getInstance().id)
               {
                  masterName = this.getFighterName(compInfos.masterId);
                  name = I18n.getUiText("ui.common.belonging",[genericName,masterName]);
               }
               else
               {
                  name = genericName;
               }
               return name;
            case fighterInfos is GameFightTaxCollectorInformations:
               taxInfos = fighterInfos as GameFightTaxCollectorInformations;
               return TaxCollectorFirstname.getTaxCollectorFirstnameById(taxInfos.firstNameId).firstname + " " + TaxCollectorName.getTaxCollectorNameById(taxInfos.lastNameId).name;
            default:
               return "Unknown Fighter Type";
         }
      }
      
      public function getFighterLevel(fighterId:Number) : uint
      {
         var entity:* = null;
         var creatureLevel:uint = 0;
         var minLevel:uint = 0;
         var fighterInfos:GameFightFighterInformations = this.getFighterInfos(fighterId);
         if(!fighterInfos)
         {
            return 0;
         }
         switch(true)
         {
            case fighterInfos is GameFightMutantInformations:
               return (fighterInfos as GameFightMutantInformations).powerLevel;
            case fighterInfos is GameFightCharacterInformations:
               return (fighterInfos as GameFightCharacterInformations).level;
            case fighterInfos is GameFightEntityInformation:
               return (fighterInfos as GameFightEntityInformation).level;
            case fighterInfos is GameFightMonsterInformations:
               if(this.fightType == FightTypeEnum.FIGHT_TYPE_BREACH)
               {
                  minLevel = uint.MAX_VALUE;
                  for(entity in this._entitiesFrame.entities)
                  {
                     if(this._entitiesFrame.entities[entity] is GameFightMonsterInformations)
                     {
                        creatureLevel = this._entitiesFrame.entities[entity].creatureLevel;
                        if((fighterInfos as GameFightMonsterInformations).creatureGenericId == this._entitiesFrame.entities[entity].creatureGenericId && (this._entitiesFrame.entities[entity] as GameFightMonsterInformations).stats.summoned)
                        {
                           return creatureLevel;
                        }
                        if(!(this._entitiesFrame.entities[entity] as GameFightMonsterInformations).stats.summoned)
                        {
                           if(minLevel > creatureLevel)
                           {
                              minLevel = creatureLevel;
                           }
                        }
                     }
                  }
                  return minLevel;
               }
               if(fighterInfos.stats.summoned)
               {
                  return this.getFighterLevel(fighterInfos.stats.summoner);
               }
               return (fighterInfos as GameFightMonsterInformations).creatureLevel;
            case fighterInfos is GameFightTaxCollectorInformations:
               return (fighterInfos as GameFightTaxCollectorInformations).level;
            default:
               return 0;
         }
      }
      
      public function getChallengeById(challengeId:uint) : ChallengeWrapper
      {
         var challenge:ChallengeWrapper = null;
         for each(challenge in this._challengesList)
         {
            if(challenge.id == challengeId)
            {
               return challenge;
            }
         }
         return null;
      }
      
      public function process(msg:Message) : Boolean
      {
         /*
          * Decompilation error
          * Timeout (1 minute) was reached
          * Instruction count: 3958
          */
         throw new flash.errors.IllegalOperationError("Not decompiled due to timeout");
      }
      
      public function pulled() : Boolean
      {
         if(TacticModeManager.getInstance().tacticModeActivated)
         {
            TacticModeManager.getInstance().hide(true);
         }
         if(this._entitiesFrame)
         {
            Kernel.getWorker().removeFrame(this._entitiesFrame);
         }
         if(this._preparationFrame)
         {
            Kernel.getWorker().removeFrame(this._preparationFrame);
         }
         if(this._battleFrame)
         {
            Kernel.getWorker().removeFrame(this._battleFrame);
         }
         SerialSequencer.clearByType(FightSequenceFrame.FIGHT_SEQUENCERS_CATEGORY);
         this._preparationFrame = null;
         this._battleFrame = null;
         this._lastEffectEntity = null;
         this.removeSpellTargetsTooltips();
         TooltipManager.hideAll();
         this._timerFighterInfo.reset();
         this._timerFighterInfo.removeEventListener(TimerEvent.TIMER,this.showFighterInfo);
         this._timerFighterInfo = null;
         this._timerMovementRange.reset();
         this._timerMovementRange.removeEventListener(TimerEvent.TIMER,this.showMovementRange);
         this._timerMovementRange = null;
         this._currentFighterInfo = null;
         if(MapDisplayManager.getInstance().getDataMapContainer())
         {
            MapDisplayManager.getInstance().getDataMapContainer().setTemporaryAnimatedElementState(true);
         }
         Atouin.getInstance().displayGrid(this._roleplayGridDisplayed);
         OptionManager.getOptionManager("dofus").removeEventListener(PropertyChangeEvent.PROPERTY_CHANGED,this.onPropertyChanged);
         Berilia.getInstance().removeEventListener(UiUnloadEvent.UNLOAD_UI_COMPLETE,this.onUiUnloaded);
         var simf:SpellInventoryManagementFrame = Kernel.getWorker().getFrame(SpellInventoryManagementFrame) as SpellInventoryManagementFrame;
         simf.deleteSpellsGlobalCoolDownsData();
         PlayedCharacterManager.getInstance().isSpectator = false;
         Berilia.getInstance().removeEventListener(UiUnloadEvent.UNLOAD_UI_STARTED,this.onUiUnloadStarted);
         Berilia.getInstance().removeEventListener(TooltipEvent.TOOLTIPS_ORDERED,this.onTooltipsOrdered);
         try
         {
            Berilia.getInstance().uiSavedModificationPresetName = null;
         }
         catch(error:Error)
         {
            _log.error("Failed to reset uiSavedModificationPresetName!\n" + error.message + "\n" + error.getStackTrace());
         }
         return true;
      }
      
      public function outEntity(id:Number) : void
      {
         var entityId:Number = NaN;
         var ttName:String = null;
         var entitiesOnCell:Array = null;
         var entityOnCell:AnimatedCharacter = null;
         this._timerFighterInfo.reset();
         this._timerMovementRange.reset();
         var tooltipsEntitiesIds:Vector.<Number> = new Vector.<Number>(0);
         tooltipsEntitiesIds.push(id);
         var entitiesIdsList:Vector.<Number> = this._entitiesFrame.getEntitiesIdsList();
         fighterEntityTooltipId = id;
         var entity:IEntity = DofusEntities.getEntity(fighterEntityTooltipId);
         if(!entity || !entity.position)
         {
            if(entitiesIdsList.indexOf(fighterEntityTooltipId) == -1)
            {
               _log.info("Mouse out an unknown entity : " + id);
               return;
            }
         }
         else
         {
            entitiesOnCell = EntitiesManager.getInstance().getEntitiesOnCell(entity.position.cellId,AnimatedCharacter);
            for each(entityOnCell in entitiesOnCell)
            {
               if(tooltipsEntitiesIds.indexOf(entityOnCell.id) == -1)
               {
                  tooltipsEntitiesIds.push(entityOnCell.id);
               }
            }
         }
         if(this._lastEffectEntity && this._lastEffectEntity.object)
         {
            Sprite(this._lastEffectEntity.object).filters = [];
         }
         this._lastEffectEntity = null;
         var fscf:FightSpellCastFrame = Kernel.getWorker().getFrame(FightSpellCastFrame) as FightSpellCastFrame;
         for each(entityId in tooltipsEntitiesIds)
         {
            ttName = "tooltipOverEntity_" + entityId;
            if((!this._showPermanentTooltips || this._showPermanentTooltips && this.battleFrame.targetedEntities.indexOf(entityId) == -1) && TooltipManager.isVisible(ttName) && (fscf == null || !fscf.isTeleportationPreviewEntity(entityId)))
            {
               TooltipManager.hide(ttName);
            }
         }
         if(this._showPermanentTooltips)
         {
            for each(entityId in this.battleFrame.targetedEntities)
            {
               this.displayEntityTooltip(entityId);
            }
         }
         if(entity != null)
         {
            Sprite(entity).filters = [];
         }
         this.hideMovementRange();
         var inviSel:Selection = SelectionManager.getInstance().getSelection(this.INVISIBLE_POSITION_SELECTION);
         if(inviSel)
         {
            inviSel.remove();
         }
         this.removeAsLinkEntityEffect();
         if(this._currentFighterInfo && this._currentFighterInfo.contextualId == id)
         {
            KernelEventsManager.getInstance().processCallback(FightHookList.FighterInfoUpdate,null);
            if(PlayedCharacterManager.getInstance().isSpectator && OptionManager.getOptionManager("dofus")["spectatorAutoShowCurrentFighterInfo"] == true)
            {
               KernelEventsManager.getInstance().processCallback(FightHookList.FighterInfoUpdate,FightEntitiesFrame.getCurrentInstance().getEntityInfos(this._battleFrame.currentPlayerId) as GameFightFighterInformations);
            }
         }
         var fightPreparationFrame:FightPreparationFrame = Kernel.getWorker().getFrame(FightPreparationFrame) as FightPreparationFrame;
         if(fightPreparationFrame)
         {
            fightPreparationFrame.updateSwapPositionRequestsIcons();
         }
      }
      
      public function removeSpellTargetsTooltips() : void
      {
         var ttEntityId:* = undefined;
         for(ttEntityId in this._spellTargetsTooltips)
         {
            TooltipPlacer.removeTooltipPositionByName("tooltip_tooltipOverEntity_" + ttEntityId);
            delete this._spellTargetsTooltips[ttEntityId];
            TooltipManager.hide("tooltipOverEntity_" + ttEntityId);
            SpellDamagesManager.getInstance().removeSpellDamages(ttEntityId);
            if(this._showPermanentTooltips && this._battleFrame && this._battleFrame.targetedEntities.indexOf(ttEntityId) != -1)
            {
               this.displayEntityTooltip(ttEntityId);
            }
         }
      }
      
      public function displayEntityTooltip(pEntityId:Number, pSpell:Object = null, pForceRefresh:Boolean = false, pSpellImpactCell:int = -1, pMakerParams:Object = null) : void
      {
         var entitiesOnCell:Array = null;
         var infos:GameFightFighterInformations = this._entitiesFrame.getEntityInfos(pEntityId) as GameFightFighterInformations;
         var updateTime:uint = getTimer();
         this._tooltipLastUpdate[pEntityId] = updateTime;
         if(!infos || this._battleFrame.targetedEntities.indexOf(pEntityId) != -1 && this._hiddenEntites.indexOf(pEntityId) != -1)
         {
            return;
         }
         var spellImpactCell:int = pSpellImpactCell != -1?int(pSpellImpactCell):int(currentCell);
         if(pSpell && spellImpactCell == -1)
         {
            return;
         }
         if(pSpell is SpellWrapper)
         {
            entitiesOnCell = EntitiesManager.getInstance().getEntitiesOnCell(spellImpactCell,AnimatedCharacter);
            if((pSpell.spellLevelInfos as SpellLevel).needTakenCell && entitiesOnCell.length == 0)
            {
               return;
            }
         }
         var tooltipCacheName:String = "EntityShortInfos" + infos.contextualId;
         infos = this._entitiesFrame.getEntityInfos(pEntityId) as GameFightFighterInformations;
         var entity:IDisplayable = DofusEntities.getEntity(pEntityId) as IDisplayable;
         if(pMakerParams != null && pMakerParams.previewEntity != null)
         {
            entity = pMakerParams.previewEntity;
         }
         if(entity == null)
         {
            return;
         }
         var target:IRectangle = entity.absoluteBounds;
         var typeString:String = "monsterFighter";
         if(infos is GameFightCharacterInformations)
         {
            tooltipCacheName = "PlayerShortInfos" + infos.contextualId;
            typeString = null;
         }
         else if(infos is GameFightEntityInformation)
         {
            typeString = "companionFighter";
         }
         TooltipManager.show(infos,target,UiModuleManager.getInstance().getModule("Ankama_Tooltips"),false,"tooltipOverEntity_" + infos.contextualId,LocationEnum.POINT_BOTTOM,LocationEnum.POINT_TOP,0,true,typeString,null,pMakerParams,tooltipCacheName,false,StrataEnum.STRATA_WORLD,Atouin.getInstance().currentZoom);
         var fightPreparationFrame:FightPreparationFrame = Kernel.getWorker().getFrame(FightPreparationFrame) as FightPreparationFrame;
         if(fightPreparationFrame)
         {
            fightPreparationFrame.updateSwapPositionRequestsIcons();
         }
         if(tooltipCacheName && TooltipManager.hasCache(tooltipCacheName))
         {
            this._entitiesFrame.updateEntityIconPosition(pEntityId);
         }
      }
      
      public function addToHiddenEntities(entityId:Number) : void
      {
         if(this._hiddenEntites.indexOf(entityId) == -1)
         {
            this._hiddenEntites.push(entityId);
         }
      }
      
      public function removeFromHiddenEntities(entityId:Number) : void
      {
         if(this._hiddenEntites.indexOf(entityId) != -1)
         {
            this._hiddenEntites.splice(this._hiddenEntites.indexOf(entityId),1);
         }
      }
      
      public function getFighterPreviousPosition(pFighterId:Number) : int
      {
         var savedPos:Object = null;
         var positions:Array = null;
         if(this._fightersPositionsHistory[pFighterId])
         {
            positions = this._fightersPositionsHistory[pFighterId];
            savedPos = positions.length > 0?positions[positions.length - 1]:null;
         }
         return !!savedPos?int(savedPos.cellId):-1;
      }
      
      public function deleteFighterPreviousPosition(pFighterId:Number) : void
      {
         if(this._fightersPositionsHistory[pFighterId])
         {
            this._fightersPositionsHistory[pFighterId].pop();
         }
      }
      
      public function saveFighterPosition(pFighterId:Number, pCellId:uint) : void
      {
         if(!this._fightersPositionsHistory[pFighterId])
         {
            this._fightersPositionsHistory[pFighterId] = new Array();
         }
         this._fightersPositionsHistory[pFighterId].push({
            "cellId":pCellId,
            "lives":2
         });
      }
      
      public function getFighterRoundStartPosition(pFighterId:Number) : int
      {
         return this._fightersRoundStartPosition[pFighterId];
      }
      
      public function setFighterRoundStartPosition(pFighterId:Number, cellId:int) : int
      {
         return this._fightersRoundStartPosition[pFighterId] = cellId;
      }
      
      public function refreshTimelineOverEntityInfos() : void
      {
         var entity:IEntity = null;
         if(this._timelineOverEntity && this._timelineOverEntityId)
         {
            entity = DofusEntities.getEntity(this._timelineOverEntityId);
            if(entity && entity.position)
            {
               FightContextFrame.currentCell = entity.position.cellId;
               this.overEntity(this._timelineOverEntityId);
            }
         }
      }
      
      private function getFighterInfos(fighterId:Number) : GameFightFighterInformations
      {
         return this.entitiesFrame.getEntityInfos(fighterId) as GameFightFighterInformations;
      }
      
      private function showFighterInfo(event:TimerEvent) : void
      {
         this._timerFighterInfo.reset();
         KernelEventsManager.getInstance().processCallback(FightHookList.FighterInfoUpdate,this._currentFighterInfo);
      }
      
      private function showMovementRange(event:TimerEvent) : void
      {
         this._timerMovementRange.reset();
         var reachableRangeSelection:Selection = new Selection();
         reachableRangeSelection.renderer = new ZoneDARenderer(PlacementStrataEnums.STRATA_AREA,0.7);
         reachableRangeSelection.color = new Color(this.REACHABLE_CELL_COLOR);
         var unreachableRangeSelection:Selection = new Selection();
         unreachableRangeSelection.renderer = new ZoneDARenderer(PlacementStrataEnums.STRATA_AREA,0.7);
         unreachableRangeSelection.color = new Color(this.UNREACHABLE_CELL_COLOR);
         var fightReachableCellsMaker:FightReachableCellsMaker = new FightReachableCellsMaker(this._currentFighterInfo);
         reachableRangeSelection.zone = new Custom(fightReachableCellsMaker.reachableCells);
         unreachableRangeSelection.zone = new Custom(fightReachableCellsMaker.unreachableCells);
         SelectionManager.getInstance().addSelection(reachableRangeSelection,"movementReachableRange",this._currentFighterInfo.disposition.cellId);
         SelectionManager.getInstance().addSelection(unreachableRangeSelection,"movementUnreachableRange",this._currentFighterInfo.disposition.cellId);
      }
      
      private function hideMovementRange() : void
      {
         var s:Selection = SelectionManager.getInstance().getSelection("movementReachableRange");
         if(s)
         {
            s.remove();
         }
         s = SelectionManager.getInstance().getSelection("movementUnreachableRange");
         if(s)
         {
            s.remove();
         }
      }
      
      private function addMarks(marks:Vector.<GameActionMark>) : void
      {
         var mark:GameActionMark = null;
         var spell:Spell = null;
         var step:AddGlyphGfxStep = null;
         var cellZone:GameActionMarkedCell = null;
         for each(mark in marks)
         {
            spell = Spell.getSpellById(mark.markSpellId);
            if(mark.markType == GameActionMarkTypeEnum.WALL || spell.getSpellLevel(mark.markSpellLevel).hasZoneShape(SpellShapeEnum.semicolon))
            {
               if(spell.getParamByName("glyphGfxId"))
               {
                  for each(cellZone in mark.cells)
                  {
                     step = new AddGlyphGfxStep(spell.getParamByName("glyphGfxId"),cellZone.cellId,mark.markId,mark.markType,mark.markTeamId,mark.active);
                     step.start();
                  }
               }
            }
            else if(spell.getParamByName("glyphGfxId") && !MarkedCellsManager.getInstance().getGlyph(mark.markId) && mark.markimpactCell != -1)
            {
               step = new AddGlyphGfxStep(spell.getParamByName("glyphGfxId"),mark.markimpactCell,mark.markId,mark.markType,mark.markTeamId,mark.active);
               step.start();
            }
            MarkedCellsManager.getInstance().addMark(mark.markAuthorId,mark.markId,mark.markType,spell,spell.getSpellLevel(mark.markSpellLevel),mark.cells,mark.markTeamId,mark.active,mark.markimpactCell);
         }
      }
      
      private function removeAsLinkEntityEffect() : void
      {
         var entityId:Number = NaN;
         var entity:DisplayObject = null;
         var index:int = 0;
         loop0:
         for each(entityId in this._entitiesFrame.getEntitiesIdsList())
         {
            entity = DofusEntities.getEntity(entityId) as DisplayObject;
            if(entity && entity.filters && entity.filters.length)
            {
               for(index = 0; index < entity.filters.length; )
               {
                  if(entity.filters[index] is ColorMatrixFilter)
                  {
                     entity.filters = entity.filters.splice(index,index);
                     continue loop0;
                  }
                  index++;
               }
            }
         }
      }
      
      private function highlightAsLinkedEntity(id:Number, isMainEntity:Boolean) : void
      {
         var filter:ColorMatrixFilter = null;
         var entity:IEntity = DofusEntities.getEntity(id);
         if(!entity)
         {
            return;
         }
         var entitySprite:Sprite = entity as Sprite;
         if(entitySprite)
         {
            filter = !!isMainEntity?this._linkedMainEffect:this._linkedEffect;
            if(entitySprite.filters.length)
            {
               if(entitySprite.filters[0] != filter)
               {
                  entitySprite.filters = [filter];
               }
            }
            else
            {
               entitySprite.filters = [filter];
            }
         }
      }
      
      private function overEntity(id:Number, showRange:Boolean = true, highlightTimelineFighter:Boolean = true, timelineTarget:IRectangle = null) : void
      {
         var entityId:Number = NaN;
         var showInfos:* = false;
         var entityInfo:GameFightFighterInformations = null;
         var inviSelection:Selection = null;
         var pos:int = 0;
         var lastMovPoint:int = 0;
         var reachableCells:FightReachableCellsMaker = null;
         var makerParams:Object = null;
         var effect:GlowFilter = null;
         var fightTurnFrame:FightTurnFrame = null;
         var myTurn:Boolean = false;
         var entitiesIdsList:Vector.<Number> = this._entitiesFrame.getEntitiesIdsList();
         fighterEntityTooltipId = id;
         var entity:IEntity = DofusEntities.getEntity(fighterEntityTooltipId);
         if(!entity)
         {
            if(entitiesIdsList.indexOf(fighterEntityTooltipId) == -1)
            {
               _log.warn("Mouse over an unknown entity : " + id);
               return;
            }
            showRange = false;
         }
         var infos:GameFightFighterInformations = this._entitiesFrame.getEntityInfos(id) as GameFightFighterInformations;
         if(!infos)
         {
            _log.warn("Mouse over an unknown entity : " + id);
            return;
         }
         var summonerId:Number = infos.stats.summoner;
         if(infos is GameFightEntityInformation)
         {
            summonerId = (infos as GameFightEntityInformation).masterId;
         }
         for each(entityId in entitiesIdsList)
         {
            if(entityId != id)
            {
               entityInfo = this._entitiesFrame.getEntityInfos(entityId) as GameFightFighterInformations;
               if(entityInfo && (entityInfo.stats.summoner == id || summonerId == entityId || entityInfo.stats.summoner == summonerId && summonerId || entityInfo is GameFightEntityInformation && (entityInfo as GameFightEntityInformation).masterId == id))
               {
                  this.highlightAsLinkedEntity(entityId,summonerId == entityId);
               }
            }
         }
         this._currentFighterInfo = infos;
         showInfos = true;
         if(PlayedCharacterManager.getInstance().isSpectator && OptionManager.getOptionManager("dofus")["spectatorAutoShowCurrentFighterInfo"] == true)
         {
            showInfos = this._battleFrame.currentPlayerId != id;
         }
         if(showInfos && highlightTimelineFighter)
         {
            this._timerFighterInfo.reset();
            this._timerFighterInfo.start();
         }
         if(infos.stats.invisibilityState == GameActionFightInvisibilityStateEnum.INVISIBLE)
         {
            _log.info("Mouse over an invisible entity in timeline");
            inviSelection = SelectionManager.getInstance().getSelection(this.INVISIBLE_POSITION_SELECTION);
            if(!inviSelection)
            {
               inviSelection = new Selection();
               inviSelection.color = new Color(52326);
               inviSelection.renderer = new ZoneDARenderer(PlacementStrataEnums.STRATA_AREA);
               SelectionManager.getInstance().addSelection(inviSelection,this.INVISIBLE_POSITION_SELECTION);
            }
            pos = FightEntitiesFrame.getCurrentInstance().getLastKnownEntityPosition(infos.contextualId);
            if(pos > -1)
            {
               lastMovPoint = FightEntitiesFrame.getCurrentInstance().getLastKnownEntityMovementPoint(infos.contextualId);
               reachableCells = new FightReachableCellsMaker(this._currentFighterInfo,pos,lastMovPoint);
               inviSelection.zone = new Custom(reachableCells.reachableCells);
               SelectionManager.getInstance().update(this.INVISIBLE_POSITION_SELECTION,pos);
            }
            return;
         }
         var fscf:FightSpellCastFrame = Kernel.getWorker().getFrame(FightSpellCastFrame) as FightSpellCastFrame;
         if(!fscf)
         {
            makerParams = {"target":timelineTarget};
            this.displayEntityTooltip(id,null,false,-1,makerParams);
         }
         var movementSelection:Selection = SelectionManager.getInstance().getSelection(FightTurnFrame.SELECTION_PATH);
         if(movementSelection)
         {
            movementSelection.remove();
         }
         if(showRange)
         {
            if(Kernel.getWorker().contains(FightBattleFrame) && !Kernel.getWorker().contains(FightSpellCastFrame))
            {
               this._timerMovementRange.reset();
               this._timerMovementRange.start();
            }
         }
         if(this._lastEffectEntity && this._lastEffectEntity.object is Sprite && this._lastEffectEntity.object != entity)
         {
            Sprite(this._lastEffectEntity.object).filters = [];
         }
         var entitySprite:Sprite = entity as Sprite;
         if(entitySprite)
         {
            fightTurnFrame = Kernel.getWorker().getFrame(FightTurnFrame) as FightTurnFrame;
            myTurn = !!fightTurnFrame?Boolean(fightTurnFrame.myTurn):true;
            if((!fscf || FightSpellCastFrame.isCurrentTargetTargetable()) && myTurn)
            {
               effect = this._overEffectOk;
            }
            else
            {
               effect = this._overEffectKo;
            }
            if(entitySprite.filters.length)
            {
               if(entitySprite.filters[0] != effect)
               {
                  entitySprite.filters = [effect];
               }
            }
            else
            {
               entitySprite.filters = [effect];
            }
            this._lastEffectEntity = new WeakReference(entity);
         }
      }
      
      private function tacticModeHandler(forceOpen:Boolean = false) : void
      {
         if(forceOpen && !TacticModeManager.getInstance().tacticModeActivated)
         {
            TacticModeManager.getInstance().show(PlayedCharacterManager.getInstance().currentMap);
         }
         else if(TacticModeManager.getInstance().tacticModeActivated)
         {
            TacticModeManager.getInstance().hide();
         }
      }
      
      private function onPropertyChanged(pEvent:PropertyChangeEvent) : void
      {
         var entityId:Number = NaN;
         var showInfos:Boolean = false;
         switch(pEvent.propertyName)
         {
            case "showPermanentTargetsTooltips":
               this._showPermanentTooltips = pEvent.propertyValue as Boolean;
               for each(entityId in this._battleFrame.targetedEntities)
               {
                  if(!this._showPermanentTooltips)
                  {
                     TooltipManager.hide("tooltipOverEntity_" + entityId);
                  }
                  else
                  {
                     this.displayEntityTooltip(entityId);
                  }
               }
               break;
            case "spectatorAutoShowCurrentFighterInfo":
               if(PlayedCharacterManager.getInstance().isSpectator)
               {
                  showInfos = pEvent.propertyValue as Boolean;
                  if(!showInfos)
                  {
                     KernelEventsManager.getInstance().processCallback(FightHookList.FighterInfoUpdate,null);
                     break;
                  }
                  KernelEventsManager.getInstance().processCallback(FightHookList.FighterInfoUpdate,FightEntitiesFrame.getCurrentInstance().getEntityInfos(this._battleFrame.currentPlayerId) as GameFightFighterInformations);
                  break;
               }
         }
      }
      
      private function onUiUnloadStarted(pEvent:UiUnloadEvent) : void
      {
         var nameSplit:Array = null;
         var entityId:Number = NaN;
         var entity:AnimatedCharacter = null;
         if(pEvent.name && pEvent.name.indexOf("tooltipOverEntity_") != -1)
         {
            nameSplit = pEvent.name.split("_");
            entityId = nameSplit[nameSplit.length - 1];
            entity = DofusEntities.getEntity(entityId) as AnimatedCharacter;
            if(entity && entity.parent && entity.displayed && this._entitiesFrame.hasIcon(entityId))
            {
               this._entitiesFrame.getIcon(entityId).place(this._entitiesFrame.getIconEntityBounds(entity));
            }
         }
      }
      
      private function onTooltipsOrdered(pEvent:TooltipEvent) : void
      {
         var entityId:Number = NaN;
         var entitiesIds:Vector.<Number> = this.entitiesFrame.getEntitiesIdsList();
         for each(entityId in entitiesIds)
         {
            if(Berilia.getInstance().getUi("tooltip_tooltipOverEntity_" + entityId))
            {
               this._entitiesFrame.updateEntityIconPosition(entityId);
            }
         }
      }
   }
}
