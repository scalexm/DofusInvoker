package org.as3commons.bytecode.abc
{
   import org.as3commons.bytecode.typeinfo.Annotatable;
   import org.as3commons.lang.StringUtils;
   
   public final class FunctionTrait extends TraitInfo
   {
       
      
      public var functionSlotId:int;
      
      public var functionMethod:MethodInfo;
      
      public var isStatic:Boolean = false;
      
      public function FunctionTrait()
      {
         super();
      }
      
      public function toString() : String
      {
         return StringUtils.substitute("FunctionTrait[name={0}, functionSlotId={1}, method={2}]",traitMultiname,this.functionSlotId,this.functionMethod);
      }
      
      override public function clone() : *
      {
         var clone:FunctionTrait = new FunctionTrait();
         this.populateClone(clone);
         return clone;
      }
      
      override protected function populateClone(annotatable:Annotatable) : void
      {
         super.populateClone(annotatable);
         var functionTrait:FunctionTrait = FunctionTrait(annotatable);
         functionTrait.functionSlotId = this.functionSlotId;
         functionTrait.isStatic = this.isStatic;
      }
   }
}
