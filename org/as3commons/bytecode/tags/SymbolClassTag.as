package org.as3commons.bytecode.tags
{
   public class SymbolClassTag extends AbstractTag
   {
      
      public static const TAG_ID:uint = 76;
      
      private static const TAG_NAME:String = "SymbolClass";
       
      
      private var _symbols:Array;
      
      public function SymbolClassTag()
      {
         this._symbols = [];
         super(TAG_ID,TAG_NAME);
      }
      
      public function get symbols() : Array
      {
         return this._symbols;
      }
      
      public function set symbols(value:Array) : void
      {
         this._symbols = value;
      }
   }
}
