package com.ankamagames.dofus.logic.game.roleplay.frames
{
   import com.ankamagames.atouin.Atouin;
   import com.ankamagames.atouin.managers.EntitiesManager;
   import com.ankamagames.atouin.managers.InteractiveCellManager;
   import com.ankamagames.atouin.managers.MapDisplayManager;
   import com.ankamagames.atouin.messages.EntityMovementCompleteMessage;
   import com.ankamagames.atouin.messages.EntityMovementStoppedMessage;
   import com.ankamagames.atouin.messages.MapLoadedMessage;
   import com.ankamagames.atouin.messages.MapZoomMessage;
   import com.ankamagames.atouin.utils.DataMapProvider;
   import com.ankamagames.berilia.Berilia;
   import com.ankamagames.berilia.components.Texture;
   import com.ankamagames.berilia.factories.MenusFactory;
   import com.ankamagames.berilia.managers.KernelEventsManager;
   import com.ankamagames.berilia.managers.TooltipManager;
   import com.ankamagames.berilia.managers.UiModuleManager;
   import com.ankamagames.berilia.types.LocationEnum;
   import com.ankamagames.berilia.types.graphic.UiRootContainer;
   import com.ankamagames.dofus.datacenter.communication.Emoticon;
   import com.ankamagames.dofus.datacenter.houses.HavenbagTheme;
   import com.ankamagames.dofus.datacenter.items.Item;
   import com.ankamagames.dofus.datacenter.monsters.Monster;
   import com.ankamagames.dofus.datacenter.quest.Quest;
   import com.ankamagames.dofus.datacenter.sounds.SoundAnimation;
   import com.ankamagames.dofus.datacenter.sounds.SoundBones;
   import com.ankamagames.dofus.datacenter.spells.SpellLevel;
   import com.ankamagames.dofus.datacenter.world.MapPosition;
   import com.ankamagames.dofus.datacenter.world.SubArea;
   import com.ankamagames.dofus.factories.RolePlayEntitiesFactory;
   import com.ankamagames.dofus.internalDatacenter.DataEnum;
   import com.ankamagames.dofus.internalDatacenter.communication.EmoteWrapper;
   import com.ankamagames.dofus.internalDatacenter.conquest.PrismSubAreaWrapper;
   import com.ankamagames.dofus.internalDatacenter.house.HouseInstanceWrapper;
   import com.ankamagames.dofus.internalDatacenter.house.HouseWrapper;
   import com.ankamagames.dofus.internalDatacenter.items.ItemWrapper;
   import com.ankamagames.dofus.internalDatacenter.items.ShortcutWrapper;
   import com.ankamagames.dofus.internalDatacenter.people.PartyMemberWrapper;
   import com.ankamagames.dofus.internalDatacenter.world.WorldPointWrapper;
   import com.ankamagames.dofus.kernel.Kernel;
   import com.ankamagames.dofus.kernel.net.ConnectionsHandler;
   import com.ankamagames.dofus.logic.common.managers.HyperlinkShowCellManager;
   import com.ankamagames.dofus.logic.common.managers.PlayerManager;
   import com.ankamagames.dofus.logic.game.common.actions.StartZoomAction;
   import com.ankamagames.dofus.logic.game.common.actions.breach.BreachTeleportRequestAction;
   import com.ankamagames.dofus.logic.game.common.actions.mount.PaddockMoveItemRequestAction;
   import com.ankamagames.dofus.logic.game.common.actions.mount.PaddockRemoveItemRequestAction;
   import com.ankamagames.dofus.logic.game.common.actions.roleplay.SwitchCreatureModeAction;
   import com.ankamagames.dofus.logic.game.common.frames.AbstractEntitiesFrame;
   import com.ankamagames.dofus.logic.game.common.frames.AllianceFrame;
   import com.ankamagames.dofus.logic.game.common.frames.BreachFrame;
   import com.ankamagames.dofus.logic.game.common.frames.ContextChangeFrame;
   import com.ankamagames.dofus.logic.game.common.frames.EmoticonFrame;
   import com.ankamagames.dofus.logic.game.common.frames.PartyManagementFrame;
   import com.ankamagames.dofus.logic.game.common.frames.PointCellFrame;
   import com.ankamagames.dofus.logic.game.common.frames.StackManagementFrame;
   import com.ankamagames.dofus.logic.game.common.managers.ChatAutocompleteNameManager;
   import com.ankamagames.dofus.logic.game.common.managers.InventoryManager;
   import com.ankamagames.dofus.logic.game.common.managers.PlayedCharacterManager;
   import com.ankamagames.dofus.logic.game.common.managers.SpeakingItemManager;
   import com.ankamagames.dofus.logic.game.common.managers.TimeManager;
   import com.ankamagames.dofus.logic.game.common.misc.DofusEntities;
   import com.ankamagames.dofus.logic.game.roleplay.managers.AnimFunManager;
   import com.ankamagames.dofus.logic.game.roleplay.messages.CharacterMovementStoppedMessage;
   import com.ankamagames.dofus.logic.game.roleplay.messages.DelayedActionMessage;
   import com.ankamagames.dofus.logic.game.roleplay.messages.GameRolePlaySetAnimationMessage;
   import com.ankamagames.dofus.logic.game.roleplay.types.Fight;
   import com.ankamagames.dofus.logic.game.roleplay.types.FightTeam;
   import com.ankamagames.dofus.logic.game.roleplay.types.GameContextPaddockItemInformations;
   import com.ankamagames.dofus.logic.game.roleplay.types.GroundObject;
   import com.ankamagames.dofus.logic.game.roleplay.types.RoleplaySpellCastProvider;
   import com.ankamagames.dofus.misc.EntityLookAdapter;
   import com.ankamagames.dofus.misc.lists.ChatHookList;
   import com.ankamagames.dofus.misc.lists.HookList;
   import com.ankamagames.dofus.misc.lists.InventoryHookList;
   import com.ankamagames.dofus.misc.lists.PrismHookList;
   import com.ankamagames.dofus.misc.lists.RoleplayHookList;
   import com.ankamagames.dofus.misc.lists.TriggerHookList;
   import com.ankamagames.dofus.misc.utils.EmbedAssets;
   import com.ankamagames.dofus.network.enums.AggressableStatusEnum;
   import com.ankamagames.dofus.network.enums.ChatActivableChannelsEnum;
   import com.ankamagames.dofus.network.enums.MapObstacleStateEnum;
   import com.ankamagames.dofus.network.enums.PlayerLifeStatusEnum;
   import com.ankamagames.dofus.network.enums.PrismStateEnum;
   import com.ankamagames.dofus.network.enums.SubEntityBindingPointCategoryEnum;
   import com.ankamagames.dofus.network.messages.game.context.GameContextRefreshEntityLookMessage;
   import com.ankamagames.dofus.network.messages.game.context.GameContextRemoveElementMessage;
   import com.ankamagames.dofus.network.messages.game.context.GameContextRemoveMultipleElementsMessage;
   import com.ankamagames.dofus.network.messages.game.context.GameMapChangeOrientationMessage;
   import com.ankamagames.dofus.network.messages.game.context.GameMapChangeOrientationsMessage;
   import com.ankamagames.dofus.network.messages.game.context.ShowCellMessage;
   import com.ankamagames.dofus.network.messages.game.context.fight.GameFightOptionStateUpdateMessage;
   import com.ankamagames.dofus.network.messages.game.context.fight.GameFightRemoveTeamMemberMessage;
   import com.ankamagames.dofus.network.messages.game.context.fight.GameFightUpdateTeamMessage;
   import com.ankamagames.dofus.network.messages.game.context.mount.GameDataPaddockObjectAddMessage;
   import com.ankamagames.dofus.network.messages.game.context.mount.GameDataPaddockObjectListAddMessage;
   import com.ankamagames.dofus.network.messages.game.context.mount.GameDataPaddockObjectRemoveMessage;
   import com.ankamagames.dofus.network.messages.game.context.mount.PaddockMoveItemRequestMessage;
   import com.ankamagames.dofus.network.messages.game.context.mount.PaddockRemoveItemRequestMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.GameRolePlayShowActorMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.GameRolePlayShowMultipleActorsMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.MapComplementaryInformationsDataInHavenBagMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.MapComplementaryInformationsDataInHouseMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.MapComplementaryInformationsDataMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.MapComplementaryInformationsWithCoordsMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.MapFightCountMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.MapInformationsRequestMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.MapRewardRateMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.anomaly.AnomalyStateMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.anomaly.MapComplementaryInformationsAnomalyMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.breach.BreachEnterMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.breach.BreachTeleportRequestMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.breach.BreachTeleportResponseMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.breach.MapComplementaryInformationsBreachMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.emote.EmotePlayRequestMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.fight.GameRolePlayMonsterAngryAtPlayerMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.fight.GameRolePlayMonsterNotAngryAtPlayerMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.fight.GameRolePlayRemoveChallengeMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.fight.GameRolePlayShowChallengeMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.houses.HousePropertiesMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.npc.MapNpcsQuestStatusUpdateMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.objects.ObjectGroundAddedMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.objects.ObjectGroundListAddedMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.objects.ObjectGroundRemovedMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.objects.ObjectGroundRemovedMultipleMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.paddock.GameDataPlayFarmObjectAnimationMessage;
   import com.ankamagames.dofus.network.messages.game.interactive.InteractiveMapUpdateMessage;
   import com.ankamagames.dofus.network.messages.game.interactive.InteractiveUsedMessage;
   import com.ankamagames.dofus.network.messages.game.interactive.StatedMapUpdateMessage;
   import com.ankamagames.dofus.network.messages.game.pvp.UpdateMapPlayersAgressableStatusMessage;
   import com.ankamagames.dofus.network.messages.game.pvp.UpdateSelfAgressableStatusMessage;
   import com.ankamagames.dofus.network.types.game.context.ActorOrientation;
   import com.ankamagames.dofus.network.types.game.context.GameContextActorInformations;
   import com.ankamagames.dofus.network.types.game.context.GameRolePlayTaxCollectorInformations;
   import com.ankamagames.dofus.network.types.game.context.fight.FightCommonInformations;
   import com.ankamagames.dofus.network.types.game.context.fight.FightTeamInformations;
   import com.ankamagames.dofus.network.types.game.context.fight.FightTeamMemberInformations;
   import com.ankamagames.dofus.network.types.game.context.roleplay.AlternativeMonstersInGroupLightInformations;
   import com.ankamagames.dofus.network.types.game.context.roleplay.GameRolePlayActorInformations;
   import com.ankamagames.dofus.network.types.game.context.roleplay.GameRolePlayCharacterInformations;
   import com.ankamagames.dofus.network.types.game.context.roleplay.GameRolePlayGroupMonsterInformations;
   import com.ankamagames.dofus.network.types.game.context.roleplay.GameRolePlayHumanoidInformations;
   import com.ankamagames.dofus.network.types.game.context.roleplay.GameRolePlayMerchantInformations;
   import com.ankamagames.dofus.network.types.game.context.roleplay.GameRolePlayNpcInformations;
   import com.ankamagames.dofus.network.types.game.context.roleplay.GameRolePlayNpcWithQuestInformations;
   import com.ankamagames.dofus.network.types.game.context.roleplay.GameRolePlayPortalInformations;
   import com.ankamagames.dofus.network.types.game.context.roleplay.GameRolePlayPrismInformations;
   import com.ankamagames.dofus.network.types.game.context.roleplay.GroupMonsterStaticInformations;
   import com.ankamagames.dofus.network.types.game.context.roleplay.GroupMonsterStaticInformationsWithAlternatives;
   import com.ankamagames.dofus.network.types.game.context.roleplay.HumanInformations;
   import com.ankamagames.dofus.network.types.game.context.roleplay.HumanOptionAlliance;
   import com.ankamagames.dofus.network.types.game.context.roleplay.HumanOptionEmote;
   import com.ankamagames.dofus.network.types.game.context.roleplay.HumanOptionFollowers;
   import com.ankamagames.dofus.network.types.game.context.roleplay.HumanOptionObjectUse;
   import com.ankamagames.dofus.network.types.game.context.roleplay.HumanOptionSkillUse;
   import com.ankamagames.dofus.network.types.game.context.roleplay.MonsterInGroupInformations;
   import com.ankamagames.dofus.network.types.game.context.roleplay.MonsterInGroupLightInformations;
   import com.ankamagames.dofus.network.types.game.house.HouseInstanceInformations;
   import com.ankamagames.dofus.network.types.game.house.HouseOnMapInformations;
   import com.ankamagames.dofus.network.types.game.interactive.InteractiveElement;
   import com.ankamagames.dofus.network.types.game.interactive.MapObstacle;
   import com.ankamagames.dofus.network.types.game.look.EntityLook;
   import com.ankamagames.dofus.network.types.game.look.IndexedEntityLook;
   import com.ankamagames.dofus.network.types.game.paddock.PaddockItem;
   import com.ankamagames.dofus.scripts.SpellScriptManager;
   import com.ankamagames.dofus.types.data.Follower;
   import com.ankamagames.dofus.types.entities.AnimStatiqueSubEntityBehavior;
   import com.ankamagames.dofus.types.entities.AnimatedCharacter;
   import com.ankamagames.dofus.types.entities.RoleplayObjectEntity;
   import com.ankamagames.dofus.types.enums.AnimationEnum;
   import com.ankamagames.dofus.types.enums.EntityIconEnum;
   import com.ankamagames.jerakine.data.I18n;
   import com.ankamagames.jerakine.entities.interfaces.IDisplayable;
   import com.ankamagames.jerakine.entities.interfaces.IEntity;
   import com.ankamagames.jerakine.entities.interfaces.IInteractive;
   import com.ankamagames.jerakine.entities.messages.EntityMouseOutMessage;
   import com.ankamagames.jerakine.enum.OptionEnum;
   import com.ankamagames.jerakine.managers.LangManager;
   import com.ankamagames.jerakine.managers.OptionManager;
   import com.ankamagames.jerakine.messages.Frame;
   import com.ankamagames.jerakine.messages.Message;
   import com.ankamagames.jerakine.resources.events.ResourceErrorEvent;
   import com.ankamagames.jerakine.resources.events.ResourceLoadedEvent;
   import com.ankamagames.jerakine.resources.loaders.IResourceLoader;
   import com.ankamagames.jerakine.resources.loaders.ResourceLoaderFactory;
   import com.ankamagames.jerakine.resources.loaders.ResourceLoaderType;
   import com.ankamagames.jerakine.sequencer.CallbackStep;
   import com.ankamagames.jerakine.sequencer.ISequencable;
   import com.ankamagames.jerakine.sequencer.SerialSequencer;
   import com.ankamagames.jerakine.types.ASwf;
   import com.ankamagames.jerakine.types.Callback;
   import com.ankamagames.jerakine.types.Uri;
   import com.ankamagames.jerakine.types.enums.DirectionsEnum;
   import com.ankamagames.jerakine.types.events.PropertyChangeEvent;
   import com.ankamagames.jerakine.types.positions.MapPoint;
   import com.ankamagames.jerakine.utils.display.EnterFrameDispatcher;
   import com.ankamagames.tiphon.display.TiphonAnimation;
   import com.ankamagames.tiphon.display.TiphonSprite;
   import com.ankamagames.tiphon.engine.Tiphon;
   import com.ankamagames.tiphon.engine.TiphonEventsManager;
   import com.ankamagames.tiphon.engine.TiphonMultiBonesManager;
   import com.ankamagames.tiphon.events.TiphonEvent;
   import com.ankamagames.tiphon.sequence.PlayAnimationStep;
   import com.ankamagames.tiphon.types.IAnimationModifier;
   import com.ankamagames.tiphon.types.TiphonUtility;
   import com.ankamagames.tiphon.types.look.TiphonEntityLook;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.geom.Rectangle;
   import flash.utils.Dictionary;
   import flash.utils.Timer;
   import flash.utils.clearTimeout;
   import flash.utils.getQualifiedClassName;
   import flash.utils.setTimeout;
   
   public class RoleplayEntitiesFrame extends AbstractEntitiesFrame implements Frame
   {
       
      
      private var _fights:Dictionary;
      
      private var _objects:Dictionary;
      
      private var _objectsByCellId:Dictionary;
      
      private var _paddockItem:Dictionary;
      
      private var _fightNumber:uint = 0;
      
      private var _timeout:Number;
      
      private var _loader:IResourceLoader;
      
      private var _currentPaddockItemCellId:uint;
      
      private var _currentEmoticon:uint = 0;
      
      private var _mapTotalRewardRate:int = 0;
      
      private var _playersId:Array;
      
      private var _merchantsList:Array;
      
      private var _npcList:Dictionary;
      
      private var _housesList:Dictionary;
      
      private var _emoteTimesBySprite:Dictionary;
      
      private var _waitForMap:Boolean;
      
      private var _monstersIds:Vector.<Number>;
      
      private var _allianceFrame:AllianceFrame;
      
      private var _breachFrame:BreachFrame;
      
      private var _lastStaticAnimations:Dictionary;
      
      private var _waitingEmotesAnims:Dictionary;
      
      private var _auraCycleTimer:Timer;
      
      private var _auraCycleIndex:int;
      
      private var _lastEntityWithAura:AnimatedCharacter;
      
      private var _dispatchPlayerNewLook:Boolean;
      
      private var _aggressions:Vector.<Aggression>;
      
      private var _aggroTimeoutIdsMonsterAssoc:Dictionary;
      
      public function RoleplayEntitiesFrame()
      {
         this._lastStaticAnimations = new Dictionary();
         this._waitingEmotesAnims = new Dictionary();
         this._aggressions = new Vector.<Aggression>(0);
         this._aggroTimeoutIdsMonsterAssoc = new Dictionary();
         super();
      }
      
      public function get currentEmoticon() : uint
      {
         return this._currentEmoticon;
      }
      
      public function set currentEmoticon(emoteId:uint) : void
      {
         this._currentEmoticon = emoteId;
      }
      
      public function get dispatchPlayerNewLook() : Boolean
      {
         return this._dispatchPlayerNewLook;
      }
      
      public function set dispatchPlayerNewLook(pValue:Boolean) : void
      {
         this._dispatchPlayerNewLook = pValue;
      }
      
      public function get fightNumber() : uint
      {
         return this._fightNumber;
      }
      
      public function get currentSubAreaId() : uint
      {
         return _currentSubAreaId;
      }
      
      public function get playersId() : Array
      {
         return this._playersId;
      }
      
      public function get merchants() : Array
      {
         return this._merchantsList;
      }
      
      public function get housesInformations() : Dictionary
      {
         return this._housesList;
      }
      
      public function get fights() : Dictionary
      {
         return this._fights;
      }
      
      public function get isCreatureMode() : Boolean
      {
         return _creaturesMode;
      }
      
      public function get monstersIds() : Vector.<Number>
      {
         return this._monstersIds;
      }
      
      public function get lastStaticAnimations() : Dictionary
      {
         return this._lastStaticAnimations;
      }
      
      public function get mapTotalRewardRate() : int
      {
         return this._mapTotalRewardRate;
      }
      
      override public function pushed() : Boolean
      {
         var ccFrame:ContextChangeFrame = null;
         var connexion:String = null;
         var mirmsg:MapInformationsRequestMessage = null;
         this.initNewMap();
         this._playersId = new Array();
         this._merchantsList = new Array();
         this._monstersIds = new Vector.<Number>();
         this._emoteTimesBySprite = new Dictionary();
         _entitiesVisibleNumber = 0;
         this._auraCycleIndex = 0;
         this._auraCycleTimer = new Timer(1800);
         if(OptionManager.getOptionManager("tiphon").auraMode == OptionEnum.AURA_CYCLE)
         {
            this._auraCycleTimer.addEventListener(TimerEvent.TIMER,this.onAuraCycleTimer);
            this._auraCycleTimer.start();
         }
         if(MapDisplayManager.getInstance().currentMapRendered)
         {
            ccFrame = Kernel.getWorker().getFrame(ContextChangeFrame) as ContextChangeFrame;
            connexion = "";
            if(ccFrame)
            {
               connexion = ccFrame.mapChangeConnexion;
            }
            mirmsg = new MapInformationsRequestMessage();
            mirmsg.initMapInformationsRequestMessage(MapDisplayManager.getInstance().currentMapPoint.mapId);
            ConnectionsHandler.getConnection().send(mirmsg,connexion);
         }
         else
         {
            this._waitForMap = true;
         }
         this._loader = ResourceLoaderFactory.getLoader(ResourceLoaderType.PARALLEL_LOADER);
         this._loader.addEventListener(ResourceLoadedEvent.LOADED,this.onGroundObjectLoaded);
         this._loader.addEventListener(ResourceErrorEvent.ERROR,this.onGroundObjectLoadFailed);
         _interactiveElements = new Vector.<InteractiveElement>();
         Dofus.getInstance().options.addEventListener(PropertyChangeEvent.PROPERTY_CHANGED,this.onPropertyChanged);
         Tiphon.getInstance().options.addEventListener(PropertyChangeEvent.PROPERTY_CHANGED,this.onTiphonPropertyChanged);
         this._allianceFrame = Kernel.getWorker().getFrame(AllianceFrame) as AllianceFrame;
         return super.pushed();
      }
      
      override public function process(msg:Message) : Boolean
      {
         /*
          * Decompilation error
          * Timeout (1 minute) was reached
          * Instruction count: 4929
          */
         throw new flash.errors.IllegalOperationError("Not decompiled due to timeout");
      }
      
      private function playAnimationOnEntity(characterEntity:AnimatedCharacter, animation:String, spellLevelId:uint, directions8:Boolean, duration:uint, playStaticOnly:Boolean) : void
      {
         var f:Follower = null;
         var rider:TiphonSprite = null;
         var rpSpellCastProvider:RoleplaySpellCastProvider = null;
         var spellScriptId:int = 0;
         if(_creaturesMode)
         {
            characterEntity.visible = true;
         }
         else if(animation == null)
         {
            if(!directions8)
            {
               if(characterEntity.getDirection() % 2 == 0)
               {
                  characterEntity.setDirection(characterEntity.getDirection() + 1);
               }
            }
            this._emoteTimesBySprite[characterEntity.name] = duration;
            characterEntity.removeEventListener(TiphonEvent.ANIMATION_END,this.onAnimationEnd);
            rider = characterEntity.getSubEntitySlot(SubEntityBindingPointCategoryEnum.HOOK_POINT_CATEGORY_MOUNT_DRIVER,0) as TiphonSprite;
            if(rider)
            {
               rider.removeEventListener(TiphonEvent.ANIMATION_ADDED,this.onAnimationAdded);
            }
            rpSpellCastProvider = new RoleplaySpellCastProvider();
            rpSpellCastProvider.castingSpell.casterId = characterEntity.id;
            rpSpellCastProvider.castingSpell.spellRank = SpellLevel.getLevelById(spellLevelId);
            rpSpellCastProvider.castingSpell.spell = rpSpellCastProvider.castingSpell.spellRank.spell;
            rpSpellCastProvider.castingSpell.targetedCell = characterEntity.position;
            spellScriptId = rpSpellCastProvider.castingSpell.spell.getScriptId(rpSpellCastProvider.castingSpell.isCriticalHit);
            SpellScriptManager.getInstance().runSpellScript(spellScriptId,rpSpellCastProvider,new Callback(this.executeSpellBuffer,rpSpellCastProvider),new Callback(this.executeSpellBuffer,rpSpellCastProvider));
         }
         else if(animation == AnimationEnum.ANIM_STATIQUE)
         {
            this._currentEmoticon = 0;
            characterEntity.setAnimation(animation);
            this._emoteTimesBySprite[characterEntity.name] = 0;
         }
         else
         {
            if(!directions8)
            {
               if(characterEntity.getDirection() % 2 == 0)
               {
                  characterEntity.setDirection(characterEntity.getDirection() + 1);
               }
            }
            if(!characterEntity.hasAnimation(animation,characterEntity.getDirection()))
            {
               _log.error("L\'animation " + animation + "_" + characterEntity.getDirection() + " est introuvable.");
               characterEntity.visible = true;
            }
            else
            {
               this._emoteTimesBySprite[characterEntity.name] = duration;
               characterEntity.removeEventListener(TiphonEvent.ANIMATION_END,this.onAnimationEnd);
               characterEntity.addEventListener(TiphonEvent.ANIMATION_END,this.onAnimationEnd);
               rider = characterEntity.getSubEntitySlot(SubEntityBindingPointCategoryEnum.HOOK_POINT_CATEGORY_MOUNT_DRIVER,0) as TiphonSprite;
               if(rider)
               {
                  rider.removeEventListener(TiphonEvent.ANIMATION_ADDED,this.onAnimationAdded);
                  rider.addEventListener(TiphonEvent.ANIMATION_ADDED,this.onAnimationAdded);
               }
               characterEntity.setAnimation(animation);
               if(playStaticOnly)
               {
                  if(characterEntity.look.getSubEntitiesFromCategory(SubEntityBindingPointCategoryEnum.HOOK_POINT_CATEGORY_PET) && characterEntity.look.getSubEntitiesFromCategory(SubEntityBindingPointCategoryEnum.HOOK_POINT_CATEGORY_PET).length)
                  {
                     characterEntity.setSubEntityBehaviour(1,new AnimStatiqueSubEntityBehavior());
                  }
                  characterEntity.stopAnimationAtLastFrame();
                  if(rider)
                  {
                     rider.stopAnimationAtLastFrame();
                  }
               }
            }
         }
         for each(f in characterEntity.followers)
         {
            if(f.type == Follower.TYPE_PET && f.entity is AnimatedCharacter)
            {
               this.playAnimationOnEntity(f.entity as AnimatedCharacter,animation,spellLevelId,directions8,duration,playStaticOnly);
            }
         }
      }
      
      private function executeSpellBuffer(castProvider:RoleplaySpellCastProvider) : void
      {
         var step:ISequencable = null;
         var ss:SerialSequencer = new SerialSequencer();
         for each(step in castProvider.stepsBuffer)
         {
            ss.addStep(step);
         }
         ss.addStep(new CallbackStep(new Callback(function():void
         {
            _currentEmoticon = 0;
         })));
         ss.start();
      }
      
      private function initNewMap() : void
      {
         var go:* = undefined;
         for each(go in this._objectsByCellId)
         {
            (go as IDisplayable).remove();
         }
         this._npcList = new Dictionary();
         this._fights = new Dictionary();
         this._objects = new Dictionary();
         this._objectsByCellId = new Dictionary();
         this._paddockItem = new Dictionary();
      }
      
      override protected function switchPokemonMode() : Boolean
      {
         if(super.switchPokemonMode())
         {
            KernelEventsManager.getInstance().processCallback(TriggerHookList.CreaturesMode);
            return true;
         }
         return false;
      }
      
      override public function pulled() : Boolean
      {
         var fight:Fight = null;
         var entityId:* = undefined;
         var entity:AnimatedCharacter = null;
         var monsterId:* = undefined;
         var team:FightTeam = null;
         var timeoutId:uint = 0;
         if(Kernel.getWorker().contains(HavenbagFrame))
         {
            Kernel.getWorker().removeFrame(Kernel.getWorker().getFrame(HavenbagFrame));
         }
         for each(fight in this._fights)
         {
            for each(team in fight.teams)
            {
               (team.teamEntity as TiphonSprite).removeEventListener(TiphonEvent.RENDER_SUCCEED,this.onFightEntityRendered);
               TooltipManager.hide("fightOptions_" + fight.fightId + "_" + team.teamInfos.teamId);
            }
         }
         if(this._loader)
         {
            this._loader.removeEventListener(ResourceLoadedEvent.LOADED,this.onGroundObjectLoaded);
            this._loader.removeEventListener(ResourceErrorEvent.ERROR,this.onGroundObjectLoadFailed);
            this._loader = null;
         }
         if(OptionManager.getOptionManager("dofus")["allowAnimsFun"] == true)
         {
            AnimFunManager.getInstance().stop();
         }
         this._fights = null;
         this._objects = null;
         this._npcList = null;
         this._objectsByCellId = null;
         this._paddockItem = null;
         this._housesList = null;
         Dofus.getInstance().options.removeEventListener(PropertyChangeEvent.PROPERTY_CHANGED,this.onPropertyChanged);
         Tiphon.getInstance().options.removeEventListener(PropertyChangeEvent.PROPERTY_CHANGED,this.onTiphonPropertyChanged);
         removeAllIcons();
         if(this._auraCycleTimer)
         {
            if(OptionManager.getOptionManager("tiphon").auraMode == OptionEnum.AURA_CYCLE)
            {
               this._auraCycleTimer.removeEventListener(TimerEvent.TIMER,this.onAuraCycleTimer);
               this._auraCycleTimer.stop();
            }
            this._auraCycleTimer = null;
         }
         this._lastEntityWithAura = null;
         for(entityId in _entities)
         {
            entity = EntitiesManager.getInstance().getEntity(entityId) as AnimatedCharacter;
            if(entity)
            {
               entity.removeEventListener(TiphonEvent.SPRITE_INIT,this.onPlayerSpriteInit);
            }
         }
         for(monsterId in this._aggroTimeoutIdsMonsterAssoc)
         {
            for each(timeoutId in this._aggroTimeoutIdsMonsterAssoc[monsterId])
            {
               clearTimeout(timeoutId);
            }
            delete this._aggroTimeoutIdsMonsterAssoc[monsterId];
         }
         EnterFrameDispatcher.removeEventListener(this.setAggressiveMonstersOrientations);
         this._aggressions.length = 0;
         return super.pulled();
      }
      
      public function isFight(entityId:Number) : Boolean
      {
         if(!_entities)
         {
            return false;
         }
         return _entities[entityId] is FightTeam;
      }
      
      public function isPaddockItem(entityId:Number) : Boolean
      {
         return _entities[entityId] is GameContextPaddockItemInformations;
      }
      
      public function getFightTeam(entityId:Number) : FightTeam
      {
         return _entities[entityId] as FightTeam;
      }
      
      public function getFightId(entityId:Number) : uint
      {
         return (_entities[entityId] as FightTeam).fight.fightId;
      }
      
      public function getFightLeaderId(entityId:Number) : Number
      {
         return (_entities[entityId] as FightTeam).teamInfos.leaderId;
      }
      
      public function getFightTeamType(entityId:Number) : uint
      {
         return (_entities[entityId] as FightTeam).teamType;
      }
      
      public function updateMonstersGroups() : void
      {
         var entityInfo:GameContextActorInformations = null;
         var entities:Dictionary = getEntitiesDictionnary();
         for each(entityInfo in entities)
         {
            if(entityInfo is GameRolePlayGroupMonsterInformations)
            {
               this.updateMonstersGroup(entityInfo as GameRolePlayGroupMonsterInformations);
            }
         }
      }
      
      private function updateMonstersGroup(pMonstersInfo:GameRolePlayGroupMonsterInformations) : void
      {
         var monsterInfos:MonsterInGroupLightInformations = null;
         var i:uint = 0;
         var underling:MonsterInGroupLightInformations = null;
         var monster:Monster = null;
         var monsterGrade:int = 0;
         var length:int = 0;
         var monstersGroup:Vector.<MonsterInGroupLightInformations> = this.getMonsterGroup(pMonstersInfo.staticInfos);
         var groupHasMiniBoss:Boolean = Monster.getMonsterById(pMonstersInfo.staticInfos.mainCreatureLightInfos.genericId).isMiniBoss;
         if(monstersGroup)
         {
            for each(monsterInfos in monstersGroup)
            {
               if(monsterInfos.genericId == pMonstersInfo.staticInfos.mainCreatureLightInfos.genericId)
               {
                  monstersGroup.splice(monstersGroup.indexOf(monsterInfos),1);
                  break;
               }
            }
         }
         var followersLooks:Vector.<EntityLook> = null;
         var followersSpeeds:Vector.<Number> = null;
         if(Dofus.getInstance().options.showEveryMonsters)
         {
            if(monstersGroup)
            {
               length = monstersGroup.length;
            }
            else
            {
               length = pMonstersInfo.staticInfos.underlings.length;
            }
            followersLooks = new Vector.<EntityLook>(length,true);
            followersSpeeds = new Vector.<Number>(followersLooks.length,true);
         }
         for each(underling in pMonstersInfo.staticInfos.underlings)
         {
            if(followersLooks)
            {
               monster = Monster.getMonsterById(underling.genericId);
               monsterGrade = -1;
               if(!monstersGroup)
               {
                  monsterGrade = 0;
               }
               else
               {
                  for each(monsterInfos in monstersGroup)
                  {
                     if(monsterInfos.genericId == underling.genericId)
                     {
                        monstersGroup.splice(monstersGroup.indexOf(monsterInfos),1);
                        monsterGrade = monsterInfos.grade;
                        break;
                     }
                  }
               }
               if(monsterGrade >= 0)
               {
                  followersSpeeds[i] = monster.speedAdjust;
                  followersLooks[i] = EntityLookAdapter.toNetwork(TiphonEntityLook.fromString(monster.look));
                  i++;
               }
            }
            if(!groupHasMiniBoss && Monster.getMonsterById(underling.genericId).isMiniBoss)
            {
               groupHasMiniBoss = true;
               if(!followersLooks)
               {
                  break;
               }
            }
         }
         if(followersLooks)
         {
            this.manageFollowers(DofusEntities.getEntity(pMonstersInfo.contextualId) as AnimatedCharacter,followersLooks,followersSpeeds,null,true);
         }
      }
      
      private function getMonsterGroup(pStaticMonsterInfos:GroupMonsterStaticInformations) : Vector.<MonsterInGroupLightInformations>
      {
         var newGroup:Vector.<MonsterInGroupLightInformations> = null;
         var pmf:PartyManagementFrame = null;
         var partyMembers:Vector.<PartyMemberWrapper> = null;
         var nbMembers:int = 0;
         var monsterGroup:AlternativeMonstersInGroupLightInformations = null;
         var member:PartyMemberWrapper = null;
         var infos:GroupMonsterStaticInformationsWithAlternatives = pStaticMonsterInfos as GroupMonsterStaticInformationsWithAlternatives;
         if(infos)
         {
            pmf = Kernel.getWorker().getFrame(PartyManagementFrame) as PartyManagementFrame;
            partyMembers = pmf.partyMembers;
            nbMembers = partyMembers.length;
            if(nbMembers == 0 && PlayedCharacterManager.getInstance().hasCompanion)
            {
               nbMembers = 2;
            }
            else
            {
               for each(member in partyMembers)
               {
                  nbMembers = nbMembers + member.companions.length;
               }
            }
            for each(monsterGroup in infos.alternatives)
            {
               if(!newGroup || monsterGroup.playerCount <= nbMembers)
               {
                  newGroup = monsterGroup.monsters;
               }
            }
         }
         return !!newGroup?newGroup.concat():null;
      }
      
      override public function addOrUpdateActor(infos:GameContextActorInformations, animationModifier:IAnimationModifier = null) : AnimatedCharacter
      {
         var ac:AnimatedCharacter = null;
         var questClip:Sprite = null;
         var q:Quest = null;
         var monstersInfos:GameRolePlayGroupMonsterInformations = null;
         var groupHasMiniBoss:Boolean = false;
         var entityLooks:Vector.<EntityLook> = null;
         var followersTypes:Vector.<uint> = null;
         var pets:Array = null;
         var migi:MonsterInGroupInformations = null;
         var option:* = undefined;
         var indexedLooks:Array = null;
         var indexedEL:IndexedEntityLook = null;
         var iEL:IndexedEntityLook = null;
         var tel:TiphonEntityLook = null;
         var mapPosition:MapPosition = null;
         ac = super.addOrUpdateActor(infos);
         switch(true)
         {
            case infos is GameRolePlayNpcWithQuestInformations:
               this._npcList[infos.contextualId] = ac;
               q = Quest.getFirstValidQuest((infos as GameRolePlayNpcWithQuestInformations).questFlag);
               this.removeBackground(ac);
               if(q != null)
               {
                  if((infos as GameRolePlayNpcWithQuestInformations).questFlag.questsToStartId.indexOf(q.id) != -1)
                  {
                     if(q.repeatType == 0)
                     {
                        questClip = EmbedAssets.getSprite("QUEST_CLIP");
                        ac.addBackground("questClip",questClip,true);
                     }
                     else
                     {
                        questClip = EmbedAssets.getSprite("QUEST_REPEATABLE_CLIP");
                        ac.addBackground("questRepeatableClip",questClip,true);
                     }
                  }
                  else if(q.repeatType == 0)
                  {
                     questClip = EmbedAssets.getSprite("QUEST_OBJECTIVE_CLIP");
                     ac.addBackground("questObjectiveClip",questClip,true);
                  }
                  else
                  {
                     questClip = EmbedAssets.getSprite("QUEST_REPEATABLE_OBJECTIVE_CLIP");
                     ac.addBackground("questRepeatableObjectiveClip",questClip,true);
                  }
               }
               if(ac.look.getBone() == 1)
               {
                  ac.addAnimationModifier(_customBreedAnimationModifier);
               }
               if(_creaturesMode || ac.getAnimation() == AnimationEnum.ANIM_STATIQUE)
               {
                  ac.setAnimation(AnimationEnum.ANIM_STATIQUE);
                  break;
               }
               break;
            case infos is GameRolePlayGroupMonsterInformations:
               monstersInfos = infos as GameRolePlayGroupMonsterInformations;
               groupHasMiniBoss = Monster.getMonsterById(monstersInfos.staticInfos.mainCreatureLightInfos.genericId).isMiniBoss;
               if(!groupHasMiniBoss && monstersInfos.staticInfos.underlings && monstersInfos.staticInfos.underlings.length > 0)
               {
                  for each(migi in monstersInfos.staticInfos.underlings)
                  {
                     groupHasMiniBoss = Monster.getMonsterById(migi.genericId).isMiniBoss;
                     if(groupHasMiniBoss)
                     {
                        break;
                     }
                  }
               }
               this.updateMonstersGroup(monstersInfos);
               if(this._monstersIds.indexOf(infos.contextualId) == -1)
               {
                  this._monstersIds.push(infos.contextualId);
               }
               if(Kernel.getWorker().contains(EntitiesTooltipsFrame))
               {
                  (Kernel.getWorker().getFrame(EntitiesTooltipsFrame) as EntitiesTooltipsFrame).update();
               }
               if(PlayerManager.getInstance().serverGameType != 0 && monstersInfos.hasHardcoreDrop)
               {
                  addEntityIcon(monstersInfos.contextualId,"treasure");
               }
               if(groupHasMiniBoss)
               {
                  addEntityIcon(monstersInfos.contextualId,"archmonsters");
               }
               if(monstersInfos.hasAVARewardToken)
               {
                  addEntityIcon(monstersInfos.contextualId,"nugget");
                  break;
               }
               break;
            case infos is GameRolePlayHumanoidInformations:
               if(infos.contextualId > 0 && this._playersId && this._playersId.indexOf(infos.contextualId) == -1)
               {
                  this._playersId.push(infos.contextualId);
               }
               entityLooks = new Vector.<EntityLook>();
               followersTypes = new Vector.<uint>();
               for each(option in (infos as GameRolePlayHumanoidInformations).humanoidInfo.options)
               {
                  switch(true)
                  {
                     case option is HumanOptionFollowers:
                        indexedLooks = new Array();
                        for each(indexedEL in option.followingCharactersLook)
                        {
                           indexedLooks.push(indexedEL);
                        }
                        indexedLooks.sortOn("index");
                        for each(iEL in indexedLooks)
                        {
                           entityLooks.push(iEL.look);
                           followersTypes.push(Follower.TYPE_NETWORK);
                        }
                        continue;
                     case option is HumanOptionAlliance:
                        this.addConquestIcon(infos.contextualId,option as HumanOptionAlliance);
                        continue;
                     default:
                        continue;
                  }
               }
               pets = ac.look.getSubEntitiesFromCategory(SubEntityBindingPointCategoryEnum.HOOK_POINT_CATEGORY_PET_FOLLOWER);
               for each(tel in pets)
               {
                  entityLooks.push(EntityLookAdapter.toNetwork(tel));
                  followersTypes.push(Follower.TYPE_PET);
               }
               this.manageFollowers(ac,entityLooks,null,followersTypes);
               if(ac.look.getBone() == 1)
               {
                  ac.addAnimationModifier(_customBreedAnimationModifier);
                  mapPosition = MapPosition.getMapPositionById(PlayedCharacterManager.getInstance().currentMap.mapId);
                  if(mapPosition.isUnderWater)
                  {
                     ac.addAnimationModifier(_underWaterAnimationModifier);
                  }
               }
               if(_creaturesMode || ac.getAnimation() == AnimationEnum.ANIM_STATIQUE)
               {
                  ac.setAnimation(AnimationEnum.ANIM_STATIQUE);
                  break;
               }
               break;
            case infos is GameRolePlayMerchantInformations:
               if(ac.look.getBone() == 1)
               {
                  ac.addAnimationModifier(_customBreedAnimationModifier);
               }
               if(_creaturesMode || ac.getAnimation() == AnimationEnum.ANIM_STATIQUE)
               {
                  ac.setAnimation(AnimationEnum.ANIM_STATIQUE);
                  break;
               }
               break;
            case infos is GameRolePlayTaxCollectorInformations:
            case infos is GameRolePlayPrismInformations:
            case infos is GameRolePlayPortalInformations:
               ac.allowMovementThrough = true;
               break;
            case infos is GameRolePlayNpcInformations:
               this._npcList[infos.contextualId] = ac;
            case infos is GameContextPaddockItemInformations:
               break;
            default:
               _log.warn("Unknown GameRolePlayActorInformations type : " + infos + ".");
         }
         return ac;
      }
      
      override protected function updateActorLook(actorId:Number, newLook:EntityLook, smoke:Boolean = false) : AnimatedCharacter
      {
         var anim:String = null;
         var toRemove:Array = null;
         var pets:Array = null;
         var toAdd:Array = null;
         var found:Boolean = false;
         var tel:TiphonEntityLook = null;
         var f:Follower = null;
         var ac:AnimatedCharacter = DofusEntities.getEntity(actorId) as AnimatedCharacter;
         if(ac)
         {
            anim = (TiphonUtility.getEntityWithoutMount(ac) as TiphonSprite).getAnimation();
            if(!_creaturesMode)
            {
               pets = EntityLookAdapter.fromNetwork(newLook).getSubEntitiesFromCategory(SubEntityBindingPointCategoryEnum.HOOK_POINT_CATEGORY_PET_FOLLOWER);
               toAdd = [];
               found = false;
               for each(tel in pets)
               {
                  found = false;
                  for each(f in ac.followers)
                  {
                     if(f.type == Follower.TYPE_PET && f.entity is TiphonSprite && (f.entity as TiphonSprite).look.equals(tel))
                     {
                        found = true;
                        break;
                     }
                  }
                  if(!found)
                  {
                     toAdd.push(tel);
                  }
               }
               for each(tel in toAdd)
               {
                  ac.addFollower(this.createFollower(tel,ac,Follower.TYPE_PET),true);
               }
            }
            toRemove = [];
            for each(f in ac.followers)
            {
               found = false;
               if(f.type == Follower.TYPE_PET)
               {
                  for each(tel in pets)
                  {
                     if(f.entity is TiphonSprite && (f.entity as TiphonSprite).look.equals(tel))
                     {
                        found = true;
                        break;
                     }
                  }
                  if(!found)
                  {
                     toRemove.push(f);
                  }
               }
            }
            for each(f in toRemove)
            {
               ac.removeFollower(f);
            }
            if(anim.indexOf("_Statique_") != -1 && (!this._lastStaticAnimations[actorId] || this._lastStaticAnimations[actorId] != anim))
            {
               this._lastStaticAnimations[actorId] = {"anim":anim};
            }
            if(ac.look.getBone() != newLook.bonesId && this._lastStaticAnimations[actorId])
            {
               this._lastStaticAnimations[actorId].targetBone = newLook.bonesId;
               ac.removeEventListener(TiphonEvent.RENDER_SUCCEED,this.onEntityRendered);
               ac.addEventListener(TiphonEvent.RENDER_SUCCEED,this.onEntityRendered);
               ac.setAnimation(AnimationEnum.ANIM_STATIQUE);
            }
         }
         return super.updateActorLook(actorId,newLook,smoke);
      }
      
      private function onEntityRendered(pEvent:TiphonEvent) : void
      {
         var ac:AnimatedCharacter = pEvent.currentTarget as AnimatedCharacter;
         if(ac && this._lastStaticAnimations[ac.id] && ac.look && this._lastStaticAnimations[ac.id].targetBone == ac.look.getBone() && ac.rendered)
         {
            ac.removeEventListener(TiphonEvent.RENDER_SUCCEED,this.onEntityRendered);
            ac.setAnimation(this._lastStaticAnimations[ac.id].anim);
            delete this._lastStaticAnimations[ac.id];
         }
      }
      
      private function removeBackground(ac:TiphonSprite) : void
      {
         if(!ac)
         {
            return;
         }
         ac.removeBackground("questClip");
         ac.removeBackground("questObjectiveClip");
         ac.removeBackground("questRepeatableClip");
         ac.removeBackground("questRepeatableObjectiveClip");
      }
      
      private function manageFollowers(char:AnimatedCharacter, followers:Vector.<EntityLook>, speedAdjust:Vector.<Number> = null, types:Vector.<uint> = null, areMonsters:Boolean = false) : void
      {
         var num:int = 0;
         var i:int = 0;
         var followerBaseLook:EntityLook = null;
         var followerEntityLook:TiphonEntityLook = null;
         if(_creaturesMode && !areMonsters)
         {
            return;
         }
         if(!char.followersEqual(followers))
         {
            char.removeAllFollowers();
            num = followers.length;
            for(i = 0; i < num; i++)
            {
               followerBaseLook = followers[i];
               followerEntityLook = EntityLookAdapter.fromNetwork(followerBaseLook);
               char.addFollower(this.createFollower(followerEntityLook,char,!!types?uint(types[i]):!!areMonsters?uint(Follower.TYPE_MONSTER):uint(Follower.TYPE_NETWORK),speedAdjust != null?Number(speedAdjust[i]):Number(null)));
            }
         }
      }
      
      private function createFollower(look:TiphonEntityLook, parent:AnimatedCharacter, type:uint, speedAdjust:Number = 0) : Follower
      {
         var mapPosition:MapPosition = null;
         var followerEntity:AnimatedCharacter = new AnimatedCharacter(EntitiesManager.getInstance().getFreeEntityId(),look,parent);
         if(speedAdjust)
         {
            followerEntity.speedAdjust = speedAdjust;
         }
         if(look.getBone() == 1)
         {
            followerEntity.addAnimationModifier(_customBreedAnimationModifier);
            mapPosition = MapPosition.getMapPositionById(PlayedCharacterManager.getInstance().currentMap.mapId);
            if(mapPosition.isUnderWater)
            {
               followerEntity.addAnimationModifier(_underWaterAnimationModifier);
            }
         }
         return new Follower(followerEntity,type);
      }
      
      private function addFight(infos:FightCommonInformations) : void
      {
         var team:FightTeamInformations = null;
         var teamEntity:IEntity = null;
         var fightTeam:FightTeam = null;
         if(this._fights[infos.fightId])
         {
            return;
         }
         var teams:Vector.<FightTeam> = new Vector.<FightTeam>(0,false);
         var fight:Fight = new Fight(infos.fightId,teams);
         var c1:String = Math.round(Math.random() * 16).toString(16);
         var c2:String = Math.round(Math.random() * 16).toString(16);
         var c3:String = Math.round(Math.random() * 16).toString(16);
         var fightColorStr:String = "0x" + c1 + c1 + c2 + c2 + c3 + c3;
         var fightColor:int = int(fightColorStr);
         var teamCounter:uint = 0;
         for each(team in infos.fightTeams)
         {
            teamEntity = RolePlayEntitiesFactory.createFightEntity(infos,team,MapPoint.fromCellId(infos.fightTeamsPositions[teamCounter]),fightColor);
            (teamEntity as IDisplayable).display();
            fightTeam = new FightTeam(fight,team.teamTypeId,teamEntity,team,infos.fightTeamsOptions[team.teamId]);
            registerActorWithId(fightTeam,teamEntity.id);
            teams.push(fightTeam);
            teamCounter++;
            (teamEntity as TiphonSprite).addEventListener(TiphonEvent.RENDER_SUCCEED,this.onFightEntityRendered,false,0,true);
         }
         this._fights[infos.fightId] = fight;
      }
      
      private function addObject(pObjectUID:uint, pCellId:uint) : void
      {
         if(this._objectsByCellId && this._objectsByCellId[pCellId])
         {
            _log.error("To add an object on the ground, the destination cell must be empty.");
            return;
         }
         var objectUri:Uri = new Uri(LangManager.getInstance().getEntry("config.gfx.path.item.vector") + Item.getItemById(pObjectUID).iconId + ".swf");
         var objectEntity:IInteractive = new RoleplayObjectEntity(pObjectUID,MapPoint.fromCellId(pCellId));
         (objectEntity as IDisplayable).display();
         var groundObject:GameContextActorInformations = new GroundObject(Item.getItemById(pObjectUID));
         groundObject.contextualId = objectEntity.id;
         groundObject.disposition.cellId = pCellId;
         groundObject.disposition.direction = DirectionsEnum.DOWN_RIGHT;
         if(this._objects == null)
         {
            this._objects = new Dictionary();
         }
         this._objects[objectUri] = objectEntity;
         this._objectsByCellId[pCellId] = this._objects[objectUri];
         registerActorWithId(groundObject,objectEntity.id);
         this._loader.load(objectUri,null,null,true);
      }
      
      private function removeObject(pCellId:uint) : void
      {
         if(this._objectsByCellId[pCellId] != null)
         {
            if(this._objects[this._objectsByCellId[pCellId]] != null)
            {
               delete this._objects[this._objectsByCellId[pCellId]];
            }
            if(_entities[this._objectsByCellId[pCellId].id] != null)
            {
               unregisterActor(this._objectsByCellId[pCellId].id);
            }
            (this._objectsByCellId[pCellId] as IDisplayable).remove();
            delete this._objectsByCellId[pCellId];
         }
      }
      
      private function updateFight(fightId:uint, team:FightTeamInformations) : void
      {
         var newMember:FightTeamMemberInformations = null;
         var present:Boolean = false;
         var teamMember:FightTeamMemberInformations = null;
         var fight:Fight = this._fights[fightId];
         if(fight == null)
         {
            return;
         }
         var fightTeam:FightTeam = fight.getTeamById(team.teamId);
         var tInfo:FightTeamInformations = (_entities[fightTeam.teamEntity.id] as FightTeam).teamInfos;
         if(tInfo.teamMembers == team.teamMembers)
         {
            return;
         }
         for each(newMember in team.teamMembers)
         {
            present = false;
            for each(teamMember in tInfo.teamMembers)
            {
               if(teamMember.id == newMember.id)
               {
                  present = true;
               }
            }
            if(!present)
            {
               tInfo.teamMembers.push(newMember);
            }
         }
      }
      
      private function removeFighter(fightId:uint, teamId:uint, charId:Number) : void
      {
         var fightTeam:FightTeam = null;
         var teamInfos:FightTeamInformations = null;
         var newMembers:Vector.<FightTeamMemberInformations> = null;
         var member:FightTeamMemberInformations = null;
         var fight:Fight = this._fights[fightId];
         if(fight)
         {
            fightTeam = fight.teams[teamId];
            teamInfos = fightTeam.teamInfos;
            newMembers = new Vector.<FightTeamMemberInformations>(0,false);
            for each(member in teamInfos.teamMembers)
            {
               if(member.id != charId)
               {
                  newMembers.push(member);
               }
            }
            teamInfos.teamMembers = newMembers;
         }
      }
      
      private function removeFight(fightId:uint) : void
      {
         var team:FightTeam = null;
         var entity:Object = null;
         var fight:Fight = this._fights[fightId];
         if(fight == null)
         {
            return;
         }
         for each(team in fight.teams)
         {
            entity = _entities[team.teamEntity.id];
            _log.debug("suppression de la team " + team.teamEntity.id);
            Kernel.getWorker().process(new EntityMouseOutMessage(team.teamEntity as IInteractive));
            (team.teamEntity as IDisplayable).remove();
            TooltipManager.hide("fightOptions_" + fightId + "_" + team.teamInfos.teamId);
            unregisterActor(team.teamEntity.id);
         }
         delete this._fights[fightId];
      }
      
      private function addPaddockItem(item:PaddockItem) : void
      {
         var contextualId:int = 0;
         var i:Item = Item.getItemById(item.objectGID);
         if(this._paddockItem[item.cellId])
         {
            contextualId = (this._paddockItem[item.cellId] as IEntity).id;
         }
         else
         {
            contextualId = EntitiesManager.getInstance().getFreeEntityId();
         }
         var gcpii:GameContextPaddockItemInformations = new GameContextPaddockItemInformations(contextualId,i.appearance,item.cellId,item.durability,i);
         var e:IEntity = this.addOrUpdateActor(gcpii);
         this._paddockItem[item.cellId] = e;
      }
      
      private function removePaddockItem(cellId:uint) : void
      {
         var e:IEntity = this._paddockItem[cellId];
         if(!e)
         {
            return;
         }
         (e as IDisplayable).remove();
         delete this._paddockItem[cellId];
      }
      
      private function activatePaddockItem(cellId:uint) : void
      {
         var seq:SerialSequencer = null;
         var item:TiphonSprite = this._paddockItem[cellId];
         if(item)
         {
            seq = new SerialSequencer();
            seq.addStep(new PlayAnimationStep(item,AnimationEnum.ANIM_HIT));
            seq.addStep(new PlayAnimationStep(item,AnimationEnum.ANIM_STATIQUE));
            seq.start();
         }
      }
      
      private function onFightEntityRendered(event:TiphonEvent) : void
      {
         if(!_entities || !event.target)
         {
            return;
         }
         var fightTeam:FightTeam = _entities[event.target.id];
         if(fightTeam && fightTeam.fight && fightTeam.teamInfos)
         {
            this.updateSwordOptions(fightTeam.fight.fightId,fightTeam.teamInfos.teamId);
         }
      }
      
      private function updateSwordOptions(fightId:uint, teamId:uint, option:int = -1, state:Boolean = false) : void
      {
         var opt:* = undefined;
         var fight:Fight = this._fights[fightId];
         if(fight == null)
         {
            return;
         }
         var fightTeam:FightTeam = fight.teams[teamId];
         if(fightTeam == null)
         {
            return;
         }
         if(option != -1)
         {
            fightTeam.teamOptions[option] = state;
         }
         var textures:Vector.<String> = new Vector.<String>();
         for(opt in fightTeam.teamOptions)
         {
            if(fightTeam.teamOptions[opt])
            {
               textures.push("fightOption" + opt);
            }
         }
         if(fightTeam.hasGroupMember())
         {
            textures.push("fightOption4");
         }
         TooltipManager.show(textures,(fightTeam.teamEntity as IDisplayable).absoluteBounds,UiModuleManager.getInstance().getModule("Ankama_Tooltips"),false,"fightOptions_" + fightId + "_" + teamId,LocationEnum.POINT_BOTTOM,LocationEnum.POINT_TOP,0,true,"texturesList",null,null,null,false,0,Atouin.getInstance().currentZoom,false);
      }
      
      private function paddockCellValidator(cellId:int) : Boolean
      {
         var infos:GameContextActorInformations = null;
         var entity:IEntity = EntitiesManager.getInstance().getEntityOnCell(cellId);
         if(entity)
         {
            infos = getEntityInfos(entity.id);
            if(infos is GameContextPaddockItemInformations)
            {
               return false;
            }
         }
         return DataMapProvider.getInstance().farmCell(MapPoint.fromCellId(cellId).x,MapPoint.fromCellId(cellId).y) && DataMapProvider.getInstance().pointMov(MapPoint.fromCellId(cellId).x,MapPoint.fromCellId(cellId).y,true);
      }
      
      private function removeEntityListeners(pEntityId:Number) : void
      {
         var rider:TiphonSprite = null;
         var ts:TiphonSprite = DofusEntities.getEntity(pEntityId) as TiphonSprite;
         if(ts)
         {
            ts.removeEventListener(TiphonEvent.ANIMATION_END,this.onAnimationEnd);
            rider = ts.getSubEntitySlot(SubEntityBindingPointCategoryEnum.HOOK_POINT_CATEGORY_MOUNT_DRIVER,0) as TiphonSprite;
            if(rider)
            {
               rider.removeEventListener(TiphonEvent.ANIMATION_ADDED,this.onAnimationAdded);
            }
            ts.removeEventListener(TiphonEvent.RENDER_SUCCEED,this.onEntityReadyForEmote);
         }
      }
      
      private function updateUsableEmotesListInit(pLook:TiphonEntityLook) : void
      {
         var realEntityLook:TiphonEntityLook = null;
         var gcai:GameContextActorInformations = null;
         var bonesToLoad:Array = null;
         if(_entities && _entities[PlayedCharacterManager.getInstance().id])
         {
            gcai = _entities[PlayedCharacterManager.getInstance().id] as GameContextActorInformations;
            realEntityLook = EntityLookAdapter.fromNetwork(gcai.look);
         }
         var followerPetLook:Array = realEntityLook.getSubEntitiesFromCategory(SubEntityBindingPointCategoryEnum.HOOK_POINT_CATEGORY_PET_FOLLOWER);
         if((_creaturesMode || _creaturesFightMode || followerPetLook && followerPetLook.length != 0) && realEntityLook)
         {
            bonesToLoad = TiphonMultiBonesManager.getInstance().getAllBonesFromLook(realEntityLook);
            TiphonMultiBonesManager.getInstance().forceBonesLoading(bonesToLoad,new Callback(this.updateUsableEmotesList,realEntityLook));
         }
         else
         {
            this.updateUsableEmotesList(pLook);
         }
      }
      
      private function updateUsableEmotesList(pLook:TiphonEntityLook) : void
      {
         var emote:EmoteWrapper = null;
         var animName:String = null;
         var emoteAvailable:Boolean = false;
         var subCat:* = null;
         var subIndex:* = null;
         var sw:ShortcutWrapper = null;
         var emoteIndex:int = 0;
         var isGhost:Boolean = PlayedCharacterManager.getInstance().isGhost;
         var isIncarnation:Boolean = PlayedCharacterManager.getInstance().isIncarnation;
         var rpEmoticonFrame:EmoticonFrame = Kernel.getWorker().getFrame(EmoticonFrame) as EmoticonFrame;
         var emotes:Array = rpEmoticonFrame.emotesList;
         var subEntities:Dictionary = pLook.getSubEntities();
         var updateShortcutsBar:Boolean = false;
         var usableEmotes:Array = new Array();
         for each(emote in emotes)
         {
            emoteAvailable = false;
            if(emote && emote.emote)
            {
               animName = emote.emote.getAnimName(pLook);
               if(emote.emote.aura && !isGhost && !isIncarnation || Tiphon.skullLibrary.hasAnim(pLook.getBone(),animName))
               {
                  emoteAvailable = true;
               }
               else if(animName == null && emote.emote.spellLevelId != 0 && !this.isCreatureMode)
               {
                  emoteAvailable = true;
               }
               else if(subEntities)
               {
                  for(subCat in subEntities)
                  {
                     for(subIndex in subEntities[subCat])
                     {
                        if(Tiphon.skullLibrary.hasAnim(subEntities[subCat][subIndex].getBone(),animName))
                        {
                           emoteAvailable = true;
                           break;
                        }
                     }
                     if(emoteAvailable)
                     {
                        break;
                     }
                  }
               }
               emoteIndex = rpEmoticonFrame.emotes.indexOf(emote.id);
               for each(sw in InventoryManager.getInstance().shortcutBarItems)
               {
                  if(sw && sw.type == 4 && sw.id == emote.id && sw.active != emoteAvailable)
                  {
                     sw.active = emoteAvailable;
                     updateShortcutsBar = true;
                     break;
                  }
               }
               if(emoteAvailable)
               {
                  usableEmotes.push(emote.id);
                  if(emoteIndex == -1)
                  {
                     rpEmoticonFrame.emotes.push(emote.id);
                  }
               }
               else if(emoteIndex != -1)
               {
                  rpEmoticonFrame.emotes.splice(emoteIndex,1);
               }
            }
         }
         KernelEventsManager.getInstance().processCallback(RoleplayHookList.EmoteEnabledListUpdated,usableEmotes);
         if(updateShortcutsBar)
         {
            KernelEventsManager.getInstance().processCallback(InventoryHookList.ShortcutBarViewContent,0);
         }
      }
      
      private function onEntityReadyForEmote(pEvent:TiphonEvent) : void
      {
         var entity:AnimatedCharacter = pEvent.currentTarget as AnimatedCharacter;
         entity.removeEventListener(TiphonEvent.RENDER_SUCCEED,this.onEntityReadyForEmote);
         if(this._playersId.indexOf(entity.id) != -1)
         {
            this.process(this._waitingEmotesAnims[entity.id]);
         }
         delete this._waitingEmotesAnims[entity.id];
      }
      
      private function onAnimationAdded(e:TiphonEvent) : void
      {
         var name:String = null;
         var vsa:Vector.<SoundAnimation> = null;
         var sa:SoundAnimation = null;
         var dataSoundLabel:String = null;
         var entity:TiphonSprite = e.currentTarget as TiphonSprite;
         entity.removeEventListener(TiphonEvent.ANIMATION_ADDED,this.onAnimationAdded);
         var animation:TiphonAnimation = entity.rawAnimation;
         var soundBones:SoundBones = SoundBones.getSoundBonesById(entity.look.getBone());
         if(soundBones)
         {
            name = getQualifiedClassName(animation);
            vsa = soundBones.getSoundAnimations(name);
            animation.spriteHandler.tiphonEventManager.removeEvents(TiphonEventsManager.BALISE_SOUND,name);
            for each(sa in vsa)
            {
               dataSoundLabel = TiphonEventsManager.BALISE_DATASOUND + TiphonEventsManager.BALISE_PARAM_BEGIN + (sa.label != null && sa.label != "null"?sa.label:"") + TiphonEventsManager.BALISE_PARAM_END;
               animation.spriteHandler.tiphonEventManager.addEvent(dataSoundLabel,sa.startFrame,name);
            }
         }
      }
      
      private function onGroundObjectLoaded(e:ResourceLoadedEvent) : void
      {
         var objectMc:MovieClip = e.resource is ASwf?e.resource.content:e.resource;
         objectMc.width = 34;
         objectMc.height = 34;
         objectMc.x = objectMc.x - objectMc.width / 2;
         objectMc.y = objectMc.y - objectMc.height / 2;
         if(this._objects[e.uri])
         {
            this._objects[e.uri].addChild(objectMc);
         }
      }
      
      private function onGroundObjectLoadFailed(e:ResourceErrorEvent) : void
      {
      }
      
      public function timeoutStop(character:AnimatedCharacter) : void
      {
         clearTimeout(this._timeout);
         character.setAnimation(AnimationEnum.ANIM_STATIQUE);
         this._currentEmoticon = 0;
      }
      
      override public function onPlayAnim(e:TiphonEvent) : void
      {
         var animsRandom:Array = new Array();
         var tempStr:String = e.params.substring(6,e.params.length - 1);
         animsRandom = tempStr.split(",");
         var whichAnim:int = this._emoteTimesBySprite[(e.currentTarget as TiphonSprite).name] % animsRandom.length;
         e.sprite.setAnimation(animsRandom[whichAnim]);
      }
      
      private function onAnimationEnd(e:TiphonEvent) : void
      {
         var statiqueAnim:String = null;
         var animNam:String = null;
         var tiphonSprite:TiphonSprite = e.currentTarget as TiphonSprite;
         tiphonSprite.removeEventListener(TiphonEvent.ANIMATION_END,this.onAnimationEnd);
         var subEnt:Object = tiphonSprite.getSubEntitySlot(SubEntityBindingPointCategoryEnum.HOOK_POINT_CATEGORY_MOUNT_DRIVER,0);
         if(subEnt != null)
         {
            animNam = subEnt.getAnimation();
            if(animNam.indexOf("_") == -1)
            {
               animNam = tiphonSprite.getAnimation();
            }
         }
         else
         {
            animNam = tiphonSprite.getAnimation();
         }
         if(animNam.indexOf("_Statique_") == -1)
         {
            statiqueAnim = animNam.replace("_","_Statique_");
         }
         else
         {
            statiqueAnim = animNam;
         }
         if(tiphonSprite.hasAnimation(statiqueAnim,tiphonSprite.getDirection()) || subEnt && subEnt is TiphonSprite && TiphonSprite(subEnt).hasAnimation(statiqueAnim,TiphonSprite(subEnt).getDirection()))
         {
            tiphonSprite.setAnimation(statiqueAnim);
         }
         else
         {
            tiphonSprite.setAnimation(AnimationEnum.ANIM_STATIQUE);
            this._currentEmoticon = 0;
         }
      }
      
      private function onPlayerSpriteInit(pEvent:TiphonEvent) : void
      {
         var currentLook:TiphonEntityLook = (pEvent.sprite as TiphonSprite).look;
         if(pEvent.params == currentLook.getBone())
         {
            pEvent.sprite.removeEventListener(TiphonEvent.SPRITE_INIT,this.onPlayerSpriteInit);
            this.updateUsableEmotesListInit(currentLook);
         }
      }
      
      private function onCellPointed(success:Boolean, cellId:uint, entityId:Number) : void
      {
         var m:PaddockMoveItemRequestMessage = null;
         if(success)
         {
            m = new PaddockMoveItemRequestMessage();
            m.initPaddockMoveItemRequestMessage(this._currentPaddockItemCellId,cellId);
            ConnectionsHandler.getConnection().send(m);
         }
      }
      
      private function updateConquestIcons(pPlayersIds:*) : void
      {
         var playerId:Number = NaN;
         var infos:GameRolePlayHumanoidInformations = null;
         var option:* = undefined;
         if(pPlayersIds is Vector.<Number> && (pPlayersIds as Vector.<Number>).length > 0)
         {
            for each(playerId in pPlayersIds)
            {
               infos = getEntityInfos(playerId) as GameRolePlayHumanoidInformations;
               if(infos)
               {
                  for each(option in infos.humanoidInfo.options)
                  {
                     if(option is HumanOptionAlliance)
                     {
                        this.addConquestIcon(infos.contextualId,option as HumanOptionAlliance);
                        break;
                     }
                  }
               }
            }
         }
         else if(pPlayersIds is Number)
         {
            infos = getEntityInfos(pPlayersIds) as GameRolePlayHumanoidInformations;
            if(infos)
            {
               for each(option in infos.humanoidInfo.options)
               {
                  if(option is HumanOptionAlliance)
                  {
                     this.addConquestIcon(infos.contextualId,option as HumanOptionAlliance);
                     break;
                  }
               }
            }
         }
      }
      
      private function addConquestIcon(pEntityId:Number, pHumanOptionAlliance:HumanOptionAlliance) : void
      {
         var prismInfo:PrismSubAreaWrapper = null;
         var playerConqueststatus:String = null;
         var iconsNames:Vector.<String> = null;
         var iconName:String = null;
         if(PlayedCharacterManager.getInstance().characteristics.alignmentInfos.aggressable != AggressableStatusEnum.NON_AGGRESSABLE && this._allianceFrame && this._allianceFrame.hasAlliance && pHumanOptionAlliance.aggressable != AggressableStatusEnum.NON_AGGRESSABLE && pHumanOptionAlliance.aggressable != AggressableStatusEnum.PvP_ENABLED_AGGRESSABLE && pHumanOptionAlliance.aggressable != AggressableStatusEnum.PvP_ENABLED_NON_AGGRESSABLE && pHumanOptionAlliance.aggressable != AggressableStatusEnum.AvA_ENABLED_NON_AGGRESSABLE)
         {
            prismInfo = this._allianceFrame.getPrismSubAreaById(PlayedCharacterManager.getInstance().currentSubArea.id);
            if(prismInfo && prismInfo.state == PrismStateEnum.PRISM_STATE_VULNERABLE)
            {
               switch(pHumanOptionAlliance.aggressable)
               {
                  case AggressableStatusEnum.AvA_DISQUALIFIED:
                     if(pEntityId == PlayedCharacterManager.getInstance().id)
                     {
                        playerConqueststatus = "neutral";
                        break;
                     }
                     break;
                  case AggressableStatusEnum.AvA_PREQUALIFIED_AGGRESSABLE:
                     if(pEntityId == PlayedCharacterManager.getInstance().id)
                     {
                        playerConqueststatus = "clock";
                        break;
                     }
                     playerConqueststatus = this.getPlayerConquestStatus(pEntityId,pHumanOptionAlliance.allianceInformations.allianceId,prismInfo.alliance.allianceId);
                     break;
                  case AggressableStatusEnum.AvA_ENABLED_AGGRESSABLE:
                     playerConqueststatus = this.getPlayerConquestStatus(pEntityId,pHumanOptionAlliance.allianceInformations.allianceId,prismInfo.alliance.allianceId);
               }
               if(playerConqueststatus)
               {
                  iconsNames = getIconNamesByCategory(pEntityId,EntityIconEnum.AVA_CATEGORY);
                  if(iconsNames && iconsNames[0] != playerConqueststatus)
                  {
                     iconName = iconsNames[0];
                     iconsNames.length = 0;
                     removeIcon(pEntityId,iconName,true);
                  }
                  addEntityIcon(pEntityId,playerConqueststatus,EntityIconEnum.AVA_CATEGORY);
               }
            }
         }
         if(!playerConqueststatus && _entitiesIconsNames[pEntityId] && _entitiesIconsNames[pEntityId][EntityIconEnum.AVA_CATEGORY])
         {
            removeIconsCategory(pEntityId,EntityIconEnum.AVA_CATEGORY);
         }
      }
      
      private function getPlayerConquestStatus(pPlayerId:Number, pPlayerAllianceId:int, pPrismAllianceId:int) : String
      {
         var status:String = null;
         if(pPlayerId == PlayedCharacterManager.getInstance().id || this._allianceFrame.alliance.allianceId == pPlayerAllianceId)
         {
            status = "ownTeam";
         }
         else if(pPlayerAllianceId == pPrismAllianceId)
         {
            status = "defender";
         }
         else
         {
            status = "forward";
         }
         return status;
      }
      
      private function onTiphonPropertyChanged(event:PropertyChangeEvent) : void
      {
         if(event.propertyName == "auraMode" && event.propertyOldValue != event.propertyValue)
         {
            if(this._auraCycleTimer.running)
            {
               this._auraCycleTimer.removeEventListener(TimerEvent.TIMER,this.onAuraCycleTimer);
               this._auraCycleTimer.stop();
            }
            switch(event.propertyValue)
            {
               case OptionEnum.AURA_CYCLE:
                  this._auraCycleTimer.addEventListener(TimerEvent.TIMER,this.onAuraCycleTimer);
                  this._auraCycleTimer.start();
                  this.setEntitiesAura(false);
                  break;
               case OptionEnum.AURA_ON_ROLLOVER:
               case OptionEnum.AURA_NONE:
                  this.setEntitiesAura(false);
                  break;
               case OptionEnum.AURA_ALWAYS:
               default:
                  this.setEntitiesAura(true);
            }
         }
      }
      
      private function onAuraCycleTimer(event:TimerEvent) : void
      {
         var firstEntityWithAuraIndex:int = 0;
         var firstEntityWithAura:AnimatedCharacter = null;
         var nextEntityWithAura:AnimatedCharacter = null;
         var entity:AnimatedCharacter = null;
         var entitiesIdsList:Vector.<Number> = getEntitiesIdsList();
         if(this._auraCycleIndex >= entitiesIdsList.length)
         {
            this._auraCycleIndex = 0;
         }
         var l:int = entitiesIdsList.length;
         for(var i:int = 0; i < l; )
         {
            entity = DofusEntities.getEntity(entitiesIdsList[i]) as AnimatedCharacter;
            if(entity)
            {
               if(!firstEntityWithAura && entity.hasAura && entity.getDirection() == DirectionsEnum.DOWN)
               {
                  firstEntityWithAura = entity;
                  firstEntityWithAuraIndex = i;
               }
               if(i == this._auraCycleIndex && entity.hasAura && entity.getDirection() == DirectionsEnum.DOWN)
               {
                  nextEntityWithAura = entity;
                  break;
               }
               if(!entity.hasAura)
               {
                  this._auraCycleIndex++;
               }
            }
            i++;
         }
         if(this._lastEntityWithAura)
         {
            this._lastEntityWithAura.visibleAura = false;
         }
         if(nextEntityWithAura)
         {
            nextEntityWithAura.visibleAura = true;
            this._lastEntityWithAura = nextEntityWithAura;
         }
         else if(!nextEntityWithAura && firstEntityWithAura)
         {
            firstEntityWithAura.visibleAura = true;
            this._lastEntityWithAura = firstEntityWithAura;
            this._auraCycleIndex = firstEntityWithAuraIndex;
         }
         this._auraCycleIndex++;
      }
      
      private function setEntitiesAura(visible:Boolean) : void
      {
         var entity:AnimatedCharacter = null;
         var entitiesIdsList:Vector.<Number> = getEntitiesIdsList();
         for(var i:int = 0; i < entitiesIdsList.length; )
         {
            entity = DofusEntities.getEntity(entitiesIdsList[i]) as AnimatedCharacter;
            if(entity)
            {
               entity.visibleAura = visible;
            }
            i++;
         }
      }
      
      override protected function onPropertyChanged(e:PropertyChangeEvent) : void
      {
         super.onPropertyChanged(e);
         if(e.propertyName == "allowAnimsFun")
         {
            AnimFunManager.getInstance().stop();
            if(e.propertyValue == true)
            {
               AnimFunManager.getInstance().initializeByMap(PlayedCharacterManager.getInstance().currentMap.mapId);
            }
         }
      }
      
      private function onMonsterAngryAtPlayer(playerId:Number, monsterGroupId:Number, attackTime:Number) : void
      {
         var aggression:Aggression = null;
         addEntityIcon(monsterGroupId,"spotted",EntityIconEnum.AGGRO_CATEGORY,-22,-31);
         for each(aggression in this._aggressions)
         {
            if(aggression.monsterId == monsterGroupId)
            {
               return;
            }
         }
         if(!EnterFrameDispatcher.hasEventListener(this.setAggressiveMonstersOrientations))
         {
            EnterFrameDispatcher.addEventListener(this.setAggressiveMonstersOrientations,"aggressions");
         }
         this._aggressions.push(new Aggression(monsterGroupId,playerId));
         if(!this._aggroTimeoutIdsMonsterAssoc[monsterGroupId])
         {
            this._aggroTimeoutIdsMonsterAssoc[monsterGroupId] = new Vector.<uint>(0);
         }
         this._aggroTimeoutIdsMonsterAssoc[monsterGroupId].push(setTimeout(this.removeAggression,Math.max(attackTime - TimeManager.getInstance().getUtcTimestamp(),0),monsterGroupId));
      }
      
      private function setAggressiveMonstersOrientations(e:Event) : void
      {
         var aggression:Aggression = null;
         var player:AnimatedCharacter = null;
         var monster:AnimatedCharacter = null;
         var follower:Follower = null;
         for each(aggression in this._aggressions)
         {
            player = DofusEntities.getEntity(aggression.playerId) as AnimatedCharacter;
            monster = DofusEntities.getEntity(aggression.monsterId) as AnimatedCharacter;
            if(player && player.rendered && monster && monster.rendered)
            {
               monster.setDirection(monster.position.advancedOrientationTo(player.position,this.getNumDirections(monster) < 8));
               for each(follower in monster.followers)
               {
                  (follower.entity as TiphonSprite).setDirection(follower.entity.position.advancedOrientationTo(player.position,this.getNumDirections(follower.entity as TiphonSprite) < 8));
               }
            }
         }
      }
      
      private function getNumDirections(char:TiphonSprite) : int
      {
         var num:int = 0;
         var b:Boolean = false;
         for each(b in char.getAvaibleDirection())
         {
            if(b)
            {
               num++;
            }
         }
         return num;
      }
      
      private function removeAggression(monsterId:Number) : void
      {
         var aggression:Aggression = null;
         var timeoutId:uint = 0;
         var monsterIndex:int = 0;
         if(this._aggroTimeoutIdsMonsterAssoc[monsterId])
         {
            for each(timeoutId in this._aggroTimeoutIdsMonsterAssoc[monsterId])
            {
               clearTimeout(timeoutId);
            }
            delete this._aggroTimeoutIdsMonsterAssoc[monsterId];
         }
         var monsterIndexes:Vector.<int> = new Vector.<int>(0);
         for each(aggression in this._aggressions)
         {
            if(aggression.monsterId == monsterId)
            {
               monsterIndexes.push(this._aggressions.indexOf(aggression));
            }
         }
         if(monsterIndexes.length > 0)
         {
            for each(monsterIndex in monsterIndexes)
            {
               this._aggressions.splice(monsterIndex,1);
            }
         }
         if(!this._aggressions.length)
         {
            EnterFrameDispatcher.removeEventListener(this.setAggressiveMonstersOrientations);
         }
         if(_entitiesIconsCounts[monsterId])
         {
            _entitiesIconsCounts[monsterId]["spotted"] = 1;
         }
         removeIcon(monsterId,"spotted");
      }
   }
}

class Aggression
{
    
   
   private var _monsterId:Number;
   
   private var _playerId:Number;
   
   function Aggression(monsterId:Number, playerId:Number)
   {
      super();
      this._monsterId = monsterId;
      this._playerId = playerId;
   }
   
   public function get monsterId() : Number
   {
      return this._monsterId;
   }
   
   public function get playerId() : Number
   {
      return this._playerId;
   }
}
