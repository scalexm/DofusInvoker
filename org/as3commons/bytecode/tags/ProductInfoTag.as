package org.as3commons.bytecode.tags
{
   public class ProductInfoTag extends AbstractTag
   {
      
      public static const TAG_ID:uint = 41;
      
      private static const TAG_NAME:String = "ProductInfo";
       
      
      private var _productId:uint;
      
      private var _edition:uint;
      
      private var _majorVersion:uint;
      
      private var _minorVersion:uint;
      
      private var _majorBuild:uint;
      
      private var _minorBuild:uint;
      
      private var _compileDatePart1:uint;
      
      private var _compileDatePart2:uint;
      
      public function ProductInfoTag()
      {
         super(TAG_ID,TAG_NAME);
      }
      
      public function get productId() : uint
      {
         return this._productId;
      }
      
      public function set productId(value:uint) : void
      {
         this._productId = value;
      }
      
      public function get edition() : uint
      {
         return this._edition;
      }
      
      public function set edition(value:uint) : void
      {
         this._edition = value;
      }
      
      public function get majorVersion() : uint
      {
         return this._majorVersion;
      }
      
      public function set majorVersion(value:uint) : void
      {
         this._majorVersion = value;
      }
      
      public function get minorVersion() : uint
      {
         return this._minorVersion;
      }
      
      public function set minorVersion(value:uint) : void
      {
         this._minorVersion = value;
      }
      
      public function get majorBuild() : uint
      {
         return this._majorBuild;
      }
      
      public function set majorBuild(value:uint) : void
      {
         this._majorBuild = value;
      }
      
      public function get minorBuild() : uint
      {
         return this._minorBuild;
      }
      
      public function set minorBuild(value:uint) : void
      {
         this._minorBuild = value;
      }
      
      public function get compileDatePart1() : uint
      {
         return this._compileDatePart1;
      }
      
      public function set compileDatePart1(value:uint) : void
      {
         this._compileDatePart1 = value;
      }
      
      public function get compileDatePart2() : uint
      {
         return this._compileDatePart2;
      }
      
      public function set compileDatePart2(value:uint) : void
      {
         this._compileDatePart2 = value;
      }
   }
}
