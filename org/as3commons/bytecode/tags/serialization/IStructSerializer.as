package org.as3commons.bytecode.tags.serialization
{
   import flash.utils.ByteArray;
   
   public interface IStructSerializer
   {
       
      
      function read(param1:ByteArray) : Object;
      
      function write(param1:ByteArray, param2:Object) : void;
   }
}
