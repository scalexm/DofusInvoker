package com.ankama.codegen.client.model
{
   public class LadderModelRanking
   {
       
      
      public var character:LadderModelHumanCharacter = null;
      
      public var rating:Number = 0;
      
      public var victories:Number = 0;
      
      public var defeats:Number = 0;
      
      public var rank:Number = 0;
      
      public function LadderModelRanking()
      {
         super();
      }
      
      public function toString() : String
      {
         var sb:String = "";
         sb.concat("class LadderModelRanking {\n");
         sb.concat("  character: ").concat(this.character).concat("\n");
         sb.concat("  rating: ").concat(this.rating).concat("\n");
         sb.concat("  victories: ").concat(this.victories).concat("\n");
         sb.concat("  defeats: ").concat(this.defeats).concat("\n");
         sb.concat("  rank: ").concat(this.rank).concat("\n");
         sb.concat("}\n");
         return sb;
      }
   }
}
