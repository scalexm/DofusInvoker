package
{
   public class Reflect
   {
       
      
      public function Reflect()
      {
      }
      
      public static function field(param1:*, param2:String) : *
      {
         try
         {
            return param1[param2];
         }
         catch(_loc4_:*)
         {
            return null;
         }
      }
      
      public static function fields(param1:*) : Array
      {
         var _loc4_:* = null as String;
         if(param1 == null)
         {
            return [];
         }
         var _loc2_:int = 0;
         var _loc3_:Array = [];
         for(_loc4_ in param1)
         {
            if(param1.hasOwnProperty(_loc4_))
            {
               _loc3_.push(_loc4_);
            }
         }
         return _loc3_;
      }
      
      public static function isFunction(param1:*) : Boolean
      {
         return typeof param1 == "function";
      }
   }
}
