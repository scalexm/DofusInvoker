package com.ankama.codegen.client.model
{
   public class HaapiException
   {
       
      
      public var status:int = 0;
      
      public var message:String = null;
      
      public var restype:String = null;
      
      public var stack_trace:Array;
      
      public var code:int = 0;
      
      public var detail:String = null;
      
      public function HaapiException()
      {
         this.stack_trace = new Array();
         super();
      }
      
      public function toString() : String
      {
         var sb:String = "";
         sb.concat("class HaapiException {\n");
         sb.concat("  status: ").concat(this.status).concat("\n");
         sb.concat("  message: ").concat(this.message).concat("\n");
         sb.concat("  restype: ").concat(this.restype).concat("\n");
         sb.concat("  stack_trace: ").concat(this.stack_trace).concat("\n");
         sb.concat("  code: ").concat(this.code).concat("\n");
         sb.concat("  detail: ").concat(this.detail).concat("\n");
         sb.concat("}\n");
         return sb;
      }
   }
}
