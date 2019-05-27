package com.netease.protobuf.fieldDescriptors
{
   import com.netease.protobuf.FieldDescriptor;
   import com.netease.protobuf.ReadUtils;
   import com.netease.protobuf.WriteUtils;
   import com.netease.protobuf.WritingBuffer;
   import flash.utils.IDataInput;
   
   public final class FieldDescriptor_TYPE_ENUM extends FieldDescriptor
   {
       
      
      public var enumType:Class;
      
      public function FieldDescriptor_TYPE_ENUM(fullName:String, name:String, tag:uint, enumType:Class)
      {
         super();
         this.fullName = fullName;
         this._name = name;
         this.tag = tag;
         this.enumType = enumType;
      }
      
      override public function get type() : Class
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
