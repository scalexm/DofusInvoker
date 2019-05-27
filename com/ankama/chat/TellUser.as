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
   
   public final dynamic class TellUser extends Message
   {
      
      public static const UID:String = "2C336DE1-5ED9-4A5A-B4AD-20C6F2E03A59";
      
      public static const MESSAGE:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("com.ankama.chat.TellUser.message","message",1 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const TARGETUSER:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("com.ankama.chat.TellUser.targetUser","targetUser",2 << 3 | WireType.LENGTH_DELIMITED);
       
      
      public var message:String;
      
      public var targetUser:String;
      
      public function TellUser()
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
         WriteUtils.write_TYPE_STRING(output,this.targetUser);
         for(fieldKey in this)
         {
            super.writeUnknown(output,fieldKey);
         }
      }
      
      override final function readFromSlice(input:IDataInput, bytesAfterSlice:uint) : void
      {
         var tag:uint = 0;
         var message$count:uint = 0;
         var targetUser$count:uint = 0;
         while(input.bytesAvailable > bytesAfterSlice)
         {
            tag = ReadUtils.read_TYPE_UINT32(input);
            switch(tag >> 3)
            {
               case 1:
                  if(message$count != 0)
                  {
                     throw new IOError("Bad data format: TellUser.message cannot be set twice.");
                  }
                  message$count++;
                  this.message = ReadUtils.read_TYPE_STRING(input);
                  continue;
               case 2:
                  if(targetUser$count != 0)
                  {
                     throw new IOError("Bad data format: TellUser.targetUser cannot be set twice.");
                  }
                  targetUser$count++;
                  this.targetUser = ReadUtils.read_TYPE_STRING(input);
                  continue;
               default:
                  super.readUnknown(input,tag);
                  continue;
            }
         }
      }
   }
}
