package com.netease.protobuf
{
   import flash.utils.IDataInput;
   
   public class FieldDescriptor extends BaseFieldDescriptor
   {
       
      
      public function FieldDescriptor()
      {
         super();
      }
      
      public final function read(input:IDataInput, message:Message) : void
      {
         message[name] = readSingleField(input);
      }
      
      override public final function write(output:WritingBuffer, message:Message) : void
      {
         WriteUtils.write_TYPE_UINT32(output,tag);
         writeSingleField(output,message[name]);
      }
   }
}
