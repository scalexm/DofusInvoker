package org.as3commons.bytecode.abc
{
   import org.as3commons.bytecode.abc.enum.ConstantKind;
   import org.as3commons.bytecode.typeinfo.Annotatable;
   import org.as3commons.lang.ICloneable;
   import org.as3commons.lang.StringUtils;
   
   public final class SlotOrConstantTrait extends TraitInfo
   {
       
      
      public var slotId:int;
      
      public var typeMultiname:BaseMultiname;
      
      public var vindex:int = 0;
      
      public var vkind:ConstantKind = null;
      
      public var isStatic:Boolean;
      
      public var defaultValue;
      
      public function SlotOrConstantTrait()
      {
         super();
      }
      
      override public function clone() : *
      {
         var slot:SlotOrConstantTrait = new SlotOrConstantTrait();
         this.populateClone(slot);
      }
      
      override protected function populateClone(annotatable:Annotatable) : void
      {
         super.populateClone(annotatable);
         var slot:SlotOrConstantTrait = SlotOrConstantTrait(annotatable);
         slot.slotId = this.slotId;
         slot.typeMultiname = this.typeMultiname.clone();
         slot.vindex = this.vindex;
         slot.vkind = this.vkind;
         slot.isStatic = this.isStatic;
         slot.defaultValue = this.defaultValue is ICloneable?ICloneable(this.defaultValue).clone():this.defaultValue;
      }
      
      public function toString() : String
      {
         return StringUtils.substitute("SlotOrConstantTrait[name={0}, metadata={1}, kind={2}, slot={3}, typeName={4}, vindex={5}, vkind={6}]",!!traitMultiname?traitMultiname:"",metadata,traitKind.description,this.slotId,this.typeMultiname,this.vindex,!!this.vkind?this.vkind:"");
      }
      
      override public function equals(other:Object) : Boolean
      {
         var otherTrait:SlotOrConstantTrait = null;
         var result:Boolean = super.equals(other);
         if(result)
         {
            otherTrait = other as SlotOrConstantTrait;
            if(otherTrait != null)
            {
               if(this.slotId != otherTrait.slotId)
               {
                  return false;
               }
               if(!this.typeMultiname.equals(otherTrait.typeMultiname))
               {
                  return false;
               }
               if(this.vindex != otherTrait.vindex)
               {
                  return false;
               }
               if(this.vkind !== otherTrait.vkind)
               {
                  return false;
               }
               if(this.isStatic != otherTrait.isStatic)
               {
                  return false;
               }
               if(!isNaN(this.defaultValue))
               {
                  if(this.defaultValue !== otherTrait.defaultValue)
                  {
                     return false;
                  }
               }
               else if(isNaN(this.defaultValue) && isNaN(otherTrait.defaultValue) == false)
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
