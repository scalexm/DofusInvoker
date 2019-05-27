package org.as3commons.bytecode.abc.enum
{
   public final class TraitAttributes
   {
      
      private static var _enumCreated:Boolean = false;
      
      private static const _TYPES:Array = [];
      
      public static const FINAL:TraitAttributes = new TraitAttributes(1,"final");
      
      public static const OVERRIDE:TraitAttributes = new TraitAttributes(2,"override");
      
      public static const METADATA:TraitAttributes = new TraitAttributes(4,"metadata");
      
      {
         _enumCreated = true;
      }
      
      private var _bitMask:uint;
      
      private var _description:String;
      
      public function TraitAttributes(bitMaskValue:uint, descriptionValue:String)
      {
         super();
         this._bitMask = bitMaskValue;
         this._description = descriptionValue;
         _TYPES[_TYPES.length] = this;
      }
      
      public static function determineAttributes(traitAttributeValue:int) : TraitAttributes
      {
         var matchingAttributes:TraitAttributes = null;
         var attributes:TraitAttributes = null;
         for each(attributes in _TYPES)
         {
            if(attributes.bitMask << 4 & traitAttributeValue)
            {
               matchingAttributes = attributes;
               break;
            }
         }
         return matchingAttributes;
      }
      
      public function get bitMask() : uint
      {
         return this._bitMask;
      }
      
      public function get description() : String
      {
         return this._description;
      }
   }
}
