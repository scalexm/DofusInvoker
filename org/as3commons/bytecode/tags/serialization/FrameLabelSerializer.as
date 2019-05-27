package org.as3commons.bytecode.tags.serialization
{
   import flash.utils.ByteArray;
   import org.as3commons.bytecode.tags.FrameLabelTag;
   import org.as3commons.bytecode.tags.ISWFTag;
   import org.as3commons.bytecode.tags.struct.RecordHeader;
   import org.as3commons.bytecode.util.SWFSpec;
   
   public class FrameLabelSerializer extends AbstractTagSerializer
   {
       
      
      public function FrameLabelSerializer(serializerFactory:IStructSerializerFactory)
      {
         super(serializerFactory);
      }
      
      override public function read(input:ByteArray, recordHeader:RecordHeader) : ISWFTag
      {
         var tag:FrameLabelTag = new FrameLabelTag();
         tag.frameLabelName = SWFSpec.readString(input);
         return tag;
      }
      
      override public function write(output:ByteArray, tag:ISWFTag) : void
      {
         var frameTag:FrameLabelTag = FrameLabelTag(tag);
         SWFSpec.writeString(output,frameTag.frameLabelName);
      }
   }
}
