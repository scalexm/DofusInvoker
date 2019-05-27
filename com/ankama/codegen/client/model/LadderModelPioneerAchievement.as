package com.ankama.codegen.client.model
{
   public class LadderModelPioneerAchievement
   {
       
      
      public var id:Number = 0;
      
      public var server:Number = 0;
      
      public var pioneers:LadderModelPioneers = null;
      
      public var category:Number = 0;
      
      public var subcategory:Number = 0;
      
      public function LadderModelPioneerAchievement()
      {
         super();
      }
      
      public function toString() : String
      {
         var sb:String = "";
         sb.concat("class LadderModelPioneerAchievement {\n");
         sb.concat("  id: ").concat(this.id).concat("\n");
         sb.concat("  server: ").concat(this.server).concat("\n");
         sb.concat("  pioneers: ").concat(this.pioneers).concat("\n");
         sb.concat("  category: ").concat(this.category).concat("\n");
         sb.concat("  subcategory: ").concat(this.subcategory).concat("\n");
         sb.concat("}\n");
         return sb;
      }
   }
}
