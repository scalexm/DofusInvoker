package org.as3commons.bytecode.abc
{
   import org.as3commons.bytecode.typeinfo.Metadata;
   import org.as3commons.lang.StringUtils;
   
   public final class ClassInfo extends BaseTypeInfo
   {
       
      
      public var staticInitializer:MethodInfo;
      
      public var classMultiname:QualifiedName;
      
      public var metadata:Vector.<Metadata>;
      
      public function ClassInfo()
      {
         super();
      }
      
      public function toString() : String
      {
         return StringUtils.substitute("ClassInfo[\n\tstaticInitializer={0}\n\ttraits=[\n\t\t{1}\n\t]\n]",this.staticInitializer,traits.join("\n\t\t"));
      }
      
      override public function equals(other:Object) : Boolean
      {
         var otherClassInfo:ClassInfo = null;
         var len:int = 0;
         var i:int = 0;
         var md:Metadata = null;
         var otherMd:Metadata = null;
         var result:Boolean = super.equals(other);
         if(result)
         {
            otherClassInfo = other as ClassInfo;
            if(otherClassInfo != null)
            {
               if(!this.staticInitializer.equals(otherClassInfo.staticInitializer))
               {
                  return false;
               }
               if(!this.classMultiname.equals(otherClassInfo.classMultiname))
               {
                  return false;
               }
               if(this.metadata != null)
               {
                  if(this.metadata.length != otherClassInfo.metadata.length)
                  {
                     return false;
                  }
                  len = this.metadata.length;
                  for(i = 0; i < len; i++)
                  {
                     md = this.metadata[i];
                     otherMd = otherClassInfo.metadata[i];
                     if(!md.equals(otherMd))
                     {
                        return false;
                     }
                  }
               }
               return true;
            }
            return false;
         }
         return result;
      }
   }
}
