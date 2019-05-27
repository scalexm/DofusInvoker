package org.as3commons.lang.typedescription
{
   import avmplus.DescribeType;
   import avmplus.getQualifiedClassName;
   import org.as3commons.lang.Access;
   import org.as3commons.lang.ArrayUtils;
   import org.as3commons.lang.ClassUtils;
   import org.as3commons.lang.ITypeDescription;
   import org.as3commons.lang.StringUtils;
   
   public class JSONTypeDescription implements ITypeDescription
   {
      
      private static var _describeTypeJSON:Function = DescribeType.getJSONFunction();
       
      
      private var _clazz:Class;
      
      private var _instanceInfo:Object;
      
      private var _classInfo:Object;
      
      public function JSONTypeDescription(clazz:Class)
      {
         super();
         this._clazz = clazz;
         this._instanceInfo = _describeTypeJSON(clazz,DescribeType.GET_INSTANCE_INFO);
         this._classInfo = _describeTypeJSON(clazz,DescribeType.GET_CLASS_INFO);
      }
      
      public function get clazz() : Class
      {
         return this._clazz;
      }
      
      public function get instanceInfo() : *
      {
         return this._instanceInfo;
      }
      
      public function get classInfo() : *
      {
         return this._classInfo;
      }
      
      public function isImplementationOf(interfaze:Class) : Boolean
      {
         var result:Boolean = false;
         var interfaceName:String = null;
         var interfaces:Array = null;
         if(this.clazz == null)
         {
            result = false;
            return result;
         }
         interfaceName = getQualifiedClassName(interfaze);
         interfaces = this.instanceInfo.traits.interfaces;
         return ArrayUtils.contains(interfaces,interfaceName);
      }
      
      public function isInformalImplementationOf(interfaze:Class) : Boolean
      {
         var interfaceInstanceInfo:Object = null;
         var interfaceAccessors:Array = null;
         var interfaceAccessor:XML = null;
         var interfaceMethods:Array = null;
         var interfaceMethod:Object = null;
         var accessorMatchesInClass:Array = null;
         var methodMatchesInClass:Array = null;
         var interfaceMethodParameters:Array = null;
         var classMethodParameters:Array = null;
         var i:int = 0;
         var interfaceMethodParameter:Object = null;
         var parameterMatchesInClass:Array = null;
         var result:Boolean = true;
         if(interfaze == null)
         {
            result = false;
         }
         else
         {
            interfaceInstanceInfo = new JSONTypeDescription(interfaze).instanceInfo;
            interfaceAccessors = interfaceInstanceInfo.traits.accessors;
            for each(interfaceAccessor in interfaceAccessors)
            {
               accessorMatchesInClass = this.getMembers(this.instanceInfo.traits.accessors,interfaceAccessor.name,interfaceAccessor.access,interfaceAccessor.type);
               if(ArrayUtils.isEmpty(accessorMatchesInClass))
               {
                  result = false;
                  break;
               }
            }
            interfaceMethods = interfaceInstanceInfo.traits.methods;
            for each(interfaceMethod in interfaceMethods)
            {
               methodMatchesInClass = this.getMethods(this.instanceInfo.traits.methods,interfaceMethod.name,interfaceMethod.returnType);
               if(ArrayUtils.isEmpty(methodMatchesInClass))
               {
                  result = false;
                  break;
               }
               interfaceMethodParameters = interfaceMethod.parameters;
               classMethodParameters = methodMatchesInClass[0].parameters;
               if(interfaceMethodParameters.length != classMethodParameters.length)
               {
                  result = false;
               }
               for(i = 0; i < interfaceMethodParameters.length; i++)
               {
                  interfaceMethodParameter = interfaceMethodParameters[i];
                  parameterMatchesInClass = this.getParameters(classMethodParameters,i,interfaceMethodParameter.type,interfaceMethodParameter.optional);
                  if(ArrayUtils.isEmpty(parameterMatchesInClass))
                  {
                     result = false;
                     break;
                  }
               }
            }
         }
         return result;
      }
      
      public function isSubclassOf(parentClass:Class) : Boolean
      {
         var parentName:String = getQualifiedClassName(parentClass);
         var baseClasses:Array = this.instanceInfo.traits.bases;
         return ArrayUtils.contains(baseClasses,parentName);
      }
      
      public function isInterface() : Boolean
      {
         return this.clazz === Object?false:Boolean(ArrayUtils.isEmpty(this.instanceInfo.traits.bases));
      }
      
      public function getFullyQualifiedImplementedInterfaceNames(replaceColons:Boolean = false) : Array
      {
         var i:int = 0;
         var fullyQualifiedInterfaceName:String = null;
         var result:Array = [];
         var interfaces:Array = this.instanceInfo.traits.interfaces;
         if(!interfaces)
         {
            return result;
         }
         var len:int = interfaces.length;
         for(i = 0; i < len; i++)
         {
            fullyQualifiedInterfaceName = interfaces[i];
            if(replaceColons)
            {
               fullyQualifiedInterfaceName = ClassUtils.convertFullyQualifiedName(fullyQualifiedInterfaceName);
            }
            result[result.length] = fullyQualifiedInterfaceName;
         }
         return result;
      }
      
      public function getProperties(statik:Boolean = false, readable:Boolean = true, writable:Boolean = true) : Object
      {
         var properties:Array = null;
         var node:Object = null;
         var nodeClass:Class = null;
         var info:Object = !!statik?this.classInfo:this.instanceInfo;
         if(readable && writable)
         {
            properties = this.getMembers(info.traits.accessors,Access.READ_WRITE).concat(this.getMembers(info.traits.variables,Access.READ_WRITE));
         }
         else if(!readable && !writable)
         {
            properties = [];
         }
         else if(!writable)
         {
            properties = this.getMembers(info.traits.accessors,Access.READ_ONLY).concat(this.getMembers(info.traits.variables,Access.READ_ONLY));
         }
         else
         {
            properties = this.getMembers(info.traits.accessors,Access.WRITE_ONLY).concat(this.getMembers(info.traits.variables,Access.WRITE_ONLY));
         }
         var result:Object = {};
         for each(node in properties)
         {
            try
            {
               nodeClass = ClassUtils.forName(node.type);
            }
            catch(e:Error)
            {
               nodeClass = Object;
            }
            if(node.uri && QName(node.uri).localName != "")
            {
               result[node.uri + "::" + node.name] = nodeClass;
            }
            else
            {
               result[node.name] = nodeClass;
            }
         }
         return result;
      }
      
      public function getSuperClass() : Class
      {
         var result:Class = null;
         var superClasses:Array = this.instanceInfo.traits.bases;
         if(ArrayUtils.isNotEmpty(superClasses))
         {
            result = ClassUtils.forName(superClasses[0]);
         }
         return result;
      }
      
      private function getMembers(members:Array, access:String = null, name:String = null, type:String = null) : Array
      {
         var i:int = 0;
         var member:Object = null;
         var nameMatches:Boolean = false;
         var accessMatches:Boolean = false;
         var typeMatches:Boolean = false;
         var result:Array = [];
         if(!members)
         {
            return result;
         }
         var len:int = members.length;
         for(i = 0; i < len; i++)
         {
            member = members[i];
            nameMatches = !!StringUtils.isNotEmpty(name)?member.name == name:true;
            accessMatches = !!StringUtils.isNotEmpty(access)?member.access == access:true;
            typeMatches = !!StringUtils.isNotEmpty(type)?member.type == type:true;
            if(nameMatches && accessMatches && typeMatches)
            {
               result[result.length] = member;
            }
         }
         return result;
      }
      
      private function getMethods(methods:Array, name:String = null, returnType:String = null) : Array
      {
         var i:int = 0;
         var method:Object = null;
         var nameMatches:Boolean = false;
         var returnTypeMatches:Boolean = false;
         var result:Array = [];
         if(!methods)
         {
            return result;
         }
         var len:int = methods.length;
         for(i = 0; i < len; i++)
         {
            method = methods[i];
            nameMatches = !!StringUtils.isNotEmpty(name)?method.name == name:true;
            returnTypeMatches = !!StringUtils.isNotEmpty(returnType)?method.returnType == returnType:true;
            if(nameMatches && returnTypeMatches)
            {
               result[result.length] = method;
            }
         }
         return result;
      }
      
      private function getParameters(params:Array, index:int, type:String, optional:Boolean = false) : Array
      {
         var i:int = 0;
         var param:Object = null;
         var indexMatches:* = false;
         var typeMatches:Boolean = false;
         var optionalMatches:* = false;
         var result:Array = [];
         if(!params)
         {
            return result;
         }
         var len:int = params.length;
         for(i = 0; i < len; i++)
         {
            param = params[i];
            indexMatches = index == i;
            typeMatches = !!StringUtils.isNotEmpty(type)?param.type == type:true;
            optionalMatches = param.optional == optional;
            if(indexMatches && typeMatches && optionalMatches)
            {
               result[result.length] = param;
            }
         }
         return result;
      }
   }
}
