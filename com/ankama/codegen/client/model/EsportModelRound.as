package com.ankama.codegen.client.model
{
   public class EsportModelRound
   {
       
      
      public var id:Number = 0;
      
      public var matchId:Number = 0;
      
      public var match:EsportModelMatch = null;
      
      public var mapId:Number = 0;
      
      public var map:EsportModelMap = null;
      
      public var homeTeamId:Number = 0;
      
      public var homeTeam:EsportModelTeam = null;
      
      public var victoriousTeamId:Number = 0;
      
      public var victoriousTeam:EsportModelTeam = null;
      
      public var draw:Boolean = false;
      
      public var youtubeLink:String = null;
      
      public var roundSeasonTeamPlayers:Array;
      
      public var createdAt:Date = null;
      
      public function EsportModelRound()
      {
         this.roundSeasonTeamPlayers = new Array();
         super();
      }
      
      public function toString() : String
      {
         var sb:String = "";
         sb.concat("class EsportModelRound {\n");
         sb.concat("  id: ").concat(this.id).concat("\n");
         sb.concat("  matchId: ").concat(this.matchId).concat("\n");
         sb.concat("  match: ").concat(this.match).concat("\n");
         sb.concat("  mapId: ").concat(this.mapId).concat("\n");
         sb.concat("  map: ").concat(this.map).concat("\n");
         sb.concat("  homeTeamId: ").concat(this.homeTeamId).concat("\n");
         sb.concat("  homeTeam: ").concat(this.homeTeam).concat("\n");
         sb.concat("  victoriousTeamId: ").concat(this.victoriousTeamId).concat("\n");
         sb.concat("  victoriousTeam: ").concat(this.victoriousTeam).concat("\n");
         sb.concat("  draw: ").concat(this.draw).concat("\n");
         sb.concat("  youtubeLink: ").concat(this.youtubeLink).concat("\n");
         sb.concat("  roundSeasonTeamPlayers: ").concat(this.roundSeasonTeamPlayers).concat("\n");
         sb.concat("  createdAt: ").concat(this.createdAt).concat("\n");
         sb.concat("}\n");
         return sb;
      }
   }
}
