package com.ankama.codegen.client.model
{
   public class LadderModelFRanking
   {
       
      
      public var character:Number = 0;
      
      public var server:Number = 0;
      
      public var rating:Number = 0;
      
      public var victories:Number = 0;
      
      public var defeats:Number = 0;
      
      public var rank:Number = 0;
      
      public function LadderModelFRanking()
      {
         super();
      }
      
      public function toString() : String
      {
         var sb:String = "";
         sb.concat("class LadderModelFRanking {\n");
         sb.concat("  character: ").concat(this.character).concat("\n");
         sb.concat("  server: ").concat(this.server).concat("\n");
         sb.concat("  rating: ").concat(this.rating).concat("\n");
         sb.concat("  victories: ").concat(this.victories).concat("\n");
         sb.concat("  defeats: ").concat(this.defeats).concat("\n");
         sb.concat("  rank: ").concat(this.rank).concat("\n");
         sb.concat("}\n");
         return sb;
      }
   }
}
