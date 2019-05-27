package com.ankama.codegen.client.model
{
   public class CharacterAddScreenshotResponse
   {
       
      
      public var status:Boolean = false;
      
      public var item_id:Number = 0;
      
      public var url:String = null;
      
      public function CharacterAddScreenshotResponse()
      {
         super();
      }
      
      public function toString() : String
      {
         var sb:String = "";
         sb.concat("class CharacterAddScreenshotResponse {\n");
         sb.concat("  status: ").concat(this.status).concat("\n");
         sb.concat("  item_id: ").concat(this.item_id).concat("\n");
         sb.concat("  url: ").concat(this.url).concat("\n");
         sb.concat("}\n");
         return sb;
      }
   }
}
