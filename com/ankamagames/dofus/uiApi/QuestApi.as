package com.ankamagames.dofus.uiApi
{
   import com.ankamagames.atouin.Atouin;
   import com.ankamagames.atouin.AtouinConstants;
   import com.ankamagames.atouin.managers.FrustumManager;
   import com.ankamagames.berilia.factories.HyperlinkFactory;
   import com.ankamagames.berilia.interfaces.IApi;
   import com.ankamagames.berilia.types.data.UiModule;
   import com.ankamagames.dofus.datacenter.bonus.Bonus;
   import com.ankamagames.dofus.datacenter.bonus.QuestKamasBonus;
   import com.ankamagames.dofus.datacenter.bonus.QuestXPBonus;
   import com.ankamagames.dofus.datacenter.quest.Achievement;
   import com.ankamagames.dofus.datacenter.quest.AchievementObjective;
   import com.ankamagames.dofus.datacenter.quest.AchievementReward;
   import com.ankamagames.dofus.datacenter.quest.Quest;
   import com.ankamagames.dofus.datacenter.quest.QuestObjective;
   import com.ankamagames.dofus.datacenter.world.MapPosition;
   import com.ankamagames.dofus.datacenter.world.SubArea;
   import com.ankamagames.dofus.internalDatacenter.items.ItemWrapper;
   import com.ankamagames.dofus.internalDatacenter.quest.AchievementRewardsWrapper;
   import com.ankamagames.dofus.kernel.Kernel;
   import com.ankamagames.dofus.logic.game.common.frames.QuestFrame;
   import com.ankamagames.dofus.logic.game.common.managers.AlmanaxManager;
   import com.ankamagames.dofus.logic.game.common.managers.PlayedCharacterManager;
   import com.ankamagames.dofus.network.enums.CompassTypeEnum;
   import com.ankamagames.dofus.network.types.game.achievement.AchievementAchieved;
   import com.ankamagames.dofus.network.types.game.achievement.AchievementAchievedRewardable;
   import com.ankamagames.dofus.network.types.game.context.roleplay.quest.QuestActiveInformations;
   import com.ankamagames.jerakine.data.I18n;
   import com.ankamagames.jerakine.logger.Log;
   import com.ankamagames.jerakine.logger.Logger;
   import com.ankamagames.jerakine.utils.display.StageShareManager;
   import com.ankamagames.jerakine.utils.misc.StringUtils;
   import flash.display.Sprite;
   import flash.utils.getQualifiedClassName;
   
   [InstanciedApi]
   public class QuestApi implements IApi
   {
      
      private static var _instance:QuestApi;
       
      
      protected var _log:Logger;
      
      private var _module:UiModule;
      
      public function QuestApi()
      {
         this._log = Log.getLogger(getQualifiedClassName(QuestApi));
         super();
      }
      
      public static function getInstance() : QuestApi
      {
         if(!_instance)
         {
            _instance = new QuestApi();
         }
         return _instance;
      }
      
      [ApiData(name="module")]
      public function set module(value:UiModule) : void
      {
         this._module = value;
      }
      
      [Trusted]
      public function destroy() : void
      {
         this._module = null;
      }
      
      [Untrusted]
      public function getQuestInformations(questId:int) : Object
      {
         return this.getQuestFrame().getQuestInformations(questId);
      }
      
      [Untrusted]
      public function getAllQuests() : Vector.<Object>
      {
         var activeQuest:QuestActiveInformations = null;
         var completedQuests:Vector.<uint> = null;
         var completedQuest:uint = 0;
         var r:Vector.<Object> = new Vector.<Object>(0,false);
         var activeQuests:Vector.<QuestActiveInformations> = this.getQuestFrame().getActiveQuests();
         for each(activeQuest in activeQuests)
         {
            r.push({
               "id":activeQuest.questId,
               "status":true
            });
         }
         completedQuests = this.getQuestFrame().getCompletedQuests();
         for each(completedQuest in completedQuests)
         {
            r.push({
               "id":completedQuest,
               "status":false
            });
         }
         return r;
      }
      
      [Untrusted]
      public function getActiveQuests() : Vector.<uint>
      {
         var activeQuest:QuestActiveInformations = null;
         var data:Vector.<uint> = new Vector.<uint>();
         var activeQuests:Vector.<QuestActiveInformations> = this.getQuestFrame().getActiveQuests();
         for each(activeQuest in activeQuests)
         {
            data.push(activeQuest.questId);
         }
         return data;
      }
      
      [Untrusted]
      public function getCompletedQuests() : Vector.<uint>
      {
         return this.getQuestFrame().getCompletedQuests();
      }
      
      [Untrusted]
      public function getReinitDoneQuests() : Vector.<uint>
      {
         return this.getQuestFrame().getReinitDoneQuests();
      }
      
      [Untrusted]
      public function getAllQuestsOrderByCategory(withCompletedQuests:Boolean = false, withActiveQuests:Boolean = true) : Array
      {
         var quest:Quest = null;
         var questInfos:QuestActiveInformations = null;
         var category:Object = null;
         var activeQuests:Vector.<QuestActiveInformations> = null;
         var questId:uint = 0;
         var completedQuests:Vector.<uint> = null;
         var catsListWithQuests:Array = new Array();
         var totalQuest:int = 0;
         var tabIndex:uint = 0;
         if(withActiveQuests)
         {
            activeQuests = this.getQuestFrame().getActiveQuests();
            totalQuest = totalQuest + activeQuests.length;
            for each(questInfos in activeQuests)
            {
               quest = Quest.getQuestById(questInfos.questId);
               if(quest)
               {
                  tabIndex = quest.category.order;
                  if(tabIndex > catsListWithQuests.length || !catsListWithQuests[tabIndex])
                  {
                     category = new Object();
                     category.data = new Array();
                     category.id = quest.categoryId;
                     catsListWithQuests[tabIndex] = category;
                  }
                  catsListWithQuests[tabIndex].data.push({
                     "id":questInfos.questId,
                     "status":true
                  });
               }
            }
         }
         if(withCompletedQuests)
         {
            completedQuests = this.getQuestFrame().getCompletedQuests();
            totalQuest = totalQuest + completedQuests.length;
            for each(questId in completedQuests)
            {
               quest = Quest.getQuestById(questId);
               if(quest)
               {
                  tabIndex = quest.category.order;
                  if(tabIndex > catsListWithQuests.length || !catsListWithQuests[tabIndex])
                  {
                     category = new Object();
                     category.data = new Array();
                     category.id = quest.categoryId;
                     catsListWithQuests[tabIndex] = category;
                  }
                  catsListWithQuests[tabIndex].data.push({
                     "id":questId,
                     "status":false
                  });
               }
            }
         }
         return catsListWithQuests;
      }
      
      [Untrusted]
      public function getTutorialReward() : Vector.<ItemWrapper>
      {
         var itemWrapperList:Vector.<ItemWrapper> = new Vector.<ItemWrapper>();
         itemWrapperList.push(ItemWrapper.create(0,0,10785,1,null,false));
         itemWrapperList.push(ItemWrapper.create(0,0,10794,1,null,false));
         itemWrapperList.push(ItemWrapper.create(0,0,10797,1,null,false));
         itemWrapperList.push(ItemWrapper.create(0,0,10798,1,null,false));
         itemWrapperList.push(ItemWrapper.create(0,0,10799,1,null,false));
         itemWrapperList.push(ItemWrapper.create(0,0,10784,1,null,false));
         itemWrapperList.push(ItemWrapper.create(0,0,10800,1,null,false));
         itemWrapperList.push(ItemWrapper.create(0,0,10801,1,null,false));
         itemWrapperList.push(ItemWrapper.create(0,0,10792,1,null,false));
         itemWrapperList.push(ItemWrapper.create(0,0,10793,2,null,false));
         itemWrapperList.push(ItemWrapper.create(0,0,10795,1,null,false));
         itemWrapperList.push(ItemWrapper.create(0,0,10796,1,null,false));
         return itemWrapperList;
      }
      
      [Untrusted]
      public function getNotificationList() : Array
      {
         return QuestFrame.notificationList;
      }
      
      [Untrusted]
      public function getFinishedAchievements() : Vector.<AchievementAchieved>
      {
         return this.getQuestFrame().finishedAchievements;
      }
      
      [Untrusted]
      public function getFinishedCharacterAchievementIds() : Array
      {
         return this.getQuestFrame().finishedCharacterAchievementIds;
      }
      
      [Untrusted]
      public function getFinishedAccountAchievementIds() : Array
      {
         return this.getQuestFrame().finishedAccountAchievementIds;
      }
      
      [Untrusted]
      public function isAchievementConditionRespectedForSpecificLevel(achievementReward:AchievementReward, level:int = 0) : Boolean
      {
         return achievementReward.isConditionRespectedForSpecificLevel(level);
      }
      
      [Untrusted]
      public function getAchievementKamasReward(achievement:Achievement, level:int = 0) : Number
      {
         if(level == 0)
         {
            level = PlayedCharacterManager.getInstance().limitedLevel;
         }
         return achievement.getKamasReward(level);
      }
      
      [Untrusted]
      public function getAchievementExperienceReward(achievement:Achievement, level:int = 0) : Number
      {
         if(level == 0)
         {
            level = PlayedCharacterManager.getInstance().limitedLevel;
         }
         return achievement.getExperienceReward(level,PlayedCharacterManager.getInstance().experiencePercent);
      }
      
      [Untrusted]
      public function getAchievementReward(achievement:Achievement, level:int = 0, showAllReward:Boolean = false) : AchievementRewardsWrapper
      {
         if(level == 0)
         {
            level = PlayedCharacterManager.getInstance().limitedLevel;
         }
         return achievement.getAchievementRewardByLevel(level,showAllReward);
      }
      
      [Untrusted]
      public function getRewardableAchievements() : Vector.<AchievementAchievedRewardable>
      {
         return !!this.getQuestFrame()?this.getQuestFrame().rewardableAchievements:null;
      }
      
      [Untrusted]
      public function getAchievementObjectivesNames(achId:int) : String
      {
         var objId:int = 0;
         var objAch:AchievementObjective = null;
         var text:String = "-";
         var a:Achievement = Achievement.getAchievementById(achId);
         for each(objId in a.objectiveIds)
         {
            objAch = AchievementObjective.getAchievementObjectiveById(objId);
            if(objAch && objAch.name)
            {
               text = text + (" " + StringUtils.noAccent(objAch.name).toLowerCase());
            }
         }
         return text;
      }
      
      [Untrusted]
      public function getTreasureHunt(typeId:int) : Object
      {
         return this.getQuestFrame().getTreasureHuntById(typeId);
      }
      
      [Untrusted]
      public function getAlmanaxQuestXpBonusMultiplier(pQuestId:uint) : Number
      {
         var bonusId:int = 0;
         var bonus:Bonus = null;
         var mul:Number = NaN;
         for each(bonusId in AlmanaxManager.getInstance().calendar.bonusesIds)
         {
            bonus = Bonus.getBonusById(bonusId);
            if(bonus is QuestXPBonus && bonus.isRespected(Quest.getQuestById(pQuestId).categoryId))
            {
               if(isNaN(mul))
               {
                  mul = 1;
               }
               mul = mul * (bonus.amount / 100);
            }
         }
         return !isNaN(mul)?Number(mul):Number(0);
      }
      
      [Untrusted]
      public function getAlmanaxQuestKamasBonusMultiplier(pQuestId:uint) : Number
      {
         var bonusId:int = 0;
         var bonus:Bonus = null;
         var mul:Number = NaN;
         for each(bonusId in AlmanaxManager.getInstance().calendar.bonusesIds)
         {
            bonus = Bonus.getBonusById(bonusId);
            if(bonus is QuestKamasBonus && bonus.isRespected(Quest.getQuestById(pQuestId).categoryId))
            {
               if(isNaN(mul))
               {
                  mul = 1;
               }
               mul = mul * (bonus.amount / 100);
            }
         }
         return !isNaN(mul)?Number(mul):Number(0);
      }
      
      [Untrusted]
      public function toggleWorldMask(name:String) : void
      {
         var worldMask:Sprite = Atouin.getInstance().getWorldMask(name);
         if(!worldMask.visible)
         {
            Atouin.getInstance().setWorldMaskDimensions(StageShareManager.startWidth + AtouinConstants.CELL_HALF_WIDTH / 2,FrustumManager.getInstance().frustum.marginBottom,0,0.7,name);
         }
         Atouin.getInstance().toggleWorldMask(name,!worldMask.visible);
      }
      
      [Untrusted]
      public function getQuestObjectiveFlagInfos(questId:uint, objectiveId:uint) : Object
      {
         var objectiveWorldMapId:int = 0;
         var entranceMapIds:Object = null;
         var exitMapIds:Object = null;
         var mapPos:MapPosition = null;
         var subArea:SubArea = null;
         var objective:QuestObjective = QuestObjective.getQuestObjectiveById(objectiveId);
         if(!objective || !PlayedCharacterManager.getInstance().currentWorldMap || !PlayedCharacterManager.getInstance().currentSubArea || objective.mapId && !MapPosition.getMapPositionById(objective.mapId))
         {
            return null;
         }
         var newFlagId:String = "flag_srv" + CompassTypeEnum.COMPASS_TYPE_QUEST + "_" + questId + "_" + objective.id;
         var flagX:Number = !!objective.coords?Number(objective.coords.x):Number(NaN);
         var flagY:Number = !!objective.coords?Number(objective.coords.y):Number(NaN);
         var worldMapId:int = 1;
         var flagText:String = I18n.getUiText("ui.common.quests") + "\n" + HyperlinkFactory.decode(objective.text,false);
         if(objective.mapId)
         {
            mapPos = MapPosition.getMapPositionById(objective.mapId);
            subArea = SubArea.getSubAreaById(mapPos.subAreaId);
            entranceMapIds = subArea.entranceMapIds;
            exitMapIds = subArea.exitMapIds;
            objectiveWorldMapId = subArea.worldmap.id;
            if(worldMapId != objectiveWorldMapId)
            {
               if(worldMapId == 1)
               {
                  if(entranceMapIds.length > 0)
                  {
                     mapPos = MapPosition.getMapPositionById(entranceMapIds[0]);
                  }
                  else
                  {
                     worldMapId = objectiveWorldMapId;
                  }
               }
               else
               {
                  subArea = PlayedCharacterManager.getInstance().currentSubArea;
                  if(exitMapIds.length > 0)
                  {
                     mapPos = MapPosition.getMapPositionById(exitMapIds[0]);
                  }
                  else
                  {
                     worldMapId = objectiveWorldMapId;
                  }
               }
            }
            flagX = mapPos.posX;
            flagY = mapPos.posY;
         }
         if(!isNaN(flagX) && !isNaN(flagY))
         {
            flagText = flagText + (" (" + flagX + "," + flagY + ")");
         }
         return {
            "id":newFlagId,
            "text":flagText,
            "worldMapId":worldMapId,
            "x":flagX,
            "y":flagY
         };
      }
      
      [Untrusted]
      public function getFollowedQuests() : Object
      {
         var questFrame:QuestFrame = Kernel.getWorker().getFrame(QuestFrame) as QuestFrame;
         return questFrame.getFollowedQuests();
      }
      
      private function getQuestFrame() : QuestFrame
      {
         return Kernel.getWorker().getFrame(QuestFrame) as QuestFrame;
      }
   }
}
