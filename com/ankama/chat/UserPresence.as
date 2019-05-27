package com.ankama.chat
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.ReadUtils;
   import com.netease.protobuf.WireType;
   import com.netease.protobuf.WriteUtils;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor_TYPE_ENUM;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor_TYPE_STRING;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final dynamic class UserPresence extends Message
   {
      
      public static const UID:String = "5C91A9CB-8193-4DCA-B3CD-1B37199F34F7";
      
      public static const USER:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("com.ankama.chat.UserPresence.user","user",1 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const OCCUPATION:FieldDescriptor_TYPE_ENUM = new FieldDescriptor_TYPE_ENUM("com.ankama.chat.UserPresence.occupation","occupation",2 << 3 | WireType.VARINT,UserOccupation);
       
      
      public var user:String;
      
      public var occupation:int;
      
      public function UserPresence()
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
         WriteUtils.write_TYPE_STRING(output,this.user);
         WriteUtils.writeTag(output,WireType.VARINT,2);
         WriteUtils.write_TYPE_ENUM(output,this.occupation);
         for(fieldKey in this)
         {
            super.writeUnknown(output,fieldKey);
         }
      }
      
      override final function readFromSlice(input:IDataInput, bytesAfterSlice:uint) : void
      {
         var tag:uint = 0;
         var user$count:uint = 0;
         var occupation$count:uint = 0;
         while(input.bytesAvailable > bytesAfterSlice)
         {
            tag = ReadUtils.read_TYPE_UINT32(input);
            switch(tag >> 3)
            {
               case 1:
                  if(user$count != 0)
                  {
                     throw new IOError("Bad data format: UserPresence.user cannot be set twice.");
                  }
                  user$count++;
                  this.user = ReadUtils.read_TYPE_STRING(input);
                  continue;
               case 2:
                  if(occupation$count != 0)
                  {
                     throw new IOError("Bad data format: UserPresence.occupation cannot be set twice.");
                  }
                  occupation$count++;
                  this.occupation = ReadUtils.read_TYPE_ENUM(input);
                  continue;
               default:
                  super.readUnknown(input,tag);
                  continue;
            }
         }
      }
   }
}
