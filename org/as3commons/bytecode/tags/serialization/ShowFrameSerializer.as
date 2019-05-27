package org.as3commons.bytecode.tags.serialization
{
   import flash.utils.ByteArray;
   import org.as3commons.bytecode.tags.ISWFTag;
   import org.as3commons.bytecode.tags.ShowFrameTag;
   import org.as3commons.bytecode.tags.struct.RecordHeader;
   
   public class ShowFrameSerializer extends AbstractTagSerializer
   {
       
      
      public function ShowFrameSerializer(serializerFactory:IStructSerializerFactory)
      {
         super(serializerFactory);
      }
      
      override public function read(input:ByteArray, recordHeader:RecordHeader) : ISWFTag
      {
         return new ShowFrameTag();
      }
      
      override public function write(output:ByteArray, tag:ISWFTag) : void
      {
      }
   }
}
