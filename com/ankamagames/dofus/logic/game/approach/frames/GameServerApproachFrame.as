package com.ankamagames.dofus.logic.game.approach.frames
{
   import by.blooddy.crypto.MD5;
   import com.ankamagames.berilia.Berilia;
   import com.ankamagames.berilia.managers.KernelEventsManager;
   import com.ankamagames.berilia.managers.UiModuleManager;
   import com.ankamagames.berilia.types.data.UiModule;
   import com.ankamagames.berilia.types.messages.AllModulesLoadedMessage;
   import com.ankamagames.berilia.types.shortcut.Shortcut;
   import com.ankamagames.dofus.BuildInfos;
   import com.ankamagames.dofus.Constants;
   import com.ankamagames.dofus.console.moduleLUA.ConsoleLUA;
   import com.ankamagames.dofus.console.moduleLogger.Console;
   import com.ankamagames.dofus.console.moduleLogger.ModuleDebugManager;
   import com.ankamagames.dofus.datacenter.misc.OptionalFeature;
   import com.ankamagames.dofus.datacenter.servers.Server;
   import com.ankamagames.dofus.externalnotification.ExternalNotificationManager;
   import com.ankamagames.dofus.internalDatacenter.connection.BasicCharacterWrapper;
   import com.ankamagames.dofus.internalDatacenter.connection.CreationCharacterWrapper;
   import com.ankamagames.dofus.internalDatacenter.items.ItemWrapper;
   import com.ankamagames.dofus.kernel.Kernel;
   import com.ankamagames.dofus.kernel.net.ConnectionsHandler;
   import com.ankamagames.dofus.logic.common.frames.LoadingModuleFrame;
   import com.ankamagames.dofus.logic.common.frames.MiscFrame;
   import com.ankamagames.dofus.logic.common.managers.PlayerManager;
   import com.ankamagames.dofus.logic.connection.frames.GameStartingFrame;
   import com.ankamagames.dofus.logic.connection.frames.ServerSelectionFrame;
   import com.ankamagames.dofus.logic.connection.managers.AuthentificationManager;
   import com.ankamagames.dofus.logic.game.approach.actions.CharacterCreationAction;
   import com.ankamagames.dofus.logic.game.approach.actions.CharacterDeletionAction;
   import com.ankamagames.dofus.logic.game.approach.actions.CharacterDeselectionAction;
   import com.ankamagames.dofus.logic.game.approach.actions.CharacterNameSuggestionRequestAction;
   import com.ankamagames.dofus.logic.game.approach.actions.CharacterRemodelSelectionAction;
   import com.ankamagames.dofus.logic.game.approach.actions.CharacterReplayRequestAction;
   import com.ankamagames.dofus.logic.game.approach.actions.CharacterSelectionAction;
   import com.ankamagames.dofus.logic.game.approach.actions.GiftAssignRequestAction;
   import com.ankamagames.dofus.logic.game.common.actions.CharacterAutoConnectAction;
   import com.ankamagames.dofus.logic.game.common.frames.AlignmentFrame;
   import com.ankamagames.dofus.logic.game.common.frames.AllianceFrame;
   import com.ankamagames.dofus.logic.game.common.frames.AveragePricesFrame;
   import com.ankamagames.dofus.logic.game.common.frames.CameraControlFrame;
   import com.ankamagames.dofus.logic.game.common.frames.ChatFrame;
   import com.ankamagames.dofus.logic.game.common.frames.CommonUiFrame;
   import com.ankamagames.dofus.logic.game.common.frames.ContextChangeFrame;
   import com.ankamagames.dofus.logic.game.common.frames.EmoticonFrame;
   import com.ankamagames.dofus.logic.game.common.frames.ExternalGameFrame;
   import com.ankamagames.dofus.logic.game.common.frames.HouseFrame;
   import com.ankamagames.dofus.logic.game.common.frames.IdolsFrame;
   import com.ankamagames.dofus.logic.game.common.frames.InventoryManagementFrame;
   import com.ankamagames.dofus.logic.game.common.frames.JobsFrame;
   import com.ankamagames.dofus.logic.game.common.frames.LivingObjectFrame;
   import com.ankamagames.dofus.logic.game.common.frames.MountFrame;
   import com.ankamagames.dofus.logic.game.common.frames.PartyManagementFrame;
   import com.ankamagames.dofus.logic.game.common.frames.PlayedCharacterUpdatesFrame;
   import com.ankamagames.dofus.logic.game.common.frames.ProtectPishingFrame;
   import com.ankamagames.dofus.logic.game.common.frames.QuestFrame;
   import com.ankamagames.dofus.logic.game.common.frames.ScreenCaptureFrame;
   import com.ankamagames.dofus.logic.game.common.frames.ServerTransferFrame;
   import com.ankamagames.dofus.logic.game.common.frames.SocialFrame;
   import com.ankamagames.dofus.logic.game.common.frames.SpellInventoryManagementFrame;
   import com.ankamagames.dofus.logic.game.common.frames.StackManagementFrame;
   import com.ankamagames.dofus.logic.game.common.frames.SynchronisationFrame;
   import com.ankamagames.dofus.logic.game.common.frames.TinselFrame;
   import com.ankamagames.dofus.logic.game.common.frames.WorldFrame;
   import com.ankamagames.dofus.logic.game.common.managers.InactivityManager;
   import com.ankamagames.dofus.logic.game.common.managers.PlayedCharacterManager;
   import com.ankamagames.dofus.logic.game.common.managers.TimeManager;
   import com.ankamagames.dofus.logic.game.roleplay.frames.RoleplayIntroductionFrame;
   import com.ankamagames.dofus.logic.shield.SecureModeManager;
   import com.ankamagames.dofus.misc.interClient.InterClientManager;
   import com.ankamagames.dofus.misc.lists.HookList;
   import com.ankamagames.dofus.misc.stats.StatisticsManager;
   import com.ankamagames.dofus.misc.utils.errormanager.DofusErrorHandler;
   import com.ankamagames.dofus.network.ProtocolConstantsEnum;
   import com.ankamagames.dofus.network.enums.BuildTypeEnum;
   import com.ankamagames.dofus.network.enums.CharacterDeletionErrorEnum;
   import com.ankamagames.dofus.network.enums.CharacterRemodelingEnum;
   import com.ankamagames.dofus.network.enums.GameServerTypeEnum;
   import com.ankamagames.dofus.network.messages.authorized.ConsoleCommandsListMessage;
   import com.ankamagames.dofus.network.messages.game.approach.AccountCapabilitiesMessage;
   import com.ankamagames.dofus.network.messages.game.approach.AlreadyConnectedMessage;
   import com.ankamagames.dofus.network.messages.game.approach.AuthenticationTicketAcceptedMessage;
   import com.ankamagames.dofus.network.messages.game.approach.AuthenticationTicketMessage;
   import com.ankamagames.dofus.network.messages.game.approach.AuthenticationTicketRefusedMessage;
   import com.ankamagames.dofus.network.messages.game.approach.HelloGameMessage;
   import com.ankamagames.dofus.network.messages.game.basic.BasicTimeMessage;
   import com.ankamagames.dofus.network.messages.game.character.choice.BasicCharactersListMessage;
   import com.ankamagames.dofus.network.messages.game.character.choice.CharacterFirstSelectionMessage;
   import com.ankamagames.dofus.network.messages.game.character.choice.CharacterReplayWithRemodelRequestMessage;
   import com.ankamagames.dofus.network.messages.game.character.choice.CharacterSelectedErrorMessage;
   import com.ankamagames.dofus.network.messages.game.character.choice.CharacterSelectedForceMessage;
   import com.ankamagames.dofus.network.messages.game.character.choice.CharacterSelectedForceReadyMessage;
   import com.ankamagames.dofus.network.messages.game.character.choice.CharacterSelectedSuccessMessage;
   import com.ankamagames.dofus.network.messages.game.character.choice.CharacterSelectionMessage;
   import com.ankamagames.dofus.network.messages.game.character.choice.CharacterSelectionWithRemodelMessage;
   import com.ankamagames.dofus.network.messages.game.character.choice.CharactersListErrorMessage;
   import com.ankamagames.dofus.network.messages.game.character.choice.CharactersListMessage;
   import com.ankamagames.dofus.network.messages.game.character.choice.CharactersListRequestMessage;
   import com.ankamagames.dofus.network.messages.game.character.choice.CharactersListWithRemodelingMessage;
   import com.ankamagames.dofus.network.messages.game.character.creation.CharacterCanBeCreatedRequestMessage;
   import com.ankamagames.dofus.network.messages.game.character.creation.CharacterCanBeCreatedResultMessage;
   import com.ankamagames.dofus.network.messages.game.character.creation.CharacterCreationRequestMessage;
   import com.ankamagames.dofus.network.messages.game.character.creation.CharacterCreationResultMessage;
   import com.ankamagames.dofus.network.messages.game.character.creation.CharacterNameSuggestionFailureMessage;
   import com.ankamagames.dofus.network.messages.game.character.creation.CharacterNameSuggestionRequestMessage;
   import com.ankamagames.dofus.network.messages.game.character.creation.CharacterNameSuggestionSuccessMessage;
   import com.ankamagames.dofus.network.messages.game.character.deletion.CharacterDeletionErrorMessage;
   import com.ankamagames.dofus.network.messages.game.character.deletion.CharacterDeletionRequestMessage;
   import com.ankamagames.dofus.network.messages.game.character.replay.CharacterReplayRequestMessage;
   import com.ankamagames.dofus.network.messages.game.context.GameContextCreateRequestMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.fight.arena.GameRolePlayArenaSwitchToFightServerMessage;
   import com.ankamagames.dofus.network.messages.game.startup.StartupActionFinishedMessage;
   import com.ankamagames.dofus.network.messages.game.startup.StartupActionsExecuteMessage;
   import com.ankamagames.dofus.network.messages.game.startup.StartupActionsListMessage;
   import com.ankamagames.dofus.network.messages.game.startup.StartupActionsObjetAttributionMessage;
   import com.ankamagames.dofus.network.messages.security.ClientKeyMessage;
   import com.ankamagames.dofus.network.types.game.character.choice.CharacterBaseInformations;
   import com.ankamagames.dofus.network.types.game.character.choice.CharacterHardcoreOrEpicInformations;
   import com.ankamagames.dofus.network.types.game.character.choice.CharacterToRemodelInformations;
   import com.ankamagames.dofus.network.types.game.character.choice.RemodelingInformation;
   import com.ankamagames.dofus.network.types.game.data.items.ObjectItemInformationWithQuantity;
   import com.ankamagames.dofus.network.types.game.startup.StartupActionAddObject;
   import com.ankamagames.dofus.scripts.api.CameraApi;
   import com.ankamagames.dofus.scripts.api.EntityApi;
   import com.ankamagames.dofus.scripts.api.ScriptSequenceApi;
   import com.ankamagames.dofus.types.data.ServerCommand;
   import com.ankamagames.dofus.uiApi.DataApi;
   import com.ankamagames.dofus.uiApi.SoundApi;
   import com.ankamagames.jerakine.data.I18n;
   import com.ankamagames.jerakine.data.XmlConfig;
   import com.ankamagames.jerakine.logger.Log;
   import com.ankamagames.jerakine.logger.Logger;
   import com.ankamagames.jerakine.lua.LuaPlayer;
   import com.ankamagames.jerakine.managers.LangManager;
   import com.ankamagames.jerakine.managers.OptionManager;
   import com.ankamagames.jerakine.managers.StoreDataManager;
   import com.ankamagames.jerakine.messages.ConnectionResumedMessage;
   import com.ankamagames.jerakine.messages.Frame;
   import com.ankamagames.jerakine.messages.Message;
   import com.ankamagames.jerakine.network.messages.ServerConnectionFailedMessage;
   import com.ankamagames.jerakine.script.ScriptsManager;
   import com.ankamagames.jerakine.types.DataStoreType;
   import com.ankamagames.jerakine.types.enums.DataStoreEnum;
   import com.ankamagames.jerakine.types.enums.Priority;
   import com.ankamagames.jerakine.utils.benchmark.monitoring.FpsManager;
   import com.ankamagames.jerakine.utils.system.AirScanner;
   import flash.display.Loader;
   import flash.system.ApplicationDomain;
   import flash.system.LoaderContext;
   import flash.utils.getQualifiedClassName;
   import flash.utils.setTimeout;
   import scopart.raven.RavenClient;
   
   public class GameServerApproachFrame implements Frame
   {
      
      protected static const _log:Logger = Log.getLogger(getQualifiedClassName(GameServerApproachFrame));
      
      private static var _changeLogLoader:Loader = new Loader();
      
      public static var authenticationTicketAccepted:Boolean = false;
       
      
      private const LOADING_TIMEOUT:uint = 60000.0;
      
      private var _charactersList:Vector.<BasicCharacterWrapper>;
      
      private var _charactersToRemodelList:Array;
      
      private var _kernel:KernelEventsManager;
      
      private var _gmaf:LoadingModuleFrame;
      
      private var _loadingStart:Number;
      
      private var _waitingMessages:Vector.<Message>;
      
      private var _cssmsg:CharacterSelectedSuccessMessage;
      
      private var _requestedCharacterId:Number;
      
      private var _requestedToRemodelCharacterId:Number;
      
      private var _waitingForListRefreshAfterDeletion:Boolean;
      
      private var _lc:LoaderContext;
      
      private var commonMod:Object;
      
      private var _giftList:Array;
      
      private var _charaListMinusDeadPeople:Array;
      
      private var _reconnectMsgSend:Boolean = false;
      
      private var _openCharsList:Boolean = true;
      
      public function GameServerApproachFrame()
      {
         this._charactersList = new Vector.<BasicCharacterWrapper>();
         this._charactersToRemodelList = new Array();
         this._kernel = KernelEventsManager.getInstance();
         this._lc = new LoaderContext(false,ApplicationDomain.currentDomain);
         this.commonMod = UiModuleManager.getInstance().getModule("Ankama_Common").mainClass;
         this._giftList = new Array();
         this._charaListMinusDeadPeople = new Array();
         super();
      }
      
      public function get priority() : int
      {
         return Priority.NORMAL;
      }
      
      public function get giftList() : Array
      {
         return this._giftList;
      }
      
      public function get charaListMinusDeadPeople() : Array
      {
         return this._charaListMinusDeadPeople;
      }
      
      public function get requestedCharaId() : Number
      {
         return this._requestedCharacterId;
      }
      
      public function set requestedCharaId(id:Number) : void
      {
         this._requestedCharacterId = id;
      }
      
      public function isCharacterWaitingForChange(id:Number) : Boolean
      {
         if(this._charactersToRemodelList[id])
         {
            return true;
         }
         return false;
      }
      
      public function pushed() : Boolean
      {
         SecureModeManager.getInstance().checkMigrate();
         AirScanner.allowByteCodeExecution(this._lc,true);
         Kernel.getWorker().addFrame(new MiscFrame());
         return true;
      }
      
      public function process(msg:Message) : Boolean
      {
         /*
          * Decompilation error
          * Timeout (1 minute) was reached
          * Instruction count: 3591
          */
         throw new flash.errors.IllegalOperationError("Not decompiled due to timeout");
      }
      
      public function pulled() : Boolean
      {
         return true;
      }
      
      private function getCharacterColorsInformations(ctrci:*) : Vector.<int>
      {
         var uIndexedColor:Number = NaN;
         var uIndex:int = 0;
         var uColor:* = 0;
         if(!ctrci || !ctrci.colors)
         {
            return null;
         }
         var charColors:Vector.<int> = new Vector.<int>();
         for(var ic:int = 0; ic < ProtocolConstantsEnum.MAX_PLAYER_COLOR; ic++)
         {
            charColors.push(-1);
         }
         var num:int = ctrci.colors.length;
         for(var i:int = 0; i < num; )
         {
            uIndexedColor = ctrci.colors[i];
            uIndex = uIndexedColor >> 24 - 1;
            uColor = uIndexedColor & 16777215;
            if(uIndex > -1 && uIndex < charColors.length)
            {
               charColors[uIndex] = uColor;
            }
            i++;
         }
         return charColors;
      }
      
      private function onEscapePopup() : void
      {
         Kernel.getInstance().reset();
      }
      
      private function requestCharactersList() : void
      {
         var clrmsg:CharactersListRequestMessage = new CharactersListRequestMessage();
         if(ConnectionsHandler && ConnectionsHandler.getConnection())
         {
            ConnectionsHandler.getConnection().send(clrmsg);
         }
      }
      
      private function getCharacterToConnect() : BasicCharacterWrapper
      {
         var charToConnect:BasicCharacterWrapper = null;
         var charToConnectSpecificallyId:Number = NaN;
         var ctc:BasicCharacterWrapper = null;
         if((Dofus.getInstance().options && Dofus.getInstance().options.autoConnectType == 2 || PlayerManager.getInstance().autoConnectOfASpecificCharacterId > -1) && PlayerManager.getInstance().allowAutoConnectCharacter)
         {
            charToConnectSpecificallyId = PlayerManager.getInstance().autoConnectOfASpecificCharacterId;
            if(charToConnectSpecificallyId == -1)
            {
               if(this._charactersList.length <= 0)
               {
                  return null;
               }
               charToConnect = this._charactersList[0];
            }
            else
            {
               for each(ctc in this._charactersList)
               {
                  if(ctc.id == charToConnectSpecificallyId)
                  {
                     charToConnect = ctc;
                     break;
                  }
               }
            }
            return charToConnect;
         }
         return null;
      }
      
      private function launchAutoConnect(charToConnect:BasicCharacterWrapper, server:Server) : void
      {
         var updateInformationDisplayed:String = null;
         var currentVersion:String = null;
         var fakacsa:CharacterSelectionAction = null;
         if(charToConnect && ((server.gameTypeId != GameServerTypeEnum.SERVER_TYPE_HARDCORE && server.gameTypeId != GameServerTypeEnum.SERVER_TYPE_EPIC || charToConnect.deathState == 0) && !SecureModeManager.getInstance().active && !this.isCharacterWaitingForChange(charToConnect.id) && !PlayerManager.getInstance().wasAlreadyConnected))
         {
            this._openCharsList = false;
            this._kernel.processCallback(HookList.CharactersListUpdated,this._charactersList);
            updateInformationDisplayed = StoreDataManager.getInstance().getData(new DataStoreType("ComputerModule_Ankama_Connection",true,DataStoreEnum.LOCATION_LOCAL,DataStoreEnum.BIND_COMPUTER),"updateInformationDisplayed");
            currentVersion = BuildInfos.VERSION.major.toString() + "-" + BuildInfos.VERSION.minor.toString();
            if(updateInformationDisplayed == currentVersion)
            {
               fakacsa = new CharacterSelectionAction();
               fakacsa.btutoriel = false;
               fakacsa.characterId = charToConnect.id;
               this.process(fakacsa);
               PlayerManager.getInstance().allowAutoConnectCharacter = false;
            }
         }
      }
   }
}
