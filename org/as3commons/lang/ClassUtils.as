package org.as3commons.lang
{
   import flash.events.TimerEvent;
   import flash.system.ApplicationDomain;
   import flash.utils.Proxy;
   import flash.utils.Timer;
   import flash.utils.getQualifiedClassName;
   import flash.utils.getQualifiedSuperclassName;
   
   public final class ClassUtils
   {
      
      public static const CLEAR_CACHE_INTERVAL:uint = 60000;
      
      public static var clearCacheInterval:uint = CLEAR_CACHE_INTERVAL;
      
      private static var _clearCacheIntervalEnabled:Boolean = true;
      
      private static const AS3VEC_SUFFIX:String = "__AS3__.vec";
      
      private static const CONSTRUCTOR_FIELD_NAME:String = "constructor";
      
      private static const LESS_THAN:String = "<";
      
      private static const PACKAGE_CLASS_SEPARATOR:String = "::";
      
      private static var _typeDescriptionCache:Object = {};
      
      private static var _timer:Timer;
       
      
      public function ClassUtils()
      {
         super();
      }
      
      public static function get clearCacheIntervalEnabled() : Boolean
      {
         return _clearCacheIntervalEnabled;
      }
      
      public static function set clearCacheIntervalEnabled(value:Boolean) : void
      {
         _clearCacheIntervalEnabled = value;
         if(!_clearCacheIntervalEnabled)
         {
            stopTimer();
         }
      }
      
      public static function clearDescribeTypeCache() : void
      {
         _typeDescriptionCache = {};
         stopTimer();
      }
      
      public static function convertFullyQualifiedName(className:String) : String
      {
         return className.replace(PACKAGE_CLASS_SEPARATOR,".");
      }
      
      public static function forInstance(instance:*, applicationDomain:ApplicationDomain = null) : Class
      {
         var className:String = null;
         if(!(instance is Proxy) && instance.hasOwnProperty(CONSTRUCTOR_FIELD_NAME))
         {
            return instance[CONSTRUCTOR_FIELD_NAME];
         }
         className = getQualifiedClassName(instance);
         return forName(className,applicationDomain);
      }
      
      public static function forName(name:String, applicationDomain:ApplicationDomain = null) : Class
      {
         var result:Class = null;
         var applicationDomain:ApplicationDomain = applicationDomain || ApplicationDomain.currentDomain;
         while(!applicationDomain.hasDefinition(name))
         {
            if(applicationDomain.parentDomain)
            {
               applicationDomain = applicationDomain.parentDomain;
               continue;
            }
            break;
         }
         try
         {
            result = applicationDomain.getDefinition(name) as Class;
         }
         catch(e:ReferenceError)
         {
            throw new ClassNotFoundError("A class with the name \'" + name + "\' could not be found.");
         }
         return result;
      }
      
      public static function getClassParameterFromFullyQualifiedName(fullName:String, applicationDomain:ApplicationDomain = null) : Class
      {
         var startIdx:int = 0;
         var len:int = 0;
         var className:String = null;
         if(StringUtils.startsWith(fullName,AS3VEC_SUFFIX))
         {
            startIdx = fullName.indexOf(LESS_THAN) + 1;
            len = fullName.length - startIdx - 1;
            className = fullName.substr(startIdx,len);
            return forName(className,applicationDomain);
         }
         return null;
      }
      
      public static function getFullyQualifiedImplementedInterfaceNames(clazz:Class, replaceColons:Boolean = false, applicationDomain:ApplicationDomain = null) : Array
      {
         var typeDescription:ITypeDescription = getTypeDescription(clazz,applicationDomain);
         return typeDescription.getFullyQualifiedImplementedInterfaceNames(replaceColons);
      }
      
      public static function getFullyQualifiedName(clazz:Class, replaceColons:Boolean = false) : String
      {
         var result:String = getQualifiedClassName(clazz);
         if(replaceColons)
         {
            return convertFullyQualifiedName(result);
         }
         return result;
      }
      
      public static function getFullyQualifiedSuperClassName(clazz:Class, replaceColons:Boolean = false) : String
      {
         var result:String = getQualifiedSuperclassName(clazz);
         if(replaceColons)
         {
            result = convertFullyQualifiedName(result);
         }
         return result;
      }
      
      public static function getImplementedInterfaceNames(clazz:Class) : Array
      {
         var result:Array = getFullyQualifiedImplementedInterfaceNames(clazz);
         for(var i:int = 0; i < result.length; i++)
         {
            result[i] = getNameFromFullyQualifiedName(result[i]);
         }
         return result;
      }
      
      public static function getImplementedInterfaces(clazz:Class, applicationDomain:ApplicationDomain = null) : Array
      {
         applicationDomain = applicationDomain || ApplicationDomain.currentDomain;
         var result:Array = getFullyQualifiedImplementedInterfaceNames(clazz);
         for(var i:int = 0; i < result.length; i++)
         {
            result[i] = ClassUtils.forName(result[i],applicationDomain);
         }
         return result;
      }
      
      public static function getName(clazz:Class) : String
      {
         return getNameFromFullyQualifiedName(getFullyQualifiedName(clazz));
      }
      
      public static function getNameFromFullyQualifiedName(fullyQualifiedName:String) : String
      {
         var startIndex:int = fullyQualifiedName.indexOf(PACKAGE_CLASS_SEPARATOR);
         if(startIndex == -1)
         {
            return fullyQualifiedName;
         }
         return fullyQualifiedName.substring(startIndex + PACKAGE_CLASS_SEPARATOR.length,fullyQualifiedName.length);
      }
      
      public static function getProperties(clazz:*, statik:Boolean = false, readable:Boolean = true, writable:Boolean = true, applicationDomain:ApplicationDomain = null) : Object
      {
         var typeDescription:ITypeDescription = getTypeDescription(clazz,applicationDomain);
         return typeDescription.getProperties(statik,readable,writable);
      }
      
      public static function getSuperClass(clazz:Class, applicationDomain:ApplicationDomain = null) : Class
      {
         var typeDescription:ITypeDescription = getTypeDescription(clazz,applicationDomain);
         return typeDescription.getSuperClass();
      }
      
      public static function getSuperClassName(clazz:Class) : String
      {
         var fullyQualifiedName:String = getFullyQualifiedSuperClassName(clazz);
         var index:int = fullyQualifiedName.indexOf(PACKAGE_CLASS_SEPARATOR) + PACKAGE_CLASS_SEPARATOR.length;
         return fullyQualifiedName.substring(index,fullyQualifiedName.length);
      }
      
      public static function isAssignableFrom(clazz1:Class, clazz2:Class, applicationDomain:ApplicationDomain = null) : Boolean
      {
         return clazz1 === clazz2 || isSubclassOf(clazz2,clazz1,applicationDomain) || isImplementationOf(clazz2,clazz1,applicationDomain);
      }
      
      public static function isImplementationOf(clazz:Class, interfaze:Class, applicationDomain:ApplicationDomain = null) : Boolean
      {
         var typeDescription:ITypeDescription = getTypeDescription(clazz,applicationDomain);
         return typeDescription.isImplementationOf(interfaze);
      }
      
      public static function isInformalImplementationOf(clazz:Class, interfaze:Class, applicationDomain:ApplicationDomain = null) : Boolean
      {
         var typeDescription:ITypeDescription = getTypeDescription(clazz,applicationDomain);
         return typeDescription.isInformalImplementationOf(interfaze);
      }
      
      public static function isInterface(clazz:Class) : Boolean
      {
         var typeDescription:ITypeDescription = getTypeDescription(clazz,ApplicationDomain.currentDomain);
         return typeDescription.isInterface();
      }
      
      public static function isPrivateClass(object:*) : Boolean
      {
         var className:String = object is Class?getQualifiedClassName(object):object.toString();
         var index:int = className.indexOf("::");
         var inRootPackage:* = index == -1;
         if(inRootPackage)
         {
            return false;
         }
         var ns:String = className.substr(0,index);
         return ns === "" || ns.indexOf(".as$") > -1;
      }
      
      public static function isSubclassOf(clazz:Class, parentClass:Class, applicationDomain:ApplicationDomain = null) : Boolean
      {
         var typeDescription:ITypeDescription = getTypeDescription(clazz,applicationDomain);
         return typeDescription.isSubclassOf(parentClass);
      }
      
      public static function newInstance(clazz:Class, args:Array = null) : *
      {
         var result:* = undefined;
         var a:Array = args == null?[]:args;
         switch(a.length)
         {
            case 1:
               result = new clazz(a[0]);
               break;
            case 2:
               result = new clazz(a[0],a[1]);
               break;
            case 3:
               result = new clazz(a[0],a[1],a[2]);
               break;
            case 4:
               result = new clazz(a[0],a[1],a[2],a[3]);
               break;
            case 5:
               result = new clazz(a[0],a[1],a[2],a[3],a[4]);
               break;
            case 6:
               result = new clazz(a[0],a[1],a[2],a[3],a[4],a[5]);
               break;
            case 7:
               result = new clazz(a[0],a[1],a[2],a[3],a[4],a[5],a[6]);
               break;
            case 8:
               result = new clazz(a[0],a[1],a[2],a[3],a[4],a[5],a[6],a[7]);
               break;
            case 9:
               result = new clazz(a[0],a[1],a[2],a[3],a[4],a[5],a[6],a[7],a[8]);
               break;
            case 10:
               result = new clazz(a[0],a[1],a[2],a[3],a[4],a[5],a[6],a[7],a[8],a[9]);
               break;
            default:
               result = new clazz();
         }
         return result;
      }
      
      public static function getTypeDescription(object:Object, applicationDomain:ApplicationDomain) : ITypeDescription
      {
         var typeDescription:ITypeDescription = null;
         Assert.notNull(object,"The clazz argument must not be null");
         var className:String = getQualifiedClassName(object);
         if(_typeDescriptionCache.hasOwnProperty(className))
         {
            typeDescription = _typeDescriptionCache[className];
         }
         else
         {
            if(!_timer && clearCacheIntervalEnabled)
            {
               _timer = new Timer(clearCacheInterval,1);
               _timer.addEventListener(TimerEvent.TIMER,timerHandler);
            }
            if(!(object is Class))
            {
               if(object.hasOwnProperty(CONSTRUCTOR_FIELD_NAME))
               {
                  object = object.constructor;
               }
               else
               {
                  object = forName(className,applicationDomain);
               }
            }
            typeDescription = TypeDescriptor.getTypeDescriptionForClass(object as Class);
            _typeDescriptionCache[className] = typeDescription;
            if(_timer && !_timer.running)
            {
               _timer.start();
            }
         }
         return typeDescription;
      }
      
      private static function stopTimer() : void
      {
         if(_timer && _timer.running)
         {
            _timer.stop();
         }
      }
      
      private static function timerHandler(e:TimerEvent) : void
      {
         clearDescribeTypeCache();
      }
   }
}
