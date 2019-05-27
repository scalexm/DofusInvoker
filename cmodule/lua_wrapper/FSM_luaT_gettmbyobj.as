package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.li8;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_luaT_gettmbyobj extends Machine
   {
       
      
      public function FSM_luaT_gettmbyobj()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:int = 0;
         var _loc2_:* = 0;
         var _loc3_:int = 0;
         var _loc4_:* = 0;
         var _loc5_:int = 0;
         FSM_luaT_gettmbyobj.esp = FSM_luaT_gettmbyobj.esp - 4;
         si32(FSM_luaT_gettmbyobj.ebp,FSM_luaT_gettmbyobj.esp);
         FSM_luaT_gettmbyobj.ebp = FSM_luaT_gettmbyobj.esp;
         FSM_luaT_gettmbyobj.esp = FSM_luaT_gettmbyobj.esp - 0;
         _loc1_ = li32(FSM_luaT_gettmbyobj.ebp + 12);
         _loc2_ = int(li32(_loc1_ + 8));
         _loc3_ = li32(FSM_luaT_gettmbyobj.ebp + 8);
         _loc4_ = int(li32(FSM_luaT_gettmbyobj.ebp + 16));
         if(_loc2_ != 7)
         {
            if(_loc2_ == 5)
            {
               _loc1_ = li32(_loc1_);
               _loc1_ = li32(_loc1_ + 8);
               if(_loc1_ != 0)
               {
                  addr136:
                  _loc2_ = 1;
                  _loc3_ = li32(_loc3_ + 16);
                  _loc4_ = _loc4_ << 2;
                  _loc5_ = li8(_loc1_ + 7);
                  _loc3_ = _loc3_ + _loc4_;
                  _loc2_ = _loc2_ << _loc5_;
                  _loc3_ = li32(_loc3_ + 168);
                  _loc4_ = int(li32(_loc3_ + 8));
                  _loc2_ = int(_loc2_ + -1);
                  _loc2_ = _loc2_ & _loc4_;
                  _loc1_ = li32(_loc1_ + 16);
                  _loc2_ = int(_loc2_ * 28);
                  _loc1_ = _loc1_ + _loc2_;
                  while(true)
                  {
                     _loc2_ = int(li32(_loc1_ + 20));
                     if(_loc2_ == 4)
                     {
                        _loc2_ = int(li32(_loc1_ + 12));
                        if(_loc2_ == _loc3_)
                        {
                           addr226:
                           FSM_luaT_gettmbyobj.eax = _loc1_;
                           FSM_luaT_gettmbyobj.esp = FSM_luaT_gettmbyobj.ebp;
                           FSM_luaT_gettmbyobj.ebp = li32(FSM_luaT_gettmbyobj.esp);
                           FSM_luaT_gettmbyobj.esp = FSM_luaT_gettmbyobj.esp + 4;
                           FSM_luaT_gettmbyobj.esp = FSM_luaT_gettmbyobj.esp + 4;
                           return;
                        }
                     }
                     _loc1_ = li32(_loc1_ + 24);
                     if(_loc1_ != 0)
                     {
                        continue;
                     }
                     break;
                  }
               }
            }
            else
            {
               _loc1_ = li32(_loc3_ + 16);
               _loc2_ = _loc2_ << 2;
               _loc1_ = _loc1_ + _loc2_;
               _loc1_ = li32(_loc1_ + 132);
               if(_loc1_ != 0)
               {
                  §§goto(addr136);
               }
            }
         }
         else
         {
            _loc1_ = li32(_loc1_);
            _loc1_ = li32(_loc1_ + 8);
            if(_loc1_ != 0)
            {
               §§goto(addr136);
            }
         }
         _loc1_ = FSM_luaT_gettmbyobj;
         §§goto(addr226);
      }
   }
}
