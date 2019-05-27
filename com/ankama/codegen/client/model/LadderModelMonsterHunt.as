package com.ankama.codegen.client.model
{
   public class LadderModelMonsterHunt
   {
       
      
      public var id:String = null;
      
      public var server:Number = 0;
      
      public var start:Number = 0;
      
      public var end:Number = 0;
      
      public var monsters:Array;
      
      public function LadderModelMonsterHunt()
      {
         this.monsters = new Array();
         super();
      }
      
      public function toString() : String
      {
         var sb:String = "";
         sb.concat("class LadderModelMonsterHunt {\n");
         sb.concat("  id: ").concat(this.id).concat("\n");
         sb.concat("  server: ").concat(this.server).concat("\n");
         sb.concat("  start: ").concat(this.start).concat("\n");
         sb.concat("  end: ").concat(this.end).concat("\n");
         sb.concat("  monsters: ").concat(this.monsters).concat("\n");
         sb.concat("}\n");
         return sb;
      }
   }
}
