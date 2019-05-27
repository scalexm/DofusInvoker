package org.as3commons.bytecode.abc.enum
{
   import org.as3commons.bytecode.abc.LNamespace;
   import org.as3commons.bytecode.abc.QualifiedName;
   
   public final class BuiltIns
   {
      
      public static const VOID:QualifiedName = new QualifiedName("void",LNamespace.PUBLIC);
      
      public static const BOOLEAN:QualifiedName = new QualifiedName("Boolean",LNamespace.PUBLIC);
      
      public static const STRING:QualifiedName = new QualifiedName("String",LNamespace.PUBLIC);
      
      public static const FUNCTION:QualifiedName = new QualifiedName("Function",LNamespace.PUBLIC);
      
      public static const NUMBER:QualifiedName = new QualifiedName("Number",LNamespace.PUBLIC);
      
      public static const ANY:QualifiedName = new QualifiedName("*",LNamespace.ASTERISK);
      
      public static const OBJECT:QualifiedName = new QualifiedName("Object",LNamespace.PUBLIC);
      
      public static const DICTIONARY:QualifiedName = new QualifiedName("Dictionary",LNamespace.FLASH_UTILS);
       
      
      public function BuiltIns()
      {
         super();
      }
   }
}
