package com.ankamagames.dofus.uiApi
{
   import com.ankamagames.berilia.interfaces.IApi;
   import com.ankamagames.berilia.types.data.UiModule;
   import com.ankamagames.dofus.internalDatacenter.communication.BasicChatSentence;
   import com.ankamagames.dofus.internalDatacenter.conquest.PrismSubAreaWrapper;
   import com.ankamagames.dofus.internalDatacenter.dare.DareWrapper;
   import com.ankamagames.dofus.internalDatacenter.guild.AllianceWrapper;
   import com.ankamagames.dofus.internalDatacenter.guild.GuildFactSheetWrapper;
   import com.ankamagames.dofus.internalDatacenter.guild.GuildWrapper;
   import com.ankamagames.dofus.internalDatacenter.guild.SocialEntityInFightWrapper;
   import com.ankamagames.dofus.internalDatacenter.guild.SocialFightersWrapper;
   import com.ankamagames.dofus.internalDatacenter.guild.TaxCollectorWrapper;
   import com.ankamagames.dofus.internalDatacenter.people.ContactWrapper;
   import com.ankamagames.dofus.internalDatacenter.people.EnemyWrapper;
   import com.ankamagames.dofus.internalDatacenter.people.FriendWrapper;
   import com.ankamagames.dofus.internalDatacenter.people.IgnoredWrapper;
   import com.ankamagames.dofus.internalDatacenter.people.SpouseWrapper;
   import com.ankamagames.dofus.kernel.Kernel;
   import com.ankamagames.dofus.logic.game.common.actions.dare.DareInformationsRequestAction;
   import com.ankamagames.dofus.logic.game.common.frames.AllianceFrame;
   import com.ankamagames.dofus.logic.game.common.frames.ChatFrame;
   import com.ankamagames.dofus.logic.game.common.frames.DareFrame;
   import com.ankamagames.dofus.logic.game.common.frames.PlayedCharacterUpdatesFrame;
   import com.ankamagames.dofus.logic.game.common.frames.SocialFrame;
   import com.ankamagames.dofus.logic.game.common.managers.PlayedCharacterManager;
   import com.ankamagames.dofus.logic.game.common.managers.TaxCollectorsManager;
   import com.ankamagames.dofus.network.types.game.dare.DareReward;
   import com.ankamagames.dofus.network.types.game.guild.GuildMember;
   import com.ankamagames.dofus.network.types.game.prism.AllianceInsiderPrismInformation;
   import com.ankamagames.dofus.network.types.game.prism.AlliancePrismInformation;
   import com.ankamagames.dofus.network.types.game.prism.PrismInformation;
   import com.ankamagames.jerakine.data.I18n;
   import com.ankamagames.jerakine.logger.Log;
   import com.ankamagames.jerakine.logger.Logger;
   import com.ankamagames.jerakine.managers.StoreDataManager;
   import com.ankamagames.jerakine.types.DataStoreType;
   import com.ankamagames.jerakine.types.enums.DataStoreEnum;
   import com.ankamagames.jerakine.utils.misc.StringUtils;
   import flash.utils.Dictionary;
   import flash.utils.getQualifiedClassName;
   
   [InstanciedApi]
   public class SocialApi implements IApi
   {
      
      private static var _datastoreType:DataStoreType = new DataStoreType("Module_Ankama_Social",true,DataStoreEnum.LOCATION_LOCAL,DataStoreEnum.BIND_CHARACTER);
       
      
      protected var _log:Logger;
      
      private var _module:UiModule;
      
      public function SocialApi()
      {
         this._log = Log.getLogger(getQualifiedClassName(SocialApi));
         super();
      }
      
      public static function get dareFrame() : DareFrame
      {
         return DareFrame.getInstance();
      }
      
      [ApiData(name="module")]
      public function set module(value:UiModule) : void
      {
         this._module = value;
      }
      
      public function get socialFrame() : SocialFrame
      {
         return SocialFrame.getInstance();
      }
      
      public function get allianceFrame() : AllianceFrame
      {
         return AllianceFrame.getInstance();
      }
      
      [Trusted]
      public function destroy() : void
      {
         this._module = null;
      }
      
      [Trusted]
      public function hasSocialFrame() : Boolean
      {
         return this.socialFrame != null;
      }
      
      [Untrusted]
      public function getFriendsList() : Array
      {
         var friend:FriendWrapper = null;
         var fl:Array = new Array();
         var friendsList:Array = this.socialFrame.friendsList;
         for each(friend in friendsList)
         {
            fl.push(friend);
         }
         fl.sortOn("name",Array.CASEINSENSITIVE);
         return fl;
      }
      
      [Untrusted]
      public function getContactsList() : Array
      {
         var contact:ContactWrapper = null;
         var cl:Array = new Array();
         var contactList:Array = this.socialFrame.contactsList;
         for each(contact in contactList)
         {
            cl.push(contact);
         }
         cl.sortOn("name",Array.CASEINSENSITIVE);
         return cl;
      }
      
      [Untrusted]
      public function isFriend(playerName:String) : Boolean
      {
         return this.socialFrame.isFriend(playerName);
      }
      
      [Untrusted]
      public function isContact(playerName:String) : Boolean
      {
         return this.socialFrame.isContact(playerName);
      }
      
      [Untrusted]
      public function isFriendOrContact(playerName:String) : Boolean
      {
         return this.socialFrame.isFriendOrContact(playerName);
      }
      
      [Untrusted]
      public function getEnemiesList() : Array
      {
         var enemy:EnemyWrapper = null;
         var el:Array = new Array();
         for each(enemy in this.socialFrame.enemiesList)
         {
            el.push(enemy);
         }
         el.sortOn("name",Array.CASEINSENSITIVE);
         return el;
      }
      
      [Untrusted]
      public function isEnemy(playerName:String) : Boolean
      {
         return this.socialFrame.isEnemy(playerName);
      }
      
      [Untrusted]
      public function getIgnoredList() : Array
      {
         var ignored:IgnoredWrapper = null;
         var il:Array = new Array();
         for each(ignored in this.socialFrame.ignoredList)
         {
            il.push(ignored);
         }
         il.sortOn("name",Array.CASEINSENSITIVE);
         return il;
      }
      
      [Untrusted]
      public function isIgnored(name:String, accountId:int = 0) : Boolean
      {
         return this.socialFrame.isIgnored(name,accountId);
      }
      
      [Trusted]
      public function getAccountName(name:String) : String
      {
         return name;
      }
      
      [Untrusted]
      public function getWarnOnFriendConnec() : Boolean
      {
         return this.socialFrame.warnFriendConnec;
      }
      
      [Untrusted]
      public function getShareStatus() : Boolean
      {
         return this.socialFrame.shareStatus;
      }
      
      [Untrusted]
      public function getWarnOnMemberConnec() : Boolean
      {
         return this.socialFrame.warnMemberConnec;
      }
      
      [Untrusted]
      public function getWarnWhenFriendOrGuildMemberLvlUp() : Boolean
      {
         return this.socialFrame.warnWhenFriendOrGuildMemberLvlUp;
      }
      
      [Untrusted]
      public function getWarnWhenFriendOrGuildMemberAchieve() : Boolean
      {
         return this.socialFrame.warnWhenFriendOrGuildMemberAchieve;
      }
      
      [Untrusted]
      public function getWarnOnHardcoreDeath() : Boolean
      {
         return this.socialFrame.warnOnHardcoreDeath;
      }
      
      [Untrusted]
      public function getSpouse() : SpouseWrapper
      {
         return this.socialFrame.spouse;
      }
      
      [Untrusted]
      public function hasSpouse() : Boolean
      {
         return this.socialFrame.hasSpouse;
      }
      
      [Untrusted]
      public function getAllowedGuildEmblemSymbolCategories() : int
      {
         var playerFrame:PlayedCharacterUpdatesFrame = Kernel.getWorker().getFrame(PlayedCharacterUpdatesFrame) as PlayedCharacterUpdatesFrame;
         return playerFrame.guildEmblemSymbolCategories;
      }
      
      [Untrusted]
      public function hasGuild() : Boolean
      {
         return this.socialFrame.hasGuild;
      }
      
      [Untrusted]
      public function getGuild() : GuildWrapper
      {
         return this.socialFrame.guild;
      }
      
      [Untrusted]
      public function getGuildMembers() : Vector.<GuildMember>
      {
         return this.socialFrame.guildmembers;
      }
      
      [Untrusted]
      public function getGuildRights() : Array
      {
         return GuildWrapper.guildRights;
      }
      
      [Untrusted]
      public function getGuildByid(id:int) : GuildFactSheetWrapper
      {
         return this.socialFrame.getGuildById(id);
      }
      
      [Untrusted]
      public function hasGuildRight(pPlayerId:Number, pRightId:String) : Boolean
      {
         var member:GuildMember = null;
         var temporaryWrapper:GuildWrapper = null;
         if(!this.socialFrame.hasGuild)
         {
            return false;
         }
         if(pPlayerId == PlayedCharacterManager.getInstance().id)
         {
            return this.socialFrame.guild.hasRight(pRightId);
         }
         for each(member in this.socialFrame.guildmembers)
         {
            if(member.id == pPlayerId)
            {
               temporaryWrapper = GuildWrapper.create(0,"",null,member.rights);
               return temporaryWrapper.hasRight(pRightId);
            }
         }
         return false;
      }
      
      [Untrusted]
      public function hasGuildRank(pPlayerId:Number, rankId:int) : Boolean
      {
         var member:GuildMember = null;
         if(!this.socialFrame.hasGuild)
         {
            return false;
         }
         for each(member in this.socialFrame.guildmembers)
         {
            if(member.id == pPlayerId)
            {
               return member.rank == rankId;
            }
         }
         return false;
      }
      
      [Untrusted]
      public function getGuildHouses() : Object
      {
         return this.socialFrame.guildHouses;
      }
      
      [Untrusted]
      public function guildHousesUpdateNeeded() : Boolean
      {
         return this.socialFrame.guildHousesUpdateNeeded;
      }
      
      [Untrusted]
      public function getGuildPaddocks() : Object
      {
         return this.socialFrame.guildPaddocks;
      }
      
      [Untrusted]
      public function getMaxGuildPaddocks() : int
      {
         return this.socialFrame.maxGuildPaddocks;
      }
      
      [Untrusted]
      public function isGuildNameInvalid() : Boolean
      {
         if(this.socialFrame.guild)
         {
            return this.socialFrame.guild.realGuildName == "#NONAME#";
         }
         return false;
      }
      
      [Untrusted]
      public function getMaxCollectorCount() : uint
      {
         return TaxCollectorsManager.getInstance().maxTaxCollectorsCount;
      }
      
      [Untrusted]
      public function getTaxCollectors() : Dictionary
      {
         return TaxCollectorsManager.getInstance().taxCollectors;
      }
      
      [Untrusted]
      public function getTaxCollector(id:Number) : TaxCollectorWrapper
      {
         return TaxCollectorsManager.getInstance().taxCollectors[id];
      }
      
      [Untrusted]
      public function getGuildFightingTaxCollectors() : Dictionary
      {
         return TaxCollectorsManager.getInstance().guildTaxCollectorsFighters;
      }
      
      [Untrusted]
      public function getGuildFightingTaxCollector(pFightId:Number) : SocialEntityInFightWrapper
      {
         return TaxCollectorsManager.getInstance().guildTaxCollectorsFighters[pFightId];
      }
      
      [Untrusted]
      public function getAllFightingTaxCollectors() : Dictionary
      {
         return TaxCollectorsManager.getInstance().allTaxCollectorsInFight;
      }
      
      [Untrusted]
      public function getAllFightingTaxCollector(pFightId:Number) : SocialEntityInFightWrapper
      {
         return TaxCollectorsManager.getInstance().allTaxCollectorsInFight[pFightId];
      }
      
      [Untrusted]
      public function isPlayerDefender(pType:int, pPlayerId:Number, pSocialFightId:Number) : Boolean
      {
         var seifw:SocialEntityInFightWrapper = null;
         var defender:SocialFightersWrapper = null;
         if(pType == 0)
         {
            seifw = TaxCollectorsManager.getInstance().guildTaxCollectorsFighters[pSocialFightId];
            if(!seifw)
            {
               seifw = TaxCollectorsManager.getInstance().allTaxCollectorsInFight[pSocialFightId];
            }
         }
         else if(pType == 1)
         {
            seifw = TaxCollectorsManager.getInstance().prismsFighters[pSocialFightId];
         }
         if(seifw)
         {
            for each(defender in seifw.allyCharactersInformations)
            {
               if(defender.playerCharactersInformations.id == pPlayerId)
               {
                  return true;
               }
            }
         }
         return false;
      }
      
      [Untrusted]
      public function hasAlliance() : Boolean
      {
         return this.allianceFrame.hasAlliance;
      }
      
      [Untrusted]
      public function getAlliance() : AllianceWrapper
      {
         return this.allianceFrame.alliance;
      }
      
      [Untrusted]
      public function getAllianceById(id:int) : AllianceWrapper
      {
         return this.allianceFrame.getAllianceById(id);
      }
      
      [Untrusted]
      public function getAllianceGuilds() : Vector.<GuildFactSheetWrapper>
      {
         return this.allianceFrame.alliance.guilds;
      }
      
      [Untrusted]
      public function isAllianceNameInvalid() : Boolean
      {
         if(this.allianceFrame.alliance)
         {
            return this.allianceFrame.alliance.realAllianceName == "#NONAME#";
         }
         return false;
      }
      
      [Untrusted]
      public function isAllianceTagInvalid() : Boolean
      {
         if(this.allianceFrame.alliance)
         {
            return this.allianceFrame.alliance.realAllianceTag == "#TAG#";
         }
         return false;
      }
      
      [Untrusted]
      public function getAllianceNameAndTag(pPrismInfo:PrismInformation) : String
      {
         var name:* = null;
         var alPrismInfos:AlliancePrismInformation = null;
         var allianceName:String = null;
         var allianceTag:String = null;
         var tag:* = null;
         var myAllianceInfos:AllianceWrapper = null;
         if(pPrismInfo is AlliancePrismInformation)
         {
            alPrismInfos = pPrismInfo as AlliancePrismInformation;
            allianceName = alPrismInfos.alliance.allianceName;
            if(allianceName == "#NONAME#")
            {
               allianceName = I18n.getUiText("ui.guild.noName");
            }
            allianceTag = alPrismInfos.alliance.allianceTag;
            if(allianceTag == "#TAG#")
            {
               allianceTag = I18n.getUiText("ui.alliance.noTag");
            }
            tag = " \\[" + allianceTag + "]";
            name = allianceName + tag;
         }
         else if(pPrismInfo is AllianceInsiderPrismInformation)
         {
            myAllianceInfos = this.getAlliance();
            name = myAllianceInfos.allianceName + " \\[" + myAllianceInfos.allianceTag + "]";
         }
         return name;
      }
      
      [Untrusted]
      public function getPrismSubAreaById(id:int) : PrismSubAreaWrapper
      {
         return this.allianceFrame.getPrismSubAreaById(id);
      }
      
      [Untrusted]
      public function getFightingPrisms() : Dictionary
      {
         return TaxCollectorsManager.getInstance().prismsFighters;
      }
      
      [Untrusted]
      public function getFightingPrism(pFightId:uint) : SocialEntityInFightWrapper
      {
         return TaxCollectorsManager.getInstance().prismsFighters[pFightId];
      }
      
      [Untrusted]
      public function isPlayerPrismDefender(pPlayerId:Number, pSubAreaId:int) : Boolean
      {
         var defender:SocialFightersWrapper = null;
         var p:SocialEntityInFightWrapper = TaxCollectorsManager.getInstance().prismsFighters[pSubAreaId];
         if(p)
         {
            for each(defender in p.allyCharactersInformations)
            {
               if(defender.playerCharactersInformations.id == pPlayerId)
               {
                  return true;
               }
            }
         }
         return false;
      }
      
      [Trusted]
      public function getChatSentence(timestamp:Number, fingerprint:String) : BasicChatSentence
      {
         var channel:Array = null;
         var sentence:BasicChatSentence = null;
         var found:Boolean = false;
         var se:BasicChatSentence = null;
         var chatFrame:ChatFrame = Kernel.getWorker().getFrame(ChatFrame) as ChatFrame;
         for each(channel in chatFrame.getMessages())
         {
            for each(sentence in channel)
            {
               if(sentence.fingerprint == fingerprint && sentence.timestamp == timestamp)
               {
                  se = sentence;
                  found = true;
                  break;
               }
            }
            if(found)
            {
               break;
            }
         }
         return se;
      }
      
      [Untrusted]
      public function getDareList() : Vector.<DareWrapper>
      {
         return dareFrame.dareList;
      }
      
      [Untrusted]
      public function getDareById(dareId:Number) : DareWrapper
      {
         return dareFrame.getDareById(dareId);
      }
      
      [Untrusted]
      public function getTotalGuildDares() : uint
      {
         return dareFrame.getTotalGuildDares();
      }
      
      [Untrusted]
      public function getTotalAllianceDares() : uint
      {
         return dareFrame.getTotalAllianceDares();
      }
      
      [Untrusted]
      public function getTotalDaresInSubArea(subAreaId:uint) : uint
      {
         return dareFrame.getTotalDaresInSubArea(subAreaId);
      }
      
      [Untrusted]
      public function getTargetedMonsterIdsInSubArea(subAreaId:uint) : Vector.<int>
      {
         return dareFrame.getTargetedMonsterIdsInSubArea(subAreaId);
      }
      
      [Untrusted]
      public function getFilteredDareList(subscribableByPlayer:Boolean = true, createdByPlayer:Boolean = false, subscribedByPlayer:Boolean = false, searchQuery:String = "", searchOnId:Boolean = false, searchOnCreatorName:Boolean = false, searchOnMonsterName:Boolean = false, searchOnCriteria:Boolean = false, searchOnSubArea:Boolean = false, searchOnGuildName:Boolean = false, searchOnAllianceName:Boolean = false) : Array
      {
         var dare:DareWrapper = null;
         var idDate:String = null;
         var i:uint = 0;
         var l:uint = 0;
         var canAddDareToList:Boolean = false;
         var dareId:Number = NaN;
         var startDate:Date = null;
         if(searchQuery)
         {
            searchQuery = StringUtils.noAccent(searchQuery.toLocaleLowerCase());
         }
         var result:Array = new Array();
         var currentDate:Date = new Date();
         var currentTime:Number = currentDate.time;
         var onlyOngoingDares:Boolean = !createdByPlayer && !subscribedByPlayer;
         if(searchQuery && searchOnId)
         {
            dareId = parseInt(searchQuery);
            if(isNaN(dareId) == false)
            {
               dare = dareFrame.getDareById(dareId);
               if(dare)
               {
                  if(createdByPlayer && !dare.isMyCreation)
                  {
                     return result;
                  }
                  if(subscribedByPlayer && !dare.subscribed)
                  {
                     return result;
                  }
                  if(!onlyOngoingDares || onlyOngoingDares && dare.isOngoing(currentTime))
                  {
                     result.push(dare);
                  }
               }
               else
               {
                  Kernel.getWorker().processImmediately(DareInformationsRequestAction.create(dareId));
               }
               return result;
            }
         }
         var source:Vector.<DareWrapper> = dareFrame.dareList;
         var playedCharacterManager:PlayedCharacterManager = PlayedCharacterManager.getInstance();
         var playerInfo:Object = {
            "playerId":playedCharacterManager.id,
            "playerBreed":playedCharacterManager.infos.breed,
            "playerLevel":playedCharacterManager.infos.level,
            "playerKamas":playedCharacterManager.characteristics.kamas,
            "playerGuildId":(!!this.socialFrame.hasGuild?this.socialFrame.guild.guildId:0),
            "playerAllianceId":(!!this.allianceFrame.hasAlliance?this.allianceFrame.alliance.allianceId:0),
            "currentTime":currentTime
         };
         var fightableByPlayer:Boolean = false;
         if(createdByPlayer)
         {
            subscribableByPlayer = false;
         }
         else if(subscribedByPlayer)
         {
            fightableByPlayer = subscribableByPlayer;
            subscribableByPlayer = false;
         }
         var hiddenIdsDates:Array = StoreDataManager.getInstance().getData(_datastoreType,"HiddenDaresIds");
         var hiddenIds:Array = new Array();
         for each(idDate in hiddenIdsDates)
         {
            hiddenIds.push(Number(idDate.split("_")[0]));
         }
         l = source.length;
         for(i = 0; i < l; )
         {
            dare = source[i];
            canAddDareToList = false;
            startDate = new Date(dare.startDate);
            DareFrame.getInstance().setDareSubscribable(dare,playerInfo);
            if(!(subscribableByPlayer && (!dare.subscribable || hiddenIds && hiddenIds.indexOf(dare.dareId) != -1)))
            {
               if(!(createdByPlayer && !dare.isMyCreation))
               {
                  if(!(subscribedByPlayer && !dare.subscribed))
                  {
                     if(!(onlyOngoingDares && !dare.isOngoing(currentTime)))
                     {
                        if(!(fightableByPlayer && !dare.isFightable(currentTime)))
                        {
                           if(!searchQuery)
                           {
                              canAddDareToList = true;
                           }
                           else if(searchOnId && dare.dareId.toString().indexOf(searchQuery) != -1)
                           {
                              canAddDareToList = true;
                           }
                           else if(searchOnCreatorName && dare.undiatricalCreatorName.indexOf(searchQuery) != -1)
                           {
                              canAddDareToList = true;
                           }
                           else if(searchOnMonsterName && dare.monster.undiatricalName.indexOf(searchQuery) != -1)
                           {
                              canAddDareToList = true;
                           }
                           else if(searchOnCriteria && dare.criteriaSearchString.indexOf(searchQuery) != -1)
                           {
                              canAddDareToList = true;
                           }
                           else if(searchOnSubArea && dare.subAreasSearchString.indexOf(searchQuery) != -1)
                           {
                              canAddDareToList = true;
                           }
                           else if(searchOnGuildName && dare.undiatricalGuildName && dare.undiatricalGuildName.indexOf(searchQuery) != -1)
                           {
                              canAddDareToList = true;
                           }
                           else if(searchOnAllianceName && dare.undiatricalAllianceName && dare.undiatricalAllianceName.indexOf(searchQuery) != -1)
                           {
                              canAddDareToList = true;
                           }
                           if(canAddDareToList)
                           {
                              result.push(dare);
                           }
                        }
                     }
                  }
               }
            }
            i++;
         }
         return result;
      }
      
      [Untrusted]
      public function getDareRewards() : Vector.<DareReward>
      {
         return !!this.getDareFrame()?this.getDareFrame().dareRewardsWon:null;
      }
      
      private function getDareFrame() : DareFrame
      {
         return DareFrame.getInstance();
      }
   }
}
