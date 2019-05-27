package com.ankama.codegen.client.model
{
   public class LadderModelAchievement
   {
       
      
      public var character:LadderModelHumanCharacter = null;
      
      public var points:Number = 0;
      
      public var rank:Number = 0;
      
      public function LadderModelAchievement()
      {
         super();
      }
      
      public function toString() : String
      {
         var sb:String = "";
         sb.concat("class LadderModelAchievement {\n");
         sb.concat("  character: ").concat(this.character).concat("\n");
         sb.concat("  points: ").concat(this.points).concat("\n");
         sb.concat("  rank: ").concat(this.rank).concat("\n");
         sb.concat("}\n");
         return sb;
      }
   }
}
