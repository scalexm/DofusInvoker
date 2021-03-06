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
   
   public final dynamic class SetFriendGroup extends Message
   {
      
      public static const UID:String = "759FBAFA-857B-4066-B4CF-CBA1C0346655";
      
      public static const FRIEND:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("com.ankama.chat.SetFriendGroup.friend","friend",1 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const GROUP:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("com.ankama.chat.SetFriendGroup.group","group",2 << 3 | WireType.LENGTH_DELIMITED);
       
      
      public var friend:String;
      
      private var group$field:String;
      
      public function SetFriendGroup()
      {
         super();
      }
      
      public function get uid() : String
      {
         return UID;
      }
      
      public function clearGroup() : void
      {
         this.group$field = null;
      }
      
      public function get hasGroup() : Boolean
      {
         return this.group$field != null;
      }
      
      public function set group(value:String) : void
      {
         this.group$field = value;
      }
      
      public function get group() : String
      {
         return this.group$field;
      }
      
      override final function writeToBuffer(output:WritingBuffer) : void
      {
         var fieldKey:* = undefined;
         WriteUtils.writeTag(output,WireType.LENGTH_DELIMITED,1);
         WriteUtils.write_TYPE_STRING(output,this.friend);
         if(this.hasGroup)
         {
            WriteUtils.writeTag(output,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write_TYPE_STRING(output,this.group$field);
         }
         for(fieldKey in this)
         {
            super.writeUnknown(output,fieldKey);
         }
      }
      
      override final function readFromSlice(input:IDataInput, bytesAfterSlice:uint) : void
      {
         var tag:uint = 0;
         var friend$count:uint = 0;
         var group$count:uint = 0;
         while(input.bytesAvailable > bytesAfterSlice)
         {
            tag = ReadUtils.read_TYPE_UINT32(input);
            switch(tag >> 3)
            {
               case 1:
                  if(friend$count != 0)
                  {
                     throw new IOError("Bad data format: SetFriendGroup.friend cannot be set twice.");
                  }
                  friend$count++;
                  this.friend = ReadUtils.read_TYPE_STRING(input);
                  continue;
               case 2:
                  if(group$count != 0)
                  {
                     throw new IOError("Bad data format: SetFriendGroup.group cannot be set twice.");
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
