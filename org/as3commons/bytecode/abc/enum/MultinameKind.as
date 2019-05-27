package org.as3commons.bytecode.abc.enum
{
   import flash.utils.Dictionary;
   import org.as3commons.lang.StringUtils;
   
   public final class MultinameKind
   {
      
      private static var _enumCreated:Boolean = false;
      
      private static const _TYPES:Dictionary = new Dictionary();
      
      public static const QNAME:MultinameKind = new MultinameKind(7,"QName");
      
      public static const QNAME_A:MultinameKind = new MultinameKind(13,"QName_A");
      
      public static const RTQNAME:MultinameKind = new MultinameKind(15,"RTQName");
      
      public static const RTQNAME_A:MultinameKind = new MultinameKind(16,"RTQName_A");
      
      public static const RTQNAME_L:MultinameKind = new MultinameKind(17,"RTQName_L");
      
      public static const RTQNAME_LA:MultinameKind = new MultinameKind(18,"RTQName_LA");
      
      public static const MULTINAME:MultinameKind = new MultinameKind(9,"Multiname");
      
      public static const MULTINAME_A:MultinameKind = new MultinameKind(14,"Multiname_A");
      
      public static const MULTINAME_L:MultinameKind = new MultinameKind(27,"Multiname_L");
      
      public static const MULTINAME_LA:MultinameKind = new MultinameKind(28,"Multiname_LA");
      
      public static const GENERIC:MultinameKind = new MultinameKind(29,"Generic");
      
      {
         _enumCreated = true;
      }
      
      private var _byteValue:int;
      
      private var _description:String;
      
      public function MultinameKind(byteValue:int, descriptionValue:String)
      {
         super();
         this._byteValue = byteValue;
         this._description = descriptionValue;
         _TYPES[this._byteValue] = this;
      }
      
      public static function determineKind(kind:int) : MultinameKind
      {
         var result:MultinameKind = _TYPES[kind];
         if(result)
         {
            return result;
         }
         throw new Error("No match for MultinameKind: " + kind);
      }
      
      public function get byteValue() : int
      {
         return this._byteValue;
      }
      
      public function get description() : String
      {
         return this._description;
      }
      
      public function toString() : String
      {
         return StringUtils.substitute("MultinameKind[description={0}]",this._description);
      }
   }
}
