package org.as3commons.bytecode.abc
{
   import org.as3commons.bytecode.typeinfo.Annotatable;
   import org.as3commons.lang.StringUtils;
   
   public final class ClassTrait extends TraitInfo
   {
       
      
      public var classSlotId:int;
      
      public var classIndex:int;
      
      public var classInfo:ClassInfo;
      
      public function ClassTrait()
      {
         super();
      }
      
      public function toString() : String
      {
         return StringUtils.substitute("ClassTrait[name={0}, classSlotId={1}, classIndex={2}, metadata={3}]",traitMultiname,this.classSlotId,this.classIndex,metadata);
      }
      
      override public function clone() : *
      {
         var clone:ClassTrait = new ClassTrait();
         this.populateClone(clone);
         return clone;
      }
      
      override protected function populateClone(annotatable:Annotatable) : void
      {
         super.populateClone(annotatable);
         ClassTrait(annotatable).classSlotId = this.classSlotId;
         ClassTrait(annotatable).classIndex = this.classIndex;
      }
   }
}
