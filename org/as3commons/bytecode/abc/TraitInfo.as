package org.as3commons.bytecode.abc
{
   import flash.errors.IllegalOperationError;
   import org.as3commons.bytecode.abc.enum.TraitKind;
   import org.as3commons.bytecode.typeinfo.Annotatable;
   import org.as3commons.lang.IEquals;
   
   public class TraitInfo extends Annotatable implements IEquals
   {
       
      
      public var traitMultiname:QualifiedName;
      
      public var traitKind:TraitKind;
      
      public var isFinal:Boolean;
      
      public var isOverride:Boolean;
      
      public function TraitInfo()
      {
         super();
      }
      
      override public function clone() : *
      {
         throw new IllegalOperationError(NOT_IMPLEMENTED_ERROR);
      }
      
      override protected function populateClone(annotatable:Annotatable) : void
      {
         super.populateClone(annotatable);
         var traitInfo:TraitInfo = TraitInfo(annotatable);
         traitInfo.traitMultiname = this.traitMultiname.clone();
         traitInfo.traitKind = this.traitKind;
         traitInfo.isFinal = this.isFinal;
         traitInfo.isOverride = this.isOverride;
      }
      
      public function get hasMetadata() : Boolean
      {
         return metadata.length > 0;
      }
      
      public function equals(other:Object) : Boolean
      {
         var otherTrait:TraitInfo = other as TraitInfo;
         if(otherTrait != null)
         {
            if(!this.traitMultiname.equals(otherTrait.traitMultiname))
            {
               return false;
            }
            if(this.traitKind !== otherTrait.traitKind)
            {
               return false;
            }
            if(this.isFinal != otherTrait.isFinal)
            {
               return false;
            }
            if(this.isOverride != otherTrait.isOverride)
            {
               return false;
            }
            return true;
         }
         return false;
      }
   }
}
