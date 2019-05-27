package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.lf64;
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM___ulp_D2A extends Machine
   {
       
      
      public function FSM___ulp_D2A()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:* = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:Number = NaN;
         FSM___ulp_D2A.esp = FSM___ulp_D2A.esp - 4;
         si32(FSM___ulp_D2A.ebp,FSM___ulp_D2A.esp);
         FSM___ulp_D2A.ebp = FSM___ulp_D2A.esp;
         FSM___ulp_D2A.esp = FSM___ulp_D2A.esp - 24;
         _loc1_ = int(li32(FSM___ulp_D2A.ebp + 12));
         _loc1_ = _loc1_ & 2146435072;
         _loc2_ = _loc1_ + -54525952;
         if(_loc2_ >= 1)
         {
            _loc1_ = 0;
            si32(_loc1_,FSM___ulp_D2A.ebp + -8);
            si32(_loc2_,FSM___ulp_D2A.ebp + -4);
            _loc4_ = lf64(FSM___ulp_D2A.ebp + -8);
         }
         else
         {
            _loc1_ = int(54525952 - _loc1_);
            _loc1_ = _loc1_ >> 20;
            if(_loc1_ <= 19)
            {
               _loc2_ = 524288;
               _loc3_ = 0;
               _loc1_ = int(_loc2_ >>> _loc1_);
               si32(_loc3_,FSM___ulp_D2A.ebp + -16);
               si32(_loc1_,FSM___ulp_D2A.ebp + -12);
               _loc4_ = lf64(FSM___ulp_D2A.ebp + -16);
            }
            else
            {
               _loc2_ = _loc1_ + -20;
               if(_loc2_ <= 30)
               {
                  _loc2_ = 1;
                  _loc1_ = int(51 - _loc1_);
                  _loc3_ = 0;
                  _loc1_ = _loc2_ << _loc1_;
                  si32(_loc1_,FSM___ulp_D2A.ebp + -24);
                  si32(_loc3_,FSM___ulp_D2A.ebp + -20);
                  _loc4_ = lf64(FSM___ulp_D2A.ebp + -24);
               }
               else
               {
                  _loc4_ = 4.9e-324;
               }
            }
         }
         FSM___ulp_D2A.st0 = _loc4_;
         FSM___ulp_D2A.esp = FSM___ulp_D2A.ebp;
         FSM___ulp_D2A.ebp = li32(FSM___ulp_D2A.esp);
         FSM___ulp_D2A.esp = FSM___ulp_D2A.esp + 4;
         FSM___ulp_D2A.esp = FSM___ulp_D2A.esp + 4;
      }
   }
}
