package com.ankamagames.jerakine.utils.misc
{
   public class CopyObject
   {
       
      
      public function CopyObject()
      {
         super();
      }
      
      public static function copyObject(o:Object, exclude:Array = null, output:Object = null) : Object
      {
         var p:String = null;
         if(!output)
         {
            var output:Object = new Object();
         }
         var properties:Vector.<String> = DescribeTypeCache.getVariables(o,false,true,false,false,false);
         for each(p in properties)
         {
            if(!(exclude && exclude.indexOf(p) != -1 || p == "prototype"))
            {
               try
               {
                  output[p] = o[p];
               }
               catch(e:SecurityError)
               {
                  continue;
               }
            }
         }
         return output;
      }
   }
}
