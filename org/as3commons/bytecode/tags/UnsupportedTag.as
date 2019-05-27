package org.as3commons.bytecode.tags
{
   import flash.utils.ByteArray;
   
   public class UnsupportedTag extends AbstractTag
   {
       
      
      private var _tagBody:ByteArray;
      
      public function UnsupportedTag(id:uint)
      {
         super(id,"unsupported");
      }
      
      public function get tagBody() : ByteArray
      {
         return this._tagBody;
      }
      
      public function set tagBody(value:ByteArray) : void
      {
         this._tagBody = value;
      }
   }
}
