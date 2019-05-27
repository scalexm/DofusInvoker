package org.as3commons.bytecode.abc
{
   import flash.utils.ByteArray;
   import org.as3commons.bytecode.abc.enum.ConstantKind;
   
   public interface IConstantPool
   {
       
      
      function get rawConstantPool() : ByteArray;
      
      function set rawConstantPool(param1:ByteArray) : void;
      
      function reset() : void;
      
      function initializeLookups() : void;
      
      function getConstantPoolItem(param1:uint, param2:uint) : *;
      
      function getConstantPoolItemIndex(param1:ConstantKind, param2:*) : int;
      
      function addItemToPool(param1:ConstantKind, param2:*) : int;
      
      function get dupeCheck() : Boolean;
      
      function set dupeCheck(param1:Boolean) : void;
      
      function get integerPool() : Vector.<int>;
      
      function get uintPool() : Vector.<uint>;
      
      function get doublePool() : Vector.<Number>;
      
      function get stringPool() : Vector.<String>;
      
      function get namespacePool() : Vector.<LNamespace>;
      
      function get namespaceSetPool() : Vector.<NamespaceSet>;
      
      function get multinamePool() : Vector.<BaseMultiname>;
      
      function get classInfo() : Vector.<ClassInfo>;
      
      function get locked() : Boolean;
      
      function set locked(param1:Boolean) : void;
      
      function addMultiname(param1:BaseMultiname) : int;
      
      function getStringPosition(param1:String) : int;
      
      function getIntPosition(param1:int) : int;
      
      function getUintPosition(param1:uint) : int;
      
      function getDoublePosition(param1:Number) : int;
      
      function getNamespacePosition(param1:LNamespace) : int;
      
      function getNamespaceSetPosition(param1:NamespaceSet) : int;
      
      function getMultinamePosition(param1:BaseMultiname) : int;
      
      function getMultinamePositionByName(param1:String) : int;
      
      function addString(param1:String) : int;
      
      function addInt(param1:int) : int;
      
      function addUint(param1:uint) : int;
      
      function addDouble(param1:Number) : int;
      
      function addNamespace(param1:LNamespace) : int;
      
      function addNamespaceSet(param1:NamespaceSet) : int;
      
      function addToPool(param1:*, param2:*, param3:Object) : int;
   }
}
