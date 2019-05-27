package com.ankamagames.dofus.internalDatacenter.people
{
   import com.ankamagames.dofus.internalDatacenter.guild.EmblemWrapper;
   import com.ankamagames.dofus.network.types.game.character.status.PlayerStatusExtended;
   import com.ankamagames.dofus.network.types.game.context.roleplay.GuildInformations;
   import com.ankamagames.dofus.network.types.game.friend.FriendInformations;
   import com.ankamagames.dofus.network.types.game.friend.FriendOnlineInformations;
   import com.ankamagames.jerakine.data.I18n;
   import com.ankamagames.jerakine.interfaces.IDataCenter;
   
   public class FriendWrapper implements IDataCenter
   {
       
      
      private var _item:FriendInformations;
      
      public var name:String;
      
      public var accountId:int;
      
      public var state:int;
      
      public var lastConnection:uint;
      
      public var online:Boolean = false;
      
      public var type:String = "Friend";
      
      public var playerId:Number;
      
      public var playerName:String = "";
      
      public var level:int = 0;
      
      public var moodSmileyId:int = 0;
      
      public var alignmentSide:int = 0;
      
      public var breed:uint = 0;
      
      public var sex:uint = 2;
      
      public var realGuildName:String = "";
      
      public var guildName:String = "";
      
      public var guildId:int = 0;
      
      public var guildUpEmblem:EmblemWrapper;
      
      public var guildBackEmblem:EmblemWrapper;
      
      public var achievementPoints:int = 0;
      
      public var leagueId:int = 0;
      
      public var ladderPosition:int = 0;
      
      public var statusId:uint = 0;
      
      public var awayMessage:String = "";
      
      public var havenbagShared:Boolean;
      
      public function FriendWrapper(o:FriendInformations)
      {
         super();
         this._item = o;
         this.name = o.accountName;
         this.accountId = o.accountId;
         this.state = o.playerState;
         this.lastConnection = o.lastConnection;
         this.achievementPoints = o.achievementPoints;
         this.leagueId = o.leagueId;
         this.ladderPosition = o.ladderPosition;
         if(o is FriendOnlineInformations)
         {
            this.playerName = FriendOnlineInformations(o).playerName;
            this.playerId = FriendOnlineInformations(o).playerId;
            this.level = FriendOnlineInformations(o).level;
            this.alignmentSide = FriendOnlineInformations(o).alignmentSide;
            this.breed = FriendOnlineInformations(o).breed;
            this.sex = !!FriendOnlineInformations(o).sex?uint(1):uint(0);
            if(FriendOnlineInformations(o).guildInfo.guildName == "#NONAME#")
            {
               this.guildName = I18n.getUiText("ui.guild.noName");
            }
            else
            {
               this.guildName = FriendOnlineInformations(o).guildInfo.guildName;
            }
            this.realGuildName = FriendOnlineInformations(o).guildInfo.guildName;
            this.guildId = FriendOnlineInformations(o).guildInfo.guildId;
            if(FriendOnlineInformations(o).guildInfo is GuildInformations && GuildInformations(FriendOnlineInformations(o).guildInfo).guildEmblem)
            {
               this.guildBackEmblem = EmblemWrapper.fromNetwork(GuildInformations(FriendOnlineInformations(o).guildInfo).guildEmblem,true);
               this.guildUpEmblem = EmblemWrapper.fromNetwork(GuildInformations(FriendOnlineInformations(o).guildInfo).guildEmblem,false);
            }
            this.moodSmileyId = FriendOnlineInformations(o).moodSmileyId;
            this.statusId = FriendOnlineInformations(o).status.statusId;
            if(FriendOnlineInformations(o).status is PlayerStatusExtended)
            {
               this.awayMessage = PlayerStatusExtended(FriendOnlineInformations(o).status).message;
            }
            this.online = true;
            this.havenbagShared = FriendOnlineInformations(o).havenBagShared;
         }
      }
   }
}
