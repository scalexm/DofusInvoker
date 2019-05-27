package org.as3commons.bytecode.tags.serialization
{
   import flash.utils.ByteArray;
   import org.as3commons.bytecode.tags.EndTag;
   import org.as3commons.bytecode.tags.ISWFTag;
   import org.as3commons.bytecode.tags.struct.RecordHeader;
   
   public class EndTagSerializer extends AbstractTagSerializer
   {
       
      
      public function EndTagSerializer(serializerFactory:IStructSerializerFactory)
      {
         super(serializerFactory);
      }
      
      override public function read(input:ByteArray, recordHeader:RecordHeader) : ISWFTag
      {
         return new EndTag();
      }
      
      override public function write(output:ByteArray, tag:ISWFTag) : void
      {
      }
   }
}
