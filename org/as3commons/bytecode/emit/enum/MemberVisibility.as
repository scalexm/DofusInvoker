package org.as3commons.bytecode.emit.enum
{
   import flash.utils.Dictionary;
   import org.as3commons.bytecode.abc.enum.BaseEnum;
   import org.as3commons.lang.Assert;
   
   public final class MemberVisibility extends BaseEnum
   {
      
      private static const _items:Dictionary = new Dictionary();
      
      private static var _enumCreated:Boolean = false;
      
      public static const PUBLIC:MemberVisibility = new MemberVisibility(PUBLIC_VALUE);
      
      public static const PROTECTED:MemberVisibility = new MemberVisibility(PROTECTED_VALUE);
      
      public static const PRIVATE:MemberVisibility = new MemberVisibility(PRIVATE_VALUE);
      
      public static const NAMESPACE:MemberVisibility = new MemberVisibility(NAMESPACE_VALUE);
      
      public static const INTERNAL:MemberVisibility = new MemberVisibility(INTERNAL_VALUE);
      
      private static const PUBLIC_VALUE:String = "public";
      
      private static const PROTECTED_VALUE:String = "protected";
      
      private static const PRIVATE_VALUE:String = "private";
      
      private static const NAMESPACE_VALUE:String = "namespace";
      
      private static const INTERNAL_VALUE:String = "internal";
      
      {
         _enumCreated = true;
      }
      
      public function MemberVisibility(val:*)
      {
         Assert.state(!_enumCreated,"MemberVisibility enum has already been created");
         super(val);
         _items[val] = this;
      }
      
      public static function fromValue(value:String) : MemberVisibility
      {
         return _items[value] as MemberVisibility;
      }
   }
}
