package org.as3commons.bytecode.tags.serialization
{
   import flash.utils.ByteArray;
   import org.as3commons.bytecode.tags.ISWFTag;
   import org.as3commons.bytecode.tags.ScriptLimitsTag;
   import org.as3commons.bytecode.tags.struct.RecordHeader;
   import org.as3commons.bytecode.util.SWFSpec;
   
   public class ScriptLimitsSerializer extends AbstractTagSerializer
   {
       
      
      public function ScriptLimitsSerializer(serializerFactory:IStructSerializerFactory)
      {
         super(serializerFactory);
      }
      
      override public function read(input:ByteArray, recordHeader:RecordHeader) : ISWFTag
      {
         var tag:ScriptLimitsTag = new ScriptLimitsTag();
         tag.maxRecursionDepth = SWFSpec.readUI16(input);
         tag.scriptTimeoutSeconds = SWFSpec.readUI16(input);
         return tag;
      }
      
      override public function write(output:ByteArray, tag:ISWFTag) : void
      {
         var scriptTag:ScriptLimitsTag = ScriptLimitsTag(tag);
         SWFSpec.writeUI16(output,scriptTag.maxRecursionDepth);
         SWFSpec.writeUI16(output,scriptTag.scriptTimeoutSeconds);
      }
   }
}
