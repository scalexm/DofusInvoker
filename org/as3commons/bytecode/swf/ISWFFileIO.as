package org.as3commons.bytecode.swf
{
   import flash.events.IEventDispatcher;
   import flash.utils.ByteArray;
   import org.as3commons.bytecode.tags.serialization.ITagSerializer;
   
   [Event(name="tagSerializerCreated",type="org.as3commons.bytecode.swf.event.SWFFileIOEvent")]
   public interface ISWFFileIO extends IEventDispatcher
   {
       
      
      function read(param1:ByteArray) : SWFFile;
      
      function write(param1:ByteArray, param2:SWFFile) : void;
      
      function createTagSerializer(param1:uint) : ITagSerializer;
   }
}
