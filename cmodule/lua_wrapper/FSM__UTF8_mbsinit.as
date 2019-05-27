package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM__UTF8_mbsinit extends Machine
   {
       
      
      public function FSM__UTF8_mbsinit()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:* = 0;
         FSM__UTF8_mbsinit.esp = FSM__UTF8_mbsinit.esp - 4;
         si32(FSM__UTF8_mbsinit.ebp,FSM__UTF8_mbsinit.esp);
         FSM__UTF8_mbsinit.ebp = FSM__UTF8_mbsinit.esp;
         FSM__UTF8_mbsinit.esp = FSM__UTF8_mbsinit.esp - 0;
         _loc1_ = int(li32(FSM__UTF8_mbsinit.ebp + 8));
         if(_loc1_ != 0)
         {
            _loc1_ = int(li32(_loc1_ + 4));
            _loc1_ = int(_loc1_ == 0?1:0);
            _loc1_ = _loc1_ & 1;
         }
         else
         {
            _loc1_ = 1;
         }
         FSM__UTF8_mbsinit.eax = _loc1_;
         FSM__UTF8_mbsinit.esp = FSM__UTF8_mbsinit.ebp;
         FSM__UTF8_mbsinit.ebp = li32(FSM__UTF8_mbsinit.esp);
         FSM__UTF8_mbsinit.esp = FSM__UTF8_mbsinit.esp + 4;
         FSM__UTF8_mbsinit.esp = FSM__UTF8_mbsinit.esp + 4;
      }
   }
}
