package org.as3commons.bytecode.tags.struct
{
   public class RGBA extends RGB
   {
       
      
      private var _alpha:uint;
      
      public function RGBA()
      {
         super();
      }
      
      public function get alpha() : uint
      {
         return this._alpha;
      }
      
      public function set alpha(value:uint) : void
      {
         this._alpha = value;
      }
   }
}
