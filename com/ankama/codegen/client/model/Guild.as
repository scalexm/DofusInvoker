package com.ankama.codegen.client.model
{
   public class Guild
   {
       
      
      public var id:Number = 0;
      
      public var name:String = null;
      
      public var level:Number = 0;
      
      public function Guild()
      {
         super();
      }
      
      public function toString() : String
      {
         var sb:String = "";
         sb.concat("class Guild {\n");
         sb.concat("  id: ").concat(this.id).concat("\n");
         sb.concat("  name: ").concat(this.name).concat("\n");
         sb.concat("  level: ").concat(this.level).concat("\n");
         sb.concat("}\n");
         return sb;
      }
   }
}
