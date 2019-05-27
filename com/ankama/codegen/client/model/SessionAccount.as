package com.ankama.codegen.client.model
{
   public class SessionAccount
   {
       
      
      public var id:Number = 0;
      
      public var account_id:Number = 0;
      
      public var game_id:Number = 0;
      
      public var date:Date = null;
      
      public var ip:String = null;
      
      public var country:String = null;
      
      public var isp_id:Number = 0;
      
      public var duration:Number = 0;
      
      public var type_id:Number = 0;
      
      public var server_id:Number = 0;
      
      public var character_id:Number = 0;
      
      public function SessionAccount()
      {
         super();
      }
      
      public function toString() : String
      {
         var sb:String = "";
         sb.concat("class SessionAccount {\n");
         sb.concat("  id: ").concat(this.id).concat("\n");
         sb.concat("  account_id: ").concat(this.account_id).concat("\n");
         sb.concat("  game_id: ").concat(this.game_id).concat("\n");
         sb.concat("  date: ").concat(this.date).concat("\n");
         sb.concat("  ip: ").concat(this.ip).concat("\n");
         sb.concat("  country: ").concat(this.country).concat("\n");
         sb.concat("  isp_id: ").concat(this.isp_id).concat("\n");
         sb.concat("  duration: ").concat(this.duration).concat("\n");
         sb.concat("  type_id: ").concat(this.type_id).concat("\n");
         sb.concat("  server_id: ").concat(this.server_id).concat("\n");
         sb.concat("  character_id: ").concat(this.character_id).concat("\n");
         sb.concat("}\n");
         return sb;
      }
   }
}
