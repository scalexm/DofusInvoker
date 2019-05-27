package com.ankama.codegen.client.model
{
   public class KardTicket
   {
       
      
      public var order_list:Array;
      
      public var kard_list:Array;
      
      public function KardTicket()
      {
         this.order_list = new Array();
         this.kard_list = new Array();
         super();
      }
      
      public function toString() : String
      {
         var sb:String = "";
         sb.concat("class KardTicket {\n");
         sb.concat("  order_list: ").concat(this.order_list).concat("\n");
         sb.concat("  kard_list: ").concat(this.kard_list).concat("\n");
         sb.concat("}\n");
         return sb;
      }
   }
}
