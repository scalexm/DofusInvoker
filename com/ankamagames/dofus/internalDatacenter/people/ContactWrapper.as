package com.ankamagames.dofus.internalDatacenter.people
{
   import com.ankamagames.dofus.internalDatacenter.guild.EmblemWrapper;
   import com.ankamagames.dofus.network.types.game.character.status.PlayerStatusExtended;
   import com.ankamagames.dofus.network.types.game.friend.AcquaintanceInformation;
   import com.ankamagames.dofus.network.types.game.friend.AcquaintanceOnlineInformation;
   import com.ankamagames.jerakine.interfaces.IDataCenter;
   
   public class ContactWrapper implements IDataCenter
   {
       
      
      public var name:String;
      
      public var accountId:int;
      
      public var state:int;
      
      public var online:Boolean = false;
      
      public var type:String = "Contact";
      
      public var playerId:Number;
      
      public var playerName:String = "";
      
      public var moodSmileyId:int = 0;
      
      public var statusId:uint = 0;
      
      public var awayMessage:String = "";
      
      public var lastConnection:uint = 0;
      
      public var level:int = 0;
      
      public var alignmentSide:int = 0;
      
      public var breed:uint = 0;
      
      public var sex:uint = 2;
      
      public var realGuildName:String = "";
      
      public var guildName:String = "";
      
      public var guildId:int = 0;
      
      public var guildUpEmblem:EmblemWrapper = null;
      
      public var guildBackEmblem:EmblemWrapper = null;
      
      public var achievementPoints:int = 0;
      
      public var leagueId:int = 0;
      
      public var ladderPosition:int = 0;
      
      public var havenbagShared:Boolean = false;
      
      public function ContactWrapper(o:AcquaintanceInformation)
      {
         super();
         this.name = o.accountName;
         this.accountId = o.accountId;
         this.state = o.playerState;
         if(o is AcquaintanceOnlineInformation)
         {
            this.playerName = AcquaintanceOnlineInformation(o).playerName;
            this.playerId = AcquaintanceOnlineInformation(o).playerId;
            this.moodSmileyId = AcquaintanceOnlineInformation(o).moodSmileyId;
            this.statusId = AcquaintanceOnlineInformation(o).status.statusId;
            if(AcquaintanceOnlineInformation(o).status is PlayerStatusExtended)
            {
               this.awayMessage = PlayerStatusExtended(AcquaintanceOnlineInformation(o).status).message;
            }
            this.online = true;
         }
      }
   }
}
