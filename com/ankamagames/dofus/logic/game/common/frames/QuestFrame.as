package com.ankamagames.dofus.logic.game.common.frames
{
   import com.ankamagames.atouin.Atouin;
   import com.ankamagames.atouin.AtouinConstants;
   import com.ankamagames.atouin.managers.FrustumManager;
   import com.ankamagames.berilia.Berilia;
   import com.ankamagames.berilia.enums.StrataEnum;
   import com.ankamagames.berilia.managers.KernelEventsManager;
   import com.ankamagames.berilia.managers.UiModuleManager;
   import com.ankamagames.berilia.types.data.UiModule;
   import com.ankamagames.berilia.types.graphic.UiRootContainer;
   import com.ankamagames.dofus.datacenter.quest.Achievement;
   import com.ankamagames.dofus.datacenter.quest.Quest;
   import com.ankamagames.dofus.datacenter.quest.QuestObjective;
   import com.ankamagames.dofus.datacenter.quest.QuestStep;
   import com.ankamagames.dofus.datacenter.world.MapPosition;
   import com.ankamagames.dofus.datacenter.world.SubArea;
   import com.ankamagames.dofus.internalDatacenter.quest.TreasureHuntStepWrapper;
   import com.ankamagames.dofus.internalDatacenter.quest.TreasureHuntWrapper;
   import com.ankamagames.dofus.kernel.net.ConnectionsHandler;
   import com.ankamagames.dofus.logic.common.actions.AuthorizedCommandAction;
   import com.ankamagames.dofus.logic.common.managers.AccountManager;
   import com.ankamagames.dofus.logic.game.common.actions.FollowQuestAction;
   import com.ankamagames.dofus.logic.game.common.actions.NotificationResetAction;
   import com.ankamagames.dofus.logic.game.common.actions.NotificationUpdateFlagAction;
   import com.ankamagames.dofus.logic.game.common.actions.RefreshFollowedQuestsOrderAction;
   import com.ankamagames.dofus.logic.game.common.actions.quest.AchievementDetailedListRequestAction;
   import com.ankamagames.dofus.logic.game.common.actions.quest.AchievementDetailsRequestAction;
   import com.ankamagames.dofus.logic.game.common.actions.quest.AchievementRewardRequestAction;
   import com.ankamagames.dofus.logic.game.common.actions.quest.GuidedModeQuitRequestAction;
   import com.ankamagames.dofus.logic.game.common.actions.quest.GuidedModeReturnRequestAction;
   import com.ankamagames.dofus.logic.game.common.actions.quest.QuestInfosRequestAction;
   import com.ankamagames.dofus.logic.game.common.actions.quest.QuestListRequestAction;
   import com.ankamagames.dofus.logic.game.common.actions.quest.QuestObjectiveValidationAction;
   import com.ankamagames.dofus.logic.game.common.actions.quest.QuestStartRequestAction;
   import com.ankamagames.dofus.logic.game.common.actions.quest.treasureHunt.TreasureHuntDigRequestAction;
   import com.ankamagames.dofus.logic.game.common.actions.quest.treasureHunt.TreasureHuntFlagRemoveRequestAction;
   import com.ankamagames.dofus.logic.game.common.actions.quest.treasureHunt.TreasureHuntFlagRequestAction;
   import com.ankamagames.dofus.logic.game.common.actions.quest.treasureHunt.TreasureHuntGiveUpRequestAction;
   import com.ankamagames.dofus.logic.game.common.actions.quest.treasureHunt.TreasureHuntLegendaryRequestAction;
   import com.ankamagames.dofus.logic.game.common.managers.PlayedCharacterManager;
   import com.ankamagames.dofus.logic.game.common.managers.TimeManager;
   import com.ankamagames.dofus.logic.game.fight.miscs.ActionIdProtocol;
   import com.ankamagames.dofus.misc.lists.ChatHookList;
   import com.ankamagames.dofus.misc.lists.HookList;
   import com.ankamagames.dofus.misc.lists.QuestHookList;
   import com.ankamagames.dofus.misc.utils.ParamsDecoder;
   import com.ankamagames.dofus.network.enums.ChatActivableChannelsEnum;
   import com.ankamagames.dofus.network.enums.CompassTypeEnum;
   import com.ankamagames.dofus.network.enums.TreasureHuntDigRequestEnum;
   import com.ankamagames.dofus.network.enums.TreasureHuntFlagRequestEnum;
   import com.ankamagames.dofus.network.enums.TreasureHuntFlagStateEnum;
   import com.ankamagames.dofus.network.enums.TreasureHuntRequestEnum;
   import com.ankamagames.dofus.network.enums.TreasureHuntTypeEnum;
   import com.ankamagames.dofus.network.messages.game.achievement.AchievementDetailedListMessage;
   import com.ankamagames.dofus.network.messages.game.achievement.AchievementDetailedListRequestMessage;
   import com.ankamagames.dofus.network.messages.game.achievement.AchievementDetailsMessage;
   import com.ankamagames.dofus.network.messages.game.achievement.AchievementDetailsRequestMessage;
   import com.ankamagames.dofus.network.messages.game.achievement.AchievementFinishedInformationMessage;
   import com.ankamagames.dofus.network.messages.game.achievement.AchievementFinishedMessage;
   import com.ankamagames.dofus.network.messages.game.achievement.AchievementListMessage;
   import com.ankamagames.dofus.network.messages.game.achievement.AchievementRewardErrorMessage;
   import com.ankamagames.dofus.network.messages.game.achievement.AchievementRewardRequestMessage;
   import com.ankamagames.dofus.network.messages.game.achievement.AchievementRewardSuccessMessage;
   import com.ankamagames.dofus.network.messages.game.context.notification.NotificationResetMessage;
   import com.ankamagames.dofus.network.messages.game.context.notification.NotificationUpdateFlagMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.quest.FollowQuestObjectiveRequestMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.quest.FollowedQuestsMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.quest.GuidedModeQuitRequestMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.quest.GuidedModeReturnRequestMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.quest.QuestListMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.quest.QuestListRequestMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.quest.QuestObjectiveValidatedMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.quest.QuestObjectiveValidationMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.quest.QuestStartRequestMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.quest.QuestStartedMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.quest.QuestStepInfoMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.quest.QuestStepInfoRequestMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.quest.QuestStepStartedMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.quest.QuestStepValidatedMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.quest.QuestValidatedMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.quest.RefreshFollowedQuestsOrderRequestMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.quest.UnfollowQuestObjectiveRequestMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.treasureHunt.TreasureHuntAvailableRetryCountUpdateMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.treasureHunt.TreasureHuntDigRequestAnswerFailedMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.treasureHunt.TreasureHuntDigRequestAnswerMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.treasureHunt.TreasureHuntDigRequestMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.treasureHunt.TreasureHuntFinishedMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.treasureHunt.TreasureHuntFlagRemoveRequestMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.treasureHunt.TreasureHuntFlagRequestAnswerMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.treasureHunt.TreasureHuntFlagRequestMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.treasureHunt.TreasureHuntGiveUpRequestMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.treasureHunt.TreasureHuntLegendaryRequestMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.treasureHunt.TreasureHuntMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.treasureHunt.TreasureHuntRequestAnswerMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.treasureHunt.TreasureHuntShowLegendaryUIMessage;
   import com.ankamagames.dofus.network.messages.game.inventory.items.ObjectAddedMessage;
   import com.ankamagames.dofus.network.types.game.achievement.AchievementAchieved;
   import com.ankamagames.dofus.network.types.game.achievement.AchievementAchievedRewardable;
   import com.ankamagames.dofus.network.types.game.context.roleplay.quest.QuestActiveDetailedInformations;
   import com.ankamagames.dofus.network.types.game.context.roleplay.quest.QuestActiveInformations;
   import com.ankamagames.dofus.network.types.game.context.roleplay.quest.QuestObjectiveInformations;
   import com.ankamagames.dofus.network.types.game.context.roleplay.quest.QuestObjectiveInformationsWithCompletion;
   import com.ankamagames.dofus.network.types.game.context.roleplay.treasureHunt.TreasureHuntFlag;
   import com.ankamagames.dofus.network.types.game.data.items.effects.ObjectEffect;
   import com.ankamagames.dofus.network.types.game.data.items.effects.ObjectEffectInteger;
   import com.ankamagames.dofus.uiApi.PlayedCharacterApi;
   import com.ankamagames.dofus.uiApi.QuestApi;
   import com.ankamagames.jerakine.data.I18n;
   import com.ankamagames.jerakine.data.XmlConfig;
   import com.ankamagames.jerakine.logger.Log;
   import com.ankamagames.jerakine.logger.Logger;
   import com.ankamagames.jerakine.managers.StoreDataManager;
   import com.ankamagames.jerakine.messages.Frame;
   import com.ankamagames.jerakine.messages.Message;
   import com.ankamagames.jerakine.types.Callback;
   import com.ankamagames.jerakine.types.DataStoreType;
   import com.ankamagames.jerakine.types.enums.DataStoreEnum;
   import com.ankamagames.jerakine.types.enums.Priority;
   import com.ankamagames.jerakine.utils.display.StageShareManager;
   import com.ankamagames.jerakine.utils.misc.DictionaryUtils;
   import flash.utils.Dictionary;
   import flash.utils.getQualifiedClassName;
   
   public class QuestFrame implements Frame
   {
      
      protected static const _log:Logger = Log.getLogger(getQualifiedClassName(QuestFrame));
      
      public static var notificationList:Array;
       
      
      private var _nbAllAchievements:int;
      
      private var _activeQuests:Vector.<QuestActiveInformations>;
      
      private var _completedQuests:Vector.<uint>;
      
      private var _reinitDoneQuests:Vector.<uint>;
      
      private var _followedQuests:Vector.<uint>;
      
      private var _questsInformations:Dictionary;
      
      private var _finishedAchievements:Vector.<AchievementAchieved>;
      
      private var _activeObjectives:Vector.<uint>;
      
      private var _completedObjectives:Vector.<uint>;
      
      private var _finishedAccountAchievementIds:Array;
      
      private var _finishedCharacterAchievementIds:Array;
      
      private var _rewardableAchievements:Vector.<AchievementAchievedRewardable>;
      
      private var _rewardableAchievementsVisible:Boolean;
      
      private var _treasureHunts:Dictionary;
      
      private var _flagColors:Array;
      
      private var _followedQuestsCallback:Callback;
      
      public function QuestFrame()
      {
         this._followedQuests = new Vector.<uint>();
         this._questsInformations = new Dictionary();
         this._activeObjectives = new Vector.<uint>();
         this._completedObjectives = new Vector.<uint>();
         this._treasureHunts = new Dictionary();
         this._flagColors = new Array();
         super();
      }
      
      public function get followedQuestsCallback() : Callback
      {
         return this._followedQuestsCallback;
      }
      
      public function get priority() : int
      {
         return Priority.NORMAL;
      }
      
      public function get finishedAchievements() : Vector.<AchievementAchieved>
      {
         return this._finishedAchievements;
      }
      
      public function get finishedAccountAchievementIds() : Array
      {
         return this._finishedAccountAchievementIds;
      }
      
      public function get finishedCharacterAchievementIds() : Array
      {
         return this._finishedCharacterAchievementIds;
      }
      
      public function getActiveQuests() : Vector.<QuestActiveInformations>
      {
         return this._activeQuests;
      }
      
      public function getCompletedQuests() : Vector.<uint>
      {
         return this._completedQuests;
      }
      
      public function getReinitDoneQuests() : Vector.<uint>
      {
         return this._reinitDoneQuests;
      }
      
      public function getFollowedQuests() : Vector.<uint>
      {
         return this._followedQuests;
      }
      
      public function getQuestInformations(questId:uint) : Object
      {
         return this._questsInformations[questId];
      }
      
      public function getActiveObjectives() : Vector.<uint>
      {
         return this._activeObjectives;
      }
      
      public function getCompletedObjectives() : Vector.<uint>
      {
         return this._completedObjectives;
      }
      
      public function get rewardableAchievements() : Vector.<AchievementAchievedRewardable>
      {
         return this._rewardableAchievements;
      }
      
      public function getTreasureHuntById(typeId:uint) : Object
      {
         return this._treasureHunts[typeId];
      }
      
      public function pushed() : Boolean
      {
         this._rewardableAchievements = new Vector.<AchievementAchievedRewardable>();
         this._finishedAchievements = new Vector.<AchievementAchieved>();
         this._finishedAccountAchievementIds = new Array();
         this._finishedCharacterAchievementIds = new Array();
         this._treasureHunts = new Dictionary();
         this._nbAllAchievements = Achievement.getAchievements().length;
         this._flagColors[TreasureHuntFlagStateEnum.TREASURE_HUNT_FLAG_STATE_UNKNOWN] = XmlConfig.getInstance().getEntry("colors.flag.unknown");
         this._flagColors[TreasureHuntFlagStateEnum.TREASURE_HUNT_FLAG_STATE_OK] = XmlConfig.getInstance().getEntry("colors.flag.right");
         this._flagColors[TreasureHuntFlagStateEnum.TREASURE_HUNT_FLAG_STATE_WRONG] = XmlConfig.getInstance().getEntry("colors.flag.wrong");
         return true;
      }
      
      public function process(msg:Message) : Boolean
      {
         /*
          * Decompilation error
          * Timeout (1 minute) was reached
          * Instruction count: 4060
          */
         throw new flash.errors.IllegalOperationError("Not decompiled due to timeout");
      }
      
      public function pulled() : Boolean
      {
         return true;
      }
      
      private function hasTreasureHunt() : Boolean
      {
         var key:* = undefined;
         for(key in this._treasureHunts)
         {
            if(key != null)
            {
               return true;
            }
         }
         return false;
      }
   }
}
