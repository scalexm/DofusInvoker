package com.ankama.codegen.client.api
{
   public class StringUtil
   {
       
      
      public function StringUtil()
      {
         super();
      }
      
      public static function containsIgnoreCase(array:Array, value:String) : Boolean
      {
         var str:String = null;
         for each(str in array)
         {
            if(value == null && str == null)
            {
               return true;
            }
            if(value != null && value.toLowerCase() == str.toLowerCase())
            {
               return true;
            }
         }
         return false;
      }
      
      public static function join(array:Array, separator:String) : String
      {
         var out:String = null;
         var str:String = null;
         var len:int = array.length;
         if(len == 0)
         {
            return "";
         }
         out = array[0];
         for each(str in array)
         {
            out.concat(separator,str);
         }
         return out;
      }
   }
}
