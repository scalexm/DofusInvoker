package com.netease.protobuf.fieldDescriptors
{
   import com.netease.protobuf.ReadUtils;
   import com.netease.protobuf.RepeatedFieldDescriptor;
   import com.netease.protobuf.WireType;
   import com.netease.protobuf.WriteUtils;
   import com.netease.protobuf.WritingBuffer;
   import flash.utils.IDataInput;
   
   public final class RepeatedFieldDescriptor_TYPE_ENUM extends RepeatedFieldDescriptor
   {
       
      
      public var enumType:Class;
      
      public function RepeatedFieldDescriptor_TYPE_ENUM(fullName:String, name:String, tag:uint, enumType:Class)
      {
         super();
         this.fullName = fullName;
         this._name = name;
         this.tag = tag;
         this.enumType = enumType;
      }
      
      override public function get nonPackedWireType() : int
      {
         return WireType.VARINT;
      }
      
      override public function get type() : Class
      {
         return Array;
      }
      
      override public function get elementType() : Class
      {
         return int;
      }
      
      override public function readSingleField(input:IDataInput) : *
      {
         return ReadUtils.read_TYPE_ENUM(input);
      }
      
      override public function writeSingleField(output:WritingBuffer, value:*) : void
      {
         WriteUtils.write_TYPE_ENUM(output,value);
      }
   }
}
