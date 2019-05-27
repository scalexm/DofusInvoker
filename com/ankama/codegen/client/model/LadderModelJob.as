package com.ankama.codegen.client.model
{
   public class LadderModelJob
   {
       
      
      public var character:LadderModelHumanCharacter = null;
      
      public var job:Number = 0;
      
      public var level:Number = 0;
      
      public var experience:Number = 0;
      
      public var rank:Number = 0;
      
      public function LadderModelJob()
      {
         super();
      }
      
      public function toString() : String
      {
         var sb:String = "";
         sb.concat("class LadderModelJob {\n");
         sb.concat("  character: ").concat(this.character).concat("\n");
         sb.concat("  job: ").concat(this.job).concat("\n");
         sb.concat("  level: ").concat(this.level).concat("\n");
         sb.concat("  experience: ").concat(this.experience).concat("\n");
         sb.concat("  rank: ").concat(this.rank).concat("\n");
         sb.concat("}\n");
         return sb;
      }
   }
}
