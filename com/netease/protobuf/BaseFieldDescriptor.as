package com.netease.protobuf
{
   import flash.errors.IllegalOperationError;
   import flash.utils.IDataInput;
   import flash.utils.getDefinitionByName;
   
   public class BaseFieldDescriptor implements IFieldDescriptor
   {
      
      private static const ACTIONSCRIPT_KEYWORDS:Object = {
         "as":true,
         "break":true,
         "case":true,
         "catch":true,
         "class":true,
         "const":true,
         "continue":true,
         "default":true,
         "delete":true,
         "do":true,
         "else":true,
         "extends":true,
         "false":true,
         "finally":true,
         "for":true,
         "function":true,
         "if":true,
         "implements":true,
         "import":true,
         "in":true,
         "instanceof":true,
         "interface":true,
         "internal":true,
         "is":true,
         "native":true,
         "new":true,
         "null":true,
         "package":true,
         "private":true,
         "protected":true,
         "public":true,
         "return":true,
         "super":true,
         "switch":true,
         "this":true,
         "throw":true,
         "to":true,
         "true":true,
         "try":true,
         "typeof":true,
         "use":true,
         "var":true,
         "void":true,
         "while":true,
         "with":true
      };
       
      
      public var fullName:String;
      
      protected var _name:String;
      
      protected var tag:uint;
      
      public function BaseFieldDescriptor()
      {
         super();
      }
      
      static function getExtensionByName(name:String) : BaseFieldDescriptor
      {
         var fieldPosition:int = name.lastIndexOf("/");
         if(fieldPosition == -1)
         {
            return BaseFieldDescriptor(getDefinitionByName(name));
         }
         return getDefinitionByName(name.substring(0,fieldPosition))[name.substring(fieldPosition + 1)];
      }
      
      public final function get name() : String
      {
         return this._name;
      }
      
      public final function get tagNumber() : uint
      {
         return this.tag >>> 3;
      }
      
      public function get type() : Class
      {
         throw new IllegalOperationError("Not Implemented!");
      }
      
      public function readSingleField(input:IDataInput) : *
      {
         throw new IllegalOperationError("Not Implemented!");
      }
      
      public function writeSingleField(output:WritingBuffer, value:*) : void
      {
         throw new IllegalOperationError("Not Implemented!");
      }
      
      public function write(destination:WritingBuffer, source:Message) : void
      {
         throw new IllegalOperationError("Not Implemented!");
      }
      
      public function toString() : String
      {
         return this.name;
      }
   }
}

function regexToUpperCase(matched:String, index:int, whole:String):String
{
   return matched.charAt(1).toUpperCase();
}