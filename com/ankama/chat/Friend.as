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
   
   public final dynamic class Friend extends Message
   {
      
      public static const USER:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("com.ankama.chat.Friend.user","user",1 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const GROUP:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("com.ankama.chat.Friend.group","group",2 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const ALIAS:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("com.ankama.chat.Friend.alias","alias",3 << 3 | WireType.LENGTH_DELIMITED);
       
      
      public var user:String;
      
      private var group$field:String;
      
      private var alias$field:String;
      
      public function Friend()
      {
         super();
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
      
      public function clearAlias() : void
      {
         this.alias$field = null;
      }
      
      public function get hasAlias() : Boolean
      {
         return this.alias$field != null;
      }
      
      public function set alias(value:String) : void
      {
         this.alias$field = value;
      }
      
      public function get alias() : String
      {
         return this.alias$field;
      }
      
      override final function writeToBuffer(output:WritingBuffer) : void
      {
         var fieldKey:* = undefined;
         WriteUtils.writeTag(output,WireType.LENGTH_DELIMITED,1);
         WriteUtils.write_TYPE_STRING(output,this.user);
         if(this.hasGroup)
         {
            WriteUtils.writeTag(output,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write_TYPE_STRING(output,this.group$field);
         }
         if(this.hasAlias)
         {
            WriteUtils.writeTag(output,WireType.LENGTH_DELIMITED,3);
            WriteUtils.write_TYPE_STRING(output,this.alias$field);
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
         var group$count:uint = 0;
         var alias$count:uint = 0;
         while(input.bytesAvailable > bytesAfterSlice)
         {
            tag = ReadUtils.read_TYPE_UINT32(input);
            switch(tag >> 3)
            {
               case 1:
                  if(user$count != 0)
                  {
                     throw new IOError("Bad data format: Friend.user cannot be set twice.");
                  }
                  user$count++;
                  this.user = ReadUtils.read_TYPE_STRING(input);
                  continue;
               case 2:
                  if(group$count != 0)
                  {
                     throw new IOError("Bad data format: Friend.group cannot be set twice.");
                  }
                  group$count++;
                  this.group = ReadUtils.read_TYPE_STRING(input);
                  continue;
               case 3:
                  if(alias$count != 0)
                  {
                     throw new IOError("Bad data format: Friend.alias cannot be set twice.");
                  }
                  alias$count++;
                  this.alias = ReadUtils.read_TYPE_STRING(input);
                  continue;
               default:
                  super.readUnknown(input,tag);
                  continue;
            }
         }
      }
   }
}
