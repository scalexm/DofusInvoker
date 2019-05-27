package com.ankama.codegen.client.model
{
   public class LadderModelMonsterKill
   {
       
      
      public var hunt:LadderModelMonsterHunt = null;
      
      public var monster:Number = 0;
      
      public var killed:Number = 0;
      
      public var hunters:Number = 0;
      
      public var rank:Number = 0;
      
      public function LadderModelMonsterKill()
      {
         super();
      }
      
      public function toString() : String
      {
         var sb:String = "";
         sb.concat("class LadderModelMonsterKill {\n");
         sb.concat("  hunt: ").concat(this.hunt).concat("\n");
         sb.concat("  monster: ").concat(this.monster).concat("\n");
         sb.concat("  killed: ").concat(this.killed).concat("\n");
         sb.concat("  hunters: ").concat(this.hunters).concat("\n");
         sb.concat("  rank: ").concat(this.rank).concat("\n");
         sb.concat("}\n");
         return sb;
      }
   }
}
