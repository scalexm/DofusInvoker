package com.ankama.codegen.client.model
{
   public class EsportModelSeasonTeamPlayer
   {
       
      
      public var id:Number = 0;
      
      public var seasonId:Number = 0;
      
      public var season:EsportModelSeason = null;
      
      public var teamId:Number = 0;
      
      public var team:EsportModelTeam = null;
      
      public var player:EsportModelPlayer = null;
      
      public var playerId:Number = 0;
      
      public var roundSeasonTeamPlayers:Array;
      
      public var createdAt:Date = null;
      
      public function EsportModelSeasonTeamPlayer()
      {
         this.roundSeasonTeamPlayers = new Array();
         super();
      }
      
      public function toString() : String
      {
         var sb:String = "";
         sb.concat("class EsportModelSeasonTeamPlayer {\n");
         sb.concat("  id: ").concat(this.id).concat("\n");
         sb.concat("  seasonId: ").concat(this.seasonId).concat("\n");
         sb.concat("  season: ").concat(this.season).concat("\n");
         sb.concat("  teamId: ").concat(this.teamId).concat("\n");
         sb.concat("  team: ").concat(this.team).concat("\n");
         sb.concat("  player: ").concat(this.player).concat("\n");
         sb.concat("  playerId: ").concat(this.playerId).concat("\n");
         sb.concat("  roundSeasonTeamPlayers: ").concat(this.roundSeasonTeamPlayers).concat("\n");
         sb.concat("  createdAt: ").concat(this.createdAt).concat("\n");
         sb.concat("}\n");
         return sb;
      }
   }
}
