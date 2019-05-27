package com.ankama.codegen.client.model
{
   public class EsportModelRoundsKillAndDead
   {
       
      
      public var roundCount:Number = 0;
      
      public var playerDeadSum:Number = 0;
      
      public var playerKillNumberSum:Number = 0;
      
      public function EsportModelRoundsKillAndDead()
      {
         super();
      }
      
      public function toString() : String
      {
         var sb:String = "";
         sb.concat("class EsportModelRoundsKillAndDead {\n");
         sb.concat("  roundCount: ").concat(this.roundCount).concat("\n");
         sb.concat("  playerDeadSum: ").concat(this.playerDeadSum).concat("\n");
         sb.concat("  playerKillNumberSum: ").concat(this.playerKillNumberSum).concat("\n");
         sb.concat("}\n");
         return sb;
      }
   }
}
