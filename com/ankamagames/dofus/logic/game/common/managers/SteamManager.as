package com.ankamagames.dofus.logic.game.common.managers
{
   import com.ankama.codegen.client.api.JsonUtil;
   import com.ankamagames.berilia.components.messages.VideoBufferChangeMessage;
   import com.ankamagames.berilia.types.graphic.GraphicContainer;
   import com.ankamagames.dofus.BuildInfos;
   import com.ankamagames.dofus.datacenter.effects.EffectInstance;
   import com.ankamagames.dofus.datacenter.effects.instances.EffectInstanceDice;
   import com.ankamagames.dofus.datacenter.effects.instances.EffectInstanceInteger;
   import com.ankamagames.dofus.kernel.Kernel;
   import com.ankamagames.dofus.logic.game.common.frames.PartyManagementFrame;
   import com.ankamagames.dofus.network.enums.BuildTypeEnum;
   import com.ankamagames.jerakine.handlers.messages.mouse.MouseClickMessage;
   import com.ankamagames.jerakine.json.JSONDecoder;
   import com.ankamagames.jerakine.logger.Log;
   import com.ankamagames.jerakine.logger.Logger;
   import com.ankamagames.jerakine.messages.Message;
   import com.ankamagames.jerakine.utils.errors.SingletonError;
   import flash.desktop.NativeApplication;
   import flash.display.Stage;
   import flash.events.ErrorEvent;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.SecurityErrorEvent;
   import flash.events.TimerEvent;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   import flash.net.URLRequestHeader;
   import flash.net.URLRequestMethod;
   import flash.net.URLVariables;
   import flash.system.ApplicationDomain;
   import flash.system.Capabilities;
   import flash.utils.ByteArray;
   import flash.utils.getDefinitionByName;
   import flash.utils.getQualifiedClassName;
   import flash.utils.getTimer;
   import flash.utils.setTimeout;
   import mapTools.MapTools;
   import mapTools.MapToolsConfig;
   
   public class SteamManager
   {
      
      public static const WEB_API_PUBLISHER_KEY:String = "A6D1A5AD5FA365B530D230A8557D61A9";
      
      private static var _self:SteamManager;
      
      protected static const _log:Logger = Log.getLogger(getQualifiedClassName(SteamManager));
      
      private static const RED_SHELL_SANDBOX_API_KEY:String = "bf36492207ea0430112af0137d4f638b";
      
      private static const RED_SHELL_API_KEY:String = "b0e63d052b0a1082c6f5377872e2bf73";
      
      private static const RED_SHELL_API_URL:String = "https://api.redshell.io/events";
      
      private static const RED_SHELL_API_VERSION:String = "1.1.0";
       
      
      private var _steamWorks;
      
      private var _appId:uint;
      
      private var _serviceBaseUrl:String;
      
      public var steamUserId:String;
      
      public var steamUserCountry:String;
      
      public var steamUserCurrency:String;
      
      private var _steamEmbed:Boolean = false;
      
      private var _leaderboard:String;
      
      private var _scoreDetails:int = 0;
      
      private var _authHandle:uint = 0;
      
      private var _publishedFile:String;
      
      private var _id:String;
      
      private var _ugcHandle:String;
      
      private var _authTicket:ByteArray = null;
      
      public function SteamManager()
      {
         super();
         if(_self)
         {
            throw new SingletonError();
         }
         this._steamWorks = new (getDefinitionByName("com.amanitadesign.steam::FRESteamWorks") as Class)();
      }
      
      public static function getInstance() : SteamManager
      {
         if(!_self)
         {
            _self = new SteamManager();
         }
         return _self;
      }
      
      public static function hasSteamApi() : Boolean
      {
         return ApplicationDomain.currentDomain.hasDefinition("com.amanitadesign.steam::FRESteamWorks");
      }
      
      public function init() : void
      {
         if(!this._steamWorks.init())
         {
            _log.error("Steamwork Failed to init");
            return;
         }
         NativeApplication.nativeApplication.addEventListener(Event.EXITING,this.onShutdown);
         this._steamEmbed = true;
         this._steamWorks.addEventListener(getDefinitionByName("com.amanitadesign.steam::SteamEvent").STEAM_RESPONSE,this.onSteamResponse);
         _log.debug("getEnv(\'HOME\') == " + this._steamWorks.getEnv("HOME"));
         this.steamUserId = this._steamWorks.getUserID();
         if(BuildInfos.BUILD_TYPE > BuildTypeEnum.BETA)
         {
            _log.debug("Steam User Id : " + this.steamUserId);
         }
         this._appId = this._steamWorks.getAppID();
         this._serviceBaseUrl = "https://api.steampowered.com/ISteamMicroTxn/GetUserInfo/V0001/";
         var loader:URLLoader = new URLLoader();
         loader.addEventListener(Event.COMPLETE,this.onUserInfos);
         var userInfosRequest:URLRequest = new URLRequest(this._serviceBaseUrl);
         var urlVars:URLVariables = new URLVariables();
         urlVars.key = WEB_API_PUBLISHER_KEY;
         urlVars.steamid = this.steamUserId;
         userInfosRequest.method = URLRequestMethod.GET;
         userInfosRequest.data = urlVars;
         loader.load(userInfosRequest);
         this.sendRedShellEvent("game_launch");
      }
      
      public function sendRedShellEvent(name:String) : void
      {
         var loader:URLLoader = new URLLoader();
         loader.addEventListener(Event.COMPLETE,this.onRedShellComplete,false,0,true);
         loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onRedShellError,false,0,true);
         loader.addEventListener(IOErrorEvent.IO_ERROR,this.onRedShellError,false,0,true);
         var body:Object = new Object();
         body.user_id = this.steamUserId;
         body.type = name;
         body.identifiers = new Object();
         body.identifiers.resolution = Capabilities.screenResolutionX + "x" + Capabilities.screenResolutionY;
         body.identifiers.os = Capabilities.os;
         body.identifiers.language = Capabilities.language;
         body.identifiers.timezone = new Date().getTimezoneOffset().toString();
         var client:URLRequest = new URLRequest();
         client.url = RED_SHELL_API_URL;
         client.contentType = "application/json";
         client.method = URLRequestMethod.POST;
         client.requestHeaders.push(new URLRequestHeader("Authorization",BuildInfos.BUILD_TYPE == BuildTypeEnum.RELEASE?RED_SHELL_API_KEY:RED_SHELL_SANDBOX_API_KEY));
         client.requestHeaders.push(new URLRequestHeader("X-Api-Version",RED_SHELL_API_VERSION));
         client.data = JsonUtil.toJson(body);
         _log.info("sending Red Shell event : " + client.data);
         loader.load(client);
      }
      
      private function onRedShellComplete(e:Event) : void
      {
         var loader:URLLoader = URLLoader(e.currentTarget);
         var data:Object = null;
         try
         {
            data = JsonUtil.fromJson(loader.data);
         }
         catch(e:Error)
         {
            onRedShellError(new ErrorEvent(e.toString()));
         }
         if(data == null)
         {
            this.onRedShellError(new ErrorEvent("null result"));
         }
         else if(data.hasOwnProperty("status_code") && data.status_code != null)
         {
            this.onRedShellError(new ErrorEvent("Error : \"" + data.message + "\" with response : " + loader.data));
         }
         else
         {
            _log.info("Red Shell event successfully sent.");
         }
      }
      
      private function onRedShellError(e:Event) : void
      {
         _log.error("Error sending Red Shell event : " + e);
      }
      
      public function addOverlayWorkaround(stage:Stage) : void
      {
         this._steamWorks.addOverlayWorkaround(stage,true);
      }
      
      public function onShutdown(pEvt:Event) : void
      {
         this._steamWorks.dispose();
      }
      
      public function isSteamEmbed() : Boolean
      {
         return this._steamEmbed;
      }
      
      public function get authTicket() : ByteArray
      {
         return this._authTicket;
      }
      
      public function get appId() : uint
      {
         return this._appId;
      }
      
      private function getAuthSessionTicket(e:Event = null) : void
      {
         if(!this._steamWorks.isReady)
         {
            return;
         }
         this._authTicket = new ByteArray();
         this._authHandle = this._steamWorks.getAuthSessionTicket(this._authTicket);
         _log.debug("getAuthSessionTicket(ticket) == " + this._authHandle);
         this.logTicket(this._authTicket);
      }
      
      private function getUserScore(e:Event = null) : void
      {
         this.getScoresAroundUser(e,0,0);
      }
      
      private function getScoresAroundUser(e:Event = null, start:int = -4, end:int = 5) : void
      {
         if(!this._steamWorks.isReady)
         {
            return;
         }
         if(!this._leaderboard)
         {
            _log.error("No Leaderboard handle set");
            return;
         }
         _log.debug("downloadLeaderboardEntries(...) == " + this._steamWorks.downloadLeaderboardEntries(this._leaderboard,getDefinitionByName("com.amanitadesign.steam::UserStatsConstants").DATAREQUEST_GlobalAroundUser,start,end));
      }
      
      private function activateOverlay(service:String) : void
      {
         if(!this._steamWorks.isReady)
         {
            return;
         }
         setTimeout(function():void
         {
         },1000);
      }
      
      private function logTicket(ticket:ByteArray) : void
      {
         var n:String = null;
         var s:String = "";
         for(var i:int = 0; i < ticket.length; i++)
         {
            n = ticket[i].toString(16);
            s = s + ((n.length < 2?"0":"") + n);
         }
         _log.debug("Ticket: " + ticket.bytesAvailable + "//" + ticket.length + "\n" + s);
      }
      
      private function onUserInfos(pEvt:Event) : void
      {
         var replyJson:JSONDecoder = new JSONDecoder(pEvt.target.data,true);
         var reply:* = replyJson.getValue();
         this.steamUserCountry = reply.response.params.country;
         this.steamUserCurrency = reply.response.params.currency;
      }
      
      private function onSteamResponse(e:*) : void
      {
         var i:int = 0;
         var apiCall:Boolean = false;
         var name:String = null;
         var sortMethod:int = 0;
         var displayType:int = 0;
         var entries:Array = null;
         var sr:Object = null;
         var subRes:* = undefined;
         var shared:Boolean = false;
         var userRes:Object = null;
         var fileRes:Object = null;
         var actionRes:Object = null;
         var res:Object = null;
         var ugcResult:Object = null;
         var voteDetails:Object = null;
         var userVoteDetails:Object = null;
         var realAuthHandle:uint = 0;
         var license:uint = 0;
         var microTxnResponse:Object = null;
         var newLeaderboard:String = null;
         var en:Object = null;
         var d:int = 0;
         var f:String = null;
         var progress:Array = null;
         var ba:ByteArray = null;
         switch(e.req_type)
         {
            case getDefinitionByName("com.amanitadesign.steam::SteamConstants").RESPONSE_OnUserStatsStored:
               _log.debug("RESPONSE_OnUserStatsStored: " + e.response);
               break;
            case getDefinitionByName("com.amanitadesign.steam::SteamConstants").RESPONSE_OnUserStatsReceived:
               _log.debug("RESPONSE_OnUserStatsReceived: " + e.response);
               if(this._steamWorks.userHasLicenseForApp(this.steamUserId,this._appId) == getDefinitionByName("com.amanitadesign.steam::UserConstants").LICENSE_HasLicense)
               {
                  _log.debug("user got the licence");
                  break;
               }
               if(this._steamWorks.userHasLicenseForApp(this.steamUserId,this._appId) == getDefinitionByName("com.amanitadesign.steam::UserConstants").LICENSE_DoesNotHaveLicense)
               {
                  _log.debug("user do not have any licence");
                  break;
               }
               if(this._steamWorks.userHasLicenseForApp(this.steamUserId,this._appId) == getDefinitionByName("com.amanitadesign.steam::UserConstants").LICENSE_NoAuth)
               {
                  _log.debug("OMG ! User is not authentificated !");
                  break;
               }
               break;
            case getDefinitionByName("com.amanitadesign.steam::SteamConstants").RESPONSE_OnAchievementStored:
               _log.debug("RESPONSE_OnAchievementStored: " + e.response);
               break;
            case getDefinitionByName("com.amanitadesign.steam::SteamConstants").RESPONSE_OnGlobalStatsReceived:
               _log.debug("RESPONSE_OnGlobalStatsReceived: " + e.response);
               break;
            case getDefinitionByName("com.amanitadesign.steam::SteamConstants").RESPONSE_OnFindLeaderboard:
               _log.debug("RESPONSE_OnFindLeaderboad: " + e.response);
               if(e.response != getDefinitionByName("com.amanitadesign.steam::SteamResults").OK)
               {
                  _log.debug("FAILED!");
                  break;
               }
               if(this._leaderboard)
               {
                  newLeaderboard = this._steamWorks.findLeaderboardResult();
                  _log.debug("findLeaderboardResult() == " + newLeaderboard);
                  if(newLeaderboard != this._leaderboard)
                  {
                     _log.debug("FAILURE: findOrCreateLeaderboard() returned different _leaderboard");
                     break;
                  }
                  break;
               }
               this._leaderboard = this._steamWorks.findLeaderboardResult();
               name = this._steamWorks.getLeaderboardName(this._leaderboard);
               sortMethod = this._steamWorks.getLeaderboardSortMethod(this._leaderboard);
               displayType = this._steamWorks.getLeaderboardDisplayType(this._leaderboard);
               _log.debug("findLeaderboardResult() == " + this._leaderboard);
               _log.debug("getLeaderboardName(...) == " + name);
               _log.debug("getLeaderboardEntryCount(...) == " + this._steamWorks.getLeaderboardEntryCount(this._leaderboard));
               _log.debug("getLeaderboardSortMethod(...) == " + sortMethod);
               _log.debug("getLeaderboardDisplayType(...) == " + displayType);
               _log.debug("findOrCreateLeaderboard(...) == " + this._steamWorks.findOrCreateLeaderboard(name,sortMethod,displayType));
               break;
            case getDefinitionByName("com.amanitadesign.steam::SteamConstants").RESPONSE_OnDownloadLeaderboardEntries:
               _log.debug("RESPONSE_OnDownloadLeaderboardEntries: " + e.response);
               if(e.response != getDefinitionByName("com.amanitadesign.steam::SteamResults").OK)
               {
                  _log.debug("FAILED!");
                  break;
               }
               entries = this._steamWorks.downloadLeaderboardEntriesResult(this._scoreDetails);
               _log.debug("downloadLeaderboardEntriesResult(" + this._scoreDetails + ") == " + (!!entries?"Array, size " + entries.length:"null"));
               for(i = 0; i < entries.length; i++)
               {
                  en = entries[i] as (getDefinitionByName("com.amanitadesign.steam::UploadLeaderboardScoreResult") as Class);
                  _log.debug(i + ": " + en.userID + ", " + en.globalRank + ", " + en.score + ", " + en.numDetails + "//" + en.details.length);
                  for(d = 0; d < en.details.length; d++)
                  {
                     _log.debug("\tdetails[" + d + "] == " + en.details[d]);
                  }
               }
               this._scoreDetails = 0;
               break;
            case getDefinitionByName("com.amanitadesign.steam::SteamConstants").RESPONSE_OnUploadLeaderboardScore:
               _log.debug("RESPONSE_OnUploadLeaderboardScore: " + e.response);
               if(e.response != getDefinitionByName("com.amanitadesign.steam::SteamResults").OK)
               {
                  _log.debug("FAILED!");
                  break;
               }
               sr = this._steamWorks.SteamWrapper.getUploadLeaderboardScoreResult() as (getDefinitionByName("com.amanitadesign.steam::UploadLeaderboardScoreResult") as Class);
               _log.debug("SteamWrapper.getUploadLeaderboardScoreResult() == " + sr);
               _log.debug("success: " + sr.success + ", score: " + sr.score + ", changed: " + sr.scoreChanged + ", rank: " + sr.previousGlobalRank + " -> " + sr.newGlobalRank);
               this.getUserScore(null);
               break;
            case getDefinitionByName("com.amanitadesign.steam::SteamConstants").RESPONSE_OnFileShared:
               _log.debug("RESPONSE_OnFileShared: " + e.response);
               if(e.response != getDefinitionByName("com.amanitadesign.steam::SteamResults").OK)
               {
                  _log.debug("FAILED!");
                  break;
               }
               _log.debug("fileShareResult() == " + this._steamWorks.fileShareResult());
               getDefinitionByName("com.amanitadesign.steam::WorkshopConstants").VISIBILITY_Private;
               ["TestTag"];
               apiCall = this._steamWorks.publishWorkshopFile("test.txt","",this._appId,"Test.txt","Test.txt",getDefinitionByName("com.amanitadesign.steam::WorkshopConstants").FILETYPE_Community);
               _log.debug("publishWorkshopFile(\'test.txt\' ...) == " + apiCall);
               break;
            case getDefinitionByName("com.amanitadesign.steam::SteamConstants").RESPONSE_OnPublishWorkshopFile:
               _log.debug("RESPONSE_OnPublishWorkshopFile: " + e.response);
               if(e.response != getDefinitionByName("com.amanitadesign.steam::SteamResults").OK)
               {
                  _log.debug("FAILED!");
                  break;
               }
               this._publishedFile = this._steamWorks.publishWorkshopFileResult();
               _log.debug("File published as " + this._publishedFile);
               if(this._publishedFile == getDefinitionByName("com.amanitadesign.steam::WorkshopConstants").PUBLISHEDFILEID_Invalid)
               {
                  _log.debug("FAILED!");
                  break;
               }
               _log.debug("subscribePublishedFile(...) == " + this._steamWorks.subscribePublishedFile(this._publishedFile));
               break;
            case getDefinitionByName("com.amanitadesign.steam::SteamConstants").RESPONSE_OnEnumerateUserSubscribedFiles:
               _log.debug("RESPONSE_OnEnumerateUserSubscribedFiles: " + e.response);
               if(e.response != getDefinitionByName("com.amanitadesign.steam::SteamResults").OK)
               {
                  _log.debug("FAILED!");
                  break;
               }
               subRes = this._steamWorks.enumerateUserSubscribedFilesResult() as (getDefinitionByName("com.amanitadesign.steam::SubscribedFilesResult") as Class);
               _log.debug("User subscribed files: " + subRes.resultsReturned + "/" + subRes.totalResults);
               for(i = 0; i < subRes.resultsReturned; i++)
               {
                  this._id = subRes.publishedFileId[i];
                  apiCall = this._steamWorks.getPublishedFileDetails(subRes.publishedFileId[i]);
                  _log.debug(i + ": " + subRes.publishedFileId[i] + " (" + subRes.timeSubscribed[i] + ") - " + apiCall);
               }
               if(subRes.resultsReturned > 0)
               {
                  apiCall = this._steamWorks.setUserPublishedFileAction(subRes.publishedFileId[0],getDefinitionByName("com.amanitadesign.steam::WorkshopConstants").FILEACTION_Played);
                  _log.debug("setUserPublishedFileAction(..., Played) == " + apiCall);
                  break;
               }
               break;
            case getDefinitionByName("com.amanitadesign.steam::SteamConstants").RESPONSE_OnEnumerateUserSharedWorkshopFiles:
            case getDefinitionByName("com.amanitadesign.steam::SteamConstants").RESPONSE_OnEnumerateUserPublishedFiles:
               shared = e.req_type == getDefinitionByName("com.amanitadesign.steam::SteamConstants").RESPONSE_OnEnumerateUserSharedWorkshopFiles;
               _log.debug((!!shared?"RESPONSE_OnEnumerateUserSharedWorkshopFile":"RESPONSE_OnEnumerateUserPublishedFiles: ") + e.response);
               if(e.response != getDefinitionByName("com.amanitadesign.steam::SteamResults").OK)
               {
                  return;
               }
               userRes = !!shared?this._steamWorks.enumerateUserSharedWorkshopFilesResult() as (getDefinitionByName("com.amanitadesign.steam::UserFilesResult") as Class):this._steamWorks.enumerateUserPublishedFilesResult() as (getDefinitionByName("com.amanitadesign.steam::UserFilesResult") as Class);
               _log.debug("User " + (!!shared?"shared":"published") + " files: " + userRes.resultsReturned + "/" + userRes.totalResults);
               for(i = 0; i < userRes.resultsReturned; i++)
               {
                  _log.debug(i + ": " + userRes.publishedFileId[i]);
               }
               if(userRes.resultsReturned > 0)
               {
                  this._publishedFile = userRes.publishedFileId[0];
                  break;
               }
               break;
            case getDefinitionByName("com.amanitadesign.steam::SteamConstants").RESPONSE_OnEnumeratePublishedWorkshopFiles:
               _log.debug("RESPONSE_OnEnumeratePublishedWorkshopFiles: " + e.response);
               if(e.response != getDefinitionByName("com.amanitadesign.steam::SteamResults").OK)
               {
                  _log.debug("FAILED!");
                  break;
               }
               fileRes = this._steamWorks.enumeratePublishedWorkshopFilesResult() as (getDefinitionByName("com.amanitadesign.steam::WorkshopFilesResult") as Class);
               _log.debug("Workshop files: " + fileRes.resultsReturned + "/" + fileRes.totalResults);
               for(i = 0; i < fileRes.resultsReturned; i++)
               {
                  _log.debug(i + ": " + fileRes.publishedFileId[i] + " - " + fileRes.score[i]);
               }
               if(fileRes.resultsReturned > 0)
               {
                  f = fileRes.publishedFileId[0];
                  apiCall = this._steamWorks.updateUserPublishedItemVote(f,true);
                  _log.debug("updateUserPublishedItemVote(" + f + ", true) == " + apiCall);
                  apiCall = this._steamWorks.getPublishedItemVoteDetails(f);
                  _log.debug("getPublishedItemVoteDetails(" + f + ") == " + apiCall);
                  apiCall = this._steamWorks.getUserPublishedItemVoteDetails(f);
                  _log.debug("getUserPublishedItemVoteDetails(" + f + ") == " + apiCall);
                  break;
               }
               break;
            case getDefinitionByName("com.amanitadesign.steam::SteamConstants").RESPONSE_OnEnumeratePublishedFilesByUserAction:
               _log.debug("RESPONSE_OnEnumeratePublishedFilesByUserAction: " + e.response);
               if(e.response != getDefinitionByName("com.amanitadesign.steam::SteamResults").OK)
               {
                  _log.debug("FAILED!");
                  break;
               }
               actionRes = this._steamWorks.enumeratePublishedFilesByUserActionResult() as (getDefinitionByName("com.amanitadesign.steam::FilesByUserActionResult") as Class);
               _log.debug("Files for action " + actionRes.action + ": " + actionRes.resultsReturned + "/" + actionRes.totalResults);
               for(i = 0; i < actionRes.resultsReturned; )
               {
                  _log.debug(i + ": " + actionRes.publishedFileId[i] + " - " + actionRes.timeUpdated[i]);
                  if(actionRes.action == getDefinitionByName("com.amanitadesign.steam::WorkshopConstants").FILEACTION_Played)
                  {
                     _log.debug("setUserPublishedFileAction(..., Completed) == " + this._steamWorks.setUserPublishedFileAction(actionRes.publishedFileId[i],getDefinitionByName("com.amanitadesign.steam::WorkshopConstants").FILEACTION_Completed));
                  }
                  i++;
               }
               break;
            case getDefinitionByName("com.amanitadesign.steam::SteamConstants").RESPONSE_OnGetPublishedFileDetails:
               _log.debug("RESPONSE_OnGetPublishedFileDetails: " + e.response);
               if(e.response != getDefinitionByName("com.amanitadesign.steam::SteamResults").OK)
               {
                  _log.debug("FAILED!");
                  break;
               }
               res = this._steamWorks.getPublishedFileDetailsResult(this._id) as (getDefinitionByName("com.amanitadesign.steam::FileDetailsResult") as Class);
               _log.debug("Result for " + this._id + ": " + res);
               if(res)
               {
                  _log.debug("File: " + res.fileName + ", handle: " + res.fileHandle);
                  this._ugcHandle = res.fileHandle;
                  apiCall = this._steamWorks.UGCDownload(res.fileHandle,0);
                  _log.debug("UGCDownload(...) == " + apiCall);
                  progress = this._steamWorks.getUGCDownloadProgress(res.fileHandle);
                  _log.debug("getUGCDownloadProgress(...) == " + progress);
                  setTimeout(function():void
                  {
                     var progress:Array = _steamWorks.getUGCDownloadProgress(res.fileHandle);
                     _log.debug("getUGCDownloadProgress(...) == " + progress);
                  },1000);
                  break;
               }
               break;
            case getDefinitionByName("com.amanitadesign.steam::SteamConstants").RESPONSE_OnUGCDownload:
               _log.debug("RESPONSE_OnUGCDownload: " + e.response);
               if(e.response != getDefinitionByName("com.amanitadesign.steam::SteamResults").OK)
               {
                  _log.debug("FAILED!");
                  break;
               }
               ugcResult = this._steamWorks.getUGCDownloadResult(this._ugcHandle) as (getDefinitionByName("com.amanitadesign.steam::DownloadUGCResult") as Class);
               _log.debug("Result for " + this._ugcHandle + ": " + ugcResult);
               if(ugcResult)
               {
                  _log.debug("File: " + ugcResult.fileName + ", handle: " + ugcResult.fileHandle + ", size: " + ugcResult.size);
                  ba = new ByteArray();
                  apiCall = this._steamWorks.UGCRead(ugcResult.fileHandle,ugcResult.size,0,ba);
                  _log.debug("UGCRead(...) == " + apiCall);
                  if(apiCall)
                  {
                     _log.debug("Result length: " + ba.position + "//" + ba.length);
                     _log.debug("Result: " + ba.readUTFBytes(ugcResult.size));
                     break;
                  }
                  break;
               }
               break;
            case getDefinitionByName("com.amanitadesign.steam::SteamConstants").RESPONSE_OnGetPublishedItemVoteDetails:
               _log.debug("RESPONSE_OnGetPublishedItemVoteDetails: " + e.response);
               if(e.response != getDefinitionByName("com.amanitadesign.steam::SteamResults").OK)
               {
                  _log.debug("FAILED!");
                  break;
               }
               voteDetails = this._steamWorks.getPublishedItemVoteDetailsResult() as (getDefinitionByName("com.amanitadesign.steam::ItemVoteDetailsResult") as Class);
               _log.debug("getPublishedItemVoteDetails() == " + (!!voteDetails?voteDetails.result:"null"));
               if(!voteDetails)
               {
                  return;
               }
               _log.debug("votes: " + voteDetails.votesFor + "//" + voteDetails.votesAgainst + ", score: " + voteDetails.score + ", reports: " + voteDetails.reports);
               break;
            case getDefinitionByName("com.amanitadesign.steam::SteamConstants").RESPONSE_OnGetUserPublishedItemVoteDetails:
               _log.debug("RESPONSE_OnGetUserPublishedItemVoteDetails: " + e.response);
               if(e.response != getDefinitionByName("com.amanitadesign.steam::SteamResults").OK)
               {
                  _log.debug("FAILED!");
                  break;
               }
               userVoteDetails = this._steamWorks.getUserPublishedItemVoteDetailsResult() as (getDefinitionByName("com.amanitadesign.steam::UserVoteDetails") as Class);
               _log.debug("getUserPublishedItemVoteDetails() == " + (!!userVoteDetails?userVoteDetails.result:"null"));
               if(!userVoteDetails)
               {
                  return;
               }
               _log.debug("vote: " + userVoteDetails.vote);
               break;
            case getDefinitionByName("com.amanitadesign.steam::SteamConstants").RESPONSE_OnGetAuthSessionTicketResponse:
               _log.debug("RESPONSE_OnGetAuthSessionTicketResponse: " + e.response);
               if(e.response != getDefinitionByName("com.amanitadesign.steam::SteamResults").OK)
               {
                  _log.debug("FAILED!");
                  break;
               }
               if(this._authHandle == getDefinitionByName("com.amanitadesign.steam::UserConstants").AUTHTICKET_Invalid)
               {
                  _log.debug("Invalid _authHandle (cancelled?)");
                  break;
               }
               realAuthHandle = this._steamWorks.getAuthSessionTicketResult();
               _log.debug("getAuthSessionTicketResult() == " + realAuthHandle);
               _log.debug("equal to original handle? " + (realAuthHandle == this._authHandle));
               this._authHandle = realAuthHandle;
               _log.debug("beginAuthSession(ticket, " + this.steamUserId + ") == " + this._steamWorks.beginAuthSession(this._authTicket,this.steamUserId));
               break;
            case getDefinitionByName("com.amanitadesign.steam::SteamConstants").RESPONSE_OnValidateAuthTicketResponse:
               _log.debug("RESPONSE_OnValidateAuthTicketResponse: " + e.response);
               if(e.response != getDefinitionByName("com.amanitadesign.steam::UserConstants").SESSION_OK)
               {
                  _log.debug("FAILED!");
                  break;
               }
               license = this._steamWorks.userHasLicenseForApp(this.steamUserId,this._appId);
               _log.debug("userHasLicenseForApp(...) == " + license + "(" + (license == getDefinitionByName("com.amanitadesign.steam::UserConstants").LICENSE_HasLicense) + ")");
               _log.debug("userHasLicenseForApp(..., 999999) == " + this._steamWorks.userHasLicenseForApp(this.steamUserId,999999));
               _log.debug("endAuthSession(" + this.steamUserId + ") == " + this._steamWorks.endAuthSession(this.steamUserId));
               _log.debug("cancelAuthTicket(" + this._authHandle + ") == " + this._steamWorks.cancelAuthTicket(this._authHandle));
               this._authHandle = getDefinitionByName("com.amanitadesign.steam::UserConstants").AUTHTICKET_Invalid;
               break;
            case getDefinitionByName("com.amanitadesign.steam::SteamConstants").RESPONSE_OnMicroTxnAuthorizationResponse:
               for(_log.debug("RESPONSE_OnMicroTxnAuthorizationResponse: " + e.response); (microTxnResponse = this._steamWorks.microTxnResult() as (getDefinitionByName("com.amanitadesign.steam::MicroTxnAuthorizationResponse") as Class)) != null; )
               {
                  _log.debug("MicroTxnOrderIDResult() == " + microTxnResponse + "\n" + " (app: " + microTxnResponse.appID + ", order: " + microTxnResponse.orderID + ", authorized: " + microTxnResponse.authorized + ")");
                  DofusShopManager.getInstance().confirmSteamArticlePurchase(microTxnResponse.orderID,microTxnResponse.authorized);
               }
         }
      }
   }
}
