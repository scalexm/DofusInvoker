package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.li8;
   import avm2.intrinsics.memory.si32;
   import avm2.intrinsics.memory.si8;
   
   public final class FSM_lua_setfenv extends Machine
   {
       
      
      public function FSM_lua_setfenv()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:* = 0;
         var _loc5_:* = 0;
         var _loc6_:* = 0;
         var _loc7_:int = 0;
         FSM_lua_setfenv.esp = FSM_lua_setfenv.esp - 4;
         si32(FSM_lua_setfenv.ebp,FSM_lua_setfenv.esp);
         FSM_lua_setfenv.ebp = FSM_lua_setfenv.esp;
         FSM_lua_setfenv.esp = FSM_lua_setfenv.esp - 0;
         _loc1_ = li32(FSM_lua_setfenv.ebp + 8);
         FSM_lua_setfenv.esp = FSM_lua_setfenv.esp - 8;
         _loc2_ = li32(FSM_lua_setfenv.ebp + 12);
         si32(_loc1_,FSM_lua_setfenv.esp);
         si32(_loc2_,FSM_lua_setfenv.esp + 4);
         FSM_lua_setfenv.esp = FSM_lua_setfenv.esp - 4;
         FSM_lua_setfenv.start();
         _loc2_ = FSM_lua_setfenv.eax;
         FSM_lua_setfenv.esp = FSM_lua_setfenv.esp + 8;
         _loc3_ = li32(_loc2_ + 8);
         if(_loc3_ != 6)
         {
            if(_loc3_ != 7)
            {
               if(_loc3_ != 8)
               {
                  _loc3_ = 0;
               }
               else
               {
                  _loc3_ = 5;
                  _loc4_ = int(li32(_loc1_ + 8));
                  _loc5_ = int(li32(_loc2_));
                  _loc4_ = int(li32(_loc4_ + -12));
                  si32(_loc4_,_loc5_ + 72);
                  si32(_loc3_,_loc5_ + 80);
                  _loc3_ = 1;
               }
               if(_loc3_ == 0)
               {
                  _loc2_ = _loc3_;
               }
               addr353:
               _loc3_ = li32(_loc1_ + 8);
               _loc3_ = _loc3_ + -12;
               si32(_loc3_,_loc1_ + 8);
               FSM_lua_setfenv.eax = _loc2_;
               FSM_lua_setfenv.esp = FSM_lua_setfenv.ebp;
               FSM_lua_setfenv.ebp = li32(FSM_lua_setfenv.esp);
               FSM_lua_setfenv.esp = FSM_lua_setfenv.esp + 4;
               FSM_lua_setfenv.esp = FSM_lua_setfenv.esp + 4;
               return;
            }
            _loc3_ = 1;
            _loc4_ = int(li32(_loc1_ + 8));
            _loc5_ = int(li32(_loc2_));
            _loc4_ = int(li32(_loc4_ + -12));
            si32(_loc4_,_loc5_ + 12);
         }
         else
         {
            _loc3_ = 1;
            _loc4_ = int(li32(_loc1_ + 8));
            _loc5_ = int(li32(_loc2_));
            _loc4_ = int(li32(_loc4_ + -12));
            si32(_loc4_,_loc5_ + 12);
         }
         _loc4_ = int(li32(_loc1_ + 8));
         _loc4_ = int(li32(_loc4_ + -12));
         _loc5_ = int(li8(_loc4_ + 5));
         _loc5_ = _loc5_ & 3;
         if(_loc5_ != 0)
         {
            _loc2_ = li32(_loc2_);
            _loc5_ = int(li8(_loc2_ + 5));
            _loc2_ = _loc2_ + 5;
            _loc6_ = _loc5_ & 4;
            if(_loc6_ != 0)
            {
               _loc6_ = int(li32(_loc1_ + 16));
               _loc7_ = li8(_loc6_ + 21);
               if(_loc7_ == 1)
               {
                  FSM_lua_setfenv.esp = FSM_lua_setfenv.esp - 8;
                  si32(_loc6_,FSM_lua_setfenv.esp);
                  si32(_loc4_,FSM_lua_setfenv.esp + 4);
                  FSM_lua_setfenv.esp = FSM_lua_setfenv.esp - 4;
                  FSM_lua_setfenv.start();
                  FSM_lua_setfenv.esp = FSM_lua_setfenv.esp + 8;
                  _loc2_ = _loc3_;
               }
               else
               {
                  _loc4_ = int(li8(_loc6_ + 20));
                  _loc5_ = _loc5_ & -8;
                  _loc4_ = _loc4_ & 3;
                  _loc4_ = _loc4_ | _loc5_;
                  si8(_loc4_,_loc2_);
                  _loc2_ = _loc3_;
               }
            }
            §§goto(addr353);
         }
         _loc2_ = _loc3_;
         §§goto(addr353);
      }
   }
}
