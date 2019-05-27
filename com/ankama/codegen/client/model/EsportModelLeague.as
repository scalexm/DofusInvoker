package com.ankama.codegen.client.model
{
   public class EsportModelLeague
   {
       
      
      public var id:Number = 0;
      
      public var name:String = null;
      
      public var visible:Boolean = false;
      
      public var current:Boolean = false;
      
      public var seasons:Array;
      
      public var websiteUrl:String = null;
      
      public var createdAt:Date = null;
      
      public function EsportModelLeague()
      {
         this.seasons = new Array();
         super();
      }
      
      public function toString() : String
      {
         var sb:String = "";
         sb.concat("class EsportModelLeague {\n");
         sb.concat("  id: ").concat(this.id).concat("\n");
         sb.concat("  name: ").concat(this.name).concat("\n");
         sb.concat("  visible: ").concat(this.visible).concat("\n");
         sb.concat("  current: ").concat(this.current).concat("\n");
         sb.concat("  seasons: ").concat(this.seasons).concat("\n");
         sb.concat("  websiteUrl: ").concat(this.websiteUrl).concat("\n");
         sb.concat("  createdAt: ").concat(this.createdAt).concat("\n");
         sb.concat("}\n");
         return sb;
      }
   }
}
