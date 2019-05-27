package com.ankama.codegen.client.model
{
   public class BakBuffer
   {
       
      
      public var id:Number = 0;
      
      public var amount:Number = 0;
      
      public function BakBuffer()
      {
         super();
      }
      
      public function toString() : String
      {
         var sb:String = "";
         sb.concat("class BakBuffer {\n");
         sb.concat("  id: ").concat(this.id).concat("\n");
         sb.concat("  amount: ").concat(this.amount).concat("\n");
         sb.concat("}\n");
         return sb;
      }
   }
}
