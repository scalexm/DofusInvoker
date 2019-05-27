package org.as3commons.bytecode.abc.enum
{
   import flash.utils.Dictionary;
   
   public final class NamespaceKind
   {
      
      private static var _enumCreated:Boolean = false;
      
      private static const _TYPES:Dictionary = new Dictionary();
      
      private static const _NAMES:Dictionary = new Dictionary();
      
      private static const _TYPELIST:Array = [];
      
      public static const UNKNOWN:NamespaceKind = new NamespaceKind(0,"unknown");
      
      public static const NAMESPACE:NamespaceKind = new NamespaceKind(8,"namespace");
      
      public static const PACKAGE_NAMESPACE:NamespaceKind = new NamespaceKind(22,"public");
      
      public static const PACKAGE_INTERNAL_NAMESPACE:NamespaceKind = new NamespaceKind(23,"packageInternalNamespace");
      
      public static const PROTECTED_NAMESPACE:NamespaceKind = new NamespaceKind(24,"protectedNamespace");
      
      public static const EXPLICIT_NAMESPACE:NamespaceKind = new NamespaceKind(25,"explicitNamespace");
      
      public static const STATIC_PROTECTED_NAMESPACE:NamespaceKind = new NamespaceKind(26,"staticProtectedNamespace");
      
      public static const PRIVATE_NAMESPACE:NamespaceKind = new NamespaceKind(5,"private");
      
      {
         _enumCreated = true;
      }
      
      private var _byteValue:uint;
      
      private var _description:String;
      
      public function NamespaceKind(byteValue:uint, description:String)
      {
         super();
         this._byteValue = byteValue;
         this._description = description;
         _TYPES[byteValue] = this;
         _NAMES[description] = this;
      }
      
      public static function get types() : Array
      {
         var typeKey:* = null;
         if(_TYPELIST.length == 0)
         {
            for(typeKey in _TYPES)
            {
               _TYPELIST[_TYPELIST.length] = _TYPES[typeKey];
            }
         }
         return _TYPELIST;
      }
      
      public static function determineKind(kindByte:int) : NamespaceKind
      {
         var kind:NamespaceKind = _TYPES[kindByte];
         if(kind == null)
         {
            throw new Error("Unknown NamespaceKind: " + kindByte);
         }
         return kind;
      }
      
      public static function determineKindByName(kindName:String) : NamespaceKind
      {
         var kind:NamespaceKind = _NAMES[kindName];
         if(kind == null)
         {
            throw new Error("Unknown NamespaceKind: " + kindName);
         }
         return kind;
      }
      
      public function get byteValue() : int
      {
         return this._byteValue;
      }
      
      public function get description() : String
      {
         return this._description;
      }
      
      public function toString() : String
      {
         return this._description;
      }
   }
}
