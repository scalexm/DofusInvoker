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
   
   public final dynamic class GroupAdded extends Message
   {
      
      public static const UID:String = "41748F7D-76EE-4C99-90F8-99F29FFACB20";
      
      public static const GROUP:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("com.ankama.chat.GroupAdded.group","group",1 << 3 | WireType.LENGTH_DELIMITED);
       
      
      public var group:String;
      
      public function GroupAdded()
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
         WriteUtils.write_TYPE_STRING(output,this.group);
         for(fieldKey in this)
         {
            super.writeUnknown(output,fieldKey);
         }
      }
      
      override final function readFromSlice(input:IDataInput, bytesAfterSlice:uint) : void
      {
         var tag:uint = 0;
         var group$count:uint = 0;
         while(input.bytesAvailable > bytesAfterSlice)
         {
            tag = ReadUtils.read_TYPE_UINT32(input);
            switch(tag >> 3)
            {
               case 1:
                  if(group$count != 0)
                  {
                     throw new IOError("Bad data format: GroupAdded.group cannot be set twice.");
                  }
                  group$count++;
                  this.group = ReadUtils.read_TYPE_STRING(input);
                  continue;
               default:
                  super.readUnknown(input,tag);
                  continue;
            }
         }
      }
   }
}
