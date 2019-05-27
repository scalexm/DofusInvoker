package org.as3commons.bytecode.tags.serialization
{
   import flash.utils.ByteArray;
   import org.as3commons.bytecode.tags.ISWFTag;
   import org.as3commons.bytecode.tags.struct.RecordHeader;
   
   public interface ITagSerializer
   {
       
      
      function get structSerializerFactory() : IStructSerializerFactory;
      
      function read(param1:ByteArray, param2:RecordHeader) : ISWFTag;
      
      function write(param1:ByteArray, param2:ISWFTag) : void;
   }
}
