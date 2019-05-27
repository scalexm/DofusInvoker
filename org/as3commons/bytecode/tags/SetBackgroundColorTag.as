package org.as3commons.bytecode.tags
{
   import org.as3commons.bytecode.tags.struct.RGB;
   
   public class SetBackgroundColorTag extends AbstractTag
   {
      
      public static const TAG_ID:uint = 9;
      
      private static const TAG_NAME:String = "SetBackgroundColor";
       
      
      private var _backgroundColor:RGB;
      
      public function SetBackgroundColorTag()
      {
         super(TAG_ID,TAG_NAME);
      }
      
      public function get backgroundColor() : RGB
      {
         return this._backgroundColor;
      }
      
      public function set backgroundColor(value:RGB) : void
      {
         this._backgroundColor = value;
      }
   }
}
