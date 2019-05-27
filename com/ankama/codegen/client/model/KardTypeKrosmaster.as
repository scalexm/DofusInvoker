package com.ankama.codegen.client.model
{
   public class KardTypeKrosmaster
   {
       
      
      public var id:Number = 0;
      
      public var name:String = null;
      
      public var pedestal_id:Number = 0;
      
      public var pedestal_name:String = null;
      
      public function KardTypeKrosmaster()
      {
         super();
      }
      
      public function toString() : String
      {
         var sb:String = "";
         sb.concat("class KardTypeKrosmaster {\n");
         sb.concat("  id: ").concat(this.id).concat("\n");
         sb.concat("  name: ").concat(this.name).concat("\n");
         sb.concat("  pedestal_id: ").concat(this.pedestal_id).concat("\n");
         sb.concat("  pedestal_name: ").concat(this.pedestal_name).concat("\n");
         sb.concat("}\n");
         return sb;
      }
   }
}
