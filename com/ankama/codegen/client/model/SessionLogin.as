package com.ankama.codegen.client.model
{
   public class SessionLogin
   {
       
      
      public var id:Number = 0;
      
      public var id_string:String = null;
      
      public var account:Account = null;
      
      public var game:GameAccount = null;
      
      public function SessionLogin()
      {
         super();
      }
      
      public function toString() : String
      {
         var sb:String = "";
         sb.concat("class SessionLogin {\n");
         sb.concat("  id: ").concat(this.id).concat("\n");
         sb.concat("  id_string: ").concat(this.id_string).concat("\n");
         sb.concat("  account: ").concat(this.account).concat("\n");
         sb.concat("  game: ").concat(this.game).concat("\n");
         sb.concat("}\n");
         return sb;
      }
   }
}
