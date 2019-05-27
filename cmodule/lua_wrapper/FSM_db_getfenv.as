package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_db_getfenv extends Machine
   {
       
      
      public function FSM_db_getfenv()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         FSM_db_getfenv.esp = FSM_db_getfenv.esp - 4;
         si32(FSM_db_getfenv.ebp,FSM_db_getfenv.esp);
         FSM_db_getfenv.ebp = FSM_db_getfenv.esp;
         FSM_db_getfenv.esp = FSM_db_getfenv.esp - 0;
         _loc1_ = 1;
         FSM_db_getfenv.esp = FSM_db_getfenv.esp - 8;
         _loc2_ = li32(FSM_db_getfenv.ebp + 8);
         si32(_loc2_,FSM_db_getfenv.esp);
         si32(_loc1_,FSM_db_getfenv.esp + 4);
         FSM_db_getfenv.esp = FSM_db_getfenv.esp - 4;
         FSM_db_getfenv.start();
         FSM_db_getfenv.esp = FSM_db_getfenv.esp + 8;
         FSM_db_getfenv.eax = _loc1_;
         FSM_db_getfenv.esp = FSM_db_getfenv.ebp;
         FSM_db_getfenv.ebp = li32(FSM_db_getfenv.esp);
         FSM_db_getfenv.esp = FSM_db_getfenv.esp + 4;
         FSM_db_getfenv.esp = FSM_db_getfenv.esp + 4;
      }
   }
}
