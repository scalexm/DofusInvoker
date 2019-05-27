package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.lf64;
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.li8;
   import avm2.intrinsics.memory.sf64;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_luaH_getnum extends Machine
   {
       
      
      public function FSM_luaH_getnum()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:* = 0;
         var _loc5_:int = 0;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         FSM_luaH_getnum.esp = FSM_luaH_getnum.esp - 4;
         si32(FSM_luaH_getnum.ebp,FSM_luaH_getnum.esp);
         FSM_luaH_getnum.ebp = FSM_luaH_getnum.esp;
         FSM_luaH_getnum.esp = FSM_luaH_getnum.esp - 8;
         _loc1_ = li32(FSM_luaH_getnum.ebp + 12);
         _loc2_ = li32(FSM_luaH_getnum.ebp + 8);
         _loc3_ = li32(_loc2_ + 28);
         _loc4_ = int(_loc1_ + -1);
         if(uint(_loc4_) < uint(_loc3_))
         {
            _loc1_ = li32(_loc2_ + 12);
            _loc2_ = _loc4_ * 12;
            _loc1_ = _loc1_ + _loc2_;
         }
         else
         {
            _loc6_ = 0;
            _loc7_ = Number(_loc1_);
            sf64(_loc7_,FSM_luaH_getnum.ebp + -8);
            _loc1_ = li32(FSM_luaH_getnum.ebp + -8);
            _loc3_ = li32(FSM_luaH_getnum.ebp + -4);
            if(_loc7_ == _loc6_)
            {
               _loc1_ = li32(_loc2_ + 16);
            }
            else
            {
               _loc4_ = 1;
               _loc5_ = li8(_loc2_ + 7);
               _loc4_ = _loc4_ << _loc5_;
               _loc4_ = int(_loc4_ + -1);
               _loc4_ = _loc4_ | 1;
               _loc1_ = _loc3_ + _loc1_;
               _loc1_ = uint(_loc1_) % uint(_loc4_);
               _loc2_ = li32(_loc2_ + 16);
               _loc1_ = _loc1_ * 28;
               _loc1_ = _loc2_ + _loc1_;
            }
            while(true)
            {
               _loc2_ = li32(_loc1_ + 20);
               if(_loc2_ == 3)
               {
                  _loc6_ = lf64(_loc1_ + 12);
                  if(_loc6_ == _loc7_)
                  {
                  }
               }
               _loc1_ = li32(_loc1_ + 24);
               if(_loc1_ != 0)
               {
                  continue;
               }
               break;
            }
            _loc1_ = FSM_luaH_getnum;
         }
         FSM_luaH_getnum.eax = _loc1_;
         FSM_luaH_getnum.esp = FSM_luaH_getnum.ebp;
         FSM_luaH_getnum.ebp = li32(FSM_luaH_getnum.esp);
         FSM_luaH_getnum.esp = FSM_luaH_getnum.esp + 4;
         FSM_luaH_getnum.esp = FSM_luaH_getnum.esp + 4;
      }
   }
}
