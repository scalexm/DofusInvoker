package org.as3commons.bytecode.abc
{
   import org.as3commons.bytecode.abc.enum.MultinameKind;
   
   public class NamedMultiname extends BaseMultiname
   {
       
      
      private var _name:String;
      
      public function NamedMultiname(kindValue:MultinameKind, name:String)
      {
         super(kindValue);
         this._name = name;
      }
      
      override public function clone() : *
      {
         return new NamedMultiname(this.kind,this._name);
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set name(value:String) : void
      {
         this._name = value;
      }
      
      override public function equals(other:Object) : Boolean
      {
         var matches:Boolean = false;
         if(other is NamedMultiname)
         {
            if(NamedMultiname(other).name == this._name)
            {
               if(super.equals(other))
               {
                  matches = true;
               }
            }
         }
         return matches;
      }
   }
}
