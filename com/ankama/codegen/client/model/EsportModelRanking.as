package com.ankama.codegen.client.model
{
   public class EsportModelRanking
   {
       
      
      public var rank:Number = 0;
      
      public var teamId:Number = 0;
      
      public var team:EsportModelTeam = null;
      
      public var score:Number = 0;
      
      public var scoreChampionship:Number = 0;
      
      public var scoreArbitration:Number = 0;
      
      public var scoreTieBreak:Number = 0;
      
      public var day:Number = 0;
      
      public var win:Number = 0;
      
      public var loss:Number = 0;
      
      public var tie:Number = 0;
      
      public function EsportModelRanking()
      {
         super();
      }
      
      public function toString() : String
      {
         var sb:String = "";
         sb.concat("class EsportModelRanking {\n");
         sb.concat("  rank: ").concat(this.rank).concat("\n");
         sb.concat("  teamId: ").concat(this.teamId).concat("\n");
         sb.concat("  team: ").concat(this.team).concat("\n");
         sb.concat("  score: ").concat(this.score).concat("\n");
         sb.concat("  scoreChampionship: ").concat(this.scoreChampionship).concat("\n");
         sb.concat("  scoreArbitration: ").concat(this.scoreArbitration).concat("\n");
         sb.concat("  scoreTieBreak: ").concat(this.scoreTieBreak).concat("\n");
         sb.concat("  day: ").concat(this.day).concat("\n");
         sb.concat("  win: ").concat(this.win).concat("\n");
         sb.concat("  loss: ").concat(this.loss).concat("\n");
         sb.concat("  tie: ").concat(this.tie).concat("\n");
         sb.concat("}\n");
         return sb;
      }
   }
}
