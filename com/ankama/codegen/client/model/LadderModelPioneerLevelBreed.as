package com.ankama.codegen.client.model
{
   public class LadderModelPioneerLevelBreed
   {
       
      
      public var id:Number = 0;
      
      public var server:Number = 0;
      
      public var pioneers:LadderModelPioneers = null;
      
      public var level:Number = 0;
      
      public var breed:Number = 0;
      
      public function LadderModelPioneerLevelBreed()
      {
         super();
      }
      
      public function toString() : String
      {
         var sb:String = "";
         sb.concat("class LadderModelPioneerLevelBreed {\n");
         sb.concat("  id: ").concat(this.id).concat("\n");
         sb.concat("  server: ").concat(this.server).concat("\n");
         sb.concat("  pioneers: ").concat(this.pioneers).concat("\n");
         sb.concat("  level: ").concat(this.level).concat("\n");
         sb.concat("  breed: ").concat(this.breed).concat("\n");
         sb.concat("}\n");
         return sb;
      }
   }
}
