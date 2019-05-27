package com.ankamagames.dofus.logic.game.common.frames
{
   import com.ankamagames.berilia.managers.KernelEventsManager;
   import com.ankamagames.dofus.BuildInfos;
   import com.ankamagames.dofus.internalDatacenter.dare.DareCriteriaWrapper;
   import com.ankamagames.dofus.internalDatacenter.dare.DareWrapper;
   import com.ankamagames.dofus.kernel.net.ConnectionsHandler;
   import com.ankamagames.dofus.logic.common.managers.PlayerManager;
   import com.ankamagames.dofus.logic.game.common.actions.dare.DareCancelRequestAction;
   import com.ankamagames.dofus.logic.game.common.actions.dare.DareCreationRequestAction;
   import com.ankamagames.dofus.logic.game.common.actions.dare.DareInformationsRequestAction;
   import com.ankamagames.dofus.logic.game.common.actions.dare.DareListRequestAction;
   import com.ankamagames.dofus.logic.game.common.actions.dare.DareRewardRequestAction;
   import com.ankamagames.dofus.logic.game.common.actions.dare.DareSubscribeRequestAction;
   import com.ankamagames.dofus.logic.game.common.managers.PlayedCharacterManager;
   import com.ankamagames.dofus.logic.game.common.managers.TimeManager;
   import com.ankamagames.dofus.misc.lists.ChatHookList;
   import com.ankamagames.dofus.misc.lists.SocialHookList;
   import com.ankamagames.dofus.network.enums.BuildTypeEnum;
   import com.ankamagames.dofus.network.enums.ChatActivableChannelsEnum;
   import com.ankamagames.dofus.network.enums.DareCriteriaTypeEnum;
   import com.ankamagames.dofus.network.enums.DareErrorEnum;
   import com.ankamagames.dofus.network.messages.game.dare.DareCancelRequestMessage;
   import com.ankamagames.dofus.network.messages.game.dare.DareCanceledMessage;
   import com.ankamagames.dofus.network.messages.game.dare.DareCreatedListMessage;
   import com.ankamagames.dofus.network.messages.game.dare.DareCreatedMessage;
   import com.ankamagames.dofus.network.messages.game.dare.DareCreationRequestMessage;
   import com.ankamagames.dofus.network.messages.game.dare.DareErrorMessage;
   import com.ankamagames.dofus.network.messages.game.dare.DareInformationsMessage;
   import com.ankamagames.dofus.network.messages.game.dare.DareInformationsRequestMessage;
   import com.ankamagames.dofus.network.messages.game.dare.DareListMessage;
   import com.ankamagames.dofus.network.messages.game.dare.DareRewardConsumeRequestMessage;
   import com.ankamagames.dofus.network.messages.game.dare.DareRewardConsumeValidationMessage;
   import com.ankamagames.dofus.network.messages.game.dare.DareRewardWonMessage;
   import com.ankamagames.dofus.network.messages.game.dare.DareRewardsListMessage;
   import com.ankamagames.dofus.network.messages.game.dare.DareSubscribeRequestMessage;
   import com.ankamagames.dofus.network.messages.game.dare.DareSubscribedListMessage;
   import com.ankamagames.dofus.network.messages.game.dare.DareSubscribedMessage;
   import com.ankamagames.dofus.network.messages.game.dare.DareVersatileListMessage;
   import com.ankamagames.dofus.network.messages.game.dare.DareWonListMessage;
   import com.ankamagames.dofus.network.messages.game.dare.DareWonMessage;
   import com.ankamagames.dofus.network.types.game.dare.DareCriteria;
   import com.ankamagames.dofus.network.types.game.dare.DareInformations;
   import com.ankamagames.dofus.network.types.game.dare.DareReward;
   import com.ankamagames.dofus.network.types.game.dare.DareVersatileInformations;
   import com.ankamagames.dofus.types.enums.DareSubscribeErrorEnum;
   import com.ankamagames.jerakine.data.I18n;
   import com.ankamagames.jerakine.data.XmlConfig;
   import com.ankamagames.jerakine.logger.Log;
   import com.ankamagames.jerakine.logger.Logger;
   import com.ankamagames.jerakine.managers.StoreDataManager;
   import com.ankamagames.jerakine.messages.RegisteringFrame;
   import com.ankamagames.jerakine.resources.adapters.impl.SignedFileAdapter;
   import com.ankamagames.jerakine.types.DataStoreType;
   import com.ankamagames.jerakine.types.Uri;
   import com.ankamagames.jerakine.types.enums.DataStoreEnum;
   import com.ankamagames.jerakine.types.enums.Priority;
   import com.ankamagames.jerakine.utils.crypto.Base64;
   import com.ankamagames.jerakine.utils.crypto.Signature;
   import flash.utils.ByteArray;
   import flash.utils.Dictionary;
   import flash.utils.getQualifiedClassName;
   import flash.utils.getTimer;
   
   public class DareFrame extends RegisteringFrame
   {
      
      protected static const _log:Logger = Log.getLogger(getQualifiedClassName(DareFrame));
      
      private static const LOCAL_URL:String = "http://gameservers-www-exports.dofus2.lan/";
      
      private static const ONLINE_URL:String = "http://dl.ak.ankama.com/games/dofus2/game-export/";
      
      private static var _instance:DareFrame;
      
      private static var _datastoreType:DataStoreType = new DataStoreType("Module_Ankama_Social",true,DataStoreEnum.LOCATION_LOCAL,DataStoreEnum.BIND_CHARACTER);
       
      
      private var _urlDareList:Uri;
      
      private var _urlDareVersatileList:Uri;
      
      private var _dareList:Vector.<DareWrapper>;
      
      private var _dareListById:Dictionary;
      
      private var _dareIdsBySubAreaId:Dictionary;
      
      private var _monsterIdsBySubAreaId:Dictionary;
      
      private var _monsterTotalDaresBySubAreaId:Dictionary;
      
      private var _dareRewardsWon:Vector.<DareReward>;
      
      private var _totalGuildDares:int = 0;
      
      private var _totalAllianceDares:int = 0;
      
      private var _waitStaticDareInfo:Boolean;
      
      private var _waitVersatileDareInfo:Boolean;
      
      public var versatileDataLifetime:uint = 300000.0;
      
      public var staticDataLifetime:uint = 900000.0;
      
      public function DareFrame()
      {
         var output:ByteArray = null;
         var signedData:ByteArray = null;
         var signature:Signature = null;
         var signatureIsValid:Boolean = false;
         super();
         _instance = this;
         DareWrapper.clearCache();
         this._dareList = new Vector.<DareWrapper>();
         this._dareListById = new Dictionary(true);
         this._dareIdsBySubAreaId = new Dictionary(true);
         this._monsterIdsBySubAreaId = new Dictionary(true);
         this._monsterTotalDaresBySubAreaId = new Dictionary(true);
         this._dareRewardsWon = new Vector.<DareReward>();
         var serverId:int = PlayerManager.getInstance().server.id;
         var base_url:String = BuildInfos.BUILD_TYPE >= BuildTypeEnum.TESTING?LOCAL_URL:ONLINE_URL;
         var configGameExport:String = XmlConfig.getInstance().getEntry("config.gameExport");
         if(configGameExport)
         {
            if(BuildInfos.BUILD_TYPE <= BuildTypeEnum.TESTING)
            {
               if(XmlConfig.getInstance().getEntry("config.gameExport.signature"))
               {
                  output = new ByteArray();
                  try
                  {
                     signedData = Base64.decodeToByteArray(XmlConfig.getInstance().getEntry("config.gameExport.signature"));
                     signedData.position = signedData.length;
                     signedData.writeUTFBytes(configGameExport);
                     signedData.position = 0;
                     signature = new Signature(SignedFileAdapter.defaultSignatureKey);
                     signatureIsValid = signature.verify(signedData,output);
                  }
                  catch(error:Error)
                  {
                     _log.error("gameExport signature has not been properly encoded in Base64.");
                  }
                  if(signatureIsValid)
                  {
                     base_url = configGameExport;
                  }
               }
               else
               {
                  _log.error("gameExport needs to be signed!");
               }
            }
            else
            {
               base_url = configGameExport;
            }
         }
         this._urlDareList = new Uri(base_url + "DareListMessage." + serverId + ".data");
         this._urlDareVersatileList = new Uri(base_url + "DareVersatileListMessage." + serverId + ".data");
         ConnectionsHandler.getHttpConnection().addToWhiteList(DareVersatileListMessage);
         ConnectionsHandler.getHttpConnection().addToWhiteList(DareListMessage);
         ConnectionsHandler.getHttpConnection().resetTime(this._urlDareList);
         ConnectionsHandler.getHttpConnection().resetTime(this._urlDareVersatileList);
         this.onDareListRequest(null);
      }
      
      public static function getInstance() : DareFrame
      {
         return _instance;
      }
      
      override public function get priority() : int
      {
         return Priority.NORMAL;
      }
      
      public function get dareList() : Vector.<DareWrapper>
      {
         return this._dareList;
      }
      
      public function getDareById(id:Number) : DareWrapper
      {
         return this._dareListById[id];
      }
      
      public function getTotalDaresInSubArea(subAreaId:uint) : uint
      {
         if(this._dareIdsBySubAreaId[subAreaId])
         {
            return this._dareIdsBySubAreaId[subAreaId].length;
         }
         return 0;
      }
      
      public function getTotalGuildDares() : uint
      {
         return this._totalGuildDares;
      }
      
      public function getTotalAllianceDares() : uint
      {
         return this._totalAllianceDares;
      }
      
      public function getTargetedMonsterIdsInSubArea(subAreaId:uint) : Vector.<int>
      {
         if(this._monsterIdsBySubAreaId[subAreaId])
         {
            return this._monsterIdsBySubAreaId[subAreaId];
         }
         return null;
      }
      
      public function get dareRewardsWon() : Vector.<DareReward>
      {
         return this._dareRewardsWon;
      }
      
      override protected function registerMessages() : void
      {
         register(DareListRequestAction,this.onDareListRequest);
         register(DareListMessage,this.onDareListMessage);
         register(DareVersatileListMessage,this.onDareVersatileListMessage);
         register(DareSubscribedListMessage,this.onDareSubscribedListMessage);
         register(DareCreatedListMessage,this.onDareCreatedListMessage);
         register(DareWonListMessage,this.onDareWonListMessage);
         register(DareWonMessage,this.onDareWonMessage);
         register(DareInformationsRequestAction,this.onDareInformationsRequest);
         register(DareInformationsMessage,this.onDareInformationsMessage);
         register(DareErrorMessage,this.onDareErrorMessage);
         register(DareSubscribeRequestAction,this.onDareSubscribeRequest);
         register(DareSubscribedMessage,this.onDareSubscribedMessage);
         register(DareCreationRequestAction,this.onDareCreationRequest);
         register(DareCreatedMessage,this.onDareCreatedMessage);
         register(DareCancelRequestAction,this.onDareCancelRequest);
         register(DareCanceledMessage,this.onDareCanceledMessage);
         register(DareRewardRequestAction,this.onDareRewardRequestAction);
         register(DareRewardsListMessage,this.onRewardListMessage);
         register(DareRewardWonMessage,this.onRewardWonMessage);
         register(DareRewardConsumeValidationMessage,this.onDareRewardConsumeValidationMessage);
      }
      
      private function onDareListRequest(a:DareListRequestAction) : Boolean
      {
         var newStaticRequest:Boolean = ConnectionsHandler.getHttpConnection().request(this._urlDareList,this.onDareIoError,this.staticDataLifetime);
         if(newStaticRequest)
         {
            this._waitStaticDareInfo = true;
         }
         var newVersatileRequest:Boolean = ConnectionsHandler.getHttpConnection().request(this._urlDareVersatileList,this.onDareVersatileIoError,this.versatileDataLifetime);
         if(newVersatileRequest)
         {
            this._waitVersatileDareInfo = true;
         }
         if(!this._waitVersatileDareInfo && !this._waitStaticDareInfo)
         {
            this.dispatchDareList();
         }
         return true;
      }
      
      private function onDareListMessage(m:DareListMessage) : Boolean
      {
         var dw:DareWrapper = null;
         var currentTime:Number = NaN;
         var oldHiddenIds:Array = null;
         var hiddenIds:Array = null;
         var hidden:String = null;
         var len:uint = 0;
         var list:Vector.<DareInformations> = null;
         var i:uint = 0;
         var dw2:DareWrapper = null;
         var endDate:Number = NaN;
         var oldDw:DareWrapper = null;
         var ts:uint = getTimer();
         var dareSubscribedOrCreatedList:Dictionary = new Dictionary(true);
         for each(dw in this._dareList)
         {
            if(dw.subscribed || dw.isMyCreation)
            {
               dareSubscribedOrCreatedList[dw.dareId] = dw;
            }
         }
         this._dareList = new Vector.<DareWrapper>();
         this._dareListById = new Dictionary(true);
         this._dareIdsBySubAreaId = new Dictionary(true);
         this._monsterIdsBySubAreaId = new Dictionary(true);
         this._monsterTotalDaresBySubAreaId = new Dictionary(true);
         this._totalGuildDares = 0;
         this._totalAllianceDares = 0;
         currentTime = new Date().time;
         oldHiddenIds = StoreDataManager.getInstance().getData(_datastoreType,"HiddenDaresIds");
         hiddenIds = new Array();
         for each(hidden in oldHiddenIds)
         {
            endDate = Number(hidden.split("_")[1]);
            if(endDate >= currentTime)
            {
               hiddenIds.push(hidden);
            }
         }
         StoreDataManager.getInstance().setData(_datastoreType,"HiddenDaresIds",hiddenIds);
         len = m.dares.length;
         list = m.dares;
         for(i = 0; i < len; i++)
         {
            this._dareList[i] = DareWrapper.getFromNetwork(list[i]);
            oldDw = dareSubscribedOrCreatedList[this._dareList[i].dareId];
            if(oldDw)
            {
               this._dareList[i].subscribed = oldDw.subscribed;
               dareSubscribedOrCreatedList[this._dareList[i].dareId] = null;
            }
            this.updateDictionnariesWithDareInfo(this._dareList[i],currentTime);
         }
         for each(dw2 in dareSubscribedOrCreatedList)
         {
            if(dw2)
            {
               this._dareList.push(dw2);
               this.updateDictionnariesWithDareInfo(dw2,currentTime);
            }
         }
         this._waitStaticDareInfo = false;
         _log.warn("Liste des " + len + " défis traitée en " + (getTimer() - ts) + " ms");
         this.dispatchDareList(true);
         return true;
      }
      
      private function onDareVersatileListMessage(m:DareVersatileListMessage) : Boolean
      {
         var dare:DareWrapper = null;
         var dareIndex:int = 0;
         var newdw:DareWrapper = null;
         var ts:uint = getTimer();
         var len:uint = m.dares.length;
         var list:Vector.<DareVersatileInformations> = m.dares;
         var currentTime:Number = new Date().time;
         for(var i:uint = 0; i < len; i++)
         {
            dareIndex = -1;
            for each(dare in this._dareList)
            {
               if(dare.dareId == list[i].dareId)
               {
                  dareIndex = this._dareList.indexOf(dare);
                  break;
               }
            }
            if(dareIndex != -1)
            {
               this._dareList[dareIndex] = DareWrapper.getFromNetwork(list[i]);
               this._dareListById[this._dareList[dareIndex].dareId] = this._dareList[dareIndex];
            }
            else
            {
               newdw = DareWrapper.getFromNetwork(list[i]);
               this._dareList.push(newdw);
               this.updateDictionnariesWithDareInfo(newdw,currentTime);
            }
         }
         this._waitVersatileDareInfo = false;
         _log.warn("Liste des infos versatiles de " + len + " défis traitée en " + (getTimer() - ts) + " ms");
         this.dispatchDareList(true);
         return true;
      }
      
      private function onDareSubscribedListMessage(m:DareSubscribedListMessage) : Boolean
      {
         var dare:DareWrapper = null;
         var dareIndex:int = 0;
         var ts:uint = getTimer();
         var len:uint = m.daresFixedInfos.length;
         var listFixed:Vector.<DareInformations> = m.daresFixedInfos;
         var listVersatile:Vector.<DareVersatileInformations> = m.daresVersatilesInfos;
         var currentTime:Number = new Date().time;
         for(var i:uint = 0; i < len; i++)
         {
            dareIndex = -1;
            for each(dare in this._dareList)
            {
               if(dare.dareId == listFixed[i].dareId)
               {
                  dareIndex = this._dareList.indexOf(dare);
                  break;
               }
            }
            if(dareIndex != -1)
            {
               this._dareList[dareIndex] = DareWrapper.getFromNetwork(listFixed[i]);
               this._dareList[dareIndex] = DareWrapper.getFromNetwork(listVersatile[i]);
               this._dareList[dareIndex].subscribed = true;
               this._dareListById[this._dareList[dareIndex].dareId] = this._dareList[dareIndex];
            }
            else
            {
               dare = DareWrapper.getFromNetwork(listFixed[i]);
               dare = DareWrapper.getFromNetwork(listVersatile[i]);
               dare.subscribed = true;
               this._dareList.push(dare);
               this.updateDictionnariesWithDareInfo(dare,currentTime);
            }
         }
         _log.warn("Liste des " + len + " défis auxquels on est inscrit traitée en " + (getTimer() - ts) + " ms");
         this.dispatchDareList(true);
         return true;
      }
      
      private function onDareCreatedListMessage(m:DareCreatedListMessage) : Boolean
      {
         var dare:DareWrapper = null;
         var dareIndex:int = 0;
         var ts:uint = getTimer();
         var len:uint = m.daresFixedInfos.length;
         var listFixed:Vector.<DareInformations> = m.daresFixedInfos;
         var listVersatile:Vector.<DareVersatileInformations> = m.daresVersatilesInfos;
         var currentTime:Number = new Date().time;
         for(var i:uint = 0; i < len; i++)
         {
            dareIndex = -1;
            for each(dare in this._dareList)
            {
               if(dare.dareId == listFixed[i].dareId)
               {
                  dareIndex = this._dareList.indexOf(dare);
                  break;
               }
            }
            if(dareIndex != -1)
            {
               this._dareList[dareIndex] = DareWrapper.getFromNetwork(listFixed[i]);
               this._dareList[dareIndex] = DareWrapper.getFromNetwork(listVersatile[i]);
               this._dareListById[this._dareList[dareIndex].dareId] = this._dareList[dareIndex];
            }
            else
            {
               dare = DareWrapper.getFromNetwork(listFixed[i]);
               dare = DareWrapper.getFromNetwork(listVersatile[i]);
               this._dareList.push(dare);
               this.updateDictionnariesWithDareInfo(dare,currentTime);
            }
         }
         _log.warn("Liste des " + len + " défis créés pas nous traitée en " + (getTimer() - ts) + " ms");
         this.dispatchDareList(true);
         return true;
      }
      
      private function onDareWonListMessage(m:DareWonListMessage) : Boolean
      {
         var dare:DareWrapper = null;
         var ts:uint = getTimer();
         var dareIds:Vector.<Number> = m.dareId;
         var len:uint = m.dareId.length;
         for(var i:uint = 0; i < len; i++)
         {
            dare = this._dareListById[dareIds[i]];
            if(dare)
            {
               dare.won = true;
            }
            else
            {
               _log.error("Failed to update \'hasBeenWon\' property for dareId " + dareIds[i] + ", DareWrapper instance doesn\'t exist!");
            }
         }
         _log.warn("Liste des " + len + " défis gagnés traitée en " + (getTimer() - ts) + " ms");
         return true;
      }
      
      private function onDareWonMessage(m:DareWonMessage) : Boolean
      {
         var dare:DareWrapper = this._dareListById[m.dareId];
         if(dare)
         {
            dare.won = true;
            KernelEventsManager.getInstance().processCallback(SocialHookList.DareWon,dare.dareId);
            KernelEventsManager.getInstance().processCallback(SocialHookList.DareUpdated,dare.dareId);
         }
         else
         {
            _log.error("Failed to update \'won\' property for dareId " + m.dareId + ", DareWrapper instance doesn\'t exist!");
         }
         return true;
      }
      
      private function onDareInformationsRequest(a:DareInformationsRequestAction) : Boolean
      {
         var dirmsg:DareInformationsRequestMessage = new DareInformationsRequestMessage();
         dirmsg.initDareInformationsRequestMessage(a.dareId);
         ConnectionsHandler.getConnection().send(dirmsg);
         return true;
      }
      
      private function onDareInformationsMessage(m:DareInformationsMessage) : Boolean
      {
         var dare:DareWrapper = null;
         var dareIndex:int = -1;
         for each(dare in this._dareList)
         {
            if(dare.dareId == m.dareFixedInfos.dareId)
            {
               dareIndex = this._dareList.indexOf(dare);
               break;
            }
         }
         if(dareIndex != -1)
         {
            this._dareList[dareIndex] = DareWrapper.getFromNetwork(m.dareFixedInfos);
            this._dareList[dareIndex] = DareWrapper.getFromNetwork(m.dareVersatilesInfos);
            this._dareListById[this._dareList[dareIndex].dareId] = this._dareList[dareIndex];
         }
         else
         {
            dare = DareWrapper.getFromNetwork(m.dareFixedInfos);
            dare = DareWrapper.getFromNetwork(m.dareVersatilesInfos);
            this._dareList.push(dare);
            this.updateDictionnariesWithDareInfo(dare);
         }
         var currentDate:Date = new Date();
         var playedCharacterManager:PlayedCharacterManager = PlayedCharacterManager.getInstance();
         var playerInfo:Object = {
            "playerId":playedCharacterManager.id,
            "playerBreed":playedCharacterManager.infos.breed,
            "playerLevel":playedCharacterManager.limitedLevel,
            "playerKamas":playedCharacterManager.characteristics.kamas,
            "playerGuildId":(!!SocialFrame.getInstance().hasGuild?SocialFrame.getInstance().guild.guildId:0),
            "playerAllianceId":(!!AllianceFrame.getInstance().hasAlliance?AllianceFrame.getInstance().alliance.allianceId:0),
            "currentTime":currentDate.time
         };
         this.setDareSubscribable(dare,playerInfo);
         KernelEventsManager.getInstance().processCallback(SocialHookList.DareUpdated,m.dareFixedInfos.dareId);
         return true;
      }
      
      private function onDareSubscribeRequest(a:DareSubscribeRequestAction) : Boolean
      {
         var dsrmsg:DareSubscribeRequestMessage = new DareSubscribeRequestMessage();
         dsrmsg.initDareSubscribeRequestMessage(a.dareId,a.subscribe);
         ConnectionsHandler.getConnection().send(dsrmsg);
         return true;
      }
      
      private function onDareSubscribedMessage(m:DareSubscribedMessage) : Boolean
      {
         var dare:DareWrapper = null;
         var monsterLink:* = null;
         var dareLink:* = null;
         var text:String = null;
         var currentDate:Date = null;
         var playedCharacterManager:PlayedCharacterManager = null;
         var playerInfo:Object = null;
         var dareIndex:int = -1;
         for each(dare in this._dareList)
         {
            if(dare.dareId == m.dareVersatilesInfos.dareId)
            {
               dareIndex = this._dareList.indexOf(dare);
               break;
            }
         }
         if(dareIndex != -1)
         {
            this._dareList[dareIndex] = DareWrapper.getFromNetwork(m.dareVersatilesInfos);
            if(m.success)
            {
               this._dareList[dareIndex].subscribed = m.subscribe;
            }
            this._dareListById[this._dareList[dareIndex].dareId] = this._dareList[dareIndex];
         }
         else
         {
            dare = DareWrapper.getFromNetwork(m.dareVersatilesInfos);
            if(m.success)
            {
               dare.subscribed = m.subscribe;
            }
            this._dareList.push(dare);
            this.updateDictionnariesWithDareInfo(dare);
         }
         if(m.success)
         {
            dare = this.getDareById(m.dareId);
            if(!dare)
            {
               _log.error("Le défi " + m.dareId + " accepté ne semble pas exister !");
               return true;
            }
            if(!m.subscribe)
            {
               currentDate = new Date();
               playedCharacterManager = PlayedCharacterManager.getInstance();
               playerInfo = {
                  "playerId":playedCharacterManager.id,
                  "playerBreed":playedCharacterManager.infos.breed,
                  "playerLevel":playedCharacterManager.limitedLevel,
                  "playerKamas":playedCharacterManager.characteristics.kamas,
                  "playerGuildId":(!!SocialFrame.getInstance().hasGuild?SocialFrame.getInstance().guild.guildId:0),
                  "playerAllianceId":(!!AllianceFrame.getInstance().hasAlliance?AllianceFrame.getInstance().alliance.allianceId:0),
                  "currentTime":currentDate.time
               };
               this.setDareSubscribable(dare,playerInfo);
            }
            monsterLink = "{chatmonster," + dare.monster.id + "}";
            dareLink = "{chatdare," + dare.dareId + "}";
            if(m.subscribe)
            {
               text = I18n.getUiText("ui.dare.chat.subscribed",[dareLink,monsterLink]);
            }
            else
            {
               text = I18n.getUiText("ui.dare.chat.unsubscribed",[dareLink,monsterLink]);
            }
            KernelEventsManager.getInstance().processCallback(ChatHookList.TextInformation,text,ChatActivableChannelsEnum.PSEUDO_CHANNEL_INFO,TimeManager.getInstance().getTimestamp());
         }
         KernelEventsManager.getInstance().processCallback(SocialHookList.DareUpdated,m.dareId);
         return true;
      }
      
      private function onDareCreationRequest(a:DareCreationRequestAction) : Boolean
      {
         var type:int = 0;
         var dc:DareCriteria = null;
         var serverCriteria:Vector.<DareCriteria> = new Vector.<DareCriteria>();
         var criteriaLength:int = a.criteria.length;
         for(var i:int = 0; i < criteriaLength; )
         {
            dc = new DareCriteria();
            type = a.criteria[i].shift();
            if(a.criteria[i] && a.criteria[i].length && a.criteria[i][0])
            {
               dc.initDareCriteria(type,a.criteria[i]);
               serverCriteria.push(dc);
            }
            i++;
         }
         var dcrmsg:DareCreationRequestMessage = new DareCreationRequestMessage();
         dcrmsg.initDareCreationRequestMessage(a.subscriptionFee,a.jackpot,a.maxCountWinners,a.delayBeforeStart,a.duration,a.isPrivate,a.isForGuild,a.isForAlliance,a.needNotifications,serverCriteria);
         ConnectionsHandler.getConnection().send(dcrmsg);
         return true;
      }
      
      private function onDareCreatedMessage(m:DareCreatedMessage) : Boolean
      {
         var monsterLink:* = null;
         var crit:DareCriteria = null;
         var dareLink:* = null;
         var text:String = null;
         var dare:DareWrapper = DareWrapper.getFromNetwork(m.dareInfos);
         this._dareList.push(dare);
         this.updateDictionnariesWithDareInfo(dare);
         _log.debug(" - Enregistrement d\'un nouveau défi créé " + dare);
         KernelEventsManager.getInstance().processCallback(SocialHookList.DareCreated,true,m.dareInfos.dareId);
         for each(crit in m.dareInfos.criterions)
         {
            if(crit.type == DareCriteriaTypeEnum.MONSTER_ID)
            {
               monsterLink = "{chatmonster," + crit.params[0] + "}";
               break;
            }
         }
         dareLink = "{chatdare," + dare.dareId + "}";
         text = I18n.getUiText("ui.dare.chat.created",[dareLink,monsterLink]);
         KernelEventsManager.getInstance().processCallback(ChatHookList.TextInformation,text,ChatActivableChannelsEnum.PSEUDO_CHANNEL_INFO,TimeManager.getInstance().getTimestamp());
         return true;
      }
      
      private function onDareCancelRequest(a:DareCancelRequestAction) : Boolean
      {
         var dcrmsg:DareCancelRequestMessage = new DareCancelRequestMessage();
         dcrmsg.initDareCancelRequestMessage(a.dareId);
         ConnectionsHandler.getConnection().send(dcrmsg);
         return true;
      }
      
      private function onDareCanceledMessage(m:DareCanceledMessage) : Boolean
      {
         var monterIds:Vector.<int> = null;
         var dareIdsInSubArea:Vector.<Number> = null;
         var subAreaMonsterKey:String = null;
         var subAreaId:uint = 0;
         var dare:DareWrapper = this._dareListById[m.dareId];
         var index:int = this._dareList.indexOf(dare);
         _log.debug("Suppression du défi " + m.dareId + " à l\'index " + index);
         var monsterLink:* = "{chatmonster," + dare.monster.id + "}";
         this._dareListById[dare.dareId] = null;
         this._dareList.splice(index,1);
         var subAreaIds:Vector.<uint> = dare.monster.subareas;
         for each(subAreaId in subAreaIds)
         {
            dareIdsInSubArea = this._dareIdsBySubAreaId[subAreaId];
            if(dareIdsInSubArea)
            {
               index = dareIdsInSubArea.indexOf(dare.dareId);
               if(index != -1)
               {
                  dareIdsInSubArea.splice(index,1);
               }
               subAreaMonsterKey = subAreaId + "_" + dare.monster.id;
               if(this._monsterTotalDaresBySubAreaId[subAreaMonsterKey])
               {
                  this._monsterTotalDaresBySubAreaId[subAreaMonsterKey]--;
                  if(this._monsterTotalDaresBySubAreaId[subAreaMonsterKey] == 0)
                  {
                     monterIds = this._monsterIdsBySubAreaId[subAreaId];
                     index = monterIds.indexOf(dare.monster.id);
                     if(index != -1)
                     {
                        monterIds.splice(index,1);
                     }
                  }
               }
            }
         }
         if(SocialFrame.getInstance().hasGuild)
         {
            if(dare.guildId && dare.guildId == SocialFrame.getInstance().guild.guildId)
            {
               this._totalGuildDares--;
            }
         }
         else
         {
            this._totalGuildDares = 0;
         }
         if(AllianceFrame.getInstance().hasAlliance)
         {
            if(dare.allianceId && dare.allianceId == AllianceFrame.getInstance().alliance.allianceId)
            {
               this._totalAllianceDares--;
            }
         }
         else
         {
            this._totalAllianceDares = 0;
         }
         this.dispatchDareList(true);
         dare = null;
         KernelEventsManager.getInstance().processCallback(SocialHookList.DareUpdated,m.dareId);
         var text:String = I18n.getUiText("ui.dare.chat.cancelled",[m.dareId,monsterLink]);
         KernelEventsManager.getInstance().processCallback(ChatHookList.TextInformation,text,ChatActivableChannelsEnum.PSEUDO_CHANNEL_INFO,TimeManager.getInstance().getTimestamp());
         return true;
      }
      
      private function onDareErrorMessage(m:DareErrorMessage) : Boolean
      {
         if(m.error == DareErrorEnum.DARE_CREATION_FAILED)
         {
            KernelEventsManager.getInstance().processCallback(SocialHookList.DareCreated,false);
         }
         return true;
      }
      
      private function onRewardListMessage(m:DareRewardsListMessage) : Boolean
      {
         this._dareRewardsWon = this._dareRewardsWon.concat(m.rewards);
         if(this._dareRewardsWon.length > 0)
         {
            KernelEventsManager.getInstance().processCallback(SocialHookList.DareRewardVisible,true);
         }
         return true;
      }
      
      private function onRewardWonMessage(m:DareRewardWonMessage) : Boolean
      {
         this._dareRewardsWon.push(m.reward);
         if(this._dareRewardsWon.length > 0)
         {
            KernelEventsManager.getInstance().processCallback(SocialHookList.DareRewardVisible,true);
         }
         return true;
      }
      
      private function onDareRewardRequestAction(m:DareRewardRequestAction) : Boolean
      {
         var drra:DareRewardRequestAction = m as DareRewardRequestAction;
         var rcrm:DareRewardConsumeRequestMessage = new DareRewardConsumeRequestMessage();
         rcrm.initDareRewardConsumeRequestMessage(drra.dareId,drra.dareRewardType);
         ConnectionsHandler.getConnection().send(rcrm);
         return true;
      }
      
      private function onDareRewardConsumeValidationMessage(m:DareRewardConsumeValidationMessage) : Boolean
      {
         var dareRewardIndex:int = 0;
         var dareReward:DareReward = null;
         var drcvm:DareRewardConsumeValidationMessage = m as DareRewardConsumeValidationMessage;
         var foundDareReward:Boolean = false;
         for each(dareReward in this._dareRewardsWon)
         {
            if(dareReward.dareId == drcvm.dareId && dareReward.type == drcvm.type)
            {
               dareRewardIndex = this._dareRewardsWon.indexOf(dareReward);
               foundDareReward = true;
               break;
            }
         }
         if(foundDareReward)
         {
            this._dareRewardsWon.splice(dareRewardIndex,1);
         }
         if(this._dareRewardsWon.length <= 0)
         {
            KernelEventsManager.getInstance().processCallback(SocialHookList.DareRewardVisible,false);
         }
         KernelEventsManager.getInstance().processCallback(SocialHookList.DareRewardSuccess);
         return true;
      }
      
      private function dispatchDareList(isUpdate:Boolean = false, isError:Boolean = false) : void
      {
         var dw:DareWrapper = null;
         if(this._waitStaticDareInfo || this._waitVersatileDareInfo)
         {
            return;
         }
         for each(dw in this._dareList)
         {
            DareWrapper.updateRef(dw.dareId,dw);
         }
         KernelEventsManager.getInstance().processCallback(SocialHookList.DareListUpdated);
      }
      
      private function updateDictionnariesWithDareInfo(dare:DareWrapper, currentTime:Number = 0) : void
      {
         var subAreaId:uint = 0;
         var subAreaMonsterKey:String = null;
         var index:int = 0;
         this._dareListById[dare.dareId] = dare;
         if(!dare.monster)
         {
            return;
         }
         if(!currentTime)
         {
            currentTime = new Date().time;
         }
         if(SocialFrame.getInstance().hasGuild)
         {
            if(dare.guildId && dare.guildId == SocialFrame.getInstance().guild.guildId)
            {
               this._totalGuildDares++;
            }
         }
         else
         {
            this._totalGuildDares = 0;
         }
         if(AllianceFrame.getInstance().hasAlliance)
         {
            if(dare.allianceId && dare.allianceId == AllianceFrame.getInstance().alliance.allianceId)
            {
               this._totalAllianceDares++;
            }
         }
         else
         {
            this._totalAllianceDares = 0;
         }
         var monsterId:int = dare.monster.id;
         var subAreaIds:Vector.<uint> = dare.monster.subareas;
         for(var j:int = 0; j < subAreaIds.length; )
         {
            subAreaId = subAreaIds[j];
            subAreaMonsterKey = subAreaId + "_" + monsterId;
            if(dare.isOngoing(currentTime))
            {
               if(!this._dareIdsBySubAreaId[subAreaId])
               {
                  this._dareIdsBySubAreaId[subAreaId] = new Vector.<Number>();
               }
               if(this._dareIdsBySubAreaId[subAreaId].indexOf(dare.dareId) == -1)
               {
                  this._dareIdsBySubAreaId[subAreaId].push(dare.dareId);
               }
               if(!this._monsterIdsBySubAreaId[subAreaId])
               {
                  this._monsterIdsBySubAreaId[subAreaId] = new Vector.<int>();
               }
               if(this._monsterIdsBySubAreaId[subAreaId].indexOf(monsterId) == -1)
               {
                  this._monsterIdsBySubAreaId[subAreaId].push(monsterId);
               }
               if(!this._monsterTotalDaresBySubAreaId[subAreaMonsterKey])
               {
                  this._monsterTotalDaresBySubAreaId[subAreaMonsterKey] = 1;
               }
               else
               {
                  this._monsterTotalDaresBySubAreaId[subAreaMonsterKey]++;
               }
            }
            else
            {
               if(this._dareIdsBySubAreaId[subAreaId])
               {
                  index = this._dareIdsBySubAreaId[subAreaId].indexOf(dare.dareId);
                  if(index != -1)
                  {
                     (this._dareIdsBySubAreaId[subAreaId] as Vector.<Number>).splice(index,1);
                  }
               }
               if(this._monsterIdsBySubAreaId[subAreaId])
               {
                  index = this._monsterIdsBySubAreaId[subAreaId].indexOf(monsterId);
                  if(index != -1)
                  {
                     (this._monsterIdsBySubAreaId[subAreaId] as Vector.<int>).splice(index,1);
                  }
               }
               if(this._monsterTotalDaresBySubAreaId[subAreaMonsterKey])
               {
                  this._monsterTotalDaresBySubAreaId[subAreaMonsterKey]--;
               }
            }
            j++;
         }
      }
      
      public function setDareSubscribable(dare:DareWrapper, playerInfo:Object) : void
      {
         var crit:DareCriteriaWrapper = null;
         var subscribable:Boolean = true;
         var subscribableErrors:Array = new Array();
         if(dare.subscribed)
         {
            subscribable = false;
         }
         if(dare.endDate < playerInfo.currentTime)
         {
            subscribable = false;
            subscribableErrors.push(DareSubscribeErrorEnum.TIME_OVER);
         }
         if(dare.maxCountWinners && dare.countWinners >= dare.maxCountWinners)
         {
            subscribable = false;
            subscribableErrors.push(DareSubscribeErrorEnum.NO_MORE_WINNERS);
         }
         if(playerInfo.playerKamas < dare.subscriptionFee)
         {
            subscribable = false;
            subscribableErrors.push(DareSubscribeErrorEnum.NOT_ENOUGH_MONEY);
         }
         if(dare.guildId > 0 && dare.guildId != playerInfo.playerGuildId)
         {
            subscribable = false;
            subscribableErrors.push(DareSubscribeErrorEnum.GUILD_LIMITED);
         }
         if(dare.allianceId > 0 && dare.allianceId != playerInfo.playerAllianceId)
         {
            subscribable = false;
            subscribableErrors.push(DareSubscribeErrorEnum.ALLIANCE_LIMITED);
         }
         if(dare.creatorId == playerInfo.playerId)
         {
            subscribable = false;
         }
         for each(crit in dare.criteria)
         {
            if(crit.type == DareCriteriaTypeEnum.FORBIDDEN_BREEDS && crit.params.indexOf(playerInfo.playerBreed) != -1)
            {
               subscribable = false;
               subscribableErrors.push(DareSubscribeErrorEnum.BREED_LIMITED);
            }
            if(crit.type == DareCriteriaTypeEnum.MAX_CHAR_LVL && playerInfo.playerLevel > crit.params[0])
            {
               subscribable = false;
               subscribableErrors.push(DareSubscribeErrorEnum.LEVEL_TOO_HIGH);
            }
         }
         dare.subscribable = subscribable;
         dare.subscribableErrors = subscribableErrors;
      }
      
      private function onDareIoError() : void
      {
         _log.error("Impossible d\'accéder aux données static de liste de défis communautaires");
         this._waitStaticDareInfo = false;
         this.dispatchDareList(false,true);
      }
      
      private function onDareVersatileIoError() : void
      {
         _log.error("Impossible d\'accéder aux données versatile de liste de défis communautaires");
         this._waitVersatileDareInfo = false;
         this.dispatchDareList(false,true);
      }
   }
}
