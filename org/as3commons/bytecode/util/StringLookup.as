package org.as3commons.bytecode.util
{
   import flash.utils.Dictionary;
   
   public final class StringLookup
   {
      
      private static const UNDERSCORE:String = "_";
      
      private static const RESERVED_WORDS:Object = {
         "_hasOwnProperty":true,
         "_isPrototypeOf":true,
         "_propertyIsEnumerable":true,
         "_setPropertyIsEnumerable":true,
         "_toLocaleString":true,
         "_toString":true,
         "_valueOf":true,
         "_prototype":true,
         "_constructor":true
      };
      
      private static const prefix:String = (9999 + Math.floor(Math.random() * 9999)).toString() + UNDERSCORE;
       
      
      private var _internalLookup:Dictionary;
      
      public function StringLookup()
      {
         this._internalLookup = new Dictionary();
         super();
      }
      
      protected function makeValidKey(value:String) : String
      {
         if(RESERVED_WORDS[UNDERSCORE + value] == true)
         {
            return prefix + value;
         }
         return value;
      }
      
      public function contains(str:String) : Boolean
      {
         var key:String = this.makeValidKey(str);
         return this._internalLookup[key] != null;
      }
      
      public function set(str:String, index:int) : void
      {
         var key:String = this.makeValidKey(str);
         this._internalLookup[key] = index;
      }
      
      public function get(str:String) : *
      {
         var key:String = this.makeValidKey(str);
         return this._internalLookup[key];
      }
      
      public function remove(str:String) : void
      {
         var key:String = this.makeValidKey(str);
         delete this._internalLookup[key];
      }
   }
}
