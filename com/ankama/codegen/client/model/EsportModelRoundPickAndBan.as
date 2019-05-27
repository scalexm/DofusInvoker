package com.ankama.codegen.client.model
{
   public class EsportModelRoundPickAndBan
   {
       
      
      public var id:Number = 0;
      
      public var roundSeasonTeamPlayerId:Number = 0;
      
      public var roundSeasonTeamPlayer:EsportModelRoundSeasonTeamPlayer = null;
      
      public var restype:String = null;
      
      public var breedId:Number = 0;
      
      public var createdAt:Date = null;
      
      public function EsportModelRoundPickAndBan()
      {
         super();
      }
      
      public function toString() : String
      {
         var sb:String = "";
         sb.concat("class EsportModelRoundPickAndBan {\n");
         sb.concat("  id: ").concat(this.id).concat("\n");
         sb.concat("  roundSeasonTeamPlayerId: ").concat(this.roundSeasonTeamPlayerId).concat("\n");
         sb.concat("  roundSeasonTeamPlayer: ").concat(this.roundSeasonTeamPlayer).concat("\n");
         sb.concat("  restype: ").concat(this.restype).concat("\n");
         sb.concat("  breedId: ").concat(this.breedId).concat("\n");
         sb.concat("  createdAt: ").concat(this.createdAt).concat("\n");
         sb.concat("}\n");
         return sb;
      }
   }
}
