package org.as3commons.lang
{
   public interface ITypeDescription
   {
       
      
      function get clazz() : Class;
      
      function get classInfo() : *;
      
      function get instanceInfo() : *;
      
      function isImplementationOf(param1:Class) : Boolean;
      
      function isInformalImplementationOf(param1:Class) : Boolean;
      
      function isSubclassOf(param1:Class) : Boolean;
      
      function isInterface() : Boolean;
      
      function getFullyQualifiedImplementedInterfaceNames(param1:Boolean = false) : Array;
      
      function getProperties(param1:Boolean = false, param2:Boolean = true, param3:Boolean = true) : Object;
      
      function getSuperClass() : Class;
   }
}
