package org.as3commons.bytecode.abc
{
   import org.as3commons.bytecode.abc.enum.MultinameKind;
   import org.as3commons.lang.StringUtils;
   
   public class QualifiedName extends NamedMultiname
   {
      
      private static const ASTERISK:String = "*";
       
      
      private var _namespace:LNamespace;
      
      public function QualifiedName(name:String, nameSpace:LNamespace, kindValue:MultinameKind = null)
      {
         kindValue = !!kindValue?kindValue:MultinameKind.QNAME;
         super(kindValue,name);
         this.initQualifiedName(nameSpace,kindValue);
      }
      
      protected function initQualifiedName(nameSpace:LNamespace, kindValue:MultinameKind) : void
      {
         this._namespace = nameSpace;
         if(assertAppropriateMultinameKind([MultinameKind.QNAME,MultinameKind.QNAME_A],kindValue))
         {
            throw new Error("Invalid multiname kind: " + kindValue);
         }
      }
      
      public function get nameSpace() : LNamespace
      {
         return this._namespace;
      }
      
      public function set nameSpace(value:LNamespace) : void
      {
         this._namespace = value;
      }
      
      public function get fullName() : String
      {
         if(this.name != ASTERISK)
         {
            if(StringUtils.hasText(this._namespace.name))
            {
               return StringUtils.substitute("{0}.{1}",this._namespace.name,this.name);
            }
            return this.name;
         }
         return ASTERISK;
      }
      
      override public function toString() : String
      {
         return StringUtils.substitute("{0}[{1}:{2}]",kind.description,this.nameSpace,name);
      }
      
      override public function equals(other:Object) : Boolean
      {
         var matches:Boolean = false;
         if(other is QualifiedName)
         {
            if(this._namespace.equals(QualifiedName(other).nameSpace))
            {
               if(NamedMultiname(other).name == this.name)
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
      
      override public function clone() : *
      {
         return new QualifiedName(this.name,this._namespace.clone(),this.kind);
      }
   }
}
