package com.ankama.codegen.client.model
{
   public class LadderModelPioneerJob
   {
       
      
      public var id:Number = 0;
      
      public var server:Number = 0;
      
      public var pioneers:LadderModelPioneers = null;
      
      public function LadderModelPioneerJob()
      {
         super();
      }
      
      public function toString() : String
      {
         var sb:String = "";
         sb.concat("class LadderModelPioneerJob {\n");
         sb.concat("  id: ").concat(this.id).concat("\n");
         sb.concat("  server: ").concat(this.server).concat("\n");
         sb.concat("  pioneers: ").concat(this.pioneers).concat("\n");
         sb.concat("}\n");
         return sb;
      }
   }
}
