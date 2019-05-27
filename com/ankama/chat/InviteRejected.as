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
   
   public final dynamic class InviteRejected extends Message
   {
      
      public static const UID:String = "FF30F601-7595-4FAE-AC22-75DCB1055B40";
      
      public static const FROMUSER:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("com.ankama.chat.InviteRejected.fromUser","fromUser",1 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const TOUSER:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("com.ankama.chat.InviteRejected.toUser","toUser",2 << 3 | WireType.LENGTH_DELIMITED);
       
      
      public var fromUser:String;
      
      public var toUser:String;
      
      public function InviteRejected()
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
         WriteUtils.write_TYPE_STRING(output,this.fromUser);
         WriteUtils.writeTag(output,WireType.LENGTH_DELIMITED,2);
         WriteUtils.write_TYPE_STRING(output,this.toUser);
         for(fieldKey in this)
         {
            super.writeUnknown(output,fieldKey);
         }
      }
      
      override final function readFromSlice(input:IDataInput, bytesAfterSlice:uint) : void
      {
         var tag:uint = 0;
         var fromUser$count:uint = 0;
         var toUser$count:uint = 0;
         while(input.bytesAvailable > bytesAfterSlice)
         {
            tag = ReadUtils.read_TYPE_UINT32(input);
            switch(tag >> 3)
            {
               case 1:
                  if(fromUser$count != 0)
                  {
                     throw new IOError("Bad data format: InviteRejected.fromUser cannot be set twice.");
                  }
                  fromUser$count++;
                  this.fromUser = ReadUtils.read_TYPE_STRING(input);
                  continue;
               case 2:
                  if(toUser$count != 0)
                  {
                     throw new IOError("Bad data format: InviteRejected.toUser cannot be set twice.");
                  }
                  toUser$count++;
                  this.toUser = ReadUtils.read_TYPE_STRING(input);
                  continue;
               default:
                  super.readUnknown(input,tag);
                  continue;
            }
         }
      }
   }
}
