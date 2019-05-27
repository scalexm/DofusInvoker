package org.as3commons.bytecode.tags.serialization
{
   import flash.utils.ByteArray;
   
   public class AbstractStructSerializer implements IStructSerializer
   {
       
      
      public function AbstractStructSerializer()
      {
         super();
      }
      
      public function read(input:ByteArray) : Object
      {
         throw new Error("Method not implemented in abstract base class");
      }
      
      public function write(output:ByteArray, struct:Object) : void
      {
         throw new Error("Method not implemented in abstract base class");
      }
   }
}
