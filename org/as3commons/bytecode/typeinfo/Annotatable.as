package org.as3commons.bytecode.typeinfo
{
   import flash.errors.IllegalOperationError;
   import org.as3commons.bytecode.util.AbcFileUtil;
   import org.as3commons.lang.ICloneable;
   
   public class Annotatable implements ICloneable
   {
      
      protected static const NOT_IMPLEMENTED_ERROR:String = "Not implemented in base class";
       
      
      private var _metadata:Vector.<Metadata>;
      
      public function Annotatable()
      {
         super();
         this._metadata = new Vector.<Metadata>();
      }
      
      public function addMetadata(metadata:Metadata) : void
      {
         if(this._metadata.indexOf(metadata) < 0)
         {
            this._metadata[this._metadata.length] = metadata;
         }
      }
      
      public function addMetadataList(metadataList:Vector.<Metadata>) : void
      {
         var metadata:Metadata = null;
         for each(metadata in metadataList)
         {
            this.addMetadata(metadata);
         }
      }
      
      public function get metadata() : Vector.<Metadata>
      {
         return this._metadata;
      }
      
      public function clone() : *
      {
         throw new IllegalOperationError(NOT_IMPLEMENTED_ERROR);
      }
      
      protected function populateClone(annotatable:Annotatable) : void
      {
         annotatable.addMetadataList(AbcFileUtil.cloneVector(this.metadata));
      }
   }
}
