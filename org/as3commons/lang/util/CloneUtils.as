package org.as3commons.lang.util
{
   import flash.utils.Dictionary;
   import org.as3commons.lang.Assert;
   import org.as3commons.lang.ICloneable;
   
   public final class CloneUtils
   {
       
      
      public function CloneUtils()
      {
         super();
      }
      
      public static function cloneList(cloneables:Array) : Array
      {
         var cloneable:ICloneable = null;
         Assert.notNull(cloneables,"cloneables argument must not be null");
         var clone:Array = [];
         for each(cloneable in cloneables)
         {
            clone[clone.length] = cloneable.clone();
         }
         return clone;
      }
      
      public static function cloneDictionary(dictionary:Dictionary) : Dictionary
      {
         var keyValue:* = undefined;
         var value:* = undefined;
         var key:* = undefined;
         var clone:Dictionary = new Dictionary();
         for(keyValue in dictionary)
         {
            value = dictionary[keyValue];
            key = keyValue is ICloneable?ICloneable(keyValue):keyValue;
            clone[key] = value is ICloneable?ICloneable(value):value;
         }
         return clone;
      }
   }
}
