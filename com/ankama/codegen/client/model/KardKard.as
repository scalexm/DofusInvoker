package com.ankama.codegen.client.model
{
   public class KardKard
   {
       
      
      public var id:Number = 0;
      
      public var name:String = null;
      
      public var description:String = null;
      
      public var restype:String = null;
      
      public var kard_multiple:Array;
      
      public var kard_krosmaster:KardTypeKrosmaster = null;
      
      public var kard_action:KardTypeAction = null;
      
      public function KardKard()
      {
         this.kard_multiple = new Array();
         super();
      }
      
      public function toString() : String
      {
         var sb:String = "";
         sb.concat("class KardKard {\n");
         sb.concat("  id: ").concat(this.id).concat("\n");
         sb.concat("  name: ").concat(this.name).concat("\n");
         sb.concat("  description: ").concat(this.description).concat("\n");
         sb.concat("  restype: ").concat(this.restype).concat("\n");
         sb.concat("  kard_multiple: ").concat(this.kard_multiple).concat("\n");
         sb.concat("  kard_krosmaster: ").concat(this.kard_krosmaster).concat("\n");
         sb.concat("  kard_action: ").concat(this.kard_action).concat("\n");
         sb.concat("}\n");
         return sb;
      }
   }
}
