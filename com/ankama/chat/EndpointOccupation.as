package com.ankama.chat
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.ReadUtils;
   import com.netease.protobuf.WireType;
   import com.netease.protobuf.WriteUtils;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor_TYPE_INT32;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor_TYPE_STRING;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final dynamic class EndpointOccupation extends Message
   {
      
      public static const APPID:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("com.ankama.chat.EndpointOccupation.appId","appId",1 << 3 | WireType.VARINT);
      
      public static const OCCUPATION:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("com.ankama.chat.EndpointOccupation.occupation","occupation",2 << 3 | WireType.LENGTH_DELIMITED);
       
      
      public var appId:int;
      
      public var occupation:String;
      
      public function EndpointOccupation()
      {
         super();
      }
      
      override final function writeToBuffer(output:WritingBuffer) : void
      {
         var fieldKey:* = undefined;
         WriteUtils.writeTag(output,WireType.VARINT,1);
         WriteUtils.write_TYPE_INT32(output,this.appId);
         WriteUtils.writeTag(output,WireType.LENGTH_DELIMITED,2);
         WriteUtils.write_TYPE_STRING(output,this.occupation);
         for(fieldKey in this)
         {
            super.writeUnknown(output,fieldKey);
         }
      }
      
      override final function readFromSlice(input:IDataInput, bytesAfterSlice:uint) : void
      {
         var tag:uint = 0;
         var appId$count:uint = 0;
         var occupation$count:uint = 0;
         while(input.bytesAvailable > bytesAfterSlice)
         {
            tag = ReadUtils.read_TYPE_UINT32(input);
            switch(tag >> 3)
            {
               case 1:
                  if(appId$count != 0)
                  {
                     throw new IOError("Bad data format: EndpointOccupation.appId cannot be set twice.");
                  }
                  appId$count++;
                  this.appId = ReadUtils.read_TYPE_INT32(input);
                  continue;
               case 2:
                  if(occupation$count != 0)
                  {
                     throw new IOError("Bad data format: EndpointOccupation.occupation cannot be set twice.");
                  }
                  occupation$count++;
                  this.occupation = ReadUtils.read_TYPE_STRING(input);
                  continue;
               default:
                  super.readUnknown(input,tag);
                  continue;
            }
         }
      }
   }
}
