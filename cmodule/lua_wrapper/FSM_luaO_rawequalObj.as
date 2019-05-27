package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.lf64;
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_luaO_rawequalObj extends Machine
   {
       
      
      public function FSM_luaO_rawequalObj()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:* = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         FSM_luaO_rawequalObj.esp = FSM_luaO_rawequalObj.esp - 4;
         si32(FSM_luaO_rawequalObj.ebp,FSM_luaO_rawequalObj.esp);
         FSM_luaO_rawequalObj.ebp = FSM_luaO_rawequalObj.esp;
         FSM_luaO_rawequalObj.esp = FSM_luaO_rawequalObj.esp - 0;
         _loc1_ = int(li32(FSM_luaO_rawequalObj.ebp + 8));
         _loc2_ = li32(FSM_luaO_rawequalObj.ebp + 12);
         _loc3_ = li32(_loc1_ + 8);
         _loc4_ = li32(_loc2_ + 8);
         if(_loc3_ != _loc4_)
         {
            _loc1_ = 0;
         }
         else
         {
            if(_loc3_ <= 1)
            {
               if(_loc3_ != 0)
               {
                  if(_loc3_ != 1)
                  {
                  }
                  addr92:
                  _loc1_ = int(li32(_loc1_));
                  _loc2_ = li32(_loc2_);
                  _loc1_ = int(_loc1_ == _loc2_?1:0);
                  addr134:
                  _loc1_ = _loc1_ & 1;
               }
               else
               {
                  _loc1_ = 1;
               }
            }
            else if(_loc3_ != 2)
            {
               if(_loc3_ == 3)
               {
                  _loc5_ = lf64(_loc1_);
                  _loc6_ = lf64(_loc2_);
                  _loc1_ = int(_loc5_ == _loc6_?1:0);
               }
               §§goto(addr134);
            }
            §§goto(addr92);
         }
         FSM_luaO_rawequalObj.eax = _loc1_;
         FSM_luaO_rawequalObj.esp = FSM_luaO_rawequalObj.ebp;
         FSM_luaO_rawequalObj.ebp = li32(FSM_luaO_rawequalObj.esp);
         FSM_luaO_rawequalObj.esp = FSM_luaO_rawequalObj.esp + 4;
         FSM_luaO_rawequalObj.esp = FSM_luaO_rawequalObj.esp + 4;
      }
   }
}
