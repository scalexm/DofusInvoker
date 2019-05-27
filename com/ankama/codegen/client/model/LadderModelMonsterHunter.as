package com.ankama.codegen.client.model
{
   public class LadderModelMonsterHunter
   {
       
      
      public var account:Number = 0;
      
      public function LadderModelMonsterHunter()
      {
         super();
      }
      
      public function toString() : String
      {
         var sb:String = "";
         sb.concat("class LadderModelMonsterHunter {\n");
         sb.concat("  account: ").concat(this.account).concat("\n");
         sb.concat("}\n");
         return sb;
      }
   }
}
