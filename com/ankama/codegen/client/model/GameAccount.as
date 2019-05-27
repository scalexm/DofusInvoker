package com.ankama.codegen.client.model
{
   public class GameAccount
   {
       
      
      public var total_time_elapsed:Number = 0;
      
      public var subscribed:Boolean = false;
      
      public var first_subscription_date:Date = null;
      
      public var expiration_date:Date = null;
      
      public var ban_end_date:Date = null;
      
      public var added_date:Date = null;
      
      public var login_date:Date = null;
      
      public var login_ip:String = null;
      
      public function GameAccount()
      {
         super();
      }
      
      public function toString() : String
      {
         var sb:String = "";
         sb.concat("class GameAccount {\n");
         sb.concat("  total_time_elapsed: ").concat(this.total_time_elapsed).concat("\n");
         sb.concat("  subscribed: ").concat(this.subscribed).concat("\n");
         sb.concat("  first_subscription_date: ").concat(this.first_subscription_date).concat("\n");
         sb.concat("  expiration_date: ").concat(this.expiration_date).concat("\n");
         sb.concat("  ban_end_date: ").concat(this.ban_end_date).concat("\n");
         sb.concat("  added_date: ").concat(this.added_date).concat("\n");
         sb.concat("  login_date: ").concat(this.login_date).concat("\n");
         sb.concat("  login_ip: ").concat(this.login_ip).concat("\n");
         sb.concat("}\n");
         return sb;
      }
   }
}
