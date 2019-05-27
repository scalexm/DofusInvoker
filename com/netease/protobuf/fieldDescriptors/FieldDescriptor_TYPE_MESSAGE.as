package com.netease.protobuf.fieldDescriptors
{
   import com.netease.protobuf.FieldDescriptor;
   import com.netease.protobuf.ReadUtils;
   import com.netease.protobuf.WriteUtils;
   import com.netease.protobuf.WritingBuffer;
   import flash.utils.IDataInput;
   
   public final class FieldDescriptor_TYPE_MESSAGE extends FieldDescriptor
   {
       
      
      public var messageUnion:Object;
      
      public function FieldDescriptor_TYPE_MESSAGE(fullName:String, name:String, tag:uint, messageUnion:Object)
      {
         super();
         this.fullName = fullName;
         this._name = name;
         this.tag = tag;
         this.messageUnion = messageUnion;
      }
      
      override public function get type() : Class
      {
         return this.messageUnion as Class || Class(this.messageUnion = this.messageUnion());
      }
      
      override public function readSingleField(input:IDataInput) : *
      {
         return ReadUtils.read_TYPE_MESSAGE(input,new this.type());
      }
      
      override public function writeSingleField(output:WritingBuffer, value:*) : void
      {
         WriteUtils.write_TYPE_MESSAGE(output,value);
      }
   }
}
