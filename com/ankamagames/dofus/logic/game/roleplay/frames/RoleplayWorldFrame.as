package com.ankamagames.dofus.logic.game.roleplay.frames
{
   import com.ankamagames.atouin.Atouin;
   import com.ankamagames.atouin.AtouinConstants;
   import com.ankamagames.atouin.data.map.CellData;
   import com.ankamagames.atouin.enums.PlacementStrataEnums;
   import com.ankamagames.atouin.managers.FrustumManager;
   import com.ankamagames.atouin.managers.InteractiveCellManager;
   import com.ankamagames.atouin.managers.MapDisplayManager;
   import com.ankamagames.atouin.managers.SelectionManager;
   import com.ankamagames.atouin.messages.AdjacentMapClickMessage;
   import com.ankamagames.atouin.messages.AdjacentMapOutMessage;
   import com.ankamagames.atouin.messages.AdjacentMapOverMessage;
   import com.ankamagames.atouin.messages.CellClickMessage;
   import com.ankamagames.atouin.renderers.ZoneDARenderer;
   import com.ankamagames.atouin.types.FrustumShape;
   import com.ankamagames.atouin.types.GraphicCell;
   import com.ankamagames.atouin.types.Selection;
   import com.ankamagames.atouin.utils.CellIdConverter;
   import com.ankamagames.atouin.utils.DataMapProvider;
   import com.ankamagames.berilia.components.Label;
   import com.ankamagames.berilia.components.Texture;
   import com.ankamagames.berilia.enums.StrataEnum;
   import com.ankamagames.berilia.factories.MenusFactory;
   import com.ankamagames.berilia.frames.ShortcutsFrame;
   import com.ankamagames.berilia.managers.KernelEventsManager;
   import com.ankamagames.berilia.managers.LinkedCursorSpriteManager;
   import com.ankamagames.berilia.managers.TooltipManager;
   import com.ankamagames.berilia.managers.UiModuleManager;
   import com.ankamagames.berilia.types.LocationEnum;
   import com.ankamagames.berilia.types.data.LinkedCursorData;
   import com.ankamagames.berilia.types.data.TextTooltipInfo;
   import com.ankamagames.berilia.utils.BeriliaHookList;
   import com.ankamagames.dofus.datacenter.interactives.Interactive;
   import com.ankamagames.dofus.datacenter.interactives.Sign;
   import com.ankamagames.dofus.datacenter.jobs.Skill;
   import com.ankamagames.dofus.datacenter.monsters.Monster;
   import com.ankamagames.dofus.datacenter.npcs.Npc;
   import com.ankamagames.dofus.datacenter.npcs.NpcAction;
   import com.ankamagames.dofus.datacenter.npcs.TaxCollectorFirstname;
   import com.ankamagames.dofus.datacenter.npcs.TaxCollectorName;
   import com.ankamagames.dofus.datacenter.world.Area;
   import com.ankamagames.dofus.datacenter.world.MapPosition;
   import com.ankamagames.dofus.datacenter.world.SubArea;
   import com.ankamagames.dofus.internalDatacenter.DataEnum;
   import com.ankamagames.dofus.internalDatacenter.guild.AllianceWrapper;
   import com.ankamagames.dofus.internalDatacenter.guild.GuildWrapper;
   import com.ankamagames.dofus.internalDatacenter.house.HouseWrapper;
   import com.ankamagames.dofus.internalDatacenter.world.WorldPointWrapper;
   import com.ankamagames.dofus.kernel.Kernel;
   import com.ankamagames.dofus.kernel.net.ConnectionsHandler;
   import com.ankamagames.dofus.logic.common.actions.EmptyStackAction;
   import com.ankamagames.dofus.logic.common.managers.PlayerManager;
   import com.ankamagames.dofus.logic.game.common.actions.guild.GuildFightJoinRequestAction;
   import com.ankamagames.dofus.logic.game.common.actions.humanVendor.ExchangeOnHumanVendorRequestAction;
   import com.ankamagames.dofus.logic.game.common.frames.AllianceFrame;
   import com.ankamagames.dofus.logic.game.common.frames.BreachFrame;
   import com.ankamagames.dofus.logic.game.common.frames.SocialFrame;
   import com.ankamagames.dofus.logic.game.common.managers.PlayedCharacterManager;
   import com.ankamagames.dofus.logic.game.common.misc.DofusEntities;
   import com.ankamagames.dofus.logic.game.fight.actions.ShowAllNamesAction;
   import com.ankamagames.dofus.logic.game.fight.frames.FightPreparationFrame;
   import com.ankamagames.dofus.logic.game.roleplay.actions.NpcGenericActionRequestAction;
   import com.ankamagames.dofus.logic.game.roleplay.actions.ShowEntitiesTooltipsAction;
   import com.ankamagames.dofus.logic.game.roleplay.actions.ShowFightPositionsAction;
   import com.ankamagames.dofus.logic.game.roleplay.managers.MountAutoTripManager;
   import com.ankamagames.dofus.logic.game.roleplay.managers.RoleplayManager;
   import com.ankamagames.dofus.logic.game.roleplay.managers.SkillManager;
   import com.ankamagames.dofus.logic.game.roleplay.messages.InteractiveElementActivationMessage;
   import com.ankamagames.dofus.logic.game.roleplay.messages.InteractiveElementMouseOutMessage;
   import com.ankamagames.dofus.logic.game.roleplay.messages.InteractiveElementMouseOverMessage;
   import com.ankamagames.dofus.logic.game.roleplay.types.CharacterTooltipInformation;
   import com.ankamagames.dofus.logic.game.roleplay.types.FightTeam;
   import com.ankamagames.dofus.logic.game.roleplay.types.GameContextPaddockItemInformations;
   import com.ankamagames.dofus.logic.game.roleplay.types.MutantTooltipInformation;
   import com.ankamagames.dofus.logic.game.roleplay.types.PortalTooltipInformation;
   import com.ankamagames.dofus.logic.game.roleplay.types.PrismTooltipInformation;
   import com.ankamagames.dofus.logic.game.roleplay.types.RoleplayTeamFightersTooltipInformation;
   import com.ankamagames.dofus.logic.game.roleplay.types.TaxCollectorTooltipInformation;
   import com.ankamagames.dofus.misc.lists.ChatHookList;
   import com.ankamagames.dofus.misc.lists.HookList;
   import com.ankamagames.dofus.misc.lists.SocialHookList;
   import com.ankamagames.dofus.network.enums.PlayerLifeStatusEnum;
   import com.ankamagames.dofus.network.enums.SubEntityBindingPointCategoryEnum;
   import com.ankamagames.dofus.network.enums.TeamTypeEnum;
   import com.ankamagames.dofus.network.messages.game.context.fight.GameFightJoinRequestMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.MapComplementaryInformationsDataMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.MapFightStartPositionsUpdateMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.houses.HouseKickIndoorMerchantRequestMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.party.PartyInvitationRequestMessage;
   import com.ankamagames.dofus.network.messages.game.inventory.exchanges.ExchangeOnHumanVendorRequestMessage;
   import com.ankamagames.dofus.network.types.game.context.GameContextActorInformations;
   import com.ankamagames.dofus.network.types.game.context.GameRolePlayTaxCollectorInformations;
   import com.ankamagames.dofus.network.types.game.context.TaxCollectorStaticExtendedInformations;
   import com.ankamagames.dofus.network.types.game.context.fight.FightStartingPositions;
   import com.ankamagames.dofus.network.types.game.context.fight.FightTeamMemberInformations;
   import com.ankamagames.dofus.network.types.game.context.fight.FightTeamMemberTaxCollectorInformations;
   import com.ankamagames.dofus.network.types.game.context.roleplay.AllianceInformations;
   import com.ankamagames.dofus.network.types.game.context.roleplay.GameRolePlayActorInformations;
   import com.ankamagames.dofus.network.types.game.context.roleplay.GameRolePlayCharacterInformations;
   import com.ankamagames.dofus.network.types.game.context.roleplay.GameRolePlayGroupMonsterInformations;
   import com.ankamagames.dofus.network.types.game.context.roleplay.GameRolePlayGroupMonsterWaveInformations;
   import com.ankamagames.dofus.network.types.game.context.roleplay.GameRolePlayMerchantInformations;
   import com.ankamagames.dofus.network.types.game.context.roleplay.GameRolePlayMutantInformations;
   import com.ankamagames.dofus.network.types.game.context.roleplay.GameRolePlayNamedActorInformations;
   import com.ankamagames.dofus.network.types.game.context.roleplay.GameRolePlayNpcInformations;
   import com.ankamagames.dofus.network.types.game.context.roleplay.GameRolePlayPortalInformations;
   import com.ankamagames.dofus.network.types.game.context.roleplay.GameRolePlayPrismInformations;
   import com.ankamagames.dofus.network.types.game.context.roleplay.GameRolePlayTreasureHintInformations;
   import com.ankamagames.dofus.network.types.game.context.roleplay.GroupMonsterStaticInformations;
   import com.ankamagames.dofus.network.types.game.context.roleplay.GuildInformations;
   import com.ankamagames.dofus.network.types.game.context.roleplay.MonsterInGroupLightInformations;
   import com.ankamagames.dofus.network.types.game.interactive.InteractiveElement;
   import com.ankamagames.dofus.network.types.game.interactive.InteractiveElementSkill;
   import com.ankamagames.dofus.types.entities.AnimatedCharacter;
   import com.ankamagames.dofus.types.sequences.AddGfxEntityStep;
   import com.ankamagames.dofus.uiApi.RoleplayApi;
   import com.ankamagames.dofus.uiApi.SocialApi;
   import com.ankamagames.dofus.uiApi.SystemApi;
   import com.ankamagames.jerakine.data.I18n;
   import com.ankamagames.jerakine.data.XmlConfig;
   import com.ankamagames.jerakine.entities.interfaces.IDisplayable;
   import com.ankamagames.jerakine.entities.interfaces.IEntity;
   import com.ankamagames.jerakine.entities.interfaces.IInteractive;
   import com.ankamagames.jerakine.entities.interfaces.IMovable;
   import com.ankamagames.jerakine.entities.messages.EntityClickMessage;
   import com.ankamagames.jerakine.entities.messages.EntityMouseOutMessage;
   import com.ankamagames.jerakine.entities.messages.EntityMouseOverMessage;
   import com.ankamagames.jerakine.enum.OperatingSystem;
   import com.ankamagames.jerakine.enum.OptionEnum;
   import com.ankamagames.jerakine.handlers.messages.mouse.MouseDownMessage;
   import com.ankamagames.jerakine.handlers.messages.mouse.MouseRightClickMessage;
   import com.ankamagames.jerakine.handlers.messages.mouse.MouseUpMessage;
   import com.ankamagames.jerakine.interfaces.IRectangle;
   import com.ankamagames.jerakine.logger.Log;
   import com.ankamagames.jerakine.logger.Logger;
   import com.ankamagames.jerakine.managers.CursorSpriteManager;
   import com.ankamagames.jerakine.managers.LangManager;
   import com.ankamagames.jerakine.managers.OptionManager;
   import com.ankamagames.jerakine.messages.Frame;
   import com.ankamagames.jerakine.messages.Message;
   import com.ankamagames.jerakine.messages.events.FramePushedEvent;
   import com.ankamagames.jerakine.sequencer.SerialSequencer;
   import com.ankamagames.jerakine.types.Color;
   import com.ankamagames.jerakine.types.Uri;
   import com.ankamagames.jerakine.types.enums.DirectionsEnum;
   import com.ankamagames.jerakine.types.enums.Priority;
   import com.ankamagames.jerakine.types.positions.MapPoint;
   import com.ankamagames.jerakine.types.zones.Custom;
   import com.ankamagames.jerakine.utils.display.Rectangle2;
   import com.ankamagames.jerakine.utils.display.StageShareManager;
   import com.ankamagames.jerakine.utils.system.SystemManager;
   import com.ankamagames.tiphon.display.TiphonSprite;
   import com.ankamagames.tiphon.events.TiphonEvent;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.ui.Mouse;
   import flash.utils.Dictionary;
   import flash.utils.getQualifiedClassName;
   
   public class RoleplayWorldFrame implements Frame
   {
      
      protected static const _log:Logger = Log.getLogger(getQualifiedClassName(RoleplayWorldFrame));
      
      private static const NO_CURSOR:int = -1;
      
      private static const FIGHT_CURSOR:int = 3;
      
      private static const NPC_CURSOR:int = 1;
      
      private static const DIRECTIONAL_PANEL_ID:int = 316;
      
      private static var _entitiesTooltipsFrame:EntitiesTooltipsFrame = new EntitiesTooltipsFrame();
       
      
      private const _common:String = XmlConfig.getInstance().getEntry("config.ui.skin");
      
      private var _mouseLabel:Label;
      
      private var _mouseTop:Texture;
      
      private var _mouseBottom:Texture;
      
      private var _mouseRight:Texture;
      
      private var _mouseLeft:Texture;
      
      private var _mouseTopBlue:Texture;
      
      private var _mouseBottomBlue:Texture;
      
      private var _mouseRightBlue:Texture;
      
      private var _mouseLeftBlue:Texture;
      
      private var _texturesReady:Boolean;
      
      private var _playerEntity:AnimatedCharacter;
      
      private var _playerName:String;
      
      private var _allowOnlyCharacterInteraction:Boolean;
      
      public var cellClickEnabled:Boolean;
      
      private var _infoEntitiesFrame:InfoEntitiesFrame;
      
      private var _mouseOverEntityId:Number;
      
      private var sysApi:SystemApi;
      
      private var _entityTooltipData:Dictionary;
      
      private var _redColor:String;
      
      private var _mouseDown:Boolean;
      
      private var _roleplayApi:RoleplayApi;
      
      private var _socialApi:SocialApi;
      
      private var _fightPositions:FightStartingPositions;
      
      private var _fightPositionsVisible:Boolean;
      
      public var pivotingCharacter:Boolean;
      
      public function RoleplayWorldFrame()
      {
         this._infoEntitiesFrame = new InfoEntitiesFrame();
         this.sysApi = new SystemApi();
         this._entityTooltipData = new Dictionary();
         this._roleplayApi = new RoleplayApi();
         this._socialApi = new SocialApi();
         super();
      }
      
      public function get mouseOverEntityId() : Number
      {
         return this._mouseOverEntityId;
      }
      
      public function set allowOnlyCharacterInteraction(pAllow:Boolean) : void
      {
         this._allowOnlyCharacterInteraction = pAllow;
      }
      
      public function get allowOnlyCharacterInteraction() : Boolean
      {
         return this._allowOnlyCharacterInteraction;
      }
      
      public function get priority() : int
      {
         return Priority.NORMAL;
      }
      
      private function get roleplayContextFrame() : RoleplayContextFrame
      {
         return Kernel.getWorker().getFrame(RoleplayContextFrame) as RoleplayContextFrame;
      }
      
      private function get roleplayMovementFrame() : RoleplayMovementFrame
      {
         return Kernel.getWorker().getFrame(RoleplayMovementFrame) as RoleplayMovementFrame;
      }
      
      public function pushed() : Boolean
      {
         FrustumManager.getInstance().setBorderInteraction(true);
         this._allowOnlyCharacterInteraction = false;
         this.cellClickEnabled = true;
         this.pivotingCharacter = false;
         var shortcutsFrame:ShortcutsFrame = Kernel.getWorker().getFrame(ShortcutsFrame) as ShortcutsFrame;
         if(shortcutsFrame.heldShortcuts.indexOf("showEntitiesTooltips") != -1 && !Kernel.getWorker().contains(EntitiesTooltipsFrame))
         {
            if(Kernel.getWorker().contains(RoleplayEntitiesFrame))
            {
               Kernel.getWorker().addFrame(_entitiesTooltipsFrame);
            }
            else
            {
               Kernel.getWorker().addEventListener(FramePushedEvent.EVENT_FRAME_PUSHED,this.onFramePushed);
            }
         }
         else if(Kernel.getWorker().contains(EntitiesTooltipsFrame))
         {
            Kernel.getWorker().removeFrame(_entitiesTooltipsFrame);
         }
         StageShareManager.stage.addEventListener(Event.DEACTIVATE,this.onWindowDeactivate);
         if(this._texturesReady)
         {
            return true;
         }
         this._mouseBottom = new Texture();
         this._mouseBottom.uri = new Uri(this._common + "assets.swf|cursorBottom");
         this._mouseBottom.finalize();
         this._mouseTop = new Texture();
         this._mouseTop.uri = new Uri(this._common + "assets.swf|cursorTop");
         this._mouseTop.finalize();
         this._mouseRight = new Texture();
         this._mouseRight.uri = new Uri(this._common + "assets.swf|cursorRight");
         this._mouseRight.finalize();
         this._mouseLeft = new Texture();
         this._mouseLeft.uri = new Uri(this._common + "assets.swf|cursorLeft");
         this._mouseLeft.finalize();
         this._mouseBottomBlue = new Texture();
         this._mouseBottomBlue.uri = new Uri(this._common + "assets.swf|cursorBottomBlue");
         this._mouseBottomBlue.finalize();
         this._mouseTopBlue = new Texture();
         this._mouseTopBlue.uri = new Uri(this._common + "assets.swf|cursorTopBlue");
         this._mouseTopBlue.finalize();
         this._mouseRightBlue = new Texture();
         this._mouseRightBlue.uri = new Uri(this._common + "assets.swf|cursorRightBlue");
         this._mouseRightBlue.finalize();
         this._mouseLeftBlue = new Texture();
         this._mouseLeftBlue.uri = new Uri(this._common + "assets.swf|cursorLeftBlue");
         this._mouseLeftBlue.finalize();
         this._mouseLabel = new Label();
         this._mouseLabel.css = new Uri(XmlConfig.getInstance().getEntry("config.ui.skin") + "css/normal.css");
         this._texturesReady = true;
         return true;
      }
      
      public function process(msg:Message) : Boolean
      {
         /*
          * Decompilation error
          * Timeout (1 minute) was reached
          * Instruction count: 5095
          */
         throw new flash.errors.IllegalOperationError("Not decompiled due to timeout");
      }
      
      private function showFightPositions() : void
      {
         if(this._fightPositions)
         {
            this.displayZone(FightPreparationFrame.SELECTION_CHALLENGER,this._fightPositions.positionsForChallengers,FightPreparationFrame.COLOR_CHALLENGER,FightPreparationFrame.PLAYER_TEAM_ALPHA);
            this.displayZone(FightPreparationFrame.SELECTION_DEFENDER,this._fightPositions.positionsForDefenders,FightPreparationFrame.COLOR_DEFENDER,FightPreparationFrame.ENEMY_TEAM_ALPHA);
            this._fightPositionsVisible = true;
            KernelEventsManager.getInstance().processCallback(HookList.ShowFightPositions,this._fightPositionsVisible);
         }
      }
      
      private function removeFightPositions() : void
      {
         var sc:Selection = SelectionManager.getInstance().getSelection(FightPreparationFrame.SELECTION_CHALLENGER);
         if(sc)
         {
            sc.remove();
         }
         var sd:Selection = SelectionManager.getInstance().getSelection(FightPreparationFrame.SELECTION_DEFENDER);
         if(sd)
         {
            sd.remove();
         }
         this._fightPositionsVisible = false;
         KernelEventsManager.getInstance().processCallback(HookList.ShowFightPositions,this._fightPositionsVisible);
      }
      
      private function displayZone(name:String, cells:Vector.<uint>, color:Color, alpha:Number = 1.0) : void
      {
         var s:Selection = new Selection();
         var strata:uint = !!Atouin.getInstance().options.transparentOverlayMode?uint(PlacementStrataEnums.STRATA_HIGHEST_OF_DOOM):uint(PlacementStrataEnums.STRATA_AREA);
         s.renderer = new ZoneDARenderer(strata,alpha);
         s.color = color;
         s.zone = new Custom(cells);
         (s.renderer as ZoneDARenderer).currentStrata = strata;
         SelectionManager.getInstance().addSelection(s,name);
         SelectionManager.getInstance().update(name,0,true);
      }
      
      public function pulled() : Boolean
      {
         StageShareManager.stage.removeEventListener(Event.DEACTIVATE,this.onWindowDeactivate);
         Mouse.show();
         LinkedCursorSpriteManager.getInstance().removeItem("changeMapCursor");
         CursorSpriteManager.resetCursor();
         FrustumManager.getInstance().setBorderInteraction(false);
         if(this._fightPositionsVisible)
         {
            this.removeFightPositions();
         }
         return true;
      }
      
      private function onFramePushed(pEvent:FramePushedEvent) : void
      {
         var shortcutsFrame:ShortcutsFrame = null;
         if(pEvent.frame is RoleplayEntitiesFrame)
         {
            pEvent.currentTarget.removeEventListener(FramePushedEvent.EVENT_FRAME_PUSHED,this.onFramePushed);
            shortcutsFrame = Kernel.getWorker().getFrame(ShortcutsFrame) as ShortcutsFrame;
            if(shortcutsFrame.heldShortcuts.indexOf("showEntitiesTooltips") != -1 && !Kernel.getWorker().contains(EntitiesTooltipsFrame))
            {
               Kernel.getWorker().addFrame(_entitiesTooltipsFrame);
            }
         }
      }
      
      private function onEntityAnimRendered(pEvent:TiphonEvent) : void
      {
         var ac:AnimatedCharacter = pEvent.currentTarget as AnimatedCharacter;
         ac.removeEventListener(TiphonEvent.RENDER_SUCCEED,this.onEntityAnimRendered);
         var tooltipData:Object = this._entityTooltipData[ac];
         TooltipManager.show(tooltipData.data,ac.absoluteBounds,UiModuleManager.getInstance().getModule("Ankama_Tooltips"),false,tooltipData.name,LocationEnum.POINT_BOTTOM,LocationEnum.POINT_TOP,tooltipData.tooltipOffset,true,tooltipData.tooltipMaker,null,null,tooltipData.cacheName,false,StrataEnum.STRATA_WORLD,this.sysApi.getCurrentZoom());
         delete this._entityTooltipData[ac];
      }
      
      private function displayCursor(type:int, pEnable:Boolean = true) : void
      {
         if(type == -1)
         {
            CursorSpriteManager.resetCursor();
            return;
         }
         if(PlayedCharacterManager.getInstance().state != PlayerLifeStatusEnum.STATUS_ALIVE_AND_KICKING)
         {
            return;
         }
         var cursorSprite:Sprite = RoleplayInteractivesFrame.getCursor(type,pEnable);
         CursorSpriteManager.displaySpecificCursor("interactiveCursor" + type,cursorSprite);
      }
      
      private function onWisperMessage(playerName:String) : void
      {
         KernelEventsManager.getInstance().processCallback(ChatHookList.ChatFocus,playerName);
      }
      
      private function onMerchantPlayerBuyClick(vendorId:Number, vendorCellId:uint) : void
      {
         var eohvrmsg:ExchangeOnHumanVendorRequestMessage = new ExchangeOnHumanVendorRequestMessage();
         eohvrmsg.initExchangeOnHumanVendorRequestMessage(vendorId,vendorCellId);
         ConnectionsHandler.getConnection().send(eohvrmsg);
      }
      
      private function onInviteMenuClicked(playerName:String) : void
      {
         var invitemsg:PartyInvitationRequestMessage = new PartyInvitationRequestMessage();
         invitemsg.initPartyInvitationRequestMessage(playerName);
         ConnectionsHandler.getConnection().send(invitemsg);
      }
      
      private function onMerchantHouseKickOff(cellId:uint) : void
      {
         var kickRequest:HouseKickIndoorMerchantRequestMessage = new HouseKickIndoorMerchantRequestMessage();
         kickRequest.initHouseKickIndoorMerchantRequestMessage(cellId);
         ConnectionsHandler.getConnection().send(kickRequest);
      }
      
      private function onWindowDeactivate(pEvent:Event) : void
      {
         if(Kernel.getWorker().contains(EntitiesTooltipsFrame))
         {
            Kernel.getWorker().removeFrame(_entitiesTooltipsFrame);
         }
         else if(this._fightPositionsVisible)
         {
            this.removeFightPositions();
         }
      }
   }
}
