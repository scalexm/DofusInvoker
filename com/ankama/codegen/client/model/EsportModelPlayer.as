package com.ankama.codegen.client.model
{
   public class EsportModelPlayer
   {
       
      
      public var id:Number = 0;
      
      public var accountId:Number = 0;
      
      public var characterId:Number = 0;
      
      public var characterName:String = null;
      
      public var characterImageUrl:String = null;
      
      public var seasonTeamPlayers:Array;
      
      public var createdAt:Date = null;
      
      public function EsportModelPlayer()
      {
         this.seasonTeamPlayers = new Array();
         super();
      }
      
      public function toString() : String
      {
         var sb:String = "";
         sb.concat("class EsportModelPlayer {\n");
         sb.concat("  id: ").concat(this.id).concat("\n");
         sb.concat("  accountId: ").concat(this.accountId).concat("\n");
         sb.concat("  characterId: ").concat(this.characterId).concat("\n");
         sb.concat("  characterName: ").concat(this.characterName).concat("\n");
         sb.concat("  characterImageUrl: ").concat(this.characterImageUrl).concat("\n");
         sb.concat("  seasonTeamPlayers: ").concat(this.seasonTeamPlayers).concat("\n");
         sb.concat("  createdAt: ").concat(this.createdAt).concat("\n");
         sb.concat("}\n");
         return sb;
      }
   }
}
