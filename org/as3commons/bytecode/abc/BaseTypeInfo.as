package org.as3commons.bytecode.abc
{
   import org.as3commons.bytecode.abc.enum.TraitKind;
   import org.as3commons.lang.IEquals;
   
   public class BaseTypeInfo implements IEquals
   {
       
      
      public var traits:Vector.<TraitInfo>;
      
      public function BaseTypeInfo()
      {
         super();
         this.traits = new Vector.<TraitInfo>();
      }
      
      public function addTrait(trait:TraitInfo) : void
      {
         if(this.traits.indexOf(trait) < 0)
         {
            this.traits[this.traits.length] = trait;
         }
      }
      
      public function removeTrait(trait:TraitInfo) : void
      {
         var idx:int = this.traits.indexOf(trait);
         if(idx > -1)
         {
            this.traits.splice(idx,1);
         }
      }
      
      public function getSlotTraitByName(name:String) : SlotOrConstantTrait
      {
         var slot:SlotOrConstantTrait = null;
         var slots:Array = this.slotOrConstantTraits;
         for each(slot in slots)
         {
            if(slot.traitMultiname.name == name)
            {
               return slot;
            }
         }
         return null;
      }
      
      public function getMethodTraitByName(name:String) : MethodTrait
      {
         var method:MethodTrait = null;
         var methods:Vector.<TraitInfo> = this.methodTraits;
         for each(method in methods)
         {
            if(method.traitMultiname.name == name)
            {
               return method;
            }
         }
         return null;
      }
      
      public function removeMethodTrait(trait:MethodTrait) : void
      {
         var idx:int = this.traits.indexOf(trait);
         if(idx > -1)
         {
            this.traits.splice(idx,1);
         }
      }
      
      public function get slotOrConstantTraits() : Array
      {
         var trait:TraitInfo = null;
         var matchingTraits:Array = [];
         for each(trait in this.traits)
         {
            if(trait is SlotOrConstantTrait)
            {
               matchingTraits[matchingTraits.length] = trait;
            }
         }
         return matchingTraits;
      }
      
      public function getTraitsByKind(traitKind:TraitKind) : Vector.<TraitInfo>
      {
         return this.traits.filter(function(trait:TraitInfo, index:int, array:Vector.<TraitInfo>):Boolean
         {
            return trait.traitKind === traitKind;
         });
      }
      
      public function get methodTraits() : Vector.<TraitInfo>
      {
         return this.getTraitsByKind(TraitKind.METHOD);
      }
      
      public function get methodInfo() : Vector.<MethodInfo>
      {
         var trait:MethodTrait = null;
         var traits:Vector.<TraitInfo> = this.methodTraits.concat(this.getterTraits).concat(this.setterTraits);
         var result:Vector.<MethodInfo> = new Vector.<MethodInfo>();
         for each(trait in traits)
         {
            result[result.length] = trait.traitMethod;
         }
         return result;
      }
      
      public function get getterTraits() : Vector.<TraitInfo>
      {
         return this.getTraitsByKind(TraitKind.GETTER);
      }
      
      public function get setterTraits() : Vector.<TraitInfo>
      {
         return this.getTraitsByKind(TraitKind.SETTER);
      }
      
      public function equals(other:Object) : Boolean
      {
         var len:int = 0;
         var i:int = 0;
         var trait:TraitInfo = null;
         var otherTrait:TraitInfo = null;
         var otherTypeInfo:BaseTypeInfo = other as BaseTypeInfo;
         if(otherTypeInfo != null)
         {
            if(this.traits.length != otherTypeInfo.traits.length)
            {
               return false;
            }
            len = this.traits.length;
            for(i = 0; i < len; i++)
            {
               trait = this.traits[i];
               otherTrait = otherTypeInfo.traits[i];
               if(!trait.equals(otherTrait))
               {
                  return false;
               }
            }
            return true;
         }
         return false;
      }
   }
}
