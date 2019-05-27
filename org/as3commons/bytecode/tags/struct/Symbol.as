package org.as3commons.bytecode.tags.struct
{
   public class Symbol
   {
       
      
      private var _tagId:uint;
      
      private var _symbolClassName:String;
      
      public function Symbol()
      {
         super();
      }
      
      public function get tagId() : uint
      {
         return this._tagId;
      }
      
      public function set tagId(value:uint) : void
      {
         this._tagId = value;
      }
      
      public function get symbolClassName() : String
      {
         return this._symbolClassName;
      }
      
      public function set symbolClassName(value:String) : void
      {
         this._symbolClassName = value;
      }
   }
}
