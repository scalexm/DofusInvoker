package com.ankama.codegen.client.model
{
   public class EsportModelMatch
   {
       
      
      public var id:Number = 0;
      
      public var seasonId:Number = 0;
      
      public var season:EsportModelSeason = null;
      
      public var teamOneId:Number = 0;
      
      public var teamOne:EsportModelTeam = null;
      
      public var teamTwoId:Number = 0;
      
      public var teamTwo:EsportModelTeam = null;
      
      public var teamOneScore:Number = 0;
      
      public var teamTwoScore:Number = 0;
      
      public var date:Date = null;
      
      public var restype:String = null;
      
      public var step:String = null;
      
      public var ended:Boolean = false;
      
      public var maxRound:Number = 0;
      
      public var streamingUrl:String = null;
      
      public var rounds:Array;
      
      public var parentMatches:Array;
      
      public var websiteUrl:String = null;
      
      public var createdAt:Date = null;
      
      public function EsportModelMatch()
      {
         this.rounds = new Array();
         this.parentMatches = new Array();
         super();
      }
      
      public function toString() : String
      {
         var sb:String = "";
         sb.concat("class EsportModelMatch {\n");
         sb.concat("  id: ").concat(this.id).concat("\n");
         sb.concat("  seasonId: ").concat(this.seasonId).concat("\n");
         sb.concat("  season: ").concat(this.season).concat("\n");
         sb.concat("  teamOneId: ").concat(this.teamOneId).concat("\n");
         sb.concat("  teamOne: ").concat(this.teamOne).concat("\n");
         sb.concat("  teamTwoId: ").concat(this.teamTwoId).concat("\n");
         sb.concat("  teamTwo: ").concat(this.teamTwo).concat("\n");
         sb.concat("  teamOneScore: ").concat(this.teamOneScore).concat("\n");
         sb.concat("  teamTwoScore: ").concat(this.teamTwoScore).concat("\n");
         sb.concat("  date: ").concat(this.date).concat("\n");
         sb.concat("  restype: ").concat(this.restype).concat("\n");
         sb.concat("  step: ").concat(this.step).concat("\n");
         sb.concat("  ended: ").concat(this.ended).concat("\n");
         sb.concat("  maxRound: ").concat(this.maxRound).concat("\n");
         sb.concat("  streamingUrl: ").concat(this.streamingUrl).concat("\n");
         sb.concat("  rounds: ").concat(this.rounds).concat("\n");
         sb.concat("  parentMatches: ").concat(this.parentMatches).concat("\n");
         sb.concat("  websiteUrl: ").concat(this.websiteUrl).concat("\n");
         sb.concat("  createdAt: ").concat(this.createdAt).concat("\n");
         sb.concat("}\n");
         return sb;
      }
   }
}
