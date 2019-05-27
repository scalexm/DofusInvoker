package com.netease.protobuf.fieldDescriptors
{
   import com.netease.protobuf.ReadUtils;
   import com.netease.protobuf.RepeatedFieldDescriptor;
   import com.netease.protobuf.WireType;
   import com.netease.protobuf.WriteUtils;
   import com.netease.protobuf.WritingBuffer;
   import flash.utils.IDataInput;
   
   public final class RepeatedFieldDescriptor_TYPE_MESSAGE extends RepeatedFieldDescriptor
   {
       
      
      public var messageUnion:Object;
      
      public function RepeatedFieldDescriptor_TYPE_MESSAGE(fullName:String, name:String, tag:uint, messageUnion:Object)
      {
         super();
         this.fullName = fullName;
         this._name = name;
         this.tag = tag;
         this.messageUnion = messageUnion;
      }
      
      override public function get nonPackedWireType() : int
      {
         return WireType.LENGTH_DELIMITED;
      }
      
      override public function get type() : Class
      {
         return Array;
      }
      
      override public function get elementType() : Class
      {
         return this.messageUnion as Class || Class(this.messageUnion = this.messageUnion());
      }
      
      override public function readSingleField(input:IDataInput) : *
      {
         return ReadUtils.read_TYPE_MESSAGE(input,new this.elementType());
      }
      
      override public function writeSingleField(output:WritingBuffer, value:*) : void
      {
         WriteUtils.write_TYPE_MESSAGE(output,value);
      }
   }
}
