package org.as3commons.bytecode.abc
{
   import org.as3commons.bytecode.abc.enum.MultinameKind;
   import org.as3commons.lang.StringUtils;
   
   public final class Multiname extends NamedMultiname
   {
       
      
      private var _namespaceSet:NamespaceSet;
      
      public function Multiname(multiname:String, namespaceSet:NamespaceSet, kind:MultinameKind = null)
      {
         kind = !!kind?kind:MultinameKind.MULTINAME;
         super(kind,multiname);
         assertAppropriateMultinameKind([MultinameKind.MULTINAME,MultinameKind.MULTINAME_A],kind);
         this._namespaceSet = namespaceSet;
      }
      
      public function get namespaceSet() : NamespaceSet
      {
         return this._namespaceSet;
      }
      
      override public function equals(other:Object) : Boolean
      {
         var cMultiname:Multiname = null;
         var matches:Boolean = false;
         if(other is Multiname)
         {
            cMultiname = Multiname(other);
            if(cMultiname.namespaceSet)
            {
               if(cMultiname.namespaceSet.equals(this.namespaceSet))
               {
                  if(super.equals(other))
                  {
                     matches = true;
                  }
               }
            }
         }
         return matches;
      }
      
      override public function toString() : String
      {
         return StringUtils.substitute("{0}[name={1}, nsset={2}]",kind.description,name,this.namespaceSet);
      }
   }
}
