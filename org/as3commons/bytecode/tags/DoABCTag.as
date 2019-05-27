package org.as3commons.bytecode.tags
{
   import org.as3commons.bytecode.abc.AbcFile;
   
   public class DoABCTag extends AbstractTag
   {
      
      public static const TAG_ID:uint = 82;
      
      private static const TAG_NAME:String = "DoABC";
       
      
      private var _flags:uint;
      
      private var _byteCodeName:String;
      
      private var _abcFile:AbcFile;
      
      public function DoABCTag()
      {
         super(TAG_ID,TAG_NAME);
      }
      
      public function get flags() : uint
      {
         return this._flags;
      }
      
      public function set flags(value:uint) : void
      {
         this._flags = value;
      }
      
      public function get byteCodeName() : String
      {
         return this._byteCodeName;
      }
      
      public function set byteCodeName(value:String) : void
      {
         this._byteCodeName = value;
      }
      
      public function get abcFile() : AbcFile
      {
         return this._abcFile;
      }
      
      public function set abcFile(value:AbcFile) : void
      {
         this._abcFile = value;
      }
   }
}
