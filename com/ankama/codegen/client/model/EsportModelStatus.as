package com.ankama.codegen.client.model
{
   public class EsportModelStatus
   {
       
      
      public var status:String = null;
      
      public function EsportModelStatus()
      {
         super();
      }
      
      public function toString() : String
      {
         var sb:String = "";
         sb.concat("class EsportModelStatus {\n");
         sb.concat("  status: ").concat(this.status).concat("\n");
         sb.concat("}\n");
         return sb;
      }
   }
}
