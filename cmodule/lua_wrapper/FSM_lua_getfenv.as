package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.lf64;
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.sf64;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_lua_getfenv extends Machine
   {
       
      
      public function FSM_lua_getfenv()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:Number = NaN;
         FSM_lua_getfenv.esp = FSM_lua_getfenv.esp - 4;
         si32(FSM_lua_getfenv.ebp,FSM_lua_getfenv.esp);
         FSM_lua_getfenv.ebp = FSM_lua_getfenv.esp;
         FSM_lua_getfenv.esp = FSM_lua_getfenv.esp - 0;
         _loc1_ = li32(FSM_lua_getfenv.ebp + 8);
         FSM_lua_getfenv.esp = FSM_lua_getfenv.esp - 8;
         _loc2_ = li32(FSM_lua_getfenv.ebp + 12);
         si32(_loc1_,FSM_lua_getfenv.esp);
         si32(_loc2_,FSM_lua_getfenv.esp + 4);
         FSM_lua_getfenv.esp = FSM_lua_getfenv.esp - 4;
         FSM_lua_getfenv.start();
         _loc2_ = FSM_lua_getfenv.eax;
         FSM_lua_getfenv.esp = FSM_lua_getfenv.esp + 8;
         _loc3_ = li32(_loc2_ + 8);
         _loc1_ = _loc1_ + 8;
         if(_loc3_ != 8)
         {
            if(_loc3_ != 7)
            {
               if(_loc3_ != 6)
               {
                  _loc2_ = 0;
                  _loc3_ = li32(_loc1_);
               }
               addr188:
               _loc2_ = li32(_loc1_);
               _loc2_ = _loc2_ + 12;
               si32(_loc2_,_loc1_);
               FSM_lua_getfenv.esp = FSM_lua_getfenv.ebp;
               FSM_lua_getfenv.ebp = li32(FSM_lua_getfenv.esp);
               FSM_lua_getfenv.esp = FSM_lua_getfenv.esp + 4;
               FSM_lua_getfenv.esp = FSM_lua_getfenv.esp + 4;
               return;
            }
            _loc3_ = 5;
            _loc2_ = li32(_loc2_);
            _loc4_ = li32(_loc1_);
            _loc2_ = li32(_loc2_ + 12);
            si32(_loc2_,_loc4_);
            si32(_loc3_,_loc4_ + 8);
            §§goto(addr188);
         }
         else
         {
            _loc2_ = li32(_loc2_);
            _loc3_ = li32(_loc1_);
            _loc5_ = lf64(_loc2_ + 72);
            sf64(_loc5_,_loc3_);
            _loc2_ = li32(_loc2_ + 80);
         }
         si32(_loc2_,_loc3_ + 8);
         §§goto(addr188);
      }
   }
}
