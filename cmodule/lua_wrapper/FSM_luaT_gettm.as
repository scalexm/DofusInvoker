package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.li8;
   import avm2.intrinsics.memory.si32;
   import avm2.intrinsics.memory.si8;
   
   public final class FSM_luaT_gettm extends Machine
   {
       
      
      public function FSM_luaT_gettm()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:* = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         FSM_luaT_gettm.esp = FSM_luaT_gettm.esp - 4;
         si32(FSM_luaT_gettm.ebp,FSM_luaT_gettm.esp);
         FSM_luaT_gettm.ebp = FSM_luaT_gettm.esp;
         FSM_luaT_gettm.esp = FSM_luaT_gettm.esp - 0;
         _loc1_ = 1;
         _loc2_ = li32(FSM_luaT_gettm.ebp + 8);
         _loc3_ = li8(_loc2_ + 7);
         _loc1_ = _loc1_ << _loc3_;
         _loc3_ = li32(FSM_luaT_gettm.ebp + 16);
         _loc4_ = li32(_loc3_ + 8);
         _loc1_ = int(_loc1_ + -1);
         _loc1_ = _loc1_ & _loc4_;
         _loc4_ = li32(_loc2_ + 16);
         _loc1_ = int(_loc1_ * 28);
         _loc5_ = li32(FSM_luaT_gettm.ebp + 12);
         _loc1_ = int(_loc4_ + _loc1_);
         while(true)
         {
            _loc4_ = li32(_loc1_ + 20);
            if(_loc4_ == 4)
            {
               _loc4_ = li32(_loc1_ + 12);
               if(_loc4_ == _loc3_)
               {
                  addr149:
                  _loc3_ = li32(_loc1_ + 8);
                  if(_loc3_ == 0)
                  {
                     _loc1_ = 1;
                     _loc3_ = li8(_loc2_ + 6);
                     _loc1_ = _loc1_ << _loc5_;
                     _loc1_ = _loc3_ | _loc1_;
                     si8(_loc1_,_loc2_ + 6);
                     _loc1_ = 0;
                  }
                  FSM_luaT_gettm.eax = _loc1_;
                  FSM_luaT_gettm.esp = FSM_luaT_gettm.ebp;
                  FSM_luaT_gettm.ebp = li32(FSM_luaT_gettm.esp);
                  FSM_luaT_gettm.esp = FSM_luaT_gettm.esp + 4;
                  FSM_luaT_gettm.esp = FSM_luaT_gettm.esp + 4;
                  return;
               }
            }
            _loc1_ = int(li32(_loc1_ + 24));
            if(_loc1_ != 0)
            {
               continue;
            }
            break;
         }
         _loc1_ = int(FSM_luaT_gettm);
         §§goto(addr149);
      }
   }
}
