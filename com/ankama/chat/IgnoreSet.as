package com.ankama.chat
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.ReadUtils;
   import com.netease.protobuf.WireType;
   import com.netease.protobuf.WriteUtils;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor_TYPE_BOOL;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor_TYPE_STRING;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final dynamic class IgnoreSet extends Message
   {
      
      public static const UID:String = "0CC7CDD9-7BE3-40D8-B4CC-E0220B9927D7";
      
      public static const USER:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("com.ankama.chat.IgnoreSet.user","user",1 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const IGNORE:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("com.ankama.chat.IgnoreSet.ignore","ignore",2 << 3 | WireType.VARINT);
       
      
      public var user:String;
      
      public var ignore:Boolean;
      
      public function IgnoreSet()
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
         WriteUtils.write_TYPE_BOOL(output,this.ignore);
         for(fieldKey in this)
         {
            super.writeUnknown(output,fieldKey);
         }
      }
      
      override final function readFromSlice(input:IDataInput, bytesAfterSlice:uint) : void
      {
         var tag:uint = 0;
         var user$count:uint = 0;
         var ignore$count:uint = 0;
         while(input.bytesAvailable > bytesAfterSlice)
         {
            tag = ReadUtils.read_TYPE_UINT32(input);
            switch(tag >> 3)
            {
               case 1:
                  if(user$count != 0)
                  {
                     throw new IOError("Bad data format: IgnoreSet.user cannot be set twice.");
                  }
                  user$count++;
                  this.user = ReadUtils.read_TYPE_STRING(input);
                  continue;
               case 2:
                  if(ignore$count != 0)
                  {
                     throw new IOError("Bad data format: IgnoreSet.ignore cannot be set twice.");
                  }
                  ignore$count++;
                  this.ignore = ReadUtils.read_TYPE_BOOL(input);
                  continue;
               default:
                  super.readUnknown(input,tag);
                  continue;
            }
         }
      }
   }
}
