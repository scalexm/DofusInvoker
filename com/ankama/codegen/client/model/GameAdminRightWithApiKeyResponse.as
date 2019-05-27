package com.ankama.codegen.client.model
{
   public class GameAdminRightWithApiKeyResponse
   {
       
      
      public var rights:Array;
      
      public function GameAdminRightWithApiKeyResponse()
      {
         this.rights = new Array();
         super();
      }
      
      public function toString() : String
      {
         var sb:String = "";
         sb.concat("class GameAdminRightWithApiKeyResponse {\n");
         sb.concat("  rights: ").concat(this.rights).concat("\n");
         sb.concat("}\n");
         return sb;
      }
   }
}
