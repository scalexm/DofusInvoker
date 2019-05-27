package com.ankamagames.dofus.logic.game.roleplay.frames
{
   import com.ankamagames.atouin.Atouin;
   import com.ankamagames.atouin.data.DefaultMap;
   import com.ankamagames.atouin.data.map.Map;
   import com.ankamagames.atouin.managers.EntitiesManager;
   import com.ankamagames.atouin.managers.MapDisplayManager;
   import com.ankamagames.atouin.messages.MapLoadedMessage;
   import com.ankamagames.atouin.messages.MapLoadingFailedMessage;
   import com.ankamagames.atouin.messages.MapsLoadingCompleteMessage;
   import com.ankamagames.atouin.utils.DataMapProvider;
   import com.ankamagames.berilia.components.Texture;
   import com.ankamagames.berilia.managers.KernelEventsManager;
   import com.ankamagames.berilia.managers.TooltipManager;
   import com.ankamagames.berilia.managers.UiModuleManager;
   import com.ankamagames.berilia.types.LocationEnum;
   import com.ankamagames.dofus.BuildInfos;
   import com.ankamagames.dofus.datacenter.communication.Emoticon;
   import com.ankamagames.dofus.datacenter.documents.Comic;
   import com.ankamagames.dofus.datacenter.houses.HavenbagTheme;
   import com.ankamagames.dofus.datacenter.items.Item;
   import com.ankamagames.dofus.datacenter.npcs.Npc;
   import com.ankamagames.dofus.datacenter.npcs.TaxCollectorFirstname;
   import com.ankamagames.dofus.datacenter.npcs.TaxCollectorName;
   import com.ankamagames.dofus.datacenter.spells.Spell;
   import com.ankamagames.dofus.datacenter.world.Area;
   import com.ankamagames.dofus.datacenter.world.SubArea;
   import com.ankamagames.dofus.externalnotification.ExternalNotificationManager;
   import com.ankamagames.dofus.externalnotification.enums.ExternalNotificationTypeEnum;
   import com.ankamagames.dofus.internalDatacenter.communication.CraftSmileyItem;
   import com.ankamagames.dofus.internalDatacenter.guild.PaddockWrapper;
   import com.ankamagames.dofus.internalDatacenter.items.ItemWrapper;
   import com.ankamagames.dofus.internalDatacenter.world.WorldPointWrapper;
   import com.ankamagames.dofus.kernel.Kernel;
   import com.ankamagames.dofus.kernel.net.ConnectionsHandler;
   import com.ankamagames.dofus.kernel.net.DisconnectionReasonEnum;
   import com.ankamagames.dofus.kernel.sound.SoundManager;
   import com.ankamagames.dofus.logic.common.actions.ChangeWorldInteractionAction;
   import com.ankamagames.dofus.logic.common.actions.ResetGameAction;
   import com.ankamagames.dofus.logic.common.managers.NotificationManager;
   import com.ankamagames.dofus.logic.game.common.actions.InteractiveElementActivationAction;
   import com.ankamagames.dofus.logic.game.common.actions.PivotCharacterAction;
   import com.ankamagames.dofus.logic.game.common.actions.bid.LeaveBidHouseAction;
   import com.ankamagames.dofus.logic.game.common.actions.craft.ExchangePlayerMultiCraftRequestAction;
   import com.ankamagames.dofus.logic.game.common.actions.exchange.ExchangePlayerRequestAction;
   import com.ankamagames.dofus.logic.game.common.actions.exchange.ExchangeRequestOnTaxCollectorAction;
   import com.ankamagames.dofus.logic.game.common.actions.humanVendor.ExchangeBuyAction;
   import com.ankamagames.dofus.logic.game.common.actions.humanVendor.ExchangeOnHumanVendorRequestAction;
   import com.ankamagames.dofus.logic.game.common.actions.humanVendor.ExchangeRequestOnShopStockAction;
   import com.ankamagames.dofus.logic.game.common.actions.humanVendor.ExchangeSellAction;
   import com.ankamagames.dofus.logic.game.common.actions.humanVendor.ExchangeShopStockMouvmentAddAction;
   import com.ankamagames.dofus.logic.game.common.actions.humanVendor.ExchangeShopStockMouvmentRemoveAction;
   import com.ankamagames.dofus.logic.game.common.actions.humanVendor.ExchangeShowVendorTaxAction;
   import com.ankamagames.dofus.logic.game.common.actions.humanVendor.ExchangeStartAsVendorRequestAction;
   import com.ankamagames.dofus.logic.game.common.actions.humanVendor.LeaveShopStockAction;
   import com.ankamagames.dofus.logic.game.common.actions.mount.LeaveExchangeMountAction;
   import com.ankamagames.dofus.logic.game.common.actions.quest.treasureHunt.PortalUseRequestAction;
   import com.ankamagames.dofus.logic.game.common.actions.roleplay.GameRolePlayFreeSoulRequestAction;
   import com.ankamagames.dofus.logic.game.common.actions.taxCollector.GameRolePlayTaxCollectorFightRequestAction;
   import com.ankamagames.dofus.logic.game.common.frames.AllianceFrame;
   import com.ankamagames.dofus.logic.game.common.frames.BidHouseManagementFrame;
   import com.ankamagames.dofus.logic.game.common.frames.ChatFrame;
   import com.ankamagames.dofus.logic.game.common.frames.CommonExchangeManagementFrame;
   import com.ankamagames.dofus.logic.game.common.frames.CraftFrame;
   import com.ankamagames.dofus.logic.game.common.frames.EmoticonFrame;
   import com.ankamagames.dofus.logic.game.common.frames.ExchangeManagementFrame;
   import com.ankamagames.dofus.logic.game.common.frames.HumanVendorManagementFrame;
   import com.ankamagames.dofus.logic.game.common.frames.QuestFrame;
   import com.ankamagames.dofus.logic.game.common.frames.SocialFrame;
   import com.ankamagames.dofus.logic.game.common.frames.SpectatorManagementFrame;
   import com.ankamagames.dofus.logic.game.common.frames.StackManagementFrame;
   import com.ankamagames.dofus.logic.game.common.managers.InventoryManager;
   import com.ankamagames.dofus.logic.game.common.managers.PlayedCharacterManager;
   import com.ankamagames.dofus.logic.game.common.managers.SpeakingItemManager;
   import com.ankamagames.dofus.logic.game.common.managers.TimeManager;
   import com.ankamagames.dofus.logic.game.common.misc.DofusEntities;
   import com.ankamagames.dofus.logic.game.fight.managers.TacticModeManager;
   import com.ankamagames.dofus.logic.game.roleplay.actions.DisplayContextualMenuAction;
   import com.ankamagames.dofus.logic.game.roleplay.actions.NpcGenericActionRequestAction;
   import com.ankamagames.dofus.logic.game.roleplay.actions.PlayerFightFriendlyAnswerAction;
   import com.ankamagames.dofus.logic.game.roleplay.actions.PlayerFightRequestAction;
   import com.ankamagames.dofus.logic.game.roleplay.actions.havenbag.HavenbagEnterAction;
   import com.ankamagames.dofus.logic.game.roleplay.actions.havenbag.HavenbagInvitePlayerAction;
   import com.ankamagames.dofus.logic.game.roleplay.actions.havenbag.HavenbagInvitePlayerAnswerAction;
   import com.ankamagames.dofus.logic.game.roleplay.managers.MountAutoTripManager;
   import com.ankamagames.dofus.logic.game.roleplay.managers.RoleplayManager;
   import com.ankamagames.dofus.logic.game.roleplay.messages.InteractiveElementActivationMessage;
   import com.ankamagames.dofus.logic.game.roleplay.types.RoleplaySpellCastProvider;
   import com.ankamagames.dofus.misc.EntityLookAdapter;
   import com.ankamagames.dofus.misc.lists.ChatHookList;
   import com.ankamagames.dofus.misc.lists.CraftHookList;
   import com.ankamagames.dofus.misc.lists.ExchangeHookList;
   import com.ankamagames.dofus.misc.lists.ExternalGameHookList;
   import com.ankamagames.dofus.misc.lists.HookList;
   import com.ankamagames.dofus.misc.lists.MountHookList;
   import com.ankamagames.dofus.misc.lists.RoleplayHookList;
   import com.ankamagames.dofus.misc.lists.SocialHookList;
   import com.ankamagames.dofus.misc.utils.SurveyManager;
   import com.ankamagames.dofus.network.enums.BuildTypeEnum;
   import com.ankamagames.dofus.network.enums.ChatActivableChannelsEnum;
   import com.ankamagames.dofus.network.enums.CraftResultEnum;
   import com.ankamagames.dofus.network.enums.DelayedActionTypeEnum;
   import com.ankamagames.dofus.network.enums.ExchangeErrorEnum;
   import com.ankamagames.dofus.network.enums.ExchangeTypeEnum;
   import com.ankamagames.dofus.network.enums.FighterRefusedReasonEnum;
   import com.ankamagames.dofus.network.enums.GameContextEnum;
   import com.ankamagames.dofus.network.enums.MountCharacteristicEnum;
   import com.ankamagames.dofus.network.messages.game.context.GameContextDestroyMessage;
   import com.ankamagames.dofus.network.messages.game.context.GameMapChangeOrientationRequestMessage;
   import com.ankamagames.dofus.network.messages.game.context.display.DisplayNumericalValuePaddockMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.CurrentMapInstanceMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.CurrentMapMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.ErrorMapNotFoundMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.death.GameRolePlayFreeSoulRequestMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.delay.GameRolePlayDelayedActionMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.document.ComicReadingBeginMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.document.DocumentReadingBeginMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.fight.GameRolePlayAggressionMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.fight.GameRolePlayFightRequestCanceledMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.fight.GameRolePlayPlayerFightFriendlyAnswerMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.fight.GameRolePlayPlayerFightFriendlyAnsweredMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.fight.GameRolePlayPlayerFightFriendlyRequestedMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.fight.GameRolePlayPlayerFightRequestMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.havenbag.EnterHavenBagRequestMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.havenbag.KickHavenBagRequestMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.havenbag.meeting.InviteInHavenBagClosedMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.havenbag.meeting.InviteInHavenBagMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.havenbag.meeting.InviteInHavenBagOfferMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.havenbag.meeting.TeleportHavenBagAnswerMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.havenbag.meeting.TeleportHavenBagRequestMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.job.JobAllowMultiCraftRequestMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.job.JobMultiCraftAvailableSkillsMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.npc.NpcDialogCreationMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.npc.NpcGenericActionFailureMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.npc.NpcGenericActionRequestMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.npc.PortalDialogCreationMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.paddock.PaddockPropertiesMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.paddock.PaddockSellBuyDialogMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.treasureHunt.PortalUseRequestMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.visual.GameRolePlaySpellAnimMessage;
   import com.ankamagames.dofus.network.messages.game.dialog.LeaveDialogRequestMessage;
   import com.ankamagames.dofus.network.messages.game.guild.ChallengeFightJoinRefusedMessage;
   import com.ankamagames.dofus.network.messages.game.guild.tax.GameRolePlayTaxCollectorFightRequestMessage;
   import com.ankamagames.dofus.network.messages.game.interactive.zaap.TeleportDestinationsMessage;
   import com.ankamagames.dofus.network.messages.game.interactive.zaap.ZaapDestinationsMessage;
   import com.ankamagames.dofus.network.messages.game.inventory.exchanges.ExchangeBuyMessage;
   import com.ankamagames.dofus.network.messages.game.inventory.exchanges.ExchangeBuyOkMessage;
   import com.ankamagames.dofus.network.messages.game.inventory.exchanges.ExchangeCraftInformationObjectMessage;
   import com.ankamagames.dofus.network.messages.game.inventory.exchanges.ExchangeCraftResultMessage;
   import com.ankamagames.dofus.network.messages.game.inventory.exchanges.ExchangeErrorMessage;
   import com.ankamagames.dofus.network.messages.game.inventory.exchanges.ExchangeObjectMoveMessage;
   import com.ankamagames.dofus.network.messages.game.inventory.exchanges.ExchangeObjectMovePricedMessage;
   import com.ankamagames.dofus.network.messages.game.inventory.exchanges.ExchangeOkMultiCraftMessage;
   import com.ankamagames.dofus.network.messages.game.inventory.exchanges.ExchangeOnHumanVendorRequestMessage;
   import com.ankamagames.dofus.network.messages.game.inventory.exchanges.ExchangePlayerMultiCraftRequestMessage;
   import com.ankamagames.dofus.network.messages.game.inventory.exchanges.ExchangePlayerRequestMessage;
   import com.ankamagames.dofus.network.messages.game.inventory.exchanges.ExchangeReplyTaxVendorMessage;
   import com.ankamagames.dofus.network.messages.game.inventory.exchanges.ExchangeRequestOnShopStockMessage;
   import com.ankamagames.dofus.network.messages.game.inventory.exchanges.ExchangeRequestOnTaxCollectorMessage;
   import com.ankamagames.dofus.network.messages.game.inventory.exchanges.ExchangeRequestedTradeMessage;
   import com.ankamagames.dofus.network.messages.game.inventory.exchanges.ExchangeSellMessage;
   import com.ankamagames.dofus.network.messages.game.inventory.exchanges.ExchangeSellOkMessage;
   import com.ankamagames.dofus.network.messages.game.inventory.exchanges.ExchangeShopStockStartedMessage;
   import com.ankamagames.dofus.network.messages.game.inventory.exchanges.ExchangeShowVendorTaxMessage;
   import com.ankamagames.dofus.network.messages.game.inventory.exchanges.ExchangeStartAsVendorMessage;
   import com.ankamagames.dofus.network.messages.game.inventory.exchanges.ExchangeStartOkCraftWithInformationMessage;
   import com.ankamagames.dofus.network.messages.game.inventory.exchanges.ExchangeStartOkHumanVendorMessage;
   import com.ankamagames.dofus.network.messages.game.inventory.exchanges.ExchangeStartOkNpcShopMessage;
   import com.ankamagames.dofus.network.messages.game.inventory.exchanges.ExchangeStartOkNpcTradeMessage;
   import com.ankamagames.dofus.network.messages.game.inventory.exchanges.ExchangeStartOkRecycleTradeMessage;
   import com.ankamagames.dofus.network.messages.game.inventory.exchanges.ExchangeStartOkRunesTradeMessage;
   import com.ankamagames.dofus.network.messages.game.inventory.exchanges.ExchangeStartedBidBuyerMessage;
   import com.ankamagames.dofus.network.messages.game.inventory.exchanges.ExchangeStartedBidSellerMessage;
   import com.ankamagames.dofus.network.messages.game.inventory.exchanges.ExchangeStartedMessage;
   import com.ankamagames.dofus.network.messages.game.inventory.exchanges.ExchangeStartedMountStockMessage;
   import com.ankamagames.dofus.network.messages.game.inventory.exchanges.ExchangeStartedTaxCollectorShopMessage;
   import com.ankamagames.dofus.network.messages.game.inventory.items.ObtainedItemMessage;
   import com.ankamagames.dofus.network.messages.game.inventory.items.ObtainedItemWithBonusMessage;
   import com.ankamagames.dofus.network.messages.server.basic.SystemMessageDisplayMessage;
   import com.ankamagames.dofus.network.types.game.context.GameContextActorInformations;
   import com.ankamagames.dofus.network.types.game.context.GameRolePlayTaxCollectorInformations;
   import com.ankamagames.dofus.network.types.game.context.roleplay.GameRolePlayActorInformations;
   import com.ankamagames.dofus.network.types.game.context.roleplay.GameRolePlayCharacterInformations;
   import com.ankamagames.dofus.network.types.game.context.roleplay.GameRolePlayGroupMonsterInformations;
   import com.ankamagames.dofus.network.types.game.context.roleplay.GameRolePlayMutantInformations;
   import com.ankamagames.dofus.network.types.game.context.roleplay.GameRolePlayNamedActorInformations;
   import com.ankamagames.dofus.network.types.game.context.roleplay.GameRolePlayNpcInformations;
   import com.ankamagames.dofus.network.types.game.context.roleplay.GameRolePlayPortalInformations;
   import com.ankamagames.dofus.network.types.game.context.roleplay.GameRolePlayPrismInformations;
   import com.ankamagames.dofus.network.types.game.prism.AlliancePrismInformation;
   import com.ankamagames.dofus.scripts.SpellScriptManager;
   import com.ankamagames.dofus.types.characteristicContextual.CharacteristicContextualManager;
   import com.ankamagames.dofus.types.entities.AnimatedCharacter;
   import com.ankamagames.dofus.types.enums.AnimationEnum;
   import com.ankamagames.dofus.types.enums.NotificationTypeEnum;
   import com.ankamagames.dofus.uiApi.SystemApi;
   import com.ankamagames.jerakine.data.I18n;
   import com.ankamagames.jerakine.data.XmlConfig;
   import com.ankamagames.jerakine.entities.interfaces.IDisplayable;
   import com.ankamagames.jerakine.entities.interfaces.IEntity;
   import com.ankamagames.jerakine.entities.interfaces.IMovable;
   import com.ankamagames.jerakine.interfaces.IRectangle;
   import com.ankamagames.jerakine.logger.Log;
   import com.ankamagames.jerakine.logger.Logger;
   import com.ankamagames.jerakine.managers.LangManager;
   import com.ankamagames.jerakine.messages.Frame;
   import com.ankamagames.jerakine.messages.Message;
   import com.ankamagames.jerakine.network.messages.ExpectedSocketClosureMessage;
   import com.ankamagames.jerakine.sequencer.ISequencable;
   import com.ankamagames.jerakine.sequencer.SerialSequencer;
   import com.ankamagames.jerakine.types.Callback;
   import com.ankamagames.jerakine.types.Uri;
   import com.ankamagames.jerakine.types.positions.MapPoint;
   import com.ankamagames.jerakine.types.positions.WorldPoint;
   import com.ankamagames.jerakine.utils.display.AngleToOrientation;
   import com.ankamagames.jerakine.utils.display.StageShareManager;
   import com.ankamagames.tiphon.types.TiphonUtility;
   import com.ankamagames.tiphon.types.look.TiphonEntityLook;
   import com.hurlant.util.Hex;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.filters.GlowFilter;
   import flash.geom.Point;
   import flash.text.TextFormat;
   import flash.utils.ByteArray;
   import flash.utils.Timer;
   import flash.utils.getQualifiedClassName;
   
   public class RoleplayContextFrame implements Frame
   {
      
      protected static const _log:Logger = Log.getLogger(getQualifiedClassName(RoleplayContextFrame));
      
      private static const MOUNT_BOOSTS_ICONS_PATH:String = XmlConfig.getInstance().getEntry("config.content.path") + "gfx/characteristics/mount.swf|";
      
      private static var currentStatus:int = -1;
       
      
      private var _priority:int = 0;
      
      private var _entitiesFrame:RoleplayEntitiesFrame;
      
      private var _worldFrame:RoleplayWorldFrame;
      
      private var _interactivesFrame:RoleplayInteractivesFrame;
      
      private var _npcDialogFrame:NpcDialogFrame;
      
      private var _documentFrame:DocumentFrame;
      
      private var _zaapFrame:ZaapFrame;
      
      private var _paddockFrame:PaddockFrame;
      
      private var _emoticonFrame:EmoticonFrame;
      
      private var _exchangeManagementFrame:ExchangeManagementFrame;
      
      private var _humanVendorManagementFrame:HumanVendorManagementFrame;
      
      private var _spectatorManagementFrame:SpectatorManagementFrame;
      
      private var _bidHouseManagementFrame:BidHouseManagementFrame;
      
      private var _estateFrame:EstateFrame;
      
      private var _allianceFrame:AllianceFrame;
      
      private var _craftFrame:CraftFrame;
      
      private var _commonExchangeFrame:CommonExchangeManagementFrame;
      
      private var _movementFrame:RoleplayMovementFrame;
      
      private var _delayedActionFrame:DelayedActionFrame;
      
      private var _currentWaitingFightId:uint;
      
      private var _crafterId:Number;
      
      private var _customerID:Number;
      
      private var _playersMultiCraftSkill:Array;
      
      private var _currentPaddock:PaddockWrapper;
      
      private var _playerEntity:AnimatedCharacter;
      
      private var _interactionIsLimited:Boolean = false;
      
      private var _previousMapId:Number = 0;
      
      private var _newCurrentMapIsReceived:Boolean = false;
      
      private var _obtainedItemMsg:ObtainedItemMessage;
      
      private var _itemIcon:Texture;
      
      private var _itemBonusIcon:Texture;
      
      private var _obtainedItemTextFormat:TextFormat;
      
      private var _obtainedItemBonusTextFormat:TextFormat;
      
      private var _mountBoosTextFormat:TextFormat;
      
      public function RoleplayContextFrame()
      {
         super();
      }
      
      public function get crafterId() : Number
      {
         return this._crafterId;
      }
      
      public function get customerID() : Number
      {
         return this._customerID;
      }
      
      public function get priority() : int
      {
         return this._priority;
      }
      
      public function set priority(p:int) : void
      {
         this._priority = p;
      }
      
      public function get entitiesFrame() : RoleplayEntitiesFrame
      {
         return this._entitiesFrame;
      }
      
      private function get socialFrame() : SocialFrame
      {
         return Kernel.getWorker().getFrame(SocialFrame) as SocialFrame;
      }
      
      public function get hasWorldInteraction() : Boolean
      {
         return !this._interactionIsLimited;
      }
      
      public function get commonExchangeFrame() : CommonExchangeManagementFrame
      {
         return this._commonExchangeFrame;
      }
      
      public function get currentPaddock() : PaddockWrapper
      {
         return this._currentPaddock;
      }
      
      public function get previousMapId() : Number
      {
         return this._previousMapId;
      }
      
      public function get newCurrentMapIsReceived() : Boolean
      {
         return this._newCurrentMapIsReceived;
      }
      
      public function set newCurrentMapIsReceived(value:Boolean) : void
      {
         this._newCurrentMapIsReceived = value;
      }
      
      public function pushed() : Boolean
      {
         this._entitiesFrame = new RoleplayEntitiesFrame();
         this._delayedActionFrame = new DelayedActionFrame();
         this._movementFrame = new RoleplayMovementFrame();
         this._worldFrame = new RoleplayWorldFrame();
         this._interactivesFrame = new RoleplayInteractivesFrame();
         Kernel.getWorker().addFrame(this._delayedActionFrame);
         this._npcDialogFrame = new NpcDialogFrame();
         this._documentFrame = new DocumentFrame();
         this._zaapFrame = new ZaapFrame();
         this._paddockFrame = new PaddockFrame();
         this._exchangeManagementFrame = new ExchangeManagementFrame();
         this._spectatorManagementFrame = new SpectatorManagementFrame();
         this._bidHouseManagementFrame = new BidHouseManagementFrame();
         this._estateFrame = new EstateFrame();
         this._craftFrame = new CraftFrame();
         this._humanVendorManagementFrame = new HumanVendorManagementFrame();
         Kernel.getWorker().addFrame(this._spectatorManagementFrame);
         if(!Kernel.getWorker().contains(EstateFrame))
         {
            Kernel.getWorker().addFrame(this._estateFrame);
         }
         this._allianceFrame = Kernel.getWorker().getFrame(AllianceFrame) as AllianceFrame;
         this._allianceFrame.pushRoleplay();
         if(!Kernel.getWorker().contains(EmoticonFrame))
         {
            this._emoticonFrame = new EmoticonFrame();
            Kernel.getWorker().addFrame(this._emoticonFrame);
         }
         else
         {
            this._emoticonFrame = Kernel.getWorker().getFrame(EmoticonFrame) as EmoticonFrame;
         }
         this._playersMultiCraftSkill = new Array();
         this._obtainedItemTextFormat = new TextFormat("Verdana",24,7615756,true);
         this._obtainedItemBonusTextFormat = new TextFormat("Verdana",24,16733440,true);
         this._itemIcon = new Texture();
         this._itemBonusIcon = new Texture();
         var itemIconFilter:GlowFilter = new GlowFilter(0,1,2,2,2,1);
         this._itemIcon.filters = [itemIconFilter];
         this._itemBonusIcon.filters = [itemIconFilter];
         this._mountBoosTextFormat = new TextFormat("Verdana",24,7615756,true);
         var stackFrame:StackManagementFrame = Kernel.getWorker().getFrame(StackManagementFrame) as StackManagementFrame;
         stackFrame.paused = false;
         return true;
      }
      
      public function process(msg:Message) : Boolean
      {
         /*
          * Decompilation error
          * Timeout (1 minute) was reached
          * Instruction count: 5990
          */
         throw new flash.errors.IllegalOperationError("Not decompiled due to timeout");
      }
      
      public function pulled() : Boolean
      {
         var allianceFrame:AllianceFrame = Kernel.getWorker().getFrame(AllianceFrame) as AllianceFrame;
         allianceFrame.pullRoleplay();
         this._interactivesFrame.clear();
         MountAutoTripManager.getInstance().stopCurrentTrip();
         Kernel.getWorker().removeFrame(this._entitiesFrame);
         Kernel.getWorker().removeFrame(this._delayedActionFrame);
         Kernel.getWorker().removeFrame(this._worldFrame);
         Kernel.getWorker().removeFrame(this._movementFrame);
         Kernel.getWorker().removeFrame(this._interactivesFrame);
         Kernel.getWorker().removeFrame(this._spectatorManagementFrame);
         Kernel.getWorker().removeFrame(this._npcDialogFrame);
         Kernel.getWorker().removeFrame(this._documentFrame);
         Kernel.getWorker().removeFrame(this._zaapFrame);
         Kernel.getWorker().removeFrame(this._paddockFrame);
         if(Kernel.getWorker().contains(HavenbagFrame))
         {
            Kernel.getWorker().removeFrame(Kernel.getWorker().getFrame(HavenbagFrame));
         }
         return true;
      }
      
      public function getActorName(actorId:Number) : String
      {
         var actorInfos:GameRolePlayActorInformations = null;
         var tcInfos:GameRolePlayTaxCollectorInformations = null;
         actorInfos = this.getActorInfos(actorId);
         if(!actorInfos)
         {
            return "Unknown Actor";
         }
         switch(true)
         {
            case actorInfos is GameRolePlayNamedActorInformations:
               return (actorInfos as GameRolePlayNamedActorInformations).name;
            case actorInfos is GameRolePlayTaxCollectorInformations:
               tcInfos = actorInfos as GameRolePlayTaxCollectorInformations;
               return TaxCollectorFirstname.getTaxCollectorFirstnameById(tcInfos.identification.firstNameId).firstname + " " + TaxCollectorName.getTaxCollectorNameById(tcInfos.identification.lastNameId).name;
            case actorInfos is GameRolePlayNpcInformations:
               return Npc.getNpcById((actorInfos as GameRolePlayNpcInformations).npcId).name;
            case actorInfos is GameRolePlayGroupMonsterInformations:
            case actorInfos is GameRolePlayPrismInformations:
            case actorInfos is GameRolePlayPortalInformations:
               _log.error("Fail: getActorName called with an actorId corresponding to a monsters group or a prism or a portal (" + actorInfos + ").");
               return "<error: cannot get a name>";
            default:
               return "Unknown Actor Type";
         }
      }
      
      private function sendPlayPlayerFightFriendlyAnswerMessage(accept:Boolean) : void
      {
         var grppffam2:GameRolePlayPlayerFightFriendlyAnswerMessage = new GameRolePlayPlayerFightFriendlyAnswerMessage();
         grppffam2.initGameRolePlayPlayerFightFriendlyAnswerMessage(this._currentWaitingFightId,accept);
         ConnectionsHandler.getConnection().send(grppffam2);
      }
      
      private function getActorInfos(actorId:Number) : GameRolePlayActorInformations
      {
         return this.entitiesFrame.getEntityInfos(actorId) as GameRolePlayActorInformations;
      }
      
      private function executeSpellBuffer(callback:Function, hadScript:Boolean, scriptSuccess:Boolean = false, castProvider:RoleplaySpellCastProvider = null) : void
      {
         var step:ISequencable = null;
         var ss:SerialSequencer = new SerialSequencer();
         for each(step in castProvider.stepsBuffer)
         {
            ss.addStep(step);
         }
         ss.start();
      }
      
      private function addCraftFrame() : void
      {
         if(!Kernel.getWorker().contains(CraftFrame))
         {
            Kernel.getWorker().addFrame(this._craftFrame);
         }
      }
      
      private function addCommonExchangeFrame(pExchangeType:uint) : void
      {
         if(!Kernel.getWorker().contains(CommonExchangeManagementFrame))
         {
            this._commonExchangeFrame = new CommonExchangeManagementFrame(pExchangeType);
            Kernel.getWorker().addFrame(this._commonExchangeFrame);
         }
      }
      
      private function onListenOrientation(e:MouseEvent) : void
      {
         var point:Point = this._playerEntity.localToGlobal(new Point(0,0));
         var difY:Number = StageShareManager.stage.mouseY - point.y;
         var difX:Number = StageShareManager.stage.mouseX - point.x;
         var orientation:uint = AngleToOrientation.angleToOrientation(Math.atan2(difY,difX));
         var direction:int = this._playerEntity.getDirection();
         var currentEmoticon:Emoticon = Emoticon.getEmoticonById(this._entitiesFrame.currentEmoticon);
         if(direction == orientation)
         {
            return;
         }
         if(!currentEmoticon || currentEmoticon && currentEmoticon.eight_directions)
         {
            this._playerEntity.setDirection(orientation);
         }
         else if(orientation % 2 == 0)
         {
            this._playerEntity.setDirection(orientation + 1);
         }
         else
         {
            this._playerEntity.setDirection(orientation);
         }
      }
      
      private function onClickOrientation(e:MouseEvent) : void
      {
         Kernel.getWorker().process(ChangeWorldInteractionAction.create(true));
         StageShareManager.stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.onListenOrientation);
         StageShareManager.stage.removeEventListener(MouseEvent.CLICK,this.onClickOrientation);
         var animation:String = this._playerEntity.getAnimation();
         var gmcormsg:GameMapChangeOrientationRequestMessage = new GameMapChangeOrientationRequestMessage();
         gmcormsg.initGameMapChangeOrientationRequestMessage(this._playerEntity.getDirection());
         ConnectionsHandler.getConnection().send(gmcormsg);
      }
      
      private function onInteractiveAnimationEnd(pTimerEvent:TimerEvent) : void
      {
         var bonusQty:uint = 0;
         pTimerEvent.currentTarget.removeEventListener(TimerEvent.TIMER,this.onInteractiveAnimationEnd);
         if(this._obtainedItemMsg)
         {
            bonusQty = this._obtainedItemMsg is ObtainedItemWithBonusMessage?uint((this._obtainedItemMsg as ObtainedItemWithBonusMessage).bonusQuantity):uint(0);
            this.displayObtainedItem(this._obtainedItemMsg.genericId,this._obtainedItemMsg.baseQuantity,bonusQty);
         }
         this._obtainedItemMsg = null;
      }
      
      private function displayObtainedItem(pItemGID:uint, pItemQuantity:uint, pItemBonusQuantity:uint = 0) : void
      {
         var entity:IEntity = DofusEntities.getEntity(PlayedCharacterManager.getInstance().id);
         var itemW:ItemWrapper = ItemWrapper.create(0,0,pItemGID,1,null);
         var iconUri:Uri = itemW.getIconUri();
         this._itemIcon.uri = iconUri;
         this._itemIcon.finalize();
         CharacteristicContextualManager.getInstance().addStatContextualWithIcon(this._itemIcon,pItemQuantity.toString(),entity,this._obtainedItemTextFormat,1,GameContextEnum.ROLE_PLAY,1,1500);
         if(pItemBonusQuantity > 0)
         {
            this._itemBonusIcon.uri = iconUri;
            this._itemBonusIcon.finalize();
            CharacteristicContextualManager.getInstance().addStatContextualWithIcon(this._itemBonusIcon,pItemBonusQuantity.toString(),entity,this._obtainedItemBonusTextFormat,1,GameContextEnum.ROLE_PLAY,1,1500);
         }
      }
      
      public function getMultiCraftSkills(pPlayerId:Number) : Vector.<uint>
      {
         var mcefp:MultiCraftEnableForPlayer = null;
         for each(mcefp in this._playersMultiCraftSkill)
         {
            if(mcefp.playerId == pPlayerId)
            {
               return mcefp.skills;
            }
         }
         return null;
      }
   }
}

class MultiCraftEnableForPlayer
{
    
   
   public var playerId:Number;
   
   public var skills:Vector.<uint>;
   
   function MultiCraftEnableForPlayer()
   {
      super();
   }
}
