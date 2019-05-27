package org.as3commons.bytecode.abc
{
   import org.as3commons.bytecode.abc.enum.MultinameKind;
   
   public final class RuntimeQualifiedNameL extends BaseMultiname
   {
       
      
      public function RuntimeQualifiedNameL(kindValue:MultinameKind = null)
      {
         kindValue = !!kindValue?kindValue:MultinameKind.RTQNAME_L;
         super(kindValue);
         assertAppropriateMultinameKind([MultinameKind.RTQNAME_L,MultinameKind.RTQNAME_LA],kindValue);
      }
      
      override public function clone() : *
      {
         return new RuntimeQualifiedNameL(kind);
      }
      
      override public function toString() : String
      {
         return kind.description;
      }
   }
}
