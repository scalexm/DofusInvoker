package org.as3commons.bytecode.tags
{
   public class FileAttributesTag extends AbstractTag
   {
      
      public static const TAG_ID:uint = 69;
      
      private static const TAG_NAME:String = "FileAttributes";
       
      
      private var _useDirectBlit:Boolean;
      
      private var _useGPU:Boolean;
      
      private var _hasMetadata:Boolean;
      
      private var _actionScript3:Boolean;
      
      private var _useNetwork:Boolean;
      
      public function FileAttributesTag()
      {
         super(TAG_ID,TAG_NAME);
      }
      
      public function get useDirectBlit() : Boolean
      {
         return this._useDirectBlit;
      }
      
      public function set useDirectBlit(value:Boolean) : void
      {
         this._useDirectBlit = value;
      }
      
      public function get useGPU() : Boolean
      {
         return this._useGPU;
      }
      
      public function set useGPU(value:Boolean) : void
      {
         this._useGPU = value;
      }
      
      public function get hasMetadata() : Boolean
      {
         return this._hasMetadata;
      }
      
      public function set hasMetadata(value:Boolean) : void
      {
         this._hasMetadata = value;
      }
      
      public function get actionScript3() : Boolean
      {
         return this._actionScript3;
      }
      
      public function set actionScript3(value:Boolean) : void
      {
         this._actionScript3 = value;
      }
      
      public function get useNetwork() : Boolean
      {
         return this._useNetwork;
      }
      
      public function set useNetwork(value:Boolean) : void
      {
         this._useNetwork = value;
      }
   }
}
