package com.ankama.codegen.client.model
{
   public class Token
   {
       
      
      public var token:String = null;
      
      public function Token()
      {
         super();
      }
      
      public function toString() : String
      {
         var sb:String = "";
         sb.concat("class Token {\n");
         sb.concat("  token: ").concat(this.token).concat("\n");
         sb.concat("}\n");
         return sb;
      }
   }
}
