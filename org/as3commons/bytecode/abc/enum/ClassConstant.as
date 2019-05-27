package org.as3commons.bytecode.abc.enum
{
   import flash.utils.Dictionary;
   
   public final class ClassConstant extends BaseEnum
   {
      
      private static const _items:Dictionary = new Dictionary();
      
      private static var _enumCreated:Boolean = false;
      
      public static const SEALED:ClassConstant = new ClassConstant(1,"sealed");
      
      public static const FINAL:ClassConstant = new ClassConstant(2,"final");
      
      public static const INTERFACE:ClassConstant = new ClassConstant(4,"interface");
      
      public static const PROTECTED_NAMESPACE:ClassConstant = new ClassConstant(8,"protected namespace");
      
      {
         _enumCreated = true;
      }
      
      private var _description:String;
      
      public function ClassConstant(bitMaskValue:uint, descriptionValue:String)
      {
         super(bitMaskValue);
         _items[bitMaskValue] = this;
         this._description = descriptionValue;
      }
      
      public static function fromValue(bitMaskValue:uint) : ClassConstant
      {
         var classConstant:ClassConstant = _items[bitMaskValue];
         if(classConstant == null)
         {
            throw new Error("Unable to match ClassConstant to " + classConstant);
         }
         return classConstant;
      }
      
      public function present(bitMask:uint) : Boolean
      {
         return Boolean(this.bitMask & bitMask);
      }
      
      public function get bitMask() : uint
      {
         return uint(value);
      }
      
      public function get description() : String
      {
         return this._description;
      }
      
      override public function toString() : String
      {
         return "";
      }
   }
}
