package org.as3commons.bytecode.tags.serialization
{
   import flash.utils.ByteArray;
   import org.as3commons.bytecode.tags.ISWFTag;
   import org.as3commons.bytecode.tags.UnsupportedTag;
   import org.as3commons.bytecode.tags.struct.RecordHeader;
   import org.as3commons.bytecode.util.AbcSpec;
   
   public class UnsupportedSerializer extends AbstractTagSerializer
   {
       
      
      public function UnsupportedSerializer()
      {
         super(null);
      }
      
      override public function read(input:ByteArray, recordHeader:RecordHeader) : ISWFTag
      {
         var tag:UnsupportedTag = new UnsupportedTag(recordHeader.id);
         tag.tagBody = AbcSpec.newByteArray();
         input.readBytes(tag.tagBody,0,recordHeader.length);
         tag.tagBody.position = 0;
         return tag;
      }
      
      override public function write(output:ByteArray, tag:ISWFTag) : void
      {
         var unsupportedTag:UnsupportedTag = tag as UnsupportedTag;
         unsupportedTag.tagBody.position = 0;
         output.writeBytes(unsupportedTag.tagBody);
      }
   }
}
