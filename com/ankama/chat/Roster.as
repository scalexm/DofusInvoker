package com.ankama.chat
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.ReadUtils;
   import com.netease.protobuf.WireType;
   import com.netease.protobuf.WriteUtils;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor_TYPE_MESSAGE;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor_TYPE_STRING;
   import flash.utils.IDataInput;
   
   public final dynamic class Roster extends Message
   {
      
      public static const UID:String = "746AA8D1-5532-4E31-AC81-E93C21E7E83A";
      
      public static const GROUPS:RepeatedFieldDescriptor_TYPE_STRING = new RepeatedFieldDescriptor_TYPE_STRING("com.ankama.chat.Roster.groups","groups",1 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const FRIENDS:RepeatedFieldDescriptor_TYPE_MESSAGE = new RepeatedFieldDescriptor_TYPE_MESSAGE("com.ankama.chat.Roster.friends","friends",2 << 3 | WireType.LENGTH_DELIMITED,function():Class
      {
         return Friend;
      });
      
      public static const INVITES:RepeatedFieldDescriptor_TYPE_MESSAGE = new RepeatedFieldDescriptor_TYPE_MESSAGE("com.ankama.chat.Roster.invites","invites",3 << 3 | WireType.LENGTH_DELIMITED,function():Class
      {
         return InviteSent;
      });
       
      
      public var groups:Array;
      
      public var friends:Array;
      
      public var invites:Array;
      
      public function Roster()
      {
         this.groups = [];
         this.friends = [];
         this.invites = [];
         super();
      }
      
      public function get uid() : String
      {
         return UID;
      }
      
      override final function writeToBuffer(output:WritingBuffer) : void
      {
         var fieldKey:* = undefined;
         for(var groups$index:uint = 0; groups$index < this.groups.length; groups$index++)
         {
            WriteUtils.writeTag(output,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write_TYPE_STRING(output,this.groups[groups$index]);
         }
         for(var friends$index:uint = 0; friends$index < this.friends.length; friends$index++)
         {
            WriteUtils.writeTag(output,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write_TYPE_MESSAGE(output,this.friends[friends$index]);
         }
         for(var invites$index:uint = 0; invites$index < this.invites.length; invites$index++)
         {
            WriteUtils.writeTag(output,WireType.LENGTH_DELIMITED,3);
            WriteUtils.write_TYPE_MESSAGE(output,this.invites[invites$index]);
         }
         for(fieldKey in this)
         {
            super.writeUnknown(output,fieldKey);
         }
      }
      
      override final function readFromSlice(input:IDataInput, bytesAfterSlice:uint) : void
      {
         var tag:uint = 0;
         while(input.bytesAvailable > bytesAfterSlice)
         {
            tag = ReadUtils.read_TYPE_UINT32(input);
            switch(tag >> 3)
            {
               case 1:
                  this.groups.push(ReadUtils.read_TYPE_STRING(input));
                  continue;
               case 2:
                  this.friends.push(ReadUtils.read_TYPE_MESSAGE(input,new Friend()));
                  continue;
               case 3:
                  this.invites.push(ReadUtils.read_TYPE_MESSAGE(input,new InviteSent()));
                  continue;
               default:
                  super.readUnknown(input,tag);
                  continue;
            }
         }
      }
   }
}
