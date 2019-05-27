package com.netease.protobuf.fieldDescriptors
{
   import com.netease.protobuf.ReadUtils;
   import com.netease.protobuf.RepeatedFieldDescriptor;
   import com.netease.protobuf.WireType;
   import com.netease.protobuf.WriteUtils;
   import com.netease.protobuf.WritingBuffer;
   import flash.utils.IDataInput;
   
   public final class RepeatedFieldDescriptor_TYPE_STRING extends RepeatedFieldDescriptor
   {
       
      
      public function RepeatedFieldDescriptor_TYPE_STRING(fullName:String, name:String, tag:uint)
      {
         super();
         this.fullName = fullName;
         this._name = name;
         this.tag = tag;
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
         return String;
      }
      
      override public function readSingleField(input:IDataInput) : *
      {
         return ReadUtils.read_TYPE_STRING(input);
      }
      
      override public function writeSingleField(output:WritingBuffer, value:*) : void
      {
         WriteUtils.write_TYPE_STRING(output,value);
      }
   }
}
