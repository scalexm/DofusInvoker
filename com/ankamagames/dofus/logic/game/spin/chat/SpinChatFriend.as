package com.ankamagames.dofus.logic.game.spin.chat
{
   import flash.utils.Dictionary;
   
   public class SpinChatFriend
   {
       
      
      private var _username:String;
      
      private var _alias:String;
      
      private var _occupation:int = 4;
      
      private var _endOccupation:Dictionary;
      
      public function SpinChatFriend(username:String, alias:String = null)
      {
         this._endOccupation = new Dictionary();
         super();
         this._username = username;
         this._alias = alias;
      }
      
      public function get username() : String
      {
         return this._username;
      }
      
      public function get alias() : String
      {
         return this._alias;
      }
      
      public function set alias(value:String) : void
      {
         this._alias = value;
      }
      
      public function get occupation() : int
      {
         return this._occupation;
      }
      
      public function set occupation(value:int) : void
      {
         this._occupation = value;
      }
      
      public function get endOccupations() : Dictionary
      {
         return this._endOccupation;
      }
   }
}
