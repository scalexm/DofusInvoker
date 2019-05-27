package com.ankamagames.jerakine.utils.misc
{
   import flash.utils.Dictionary;
   import flash.utils.Proxy;
   import flash.utils.describeType;
   import flash.utils.getQualifiedClassName;
   
   public class DescribeTypeCache
   {
      
      private static var _classDesc:Dictionary = new Dictionary();
      
      private static var _variables:Dictionary = new Dictionary();
      
      private static var _variablesAndAccessor:Dictionary = new Dictionary();
      
      private static var _variablesAndAccessorType:Dictionary = new Dictionary();
      
      private static var _consts:Dictionary = new Dictionary();
      
      public static const READ_AND_WRITE:int = 0;
      
      public static const WRITE_ONLY:int = 1;
      
      public static const READ_ONLY:int = 2;
       
      
      public function DescribeTypeCache()
      {
         super();
      }
      
      public static function typeDescription(o:Object, useCache:Boolean = true) : XML
      {
         if(!useCache)
         {
            return describeType(o);
         }
         var c:String = getQualifiedClassName(o);
         if(!_classDesc[c])
         {
            _classDesc[c] = describeType(o);
         }
         return _classDesc[c];
      }
      
      public static function getVariableAndAccessorType(o:Object) : Dictionary
      {
         var accessorNode:XML = null;
         var v:XML = null;
         var cn:String = getQualifiedClassName(o);
         if(_variablesAndAccessorType[cn])
         {
            return _variablesAndAccessorType[cn];
         }
         var xmlClassDef:XML = typeDescription(o);
         var res:Dictionary = new Dictionary();
         for each(accessorNode in xmlClassDef.child("accessor"))
         {
            if(accessorNode.@access.toString() != "readOnly")
            {
               res[accessorNode.@name.toString()] = accessorNode.@type.toString();
            }
         }
         for each(v in xmlClassDef.child("variable"))
         {
            res[v.@name.toString()] = v.@type.toString();
         }
         _variablesAndAccessorType[cn] = res;
         return res;
      }
      
      public static function getVariables(o:Object, onlyVar:Boolean = false, useCache:Boolean = true, skipReadOnlyVar:Boolean = false, skipWriteOnlyVar:Boolean = false, baseTypeOnly:Boolean = true) : Vector.<String>
      {
         var variables:Vector.<Vector.<String>> = null;
         var description:XML = null;
         var result:Vector.<String> = null;
         var node:XML = null;
         var key:* = null;
         var accessValue:int = 0;
         var type:String = null;
         var className:String = getQualifiedClassName(o);
         if(className == "Object")
         {
            useCache = false;
         }
         if(useCache)
         {
            if(onlyVar && _variables[className])
            {
               result = _variables[className];
            }
            else if(!onlyVar && _variablesAndAccessor[className])
            {
               result = createVariableAndAccessorArray(_variablesAndAccessor[className],skipReadOnlyVar,skipWriteOnlyVar);
            }
            if(result)
            {
               return result;
            }
         }
         variables = new Vector.<Vector.<String>>();
         variables.push(new Vector.<String>());
         description = typeDescription(o,useCache);
         if(description.attribute("isDynamic").toString() == "true" || o is Proxy)
         {
            try
            {
               for(key in o)
               {
                  variables[READ_AND_WRITE].push(key);
               }
            }
            catch(e:Error)
            {
            }
         }
         for each(node in description.child("variable"))
         {
            addVariableInXMLToArray(variables[READ_AND_WRITE],node);
         }
         for each(node in description.child("factory").child("variable"))
         {
            addVariableInXMLToArray(variables[READ_AND_WRITE],node);
         }
         if(!onlyVar)
         {
            variables.push(new Vector.<String>());
            variables.push(new Vector.<String>());
            accessValue = READ_AND_WRITE;
            type = "";
            for each(node in description.child("accessor"))
            {
               addAccessorInXMLToArray(variables,node,accessValue,type,baseTypeOnly);
            }
            for each(node in description.child("factory").child("accessor"))
            {
               addAccessorInXMLToArray(variables,node,accessValue,type,baseTypeOnly);
            }
         }
         if(useCache)
         {
            if(onlyVar)
            {
               _variables[className] = variables;
            }
            else
            {
               _variablesAndAccessor[className] = variables;
            }
         }
         if(!onlyVar)
         {
            result = createVariableAndAccessorArray(variables,skipReadOnlyVar,skipWriteOnlyVar);
            return result;
         }
         return variables[READ_AND_WRITE];
      }
      
      private static function addVariableInXMLToArray(variables:Vector.<String>, variableNode:XML) : void
      {
         var varName:String = variableNode.attribute("name").toString();
         if(varName != "MEMORY_LOG" && varName != "FLAG" && varName.indexOf("PATTERN") == -1 && varName.indexOf("OFFSET") == -1)
         {
            variables.push(varName);
         }
      }
      
      private static function addAccessorInXMLToArray(variables:Vector.<Vector.<String>>, accessorNode:XML, accessValue:int, type:String, baseTypeOnly:Boolean) : void
      {
         switch(accessorNode.attribute("access").toString())
         {
            case "readonly":
               accessValue = READ_ONLY;
               break;
            case "writeonly":
               accessValue = WRITE_ONLY;
               break;
            default:
               accessValue = READ_AND_WRITE;
         }
         type = accessorNode.attribute("type").toString();
         if(!baseTypeOnly || type == "uint" || type == "int" || type == "Number" || type == "String" || type == "Boolean")
         {
            variables[accessValue].push(accessorNode.attribute("name").toString());
         }
      }
      
      private static function createVariableAndAccessorArray(originalArray:Vector.<Vector.<String>>, skipReadOnlyVar:Boolean, skipWriteOnlyVar:Boolean) : Vector.<String>
      {
         if(skipReadOnlyVar && skipWriteOnlyVar)
         {
            return originalArray[READ_AND_WRITE];
         }
         if(skipReadOnlyVar)
         {
            return originalArray[READ_AND_WRITE].concat(originalArray[WRITE_ONLY]);
         }
         if(skipWriteOnlyVar)
         {
            return originalArray[READ_AND_WRITE].concat(originalArray[READ_ONLY]);
         }
         return originalArray[READ_AND_WRITE].concat(originalArray[READ_ONLY]).concat(originalArray[WRITE_ONLY]);
      }
      
      public static function getConstants(o:Object) : Dictionary
      {
         var cst:XML = null;
         var className:String = getQualifiedClassName(o);
         if(_consts[className])
         {
            return _consts[className];
         }
         _consts[className] = new Dictionary();
         var description:XML = typeDescription(o);
         for each(cst in description..constant)
         {
            _consts[className][cst.@name.toString()] = cst.@type.toString();
         }
         return _consts[className];
      }
      
      public static function getConstantName(type:Class, value:*) : String
      {
         var constName:* = null;
         var constants:Dictionary = getConstants(type);
         for(constName in constants)
         {
            if(type[constName] === value)
            {
               return constName;
            }
         }
         return null;
      }
   }
}
