package com.ankama.codegen.client.model
{
   public class LadderModelPioneers
   {
       
      
      public var characters:Array;
      
      public var completionTime:Number = 0;
      
      public function LadderModelPioneers()
      {
         this.characters = new Array();
         super();
      }
      
      public function toString() : String
      {
         var sb:String = "";
         sb.concat("class LadderModelPioneers {\n");
         sb.concat("  characters: ").concat(this.characters).concat("\n");
         sb.concat("  completionTime: ").concat(this.completionTime).concat("\n");
         sb.concat("}\n");
         return sb;
      }
   }
}
