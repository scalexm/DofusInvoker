package com.ankama.codegen.client.model
{
   public class Avatar
   {
       
      
      public var url:String = null;
      
      public function Avatar()
      {
         super();
      }
      
      public function toString() : String
      {
         var sb:String = "";
         sb.concat("class Avatar {\n");
         sb.concat("  url: ").concat(this.url).concat("\n");
         sb.concat("}\n");
         return sb;
      }
   }
}
