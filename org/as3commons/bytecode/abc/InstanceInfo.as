package org.as3commons.bytecode.abc
{
   import org.as3commons.lang.StringUtils;
   
   public final class InstanceInfo extends BaseTypeInfo
   {
       
      
      public var classInfo:ClassInfo;
      
      public var classMultiname:QualifiedName;
      
      public var superclassMultiname:BaseMultiname;
      
      public var protectedNamespace:LNamespace;
      
      public var interfaceMultinames:Vector.<BaseMultiname>;
      
      public var instanceInitializer:MethodInfo;
      
      public var isProtected:Boolean;
      
      public var isFinal:Boolean;
      
      public var isSealed:Boolean;
      
      public var isInterface:Boolean;
      
      public function InstanceInfo()
      {
         super();
         this.interfaceMultinames = new Vector.<BaseMultiname>();
      }
      
      public function get constructor() : MethodInfo
      {
         return this.instanceInitializer;
      }
      
      public function get interfaceCount() : int
      {
         return this.interfaceMultinames.length;
      }
      
      public function toString() : String
      {
         return StringUtils.substitute("InstanceInfo[\n\tclassName={0}\n\tsuperclassName={1}\n\tisProtected={2}\n\tprotectedNamespace={3}\n\tinterfaceCount={4}\n\tinterfaces={5}\n\tinstanceInitializer={6}\n\ttraits=[\n\t\t{7}\n\t]\n]",this.classMultiname,this.superclassMultiname,this.isProtected,this.protectedNamespace,this.interfaceCount,this.interfaceMultinames,this.instanceInitializer,traits.join("\n\t\t"));
      }
      
      override public function equals(other:Object) : Boolean
      {
         var otherInstanceInfo:InstanceInfo = null;
         var len:int = 0;
         var i:int = 0;
         var multiName:BaseMultiname = null;
         var otherMultiName:BaseMultiname = null;
         var result:Boolean = super.equals(other);
         if(result)
         {
            otherInstanceInfo = other as InstanceInfo;
            if(otherInstanceInfo != null)
            {
               if(!this.classMultiname.equals(otherInstanceInfo.classMultiname))
               {
                  return false;
               }
               if(!this.superclassMultiname.equals(otherInstanceInfo.superclassMultiname))
               {
                  return false;
               }
               if(this.protectedNamespace != null)
               {
                  if(!this.protectedNamespace.equals(otherInstanceInfo.protectedNamespace))
                  {
                     return false;
                  }
               }
               if(this.interfaceCount != otherInstanceInfo.interfaceCount)
               {
                  return false;
               }
               len = this.interfaceCount;
               for(i = 0; i < len; i++)
               {
                  multiName = this.interfaceMultinames[i];
                  otherMultiName = otherInstanceInfo.interfaceMultinames[i];
                  if(!multiName.equals(otherMultiName))
                  {
                     return false;
                  }
               }
               if(!this.instanceInitializer.equals(otherInstanceInfo.instanceInitializer))
               {
                  return false;
               }
               if(this.isProtected != otherInstanceInfo.isProtected)
               {
                  return false;
               }
               if(this.isFinal != otherInstanceInfo.isFinal)
               {
                  return false;
               }
               if(this.isSealed != otherInstanceInfo.isSealed)
               {
                  return false;
               }
               if(this.isInterface != otherInstanceInfo.isInterface)
               {
                  return false;
               }
            }
            else
            {
               return false;
            }
         }
         return result;
      }
   }
}
