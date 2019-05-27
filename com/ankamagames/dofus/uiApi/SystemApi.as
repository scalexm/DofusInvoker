package com.ankamagames.dofus.uiApi
{
   import com.ankama.codegen.client.api.ApiClient;
   import com.ankama.codegen.client.api.CharacterApi;
   import com.ankama.codegen.client.api.event.ApiClientEvent;
   import com.ankamagames.atouin.Atouin;
   import com.ankamagames.atouin.AtouinConstants;
   import com.ankamagames.atouin.managers.DataGroundMapManager;
   import com.ankamagames.berilia.Berilia;
   import com.ankamagames.berilia.components.ComponentInternalAccessor;
   import com.ankamagames.berilia.components.SwfApplication;
   import com.ankamagames.berilia.components.WebBrowser;
   import com.ankamagames.berilia.enums.StrataEnum;
   import com.ankamagames.berilia.frames.ShortcutsFrame;
   import com.ankamagames.berilia.frames.UIInteractionFrame;
   import com.ankamagames.berilia.interfaces.IApi;
   import com.ankamagames.berilia.managers.KernelEventsManager;
   import com.ankamagames.berilia.managers.SecureCenter;
   import com.ankamagames.berilia.managers.ThemeManager;
   import com.ankamagames.berilia.managers.TooltipManager;
   import com.ankamagames.berilia.managers.UiModuleManager;
   import com.ankamagames.berilia.types.data.Hook;
   import com.ankamagames.berilia.types.data.UiModule;
   import com.ankamagames.berilia.types.graphic.UiRootContainer;
   import com.ankamagames.berilia.types.listener.GenericListener;
   import com.ankamagames.berilia.utils.errors.ApiError;
   import com.ankamagames.berilia.utils.errors.BeriliaError;
   import com.ankamagames.berilia.utils.errors.UntrustedApiCallError;
   import com.ankamagames.dofus.BuildInfos;
   import com.ankamagames.dofus.Constants;
   import com.ankamagames.dofus.datacenter.servers.Server;
   import com.ankamagames.dofus.internalDatacenter.dare.DareCriteriaWrapper;
   import com.ankamagames.dofus.internalDatacenter.dare.DareWrapper;
   import com.ankamagames.dofus.kernel.Kernel;
   import com.ankamagames.dofus.kernel.net.ConnectionsHandler;
   import com.ankamagames.dofus.kernel.updaterv2.UpdaterApi;
   import com.ankamagames.dofus.logic.common.actions.ChangeWorldInteractionAction;
   import com.ankamagames.dofus.logic.common.frames.MiscFrame;
   import com.ankamagames.dofus.logic.common.managers.AccountManager;
   import com.ankamagames.dofus.logic.common.managers.HyperlinkDisplayArrowManager;
   import com.ankamagames.dofus.logic.common.managers.PlayerManager;
   import com.ankamagames.dofus.logic.connection.frames.AuthentificationFrame;
   import com.ankamagames.dofus.logic.connection.frames.InitializationFrame;
   import com.ankamagames.dofus.logic.connection.frames.ServerSelectionFrame;
   import com.ankamagames.dofus.logic.connection.managers.AuthentificationManager;
   import com.ankamagames.dofus.logic.connection.managers.GuestModeManager;
   import com.ankamagames.dofus.logic.game.approach.frames.GameServerApproachFrame;
   import com.ankamagames.dofus.logic.game.common.frames.CameraControlFrame;
   import com.ankamagames.dofus.logic.game.common.frames.ChatFrame;
   import com.ankamagames.dofus.logic.game.common.frames.ExternalGameFrame;
   import com.ankamagames.dofus.logic.game.common.managers.PlayedCharacterManager;
   import com.ankamagames.dofus.logic.game.common.managers.SteamManager;
   import com.ankamagames.dofus.logic.game.common.managers.TimeManager;
   import com.ankamagames.dofus.logic.game.fight.frames.FightContextFrame;
   import com.ankamagames.dofus.logic.game.fight.frames.FightPreparationFrame;
   import com.ankamagames.dofus.logic.game.roleplay.frames.EntitiesTooltipsFrame;
   import com.ankamagames.dofus.logic.game.roleplay.frames.RoleplayContextFrame;
   import com.ankamagames.dofus.logic.game.roleplay.frames.RoleplayEntitiesFrame;
   import com.ankamagames.dofus.logic.shield.SecureModeManager;
   import com.ankamagames.dofus.misc.interClient.InterClientManager;
   import com.ankamagames.dofus.misc.lists.ApiActionList;
   import com.ankamagames.dofus.misc.lists.ChatHookList;
   import com.ankamagames.dofus.misc.stats.StatisticsManager;
   import com.ankamagames.dofus.misc.utils.CharacterIdConverter;
   import com.ankamagames.dofus.misc.utils.DofusApiAction;
   import com.ankamagames.dofus.misc.utils.GameID;
   import com.ankamagames.dofus.misc.utils.HaapiKeyManager;
   import com.ankamagames.dofus.misc.utils.RpcServiceCenter;
   import com.ankamagames.dofus.misc.utils.StatisticReportingManager;
   import com.ankamagames.dofus.misc.utils.frames.LuaScriptRecorderFrame;
   import com.ankamagames.dofus.modules.utils.ModuleInstallerFrame;
   import com.ankamagames.dofus.network.enums.BuildTypeEnum;
   import com.ankamagames.dofus.network.enums.ChatActivableChannelsEnum;
   import com.ankamagames.dofus.network.enums.DareCriteriaTypeEnum;
   import com.ankamagames.dofus.network.messages.authorized.AdminQuietCommandMessage;
   import com.ankamagames.dofus.network.types.secure.TrustCertificate;
   import com.ankamagames.dofus.themes.utils.ThemeInstallerFrame;
   import com.ankamagames.dofus.types.data.ServerCommand;
   import com.ankamagames.dofus.types.enums.ScreenshotTypeEnum;
   import com.ankamagames.jerakine.console.ConsolesManager;
   import com.ankamagames.jerakine.data.I18n;
   import com.ankamagames.jerakine.data.XmlConfig;
   import com.ankamagames.jerakine.handlers.HumanInputHandler;
   import com.ankamagames.jerakine.handlers.messages.Action;
   import com.ankamagames.jerakine.interfaces.IDataCenter;
   import com.ankamagames.jerakine.interfaces.IModuleUtil;
   import com.ankamagames.jerakine.logger.Log;
   import com.ankamagames.jerakine.logger.Logger;
   import com.ankamagames.jerakine.logger.ModuleLogger;
   import com.ankamagames.jerakine.managers.FontManager;
   import com.ankamagames.jerakine.managers.LangManager;
   import com.ankamagames.jerakine.managers.OptionManager;
   import com.ankamagames.jerakine.managers.PerformanceManager;
   import com.ankamagames.jerakine.managers.StoreDataManager;
   import com.ankamagames.jerakine.messages.Worker;
   import com.ankamagames.jerakine.types.Callback;
   import com.ankamagames.jerakine.types.DataStoreType;
   import com.ankamagames.jerakine.types.DynamicSecureObject;
   import com.ankamagames.jerakine.types.Version;
   import com.ankamagames.jerakine.types.enums.DataStoreEnum;
   import com.ankamagames.jerakine.utils.crypto.AdvancedMd5;
   import com.ankamagames.jerakine.utils.display.EnterFrameDispatcher;
   import com.ankamagames.jerakine.utils.display.FrameIdManager;
   import com.ankamagames.jerakine.utils.display.StageShareManager;
   import com.ankamagames.jerakine.utils.misc.CallWithParameters;
   import com.ankamagames.jerakine.utils.misc.Chrono;
   import com.ankamagames.jerakine.utils.misc.DescribeTypeCache;
   import com.ankamagames.jerakine.utils.system.CommandLineArguments;
   import com.ankamagames.jerakine.utils.system.SystemManager;
   import com.ankamagames.tiphon.types.look.TiphonEntityLook;
   import flash.desktop.Clipboard;
   import flash.desktop.ClipboardFormats;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.filesystem.File;
   import flash.filesystem.FileMode;
   import flash.filesystem.FileStream;
   import flash.geom.Point;
   import flash.net.URLRequest;
   import flash.net.URLRequestMethod;
   import flash.net.URLVariables;
   import flash.net.navigateToURL;
   import flash.system.Capabilities;
   import flash.ui.Mouse;
   import flash.ui.MouseCursor;
   import flash.utils.ByteArray;
   import flash.utils.Dictionary;
   import flash.utils.getQualifiedClassName;
   import flash.utils.getTimer;
   
   [InstanciedApi]
   public class SystemApi implements IApi
   {
      
      public static var MEMORY_LOG:Dictionary = new Dictionary(true);
      
      private static var _actionCountRef:Dictionary = new Dictionary();
      
      private static var _actionTsRef:Dictionary = new Dictionary();
      
      private static var _wordInteractionEnable:Boolean = true;
      
      private static var _lastFrameId:uint;
       
      
      private var _module:UiModule;
      
      private var _currentUi:UiRootContainer;
      
      protected var _log:Logger;
      
      private var _characterDataStore:DataStoreType;
      
      private var _accountDataStore:DataStoreType;
      
      private var _moduleActionDataStore:DataStoreType;
      
      private var _computerDataStore:DataStoreType;
      
      private var _dofusCharacterApi:CharacterApi;
      
      private var _hooks:Dictionary;
      
      private var _listener:Dictionary;
      
      private var _listenerCount:uint;
      
      private var _running:Boolean;
      
      public function SystemApi()
      {
         this._log = Log.getLogger(getQualifiedClassName(SystemApi));
         this._hooks = new Dictionary();
         this._listener = new Dictionary();
         super();
         MEMORY_LOG[this] = 1;
      }
      
      public static function get wordInteractionEnable() : Boolean
      {
         return _wordInteractionEnable;
      }
      
      [ApiData(name="module")]
      public function set module(value:UiModule) : void
      {
         this._module = value;
      }
      
      [ApiData(name="currentUi")]
      public function set currentUi(value:UiRootContainer) : void
      {
         this._currentUi = value;
      }
      
      [Trusted]
      public function destroy() : void
      {
         var hookName:* = undefined;
         EnterFrameDispatcher.removeEventListener(this.onEnterFrame);
         this._listener = null;
         this._module = null;
         this._currentUi = null;
         this._characterDataStore = null;
         this._accountDataStore = null;
         this._computerDataStore = null;
         for(hookName in this._hooks)
         {
            this.removeHook(hookName);
         }
         this._hooks = new Dictionary();
      }
      
      [Untrusted]
      public function isInGame() : Boolean
      {
         var worker:Worker = Kernel.getWorker();
         var authentificationFramePresent:Boolean = worker.contains(AuthentificationFrame);
         var initializationFramePresent:Boolean = worker.contains(InitializationFrame);
         var gameServerApproachFramePresent:Boolean = worker.contains(GameServerApproachFrame);
         var serverSelectionFramePresent:Boolean = worker.contains(ServerSelectionFrame);
         return !(authentificationFramePresent || initializationFramePresent || gameServerApproachFramePresent || serverSelectionFramePresent);
      }
      
      [Trusted]
      public function isLoggingWithTicket() : Boolean
      {
         return AuthentificationManager.getInstance().isLoggingWithTicket;
      }
      
      [Untrusted]
      public function addHook(hookClass:Class, callback:Function) : void
      {
         var hookName:String = null;
         var classInfo:Array = getQualifiedClassName(hookClass).split("::");
         hookName = classInfo[classInfo.length - 1];
         var targetedHook:Hook = Hook.getHookByName(hookName);
         if(!targetedHook)
         {
            throw new BeriliaError("Hook [" + hookName + "] does not exists.");
         }
         if(targetedHook.trusted && !this._module.trusted)
         {
            throw new UntrustedApiCallError("Hook " + hookName + " cannot be listen from an untrusted module");
         }
         var listener:GenericListener = new GenericListener(hookName,!!this._currentUi?this._currentUi.name:"__module_" + this._module.id,callback,0,!!this._currentUi?uint(GenericListener.LISTENER_TYPE_UI):uint(GenericListener.LISTENER_TYPE_MODULE));
         this._hooks[hookClass] = listener;
         KernelEventsManager.getInstance().registerEvent(listener);
      }
      
      [Untrusted]
      public function removeHook(hookClass:Class) : void
      {
         if(hookClass)
         {
            KernelEventsManager.getInstance().removeEventListener(this._hooks[hookClass]);
            delete this._hooks[hookClass];
         }
      }
      
      [Untrusted]
      public function createHook(name:String) : void
      {
         new Hook(name,false,false);
      }
      
      [NoBoxing]
      [Untrusted]
      public function dispatchHook(hookClass:Class, ... params) : void
      {
         var hookName:String = null;
         var classInfo:Array = getQualifiedClassName(hookClass).split("::");
         hookName = classInfo[classInfo.length - 1];
         var targetedHook:Hook = Hook.getHookByName(hookName);
         if(!targetedHook)
         {
            throw new ApiError("Hook [" + hookName + "] does not exist");
         }
         if(targetedHook.nativeHook)
         {
            throw new UntrustedApiCallError("Hook " + hookName + " is a native hook. Native hooks cannot be dispatch by module");
         }
         CallWithParameters.call(KernelEventsManager.getInstance().processCallback,new Array(targetedHook).concat(params));
      }
      
      [Untrusted]
      public function sendAction(action:Object) : uint
      {
         var apiAction:DofusApiAction = null;
         var classInfo:Array = null;
         var t:uint = 0;
         var needConfirmStoreDataManager:Array = null;
         var commonMod:Object = null;
         if(action.hasOwnProperty("parameters"))
         {
            classInfo = getQualifiedClassName(action).split("::");
            apiAction = DofusApiAction.getApiActionByName(classInfo[classInfo.length - 1]);
            if(!apiAction)
            {
               throw new ApiError("Action [" + action + "] does not exist");
            }
            if(!this._module.trusted)
            {
               if(apiAction.trusted)
               {
                  throw new UntrustedApiCallError("Action " + action + " cannot be launch from an untrusted module");
               }
               if(apiAction.needInteraction && !(UIInteractionFrame(Kernel.getWorker().getFrame(UIInteractionFrame)).isProcessingDirectInteraction || ShortcutsFrame(Kernel.getWorker().getFrame(ShortcutsFrame)).isProcessingDirectInteraction))
               {
                  return 0;
               }
               if(apiAction.maxUsePerFrame)
               {
                  if(_lastFrameId != FrameIdManager.frameId)
                  {
                     _actionCountRef = new Dictionary();
                     _lastFrameId = FrameIdManager.frameId;
                  }
                  if(_actionCountRef[apiAction] != undefined)
                  {
                     if(_actionCountRef[apiAction] == 0)
                     {
                        return 0;
                     }
                     _actionCountRef[apiAction] = _actionCountRef[apiAction] - 1;
                  }
                  else
                  {
                     _actionCountRef[apiAction] = apiAction.maxUsePerFrame - 1;
                  }
               }
               if(apiAction.minimalUseInterval)
               {
                  t = getTimer() - _actionTsRef[apiAction];
                  if(_actionTsRef[apiAction] && t <= apiAction.minimalUseInterval)
                  {
                     return 0;
                  }
                  _actionTsRef[apiAction] = getTimer();
               }
            }
            var actionToSend:Action = CallWithParameters.callR(apiAction.actionClass["create"],action.parameters);
            if(!this._module.trusted && apiAction.needConfirmation)
            {
               if(!this._moduleActionDataStore)
               {
                  this.initModuleActionDataStore();
               }
               needConfirmStoreDataManager = StoreDataManager.getInstance().getSetData(this._moduleActionDataStore,"needConfirm",new Array());
               if(needConfirmStoreDataManager[apiAction.name] !== false)
               {
                  commonMod = UiModuleManager.getInstance().getModule("Ankama_Common").mainClass;
                  if(actionToSend is ApiActionList.DeleteObject.actionClass)
                  {
                     commonMod.openPopup(I18n.getUiText("ui.popup.warning"),I18n.getUiText("ui.module.action.confirm",[this._module.name]),[I18n.getUiText("ui.common.ok"),I18n.getUiText("ui.common.no")],[this.onActionConfirm(actionToSend,apiAction)],this.onActionConfirm(actionToSend,apiAction));
                  }
                  else
                  {
                     commonMod.openCheckboxPopup(I18n.getUiText("ui.popup.warning"),I18n.getUiText("ui.module.action.confirm",[this._module.name]),this.onActionConfirm(actionToSend,apiAction),null,I18n.getUiText("ui.common.rememberMyChoice"));
                  }
                  return 2;
               }
            }
            ModuleLogger.log(actionToSend);
            Kernel.getWorker().process(actionToSend);
            return 1;
         }
         throw new ApiError("Action [" + action + "] don\'t implement IAction");
      }
      
      private function onActionConfirm(actionToSend:Action, apiAction:DofusApiAction) : Function
      {
         return function(... args):void
         {
            var needConfirmStoreDataManager:* = undefined;
            if(args.length && args[0])
            {
               needConfirmStoreDataManager = StoreDataManager.getInstance().getSetData(_moduleActionDataStore,"needConfirm",new Array());
               needConfirmStoreDataManager[apiAction.name] = !args[0];
               StoreDataManager.getInstance().setData(_moduleActionDataStore,"needConfirm",needConfirmStoreDataManager);
            }
            ModuleLogger.log(actionToSend);
            Kernel.getWorker().process(actionToSend);
         };
      }
      
      [Untrusted]
      public function log(level:uint, text:*) : void
      {
         var ui:String = !!this._currentUi?this._currentUi.uiModule.name + "/" + this._currentUi.uiClass:"?";
         this._log.log(level,"[" + ui + "] " + text);
         if(this._module && !this._module.trusted || BuildInfos.BUILD_TYPE >= BuildTypeEnum.TESTING)
         {
            ModuleLogger.log("[" + ui + "] " + text,level);
         }
      }
      
      [Untrusted]
      public function getClientId() : uint
      {
         return InterClientManager.getInstance().clientId;
      }
      
      [Untrusted]
      public function getNumberOfClients() : uint
      {
         return InterClientManager.getInstance().numClients;
      }
      
      [Trusted]
      public function setConfigEntry(sKey:String, sValue:*) : void
      {
         XmlConfig.getInstance().setEntry(sKey,sValue);
      }
      
      [Untrusted]
      public function getConfigEntry(sKey:String) : *
      {
         return XmlConfig.getInstance().getEntry(sKey);
      }
      
      [Trusted]
      public function isEventMode() : Boolean
      {
         return Constants.EVENT_MODE;
      }
      
      [Trusted]
      public function isCharacterCreationAllowed() : Boolean
      {
         return Constants.CHARACTER_CREATION_ALLOWED;
      }
      
      [Trusted]
      public function getConfigKey(key:String) : *
      {
         return XmlConfig.getInstance().getEntry("config." + key);
      }
      
      [Trusted]
      public function goToUrl(url:String) : void
      {
         if(!url)
         {
            this._log.warn("Failed to navigate to URL, no valid URL was provided.");
            return;
         }
         if(url.indexOf("[!] ") == 0)
         {
            url = url.substr(4);
         }
         navigateToURL(new URLRequest(url));
      }
      
      [Trusted]
      public function getPlayerManager() : PlayerManager
      {
         return PlayerManager.getInstance();
      }
      
      [Trusted]
      public function getPort() : uint
      {
         var dst:DataStoreType = new DataStoreType("Dofus_ComputerOptions",true,DataStoreEnum.LOCATION_LOCAL,DataStoreEnum.BIND_ACCOUNT);
         return StoreDataManager.getInstance().getData(dst,"defaultConnectionPort");
      }
      
      [Trusted]
      public function setPort(port:uint) : Boolean
      {
         var dst:DataStoreType = new DataStoreType("Dofus_ComputerOptions",true,DataStoreEnum.LOCATION_LOCAL,DataStoreEnum.BIND_ACCOUNT);
         return StoreDataManager.getInstance().setData(dst,"defaultConnectionPort",port);
      }
      
      [Untrusted]
      public function setData(name:String, value:*, dataStore:int = 2) : Boolean
      {
         var dst:DataStoreType = null;
         if(dataStore == DataStoreEnum.BIND_ACCOUNT)
         {
            if(!this._accountDataStore)
            {
               this.initAccountDataStore();
            }
            dst = this._accountDataStore;
         }
         else if(dataStore == DataStoreEnum.BIND_COMPUTER)
         {
            if(!this._computerDataStore)
            {
               this.initComputerDataStore();
            }
            dst = this._computerDataStore;
         }
         else
         {
            if(!this._characterDataStore)
            {
               this.initCharacterDataStore();
            }
            dst = this._characterDataStore;
         }
         return StoreDataManager.getInstance().setData(dst,name,value);
      }
      
      [NoBoxing]
      [Untrusted]
      public function getData(name:String, dataStore:int = 2) : *
      {
         var dst:DataStoreType = null;
         if(dataStore == DataStoreEnum.BIND_ACCOUNT)
         {
            if(!this._accountDataStore)
            {
               this.initAccountDataStore();
            }
            dst = this._accountDataStore;
         }
         else if(dataStore == DataStoreEnum.BIND_COMPUTER)
         {
            if(!this._computerDataStore)
            {
               this.initComputerDataStore();
            }
            dst = this._computerDataStore;
         }
         else
         {
            if(!this._characterDataStore)
            {
               this.initCharacterDataStore();
            }
            dst = this._characterDataStore;
         }
         var value:* = StoreDataManager.getInstance().getData(dst,name);
         switch(true)
         {
            case value is IModuleUtil:
            case value is IDataCenter:
               return value;
            default:
               return value;
         }
      }
      
      [Untrusted]
      public function getSetData(name:String, value:*, dataStore:int = 2) : *
      {
         var dst:DataStoreType = null;
         if(dataStore == DataStoreEnum.BIND_ACCOUNT)
         {
            if(!this._accountDataStore)
            {
               this.initAccountDataStore();
            }
            dst = this._accountDataStore;
         }
         else if(dataStore == DataStoreEnum.BIND_COMPUTER)
         {
            if(!this._computerDataStore)
            {
               this.initComputerDataStore();
            }
            dst = this._computerDataStore;
         }
         else
         {
            if(!this._characterDataStore)
            {
               this.initCharacterDataStore();
            }
            dst = this._characterDataStore;
         }
         return StoreDataManager.getInstance().getSetData(dst,name,value);
      }
      
      [Untrusted]
      public function setQualityIsEnable() : Boolean
      {
         return StageShareManager.setQualityIsEnable;
      }
      
      [Untrusted]
      public function getAirVersion() : uint
      {
         return Capabilities.version.indexOf(" 10,0") != -1?uint(1):uint(2);
      }
      
      [Untrusted]
      public function isAirVersionAvailable(version:uint) : Boolean
      {
         return this.setQualityIsEnable();
      }
      
      [Untrusted]
      public function setAirVersion(version:uint) : Boolean
      {
         var fs:FileStream = null;
         var fs2:FileStream = null;
         if(!this.isAirVersionAvailable(version))
         {
            return false;
         }
         var file_air1:File = new File(File.applicationDirectory.nativePath + File.separator + "useOldAir");
         var file_air2:File = new File(File.applicationDirectory.nativePath + File.separator + "useNewAir");
         if(version == 1)
         {
            try
            {
               if(file_air2.exists)
               {
                  file_air2.deleteFile();
               }
               fs = new FileStream();
               fs.open(file_air1,FileMode.WRITE);
               fs.close();
            }
            catch(e:Error)
            {
               return false;
            }
         }
         else
         {
            try
            {
               if(file_air1.exists)
               {
                  file_air1.deleteFile();
               }
               fs2 = new FileStream();
               fs2.open(file_air2,FileMode.WRITE);
               fs2.close();
            }
            catch(e:Error)
            {
               return false;
            }
         }
         return true;
      }
      
      [Untrusted]
      public function getOs() : String
      {
         return SystemManager.getSingleton().os;
      }
      
      [Untrusted]
      public function getOsVersion() : String
      {
         return SystemManager.getSingleton().version;
      }
      
      [Untrusted]
      public function getCpu() : String
      {
         return SystemManager.getSingleton().cpu;
      }
      
      [Untrusted]
      public function getOption(name:String, moduleName:String) : *
      {
         if(moduleName == "dofus" && name == "displayTooltips")
         {
            return true;
         }
         return OptionManager.getOptionManager(moduleName)[name];
      }
      
      [Untrusted]
      public function callbackHook(hook:Hook, ... params) : void
      {
         KernelEventsManager.getInstance().processCallback(hook,params);
      }
      
      [Untrusted]
      public function showWorld(b:Boolean) : void
      {
         Atouin.getInstance().showWorld(b);
      }
      
      [Untrusted]
      public function worldIsVisible() : Boolean
      {
         return Atouin.getInstance().worldIsVisible;
      }
      
      [Untrusted]
      public function getServerStatus() : uint
      {
         var miscframe:MiscFrame = Kernel.getWorker().getFrame(MiscFrame) as MiscFrame;
         return miscframe.getServerStatus();
      }
      
      [Trusted]
      public function getConsoleAutoCompletion(cmd:String, server:Boolean) : String
      {
         if(server)
         {
            return ServerCommand.autoComplete(cmd);
         }
         return ConsolesManager.getConsole("debug").autoComplete(cmd);
      }
      
      [Trusted]
      public function getAutoCompletePossibilities(cmd:String, server:Boolean = false) : Array
      {
         if(server)
         {
            return ServerCommand.getAutoCompletePossibilities(cmd).sort();
         }
         return ConsolesManager.getConsole("debug").getAutoCompletePossibilities(cmd).sort();
      }
      
      [Trusted]
      public function getAutoCompletePossibilitiesOnParam(cmd:String, server:Boolean = false, paramIndex:uint = 0, currentParams:Array = null) : Array
      {
         return ConsolesManager.getConsole("debug").getAutoCompletePossibilitiesOnParam(cmd,paramIndex,currentParams).sort();
      }
      
      [Trusted]
      public function getCmdHelp(cmd:String, server:Boolean = false) : String
      {
         if(server)
         {
            return ServerCommand.getHelp(cmd);
         }
         return ConsolesManager.getConsole("debug").getCmdHelp(cmd);
      }
      
      [Untrusted]
      public function startChrono(label:String) : void
      {
         Chrono.start(label);
      }
      
      [Untrusted]
      public function stopChrono() : void
      {
         Chrono.stop();
      }
      
      [Trusted]
      public function hasAdminCommand(cmd:String) : Boolean
      {
         return ServerCommand.hasCommand(cmd);
      }
      
      private function onEnterFrame(e:Event) : void
      {
         var fct:Function = null;
         for each(fct in this._listener)
         {
            if(fct != null)
            {
               fct();
            }
         }
      }
      
      [Trusted]
      [NoBoxing]
      public function addEventListener(listener:Function, name:String, frameRate:uint = 25) : void
      {
         this._listenerCount++;
         this._listener[name] = listener;
         if(!this._running)
         {
            EnterFrameDispatcher.addEventListener(this.onEnterFrame,this._module.id + ".enterframe" + Math.random(),frameRate);
            this._running = true;
         }
      }
      
      [Trusted]
      [NoBoxing]
      public function removeEventListener(listener:Function) : void
      {
         var name:* = null;
         var toDelete:Array = [];
         for(name in this._listener)
         {
            if(listener == this._listener[name])
            {
               this._listenerCount--;
               toDelete.push(name);
            }
         }
         for each(name in toDelete)
         {
            delete this._listener[name];
         }
         if(!this._listenerCount)
         {
            this._running = false;
            EnterFrameDispatcher.removeEventListener(this.onEnterFrame);
         }
      }
      
      [Trusted]
      public function disableWorldInteraction(pTotal:Boolean = true) : void
      {
         _wordInteractionEnable = false;
         TooltipManager.hideAll();
         Kernel.getWorker().process(ChangeWorldInteractionAction.create(false,pTotal));
      }
      
      [Trusted]
      public function enableWorldInteraction() : void
      {
         _wordInteractionEnable = true;
         Kernel.getWorker().process(ChangeWorldInteractionAction.create(true));
      }
      
      [Trusted]
      public function setFrameRate(f:uint) : void
      {
         StageShareManager.stage.frameRate = f;
      }
      
      [Trusted]
      public function hasWorldInteraction() : Boolean
      {
         var contextFrame:RoleplayContextFrame = Kernel.getWorker().getFrame(RoleplayContextFrame) as RoleplayContextFrame;
         if(!contextFrame)
         {
            return false;
         }
         return contextFrame.hasWorldInteraction;
      }
      
      [Trusted]
      public function hasRight() : Boolean
      {
         return PlayerManager.getInstance().hasRights;
      }
      
      [Untrusted]
      public function isFightContext() : Boolean
      {
         return Kernel.getWorker().contains(FightContextFrame) || Kernel.getWorker().isBeingAdded(FightContextFrame);
      }
      
      [Untrusted]
      public function getEntityLookFromString(s:String) : TiphonEntityLook
      {
         return TiphonEntityLook.fromString(s);
      }
      
      [Untrusted]
      public function getCurrentVersion() : Version
      {
         return BuildInfos.VERSION;
      }
      
      [Untrusted]
      public function getBuildType() : uint
      {
         return BuildInfos.BUILD_TYPE;
      }
      
      [Untrusted]
      public function getCurrentLanguage() : String
      {
         return XmlConfig.getInstance().getEntry("config.lang.current");
      }
      
      [Trusted]
      public function clearCache(pSelective:Boolean = false) : void
      {
         Dofus.getInstance().clearCache(pSelective,true);
      }
      
      [Trusted]
      public function reset() : void
      {
         Dofus.getInstance().reboot();
      }
      
      [Untrusted]
      public function getCurrentServer() : Server
      {
         return PlayerManager.getInstance().server;
      }
      
      [Trusted]
      public function getGroundCacheSize() : Number
      {
         return DataGroundMapManager.getCurrentDiskUsed();
      }
      
      [Trusted]
      public function clearGroundCache() : void
      {
         DataGroundMapManager.clearGroundCache();
      }
      
      [Trusted]
      public function zoom(value:Number) : void
      {
         var cameraFrame:CameraControlFrame = Kernel.getWorker().getFrame(CameraControlFrame) as CameraControlFrame;
         if(cameraFrame.dragging)
         {
            return;
         }
         this.luaZoom(value);
         Atouin.getInstance().zoom(value);
      }
      
      [Trusted]
      public function getCurrentZoom() : Number
      {
         return Atouin.getInstance().currentZoom;
      }
      
      [Trusted]
      public function goToThirdPartyLogin(target:WebBrowser) : void
      {
         var ur:URLRequest = null;
         if(BuildInfos.BUILD_TYPE == BuildTypeEnum.DEBUG)
         {
            ur = new URLRequest("http://127.0.0.1/login.php");
         }
         else
         {
            ur = new URLRequest(I18n.getUiText("ui.link.thirdparty.login"));
         }
         ComponentInternalAccessor.access(target,"load")(ur);
      }
      
      [Trusted]
      public function goToOgrinePortal(target:WebBrowser) : void
      {
         HaapiKeyManager.getInstance().callWithApiKey(function(apiKey:String):void
         {
            var ur:URLRequest = null;
            if(BuildInfos.BUILD_TYPE == BuildTypeEnum.RELEASE || BuildInfos.BUILD_TYPE == BuildTypeEnum.BETA)
            {
               ur = new URLRequest(I18n.getUiText("ui.link.ogrinePortal"));
            }
            else if(BuildInfos.BUILD_TYPE == BuildTypeEnum.DEBUG || BuildInfos.BUILD_TYPE == BuildTypeEnum.INTERNAL)
            {
               ur = new URLRequest(I18n.getUiText("ui.link.ogrinePortalTest"));
            }
            else
            {
               ur = new URLRequest(I18n.getUiText("ui.link.ogrinePortalLocal"));
            }
            ur.data = getAnkamaPortalUrlParams(apiKey);
            ur.method = URLRequestMethod.POST;
            ComponentInternalAccessor.access(target,"load")(ur);
         });
      }
      
      [Trusted]
      public function goToWebAuthentification(target:WebBrowser, serviceName:String) : String
      {
         var ur:URLRequest = null;
         if(BuildInfos.BUILD_TYPE == BuildTypeEnum.RELEASE || BuildInfos.BUILD_TYPE == BuildTypeEnum.BETA)
         {
            ur = new URLRequest(I18n.getUiText("ui.link.ankamaOauth",[serviceName]));
         }
         else if(BuildInfos.BUILD_TYPE == BuildTypeEnum.DEBUG || BuildInfos.BUILD_TYPE == BuildTypeEnum.INTERNAL)
         {
            ur = new URLRequest(I18n.getUiText("ui.link.ankamaOauthTest",[serviceName]));
         }
         else
         {
            ur = new URLRequest(I18n.getUiText("ui.link.ankamaOauthLocal",[serviceName]));
         }
         ComponentInternalAccessor.access(target,"load")(ur);
         return ur.url;
      }
      
      [Trusted]
      public function goToAnkaBoxPortal(target:WebBrowser) : void
      {
         HaapiKeyManager.getInstance().callWithApiKey(function(apiKey:String):void
         {
            var ur:URLRequest = null;
            if(BuildInfos.BUILD_TYPE == BuildTypeEnum.RELEASE || BuildInfos.BUILD_TYPE == BuildTypeEnum.BETA)
            {
               ur = new URLRequest(I18n.getUiText("ui.link.ankaboxPortal"));
            }
            else
            {
               ur = new URLRequest(I18n.getUiText("ui.link.ankaboxPortalLocal"));
            }
            ur.data = getAnkamaPortalUrlParams(apiKey);
            ur.data.idbar = 0;
            ur.data.game = GameID.current;
            ur.method = URLRequestMethod.POST;
            if(target)
            {
               ComponentInternalAccessor.access(target,"load")(ur);
            }
            else
            {
               navigateToURL(ur);
            }
         });
      }
      
      [Trusted]
      public function goToAnkaBoxLastMessage(target:WebBrowser) : void
      {
         HaapiKeyManager.getInstance().callWithApiKey(function(apiKey:String):void
         {
            var ur:URLRequest = null;
            if(BuildInfos.BUILD_TYPE == BuildTypeEnum.RELEASE || BuildInfos.BUILD_TYPE == BuildTypeEnum.BETA)
            {
               ur = new URLRequest(I18n.getUiText("ui.link.ankaboxLastMessage"));
            }
            else
            {
               ur = new URLRequest(I18n.getUiText("ui.link.ankaboxLastMessageLocal"));
            }
            ur.data = getAnkamaPortalUrlParams(apiKey);
            ur.data.idbar = 0;
            ur.data.game = GameID.current;
            ur.method = URLRequestMethod.POST;
            if(target)
            {
               ComponentInternalAccessor.access(target,"load")(ur);
            }
            else
            {
               navigateToURL(ur);
            }
         });
      }
      
      [Trusted]
      public function goToAnkaBoxSend(target:WebBrowser, userId:Number) : void
      {
         HaapiKeyManager.getInstance().callWithApiKey(function(apiKey:String):void
         {
            var ur:URLRequest = null;
            if(BuildInfos.BUILD_TYPE == BuildTypeEnum.RELEASE || BuildInfos.BUILD_TYPE == BuildTypeEnum.BETA)
            {
               ur = new URLRequest(I18n.getUiText("ui.link.ankaboxSend"));
            }
            else
            {
               ur = new URLRequest(I18n.getUiText("ui.link.ankaboxSendLocal"));
            }
            ur.data = getAnkamaPortalUrlParams(apiKey);
            ur.data.i = String(userId);
            ur.data.idbar = 0;
            ur.data.game = GameID.current;
            ur.method = URLRequestMethod.POST;
            if(target)
            {
               ComponentInternalAccessor.access(target,"load")(ur);
            }
            else
            {
               navigateToURL(ur);
            }
         });
      }
      
      [Trusted]
      public function goToSupportFAQ(faqURL:String) : void
      {
         var ur:URLRequest = new URLRequest(faqURL);
         navigateToURL(ur);
      }
      
      [Trusted]
      public function goToChangelogPortal(target:WebBrowser) : void
      {
      }
      
      [Trusted]
      public function goToCheckLink(url:String, sender:Number, senderName:String) : void
      {
         var checkLink:* = null;
         if(BuildInfos.BUILD_TYPE == BuildTypeEnum.RELEASE || BuildInfos.BUILD_TYPE == BuildTypeEnum.BETA || BuildInfos.BUILD_TYPE == BuildTypeEnum.TESTING)
         {
            checkLink = I18n.getUiText("ui.link.checklink");
         }
         else
         {
            checkLink = "http://go.ankama.lan/" + this.getCurrentLanguage() + "/check";
         }
         if(url.indexOf("http://") == -1 && url.indexOf("https://") == -1)
         {
            url = "http://" + url;
         }
         var click_id:uint = PlayerManager.getInstance().accountId;
         var click_name:String = PlayedCharacterManager.getInstance().infos.name;
         var sender_id:Number = sender;
         var sender_name:String = senderName;
         var game:int = GameID.current;
         var server:int = PlayerManager.getInstance().server.id;
         this._log.debug("goToCheckLink : " + url + " " + click_id + " " + sender_id + " " + game + " " + server);
         var chaine:String = url + click_id + "" + sender_id + "" + click_name + senderName + game.toString() + server.toString();
         var keyMd5:String = AdvancedMd5.hex_hmac_md5(">:fIZ?vfU0sDM_9j",chaine);
         var jsonTab:* = "{\"url\":\"" + url + "\",\"click_account\":" + click_id + ",\"from_account\":" + sender_id + ",\"click_name\":\"" + click_name + "\",\"from_name\":\"" + sender_name + "\",\"game\":" + game + ",\"server\":" + server + ",\"hmac\":\"" + keyMd5 + "\"}";
         var bytearray:ByteArray = new ByteArray();
         bytearray.writeUTFBytes(jsonTab);
         bytearray.position = 0;
         var buffer:String = "";
         bytearray.position = 0;
         while(bytearray.bytesAvailable)
         {
            buffer = buffer + bytearray.readUnsignedByte().toString(16);
         }
         buffer = buffer.toUpperCase();
         checkLink = checkLink + ("?s=" + buffer);
         var ur:URLRequest = new URLRequest(checkLink);
         var params:URLVariables = new URLVariables();
         params.s = buffer;
         ur.method = URLRequestMethod.POST;
         navigateToURL(ur);
      }
      
      [Trusted]
      public function goToDare(data:DareWrapper) : void
      {
         var url:String = null;
         var c:DareCriteriaWrapper = null;
         var keyMd5:String = null;
         var bytearray:ByteArray = null;
         var buffer:String = null;
         var param:int = 0;
         if(BuildInfos.BUILD_TYPE == BuildTypeEnum.RELEASE || BuildInfos.BUILD_TYPE == BuildTypeEnum.BETA || BuildInfos.BUILD_TYPE == BuildTypeEnum.TESTING)
         {
            url = I18n.getUiText("ui.link.darelink") + data.dareId;
         }
         else
         {
            url = "http://www.dofus.tst/" + this.getCurrentLanguage() + "/mmorpg/communaute/defis/" + data.dareId;
         }
         if(url.indexOf("www") == 0)
         {
            url = "http://" + url;
         }
         var serverId:int = PlayerManager.getInstance().server.id;
         this._log.debug("goToDare : " + url + " " + serverId);
         var keyString:String = url + data.dareId + "" + serverId + "" + CharacterIdConverter.extractServerCharacterIdFromInterserverCharacterId(data.creatorId) + "" + data.subscriptionFee + "" + data.jackpot + "" + data.maxCountWinners + "" + data.endDate + "" + data.startDate + "" + data.isPrivate;
         var jsonTab:* = "{\"url\":\"" + url + "\",\"id\":" + data.dareId + ",\"srv\":" + serverId + ",\"oid\":" + CharacterIdConverter.extractServerCharacterIdFromInterserverCharacterId(data.creatorId) + ",\"sf\":" + data.subscriptionFee + ",\"jp\":" + data.jackpot + ",\"mwc\":" + data.maxCountWinners + ",\"d\":" + data.endDate + ",\"sd\":" + data.startDate + ",\"p\":" + data.isPrivate;
         if(data.allianceId > 0)
         {
            jsonTab = jsonTab + (",\"aid\":" + data.allianceId);
            keyString = keyString + (data.allianceId + "");
         }
         else if(data.guildId > 0)
         {
            jsonTab = jsonTab + (",\"gid\":" + data.guildId);
            keyString = keyString + (data.guildId + "");
         }
         for each(c in data.criteria)
         {
            if(c.type == DareCriteriaTypeEnum.MONSTER_ID)
            {
               jsonTab = jsonTab + (",\"cm\":" + c.params[0]);
               keyString = keyString + (c.params[0] + "");
            }
            else if(c.type == DareCriteriaTypeEnum.CHALLENGE_ID)
            {
               jsonTab = jsonTab + (",\"cc\":" + c.params[0]);
               keyString = keyString + (c.params[0] + "");
            }
            else if(c.type == DareCriteriaTypeEnum.IDOLS_SCORE)
            {
               jsonTab = jsonTab + (",\"cis\":" + c.params[0]);
               keyString = keyString + (c.params[0] + "");
            }
            else if(c.type == DareCriteriaTypeEnum.MAX_CHAR_LVL)
            {
               jsonTab = jsonTab + (",\"ccl\":" + c.params[0]);
               keyString = keyString + (c.params[0] + "");
            }
            else if(c.type == DareCriteriaTypeEnum.MAX_FIGHT_TURNS)
            {
               jsonTab = jsonTab + (",\"ct\":" + c.params[0]);
               keyString = keyString + (c.params[0] + "");
            }
            else if(c.type == DareCriteriaTypeEnum.MAX_COUNT_CHAR)
            {
               jsonTab = jsonTab + (",\"ccx\":" + c.params[0]);
               keyString = keyString + (c.params[0] + "");
            }
            else if(c.type == DareCriteriaTypeEnum.MIN_COUNT_CHAR)
            {
               jsonTab = jsonTab + (",\"ccn\":" + c.params[0]);
               keyString = keyString + (c.params[0] + "");
            }
            else if(c.type == DareCriteriaTypeEnum.MIN_COUNT_MONSTERS)
            {
               jsonTab = jsonTab + (",\"cmc\":" + c.params[0]);
               keyString = keyString + (c.params[0] + "");
            }
            else if(c.type == DareCriteriaTypeEnum.IDOLS)
            {
               jsonTab = jsonTab + ",\"ci\":";
            }
            else if(c.type == DareCriteriaTypeEnum.FORBIDDEN_BREEDS)
            {
               jsonTab = jsonTab + ",\"cbf\":";
            }
            else if(c.type == DareCriteriaTypeEnum.MANDATORY_BREEDS)
            {
               jsonTab = jsonTab + ",\"cbr\":";
            }
            if(c.type == DareCriteriaTypeEnum.IDOLS || c.type == DareCriteriaTypeEnum.FORBIDDEN_BREEDS || c.type == DareCriteriaTypeEnum.MANDATORY_BREEDS)
            {
               jsonTab = jsonTab + "[";
               for each(param in c.params)
               {
                  if(param > 0)
                  {
                     jsonTab = jsonTab + (param + ",");
                     keyString = keyString + (param + "");
                  }
               }
               jsonTab = jsonTab.slice(0,jsonTab.length - 1);
               jsonTab = jsonTab + "]";
            }
         }
         this._log.debug("keyString : " + keyString);
         keyMd5 = AdvancedMd5.hex_hmac_md5(">:fIZ?vfU0sDM_9j",keyString);
         jsonTab = jsonTab + (",\"hmac\":\"" + keyMd5 + "\"}");
         this._log.debug("json : " + jsonTab);
         bytearray = new ByteArray();
         bytearray.writeUTFBytes(jsonTab);
         bytearray.position = 0;
         buffer = "";
         bytearray.position = 0;
         while(bytearray.bytesAvailable)
         {
            buffer = buffer + bytearray.readUnsignedByte().toString(16);
         }
         buffer = buffer.toUpperCase();
         url = url + ("?s=" + buffer);
         var ur:URLRequest = new URLRequest(url);
         var params:URLVariables = new URLVariables();
         params.s = buffer;
         ur.method = URLRequestMethod.POST;
         navigateToURL(ur);
      }
      
      [Trusted]
      public function setFlashCommicReaderApp(target:SwfApplication) : void
      {
         target.setByte(new Constants.BOOK_READER_APP() as ByteArray,SecureCenter.ACCESS_KEY);
      }
      
      [Trusted]
      public function goToWebReader(target:WebBrowser, comicRef:String) : void
      {
         var egf:ExternalGameFrame = Kernel.getWorker().getFrame(ExternalGameFrame) as ExternalGameFrame;
         if(egf)
         {
            egf.getIceToken(function(iceToken:String):void
            {
               var ur:URLRequest = null;
               if(BuildInfos.BUILD_TYPE == BuildTypeEnum.RELEASE || BuildInfos.BUILD_TYPE == BuildTypeEnum.BETA)
               {
                  ur = new URLRequest(I18n.getUiText("ui.link.webReader"));
               }
               else
               {
                  ur = new URLRequest(I18n.getUiText("ui.link.webReaderLocal"));
               }
               var urlVars:URLVariables = new URLVariables();
               urlVars.token = iceToken;
               urlVars.key = comicRef;
               urlVars.lang = XmlConfig.getInstance().getEntry("config.lang.current");
               ur.data = urlVars;
               ur.method = URLRequestMethod.GET;
               if(target)
               {
                  ComponentInternalAccessor.access(target,"load")(ur);
               }
               else
               {
                  navigateToURL(ur);
               }
            });
         }
      }
      
      [Trusted]
      public function refreshUrl(target:WebBrowser, domain:uint = 0) : void
      {
         HaapiKeyManager.getInstance().callWithApiKey(function(apiKey:String):void
         {
            var params:URLVariables = null;
            var ur:URLRequest = new URLRequest(target.location);
            if(domain == 0)
            {
               ur.data = getAnkamaPortalUrlParams(apiKey);
               ur.method = URLRequestMethod.POST;
            }
            else if(domain == 1)
            {
               params = new URLVariables();
               params.tags = BuildInfos.VERSION.major + "." + BuildInfos.VERSION.minor + "." + BuildInfos.VERSION.release;
               params.theme = OptionManager.getOptionManager("dofus").currentUiSkin;
               ur.data = params;
               ur.method = URLRequestMethod.GET;
            }
            ComponentInternalAccessor.access(target,"load")(ur);
         });
      }
      
      [Trusted]
      public function execServerCmd(cmd:String) : void
      {
         var aqcmsg:AdminQuietCommandMessage = new AdminQuietCommandMessage();
         aqcmsg.initAdminQuietCommandMessage(cmd);
         if(PlayerManager.getInstance().hasRights)
         {
            ConnectionsHandler.getConnection().send(aqcmsg);
         }
      }
      
      [Trusted]
      public function mouseZoom(zoomIn:Boolean = true) : void
      {
         var arrowPos:Point = null;
         var newPos:Point = null;
         var cameraFrame:CameraControlFrame = Kernel.getWorker().getFrame(CameraControlFrame) as CameraControlFrame;
         if(cameraFrame.dragging)
         {
            return;
         }
         var zoomLevel:Number = Atouin.getInstance().currentZoom + (!!zoomIn?1:-1);
         this.luaZoom(zoomLevel);
         Atouin.getInstance().zoom(zoomLevel,Atouin.getInstance().worldContainer.mouseX,Atouin.getInstance().worldContainer.mouseY);
         var rpEntitesFrame:RoleplayEntitiesFrame = Kernel.getWorker().getFrame(RoleplayEntitiesFrame) as RoleplayEntitiesFrame;
         if(rpEntitesFrame)
         {
            rpEntitesFrame.updateAllIcons();
         }
         var entitiesTooltipsFrame:EntitiesTooltipsFrame = Kernel.getWorker().getFrame(EntitiesTooltipsFrame) as EntitiesTooltipsFrame;
         if(entitiesTooltipsFrame)
         {
            entitiesTooltipsFrame.update(true);
         }
         if(zoomLevel <= AtouinConstants.MAX_ZOOM && zoomLevel >= 1)
         {
            TooltipManager.hideAll();
         }
         var fightPreparationFrame:FightPreparationFrame = Kernel.getWorker().getFrame(FightPreparationFrame) as FightPreparationFrame;
         if(fightPreparationFrame)
         {
            fightPreparationFrame.updateSwapPositionRequestsIcons();
         }
         var arrow:MovieClip = HyperlinkDisplayArrowManager.getArrowClip();
         if(arrow && HyperlinkDisplayArrowManager.getArrowStrata() != 5)
         {
            arrowPos = new Point(HyperlinkDisplayArrowManager.getArrowStartX(),HyperlinkDisplayArrowManager.getArrowStartY());
            newPos = Atouin.getInstance().rootContainer.localToGlobal(arrowPos);
            arrow.x = newPos.x;
            arrow.y = newPos.y;
         }
      }
      
      [Trusted]
      public function resetZoom() : void
      {
         Atouin.getInstance().zoom(1);
         var rpEntitesFrame:RoleplayEntitiesFrame = Kernel.getWorker().getFrame(RoleplayEntitiesFrame) as RoleplayEntitiesFrame;
         if(rpEntitesFrame)
         {
            rpEntitesFrame.updateAllIcons();
         }
         var fightPreparationFrame:FightPreparationFrame = Kernel.getWorker().getFrame(FightPreparationFrame) as FightPreparationFrame;
         if(fightPreparationFrame)
         {
            fightPreparationFrame.updateSwapPositionRequestsIcons();
         }
      }
      
      [Trusted]
      public function getMaxZoom() : uint
      {
         return AtouinConstants.MAX_ZOOM;
      }
      
      [Trusted]
      public function optimize() : Boolean
      {
         return PerformanceManager.optimize;
      }
      
      [Untrusted]
      public function isDevMode() : Boolean
      {
         return UiModuleManager.getInstance().isDevMode;
      }
      
      [Untrusted]
      public function notifyUser(always:Boolean) : void
      {
         return SystemManager.getSingleton().notifyUser(always);
      }
      
      [Untrusted]
      public function setGameAlign(align:String) : void
      {
         StageShareManager.stage.align = align;
      }
      
      [Untrusted]
      public function getGameAlign() : String
      {
         return StageShareManager.stage.align;
      }
      
      [Untrusted]
      public function getDirectoryContent(path:String = ".") : Array
      {
         var len:uint = 0;
         var result:Array = null;
         var folderContent:Array = null;
         var file:File = null;
         do
         {
            len = path.length;
            path = path.replace("..",".");
         }
         while(path.length != len);
         
         path = path.replace(":","");
         var folder:File = new File(unescape(this._module.rootPath.replace("file://",""))).resolvePath(path);
         if(folder.isDirectory)
         {
            result = [];
            folderContent = folder.getDirectoryListing();
            for each(file in folderContent)
            {
               result.push({
                  "name":file.name,
                  "type":(!!file.isDirectory?"folder":"file")
               });
            }
            return result;
         }
         return [];
      }
      
      [Untrusted]
      public function isSteamEmbed() : Boolean
      {
         return SteamManager.hasSteamApi() && SteamManager.getInstance().isSteamEmbed();
      }
      
      [Untrusted]
      public function isUsingZaap() : Boolean
      {
         return UpdaterApi.isUsingZaap();
      }
      
      [Untrusted]
      public function isUsingZaapLogin() : Boolean
      {
         return UpdaterApi.isUsingZaapLogin();
      }
      
      [Untrusted]
      public function setMouseCursor(cursor:String) : void
      {
         switch(cursor)
         {
            case MouseCursor.ARROW:
            case MouseCursor.AUTO:
            case MouseCursor.BUTTON:
            case MouseCursor.HAND:
            case MouseCursor.IBEAM:
               if(Mouse.supportsCursor)
               {
                  Mouse.cursor = cursor;
                  break;
               }
         }
      }
      
      [Trusted]
      public function getAccountId(playerName:String) : int
      {
         try
         {
            return AccountManager.getInstance().getAccountId(playerName);
         }
         catch(error:Error)
         {
         }
         return 0;
      }
      
      [Untrusted]
      public function getIsAnkaBoxEnabled() : Boolean
      {
         var chat:ChatFrame = Kernel.getWorker().getFrame(ChatFrame) as ChatFrame;
         if(GuestModeManager.getInstance().isLoggingAsGuest)
         {
            return false;
         }
         if(chat)
         {
            return chat.ankaboxEnabled;
         }
         return false;
      }
      
      [Trusted]
      public function getAdminStatus() : int
      {
         return PlayerManager.getInstance().adminStatus;
      }
      
      [Untrusted]
      public function getObjectVariables(o:Object, onlyVar:Boolean = false, useCache:Boolean = false) : Vector.<String>
      {
         return DescribeTypeCache.getVariables(o,onlyVar,useCache);
      }
      
      [Untrusted]
      public function getNewDynamicSecureObject() : DynamicSecureObject
      {
         return new DynamicSecureObject();
      }
      
      [Trusted]
      public function sendStatisticReport(key:String, value:String) : Boolean
      {
         return StatisticReportingManager.getInstance().report(key,value);
      }
      
      [Trusted]
      public function isStatisticReported(key:String) : Boolean
      {
         return StatisticReportingManager.getInstance().isReported(key);
      }
      
      [Trusted]
      public function getNickname() : String
      {
         return PlayerManager.getInstance().nickname;
      }
      
      [Trusted]
      public function copyToClipboard(val:String) : void
      {
         Clipboard.generalClipboard.clear();
         Clipboard.generalClipboard.setData(ClipboardFormats.TEXT_FORMAT,val);
      }
      
      [Trusted]
      public function getLaunchArgs() : String
      {
         return CommandLineArguments.getInstance().toString();
      }
      
      [Trusted]
      public function getPartnerInfo() : String
      {
         var fs:FileStream = null;
         var content:String = null;
         var f:File = File.applicationDirectory.resolvePath("partner");
         if(f.exists)
         {
            fs = new FileStream();
            fs.open(f,FileMode.READ);
            content = fs.readUTFBytes(fs.bytesAvailable);
            fs.close();
            return content;
         }
         return "";
      }
      
      [Trusted]
      public function toggleModuleInstaller() : void
      {
         var mif:ModuleInstallerFrame = Kernel.getWorker().getFrame(ModuleInstallerFrame) as ModuleInstallerFrame;
         if(mif)
         {
            Kernel.getWorker().removeFrame(mif);
         }
         else
         {
            Kernel.getWorker().addFrame(new ModuleInstallerFrame());
         }
      }
      
      [Trusted]
      public function toggleThemeInstaller() : void
      {
         var tif:ThemeInstallerFrame = Kernel.getWorker().getFrame(ThemeInstallerFrame) as ThemeInstallerFrame;
         if(tif)
         {
            Kernel.getWorker().removeFrame(tif);
         }
         else
         {
            Kernel.getWorker().addFrame(new ThemeInstallerFrame());
         }
      }
      
      [Trusted]
      public function isUpdaterVersion2OrUnknown() : Boolean
      {
         if(!CommandLineArguments.getInstance() || !CommandLineArguments.getInstance().hasArgument("lang"))
         {
            this._log.debug("Updater version : pas d\'updater");
            return true;
         }
         if(!CommandLineArguments.getInstance().hasArgument("updater_version"))
         {
            this._log.debug("Updater version : pas de version connue");
            return false;
         }
         this._log.debug("Updater version : " + CommandLineArguments.getInstance().getArgument("updater_version"));
         return CommandLineArguments.getInstance().getArgument("updater_version") == "v2";
      }
      
      [Untrusted]
      public function isKeyDown(keyCode:uint) : Boolean
      {
         return HumanInputHandler.getInstance().getKeyboardPoll().isDown(keyCode);
      }
      
      [Trusted]
      public function isGuest() : Boolean
      {
         return GuestModeManager.getInstance().isLoggingAsGuest;
      }
      
      [Trusted]
      public function isInForcedGuestMode() : Boolean
      {
         return GuestModeManager.getInstance().forceGuestMode;
      }
      
      [Trusted]
      public function convertGuestAccount() : void
      {
         GuestModeManager.getInstance().convertGuestAccount();
      }
      
      [Trusted]
      public function getGiftList() : Array
      {
         var gsapf:GameServerApproachFrame = Kernel.getWorker().getFrame(GameServerApproachFrame) as GameServerApproachFrame;
         return gsapf.giftList;
      }
      
      [Trusted]
      public function getCharaListMinusDeadPeople() : Array
      {
         var gsapf:GameServerApproachFrame = Kernel.getWorker().getFrame(GameServerApproachFrame) as GameServerApproachFrame;
         return gsapf.charaListMinusDeadPeople;
      }
      
      [Trusted]
      public function removeFocus() : void
      {
         StageShareManager.stage.focus = null;
      }
      
      [Trusted]
      public function toggleBordersMinimap() : void
      {
         var mm:UiModule = UiModuleManager.getInstance().getModule("Ankama_Cartography");
         if(Berilia.getInstance().getUi("minimapBorders") == null)
         {
            Berilia.getInstance().loadUi(mm,mm.getUi("cartographyBorders"),"minimapBorders",{},false,StrataEnum.STRATA_TOP);
            Berilia.getInstance().getUi("minimapBorders").visible = false;
         }
         else
         {
            Berilia.getInstance().unloadUi("minimapBorders",true);
         }
      }
      
      [Trusted]
      public function getUrltoShareContent(content:Object, callback:Function, shareType:String = null) : void
      {
         if(!content || !content.hasOwnProperty("title") || !content.hasOwnProperty("description") || !content.hasOwnProperty("image"))
         {
            throw new ArgumentError("Content argument is null or missing required properties.");
         }
         if(!shareType)
         {
            var shareType:String = ScreenshotTypeEnum.DEFAULT;
         }
         HaapiKeyManager.getInstance().callWithApiKey(function(apiKey:String):void
         {
            var completeFct:Function = null;
            var errorFct:Function = null;
            var client:ApiClient = null;
            var domainExtension:String = null;
            if(!_dofusCharacterApi)
            {
               completeFct = function(e:ApiClientEvent):void
               {
                  onShareUrlReady(e,callback,completeFct,errorFct);
               };
               errorFct = function(e:ApiClientEvent):void
               {
                  onShareUrlError(e,callback,completeFct,errorFct);
               };
               client = new ApiClient();
               domainExtension = RpcServiceCenter.getInstance().apiDomainExtension;
               client.setBasePath("https://haapi.ankama." + domainExtension + "/json/Dofus/v1");
               _dofusCharacterApi = new CharacterApi(client);
               _dofusCharacterApi.getApiClient().setApiKey(apiKey);
               _dofusCharacterApi.getApiClient().addEventListener(ApiClientEvent.API_CALL_RESULT,completeFct);
               _dofusCharacterApi.getApiClient().addEventListener(ApiClientEvent.API_CALL_ERROR,errorFct);
            }
            _dofusCharacterApi.addScreenshotApiCall(content.image,content.title,LangManager.getInstance().getEntry("config.lang.current"),CharacterIdConverter.extractServerCharacterIdFromInterserverCharacterId(PlayedCharacterManager.getInstance().id),PlayerManager.getInstance().server.id,PlayedCharacterManager.getInstance().currentMap.mapId,content.description,shareType);
         });
      }
      
      [Untrusted]
      public function changeActiveFontType(newName:String) : void
      {
         FontManager.getInstance().activeType = newName;
      }
      
      [Untrusted]
      public function getActiveFontType() : String
      {
         return FontManager.getInstance().activeType;
      }
      
      [Untrusted]
      public function useCustomUISkin() : Boolean
      {
         return OptionManager.getOptionManager("dofus").currentUiSkin != ThemeManager.OFFICIAL_THEME_NAME;
      }
      
      [Untrusted]
      public function resetCustomUISkin() : void
      {
         OptionManager.getOptionManager("dofus").currentUiSkin = ThemeManager.OFFICIAL_THEME_NAME;
         Dofus.getInstance().clearCache(true,true);
      }
      
      [Untrusted]
      public function startStats(pStatsName:String, ... args) : void
      {
         if(StatisticsManager.getInstance().statsEnabled)
         {
            StatisticsManager.getInstance().startStats.apply(StatisticsManager.getInstance(),[pStatsName].concat(args));
         }
      }
      
      [Untrusted]
      public function removeStats(pStatsName:String) : void
      {
         if(StatisticsManager.getInstance().statsEnabled)
         {
            StatisticsManager.getInstance().removeStats(pStatsName);
         }
      }
      
      [Untrusted]
      public function createCallback(fMethod:Function, ... args) : Callback
      {
         return new Callback(fMethod,args);
      }
      
      private function onShareUrlReady(e:ApiClientEvent, callback:Function, completeListenerFct:Function, errorListenerFct:Function) : void
      {
         this._dofusCharacterApi.getApiClient().removeEventListener(ApiClientEvent.API_CALL_RESULT,completeListenerFct);
         this._dofusCharacterApi.getApiClient().removeEventListener(ApiClientEvent.API_CALL_ERROR,errorListenerFct);
         if(e.result && e.result.hasOwnProperty("status") && e.result.status)
         {
            callback(e.result.url);
         }
         else
         {
            this.onShareUrlError(e,callback,completeListenerFct,errorListenerFct);
         }
      }
      
      private function onShareUrlError(e:ApiClientEvent, callback:Function, completeListenerFct:Function, errorListenerFct:Function) : void
      {
         this._dofusCharacterApi.getApiClient().removeEventListener(ApiClientEvent.API_CALL_RESULT,completeListenerFct);
         this._dofusCharacterApi.getApiClient().removeEventListener(ApiClientEvent.API_CALL_ERROR,errorListenerFct);
         this._log.error("Failed to retrieve share url!\n" + e.errorMsg);
         var errorMessage:String = I18n.getUiText("ui.social.share.popup.error");
         var channelId:uint = ChatActivableChannelsEnum.PSEUDO_CHANNEL_INFO;
         KernelEventsManager.getInstance().processCallback(ChatHookList.TextInformation,errorMessage,channelId,TimeManager.getInstance().getTimestamp());
         callback(null);
      }
      
      private function getAnkamaPortalUrlParams(apiKey:String) : URLVariables
      {
         var params:URLVariables = new URLVariables();
         params.username = AuthentificationManager.getInstance().username;
         params.passkey = apiKey;
         params.server = !!PlayerManager.getInstance().server?PlayerManager.getInstance().server.id:0;
         params.serverName = !!PlayerManager.getInstance().server?PlayerManager.getInstance().server.name:"";
         params.language = XmlConfig.getInstance().getEntry("config.lang.current");
         params.character = !!PlayedCharacterManager.getInstance()?PlayedCharacterManager.getInstance().id:0;
         params.theme = OptionManager.getOptionManager("dofus").currentUiSkin;
         var certificate:TrustCertificate = SecureModeManager.getInstance().certificate;
         if(certificate)
         {
            params.certificateid = certificate.id;
            params.certificatehash = certificate.hash;
         }
         return params;
      }
      
      private function initAccountDataStore() : void
      {
         this._accountDataStore = new DataStoreType("AccountModule_" + this._module.id,true,DataStoreEnum.LOCATION_LOCAL,DataStoreEnum.BIND_ACCOUNT);
      }
      
      private function initCharacterDataStore() : void
      {
         this._characterDataStore = new DataStoreType("Module_" + this._module.id,true,DataStoreEnum.LOCATION_LOCAL,DataStoreEnum.BIND_CHARACTER);
      }
      
      private function initComputerDataStore() : void
      {
         this._computerDataStore = new DataStoreType("ComputerModule_" + this._module.id,true,DataStoreEnum.LOCATION_LOCAL,DataStoreEnum.BIND_COMPUTER);
      }
      
      private function initModuleActionDataStore() : void
      {
         this._moduleActionDataStore = new DataStoreType("ModuleAction_" + this._module.id,true,DataStoreEnum.LOCATION_LOCAL,DataStoreEnum.BIND_CHARACTER);
      }
      
      private function luaZoom(value:Number) : void
      {
         var lsrf:LuaScriptRecorderFrame = Kernel.getWorker().getFrame(LuaScriptRecorderFrame) as LuaScriptRecorderFrame;
         if(lsrf)
         {
            lsrf.cameraZoom(value);
         }
      }
   }
}
