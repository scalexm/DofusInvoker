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
   
   public final dynamic class FriendAliasSet extends Message
   {
      
      public static const UID:String = "EBA11206-DA39-4E22-9187-B422EF331107";
      
      public static const FRIEND:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("com.ankama.chat.FriendAliasSet.friend","friend",1 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const ALIAS:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("com.ankama.chat.FriendAliasSet.alias","alias",2 << 3 | WireType.LENGTH_DELIMITED);
       
      
      public var friend:String;
      
      private var alias$field:String;
      
      public function FriendAliasSet()
      {
         super();
      }
      
      public function get uid() : String
      {
         return UID;
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
         WriteUtils.write_TYPE_STRING(output,this.friend);
         if(this.hasAlias)
         {
            WriteUtils.writeTag(output,WireType.LENGTH_DELIMITED,2);
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
         var friend$count:uint = 0;
         var alias$count:uint = 0;
         while(input.bytesAvailable > bytesAfterSlice)
         {
            tag = ReadUtils.read_TYPE_UINT32(input);
            switch(tag >> 3)
            {
               case 1:
                  if(friend$count != 0)
                  {
                     throw new IOError("Bad data format: FriendAliasSet.friend cannot be set twice.");
                  }
                  friend$count++;
                  this.friend = ReadUtils.read_TYPE_STRING(input);
                  continue;
               case 2:
                  if(alias$count != 0)
                  {
                     throw new IOError("Bad data format: FriendAliasSet.alias cannot be set twice.");
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
