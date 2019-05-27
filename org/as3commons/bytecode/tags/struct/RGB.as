package org.as3commons.bytecode.tags.struct
{
   public class RGB
   {
       
      
      private var _red:uint;
      
      private var _green:uint;
      
      private var _blue:uint;
      
      public function RGB()
      {
         super();
      }
      
      public function get red() : uint
      {
         return this._red;
      }
      
      public function set red(value:uint) : void
      {
         this._red = value;
      }
      
      public function get green() : uint
      {
         return this._green;
      }
      
      public function set green(value:uint) : void
      {
         this._green = value;
      }
      
      public function get blue() : uint
      {
         return this._blue;
      }
      
      public function set blue(value:uint) : void
      {
         this._blue = value;
      }
   }
}
