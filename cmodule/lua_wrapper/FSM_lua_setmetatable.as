package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.li8;
   import avm2.intrinsics.memory.si32;
   import avm2.intrinsics.memory.si8;
   
   public final class FSM_lua_setmetatable extends Machine
   {
       
      
      public function FSM_lua_setmetatable()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:* = 0;
         var _loc2_:* = 0;
         var _loc3_:* = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:* = 0;
         FSM_lua_setmetatable.esp = FSM_lua_setmetatable.esp - 4;
         si32(FSM_lua_setmetatable.ebp,FSM_lua_setmetatable.esp);
         FSM_lua_setmetatable.ebp = FSM_lua_setmetatable.esp;
         FSM_lua_setmetatable.esp = FSM_lua_setmetatable.esp - 0;
         _loc1_ = int(li32(FSM_lua_setmetatable.ebp + 8));
         FSM_lua_setmetatable.esp = FSM_lua_setmetatable.esp - 8;
         _loc2_ = int(li32(FSM_lua_setmetatable.ebp + 12));
         si32(_loc1_,FSM_lua_setmetatable.esp);
         si32(_loc2_,FSM_lua_setmetatable.esp + 4);
         FSM_lua_setmetatable.esp = FSM_lua_setmetatable.esp - 4;
         FSM_lua_setmetatable.start();
         _loc2_ = int(FSM_lua_setmetatable.eax);
         FSM_lua_setmetatable.esp = FSM_lua_setmetatable.esp + 8;
         _loc3_ = int(li32(_loc1_ + 8));
         _loc4_ = li32(_loc3_ + -4);
         _loc5_ = _loc1_ + 8;
         if(_loc4_ == 0)
         {
            _loc3_ = 0;
         }
         else
         {
            _loc3_ = int(li32(_loc3_ + -12));
         }
         _loc4_ = li32(_loc2_ + 8);
         if(_loc4_ != 7)
         {
            if(_loc4_ == 5)
            {
               _loc4_ = li32(_loc2_);
               si32(_loc3_,_loc4_ + 8);
               if(_loc3_ != 0)
               {
                  _loc3_ = int(li8(_loc3_ + 5));
                  _loc3_ = _loc3_ & 3;
                  if(_loc3_ != 0)
                  {
                     _loc2_ = int(li32(_loc2_));
                     _loc3_ = int(li8(_loc2_ + 5));
                     _loc4_ = _loc2_ + 5;
                     _loc6_ = _loc3_ & 4;
                     if(_loc6_ != 0)
                     {
                        _loc1_ = int(li32(_loc1_ + 16));
                        _loc3_ = _loc3_ & -5;
                        si8(_loc3_,_loc4_);
                        _loc3_ = int(li32(_loc1_ + 40));
                        si32(_loc3_,_loc2_ + 24);
                        si32(_loc2_,_loc1_ + 40);
                     }
                     addr363:
                     _loc1_ = int(li32(_loc5_));
                     _loc1_ = int(_loc1_ + -12);
                     si32(_loc1_,_loc5_);
                     FSM_lua_setmetatable.esp = FSM_lua_setmetatable.ebp;
                     FSM_lua_setmetatable.ebp = li32(FSM_lua_setmetatable.esp);
                     FSM_lua_setmetatable.esp = FSM_lua_setmetatable.esp + 4;
                     FSM_lua_setmetatable.esp = FSM_lua_setmetatable.esp + 4;
                     return;
                  }
               }
            }
            else
            {
               _loc1_ = int(li32(_loc1_ + 16));
               _loc2_ = _loc4_ << 2;
               _loc1_ = int(_loc1_ + _loc2_);
               si32(_loc3_,_loc1_ + 132);
            }
         }
         else
         {
            _loc4_ = li32(_loc2_);
            si32(_loc3_,_loc4_ + 8);
            _loc4_ = _loc2_;
            if(_loc3_ != 0)
            {
               _loc2_ = int(li8(_loc3_ + 5));
               _loc2_ = _loc2_ & 3;
               if(_loc2_ != 0)
               {
                  _loc4_ = li32(_loc4_);
                  _loc2_ = int(li8(_loc4_ + 5));
                  _loc4_ = _loc4_ + 5;
                  _loc6_ = _loc2_ & 4;
                  if(_loc6_ != 0)
                  {
                     _loc1_ = int(li32(_loc1_ + 16));
                     _loc6_ = int(li8(_loc1_ + 21));
                     if(_loc6_ == 1)
                     {
                        FSM_lua_setmetatable.esp = FSM_lua_setmetatable.esp - 8;
                        si32(_loc1_,FSM_lua_setmetatable.esp);
                        si32(_loc3_,FSM_lua_setmetatable.esp + 4);
                        FSM_lua_setmetatable.esp = FSM_lua_setmetatable.esp - 4;
                        FSM_lua_setmetatable.start();
                        FSM_lua_setmetatable.esp = FSM_lua_setmetatable.esp + 8;
                     }
                     else
                     {
                        _loc1_ = int(li8(_loc1_ + 20));
                        _loc3_ = _loc2_ & -8;
                        _loc1_ = _loc1_ & 3;
                        _loc1_ = _loc1_ | _loc3_;
                        si8(_loc1_,_loc4_);
                     }
                  }
                  §§goto(addr363);
               }
            }
         }
         §§goto(addr363);
      }
   }
}
