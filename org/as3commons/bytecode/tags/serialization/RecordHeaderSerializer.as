package org.as3commons.bytecode.tags.serialization
{
   import flash.utils.ByteArray;
   import org.as3commons.bytecode.tags.struct.RecordHeader;
   import org.as3commons.bytecode.util.SWFSpec;
   
   public class RecordHeaderSerializer extends AbstractStructSerializer
   {
      
      public static const ID_SHIFT:uint = 6;
      
      public static const LONG_TAG:uint = 63;
       
      
      public function RecordHeaderSerializer()
      {
         super();
      }
      
      override public function read(input:ByteArray) : Object
      {
         var tag:uint = SWFSpec.readUI16(input);
         var id:* = tag >> ID_SHIFT;
         var size:* = tag & LONG_TAG;
         var isLong:Boolean = false;
         if(size == LONG_TAG)
         {
            size = int(SWFSpec.readUI32(input));
            isLong = true;
         }
         return new RecordHeader(id,size,isLong);
      }
      
      override public function write(output:ByteArray, struct:Object) : void
      {
         var recordHeader:RecordHeader = RecordHeader(struct);
         if(!recordHeader.isLongTag)
         {
            SWFSpec.writeUI16(output,recordHeader.id << ID_SHIFT | recordHeader.length);
         }
         else
         {
            SWFSpec.writeUI16(output,recordHeader.id << ID_SHIFT | LONG_TAG);
            SWFSpec.writeUI32(output,recordHeader.length);
         }
      }
   }
}
