package org.as3commons.bytecode.abc
{
   import flash.errors.IllegalOperationError;
   import org.as3commons.bytecode.abc.enum.MultinameKind;
   import org.as3commons.lang.ICloneable;
   import org.as3commons.lang.IEquals;
   import org.as3commons.lang.StringUtils;
   
   public class BaseMultiname implements ICloneable, IEquals
   {
      
      private static const NOT_IMPLEMENTED_ERROR:String = "Not implemented in BaseMultiname";
      
      private static const BASE_MULTINAME_TOSTRING_TEMPLATE:String = "BaseMultiname[kind={0}]";
       
      
      private var _kind:MultinameKind;
      
      public var poolIndex:uint;
      
      public function BaseMultiname(kindValue:MultinameKind)
      {
         super();
         this._kind = kindValue;
      }
      
      public function clone() : *
      {
         throw new IllegalOperationError(NOT_IMPLEMENTED_ERROR);
      }
      
      public function assertAppropriateMultinameKind(expectedKinds:Array, givenKind:MultinameKind) : void
      {
         if(expectedKinds.indexOf(givenKind) == -1)
         {
            throw new Error("Invalid Multiname Kind: " + givenKind);
         }
      }
      
      public function get kind() : MultinameKind
      {
         return this._kind;
      }
      
      public function equals(other:Object) : Boolean
      {
         var matches:Boolean = false;
         var multiname:BaseMultiname = BaseMultiname(other);
         if(multiname.kind === this.kind)
         {
            matches = true;
         }
         return matches;
      }
      
      public function toString() : String
      {
         return StringUtils.substitute(BASE_MULTINAME_TOSTRING_TEMPLATE,this._kind);
      }
      
      public function toHash() : String
      {
         return this.poolIndex.toString();
      }
   }
}
