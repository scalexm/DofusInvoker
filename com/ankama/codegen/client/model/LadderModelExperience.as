package com.ankama.codegen.client.model
{
   public class LadderModelExperience
   {
       
      
      public var character:LadderModelHumanCharacter = null;
      
      public var level:Number = 0;
      
      public var experience:Number = 0;
      
      public var rank:Number = 0;
      
      public function LadderModelExperience()
      {
         super();
      }
      
      public function toString() : String
      {
         var sb:String = "";
         sb.concat("class LadderModelExperience {\n");
         sb.concat("  character: ").concat(this.character).concat("\n");
         sb.concat("  level: ").concat(this.level).concat("\n");
         sb.concat("  experience: ").concat(this.experience).concat("\n");
         sb.concat("  rank: ").concat(this.rank).concat("\n");
         sb.concat("}\n");
         return sb;
      }
   }
}
