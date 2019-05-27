package org.as3commons.bytecode.abc
{
   import org.as3commons.bytecode.abc.enum.MultinameKind;
   import org.as3commons.lang.StringUtils;
   
   public class MultinameL extends BaseMultiname
   {
       
      
      private var _namespaceSet:NamespaceSet;
      
      public function MultinameL(namespaceSet:NamespaceSet, kindValue:MultinameKind = null)
      {
         kindValue = !!kindValue?kindValue:MultinameKind.MULTINAME_L;
         super(kindValue);
         this.initMultinameL(kindValue,namespaceSet);
      }
      
      protected function initMultinameL(kindValue:MultinameKind, namespaceSet:NamespaceSet) : void
      {
         assertAppropriateMultinameKind([MultinameKind.MULTINAME_L,MultinameKind.MULTINAME_LA],kindValue);
         this._namespaceSet = namespaceSet;
      }
      
      override public function clone() : *
      {
         return new MultinameL(this._namespaceSet,this.kind);
      }
      
      public function get namespaceSet() : NamespaceSet
      {
         return this._namespaceSet;
      }
      
      override public function equals(other:Object) : Boolean
      {
         var matches:Boolean = false;
         if(other is MultinameL)
         {
            if(MultinameL(other).namespaceSet.equals(this.namespaceSet))
            {
               if(super.equals(other))
               {
                  matches = true;
               }
            }
         }
         return matches;
      }
      
      override public function toString() : String
      {
         return StringUtils.substitute("{0}[nsset={1}]",kind.description,this.namespaceSet);
      }
   }
}
