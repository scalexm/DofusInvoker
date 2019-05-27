package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.li8;
   import avm2.intrinsics.memory.si32;
   import avm2.intrinsics.memory.si8;
   
   public final class FSM_iscleared extends Machine
   {
       
      
      public function FSM_iscleared()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:* = 0;
         var _loc2_:int = 0;
         var _loc3_:* = 0;
         var _loc4_:* = 0;
         FSM_iscleared.esp = FSM_iscleared.esp - 4;
         si32(FSM_iscleared.ebp,FSM_iscleared.esp);
         FSM_iscleared.ebp = FSM_iscleared.esp;
         FSM_iscleared.esp = FSM_iscleared.esp - 0;
         _loc1_ = int(li32(FSM_iscleared.ebp + 8));
         _loc2_ = li32(_loc1_ + 8);
         _loc3_ = int(li32(FSM_iscleared.ebp + 12));
         if(_loc2_ > 3)
         {
            _loc1_ = int(li32(_loc1_));
            if(_loc2_ == 4)
            {
               _loc2_ = 0;
               _loc3_ = int(li8(_loc1_ + 5));
               _loc3_ = _loc3_ & -4;
               si8(_loc3_,_loc1_ + 5);
               FSM_iscleared.eax = _loc2_;
            }
            else
            {
               _loc4_ = int(li8(_loc1_ + 5));
               _loc4_ = _loc4_ & 3;
               if(_loc4_ != 0)
               {
                  _loc1_ = 1;
               }
               else if(_loc2_ == 7)
               {
                  if(_loc3_ == 0)
                  {
                     _loc1_ = int(li8(_loc1_ + 5));
                     _loc1_ = int(_loc1_ >>> 3);
                     _loc1_ = _loc1_ & 1;
                  }
               }
               addr144:
               FSM_iscleared.eax = _loc1_;
            }
            FSM_iscleared.esp = FSM_iscleared.ebp;
            FSM_iscleared.ebp = li32(FSM_iscleared.esp);
            FSM_iscleared.esp = FSM_iscleared.esp + 4;
            FSM_iscleared.esp = FSM_iscleared.esp + 4;
            return;
         }
         _loc1_ = 0;
         §§goto(addr144);
      }
   }
}
