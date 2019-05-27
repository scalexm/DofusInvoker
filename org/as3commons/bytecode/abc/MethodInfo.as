package org.as3commons.bytecode.abc
{
   import org.as3commons.bytecode.abc.enum.NamespaceKind;
   import org.as3commons.bytecode.typeinfo.Argument;
   import org.as3commons.bytecode.util.AbcFileUtil;
   import org.as3commons.lang.ICloneable;
   import org.as3commons.lang.IEquals;
   import org.as3commons.lang.IllegalArgumentError;
   import org.as3commons.lang.StringUtils;
   
   public final class MethodInfo implements ICloneable, IEquals
   {
      
      private static const ILLEGAL_TRAITINFO_TYPE:String = "Argument must be of type FunctionTrait or MethodTrait";
       
      
      public var argumentCollection:Vector.<Argument>;
      
      public var as3commonsBytecodeName;
      
      public var flags:uint;
      
      public var methodBody:MethodBody;
      
      public var methodName:String;
      
      public var returnType:BaseMultiname;
      
      public var scopeName:String;
      
      private var _as3commonsByteCodeAssignedMethodTrait:TraitInfo;
      
      public function MethodInfo()
      {
         super();
         this.argumentCollection = new Vector.<Argument>();
      }
      
      public function addArgument(argument:Argument) : void
      {
         if(this.argumentCollection.indexOf(argument) < 0)
         {
            this.argumentCollection[this.argumentCollection.length] = argument;
         }
      }
      
      public function get as3commonsByteCodeAssignedMethodTrait() : TraitInfo
      {
         return this._as3commonsByteCodeAssignedMethodTrait;
      }
      
      public function set as3commonsByteCodeAssignedMethodTrait(value:TraitInfo) : void
      {
         if(value is FunctionTrait || value is MethodTrait)
         {
            this._as3commonsByteCodeAssignedMethodTrait = value;
            return;
         }
         throw IllegalArgumentError(ILLEGAL_TRAITINFO_TYPE);
      }
      
      public function clone() : *
      {
         var clone:MethodInfo = new MethodInfo();
         clone.argumentCollection = AbcFileUtil.cloneVector(this.argumentCollection);
         clone.returnType = this.returnType;
         clone.methodName = this.methodName;
         return clone;
      }
      
      public function get formalParameters() : Vector.<Argument>
      {
         var argument:Argument = null;
         var formalParams:Vector.<Argument> = new Vector.<Argument>();
         for each(argument in this.argumentCollection)
         {
            if(!argument.isOptional)
            {
               formalParams[formalParams.length] = argument;
            }
         }
         return formalParams;
      }
      
      public function get optionalParameters() : Vector.<Argument>
      {
         var argument:Argument = null;
         var optionalParams:Vector.<Argument> = new Vector.<Argument>();
         for each(argument in this.argumentCollection)
         {
            if(argument.isOptional)
            {
               optionalParams[optionalParams.length] = argument;
            }
         }
         return optionalParams;
      }
      
      public function get paramCount() : int
      {
         return arguments.length;
      }
      
      public function toString() : String
      {
         var nameString:String = null;
         var namespaceString:String = null;
         if(this.as3commonsBytecodeName != null)
         {
            if(this.as3commonsBytecodeName is QualifiedName)
            {
               namespaceString = this.as3commonsBytecodeName.nameSpace.kind.description;
               nameString = this.as3commonsBytecodeName.name;
               if(this.as3commonsBytecodeName.nameSpace.kind == NamespaceKind.NAMESPACE)
               {
                  namespaceString = this.as3commonsBytecodeName.nameSpace.name;
               }
            }
            if(this.as3commonsBytecodeName is String)
            {
               nameString = this.as3commonsBytecodeName;
            }
         }
         return StringUtils.substitute("{0} function {1}({2}) : {3}",!!namespaceString?namespaceString:"(no namespace)",this.as3commonsBytecodeName,this.argumentCollection.join(", "),this.returnType);
      }
      
      public function equals(other:Object) : Boolean
      {
         var len:int = 0;
         var i:int = 0;
         var arg:Argument = null;
         var otherArg:Argument = null;
         var otherMethod:MethodInfo = other as MethodInfo;
         if(otherMethod != null)
         {
            if(this.flags != otherMethod.flags)
            {
               return false;
            }
            if(this.methodName != otherMethod.methodName)
            {
               return false;
            }
            if(!this.returnType.equals(otherMethod.returnType))
            {
               return false;
            }
            if(this.scopeName != otherMethod.scopeName)
            {
               return false;
            }
            if(this.argumentCollection.length != otherMethod.argumentCollection.length)
            {
               return false;
            }
            len = this.argumentCollection.length;
            for(i = 0; i < len; i++)
            {
               arg = this.argumentCollection[i];
               otherArg = otherMethod.argumentCollection[i];
               if(!arg.equals(otherArg))
               {
                  return false;
               }
            }
            return true;
         }
         return false;
      }
   }
}
