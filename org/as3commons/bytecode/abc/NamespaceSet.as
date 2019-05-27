package org.as3commons.bytecode.abc
{
   import org.as3commons.lang.ICloneable;
   import org.as3commons.lang.IEquals;
   import org.as3commons.lang.util.CloneUtils;
   
   public final class NamespaceSet implements ICloneable, IEquals
   {
      
      public static const PUBLIC_NSSET:NamespaceSet = new NamespaceSet([LNamespace.PUBLIC]);
       
      
      private var _namespaces:Array;
      
      public function NamespaceSet(namespaceArray:Array = null)
      {
         super();
         this._namespaces = !!namespaceArray?namespaceArray:[];
      }
      
      public function clone() : *
      {
         var clone:NamespaceSet = new NamespaceSet(CloneUtils.cloneList(this._namespaces));
      }
      
      public function get namespaces() : Array
      {
         return this._namespaces;
      }
      
      public function addNamespace(namespaze:LNamespace) : void
      {
         this._namespaces[this._namespaces.length] = namespaze;
      }
      
      public function equals(other:Object) : Boolean
      {
         var i:int = 0;
         var namespaceSet:NamespaceSet = NamespaceSet(other);
         var matches:* = this.namespaces.length == namespaceSet.namespaces.length;
         if(matches)
         {
            for(i = 0; i < this.namespaces.length; i++)
            {
               if(!this.namespaces[i].equals(namespaceSet.namespaces[i]))
               {
                  matches = false;
                  break;
               }
            }
         }
         return matches;
      }
      
      public function toString() : String
      {
         return "[" + this.namespaces.join(", ") + "]";
      }
   }
}
