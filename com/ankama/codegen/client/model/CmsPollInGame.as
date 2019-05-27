package com.ankama.codegen.client.model
{
   public class CmsPollInGame
   {
       
      
      public var item_id:Number = 0;
      
      public var title:String = null;
      
      public var description:String = null;
      
      public var url:String = null;
      
      public var criterion:String = null;
      
      public function CmsPollInGame()
      {
         super();
      }
      
      public function toString() : String
      {
         var sb:String = "";
         sb.concat("class CmsPollInGame {\n");
         sb.concat("  item_id: ").concat(this.item_id).concat("\n");
         sb.concat("  title: ").concat(this.title).concat("\n");
         sb.concat("  description: ").concat(this.description).concat("\n");
         sb.concat("  url: ").concat(this.url).concat("\n");
         sb.concat("  criterion: ").concat(this.criterion).concat("\n");
         sb.concat("}\n");
         return sb;
      }
   }
}
