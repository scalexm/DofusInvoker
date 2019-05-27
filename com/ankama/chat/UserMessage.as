package com.ankama.chat
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.ReadUtils;
   import com.netease.protobuf.WireType;
   import com.netease.protobuf.WriteUtils;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor_TYPE_STRING;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final dynamic class UserMessage extends Message
   {
      
      public static const UID:String = "2BA70431-442D-4E40-AF50-0F08ECB5FF8F";
      
      public static const MESSAGE:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("com.ankama.chat.UserMessage.message","message",1 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const FROMUSER:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("com.ankama.chat.UserMessage.fromUser","fromUser",2 << 3 | WireType.LENGTH_DELIMITED);
       
      
      public var message:String;
      
      public var fromUser:String;
      
      public function UserMessage()
      {
         super();
      }
      
      public function get uid() : String
      {
         return UID;
      }
      
      override final function writeToBuffer(output:WritingBuffer) : void
      {
         var fieldKey:* = undefined;
         WriteUtils.writeTag(output,WireType.LENGTH_DELIMITED,1);
         WriteUtils.write_TYPE_STRING(output,this.message);
         WriteUtils.writeTag(output,WireType.LENGTH_DELIMITED,2);
         WriteUtils.write_TYPE_STRING(output,this.fromUser);
         for(fieldKey in this)
         {
            super.writeUnknown(output,fieldKey);
         }
      }
      
      override final function readFromSlice(input:IDataInput, bytesAfterSlice:uint) : void
      {
         var tag:uint = 0;
         var message$count:uint = 0;
         var fromUser$count:uint = 0;
         while(input.bytesAvailable > bytesAfterSlice)
         {
            tag = ReadUtils.read_TYPE_UINT32(input);
            switch(tag >> 3)
            {
               case 1:
                  if(message$count != 0)
                  {
                     throw new IOError("Bad data format: UserMessage.message cannot be set twice.");
                  }
                  message$count++;
                  this.message = ReadUtils.read_TYPE_STRING(input);
                  continue;
               case 2:
                  if(fromUser$count != 0)
                  {
                     throw new IOError("Bad data format: UserMessage.fromUser cannot be set twice.");
                  }
                  fromUser$count++;
                  this.fromUser = ReadUtils.read_TYPE_STRING(input);
                  continue;
               default:
                  super.readUnknown(input,tag);
                  continue;
            }
         }
      }
   }
}
