package com.ankama.codegen.client.model
{
   public class EsportModelMostPickedBreed
   {
       
      
      public var breedId:Number = 0;
      
      public var count:Number = 0;
      
      public function EsportModelMostPickedBreed()
      {
         super();
      }
      
      public function toString() : String
      {
         var sb:String = "";
         sb.concat("class EsportModelMostPickedBreed {\n");
         sb.concat("  breedId: ").concat(this.breedId).concat("\n");
         sb.concat("  count: ").concat(this.count).concat("\n");
         sb.concat("}\n");
         return sb;
      }
   }
}
