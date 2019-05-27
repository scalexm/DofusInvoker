package com.ankama.codegen.client.model
{
   public class SessionAccountsPaged
   {
       
      
      public var total:Number = 0;
      
      public var page_size:Number = 0;
      
      public var page_previous:Number = 0;
      
      public var page_current:Number = 0;
      
      public var page_next:Number = 0;
      
      public var page_last:Number = 0;
      
      public var accounts:Array;
      
      public function SessionAccountsPaged()
      {
         this.accounts = new Array();
         super();
      }
      
      public function toString() : String
      {
         var sb:String = "";
         sb.concat("class SessionAccountsPaged {\n");
         sb.concat("  total: ").concat(this.total).concat("\n");
         sb.concat("  page_size: ").concat(this.page_size).concat("\n");
         sb.concat("  page_previous: ").concat(this.page_previous).concat("\n");
         sb.concat("  page_current: ").concat(this.page_current).concat("\n");
         sb.concat("  page_next: ").concat(this.page_next).concat("\n");
         sb.concat("  page_last: ").concat(this.page_last).concat("\n");
         sb.concat("  accounts: ").concat(this.accounts).concat("\n");
         sb.concat("}\n");
         return sb;
      }
   }
}
