package org.as3commons.bytecode.abc
{
   import org.as3commons.bytecode.abc.enum.TraitKind;
   import org.as3commons.lang.StringUtils;
   
   public final class MethodTrait extends TraitInfo
   {
       
      
      public var dispositionId:int = 0;
      
      public var traitMethod:MethodInfo;
      
      public var isStatic:Boolean;
      
      public function MethodTrait()
      {
         super();
      }
      
      public function get isGetter() : Boolean
      {
         return traitKind == TraitKind.GETTER;
      }
      
      public function get isSetter() : Boolean
      {
         return traitKind == TraitKind.SETTER;
      }
      
      public function toString() : String
      {
         return StringUtils.substitute("MethodTrait[name={0}, override={1}, metadata={2}, dispositionId={3}, method={4}]",traitMultiname,isOverride,metadata,this.dispositionId,this.traitMethod);
      }
      
      override public function equals(other:Object) : Boolean
      {
         var otherTrait:MethodTrait = null;
         var result:Boolean = super.equals(other);
         if(result)
         {
            otherTrait = other as MethodTrait;
            if(otherTrait != null)
            {
               if(this.dispositionId != otherTrait.dispositionId)
               {
                  return false;
               }
               if(!this.traitMethod.equals(otherTrait.traitMethod))
               {
                  return false;
               }
               if(this.isStatic != otherTrait.isStatic)
               {
                  return false;
               }
               return true;
            }
            return false;
         }
         return result;
      }
   }
}
