package com.ankamagames.dofus.logic.game.common.misc
{
   import avmplus.getQualifiedClassName;
   import com.ankamagames.dofus.kernel.Kernel;
   import com.ankamagames.dofus.kernel.net.ConnectionType;
   import com.ankamagames.dofus.logic.game.fight.frames.FightEntitiesFrame;
   import com.ankamagames.dofus.network.enums.ChatActivableChannelsEnum;
   import com.ankamagames.dofus.network.messages.common.basic.BasicStatMessage;
   import com.ankamagames.dofus.network.messages.common.basic.BasicStatWithDataMessage;
   import com.ankamagames.dofus.network.messages.game.achievement.AchievementDetailedListRequestMessage;
   import com.ankamagames.dofus.network.messages.game.achievement.AchievementDetailsRequestMessage;
   import com.ankamagames.dofus.network.messages.game.achievement.AchievementRewardRequestMessage;
   import com.ankamagames.dofus.network.messages.game.achievement.FriendGuildSetWarnOnAchievementCompleteMessage;
   import com.ankamagames.dofus.network.messages.game.alliance.AllianceBulletinSetRequestMessage;
   import com.ankamagames.dofus.network.messages.game.alliance.AllianceChangeGuildRightsMessage;
   import com.ankamagames.dofus.network.messages.game.alliance.AllianceCreationValidMessage;
   import com.ankamagames.dofus.network.messages.game.alliance.AllianceFactsRequestMessage;
   import com.ankamagames.dofus.network.messages.game.alliance.AllianceInsiderInfoRequestMessage;
   import com.ankamagames.dofus.network.messages.game.alliance.AllianceInvitationAnswerMessage;
   import com.ankamagames.dofus.network.messages.game.alliance.AllianceInvitationMessage;
   import com.ankamagames.dofus.network.messages.game.alliance.AllianceKickRequestMessage;
   import com.ankamagames.dofus.network.messages.game.alliance.AllianceModificationEmblemValidMessage;
   import com.ankamagames.dofus.network.messages.game.alliance.AllianceModificationNameAndTagValidMessage;
   import com.ankamagames.dofus.network.messages.game.alliance.AllianceModificationValidMessage;
   import com.ankamagames.dofus.network.messages.game.alliance.AllianceMotdSetRequestMessage;
   import com.ankamagames.dofus.network.messages.game.basic.BasicWhoIsRequestMessage;
   import com.ankamagames.dofus.network.messages.game.basic.NumericWhoIsRequestMessage;
   import com.ankamagames.dofus.network.messages.game.character.status.PlayerStatusUpdateRequestMessage;
   import com.ankamagames.dofus.network.messages.game.chat.ChatClientMultiMessage;
   import com.ankamagames.dofus.network.messages.game.chat.ChatClientMultiWithObjectMessage;
   import com.ankamagames.dofus.network.messages.game.chat.ChatClientPrivateMessage;
   import com.ankamagames.dofus.network.messages.game.chat.ChatClientPrivateWithObjectMessage;
   import com.ankamagames.dofus.network.messages.game.chat.channel.ChannelEnablingMessage;
   import com.ankamagames.dofus.network.messages.game.chat.smiley.MoodSmileyRequestMessage;
   import com.ankamagames.dofus.network.messages.game.context.mount.MountHarnessColorsUpdateRequestMessage;
   import com.ankamagames.dofus.network.messages.game.context.mount.MountHarnessDissociateRequestMessage;
   import com.ankamagames.dofus.network.messages.game.context.mount.MountInformationRequestMessage;
   import com.ankamagames.dofus.network.messages.game.context.mount.MountSetXpRatioRequestMessage;
   import com.ankamagames.dofus.network.messages.game.context.notification.NotificationResetMessage;
   import com.ankamagames.dofus.network.messages.game.context.notification.NotificationUpdateFlagMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.fight.arena.GameRolePlayArenaFightAnswerMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.fight.arena.GameRolePlayArenaRegisterMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.fight.arena.GameRolePlayArenaUnregisterMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.job.JobCrafterDirectoryDefineSettingsMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.job.JobCrafterDirectoryEntryRequestMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.job.JobCrafterDirectoryListRequestMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.npc.NpcDialogReplyMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.npc.NpcGenericActionRequestMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.party.DungeonPartyFinderAvailableDungeonsRequestMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.party.DungeonPartyFinderListenRequestMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.party.DungeonPartyFinderRegisterRequestMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.party.PartyAbdicateThroneMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.party.PartyAcceptInvitationMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.party.PartyCancelInvitationMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.party.PartyFollowMemberRequestMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.party.PartyFollowThisMemberRequestMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.party.PartyInvitationArenaRequestMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.party.PartyInvitationDetailsRequestMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.party.PartyInvitationDungeonRequestMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.party.PartyInvitationRequestMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.party.PartyKickRequestMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.party.PartyLeaveRequestMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.party.PartyLocateMembersRequestMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.party.PartyNameSetRequestMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.party.PartyPledgeLoyaltyRequestMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.party.PartyRefuseInvitationMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.party.PartyStopFollowRequestMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.quest.GuidedModeQuitRequestMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.quest.GuidedModeReturnRequestMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.quest.QuestListRequestMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.quest.QuestObjectiveValidationMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.quest.QuestStartRequestMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.quest.QuestStepInfoRequestMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.stats.StatsUpgradeRequestMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.treasureHunt.PortalUseRequestMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.treasureHunt.TreasureHuntDigRequestMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.treasureHunt.TreasureHuntFlagRemoveRequestMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.treasureHunt.TreasureHuntFlagRequestMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.treasureHunt.TreasureHuntGiveUpRequestMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.treasureHunt.TreasureHuntLegendaryRequestMessage;
   import com.ankamagames.dofus.network.messages.game.friend.FriendJoinRequestMessage;
   import com.ankamagames.dofus.network.messages.game.friend.FriendSetWarnOnConnectionMessage;
   import com.ankamagames.dofus.network.messages.game.friend.FriendSetWarnOnLevelGainMessage;
   import com.ankamagames.dofus.network.messages.game.friend.FriendSpouseFollowWithCompassRequestMessage;
   import com.ankamagames.dofus.network.messages.game.friend.FriendSpouseJoinRequestMessage;
   import com.ankamagames.dofus.network.messages.game.friend.GuildMemberSetWarnOnConnectionMessage;
   import com.ankamagames.dofus.network.messages.game.friend.SpouseGetInformationsMessage;
   import com.ankamagames.dofus.network.messages.game.guild.GuildBulletinSetRequestMessage;
   import com.ankamagames.dofus.network.messages.game.guild.GuildChangeMemberParametersMessage;
   import com.ankamagames.dofus.network.messages.game.guild.GuildCharacsUpgradeRequestMessage;
   import com.ankamagames.dofus.network.messages.game.guild.GuildCreationValidMessage;
   import com.ankamagames.dofus.network.messages.game.guild.GuildFactsRequestMessage;
   import com.ankamagames.dofus.network.messages.game.guild.GuildGetInformationsMessage;
   import com.ankamagames.dofus.network.messages.game.guild.GuildInvitationAnswerMessage;
   import com.ankamagames.dofus.network.messages.game.guild.GuildInvitationByNameMessage;
   import com.ankamagames.dofus.network.messages.game.guild.GuildInvitationMessage;
   import com.ankamagames.dofus.network.messages.game.guild.GuildKickRequestMessage;
   import com.ankamagames.dofus.network.messages.game.guild.GuildModificationEmblemValidMessage;
   import com.ankamagames.dofus.network.messages.game.guild.GuildModificationNameValidMessage;
   import com.ankamagames.dofus.network.messages.game.guild.GuildModificationValidMessage;
   import com.ankamagames.dofus.network.messages.game.guild.GuildMotdSetRequestMessage;
   import com.ankamagames.dofus.network.messages.game.guild.GuildPaddockTeleportRequestMessage;
   import com.ankamagames.dofus.network.messages.game.guild.GuildSpellUpgradeRequestMessage;
   import com.ankamagames.dofus.network.messages.game.guild.tax.GameRolePlayTaxCollectorFightRequestMessage;
   import com.ankamagames.dofus.network.messages.game.guild.tax.GuildFightJoinRequestMessage;
   import com.ankamagames.dofus.network.messages.game.guild.tax.GuildFightLeaveRequestMessage;
   import com.ankamagames.dofus.network.messages.game.guild.tax.GuildFightTakePlaceRequestMessage;
   import com.ankamagames.dofus.network.messages.game.house.HouseTeleportRequestMessage;
   import com.ankamagames.dofus.network.messages.game.inventory.ObjectAveragePricesGetMessage;
   import com.ankamagames.dofus.network.messages.game.inventory.exchanges.JobBookSubscribeRequestMessage;
   import com.ankamagames.dofus.network.messages.game.look.AccessoryPreviewRequestMessage;
   import com.ankamagames.dofus.network.messages.game.prism.PrismAttackRequestMessage;
   import com.ankamagames.dofus.network.messages.game.prism.PrismFightJoinLeaveRequestMessage;
   import com.ankamagames.dofus.network.messages.game.prism.PrismFightSwapRequestMessage;
   import com.ankamagames.dofus.network.messages.game.prism.PrismInfoJoinLeaveRequestMessage;
   import com.ankamagames.dofus.network.messages.game.prism.PrismModuleExchangeRequestMessage;
   import com.ankamagames.dofus.network.messages.game.prism.PrismSetSabotagedRequestMessage;
   import com.ankamagames.dofus.network.messages.game.prism.PrismSettingsRequestMessage;
   import com.ankamagames.dofus.network.messages.game.prism.PrismUseRequestMessage;
   import com.ankamagames.dofus.network.messages.game.prism.PrismsListRegisterMessage;
   import com.ankamagames.dofus.network.messages.game.social.ContactLookRequestByIdMessage;
   import com.ankamagames.dofus.network.messages.game.social.ContactLookRequestByNameMessage;
   import com.ankamagames.dofus.network.messages.game.tinsel.OrnamentSelectRequestMessage;
   import com.ankamagames.dofus.network.messages.game.tinsel.TitleSelectRequestMessage;
   import com.ankamagames.dofus.network.messages.security.ClientKeyMessage;
   import com.ankamagames.dofus.network.types.game.context.fight.GameFightFighterNamedInformations;
   import com.ankamagames.jerakine.logger.Log;
   import com.ankamagames.jerakine.logger.Logger;
   import com.ankamagames.jerakine.network.IMessageRouter;
   import com.ankamagames.jerakine.network.INetworkMessage;
   
   public class KoliseumMessageRouter implements IMessageRouter
   {
      
      protected static const _log:Logger = Log.getLogger(getQualifiedClassName(KoliseumMessageRouter));
       
      
      private var _fightersIds:Vector.<Number>;
      
      private var _fightersNames:Vector.<String>;
      
      public function KoliseumMessageRouter()
      {
         super();
      }
      
      public function getConnectionId(msg:INetworkMessage) : String
      {
         var ccmmsg:ChatClientMultiMessage = null;
         var ccpmsg:ChatClientPrivateMessage = null;
         var bwirmsg:BasicWhoIsRequestMessage = null;
         var nwirmsg:NumericWhoIsRequestMessage = null;
         var clrblmsg:ContactLookRequestByNameMessage = null;
         var clrbimsg:ContactLookRequestByIdMessage = null;
         var returnType:String = ConnectionType.TO_KOLI_SERVER;
         switch(true)
         {
            case msg is ChatClientMultiMessage:
            case msg is ChatClientMultiWithObjectMessage:
               ccmmsg = msg as ChatClientMultiMessage;
               if(ccmmsg.channel != ChatActivableChannelsEnum.CHANNEL_ARENA && ccmmsg.channel != ChatActivableChannelsEnum.CHANNEL_GLOBAL && ccmmsg.channel != ChatActivableChannelsEnum.CHANNEL_TEAM)
               {
                  returnType = ConnectionType.TO_GAME_SERVER;
                  break;
               }
               break;
            case msg is ChatClientPrivateMessage:
            case msg is ChatClientPrivateWithObjectMessage:
               ccpmsg = msg as ChatClientPrivateMessage;
               if(!this.isPlayerNameInFight(ccpmsg.receiver))
               {
                  returnType = ConnectionType.TO_GAME_SERVER;
                  break;
               }
               break;
            case msg is BasicWhoIsRequestMessage:
               bwirmsg = msg as BasicWhoIsRequestMessage;
               if(!this.isPlayerNameInFight(bwirmsg.search))
               {
                  returnType = ConnectionType.TO_GAME_SERVER;
                  break;
               }
               break;
            case msg is NumericWhoIsRequestMessage:
               nwirmsg = msg as NumericWhoIsRequestMessage;
               if(!this.isPlayerIdInFight(nwirmsg.playerId))
               {
                  returnType = ConnectionType.TO_GAME_SERVER;
                  break;
               }
               break;
            case msg is ContactLookRequestByNameMessage:
               clrblmsg = msg as ContactLookRequestByNameMessage;
               if(!this.isPlayerNameInFight(clrblmsg.playerName))
               {
                  returnType = ConnectionType.TO_GAME_SERVER;
                  break;
               }
               break;
            case msg is ContactLookRequestByIdMessage:
               clrbimsg = msg as ContactLookRequestByIdMessage;
               if(!this.isPlayerIdInFight(clrbimsg.playerId))
               {
                  returnType = ConnectionType.TO_GAME_SERVER;
                  break;
               }
               break;
            case msg is ChannelEnablingMessage:
            case msg is PlayerStatusUpdateRequestMessage:
            case msg is StatsUpgradeRequestMessage:
            case msg is MountSetXpRatioRequestMessage:
               returnType = ConnectionType.TO_ALL_SERVERS;
               break;
            case msg is MoodSmileyRequestMessage:
            case msg is ClientKeyMessage:
            case msg is BasicStatMessage:
            case msg is BasicStatWithDataMessage:
            case msg is AchievementDetailsRequestMessage:
            case msg is AchievementDetailedListRequestMessage:
            case msg is AchievementRewardRequestMessage:
            case msg is FriendGuildSetWarnOnAchievementCompleteMessage:
            case msg is PartyInvitationRequestMessage:
            case msg is PartyInvitationDungeonRequestMessage:
            case msg is PartyInvitationArenaRequestMessage:
            case msg is PartyInvitationDetailsRequestMessage:
            case msg is PartyAcceptInvitationMessage:
            case msg is PartyRefuseInvitationMessage:
            case msg is PartyCancelInvitationMessage:
            case msg is PartyAbdicateThroneMessage:
            case msg is PartyFollowMemberRequestMessage:
            case msg is PartyFollowThisMemberRequestMessage:
            case msg is PartyStopFollowRequestMessage:
            case msg is PartyLocateMembersRequestMessage:
            case msg is PartyLeaveRequestMessage:
            case msg is PartyKickRequestMessage:
            case msg is PartyPledgeLoyaltyRequestMessage:
            case msg is PartyNameSetRequestMessage:
            case msg is DungeonPartyFinderAvailableDungeonsRequestMessage:
            case msg is DungeonPartyFinderListenRequestMessage:
            case msg is DungeonPartyFinderRegisterRequestMessage:
            case msg is SpouseGetInformationsMessage:
            case msg is FriendSetWarnOnConnectionMessage:
            case msg is FriendSetWarnOnLevelGainMessage:
            case msg is FriendJoinRequestMessage:
            case msg is FriendSpouseJoinRequestMessage:
            case msg is FriendSpouseFollowWithCompassRequestMessage:
            case msg is HouseTeleportRequestMessage:
            case msg is AllianceCreationValidMessage:
            case msg is AllianceModificationEmblemValidMessage:
            case msg is AllianceModificationNameAndTagValidMessage:
            case msg is AllianceModificationValidMessage:
            case msg is AllianceInvitationMessage:
            case msg is AllianceInvitationAnswerMessage:
            case msg is AllianceKickRequestMessage:
            case msg is AllianceFactsRequestMessage:
            case msg is AllianceChangeGuildRightsMessage:
            case msg is AllianceInsiderInfoRequestMessage:
            case msg is AllianceMotdSetRequestMessage:
            case msg is AllianceBulletinSetRequestMessage:
            case msg is GuildGetInformationsMessage:
            case msg is GuildModificationNameValidMessage:
            case msg is GuildModificationEmblemValidMessage:
            case msg is GuildModificationValidMessage:
            case msg is GuildCreationValidMessage:
            case msg is GuildInvitationMessage:
            case msg is GuildInvitationByNameMessage:
            case msg is GuildInvitationAnswerMessage:
            case msg is GuildKickRequestMessage:
            case msg is GuildChangeMemberParametersMessage:
            case msg is GuildSpellUpgradeRequestMessage:
            case msg is GuildCharacsUpgradeRequestMessage:
            case msg is GuildPaddockTeleportRequestMessage:
            case msg is GuildMemberSetWarnOnConnectionMessage:
            case msg is GuildMotdSetRequestMessage:
            case msg is GuildBulletinSetRequestMessage:
            case msg is GuildFactsRequestMessage:
            case msg is GameRolePlayTaxCollectorFightRequestMessage:
            case msg is GuildFightJoinRequestMessage:
            case msg is GuildFightTakePlaceRequestMessage:
            case msg is GuildFightLeaveRequestMessage:
            case msg is PrismFightJoinLeaveRequestMessage:
            case msg is PrismSetSabotagedRequestMessage:
            case msg is PrismFightSwapRequestMessage:
            case msg is PrismInfoJoinLeaveRequestMessage:
            case msg is PrismUseRequestMessage:
            case msg is PrismAttackRequestMessage:
            case msg is PrismsListRegisterMessage:
            case msg is PrismSettingsRequestMessage:
            case msg is PrismModuleExchangeRequestMessage:
            case msg is QuestListRequestMessage:
            case msg is QuestStartRequestMessage:
            case msg is QuestStepInfoRequestMessage:
            case msg is QuestObjectiveValidationMessage:
            case msg is GuidedModeReturnRequestMessage:
            case msg is GuidedModeQuitRequestMessage:
            case msg is NotificationUpdateFlagMessage:
            case msg is NotificationResetMessage:
            case msg is NpcGenericActionRequestMessage:
            case msg is NpcDialogReplyMessage:
            case msg is JobCrafterDirectoryListRequestMessage:
            case msg is JobCrafterDirectoryDefineSettingsMessage:
            case msg is JobCrafterDirectoryEntryRequestMessage:
            case msg is JobBookSubscribeRequestMessage:
            case msg is ObjectAveragePricesGetMessage:
            case msg is MountInformationRequestMessage:
            case msg is MountHarnessDissociateRequestMessage:
            case msg is MountHarnessColorsUpdateRequestMessage:
            case msg is TitleSelectRequestMessage:
            case msg is OrnamentSelectRequestMessage:
            case msg is AccessoryPreviewRequestMessage:
            case msg is TreasureHuntLegendaryRequestMessage:
            case msg is TreasureHuntDigRequestMessage:
            case msg is TreasureHuntFlagRequestMessage:
            case msg is TreasureHuntFlagRemoveRequestMessage:
            case msg is TreasureHuntGiveUpRequestMessage:
            case msg is PortalUseRequestMessage:
            case msg is GameRolePlayArenaRegisterMessage:
            case msg is GameRolePlayArenaUnregisterMessage:
            case msg is GameRolePlayArenaFightAnswerMessage:
               returnType = ConnectionType.TO_GAME_SERVER;
         }
         return returnType;
      }
      
      private function isPlayerNameInFight(name:String) : Boolean
      {
         if(!this._fightersNames || this._fightersNames.length == 0)
         {
            this.updateFighters();
         }
         if(this._fightersNames.indexOf(name.toLocaleUpperCase()) != -1)
         {
            return true;
         }
         return false;
      }
      
      private function isPlayerIdInFight(id:Number) : Boolean
      {
         if(!this._fightersNames || this._fightersNames.length == 0)
         {
            this.updateFighters();
         }
         if(this._fightersIds.indexOf(id) != -1)
         {
            return true;
         }
         return false;
      }
      
      private function updateFighters() : void
      {
         var entityId:Number = NaN;
         var fighter:GameFightFighterNamedInformations = null;
         this._fightersIds = new Vector.<Number>();
         this._fightersNames = new Vector.<String>();
         var entitiesFrame:FightEntitiesFrame = Kernel.getWorker().getFrame(FightEntitiesFrame) as FightEntitiesFrame;
         if(entitiesFrame)
         {
            this._fightersIds = entitiesFrame.getEntitiesIdsList();
            for each(entityId in this._fightersIds)
            {
               fighter = entitiesFrame.getEntityInfos(entityId) as GameFightFighterNamedInformations;
               if(fighter)
               {
                  this._fightersNames.push(fighter.name.toLocaleUpperCase());
               }
            }
         }
      }
   }
}
