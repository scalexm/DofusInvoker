package
{
   import flash.utils.describeType;
   import flash.utils.getDefinitionByName;
   import flash.utils.getQualifiedClassName;
   
   public class Type
   {
       
      
      public function Type()
      {
      }
      
      public static function getClass(param1:Object) : Class
      {
         var _loc2_:String = getQualifiedClassName(param1);
         if(_loc2_ == "null" || _loc2_ == "Object" || _loc2_ == "int" || _loc2_ == "Number" || _loc2_ == "Boolean")
         {
            return null;
         }
         if(param1.hasOwnProperty("prototype"))
         {
            return null;
         }
         var _loc3_:* = getDefinitionByName(_loc2_) as Class;
         if(_loc3_.__isenum)
         {
            return null;
         }
         return _loc3_;
      }
      
      public static function describe(param1:*, param2:Boolean) : Array
      {
         var _loc8_:int = 0;
         var _loc3_:Array = [];
         var _loc4_:XML = describeType(param1);
         if(param2)
         {
            _loc4_ = _loc4_.factory[0];
         }
         var _loc5_:XMLList = _loc4_.child("method");
         var _loc6_:int = 0;
         var _loc7_:int = _loc5_.length();
         while(_loc6_ < _loc7_)
         {
            _loc6_++;
            _loc8_ = _loc6_;
            _loc3_.push(Std.string(_loc5_[_loc8_].attribute("name")));
         }
         var _loc9_:XMLList = _loc4_.child("variable");
         _loc6_ = 0;
         _loc7_ = _loc9_.length();
         while(_loc6_ < _loc7_)
         {
            _loc6_++;
            _loc8_ = _loc6_;
            _loc3_.push(Std.string(_loc9_[_loc8_].attribute("name")));
         }
         var _loc10_:XMLList = _loc4_.child("accessor");
         _loc6_ = 0;
         _loc7_ = _loc10_.length();
         while(_loc6_ < _loc7_)
         {
            _loc6_++;
            _loc8_ = _loc6_;
            _loc3_.push(Std.string(_loc10_[_loc8_].attribute("name")));
         }
         return _loc3_;
      }
      
      public static function getInstanceFields(param1:Class) : Array
      {
         return Type.describe(param1,true);
      }
   }
}
