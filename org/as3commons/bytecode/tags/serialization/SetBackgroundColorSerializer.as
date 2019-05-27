package org.as3commons.bytecode.tags.serialization
{
   import flash.utils.ByteArray;
   import org.as3commons.bytecode.tags.ISWFTag;
   import org.as3commons.bytecode.tags.SetBackgroundColorTag;
   import org.as3commons.bytecode.tags.struct.RGB;
   import org.as3commons.bytecode.tags.struct.RecordHeader;
   
   public class SetBackgroundColorSerializer extends AbstractTagSerializer
   {
       
      
      public function SetBackgroundColorSerializer(serializerFactory:IStructSerializerFactory)
      {
         super(serializerFactory);
      }
      
      override public function read(input:ByteArray, recordHeader:RecordHeader) : ISWFTag
      {
         var tag:SetBackgroundColorTag = new SetBackgroundColorTag();
         var rgb:IStructSerializer = structSerializerFactory.createSerializer(RGB);
         tag.backgroundColor = rgb.read(input) as RGB;
         return tag;
      }
      
      override public function write(output:ByteArray, tag:ISWFTag) : void
      {
         var bgTag:SetBackgroundColorTag = SetBackgroundColorTag(tag);
         var rgb:IStructSerializer = structSerializerFactory.createSerializer(RGB);
         rgb.write(output,bgTag.backgroundColor);
      }
   }
}
