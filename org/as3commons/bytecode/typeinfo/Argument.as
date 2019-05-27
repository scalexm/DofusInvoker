package org.as3commons.bytecode.typeinfo
{
   import org.as3commons.bytecode.abc.BaseMultiname;
   import org.as3commons.bytecode.abc.enum.ConstantKind;
   import org.as3commons.lang.ICloneable;
   import org.as3commons.lang.IEquals;
   
   public final class Argument implements ICloneable, IEquals
   {
       
      
      public var name:String;
      
      public var defaultValue;
      
      public var isOptional:Boolean;
      
      public var kind:ConstantKind;
      
      public var type:BaseMultiname;
      
      public function Argument(typeValue:BaseMultiname = null, hasOptionalValue:Boolean = false, defaultVal:* = null, defaultValueKind:ConstantKind = null)
      {
         super();
         this.type = typeValue;
         this.isOptional = hasOptionalValue;
         this.defaultValue = defaultVal;
         this.kind = defaultValueKind;
      }
      
      public function clone() : *
      {
         return new Argument(this.type,this.isOptional,this.defaultValue,this.kind);
      }
      
      public function toString() : String
      {
         return this.type + "";
      }
      
      public function equals(other:Object) : Boolean
      {
         var otherArg:Argument = other as Argument;
         if(otherArg != null)
         {
            if(this.name != otherArg.name)
            {
               return false;
            }
            if(!isNaN(this.defaultValue))
            {
               if(this.defaultValue !== otherArg.defaultValue)
               {
                  return false;
               }
            }
            else if(isNaN(this.defaultValue) && isNaN(otherArg.defaultValue) == false)
            {
               return false;
            }
            if(this.isOptional != otherArg.isOptional)
            {
               return false;
            }
            if(this.kind !== otherArg.kind)
            {
               return false;
            }
            if(!this.type.equals(otherArg.type))
            {
               return false;
            }
            return true;
         }
         return false;
      }
   }
}
