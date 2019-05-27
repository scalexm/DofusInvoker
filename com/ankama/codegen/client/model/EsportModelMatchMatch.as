package com.ankama.codegen.client.model
{
   public class EsportModelMatchMatch
   {
       
      
      public var match:EsportModelMatch = null;
      
      public var parentMatch:EsportModelMatch = null;
      
      public var createdAt:Date = null;
      
      public function EsportModelMatchMatch()
      {
         super();
      }
      
      public function toString() : String
      {
         var sb:String = "";
         sb.concat("class EsportModelMatchMatch {\n");
         sb.concat("  match: ").concat(this.match).concat("\n");
         sb.concat("  parentMatch: ").concat(this.parentMatch).concat("\n");
         sb.concat("  createdAt: ").concat(this.createdAt).concat("\n");
         sb.concat("}\n");
         return sb;
      }
   }
}
