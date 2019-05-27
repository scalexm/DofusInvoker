package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.li8;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_checkArgMode extends Machine
   {
       
      
      public function FSM_checkArgMode()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:* = 0;
         var _loc2_:* = 0;
         var _loc3_:* = 0;
         FSM_checkArgMode.esp = FSM_checkArgMode.esp - 4;
         si32(FSM_checkArgMode.ebp,FSM_checkArgMode.esp);
         FSM_checkArgMode.ebp = FSM_checkArgMode.esp;
         FSM_checkArgMode.esp = FSM_checkArgMode.esp - 0;
         _loc1_ = int(li32(FSM_checkArgMode.ebp + 8));
         _loc2_ = int(li32(FSM_checkArgMode.ebp + 12));
         _loc3_ = int(li32(FSM_checkArgMode.ebp + 16));
         if(_loc3_ != 3)
         {
            if(_loc3_ != 2)
            {
               if(_loc3_ == 0)
               {
                  _loc1_ = int(_loc2_ == 0?1:0);
               }
               else
               {
                  _loc1_ = 1;
               }
               addr135:
               FSM_checkArgMode.eax = _loc1_;
               FSM_checkArgMode.esp = FSM_checkArgMode.ebp;
               FSM_checkArgMode.ebp = li32(FSM_checkArgMode.esp);
               FSM_checkArgMode.esp = FSM_checkArgMode.esp + 4;
               FSM_checkArgMode.esp = FSM_checkArgMode.esp + 4;
               return;
            }
            addr101:
            _loc1_ = _loc1_ & 1;
            §§goto(addr135);
         }
         else
         {
            _loc3_ = _loc2_ & 256;
            if(_loc3_ != 0)
            {
               _loc1_ = int(li32(_loc1_ + 40));
               _loc2_ = _loc2_ & -257;
               _loc1_ = int(_loc2_ < _loc1_?1:0);
            }
            §§goto(addr101);
         }
         _loc1_ = int(li8(_loc1_ + 75));
         _loc1_ = int(_loc1_ > _loc2_?1:0);
         §§goto(addr101);
      }
   }
}
