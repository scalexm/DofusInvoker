package com.netease.protobuf
{
   import flash.errors.IOError;
   import flash.errors.IllegalOperationError;
   import flash.utils.IDataInput;
   
   public class RepeatedFieldDescriptor extends BaseFieldDescriptor
   {
       
      
      public function RepeatedFieldDescriptor()
      {
         super();
      }
      
      public function get elementType() : Class
      {
         throw new IllegalOperationError("Not Implemented!");
      }
      
      public final function readNonPacked(input:IDataInput, message:Message) : void
      {
         var destination:Array = message[name] || (message[name] = []);
         destination.push(readSingleField(input));
      }
      
      public final function readPacked(input:IDataInput, message:Message) : void
      {
         var destination:Array = message[name] || (message[name] = []);
         var length:uint = ReadUtils.read_TYPE_UINT32(input);
         if(input.bytesAvailable < length)
         {
            throw new IOError("Invalid message length: " + length);
         }
         var bytesAfterSlice:uint = input.bytesAvailable - length;
         while(input.bytesAvailable > bytesAfterSlice)
         {
            destination.push(readSingleField(input));
         }
         if(input.bytesAvailable != bytesAfterSlice)
         {
            throw new IOError("Invalid packed destination data");
         }
      }
      
      public function get nonPackedWireType() : int
      {
         throw new IllegalOperationError("Not Implemented!");
      }
      
      override public final function write(output:WritingBuffer, message:Message) : void
      {
         var k:uint = 0;
         var i:uint = 0;
         var j:uint = 0;
         var source:Array = message[name];
         if((tag & 7) == this.nonPackedWireType)
         {
            for(k = 0; k < source.length; k++)
            {
               WriteUtils.write_TYPE_UINT32(output,tag);
               writeSingleField(output,source[k]);
            }
         }
         else
         {
            WriteUtils.write_TYPE_UINT32(output,tag);
            i = output.beginBlock();
            for(j = 0; j < source.length; j++)
            {
               writeSingleField(output,source[j]);
            }
            output.endBlock(i);
         }
      }
   }
}
