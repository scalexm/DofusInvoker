package org.as3commons.bytecode.abc
{
   import org.as3commons.bytecode.abc.enum.NamespaceKind;
   import org.as3commons.bytecode.as3commons_bytecode;
   import org.as3commons.lang.ICloneable;
   import org.as3commons.lang.IEquals;
   
   use namespace as3commons_bytecode;
   
   public final class LNamespace implements ICloneable, IEquals
   {
      
      public static const PUBLIC:LNamespace = new LNamespace(NamespaceKind.PACKAGE_NAMESPACE,"");
      
      public static const ASTERISK:LNamespace = new LNamespace(NamespaceKind.NAMESPACE,"*");
      
      public static const FLASH_UTILS:LNamespace = new LNamespace(NamespaceKind.PACKAGE_NAMESPACE,"flash.utils");
      
      public static const BUILTIN:LNamespace = new LNamespace(NamespaceKind.NAMESPACE,"http://adobe.com/AS3/2006/builtin");
      
      as3commons_bytecode static var semanticEquality:Boolean = false;
       
      
      public var kind:NamespaceKind;
      
      public var name:String;
      
      public function LNamespace(kindValue:NamespaceKind, nameValue:String)
      {
         super();
         this.kind = kindValue;
         this.name = nameValue;
      }
      
      public function clone() : *
      {
         return new LNamespace(this.kind,this.name);
      }
      
      public function equals(other:Object) : Boolean
      {
         var namespacesMatch:* = false;
         var namespaze:LNamespace = LNamespace(other);
         var thisNamespaceIsPrivate:* = this.kind == NamespaceKind.PRIVATE_NAMESPACE;
         var comparingNamespaceIsPrivate:* = namespaze.kind == NamespaceKind.PRIVATE_NAMESPACE;
         if(thisNamespaceIsPrivate && comparingNamespaceIsPrivate && !as3commons_bytecode::semanticEquality)
         {
            namespacesMatch = namespaze == this;
         }
         else
         {
            namespacesMatch = Boolean(this.kind == namespaze.kind && this.name == namespaze.name);
         }
         return namespacesMatch;
      }
      
      public function toString() : String
      {
         var string:* = "Namespace[" + this.kind.description;
         string = string + (this.name != ""?"::":"");
         string = string + this.name;
         string = string + "]";
         return string;
      }
   }
}
