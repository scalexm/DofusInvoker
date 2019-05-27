package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_luaO_int2fb extends Machine
   {
       
      
      public function FSM_luaO_int2fb()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:* = 0;
         var _loc2_:* = 0;
         FSM_luaO_int2fb.esp = FSM_luaO_int2fb.esp - 4;
         si32(FSM_luaO_int2fb.ebp,FSM_luaO_int2fb.esp);
         FSM_luaO_int2fb.ebp = FSM_luaO_int2fb.esp;
         FSM_luaO_int2fb.esp = FSM_luaO_int2fb.esp - 0;
         _loc1_ = int(li32(FSM_luaO_int2fb.ebp + 8));
         if(uint(_loc1_) <= uint(15))
         {
            _loc2_ = 8;
         }
         else
         {
            _loc2_ = -1;
            while(true)
            {
               _loc1_ = int(_loc1_ + 1);
               _loc2_ = int(_loc2_ + 1);
               _loc1_ = int(_loc1_ >>> 1);
               if(uint(_loc1_) >= uint(16))
               {
                  continue;
               }
               break;
            }
            _loc2_ = _loc2_ << 3;
            _loc2_ = int(_loc2_ + 16);
         }
         if(uint(_loc1_) >= uint(8))
         {
            _loc1_ = int(_loc1_ + -8);
            _loc1_ = _loc2_ | _loc1_;
         }
         FSM_luaO_int2fb.eax = _loc1_;
         FSM_luaO_int2fb.esp = FSM_luaO_int2fb.ebp;
         FSM_luaO_int2fb.ebp = li32(FSM_luaO_int2fb.esp);
         FSM_luaO_int2fb.esp = FSM_luaO_int2fb.esp + 4;
         FSM_luaO_int2fb.esp = FSM_luaO_int2fb.esp + 4;
      }
   }
}
