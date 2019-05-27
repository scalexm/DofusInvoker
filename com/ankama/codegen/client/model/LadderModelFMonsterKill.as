package com.ankama.codegen.client.model
{
   public class LadderModelFMonsterKill
   {
       
      
      public var monster:Number = 0;
      
      public var killed:Number = 0;
      
      public function LadderModelFMonsterKill()
      {
         super();
      }
      
      public function toString() : String
      {
         var sb:String = "";
         sb.concat("class LadderModelFMonsterKill {\n");
         sb.concat("  monster: ").concat(this.monster).concat("\n");
         sb.concat("  killed: ").concat(this.killed).concat("\n");
         sb.concat("}\n");
         return sb;
      }
   }
}
