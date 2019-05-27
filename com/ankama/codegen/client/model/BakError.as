package com.ankama.codegen.client.model
{
   public class BakError
   {
       
      
      public var message:String = null;
      
      public var details:Array;
      
      public function BakError()
      {
         this.details = new Array();
         super();
      }
      
      public function toString() : String
      {
         var sb:String = "";
         sb.concat("class BakError {\n");
         sb.concat("  message: ").concat(this.message).concat("\n");
         sb.concat("  details: ").concat(this.details).concat("\n");
         sb.concat("}\n");
         return sb;
      }
   }
}
