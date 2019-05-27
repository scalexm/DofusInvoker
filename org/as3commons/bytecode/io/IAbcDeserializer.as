package org.as3commons.bytecode.io
{
   import flash.utils.ByteArray;
   import org.as3commons.bytecode.abc.AbcFile;
   import org.as3commons.bytecode.abc.IConstantPool;
   import org.as3commons.bytecode.abc.TraitInfo;
   
   public interface IAbcDeserializer
   {
       
      
      function get methodBodyExtractionMethod() : MethodBodyExtractionKind;
      
      function set methodBodyExtractionMethod(param1:MethodBodyExtractionKind) : void;
      
      function get constantPoolEndPosition() : uint;
      
      function deserializeConstantPool(param1:IConstantPool) : IConstantPool;
      
      function deserialize(param1:int = 0) : AbcFile;
      
      function deserializeClassInfos(param1:AbcFile, param2:IConstantPool, param3:int) : void;
      
      function deserializeMethodBodies(param1:AbcFile, param2:IConstantPool) : void;
      
      function deserializeScriptInfos(param1:AbcFile) : void;
      
      function deserializeInstanceInfo(param1:AbcFile, param2:IConstantPool) : int;
      
      function deserializeMetadata(param1:AbcFile, param2:IConstantPool) : void;
      
      function deserializeMethodInfos(param1:AbcFile, param2:IConstantPool) : void;
      
      function deserializeTraitsInfo(param1:AbcFile, param2:ByteArray, param3:Boolean = false, param4:String = "") : Vector.<TraitInfo>;
   }
}
