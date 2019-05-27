package com.ankama.codegen.client.model
{
   public class EsportModelMap
   {
       
      
      public var id:Number = 0;
      
      public var name:String = null;
      
      public var imageUrl:String = null;
      
      public var rounds:Array;
      
      public var createdAt:Date = null;
      
      public function EsportModelMap()
      {
         this.rounds = new Array();
         super();
      }
      
      public function toString() : String
      {
         var sb:String = "";
         sb.concat("class EsportModelMap {\n");
         sb.concat("  id: ").concat(this.id).concat("\n");
         sb.concat("  name: ").concat(this.name).concat("\n");
         sb.concat("  imageUrl: ").concat(this.imageUrl).concat("\n");
         sb.concat("  rounds: ").concat(this.rounds).concat("\n");
         sb.concat("  createdAt: ").concat(this.createdAt).concat("\n");
         sb.concat("}\n");
         return sb;
      }
   }
}
