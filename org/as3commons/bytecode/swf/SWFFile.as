package org.as3commons.bytecode.swf
{
   import flash.geom.Rectangle;
   import org.as3commons.bytecode.abc.AbcFile;
   import org.as3commons.bytecode.tags.DoABCTag;
   import org.as3commons.bytecode.tags.ISWFTag;
   import org.as3commons.lang.Assert;
   
   public class SWFFile
   {
       
      
      private var _signature:String;
      
      private var _version:uint;
      
      private var _fileLength:uint;
      
      private var _frameSize:Rectangle;
      
      private var _frameRate:uint;
      
      private var _frameCount:uint;
      
      private var _tags:Array;
      
      public function SWFFile()
      {
         super();
         this.initSWFFile();
      }
      
      protected function initSWFFile() : void
      {
         this._signature = SWFWeaverFileIO.SWF_SIGNATURE_UNCOMPRESSED;
         this._version = 10;
         this._frameSize = new Rectangle();
         this._frameRate = 1;
         this._frameCount = 1;
         this._tags = [];
      }
      
      public function get tags() : Array
      {
         return this._tags.concat([]);
      }
      
      public function get frameSize() : Rectangle
      {
         return this._frameSize;
      }
      
      public function set frameSize(value:Rectangle) : void
      {
         this._frameSize = value;
      }
      
      public function get frameRate() : uint
      {
         return this._frameRate;
      }
      
      public function set frameRate(value:uint) : void
      {
         this._frameRate = value;
      }
      
      public function get frameCount() : uint
      {
         return this._frameCount;
      }
      
      public function set frameCount(value:uint) : void
      {
         this._frameCount = value;
      }
      
      public function get signature() : String
      {
         return this._signature;
      }
      
      public function set signature(value:String) : void
      {
         this._signature = value;
      }
      
      public function get version() : uint
      {
         return this._version;
      }
      
      public function set version(value:uint) : void
      {
         this._version = value;
      }
      
      public function get fileLength() : uint
      {
         return this._fileLength;
      }
      
      public function set fileLength(value:uint) : void
      {
         this._fileLength = value;
      }
      
      public function addTag(tag:ISWFTag) : void
      {
         Assert.notNull(tag,"tag argument must not be null");
         this._tags[this._tags.length] = tag;
      }
      
      public function getTagsByType(tagClass:Class) : Array
      {
         var tag:ISWFTag = null;
         Assert.notNull(tagClass,"tagClass argument must not be null");
         var result:Array = [];
         for each(tag in this._tags)
         {
            if(tag is tagClass)
            {
               result[result.length] = tag;
            }
         }
         return result;
      }
      
      public function getAbcFileForClassName(className:String) : AbcFile
      {
         var tag:DoABCTag = null;
         Assert.hasText(className,"className argument must not be empty or null");
         var abcTags:Array = this.getTagsByType(DoABCTag);
         for each(tag in abcTags)
         {
            if(tag.abcFile.containsClass(className))
            {
               return tag.abcFile;
            }
         }
         return null;
      }
   }
}
