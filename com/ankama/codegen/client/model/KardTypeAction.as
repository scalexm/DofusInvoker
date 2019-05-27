package com.ankama.codegen.client.model
{
   public class KardTypeAction
   {
       
      
      public var id:Number = 0;
      
      public var quantity:Number = 0;
      
      public var name:String = null;
      
      public var title:String = null;
      
      public var description:String = null;
      
      public function KardTypeAction()
      {
         super();
      }
      
      public function toString() : String
      {
         var sb:String = "";
         sb.concat("class KardTypeAction {\n");
         sb.concat("  id: ").concat(this.id).concat("\n");
         sb.concat("  quantity: ").concat(this.quantity).concat("\n");
         sb.concat("  name: ").concat(this.name).concat("\n");
         sb.concat("  title: ").concat(this.title).concat("\n");
         sb.concat("  description: ").concat(this.description).concat("\n");
         sb.concat("}\n");
         return sb;
      }
   }
}
