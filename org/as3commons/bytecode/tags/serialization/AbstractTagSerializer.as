package org.as3commons.bytecode.tags.serialization
{
   import flash.utils.ByteArray;
   import org.as3commons.bytecode.tags.ISWFTag;
   import org.as3commons.bytecode.tags.struct.RecordHeader;
   
   public class AbstractTagSerializer implements ITagSerializer
   {
       
      
      private var _structSerializerFactory:IStructSerializerFactory;
      
      public function AbstractTagSerializer(serializerFactory:IStructSerializerFactory = null)
      {
         super();
         this._structSerializerFactory = serializerFactory;
      }
      
      public function get structSerializerFactory() : IStructSerializerFactory
      {
         return this._structSerializerFactory;
      }
      
      public function read(input:ByteArray, recordHeader:RecordHeader) : ISWFTag
      {
         throw new Error("Method not implemented in abstract base class");
      }
      
      public function write(output:ByteArray, tag:ISWFTag) : void
      {
         throw new Error("Method not implemented in abstract base class");
      }
   }
}
