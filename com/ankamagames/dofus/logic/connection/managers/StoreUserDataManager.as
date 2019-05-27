package com.ankamagames.dofus.logic.connection.managers
{
   import by.blooddy.crypto.MD5;
   import com.ankamagames.atouin.Atouin;
   import com.ankamagames.berilia.frames.UiStatsFrame;
   import com.ankamagames.berilia.managers.ThemeManager;
   import com.ankamagames.dofus.BuildInfos;
   import com.ankamagames.dofus.kernel.updaterv2.IUpdaterMessageHandler;
   import com.ankamagames.dofus.kernel.updaterv2.UpdaterApi;
   import com.ankamagames.dofus.kernel.updaterv2.messages.IUpdaterInputMessage;
   import com.ankamagames.dofus.kernel.updaterv2.messages.impl.SystemConfigurationMessage;
   import com.ankamagames.dofus.logic.common.managers.PlayerManager;
   import com.ankamagames.dofus.logic.game.common.managers.SteamManager;
   import com.ankamagames.dofus.misc.interClient.InterClientManager;
   import com.ankamagames.dofus.misc.utils.HaapiDebugManager;
   import com.ankamagames.jerakine.logger.Log;
   import com.ankamagames.jerakine.logger.Logger;
   import com.ankamagames.jerakine.types.CustomSharedObject;
   import com.ankamagames.jerakine.utils.display.StageShareManager;
   import com.ankamagames.jerakine.utils.errors.SingletonError;
   import com.ankamagames.jerakine.utils.system.CommandLineArguments;
   import com.ankamagames.jerakine.utils.system.SystemManager;
   import com.ankamagames.performance.Benchmark;
   import com.hurlant.util.Base64;
   import flash.display.Screen;
   import flash.display.StageDisplayState;
   import flash.events.ErrorEvent;
   import flash.events.Event;
   import flash.system.ApplicationDomain;
   import flash.system.Capabilities;
   import flash.utils.getQualifiedClassName;
   
   public class StoreUserDataManager implements IUpdaterMessageHandler
   {
      
      protected static const _log:Logger = Log.getLogger(getQualifiedClassName(StoreUserDataManager));
      
      private static var _self:StoreUserDataManager;
      
      private static const NUMBER_OF_UPLOAD_PER_VERSION:uint = 1;
       
      
      public var statsEnabled:Boolean = false;
      
      private var _so:CustomSharedObject;
      
      private var _userData:Object;
      
      private var _api:UpdaterApi;
      
      private var _updaterIsConnected:Boolean = false;
      
      public function StoreUserDataManager()
      {
         super();
         if(_self != null)
         {
            throw new SingletonError("StoreUserDataManager is a singleton and should not be instanciated directly.");
         }
         if(!this._api)
         {
            this._api = new UpdaterApi(this);
         }
      }
      
      public static function getInstance() : StoreUserDataManager
      {
         if(_self == null)
         {
            _self = new StoreUserDataManager();
         }
         return _self;
      }
      
      public function gatherUserData() : void
      {
         this._so = CustomSharedObject.getLocal("playerData_" + PlayerManager.getInstance().accountId);
         var hasAlreadyUploadedStatsForCurrentVersion:Boolean = false;
         if(this._so && this._so.data && this._so.data.hasOwnProperty("version") && this._so.data.version.major == BuildInfos.VERSION.major && this._so.data.version.minor == BuildInfos.VERSION.minor && this._so.data.hasOwnProperty("totalUploads") && this._so.data.totalUploads >= NUMBER_OF_UPLOAD_PER_VERSION)
         {
            hasAlreadyUploadedStatsForCurrentVersion = true;
         }
         if(hasAlreadyUploadedStatsForCurrentVersion)
         {
            _log.debug("Data already saved.");
            return;
         }
         this._userData = new Object();
         this.addBaseInfoToUserData();
         if(this._updaterIsConnected && CommandLineArguments.getInstance().hasArgument("updater_version") && CommandLineArguments.getInstance().getArgument("updater_version") == "v2")
         {
            this._api.getSystemConfiguration();
         }
         else if(CommandLineArguments.getInstance().hasArgument("sysinfos"))
         {
            this.addUpdaterV1InfoToUserData();
            this.addAirAvailableInfoToUserData(true);
         }
         else
         {
            this.addAirAvailableInfoToUserData(false);
         }
      }
      
      public function handleConnectionOpened() : void
      {
         this._updaterIsConnected = true;
      }
      
      public function handleConnectionClosed() : void
      {
         this._updaterIsConnected = false;
      }
      
      public function handleMessage(msg:IUpdaterInputMessage) : void
      {
         if(msg is SystemConfigurationMessage)
         {
            this.onSystemConfiguration(msg as SystemConfigurationMessage);
         }
      }
      
      public function onSystemConfiguration(config:*) : void
      {
         var key:* = null;
         if(config && config.config)
         {
            for(key in config.config)
            {
               this.addData("updaterV2_" + key,config.config[key]);
            }
         }
         this.addAirAvailableInfoToUserData(true);
      }
      
      private function addBaseInfoToUserData() : void
      {
         var screens:Array = null;
         var screensW:Array = null;
         var screensH:Array = null;
         var screen:Screen = null;
         this.addData("client_buildType",BuildInfos.BUILD_TYPE);
         this.addData("client_version",BuildInfos.VERSION.major + "." + BuildInfos.VERSION.minor);
         this.addData("client_sUid",MD5.hash(PlayerManager.getInstance().accountId.toString()));
         this.addData("client_isAbo",PlayerManager.getInstance().subscriptionEndDate > 0 || PlayerManager.getInstance().hasRights);
         this.addData("client_creationAbo",PlayerManager.getInstance().accountCreation);
         this.addData("client_creationAboDate",UiStatsFrame.formatDate(new Date(PlayerManager.getInstance().accountCreation)));
         this.addData("client_currentScreenResolution",StageShareManager.stage.fullScreenWidth + "x" + StageShareManager.stage.fullScreenHeight);
         if(Screen.screens && Screen.screens.length)
         {
            screens = new Array();
            screensW = new Array();
            screensH = new Array();
            for each(screen in Screen.screens)
            {
               screens.push(screen.bounds.width + "x" + screen.bounds.height);
               screensW.push(screen.bounds.width);
               screensH.push(screen.bounds.height);
            }
            this.addData("client_availableScreens",screens);
         }
         var displayState:String = StageShareManager.stage.displayState;
         this.addData("client_nativeWindow",StageShareManager.stage.nativeWindow.width + "x" + StageShareManager.stage.nativeWindow.height);
         if(displayState == StageDisplayState.NORMAL)
         {
            displayState = StageShareManager.stage.nativeWindow.displayState;
         }
         this.addData("client_displayState",displayState);
         this.addData("client_uiTheme",ThemeManager.getInstance().currentTheme);
         this.addData("client_hideBlackBorders",Atouin.getInstance().options.hideBlackBorder);
         this.addData("client_mapInteriorZoom",Atouin.getInstance().options.useInsideAutoZoom);
         var totalUploads:int = 1;
         if(this._so && this._so.data && this._so.data.hasOwnProperty("totalUploads"))
         {
            totalUploads = this._so.data.hasOwnProperty("totalUploads") + 1;
         }
         this.addData("client_totalUploads",totalUploads);
         var osFullName:String = Capabilities.os.toLowerCase();
         var osName:String = "other";
         if(osFullName.search("windows") != -1)
         {
            osName = "windows";
         }
         else if(Capabilities.manufacturer.toLowerCase().search("android") != -1)
         {
            osName = "android";
         }
         else if(osFullName.search("mac") != -1)
         {
            osName = "mac";
         }
         else if(osFullName.search("linux") != -1)
         {
            osName = "linux";
         }
         else if(osFullName.search("ipad") != -1 || osFullName.search("iphone") != -1)
         {
            osName = "ios";
         }
         this.addData("client_os",osName);
         this.addData("client_osVersion",SystemManager.getSingleton().version);
         var supportArchCPU:String = "none";
         if(Capabilities.supports32BitProcesses && !Capabilities.supports64BitProcesses)
         {
            supportArchCPU = "32-bit";
         }
         else if(Capabilities.supports64BitProcesses)
         {
            supportArchCPU = "64-bit";
         }
         this.addData("client_supportedCpuArchitecture",supportArchCPU);
      }
      
      private function addUpdaterV1InfoToUserData() : void
      {
         var data:String = null;
         var key:String = null;
         var value:String = null;
         var tmp:Array = null;
         var val:String = Base64.decode(CommandLineArguments.getInstance().getArgument("sysinfos"));
         var datas:Array = val.split("\n");
         var dict:Array = new Array();
         for each(data in datas)
         {
            data = data.replace("\n","");
            if(!(data == "" || data.search(":") == -1))
            {
               tmp = data.split(":");
               key = tmp[0];
               value = tmp[1];
               if(!(value == "" || key == ""))
               {
                  switch(key)
                  {
                     case "RAM_FREE":
                     case "DISK_FREE":
                        continue;
                     case "VIDEO_DRIVER_INSTALLATION_DATE":
                        value = value.substr(0,6);
                  }
                  this.addData("updaterV1_" + key,value);
               }
            }
         }
      }
      
      private function addAirAvailableInfoToUserData(isUsingUpdater:Boolean) : void
      {
         var flashKeyParts:Array = null;
         this.addData("client_envType","air");
         this.addData("client_isUsingUpdater",isUsingUpdater);
         this.addData("client_inSteam",SteamManager.hasSteamApi() && SteamManager.getInstance().isSteamEmbed());
         var flashKey:String = InterClientManager.getInstance().flashKey;
         if(flashKey)
         {
            flashKeyParts = flashKey.split("#");
            this.addData("client_flashKeyBase",flashKeyParts[0]);
            if(flashKeyParts[1])
            {
               this.addData("client_flashKeyId",parseInt(flashKeyParts[1]));
            }
         }
         this.checkStage3D();
      }
      
      private function addBenchmarkInfoToUserData() : void
      {
         var benchmarkResultsList:Array = null;
         var res:String = null;
         var resList:Array = null;
         var benchmarkResults:String = Benchmark.getResults(true);
         if(benchmarkResults)
         {
            benchmarkResultsList = benchmarkResults.split(";");
            for each(res in benchmarkResultsList)
            {
               resList = res.split(":");
               if(resList.length == 2)
               {
                  if(resList[1] != "none")
                  {
                     if(resList[1] == "error")
                     {
                        resList[1] = "-1";
                     }
                     this.addData("client_benchmark_" + resList[0],parseInt(resList[1]));
                  }
               }
            }
         }
      }
      
      private function checkStage3D() : void
      {
         var stage3Ds:* = undefined;
         if(ApplicationDomain.currentDomain.hasDefinition("flash.display.Stage3D"))
         {
            stage3Ds = StageShareManager.stage["stage3Ds"];
            if(stage3Ds && stage3Ds.length && stage3Ds[0])
            {
               stage3Ds[0].addEventListener("context3DCreate",this.onContext3DCreate);
               stage3Ds[0].addEventListener(ErrorEvent.ERROR,this.onContext3DError);
               stage3Ds[0].requestContext3D();
            }
         }
         else
         {
            this.addData("client_stage3dDriverInfo","NotSupported");
            this.submitData();
         }
      }
      
      private function onContext3DCreate(e:Event) : void
      {
         var driverInfo:String = "ContextLost";
         if(e.target.context3D)
         {
            driverInfo = e.target.context3D.driverInfo;
         }
         this.destroyContext3D(e.target);
         this.addData("client_stage3dDriverInfo",driverInfo);
         this.submitData();
      }
      
      private function onContext3DError(e:ErrorEvent) : void
      {
         this.destroyContext3D(e.target);
         this.addData("client_stage3dDriverInfo","ContextCreationError");
         this.submitData();
      }
      
      private function destroyContext3D(stage3D:*) : void
      {
         stage3D.removeEventListener("context3DCreate",this.onContext3DCreate);
         stage3D.removeEventListener(ErrorEvent.ERROR,this.onContext3DError);
         if(stage3D.context3D)
         {
            stage3D.context3D.dispose(false);
         }
      }
      
      private function submitData() : void
      {
         _log.debug("Sending data...");
         this.addBenchmarkInfoToUserData();
         var jsonInfo:String = by.blooddy.crypto.serialization.JSON.encode(this._userData);
         _log.debug("final json: " + jsonInfo);
         HaapiDebugManager.getInstance().submitData(HaapiDebugManager.HARDWARE_DATA_TYPE,jsonInfo,this.onUserDataUploaded,this.onUserDataUploadError);
      }
      
      private function addData(key:String, value:*) : void
      {
         this._userData[key] = value;
      }
      
      private function onUserDataUploaded() : void
      {
         var isSameVersion:Boolean = false;
         var previousTotalUploads:int = 0;
         if(this._so.data)
         {
            if(this._so.data.hasOwnProperty("version") && this._so.data.version.major == BuildInfos.VERSION.major && this._so.data.version.minor == BuildInfos.VERSION.minor)
            {
               isSameVersion = true;
            }
            if(isSameVersion && this._so.data.hasOwnProperty("totalUploads"))
            {
               previousTotalUploads = this._so.data.totalUploads;
            }
         }
         this._so.data = new Object();
         this._so.data.version = {
            "major":BuildInfos.VERSION.major,
            "minor":BuildInfos.VERSION.minor
         };
         this._so.data.totalUploads = previousTotalUploads + 1;
         this._so.flush();
         this._userData = null;
         this._so = null;
      }
      
      private function onUserDataUploadError() : void
      {
         _log.error("Couldn\'t send user data, an error occurred during the upload.");
      }
   }
}
