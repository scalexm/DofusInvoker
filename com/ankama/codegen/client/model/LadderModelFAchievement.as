package com.ankama.codegen.client.model
{
   public class LadderModelFAchievement
   {
       
      
      public var character:Number = 0;
      
      public var server:Number = 0;
      
      public var points:Number = 0;
      
      public var rank:Number = 0;
      
      public function LadderModelFAchievement()
      {
         super();
      }
      
      public function toString() : String
      {
         var sb:String = "";
         sb.concat("class LadderModelFAchievement {\n");
         sb.concat("  character: ").concat(this.character).concat("\n");
         sb.concat("  server: ").concat(this.server).concat("\n");
         sb.concat("  points: ").concat(this.points).concat("\n");
         sb.concat("  rank: ").concat(this.rank).concat("\n");
         sb.concat("}\n");
         return sb;
      }
   }
}
