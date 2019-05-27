package org.as3commons.bytecode.tags.serialization
{
   import flash.utils.ByteArray;
   import org.as3commons.bytecode.tags.FileAttributesTag;
   import org.as3commons.bytecode.tags.ISWFTag;
   import org.as3commons.bytecode.tags.struct.RecordHeader;
   import org.as3commons.bytecode.util.SWFSpec;
   
   public class FileAttributesSerializer extends AbstractTagSerializer
   {
       
      
      public function FileAttributesSerializer(serializerFactory:IStructSerializerFactory)
      {
         super(serializerFactory);
      }
      
      override public function read(input:ByteArray, recordHeader:RecordHeader) : ISWFTag
      {
         var tag:FileAttributesTag = new FileAttributesTag();
         SWFSpec.flushBits();
         SWFSpec.readUB(input);
         tag.useDirectBlit = SWFSpec.readBoolean(input);
         tag.useGPU = SWFSpec.readBoolean(input);
         tag.hasMetadata = SWFSpec.readBoolean(input);
         tag.actionScript3 = SWFSpec.readBoolean(input);
         SWFSpec.readUB(input,2);
         tag.useNetwork = SWFSpec.readBoolean(input);
         SWFSpec.readUB(input,24);
         return tag;
      }
      
      override public function write(output:ByteArray, tag:ISWFTag) : void
      {
         var faTag:FileAttributesTag = FileAttributesTag(tag);
         SWFSpec.flushBits();
         SWFSpec.writeUB(output,1,0);
         SWFSpec.writeBoolean(output,faTag.useDirectBlit);
         SWFSpec.writeBoolean(output,faTag.useGPU);
         SWFSpec.writeBoolean(output,faTag.hasMetadata);
         SWFSpec.writeBoolean(output,faTag.actionScript3);
         SWFSpec.writeUB(output,2,0);
         SWFSpec.writeBoolean(output,faTag.useNetwork);
         SWFSpec.writeUB(output,24,0);
      }
   }
}
