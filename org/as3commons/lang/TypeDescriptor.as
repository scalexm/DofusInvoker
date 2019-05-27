package org.as3commons.lang
{
   import org.as3commons.lang.typedescription.JSONTypeDescription;
   import org.as3commons.lang.typedescription.XMLTypeDescription;
   
   public class TypeDescriptor
   {
      
      public static var typeDescriptionKind:TypeDescriptionKind = TypeDescriptionKind.JSON;
       
      
      public function TypeDescriptor()
      {
         super();
      }
      
      public static function getTypeDescriptionForClass(clazz:Class) : ITypeDescription
      {
         var result:ITypeDescription = null;
         if(typeDescriptionKind == TypeDescriptionKind.JSON)
         {
            try
            {
               result = new JSONTypeDescription(clazz);
            }
            catch(e:*)
            {
            }
         }
         if(!result)
         {
            result = new XMLTypeDescription(clazz);
         }
         return result;
      }
   }
}
