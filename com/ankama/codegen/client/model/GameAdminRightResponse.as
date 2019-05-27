package com.ankama.codegen.client.model
{
   public class GameAdminRightResponse
   {
       
      
      public var rights:Array;
      
      public function GameAdminRightResponse()
      {
         this.rights = new Array();
         super();
      }
      
      public function toString() : String
      {
         var sb:String = "";
         sb.concat("class GameAdminRightResponse {\n");
         sb.concat("  rights: ").concat(this.rights).concat("\n");
         sb.concat("}\n");
         return sb;
      }
   }
}
