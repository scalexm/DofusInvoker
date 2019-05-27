package org.as3commons.bytecode.abc.enum
{
   public final class MethodFlag
   {
      
      public static const NEED_ARGUMENTS:MethodFlag = new MethodFlag(1,"need arguments");
      
      public static const NEED_ACTIVATION:MethodFlag = new MethodFlag(2,"need activation");
      
      public static const NEED_REST:MethodFlag = new MethodFlag(4,"need rest");
      
      public static const HAS_OPTIONAL:MethodFlag = new MethodFlag(8,"has optional");
      
      public static const SET_DXNS:MethodFlag = new MethodFlag(64,"set dxns");
      
      public static const HAS_PARAM_NAMES:MethodFlag = new MethodFlag(128,"has param names");
      
      public static const IGNORE_REST:MethodFlag = new MethodFlag(16,"ignore rest");
      
      public static const NATIVE:MethodFlag = new MethodFlag(32,"native");
       
      
      private var _value:uint;
      
      private var _description:String;
      
      public function MethodFlag(flagValue:uint, flagDescription:String)
      {
         super();
         this._value = flagValue;
         this._description = flagDescription;
      }
      
      public static function flagPresent(flagsValueFromMethodInfo:uint, flagBeingCheckedFor:MethodFlag) : Boolean
      {
         return Boolean(flagsValueFromMethodInfo & flagBeingCheckedFor.value);
      }
      
      public static function addFlag(flagsValueFromMethodInfo:uint, flagToAdd:MethodFlag) : uint
      {
         return !flagPresent(flagsValueFromMethodInfo,flagToAdd)?uint(flagsValueFromMethodInfo = uint(flagsValueFromMethodInfo | flagToAdd.value)):uint(flagsValueFromMethodInfo);
      }
      
      public static function removeFlag(flagsValueFromMethodInfo:uint, flagToAdd:MethodFlag) : uint
      {
         return !!flagPresent(flagsValueFromMethodInfo,flagToAdd)?uint(flagsValueFromMethodInfo = uint(flagsValueFromMethodInfo & flagToAdd.value)):uint(flagsValueFromMethodInfo);
      }
      
      public function get value() : uint
      {
         return this._value;
      }
      
      public function get description() : String
      {
         return this._description;
      }
   }
}
