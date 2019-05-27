package org.as3commons.bytecode.abc
{
   import org.as3commons.bytecode.abc.enum.MultinameKind;
   import org.as3commons.lang.StringUtils;
   
   public final class RuntimeQualifiedName extends NamedMultiname
   {
       
      
      public function RuntimeQualifiedName(name:String, kindValue:MultinameKind = null)
      {
         kindValue = !!kindValue?kindValue:MultinameKind.RTQNAME;
         super(kindValue,name);
         assertAppropriateMultinameKind([MultinameKind.RTQNAME,MultinameKind.RTQNAME_A],kindValue);
      }
      
      override public function clone() : *
      {
         return new RuntimeQualifiedName(name,kind);
      }
      
      override public function toString() : String
      {
         return StringUtils.substitute("{0}[name={1}]",kind.description,name);
      }
   }
}
