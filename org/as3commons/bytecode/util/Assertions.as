package org.as3commons.bytecode.util
{
   import org.as3commons.bytecode.abc.LNamespace;
   import org.as3commons.bytecode.abc.enum.NamespaceKind;
   
   public final class Assertions
   {
       
      
      public function Assertions()
      {
         super();
      }
      
      public static function assertArrayContentsEqual(a:*, b:*) : Boolean
      {
         return assertArrayOrVectorContentsEqual(a,b);
      }
      
      public static function assertVectorContentsEqual(a:*, b:*) : Boolean
      {
         return assertArrayOrVectorContentsEqual(a,b);
      }
      
      private static function assertArrayOrVectorContentsEqual(firstArray:*, secondArray:*) : Boolean
      {
         if(firstArray.length != secondArray.length)
         {
            throw new Error("Array lengths (" + firstArray.length + "," + secondArray.length + ") do not match");
         }
         var contentsMatch:Boolean = firstArray.every(function(item:Object, index:int, array:Array):Boolean
         {
            var current:* = undefined;
            var matchFound:* = false;
            for each(current in secondArray)
            {
               if(current.hasOwnProperty("equals"))
               {
                  if(current.equals(item))
                  {
                     matchFound = true;
                     break;
                  }
                  if(current is LNamespace)
                  {
                     if(LNamespace(current).kind == NamespaceKind.PRIVATE_NAMESPACE)
                     {
                        if(LNamespace(current).name == item.name)
                        {
                           matchFound = true;
                           break;
                        }
                     }
                  }
               }
               else if(current == item)
               {
                  matchFound = true;
                  break;
               }
            }
            return matchFound;
         });
         if(!contentsMatch)
         {
            throw new Error("Array contents to do not match.");
         }
         return true;
      }
   }
}
