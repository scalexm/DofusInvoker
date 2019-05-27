package com.ankamagames.jerakine.utils.misc
{
   import flash.utils.Dictionary;
   import flash.utils.getQualifiedClassName;
   
   public class CheckCompatibility
   {
      
      private static var _cache:Dictionary = new Dictionary(true);
       
      
      public function CheckCompatibility()
      {
         super();
      }
      
      public static function isCompatible(reference:Class, target:*, strict:Boolean = false, throwError:Boolean = true) : Boolean
      {
         var method:XML = null;
         var param:XML = null;
         var targetMethods:XMLList = null;
         var referenceString:String = getQualifiedClassName(reference);
         var targetString:String = getQualifiedClassName(target);
         if(!_cache[referenceString])
         {
            _cache[referenceString] = new Dictionary(true);
         }
         if(_cache[referenceString][targetString] != null)
         {
            if(throwError && !_cache[referenceString][targetString])
            {
               throwErrorMsg(reference,target);
            }
            return _cache[referenceString][targetString];
         }
         var referenceDesc:XML = DescribeTypeCache.typeDescription(reference);
         var targetDesc:XML = DescribeTypeCache.typeDescription(target);
         var referenceMethodParent:XML = getXmlWithFactoryCheck(referenceDesc);
         var targetMethodParent:XML = getXmlWithFactoryCheck(targetDesc);
         for each(method in referenceMethodParent.child("method"))
         {
            targetMethods = targetMethodParent.child("method").(@name == method.@name && (@returnType == method.@returnType || !strict && method.@returnType == "Object"));
            if(targetMethods.length() != 1)
            {
               _cache[referenceString][targetString] = false;
               if(throwError)
               {
                  throwErrorMsg(reference,target);
               }
               return false;
            }
            for each(param in method.child("parameter"))
            {
               if(!targetMethods.child("parameter").(@index == param.@index && @type == param.@type && @optional == param.@optional).length())
               {
                  _cache[referenceString][targetString] = false;
                  if(throwError)
                  {
                     throwErrorMsg(reference,target);
                  }
                  return false;
               }
            }
         }
         _cache[referenceString][targetString] = true;
         return true;
      }
      
      public static function getIncompatibility(reference:Class, target:*, strict:Boolean = false) : String
      {
         var method:XML = null;
         var param:XML = null;
         var fct:String = null;
         var targetMethods:XMLList = null;
         var referenceDesc:XML = DescribeTypeCache.typeDescription(reference);
         var targetDesc:XML = DescribeTypeCache.typeDescription(target);
         var ok:Boolean = true;
         var referenceMethodParent:XML = getXmlWithFactoryCheck(referenceDesc);
         var targetMethodParent:XML = getXmlWithFactoryCheck(targetDesc);
         for each(method in referenceMethodParent.child("method"))
         {
            fct = "public function " + method.@name + "(";
            targetMethods = targetMethodParent.child("method").(@name == method.@name && (@returnType == method.@returnType || !strict && method.@returnType == "Object"));
            if(targetMethods.length() != 1)
            {
               ok = false;
            }
            for each(param in method.child("parameter"))
            {
               fct = fct + ((parseInt(param.@index) > 1?", ":"") + "param" + param.@index + " : " + param.@type);
               if(!targetMethods.child("parameter").(@index == param.@index && @type == param.@type && @optional == param.@optional).length())
               {
                  ok = false;
               }
            }
            fct = fct + (") : " + method.@returnType);
            if(!ok)
            {
               return fct;
            }
         }
         return null;
      }
      
      private static function throwErrorMsg(reference:Class, target:*) : void
      {
         throw new Error(target + " don\'t implement correctly [" + getIncompatibility(reference,target) + "]");
      }
      
      public static function getXmlWithFactoryCheck(xml:XML) : XML
      {
         var referenceFactory:XMLList = xml.child("factory");
         if(referenceFactory.length() != 0)
         {
            xml = referenceFactory[0];
         }
         return xml;
      }
   }
}
