package
{
   import com.ankamagames.atouin.Atouin;
   import com.ankamagames.berilia.Berilia;
   import com.ankamagames.berilia.components.EntityDisplayer;
   import com.ankamagames.berilia.components.MapViewer;
   import com.ankamagames.berilia.frames.UiStatsFrame;
   import com.ankamagames.berilia.managers.KernelEventsManager;
   import com.ankamagames.berilia.managers.UiModuleManager;
   import com.ankamagames.berilia.managers.UiPerformanceManager;
   import com.ankamagames.berilia.utils.web.HttpServer;
   import com.ankamagames.dofus.BuildInfos;
   import com.ankamagames.dofus.Constants;
   import com.ankamagames.dofus.Modules;
   import com.ankamagames.dofus.console.moduleLUA.ConsoleLUA;
   import com.ankamagames.dofus.console.moduleLogger.Console;
   import com.ankamagames.dofus.kernel.Kernel;
   import com.ankamagames.dofus.kernel.net.ConnectionsHandler;
   import com.ankamagames.dofus.kernel.sound.SoundManager;
   import com.ankamagames.dofus.kernel.sound.manager.RegConnectionManager;
   import com.ankamagames.dofus.kernel.sound.manager.RegSoundManager;
   import com.ankamagames.dofus.kernel.updaterv2.UpdaterApi;
   import com.ankamagames.dofus.logic.common.managers.PlayerManager;
   import com.ankamagames.dofus.logic.connection.frames.InitializationFrame;
   import com.ankamagames.dofus.logic.game.common.managers.SteamManager;
   import com.ankamagames.dofus.misc.EntityLookAdapter;
   import com.ankamagames.dofus.misc.interClient.AppIdModifier;
   import com.ankamagames.dofus.misc.interClient.InterClientManager;
   import com.ankamagames.dofus.misc.lists.HookList;
   import com.ankamagames.dofus.misc.stats.StatisticsManager;
   import com.ankamagames.dofus.misc.stats.events.StatisticsEvent;
   import com.ankamagames.dofus.misc.utils.CursorConstant;
   import com.ankamagames.dofus.misc.utils.EmbedAssets;
   import com.ankamagames.dofus.misc.utils.HaapiDebugManager;
   import com.ankamagames.dofus.misc.utils.errormanager.DofusErrorHandler;
   import com.ankamagames.dofus.misc.utils.errormanager.WebServiceDataHandler;
   import com.ankamagames.dofus.network.enums.BuildTypeEnum;
   import com.ankamagames.dofus.network.enums.SubEntityBindingPointCategoryEnum;
   import com.ankamagames.dofus.types.DofusOptions;
   import com.ankamagames.dofus.types.entities.AnimStatiqueSubEntityBehavior;
   import com.ankamagames.dofus.types.entities.BreedSkinModifier;
   import com.ankamagames.dofus.types.entities.CustomBreedAnimationModifier;
   import com.ankamagames.dofus.types.entities.RiderBehavior;
   import com.ankamagames.jerakine.enum.OperatingSystem;
   import com.ankamagames.jerakine.logger.Log;
   import com.ankamagames.jerakine.logger.Logger;
   import com.ankamagames.jerakine.managers.ErrorManager;
   import com.ankamagames.jerakine.managers.FontManager;
   import com.ankamagames.jerakine.managers.LangManager;
   import com.ankamagames.jerakine.messages.Worker;
   import com.ankamagames.jerakine.resources.adapters.impl.SignedFileAdapter;
   import com.ankamagames.jerakine.types.Callback;
   import com.ankamagames.jerakine.types.CustomSharedObject;
   import com.ankamagames.jerakine.types.Uri;
   import com.ankamagames.jerakine.types.Version;
   import com.ankamagames.jerakine.types.events.PropertyChangeEvent;
   import com.ankamagames.jerakine.utils.crypto.SignatureKey;
   import com.ankamagames.jerakine.utils.display.StageShareManager;
   import com.ankamagames.jerakine.utils.files.FileUtils;
   import com.ankamagames.jerakine.utils.system.CommandLineArguments;
   import com.ankamagames.jerakine.utils.system.SystemManager;
   import com.ankamagames.performance.Benchmark;
   import com.ankamagames.tiphon.engine.Tiphon;
   import com.ankamagames.tiphon.engine.TiphonEventsManager;
   import com.ankamagames.tiphon.events.TiphonEvent;
   import com.demonsters.debugger.MonsterDebugger;
   import flash.desktop.NativeApplication;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.NativeWindow;
   import flash.display.NativeWindowDisplayState;
   import flash.display.Screen;
   import flash.display.Sprite;
   import flash.display.Stage;
   import flash.display.StageQuality;
   import flash.events.Event;
   import flash.events.FullScreenEvent;
   import flash.events.InvokeEvent;
   import flash.events.KeyboardEvent;
   import flash.events.NativeWindowBoundsEvent;
   import flash.events.NativeWindowDisplayStateEvent;
   import flash.events.TimerEvent;
   import flash.filesystem.File;
   import flash.filesystem.FileMode;
   import flash.filesystem.FileStream;
   import flash.net.URLRequestDefaults;
   import flash.ui.Keyboard;
   import flash.utils.ByteArray;
   import flash.utils.Timer;
   import flash.utils.getQualifiedClassName;
   import flash.utils.setTimeout;
   
   public class DofusClientMain extends Sprite implements IDofus
   {
      
      protected static const _log:Logger = Log.getLogger(getQualifiedClassName(DofusClientMain));
       
      
      private const EXIT_TIMEOUT:Number = 3500;
      
      private const EXIT_REQUEST_TIMEOUT:Number = 3000;
      
      private const REQUEST_TIMEOUT:Number = 10000;
      
      private const REQUEST_TIMEOUT_LOCAL:Number = 20000;
      
      private var _uiContainer:Sprite;
      
      private var _worldContainer:Sprite;
      
      private var _buildType:String;
      
      private var _instanceId:uint;
      
      private var _doOptions:DofusOptions;
      
      private var _blockLoading:Boolean;
      
      private var _initialized:Boolean = false;
      
      private var _windowInitialized:Boolean = false;
      
      private var _forcedLang:String;
      
      private var _stageWidth:int;
      
      private var _stageHeight:int;
      
      private var _displayState:String;
      
      private var _returnCode:int;
      
      private var _needUiLoadStatsSubmission:Boolean;
      
      private var _timeoutTimer:Timer;
      
      public var USE_MINI_LOADER:Boolean = false;
      
      public function DofusClientMain()
      {
         var versionFile:File = null;
         var stream:FileStream = null;
         var content:String = null;
         var patch:Array = null;
         super();
         BuildInfos.VERSION = new Version("2.51.12-release",String("release").toUpperCase() == "LOCAL"?BuildTypeEnum.INTERNAL:BuildTypeEnum[String("release").toUpperCase()],35215098,0);
         BuildInfos.BUILD_DATE = "14-05-2019 06:22";
         try
         {
            versionFile = new File(File.applicationDirectory.nativePath + File.separator + "VERSION");
            if(versionFile.exists)
            {
               stream = new FileStream();
               stream.open(versionFile,FileMode.READ);
               content = stream.readMultiByte(versionFile.size,"utf-8");
               stream.close();
               patch = content.split(/\./);
               if(patch.length == 4)
               {
                  BuildInfos.VERSION.patch = patch[3];
               }
            }
         }
         catch(e:Error)
         {
         }
         if(BuildInfos.BUILD_TYPE == BuildTypeEnum.DEBUG)
         {
            MonsterDebugger.initialize(this);
         }
         else
         {
            MonsterDebugger.enabled = false;
         }
         if(BuildInfos.BUILD_TYPE != BuildTypeEnum.RELEASE)
         {
            CustomSharedObject.directory = CustomSharedObject.directory + (" - " + BuildInfos.buildTypeName);
         }
         for(var i:uint = 0; i < numChildren; i++)
         {
            getChildAt(i).visible = false;
         }
         MapViewer.FLAG_CURSOR = EmbedAssets.getClass("FLAG_CURSOR");
         var stage:Stage = this.stage;
         var userAgent:String = "Dofus Client " + BuildInfos.VERSION.toString();
         if(BuildInfos.BUILD_TYPE != BuildTypeEnum.INTERNAL && BuildInfos.BUILD_TYPE != BuildTypeEnum.RELEASE)
         {
            userAgent = userAgent + ("-" + BuildInfos.buildTypeName);
         }
         URLRequestDefaults.userAgent = userAgent;
         URLRequestDefaults.idleTimeout = BuildInfos.BUILD_TYPE == BuildTypeEnum.INTERNAL || BuildInfos.BUILD_TYPE == BuildTypeEnum.DEBUG?Number(this.REQUEST_TIMEOUT_LOCAL):Number(this.REQUEST_TIMEOUT);
         Dofus.setInstance(this);
         this._blockLoading = name != "root1";
         ErrorManager.registerLoaderInfo(loaderInfo);
         mouseEnabled = false;
         tabChildren = false;
         stage.addEventListener(FullScreenEvent.FULL_SCREEN,this.onFullScreen);
         stage.addEventListener(KeyboardEvent.KEY_DOWN,this.onKeyDown);
         try
         {
            new AppIdModifier();
         }
         catch(e:Error)
         {
            _log.error("Erreur sur la gestion du multicompte :\n" + e.getStackTrace());
         }
         NativeApplication.nativeApplication.addEventListener(Event.EXITING,this.onExiting);
         NativeApplication.nativeApplication.addEventListener(InvokeEvent.INVOKE,this.onCall);
         stage.nativeWindow.addEventListener(NativeWindowBoundsEvent.RESIZE,this.onResize);
         var file:File = new File(File.applicationDirectory.nativePath + File.separator + "steam_appid.txt");
         if(SteamManager.hasSteamApi() && file.exists)
         {
            _log.debug("Initializing SteamManager");
            SteamManager.getInstance().init();
            if(SteamManager.getInstance().isSteamEmbed())
            {
               SteamManager.getInstance().addOverlayWorkaround(this.stage);
            }
         }
      }
      
      public function get useMiniLoader() : Boolean
      {
         return this.USE_MINI_LOADER;
      }
      
      public function get initialized() : Boolean
      {
         return this._initialized;
      }
      
      public function get rootContainer() : DisplayObjectContainer
      {
         return this;
      }
      
      public function getRawSignatureData() : ByteArray
      {
         var fs:FileStream = new FileStream();
         var f:File = File.applicationDirectory.resolvePath("DofusInvoker.d2sf");
         fs.open(f,FileMode.READ);
         var rawData:ByteArray = new ByteArray();
         fs.readBytes(rawData);
         fs.close();
         return rawData;
      }
      
      private function onCall(e:InvokeEvent) : void
      {
         var file:File = null;
         var stream:FileStream = null;
         if(!this._initialized)
         {
            CommandLineArguments.getInstance().setArguments(e.arguments);
            new DofusErrorHandler();
            if(BuildInfos.BUILD_TYPE < BuildTypeEnum.INTERNAL)
            {
               Uri.enableSecureURI();
            }
            if(this.stage)
            {
               this.init(this.stage);
            }
            try
            {
               file = new File(CustomSharedObject.getCustomSharedObjectDirectory() + File.separator + "path.d2p");
               if(!file.exists)
               {
                  stream = new FileStream();
                  stream.open(file,FileMode.WRITE);
                  stream.writeUTF(File.applicationDirectory.nativePath);
                  stream.close();
               }
            }
            catch(e:Error)
            {
            }
            this._initialized = true;
         }
      }
      
      private function onResize(e:NativeWindowBoundsEvent) : void
      {
         if(stage.nativeWindow.displayState != NativeWindowDisplayState.MINIMIZED)
         {
            if(this._displayState != null && this._displayState != stage.nativeWindow.displayState)
            {
               UiStatsFrame.addStat("client_resized");
            }
            this._displayState = stage.nativeWindow.displayState;
         }
         if(this._displayState == NativeWindowDisplayState.NORMAL && !StageShareManager.isGoingFullScreen)
         {
            this._stageWidth = stage.nativeWindow.width;
            this._stageHeight = stage.nativeWindow.height;
         }
      }
      
      private function onKeyDown(e:KeyboardEvent) : void
      {
         if(!PlayerManager.getInstance().hasRights && BuildInfos.BUILD_TYPE != BuildTypeEnum.DEBUG)
         {
            return;
         }
         if(MonsterDebugger.enabled)
         {
            if(e.ctrlKey && e.keyCode == Keyboard.SPACE)
            {
               MonsterDebugger.inspect(this);
            }
         }
         else if(e.altKey && String.fromCharCode(e.charCode) == "²")
         {
            _log.info("Initializing MonsterDebugger...");
            MonsterDebugger.enabled = true;
            MonsterDebugger.initialize(this);
         }
      }
      
      private function onFullScreen(e:FullScreenEvent) : void
      {
         stage.removeEventListener(FullScreenEvent.FULL_SCREEN,this.onFullScreen);
         setTimeout(stage.nativeWindow.activate,100);
      }
      
      private function initWindow(isFullScreen:Boolean) : void
      {
         if(this._windowInitialized)
         {
            return;
         }
         this._windowInitialized = true;
         var r:Number = stage.stageWidth / stage.stageHeight;
         var mainWindow:NativeWindow = stage.nativeWindow;
         var chromeWidth:Number = mainWindow.width - stage.stageWidth;
         var chromeHeight:Number = mainWindow.height - stage.stageHeight;
         var os:String = SystemManager.getSingleton().os;
         if(os == OperatingSystem.MAC_OS)
         {
            chromeHeight = 25;
         }
         StageShareManager.chrome.x = chromeWidth;
         StageShareManager.chrome.y = chromeHeight;
         var clientDimensionSo:CustomSharedObject = CustomSharedObject.getLocal("clientData");
         var sizeInitialised:Boolean = false;
         if(clientDimensionSo.data != null && (clientDimensionSo.data.width > 0 && clientDimensionSo.data.height > 0))
         {
            if(clientDimensionSo.data.width > 0 && clientDimensionSo.data.height > 0)
            {
               mainWindow.width = clientDimensionSo.data.width;
               if(os == OperatingSystem.LINUX)
               {
                  mainWindow.height = clientDimensionSo.data.height - 28;
               }
               else
               {
                  mainWindow.height = clientDimensionSo.data.height;
               }
               this._stageWidth = mainWindow.width;
               this._stageHeight = mainWindow.height;
               sizeInitialised = true;
            }
            if(!isFullScreen && clientDimensionSo.data.displayState == NativeWindowDisplayState.MAXIMIZED)
            {
               this._displayState = NativeWindowDisplayState.MAXIMIZED;
            }
         }
         else
         {
            mainWindow.width = Screen.mainScreen.visibleBounds.width * 0.8;
            mainWindow.height = Screen.mainScreen.visibleBounds.height * 0.8;
            this._displayState = NativeWindowDisplayState.MAXIMIZED;
         }
         this._stageWidth = mainWindow.width;
         this._stageHeight = mainWindow.height;
         mainWindow.x = (Screen.mainScreen.visibleBounds.width - mainWindow.width) / 2 + Screen.mainScreen.visibleBounds.x;
         mainWindow.y = Math.max(0,(Screen.mainScreen.visibleBounds.height - mainWindow.height) / 2 + Screen.mainScreen.visibleBounds.y);
         if(!isFullScreen)
         {
            if(this._displayState != NativeWindowDisplayState.MAXIMIZED)
            {
               mainWindow.activate();
               this.updateLoadingScreenLayout();
            }
            else if(this._displayState == NativeWindowDisplayState.MAXIMIZED)
            {
               mainWindow.addEventListener(NativeWindowDisplayStateEvent.DISPLAY_STATE_CHANGE,this.onDisplayStateChanged);
               mainWindow.maximize();
            }
         }
      }
      
      protected function onDisplayStateChanged(event:NativeWindowDisplayStateEvent) : void
      {
         stage.nativeWindow.removeEventListener(NativeWindowDisplayStateEvent.DISPLAY_STATE_CHANGE,this.onDisplayStateChanged);
         stage.nativeWindow.activate();
         this.updateLoadingScreenLayout();
      }
      
      private function updateLoadingScreenLayout() : void
      {
         var initFrame:InitializationFrame = Kernel.getWorker().getFrame(InitializationFrame) as InitializationFrame;
         if(initFrame)
         {
            initFrame.updateLoadingScreenSize();
         }
      }
      
      public function getUiContainer() : DisplayObjectContainer
      {
         return this._uiContainer;
      }
      
      public function getWorldContainer() : DisplayObjectContainer
      {
         return this._worldContainer;
      }
      
      public function get options() : DofusOptions
      {
         return this._doOptions;
      }
      
      public function get instanceId() : uint
      {
         return this._instanceId;
      }
      
      public function get forcedLang() : String
      {
         return this._forcedLang;
      }
      
      public function setDisplayOptions(opt:DofusOptions) : void
      {
         this.initWindow(opt.fullScreen);
         this._doOptions = opt;
         this._doOptions.addEventListener(PropertyChangeEvent.PROPERTY_CHANGED,this.onOptionChange);
         this._doOptions.flashQuality = this._doOptions.flashQuality;
         this._doOptions.fullScreen = this._doOptions.fullScreen;
         if(SteamManager.hasSteamApi() && SteamManager.getInstance().isSteamEmbed())
         {
            AppIdModifier.getInstance().setRenderMode(false,true);
            this._doOptions.forceRenderCPU = AppIdModifier.getInstance().forceCPURenderMode;
         }
         else if(SystemManager.getSingleton().os == OperatingSystem.LINUX)
         {
            AppIdModifier.getInstance().setRenderMode(true,true);
            this._doOptions.forceRenderCPU = AppIdModifier.getInstance().forceCPURenderMode;
         }
         else if(this._doOptions.forceRenderCPU != AppIdModifier.getInstance().forceCPURenderMode)
         {
            AppIdModifier.getInstance().setRenderMode(this._doOptions.forceRenderCPU,true);
         }
      }
      
      public function init(rootClip:DisplayObject, instanceId:uint = 0, forcedLang:String = null, args:Array = null) : void
      {
         if(args)
         {
            CommandLineArguments.getInstance().setArguments(args);
         }
         this._instanceId = instanceId;
         this._forcedLang = forcedLang;
         var catchMouseEventCtr:Sprite = new Sprite();
         catchMouseEventCtr.name = "catchMouseEventCtr";
         catchMouseEventCtr.graphics.beginFill(0);
         catchMouseEventCtr.graphics.drawRect(0,0,StageShareManager.startWidth,StageShareManager.startHeight);
         catchMouseEventCtr.graphics.endFill();
         addChild(catchMouseEventCtr);
         var so:CustomSharedObject = CustomSharedObject.getLocal("appVersion");
         if(!so.data.lastBuildVersion || so.data.lastBuildVersion != BuildInfos.VERSION.revision && BuildInfos.BUILD_TYPE < BuildTypeEnum.INTERNAL)
         {
            this.clearCache(true);
         }
         so = CustomSharedObject.getLocal("appVersion");
         so.data.lastBuildVersion = BuildInfos.VERSION.revision;
         so.flush();
         so.close();
         UiPerformanceManager.getInstance().currentVersion = BuildInfos.VERSION;
         SignedFileAdapter.defaultSignatureKey = SignatureKey.fromByte(new Constants.SIGNATURE_KEY_DATA() as ByteArray);
         StatisticsManager.getInstance().statsEnabled = true;
         SoundManager.getInstance().manager = new RegSoundManager();
         SoundManager.getInstance().manager.forceSoundsDebugMode = true;
         this.initKernel(this.stage,rootClip);
         this.initWorld();
         this.initUi();
         stage.nativeWindow.addEventListener(Event.CLOSE,this.onClosed);
         TiphonEventsManager.addListener(Tiphon.getInstance(),TiphonEvent.EVT_EVENT);
         Atouin.getInstance().addListener(SoundManager.getInstance().manager);
      }
      
      private function onExiting(pEvt:Event) : void
      {
         if(Kernel.getWorker().terminated)
         {
            return;
         }
         _log.info("[exit] Client exit requested.");
         Kernel.getWorker().terminate();
         RegConnectionManager.getInstance().onExit();
         this.saveClientSize();
         var preventExit:Boolean = false;
         URLRequestDefaults.idleTimeout = this.EXIT_REQUEST_TIMEOUT;
         if(WebServiceDataHandler.getInstance().hasExceptionNotSent())
         {
            _log.info("[exit] Sending exception(s) to WebService.");
            preventExit = true;
            WebServiceDataHandler.getInstance().markLastExceptionAsBlocker();
            WebServiceDataHandler.getInstance().addEventListener(WebServiceDataHandler.ALL_DATA_SENT,this.onExceptionSent);
            WebServiceDataHandler.getInstance().sendWaitingException();
         }
         if(UiPerformanceManager.getInstance().statsEnabled)
         {
            this._needUiLoadStatsSubmission = UiPerformanceManager.getInstance().needUiLoadStatsSubmission;
            if(this._needUiLoadStatsSubmission || UiStatsFrame.hasStats)
            {
               _log.info("[exit] Sending UI stats.");
               preventExit = true;
               this.sendUiStats();
            }
         }
         if(StatisticsManager.getInstance().statsEnabled && StatisticsManager.getInstance().sendActionsAndExit())
         {
            _log.info("[exit] Sending KPI(s).");
            preventExit = true;
            StatisticsManager.getInstance().addEventListener(StatisticsEvent.ALL_DATA_SENT,this.onStatsSent);
         }
         if(preventExit)
         {
            if(pEvt)
            {
               pEvt.preventDefault();
               pEvt.stopPropagation();
            }
            this._timeoutTimer = new Timer(this.EXIT_TIMEOUT,1);
            this._timeoutTimer.addEventListener(TimerEvent.TIMER_COMPLETE,this.onExitTimeout);
            this._timeoutTimer.start();
         }
         else if(!pEvt)
         {
            this.exit();
         }
      }
      
      private function onExceptionSent(pEvt:Event = null) : void
      {
         _log.info("[exit] Exception(s) submit complete.");
         this.checkExitingStatus();
      }
      
      private function onStatsSent(pEvt:Event = null) : void
      {
         _log.info("[exit] KPI(s) submit complete.");
         this.checkExitingStatus();
      }
      
      private function checkExitingStatus(pEvt:Event = null) : void
      {
         if(WebServiceDataHandler.getInstance().hasExceptionNotSent())
         {
            return;
         }
         if(UiPerformanceManager.getInstance().statsEnabled && (this._needUiLoadStatsSubmission || UiStatsFrame.hasStats))
         {
            return;
         }
         if(StatisticsManager.getInstance().statsEnabled && StatisticsManager.getInstance().hasActionsToSend())
         {
            return;
         }
         _log.info("[exit] All data sent, ready to exit.");
         this.exit();
      }
      
      private function exit() : void
      {
         if(this._timeoutTimer)
         {
            this._timeoutTimer.reset();
         }
         if(Constants.EVENT_MODE)
         {
            this.reboot();
         }
         NativeApplication.nativeApplication.exit(this._returnCode);
      }
      
      private function onExitTimeout(event:TimerEvent) : void
      {
         _log.warn("[exit] Something went wrong during data submit, forcing exit.");
         DofusErrorHandler.captureMessage("Client exiting timeout.");
         ConnectionsHandler.closeConnection();
         StatisticsManager.getInstance().storeData();
         this.exit();
      }
      
      public function quit(returnCode:int = 0) : void
      {
         this._returnCode = returnCode;
         this.onExiting(null);
      }
      
      private function sendUiStats() : void
      {
         var benchmarkResults:String = null;
         var benchmarkResultsList:Array = null;
         var res:String = null;
         var resList:Array = null;
         var uiData:Object = null;
         var key:* = null;
         var data:Object = {};
         if(this._needUiLoadStatsSubmission)
         {
            data = UiPerformanceManager.getInstance().averageUiLoadStats;
            benchmarkResults = Benchmark.getResults();
            benchmarkResultsList = benchmarkResults.split(";");
            for each(res in benchmarkResultsList)
            {
               resList = res.split(":");
               if(resList.length == 2)
               {
                  if(!(resList[1] == "none" || resList[0] != "readDiskTest" && resList[0] != "displayPerfTest"))
                  {
                     if(resList[1] == "error")
                     {
                        resList[1] = "-1";
                     }
                     data["client_benchmark_" + resList[0]] = parseInt(resList[1]);
                  }
               }
            }
         }
         if(UiStatsFrame.hasStats)
         {
            uiData = UiStatsFrame.getStatsData();
            for(key in uiData)
            {
               data[key] = uiData[key];
            }
         }
         if(PlayerManager.getInstance().server != null)
         {
            data["client_server_id"] = PlayerManager.getInstance().server.id;
         }
         if(PlayerManager.getInstance().nickname != null)
         {
            data["client_account_id"] = PlayerManager.getInstance().accountId;
            data["client_nickname"] = PlayerManager.getInstance().nickname;
         }
         data["client_buildType"] = BuildInfos.BUILD_TYPE;
         data["client_version"] = BuildInfos.VERSION.toString();
         var jsonData:String = by.blooddy.crypto.serialization.JSON.encode(data);
         HaapiDebugManager.getInstance().submitData(HaapiDebugManager.UI_DATA_TYPE,jsonData,this.onUiLoadStatsSentComplete,this.onUiLoadStatsSentError);
      }
      
      private function onUiLoadStatsSentComplete() : void
      {
         _log.info("[exit] UI stats sent successfully.");
         if(this._needUiLoadStatsSubmission)
         {
            UiPerformanceManager.getInstance().markCurrentVersionAsUploaded();
         }
         this.completeUiStatsSubmit();
      }
      
      private function onUiLoadStatsSentError() : void
      {
         _log.warn("[exit] Failed to send UI stats");
         this.completeUiStatsSubmit();
      }
      
      private function completeUiStatsSubmit() : void
      {
         this._needUiLoadStatsSubmission = false;
         UiStatsFrame.clearStats();
         _log.info("[exit] UI stats submit complete.");
         this.checkExitingStatus();
      }
      
      public function clearCache(selective:Boolean = false, reboot:Boolean = false) : void
      {
         var soList:Array = null;
         var file:File = null;
         var fileName:String = null;
         var soFolder:File = new File(CustomSharedObject.getCustomSharedObjectDirectory());
         if(soFolder && soFolder.exists)
         {
            CustomSharedObject.closeAll();
            CustomSharedObject.resetCache();
            soList = soFolder.getDirectoryListing();
            for each(file in soList)
            {
               fileName = FileUtils.getFileStartName(file.name);
               if(fileName != "Dofus_Guest")
               {
                  if(fileName != "Berilia_binds")
                  {
                     if(fileName != "Dofus_Surveys")
                     {
                        if(fileName.indexOf("playerData_") != 0)
                        {
                           if(file.name != "ui")
                           {
                              if(selective)
                              {
                                 switch(fileName.indexOf("Module_") != -1 === true?0:fileName == "dofus" === true?1:fileName.indexOf("Dofus_") == 0 === true?2:fileName == "atouin" === true?3:fileName == "berilia" === true?4:fileName == "chat" === true?5:fileName == "tiphon" === true?6:fileName == "tubul" === true?7:fileName.indexOf("externalNotifications_") == 0 === true?8:fileName == "itemAveragePrices" === true?9:fileName == "Berilia_binds" === true?10:fileName == "Berilia_ui_stats" === true?11:fileName == "Berilia_ui_stats2" === true?12:fileName == "Berilia_ui_positions" === true?13:fileName == "Jerakine_classAlias" === true?14:fileName == "maps" === true?15:fileName == "logs" === true?16:fileName == "uid" === true?17:fileName == "appVersion" === true?18:fileName == "clientData" === true?19:20)
                                 {
                                    case 0:
                                    case 1:
                                    case 2:
                                    case 3:
                                    case 4:
                                    case 5:
                                    case 6:
                                    case 7:
                                    case 8:
                                    case 9:
                                    case 10:
                                    case 11:
                                    case 12:
                                    case 13:
                                    case 14:
                                    case 15:
                                    case 16:
                                    case 17:
                                    case 18:
                                    case 19:
                                       continue;
                                 }
                              }
                              try
                              {
                                 if(file.isDirectory)
                                 {
                                    file.deleteDirectory(true);
                                 }
                                 else
                                 {
                                    file.deleteFile();
                                 }
                              }
                              catch(e:Error)
                              {
                                 continue;
                              }
                           }
                        }
                     }
                  }
               }
            }
         }
         if(reboot)
         {
            AppIdModifier.getInstance().invalideCache();
            CustomSharedObject.clearedCacheAndRebooting = true;
            this.reboot();
         }
      }
      
      public function reboot() : void
      {
         this.saveClientSize();
         var w:Worker = Kernel.getWorker();
         if(w)
         {
            w.clear();
         }
         _log.fatal("REBOOT");
         if(UpdaterApi.isUsingZaap() && UpdaterApi.isConnected())
         {
            UpdaterApi.requestZaapRestart(NativeApplication.nativeApplication.exit);
         }
         else
         {
            NativeApplication.nativeApplication.exit(42);
         }
      }
      
      public function renameApp(name:String) : void
      {
         stage.nativeWindow.title = name;
      }
      
      private function initKernel(stage:Stage, rootClip:DisplayObject) : void
      {
         Kernel.getInstance().init(stage,rootClip);
         LangManager.getInstance().handler = Kernel.getWorker();
         FontManager.getInstance().handler = Kernel.getWorker();
         FontManager.getInstance().processCallback = new Callback(KernelEventsManager.getInstance().processCallback,HookList.FontActiveTypeChanged);
         Berilia.getInstance().handler = Kernel.getWorker();
         LangManager.getInstance().lang = "frFr";
      }
      
      private function initWorld() : void
      {
         if(this._worldContainer)
         {
            removeChild(this._worldContainer);
         }
         this._worldContainer = new Sprite();
         addChildAt(this._worldContainer,numChildren - 1);
         this._worldContainer.mouseEnabled = false;
      }
      
      private function initUi() : void
      {
         if(this._uiContainer)
         {
            removeChild(this._uiContainer);
         }
         this._uiContainer = new Sprite();
         this._uiContainer.name = "uiContainer";
         this._uiContainer.mouseEnabled = false;
         addChildAt(this._uiContainer,numChildren - 1);
         var isDebugMode:* = BuildInfos.BUILD_TYPE == BuildTypeEnum.DEBUG;
         Berilia.getInstance().verboseException = isDebugMode;
         CursorConstant.init();
         UiModuleManager.getInstance().modulesEmbeddedSWFs = Modules.scripts;
         Berilia.getInstance().init(this._uiContainer,BuildInfos.VERSION.revision);
         EntityDisplayer.setAnimationModifier(1,new CustomBreedAnimationModifier());
         EntityDisplayer.setAnimationModifier(2,new CustomBreedAnimationModifier());
         EntityDisplayer.setSkinModifier(1,new BreedSkinModifier());
         EntityDisplayer.setSkinModifier(2,new BreedSkinModifier());
         EntityDisplayer.setSubEntityDefaultBehavior(SubEntityBindingPointCategoryEnum.HOOK_POINT_CATEGORY_PET,new AnimStatiqueSubEntityBehavior());
         EntityDisplayer.setSubEntityDefaultBehavior(SubEntityBindingPointCategoryEnum.HOOK_POINT_CATEGORY_MOUNT_DRIVER,new RiderBehavior());
         EntityDisplayer.lookAdaptater = EntityLookAdapter.tiphonizeLook;
      }
      
      private function onClosed(e:Event) : void
      {
         Console.getInstance().close();
         ConsoleLUA.getInstance().close();
         HttpServer.getInstance().close();
         InterClientManager.destroy();
      }
      
      private function onOptionChange(e:PropertyChangeEvent) : void
      {
         if(e.propertyName == "flashQuality")
         {
            if(e.propertyValue == 0)
            {
               StageShareManager.stage.quality = StageQuality.LOW;
            }
            else if(e.propertyValue == 1)
            {
               StageShareManager.stage.quality = StageQuality.MEDIUM;
            }
            else if(e.propertyValue == 2)
            {
               StageShareManager.stage.quality = StageQuality.HIGH;
            }
         }
         if(e.propertyName == "fullScreen")
         {
            StageShareManager.setFullScreen(e.propertyValue,false);
         }
         if(e.propertyName == "forceRenderCPU")
         {
            AppIdModifier.getInstance().setRenderMode(e.propertyValue,Dofus.getInstance().options["dofusQuality"] != 3);
         }
      }
      
      private function saveClientSize() : void
      {
         var clientDimentionSo:CustomSharedObject = CustomSharedObject.getLocal("clientData");
         clientDimentionSo.data.height = this._stageHeight;
         clientDimentionSo.data.width = this._stageWidth;
         clientDimentionSo.data.displayState = this._displayState;
         clientDimentionSo.flush();
         clientDimentionSo.close();
      }
   }
}
