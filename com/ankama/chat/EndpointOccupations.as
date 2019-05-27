package com.ankama.chat
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.ReadUtils;
   import com.netease.protobuf.WireType;
   import com.netease.protobuf.WriteUtils;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor_TYPE_STRING;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor_TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final dynamic class EndpointOccupations extends Message
   {
      
      public static const UID:String = "9A4F2F76-4E6F-48AA-9E8C-02C3A50A29DA";
      
      public static const USER:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("com.ankama.chat.EndpointOccupations.user","user",1 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const OCCUPATIONS:RepeatedFieldDescriptor_TYPE_MESSAGE = new RepeatedFieldDescriptor_TYPE_MESSAGE("com.ankama.chat.EndpointOccupations.occupations","occupations",2 << 3 | WireType.LENGTH_DELIMITED,function():Class
      {
         return EndpointOccupation;
      });
       
      
      public var user:String;
      
      public var occupations:Array;
      
      public function EndpointOccupations()
      {
         this.occupations = [];
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
         for(var occupations$index:uint = 0; occupations$index < this.occupations.length; occupations$index++)
         {
            WriteUtils.writeTag(output,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write_TYPE_MESSAGE(output,this.occupations[occupations$index]);
         }
         for(fieldKey in this)
         {
            super.writeUnknown(output,fieldKey);
         }
      }
      
      override final function readFromSlice(input:IDataInput, bytesAfterSlice:uint) : void
      {
         var tag:uint = 0;
         var user$count:uint = 0;
         while(input.bytesAvailable > bytesAfterSlice)
         {
            tag = ReadUtils.read_TYPE_UINT32(input);
            switch(tag >> 3)
            {
               case 1:
                  if(user$count != 0)
                  {
                     throw new IOError("Bad data format: EndpointOccupations.user cannot be set twice.");
                  }
                  user$count++;
                  this.user = ReadUtils.read_TYPE_STRING(input);
                  continue;
               case 2:
                  this.occupations.push(ReadUtils.read_TYPE_MESSAGE(input,new EndpointOccupation()));
                  continue;
               default:
                  super.readUnknown(input,tag);
                  continue;
            }
         }
      }
   }
}
