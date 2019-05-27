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
   
   public final dynamic class CancelInvite extends Message
   {
      
      public static const UID:String = "B674D72B-2605-4E16-94D4-3E7A497A8D87";
      
      public static const TOUSER:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("com.ankama.chat.CancelInvite.toUser","toUser",1 << 3 | WireType.LENGTH_DELIMITED);
       
      
      public var toUser:String;
      
      public function CancelInvite()
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
         WriteUtils.write_TYPE_STRING(output,this.toUser);
         for(fieldKey in this)
         {
            super.writeUnknown(output,fieldKey);
         }
      }
      
      override final function readFromSlice(input:IDataInput, bytesAfterSlice:uint) : void
      {
         var tag:uint = 0;
         var toUser$count:uint = 0;
         while(input.bytesAvailable > bytesAfterSlice)
         {
            tag = ReadUtils.read_TYPE_UINT32(input);
            switch(tag >> 3)
            {
               case 1:
                  if(toUser$count != 0)
                  {
                     throw new IOError("Bad data format: CancelInvite.toUser cannot be set twice.");
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
