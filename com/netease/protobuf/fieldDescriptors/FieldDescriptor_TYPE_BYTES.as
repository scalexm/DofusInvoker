package com.netease.protobuf.fieldDescriptors
{
   import com.netease.protobuf.FieldDescriptor;
   import com.netease.protobuf.ReadUtils;
   import com.netease.protobuf.WriteUtils;
   import com.netease.protobuf.WritingBuffer;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   
   public final class FieldDescriptor_TYPE_BYTES extends FieldDescriptor
   {
       
      
      public function FieldDescriptor_TYPE_BYTES(fullName:String, name:String, tag:uint)
      {
         super();
         this.fullName = fullName;
         this._name = name;
         this.tag = tag;
      }
      
      override public function get type() : Class
      {
         return ByteArray;
      }
      
      override public function readSingleField(input:IDataInput) : *
      {
         return ReadUtils.read_TYPE_BYTES(input);
      }
      
      override public function writeSingleField(output:WritingBuffer, value:*) : void
      {
         WriteUtils.write_TYPE_BYTES(output,value);
      }
   }
}
