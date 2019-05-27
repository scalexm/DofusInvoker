package com.ankamagames.dofus.logic.game.common.frames
{
   import com.ankamagames.berilia.managers.KernelEventsManager;
   import com.ankamagames.dofus.datacenter.npcs.TaxCollectorFirstname;
   import com.ankamagames.dofus.datacenter.npcs.TaxCollectorName;
   import com.ankamagames.dofus.datacenter.world.SubArea;
   import com.ankamagames.dofus.externalnotification.ExternalNotificationManager;
   import com.ankamagames.dofus.externalnotification.enums.ExternalNotificationTypeEnum;
   import com.ankamagames.dofus.internalDatacenter.guild.GuildFactSheetWrapper;
   import com.ankamagames.dofus.internalDatacenter.guild.GuildHouseWrapper;
   import com.ankamagames.dofus.internalDatacenter.guild.GuildWrapper;
   import com.ankamagames.dofus.internalDatacenter.guild.SocialEntityInFightWrapper;
   import com.ankamagames.dofus.internalDatacenter.guild.SocialFightersWrapper;
   import com.ankamagames.dofus.internalDatacenter.guild.TaxCollectorWrapper;
   import com.ankamagames.dofus.internalDatacenter.people.ContactWrapper;
   import com.ankamagames.dofus.internalDatacenter.people.EnemyWrapper;
   import com.ankamagames.dofus.internalDatacenter.people.FriendWrapper;
   import com.ankamagames.dofus.internalDatacenter.people.IgnoredWrapper;
   import com.ankamagames.dofus.internalDatacenter.people.SpouseWrapper;
   import com.ankamagames.dofus.internalDatacenter.world.WorldPointWrapper;
   import com.ankamagames.dofus.kernel.Kernel;
   import com.ankamagames.dofus.kernel.net.ConnectionsHandler;
   import com.ankamagames.dofus.logic.common.managers.AccountManager;
   import com.ankamagames.dofus.logic.common.managers.NotificationManager;
   import com.ankamagames.dofus.logic.game.common.actions.ContactLookRequestByIdAction;
   import com.ankamagames.dofus.logic.game.common.actions.HouseTeleportRequestAction;
   import com.ankamagames.dofus.logic.game.common.actions.OpenSocialAction;
   import com.ankamagames.dofus.logic.game.common.actions.guild.GuildBulletinSetRequestAction;
   import com.ankamagames.dofus.logic.game.common.actions.guild.GuildChangeMemberParametersAction;
   import com.ankamagames.dofus.logic.game.common.actions.guild.GuildCharacsUpgradeRequestAction;
   import com.ankamagames.dofus.logic.game.common.actions.guild.GuildFactsRequestAction;
   import com.ankamagames.dofus.logic.game.common.actions.guild.GuildFarmTeleportRequestAction;
   import com.ankamagames.dofus.logic.game.common.actions.guild.GuildFightJoinRequestAction;
   import com.ankamagames.dofus.logic.game.common.actions.guild.GuildFightLeaveRequestAction;
   import com.ankamagames.dofus.logic.game.common.actions.guild.GuildFightTakePlaceRequestAction;
   import com.ankamagames.dofus.logic.game.common.actions.guild.GuildGetInformationsAction;
   import com.ankamagames.dofus.logic.game.common.actions.guild.GuildInvitationAction;
   import com.ankamagames.dofus.logic.game.common.actions.guild.GuildInvitationByNameAction;
   import com.ankamagames.dofus.logic.game.common.actions.guild.GuildKickRequestAction;
   import com.ankamagames.dofus.logic.game.common.actions.guild.GuildMotdSetRequestAction;
   import com.ankamagames.dofus.logic.game.common.actions.guild.GuildSpellUpgradeRequestAction;
   import com.ankamagames.dofus.logic.game.common.actions.social.AddEnemyAction;
   import com.ankamagames.dofus.logic.game.common.actions.social.AddFriendAction;
   import com.ankamagames.dofus.logic.game.common.actions.social.AddIgnoredAction;
   import com.ankamagames.dofus.logic.game.common.actions.social.ContactsListRequestAction;
   import com.ankamagames.dofus.logic.game.common.actions.social.EnemiesListRequestAction;
   import com.ankamagames.dofus.logic.game.common.actions.social.FriendGuildSetWarnOnAchievementCompleteAction;
   import com.ankamagames.dofus.logic.game.common.actions.social.FriendOrGuildMemberLevelUpWarningSetAction;
   import com.ankamagames.dofus.logic.game.common.actions.social.FriendSpouseFollowAction;
   import com.ankamagames.dofus.logic.game.common.actions.social.FriendWarningSetAction;
   import com.ankamagames.dofus.logic.game.common.actions.social.FriendsListRequestAction;
   import com.ankamagames.dofus.logic.game.common.actions.social.JoinFriendAction;
   import com.ankamagames.dofus.logic.game.common.actions.social.JoinSpouseAction;
   import com.ankamagames.dofus.logic.game.common.actions.social.MemberWarningSetAction;
   import com.ankamagames.dofus.logic.game.common.actions.social.PlayerStatusUpdateRequestAction;
   import com.ankamagames.dofus.logic.game.common.actions.social.RemoveEnemyAction;
   import com.ankamagames.dofus.logic.game.common.actions.social.RemoveFriendAction;
   import com.ankamagames.dofus.logic.game.common.actions.social.RemoveIgnoredAction;
   import com.ankamagames.dofus.logic.game.common.actions.social.SpouseRequestAction;
   import com.ankamagames.dofus.logic.game.common.actions.social.StatusShareSetAction;
   import com.ankamagames.dofus.logic.game.common.actions.social.WarnOnHardcoreDeathAction;
   import com.ankamagames.dofus.logic.game.common.managers.ChatAutocompleteNameManager;
   import com.ankamagames.dofus.logic.game.common.managers.PlayedCharacterManager;
   import com.ankamagames.dofus.logic.game.common.managers.TaxCollectorsManager;
   import com.ankamagames.dofus.logic.game.common.managers.TimeManager;
   import com.ankamagames.dofus.misc.EntityLookAdapter;
   import com.ankamagames.dofus.misc.lists.ChatHookList;
   import com.ankamagames.dofus.misc.lists.CraftHookList;
   import com.ankamagames.dofus.misc.lists.HookList;
   import com.ankamagames.dofus.misc.lists.SocialHookList;
   import com.ankamagames.dofus.network.ProtocolConstantsEnum;
   import com.ankamagames.dofus.network.enums.ChatActivableChannelsEnum;
   import com.ankamagames.dofus.network.enums.CompassTypeEnum;
   import com.ankamagames.dofus.network.enums.GuildInformationsTypeEnum;
   import com.ankamagames.dofus.network.enums.ListAddFailureEnum;
   import com.ankamagames.dofus.network.enums.PlayerStateEnum;
   import com.ankamagames.dofus.network.enums.SocialGroupCreationResultEnum;
   import com.ankamagames.dofus.network.enums.SocialGroupInvitationStateEnum;
   import com.ankamagames.dofus.network.enums.SocialNoticeErrorEnum;
   import com.ankamagames.dofus.network.enums.TaxCollectorErrorReasonEnum;
   import com.ankamagames.dofus.network.enums.TaxCollectorMovementTypeEnum;
   import com.ankamagames.dofus.network.enums.TaxCollectorStateEnum;
   import com.ankamagames.dofus.network.messages.game.achievement.FriendGuildSetWarnOnAchievementCompleteMessage;
   import com.ankamagames.dofus.network.messages.game.achievement.FriendGuildWarnOnAchievementCompleteStateMessage;
   import com.ankamagames.dofus.network.messages.game.character.status.PlayerStatusUpdateErrorMessage;
   import com.ankamagames.dofus.network.messages.game.character.status.PlayerStatusUpdateMessage;
   import com.ankamagames.dofus.network.messages.game.character.status.PlayerStatusUpdateRequestMessage;
   import com.ankamagames.dofus.network.messages.game.chat.smiley.MoodSmileyUpdateMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.death.WarnOnPermaDeathMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.npc.AllianceTaxCollectorDialogQuestionExtendedMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.npc.TaxCollectorDialogQuestionBasicMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.npc.TaxCollectorDialogQuestionExtendedMessage;
   import com.ankamagames.dofus.network.messages.game.friend.AcquaintanceAddedMessage;
   import com.ankamagames.dofus.network.messages.game.friend.AcquaintancesGetListMessage;
   import com.ankamagames.dofus.network.messages.game.friend.AcquaintancesListMessage;
   import com.ankamagames.dofus.network.messages.game.friend.ContactAddFailureMessage;
   import com.ankamagames.dofus.network.messages.game.friend.FriendAddFailureMessage;
   import com.ankamagames.dofus.network.messages.game.friend.FriendAddRequestMessage;
   import com.ankamagames.dofus.network.messages.game.friend.FriendAddedMessage;
   import com.ankamagames.dofus.network.messages.game.friend.FriendDeleteRequestMessage;
   import com.ankamagames.dofus.network.messages.game.friend.FriendDeleteResultMessage;
   import com.ankamagames.dofus.network.messages.game.friend.FriendJoinRequestMessage;
   import com.ankamagames.dofus.network.messages.game.friend.FriendSetStatusShareMessage;
   import com.ankamagames.dofus.network.messages.game.friend.FriendSetWarnOnConnectionMessage;
   import com.ankamagames.dofus.network.messages.game.friend.FriendSetWarnOnLevelGainMessage;
   import com.ankamagames.dofus.network.messages.game.friend.FriendSpouseFollowWithCompassRequestMessage;
   import com.ankamagames.dofus.network.messages.game.friend.FriendSpouseJoinRequestMessage;
   import com.ankamagames.dofus.network.messages.game.friend.FriendStatusShareStateMessage;
   import com.ankamagames.dofus.network.messages.game.friend.FriendUpdateMessage;
   import com.ankamagames.dofus.network.messages.game.friend.FriendWarnOnConnectionStateMessage;
   import com.ankamagames.dofus.network.messages.game.friend.FriendWarnOnLevelGainStateMessage;
   import com.ankamagames.dofus.network.messages.game.friend.FriendsGetListMessage;
   import com.ankamagames.dofus.network.messages.game.friend.FriendsListMessage;
   import com.ankamagames.dofus.network.messages.game.friend.GuildMemberSetWarnOnConnectionMessage;
   import com.ankamagames.dofus.network.messages.game.friend.GuildMemberWarnOnConnectionStateMessage;
   import com.ankamagames.dofus.network.messages.game.friend.IgnoredAddFailureMessage;
   import com.ankamagames.dofus.network.messages.game.friend.IgnoredAddRequestMessage;
   import com.ankamagames.dofus.network.messages.game.friend.IgnoredAddedMessage;
   import com.ankamagames.dofus.network.messages.game.friend.IgnoredDeleteRequestMessage;
   import com.ankamagames.dofus.network.messages.game.friend.IgnoredDeleteResultMessage;
   import com.ankamagames.dofus.network.messages.game.friend.IgnoredGetListMessage;
   import com.ankamagames.dofus.network.messages.game.friend.IgnoredListMessage;
   import com.ankamagames.dofus.network.messages.game.friend.SpouseGetInformationsMessage;
   import com.ankamagames.dofus.network.messages.game.friend.SpouseInformationsMessage;
   import com.ankamagames.dofus.network.messages.game.friend.SpouseStatusMessage;
   import com.ankamagames.dofus.network.messages.game.friend.WarnOnPermaDeathStateMessage;
   import com.ankamagames.dofus.network.messages.game.guild.GuildBulletinMessage;
   import com.ankamagames.dofus.network.messages.game.guild.GuildBulletinSetErrorMessage;
   import com.ankamagames.dofus.network.messages.game.guild.GuildBulletinSetRequestMessage;
   import com.ankamagames.dofus.network.messages.game.guild.GuildChangeMemberParametersMessage;
   import com.ankamagames.dofus.network.messages.game.guild.GuildCharacsUpgradeRequestMessage;
   import com.ankamagames.dofus.network.messages.game.guild.GuildCreationResultMessage;
   import com.ankamagames.dofus.network.messages.game.guild.GuildCreationStartedMessage;
   import com.ankamagames.dofus.network.messages.game.guild.GuildFactsErrorMessage;
   import com.ankamagames.dofus.network.messages.game.guild.GuildFactsMessage;
   import com.ankamagames.dofus.network.messages.game.guild.GuildFactsRequestMessage;
   import com.ankamagames.dofus.network.messages.game.guild.GuildGetInformationsMessage;
   import com.ankamagames.dofus.network.messages.game.guild.GuildHouseRemoveMessage;
   import com.ankamagames.dofus.network.messages.game.guild.GuildHouseUpdateInformationMessage;
   import com.ankamagames.dofus.network.messages.game.guild.GuildHousesInformationMessage;
   import com.ankamagames.dofus.network.messages.game.guild.GuildInAllianceFactsMessage;
   import com.ankamagames.dofus.network.messages.game.guild.GuildInformationsGeneralMessage;
   import com.ankamagames.dofus.network.messages.game.guild.GuildInformationsMemberUpdateMessage;
   import com.ankamagames.dofus.network.messages.game.guild.GuildInformationsMembersMessage;
   import com.ankamagames.dofus.network.messages.game.guild.GuildInformationsPaddocksMessage;
   import com.ankamagames.dofus.network.messages.game.guild.GuildInfosUpgradeMessage;
   import com.ankamagames.dofus.network.messages.game.guild.GuildInvitationByNameMessage;
   import com.ankamagames.dofus.network.messages.game.guild.GuildInvitationMessage;
   import com.ankamagames.dofus.network.messages.game.guild.GuildInvitationStateRecrutedMessage;
   import com.ankamagames.dofus.network.messages.game.guild.GuildInvitationStateRecruterMessage;
   import com.ankamagames.dofus.network.messages.game.guild.GuildInvitedMessage;
   import com.ankamagames.dofus.network.messages.game.guild.GuildJoinedMessage;
   import com.ankamagames.dofus.network.messages.game.guild.GuildKickRequestMessage;
   import com.ankamagames.dofus.network.messages.game.guild.GuildLeftMessage;
   import com.ankamagames.dofus.network.messages.game.guild.GuildMemberLeavingMessage;
   import com.ankamagames.dofus.network.messages.game.guild.GuildMemberOnlineStatusMessage;
   import com.ankamagames.dofus.network.messages.game.guild.GuildMembershipMessage;
   import com.ankamagames.dofus.network.messages.game.guild.GuildModificationStartedMessage;
   import com.ankamagames.dofus.network.messages.game.guild.GuildMotdMessage;
   import com.ankamagames.dofus.network.messages.game.guild.GuildMotdSetErrorMessage;
   import com.ankamagames.dofus.network.messages.game.guild.GuildMotdSetRequestMessage;
   import com.ankamagames.dofus.network.messages.game.guild.GuildPaddockBoughtMessage;
   import com.ankamagames.dofus.network.messages.game.guild.GuildPaddockRemovedMessage;
   import com.ankamagames.dofus.network.messages.game.guild.GuildPaddockTeleportRequestMessage;
   import com.ankamagames.dofus.network.messages.game.guild.GuildSpellUpgradeRequestMessage;
   import com.ankamagames.dofus.network.messages.game.guild.tax.GuildFightJoinRequestMessage;
   import com.ankamagames.dofus.network.messages.game.guild.tax.GuildFightLeaveRequestMessage;
   import com.ankamagames.dofus.network.messages.game.guild.tax.GuildFightPlayersEnemiesListMessage;
   import com.ankamagames.dofus.network.messages.game.guild.tax.GuildFightPlayersEnemyRemoveMessage;
   import com.ankamagames.dofus.network.messages.game.guild.tax.GuildFightPlayersHelpersJoinMessage;
   import com.ankamagames.dofus.network.messages.game.guild.tax.GuildFightPlayersHelpersLeaveMessage;
   import com.ankamagames.dofus.network.messages.game.guild.tax.GuildFightTakePlaceRequestMessage;
   import com.ankamagames.dofus.network.messages.game.guild.tax.TaxCollectorAttackedMessage;
   import com.ankamagames.dofus.network.messages.game.guild.tax.TaxCollectorAttackedResultMessage;
   import com.ankamagames.dofus.network.messages.game.guild.tax.TaxCollectorErrorMessage;
   import com.ankamagames.dofus.network.messages.game.guild.tax.TaxCollectorListMessage;
   import com.ankamagames.dofus.network.messages.game.guild.tax.TaxCollectorMovementAddMessage;
   import com.ankamagames.dofus.network.messages.game.guild.tax.TaxCollectorMovementMessage;
   import com.ankamagames.dofus.network.messages.game.guild.tax.TaxCollectorMovementRemoveMessage;
   import com.ankamagames.dofus.network.messages.game.guild.tax.TaxCollectorMovementsOfflineMessage;
   import com.ankamagames.dofus.network.messages.game.guild.tax.TaxCollectorStateUpdateMessage;
   import com.ankamagames.dofus.network.messages.game.guild.tax.TopTaxCollectorListMessage;
   import com.ankamagames.dofus.network.messages.game.house.HouseTeleportRequestMessage;
   import com.ankamagames.dofus.network.messages.game.inventory.exchanges.ExchangeGuildTaxCollectorGetMessage;
   import com.ankamagames.dofus.network.messages.game.social.ContactLookErrorMessage;
   import com.ankamagames.dofus.network.messages.game.social.ContactLookMessage;
   import com.ankamagames.dofus.network.messages.game.social.ContactLookRequestByIdMessage;
   import com.ankamagames.dofus.network.types.game.character.CharacterMinimalPlusLookInformations;
   import com.ankamagames.dofus.network.types.game.character.status.PlayerStatus;
   import com.ankamagames.dofus.network.types.game.character.status.PlayerStatusExtended;
   import com.ankamagames.dofus.network.types.game.data.items.ObjectItemGenericQuantity;
   import com.ankamagames.dofus.network.types.game.friend.AcquaintanceInformation;
   import com.ankamagames.dofus.network.types.game.friend.AcquaintanceOnlineInformation;
   import com.ankamagames.dofus.network.types.game.friend.FriendInformations;
   import com.ankamagames.dofus.network.types.game.friend.FriendOnlineInformations;
   import com.ankamagames.dofus.network.types.game.friend.IgnoredOnlineInformations;
   import com.ankamagames.dofus.network.types.game.guild.GuildMember;
   import com.ankamagames.dofus.network.types.game.guild.tax.TaxCollectorInformations;
   import com.ankamagames.dofus.network.types.game.guild.tax.TaxCollectorMovement;
   import com.ankamagames.dofus.network.types.game.house.HouseInformationsForGuild;
   import com.ankamagames.dofus.network.types.game.paddock.PaddockContentInformations;
   import com.ankamagames.dofus.types.enums.NotificationTypeEnum;
   import com.ankamagames.dofus.uiApi.ChatApi;
   import com.ankamagames.jerakine.data.I18n;
   import com.ankamagames.jerakine.logger.Log;
   import com.ankamagames.jerakine.logger.Logger;
   import com.ankamagames.jerakine.managers.OptionManager;
   import com.ankamagames.jerakine.messages.Frame;
   import com.ankamagames.jerakine.messages.Message;
   import com.ankamagames.jerakine.types.enums.Priority;
   import com.ankamagames.jerakine.utils.pattern.PatternDecoder;
   import flash.utils.Dictionary;
   import flash.utils.getQualifiedClassName;
   
   public class SocialFrame implements Frame
   {
      
      protected static const _log:Logger = Log.getLogger(getQualifiedClassName(SocialFrame));
      
      private static var _instance:SocialFrame;
       
      
      private var _guildDialogFrame:GuildDialogFrame;
      
      private var _friendsList:Array;
      
      private var _contactsList:Array;
      
      private var _enemiesList:Array;
      
      private var _ignoredList:Array;
      
      private var _spouse:SpouseWrapper;
      
      private var _hasGuild:Boolean = false;
      
      private var _hasSpouse:Boolean = false;
      
      private var _guild:GuildWrapper;
      
      private var _guildMembers:Vector.<GuildMember>;
      
      private var _guildHouses:Vector.<GuildHouseWrapper>;
      
      private var _guildHousesList:Boolean = false;
      
      private var _guildHousesListUpdate:Boolean = false;
      
      private var _guildPaddocks:Vector.<PaddockContentInformations>;
      
      private var _guildPaddocksMax:int = 1;
      
      private var _shareStatus:Boolean = true;
      
      private var _warnOnFrienConnec:Boolean;
      
      private var _warnOnMemberConnec:Boolean;
      
      private var _warnWhenFriendOrGuildMemberLvlUp:Boolean;
      
      private var _warnWhenFriendOrGuildMemberAchieve:Boolean;
      
      private var _warnOnHardcoreDeath:Boolean;
      
      private var _autoLeaveHelpers:Boolean;
      
      private var _allGuilds:Dictionary;
      
      private var _socialDatFrame:SocialDataFrame;
      
      private var _dareFrame:DareFrame;
      
      private var _dungeonTopTaxCollectors:Vector.<TaxCollectorInformations>;
      
      private var _topTaxCollectors:Vector.<TaxCollectorInformations>;
      
      public function SocialFrame()
      {
         this._guildHouses = new Vector.<GuildHouseWrapper>();
         this._guildPaddocks = new Vector.<PaddockContentInformations>();
         this._allGuilds = new Dictionary(true);
         super();
      }
      
      public static function getInstance() : SocialFrame
      {
         return _instance;
      }
      
      public function get priority() : int
      {
         return Priority.NORMAL;
      }
      
      public function get friendsList() : Array
      {
         return this._friendsList;
      }
      
      public function get contactsList() : Array
      {
         return this._contactsList;
      }
      
      public function get enemiesList() : Array
      {
         return this._enemiesList;
      }
      
      public function get ignoredList() : Array
      {
         return this._ignoredList;
      }
      
      public function get spouse() : SpouseWrapper
      {
         return this._spouse;
      }
      
      public function get hasGuild() : Boolean
      {
         return this._hasGuild;
      }
      
      public function get hasSpouse() : Boolean
      {
         return this._hasSpouse;
      }
      
      public function get guild() : GuildWrapper
      {
         return this._guild;
      }
      
      public function get guildmembers() : Vector.<GuildMember>
      {
         return this._guildMembers;
      }
      
      public function get guildHouses() : Vector.<GuildHouseWrapper>
      {
         return this._guildHouses;
      }
      
      public function get guildPaddocks() : Vector.<PaddockContentInformations>
      {
         return this._guildPaddocks;
      }
      
      public function get maxGuildPaddocks() : int
      {
         return this._guildPaddocksMax;
      }
      
      public function get warnFriendConnec() : Boolean
      {
         return this._warnOnFrienConnec;
      }
      
      public function get shareStatus() : Boolean
      {
         return this._shareStatus;
      }
      
      public function get warnMemberConnec() : Boolean
      {
         return this._warnOnMemberConnec;
      }
      
      public function get warnWhenFriendOrGuildMemberLvlUp() : Boolean
      {
         return this._warnWhenFriendOrGuildMemberLvlUp;
      }
      
      public function get warnWhenFriendOrGuildMemberAchieve() : Boolean
      {
         return this._warnWhenFriendOrGuildMemberAchieve;
      }
      
      public function get warnOnHardcoreDeath() : Boolean
      {
         return this._warnOnHardcoreDeath;
      }
      
      public function get guildHousesUpdateNeeded() : Boolean
      {
         return this._guildHousesListUpdate;
      }
      
      public function getGuildById(id:int) : GuildFactSheetWrapper
      {
         return this._allGuilds[id];
      }
      
      public function updateGuildById(id:int, guild:GuildFactSheetWrapper) : void
      {
         this._allGuilds[id] = guild;
      }
      
      public function pushed() : Boolean
      {
         _instance = this;
         this._enemiesList = new Array();
         this._ignoredList = new Array();
         this._socialDatFrame = new SocialDataFrame();
         this._guildDialogFrame = new GuildDialogFrame();
         this._dareFrame = new DareFrame();
         Kernel.getWorker().addFrame(this._socialDatFrame);
         Kernel.getWorker().addFrame(this._dareFrame);
         ConnectionsHandler.getConnection().send(new FriendsGetListMessage());
         ConnectionsHandler.getConnection().send(new AcquaintancesGetListMessage());
         ConnectionsHandler.getConnection().send(new IgnoredGetListMessage());
         ConnectionsHandler.getConnection().send(new SpouseGetInformationsMessage());
         return true;
      }
      
      public function pulled() : Boolean
      {
         _instance = null;
         TaxCollectorsManager.getInstance().destroy();
         return true;
      }
      
      public function process(msg:Message) : Boolean
      {
         /*
          * Decompilation error
          * Timeout (1 minute) was reached
          * Instruction count: 8410
          */
         throw new flash.errors.IllegalOperationError("Not decompiled due to timeout");
      }
      
      private function displayError(reason:uint) : void
      {
         var txt:String = null;
         switch(reason)
         {
            case ListAddFailureEnum.LIST_ADD_FAILURE_UNKNOWN:
               txt = I18n.getUiText("ui.common.unknowReason");
               break;
            case ListAddFailureEnum.LIST_ADD_FAILURE_OVER_QUOTA:
               txt = I18n.getUiText("ui.social.friend.addFailureListFull");
               break;
            case ListAddFailureEnum.LIST_ADD_FAILURE_NOT_FOUND:
               txt = I18n.getUiText("ui.social.friend.addFailureNotFound");
               break;
            case ListAddFailureEnum.LIST_ADD_FAILURE_EGOCENTRIC:
               txt = I18n.getUiText("ui.social.friend.addFailureEgocentric");
               break;
            case ListAddFailureEnum.LIST_ADD_FAILURE_IS_DOUBLE:
               txt = I18n.getUiText("ui.social.friend.addFailureAlreadyInList");
               break;
            case ListAddFailureEnum.LIST_ADD_FAILURE_IS_CONFLICTING_DOUBLE:
               txt = I18n.getUiText("ui.social.friend.addFailureAlreadyInConflictedList");
         }
         KernelEventsManager.getInstance().processCallback(ChatHookList.TextInformation,txt,ChatFrame.RED_CHANNEL_ID,TimeManager.getInstance().getTimestamp());
      }
      
      public function isIgnored(name:String, accountId:int = 0) : Boolean
      {
         var loser:IgnoredWrapper = null;
         var accountName:String = AccountManager.getInstance().getAccountName(name);
         for each(loser in this._ignoredList)
         {
            if(accountId != 0 && loser.accountId == accountId || accountName && loser.name.toLowerCase() == accountName.toLowerCase())
            {
               return true;
            }
         }
         return false;
      }
      
      public function isFriendOrContact(playerName:String) : Boolean
      {
         return this.isFriend(playerName) || this.isContact(playerName);
      }
      
      public function isFriend(playerName:String) : Boolean
      {
         var fw:FriendWrapper = null;
         if(this._friendsList == null)
         {
            return false;
         }
         var n:int = this._friendsList.length;
         for(var i:int = 0; i < n; )
         {
            fw = this._friendsList[i];
            if(fw.playerName == playerName)
            {
               return true;
            }
            i++;
         }
         return false;
      }
      
      public function isContact(playerName:String) : Boolean
      {
         var cw:ContactWrapper = null;
         if(this._contactsList == null)
         {
            return false;
         }
         var n:int = this._contactsList.length;
         for(var i:int = 0; i < n; )
         {
            cw = this._contactsList[i];
            if(cw.playerName == playerName)
            {
               return true;
            }
            i++;
         }
         return false;
      }
      
      public function isEnemy(playerName:String) : Boolean
      {
         var ew:EnemyWrapper = null;
         var n:int = this._enemiesList.length;
         for(var i:int = 0; i < n; )
         {
            ew = this._enemiesList[i];
            if(ew.playerName == playerName)
            {
               return true;
            }
            i++;
         }
         return false;
      }
   }
}
