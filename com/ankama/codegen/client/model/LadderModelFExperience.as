package com.ankama.codegen.client.model
{
   public class LadderModelFExperience
   {
       
      
      public var character:Number = 0;
      
      public var server:Number = 0;
      
      public var level:Number = 0;
      
      public var experience:Number = 0;
      
      public var rank:Number = 0;
      
      public function LadderModelFExperience()
      {
         super();
      }
      
      public function toString() : String
      {
         var sb:String = "";
         sb.concat("class LadderModelFExperience {\n");
         sb.concat("  character: ").concat(this.character).concat("\n");
         sb.concat("  server: ").concat(this.server).concat("\n");
         sb.concat("  level: ").concat(this.level).concat("\n");
         sb.concat("  experience: ").concat(this.experience).concat("\n");
         sb.concat("  rank: ").concat(this.rank).concat("\n");
         sb.concat("}\n");
         return sb;
      }
   }
}
