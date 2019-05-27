package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_getthread extends Machine
   {
       
      
      public function FSM_getthread()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         FSM_getthread.esp = FSM_getthread.esp - 4;
         si32(FSM_getthread.ebp,FSM_getthread.esp);
         FSM_getthread.ebp = FSM_getthread.esp;
         FSM_getthread.esp = FSM_getthread.esp - 0;
         _loc1_ = 1;
         FSM_getthread.esp = FSM_getthread.esp - 8;
         _loc2_ = li32(FSM_getthread.ebp + 8);
         si32(_loc2_,FSM_getthread.esp);
         si32(_loc1_,FSM_getthread.esp + 4);
         FSM_getthread.esp = FSM_getthread.esp - 4;
         FSM_getthread.start();
         _loc1_ = FSM_getthread.eax;
         FSM_getthread.esp = FSM_getthread.esp + 8;
         _loc3_ = li32(FSM_getthread.ebp + 12);
         _loc4_ = FSM_getthread;
         if(_loc1_ != _loc4_)
         {
            _loc1_ = li32(_loc1_ + 8);
            if(_loc1_ == 8)
            {
               _loc1_ = 1;
               si32(_loc1_,_loc3_);
               FSM_getthread.esp = FSM_getthread.esp - 8;
               si32(_loc2_,FSM_getthread.esp);
               si32(_loc1_,FSM_getthread.esp + 4);
               FSM_getthread.esp = FSM_getthread.esp - 4;
               FSM_getthread.start();
               _loc2_ = FSM_getthread.eax;
               FSM_getthread.esp = FSM_getthread.esp + 8;
               _loc3_ = li32(_loc2_ + 8);
               if(_loc3_ == 8)
               {
                  _loc2_ = li32(_loc2_);
               }
               else
               {
                  _loc2_ = 0;
               }
            }
            addr190:
            FSM_getthread.eax = _loc2_;
            FSM_getthread.esp = FSM_getthread.ebp;
            FSM_getthread.ebp = li32(FSM_getthread.esp);
            FSM_getthread.esp = FSM_getthread.esp + 4;
            FSM_getthread.esp = FSM_getthread.esp + 4;
            return;
         }
         _loc1_ = 0;
         si32(_loc1_,_loc3_);
         §§goto(addr190);
      }
   }
}
