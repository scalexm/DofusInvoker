package org.as3commons.bytecode.emit.asm
{
   import org.as3commons.bytecode.abc.QualifiedName;
   
   public class ClassInfoReference
   {
       
      
      private var _classMultiName:QualifiedName;
      
      public function ClassInfoReference(clsName:QualifiedName)
      {
         super();
         this._classMultiName = clsName;
      }
      
      public function get classMultiName() : QualifiedName
      {
         return this._classMultiName;
      }
   }
}
