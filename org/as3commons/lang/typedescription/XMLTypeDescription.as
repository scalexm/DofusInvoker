package org.as3commons.lang.typedescription
{
   import flash.utils.describeType;
   import flash.utils.getQualifiedClassName;
   import org.as3commons.lang.ClassUtils;
   import org.as3commons.lang.ITypeDescription;
   
   public class XMLTypeDescription implements ITypeDescription
   {
       
      
      private var _clazz:Class;
      
      private var _instanceInfo:XML;
      
      private var _classInfo:XML;
      
      public function XMLTypeDescription(clazz:Class)
      {
         super();
         this._clazz = clazz;
         this._classInfo = describeType(clazz);
         this._instanceInfo = this._classInfo.factory[0];
      }
      
      public function get clazz() : Class
      {
         return this._clazz;
      }
      
      public function get classInfo() : *
      {
         return this._classInfo;
      }
      
      public function get instanceInfo() : *
      {
         return this._instanceInfo;
      }
      
      public function isImplementationOf(interfaze:Class) : Boolean
      {
         var result:Boolean = false;
         if(this.clazz == null)
         {
            result = false;
         }
         else
         {
            result = this.instanceInfo.implementsInterface.(@type == getQualifiedClassName(interfaze)).length() != 0;
         }
         return result;
      }
      
      public function isInformalImplementationOf(interfaze:Class) : Boolean
      {
         var interfaceInstanceInfo:XML = null;
         var interfaceAccessors:XMLList = null;
         var interfaceAccessor:XML = null;
         var interfaceMethods:XMLList = null;
         var interfaceMethod:XML = null;
         var accessorMatchesInClass:XMLList = null;
         var methodMatchesInClass:XMLList = null;
         var interfaceMethodParameters:XMLList = null;
         var classMethodParameters:XMLList = null;
         var interfaceParameter:XML = null;
         var parameterMatchesInClass:XMLList = null;
         var result:Boolean = true;
         if(interfaze == null)
         {
            result = false;
         }
         else
         {
            interfaceInstanceInfo = new XMLTypeDescription(interfaze).instanceInfo;
            interfaceAccessors = interfaceInstanceInfo.accessor;
            for each(interfaceAccessor in interfaceAccessors)
            {
               accessorMatchesInClass = this.instanceInfo.accessor.(@name == interfaceAccessor.@name && @access == interfaceAccessor.@access && @type == interfaceAccessor.@type);
               if(accessorMatchesInClass.length() < 1)
               {
                  result = false;
                  break;
               }
            }
            interfaceMethods = interfaceInstanceInfo.method;
            for each(interfaceMethod in interfaceMethods)
            {
               methodMatchesInClass = this.instanceInfo.method.(@name == interfaceMethod.@name && @returnType == interfaceMethod.@returnType);
               if(methodMatchesInClass.length() < 1)
               {
                  result = false;
                  break;
               }
               interfaceMethodParameters = interfaceMethod.parameter;
               classMethodParameters = methodMatchesInClass.parameter;
               if(interfaceMethodParameters.length() != classMethodParameters.length())
               {
                  result = false;
               }
               for each(interfaceParameter in interfaceMethodParameters)
               {
                  parameterMatchesInClass = methodMatchesInClass.parameter.(@index == interfaceParameter.@index && @type == interfaceParameter.@type && @optional == interfaceParameter.@optional);
                  if(parameterMatchesInClass.length() < 1)
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
         return this.instanceInfo.extendsClass.(@type == parentName).length() != 0;
      }
      
      public function isInterface() : Boolean
      {
         return this.clazz === Object?false:this.instanceInfo.extendsClass.length() == 0;
      }
      
      public function getFullyQualifiedImplementedInterfaceNames(replaceColons:Boolean = false) : Array
      {
         var numInterfaces:int = 0;
         var i:int = 0;
         var fullyQualifiedInterfaceName:String = null;
         var result:Array = [];
         var interfacesDescription:XMLList = this.instanceInfo.implementsInterface;
         if(interfacesDescription)
         {
            numInterfaces = interfacesDescription.length();
            for(i = 0; i < numInterfaces; i++)
            {
               fullyQualifiedInterfaceName = interfacesDescription[i].@type.toString();
               if(replaceColons)
               {
                  fullyQualifiedInterfaceName = ClassUtils.convertFullyQualifiedName(fullyQualifiedInterfaceName);
               }
               result[result.length] = fullyQualifiedInterfaceName;
            }
         }
         return result;
      }
      
      public function getProperties(statik:Boolean = false, readable:Boolean = true, writable:Boolean = true) : Object
      {
         var properties:XMLList = null;
         var result:Object = null;
         var node:XML = null;
         var nodeClass:Class = null;
         var xml:XML = !!statik?this.classInfo:this.instanceInfo;
         if(readable && writable)
         {
            properties = xml.accessor.(@access == Access.READ_WRITE) + xml.variable;
         }
         else if(!readable && !writable)
         {
            properties = new XMLList();
         }
         else if(!writable)
         {
            properties = xml.constant + xml.accessor.(@access == Access.READ_ONLY);
         }
         else
         {
            properties = xml.accessor.(@access == Access.WRITE_ONLY);
         }
         result = {};
         for each(node in properties)
         {
            try
            {
               nodeClass = ClassUtils.forName(node.@type);
            }
            catch(e:Error)
            {
               nodeClass = Object;
            }
            if(node.@uri && QName(node.@uri).localName != "")
            {
               result[node.@uri + "::" + node.@name] = nodeClass;
            }
            else
            {
               result[node.@name] = nodeClass;
            }
         }
         return result;
      }
      
      public function getSuperClass() : Class
      {
         var result:Class = null;
         var superClasses:XMLList = this.instanceInfo.extendsClass;
         if(superClasses.length() > 0)
         {
            result = ClassUtils.forName(superClasses[0].@type);
         }
         return result;
      }
   }
}
