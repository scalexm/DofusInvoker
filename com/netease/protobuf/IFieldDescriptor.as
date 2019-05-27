package com.netease.protobuf
{
   public interface IFieldDescriptor
   {
       
      
      function get type() : Class;
      
      function get name() : String;
      
      function get tagNumber() : uint;
   }
}
