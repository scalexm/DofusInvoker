package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_lua_topointer extends Machine
   {
       
      
      public function FSM_lua_topointer()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         FSM_lua_topointer.esp = FSM_lua_topointer.esp - 4;
         si32(FSM_lua_topointer.ebp,FSM_lua_topointer.esp);
         FSM_lua_topointer.ebp = FSM_lua_topointer.esp;
         FSM_lua_topointer.esp = FSM_lua_topointer.esp - 0;
         _loc1_ = FSM_lua_topointer;
         _loc2_ = li32(FSM_lua_topointer.ebp + 8);
         _loc3_ = li32(_loc2_ + 8);
         _loc4_ = li32(_loc2_ + 12);
         _loc1_ = uint(_loc3_) > uint(_loc4_)?int(_loc4_):int(_loc1_);
         _loc3_ = li32(_loc1_ + 8);
         if(_loc3_ <= 5)
         {
            if(_loc3_ != 2)
            {
               if(_loc3_ != 5)
               {
                  addr196:
                  _loc1_ = 0;
               }
               addr198:
               addr202:
               FSM_lua_topointer.eax = _loc1_;
               FSM_lua_topointer.esp = FSM_lua_topointer.ebp;
               FSM_lua_topointer.ebp = li32(FSM_lua_topointer.esp);
               FSM_lua_topointer.esp = FSM_lua_topointer.esp + 4;
               FSM_lua_topointer.esp = FSM_lua_topointer.esp + 4;
               return;
            }
            addr125:
            _loc1_ = 1;
            FSM_lua_topointer.esp = FSM_lua_topointer.esp - 8;
            si32(_loc2_,FSM_lua_topointer.esp);
            si32(_loc1_,FSM_lua_topointer.esp + 4);
            FSM_lua_topointer.esp = FSM_lua_topointer.esp - 4;
            FSM_lua_topointer.start();
            _loc1_ = FSM_lua_topointer.eax;
            FSM_lua_topointer.esp = FSM_lua_topointer.esp + 8;
            _loc2_ = li32(_loc1_ + 8);
            if(_loc2_ != 2)
            {
               if(_loc2_ == 7)
               {
                  _loc1_ = li32(_loc1_);
                  _loc1_ = _loc1_ + 20;
               }
               else
               {
                  §§goto(addr196);
               }
            }
            §§goto(addr198);
            addr98:
            _loc1_ = li32(_loc1_);
            §§goto(addr198);
         }
         else if(_loc3_ != 6)
         {
            if(_loc3_ != 7)
            {
               if(_loc3_ != 8)
               {
                  §§goto(addr196);
               }
               else
               {
                  _loc2_ = li32(_loc1_);
                  FSM_lua_topointer.eax = _loc2_;
               }
               §§goto(addr202);
            }
            else
            {
               §§goto(addr125);
            }
            §§goto(addr198);
         }
         §§goto(addr98);
      }
   }
}
