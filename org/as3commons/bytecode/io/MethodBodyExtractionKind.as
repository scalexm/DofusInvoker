package org.as3commons.bytecode.io
{
   import flash.utils.Dictionary;
   
   public final class MethodBodyExtractionKind
   {
      
      private static var _enumCreated:Boolean = false;
      
      private static const _items:Dictionary = new Dictionary();
      
      public static const PARSE:MethodBodyExtractionKind = new MethodBodyExtractionKind(PARSE_VALUE);
      
      public static const SKIP:MethodBodyExtractionKind = new MethodBodyExtractionKind(SKIP_VALUE);
      
      public static const BYTEARRAY:MethodBodyExtractionKind = new MethodBodyExtractionKind(BYTEARRAY_VALUE);
      
      private static const PARSE_VALUE:String = "parseMethodBody";
      
      private static const SKIP_VALUE:String = "skipMethodBody";
      
      private static const BYTEARRAY_VALUE:String = "byteArrayMethodBody";
      
      {
         _enumCreated = true;
      }
      
      private var _value:String;
      
      public function MethodBodyExtractionKind(val:String)
      {
         super();
         this._value = val;
         _items[this._value] = this;
      }
      
      public static function fromValue(val:String) : MethodBodyExtractionKind
      {
         return _items[val] as MethodBodyExtractionKind;
      }
      
      public function get value() : String
      {
         return this._value;
      }
      
      public function toString() : String
      {
         return "MethodBodyExtractionMethod[_value:\"" + this._value + "\"]";
      }
   }
}
