package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_time extends Machine
   {
       
      
      public function FSM_time()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         FSM_time.esp = FSM_time.esp - 4;
         si32(FSM_time.ebp,FSM_time.esp);
         FSM_time.ebp = FSM_time.esp;
         FSM_time.esp = FSM_time.esp - 0;
         _loc1_ = FSM_time.gworker.getSecsSetMS();
         _loc2_ = _loc1_;
         _loc1_ = FSM_time.sMS;
         FSM_time.eax = _loc2_;
         FSM_time.esp = FSM_time.ebp;
         FSM_time.ebp = li32(FSM_time.esp);
         FSM_time.esp = FSM_time.esp + 4;
         FSM_time.esp = FSM_time.esp + 4;
      }
   }
}
