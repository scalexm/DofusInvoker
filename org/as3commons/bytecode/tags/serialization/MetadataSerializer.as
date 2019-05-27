package org.as3commons.bytecode.tags.serialization
{
   import flash.utils.ByteArray;
   import org.as3commons.bytecode.tags.ISWFTag;
   import org.as3commons.bytecode.tags.MetadataTag;
   import org.as3commons.bytecode.tags.struct.RecordHeader;
   import org.as3commons.bytecode.util.SWFSpec;
   
   public class MetadataSerializer extends AbstractTagSerializer
   {
       
      
      public function MetadataSerializer(serializerFactory:IStructSerializerFactory)
      {
         super(serializerFactory);
      }
      
      override public function read(input:ByteArray, recordHeader:RecordHeader) : ISWFTag
      {
         var tag:MetadataTag = new MetadataTag();
         tag.metadata = SWFSpec.readString(input);
         return tag;
      }
      
      override public function write(output:ByteArray, tag:ISWFTag) : void
      {
         var metadataTag:MetadataTag = tag as MetadataTag;
         SWFSpec.writeString(output,metadataTag.metadata);
      }
   }
}
