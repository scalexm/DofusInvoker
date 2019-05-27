package org.as3commons.bytecode.abc.enum
{
   import flash.utils.Dictionary;
   import org.as3commons.lang.StringUtils;
   
   public final class ConstantKind
   {
      
      private static var _enumCreated:Boolean = false;
      
      private static const _TYPES:Dictionary = new Dictionary();
      
      public static const UNKNOWN:ConstantKind = new ConstantKind(0,"UNKNOWN");
      
      public static const INT:ConstantKind = new ConstantKind(3,"int");
      
      public static const UINT:ConstantKind = new ConstantKind(4,"uint");
      
      public static const DOUBLE:ConstantKind = new ConstantKind(6,"double");
      
      public static const UTF8:ConstantKind = new ConstantKind(1,"utf8");
      
      public static const TRUE:ConstantKind = new ConstantKind(11,"true");
      
      public static const FALSE:ConstantKind = new ConstantKind(10,"false");
      
      public static const NULL:ConstantKind = new ConstantKind(12,"null");
      
      public static const UNDEFINED:ConstantKind = new ConstantKind(0,"undefined");
      
      public static const NAMESPACE:ConstantKind = new ConstantKind(8,"namespace");
      
      public static const PACKAGE_NAMESPACE:ConstantKind = new ConstantKind(22,"package namespace");
      
      public static const PACKAGE_INTERNAL_NAMESPACE:ConstantKind = new ConstantKind(23,"package internal namespace");
      
      public static const PROTECTED_NAMESPACE:ConstantKind = new ConstantKind(24,"protected namespace");
      
      public static const EXPLICIT_NAMESPACE:ConstantKind = new ConstantKind(25,"explicit namespace");
      
      public static const STATIC_PROTECTED_NAMESPACE:ConstantKind = new ConstantKind(26,"static protected namespace");
      
      public static const PRIVATE_NAMESPACE:ConstantKind = new ConstantKind(5,"private namespace");
      
      {
         _enumCreated = true;
      }
      
      private var _kind:uint;
      
      private var _description:String;
      
      public function ConstantKind(optionKind:uint, optionDescription:String)
      {
         super();
         this._kind = optionKind;
         this._description = optionDescription;
         _TYPES[this._kind] = this;
      }
      
      public static function determineKind(kindValue:int) : ConstantKind
      {
         var matchingKind:ConstantKind = _TYPES[kindValue];
         if(matchingKind == null)
         {
            throw new Error("Unable to match ConstantKind to " + kindValue);
         }
         return matchingKind;
      }
      
      public static function determineKindFromInstance(instance:*) : ConstantKind
      {
         var b:Boolean = false;
         if(instance is String)
         {
            return ConstantKind.UTF8;
         }
         if(instance is uint)
         {
            return ConstantKind.UINT;
         }
         if(instance is int)
         {
            return ConstantKind.INT;
         }
         if(instance is Number)
         {
            return ConstantKind.DOUBLE;
         }
         if(instance is Boolean)
         {
            b = instance as Boolean;
            return !!b?ConstantKind.TRUE:ConstantKind.FALSE;
         }
         if(instance == null)
         {
            return ConstantKind.NULL;
         }
         return ConstantKind.UNKNOWN;
      }
      
      public function get value() : uint
      {
         return this._kind;
      }
      
      public function get description() : String
      {
         return this._description;
      }
      
      public function toString() : String
      {
         return StringUtils.substitute("ConstantKind[description={0}]",this._description);
      }
   }
}
