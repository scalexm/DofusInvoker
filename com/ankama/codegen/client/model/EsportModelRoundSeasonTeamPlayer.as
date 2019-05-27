package com.ankama.codegen.client.model
{
   public class EsportModelRoundSeasonTeamPlayer
   {
       
      
      public var id:Number = 0;
      
      public var roundId:Number = 0;
      
      public var round:EsportModelRound = null;
      
      public var seasonTeamPlayerId:Number = 0;
      
      public var seasonTeamPlayer:EsportModelSeasonTeamPlayer = null;
      
      public var playerDead:Boolean = false;
      
      public var playerKillNumber:Number = 0;
      
      public var roundPickAndBans:Array;
      
      public var createdAt:Date = null;
      
      public function EsportModelRoundSeasonTeamPlayer()
      {
         this.roundPickAndBans = new Array();
         super();
      }
      
      public function toString() : String
      {
         var sb:String = "";
         sb.concat("class EsportModelRoundSeasonTeamPlayer {\n");
         sb.concat("  id: ").concat(this.id).concat("\n");
         sb.concat("  roundId: ").concat(this.roundId).concat("\n");
         sb.concat("  round: ").concat(this.round).concat("\n");
         sb.concat("  seasonTeamPlayerId: ").concat(this.seasonTeamPlayerId).concat("\n");
         sb.concat("  seasonTeamPlayer: ").concat(this.seasonTeamPlayer).concat("\n");
         sb.concat("  playerDead: ").concat(this.playerDead).concat("\n");
         sb.concat("  playerKillNumber: ").concat(this.playerKillNumber).concat("\n");
         sb.concat("  roundPickAndBans: ").concat(this.roundPickAndBans).concat("\n");
         sb.concat("  createdAt: ").concat(this.createdAt).concat("\n");
         sb.concat("}\n");
         return sb;
      }
   }
}
