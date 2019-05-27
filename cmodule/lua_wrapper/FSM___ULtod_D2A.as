package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM___ULtod_D2A extends Machine
   {
       
      
      public function FSM___ULtod_D2A()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:* = 0;
         var _loc2_:int = 0;
         var _loc3_:* = 0;
         var _loc4_:* = 0;
         var _loc5_:* = 0;
         FSM___ULtod_D2A.esp = FSM___ULtod_D2A.esp - 4;
         si32(FSM___ULtod_D2A.ebp,FSM___ULtod_D2A.esp);
         FSM___ULtod_D2A.ebp = FSM___ULtod_D2A.esp;
         FSM___ULtod_D2A.esp = FSM___ULtod_D2A.esp - 0;
         _loc1_ = int(li32(FSM___ULtod_D2A.ebp + 20));
         _loc2_ = li32(FSM___ULtod_D2A.ebp + 8);
         _loc3_ = int(li32(FSM___ULtod_D2A.ebp + 12));
         _loc4_ = int(li32(FSM___ULtod_D2A.ebp + 16));
         _loc5_ = _loc1_ & 7;
         if(_loc5_ <= 2)
         {
            if(_loc5_ != 0)
            {
               if(_loc5_ != 1)
               {
                  if(_loc5_ != 2)
                  {
                     addr149:
                     _loc1_ = _loc1_ & 8;
                     if(_loc1_ != 0)
                     {
                        addr250:
                        _loc1_ = int(li32(_loc2_ + 4));
                        _loc1_ = _loc1_ | -2147483648;
                        si32(_loc1_,_loc2_ + 4);
                     }
                  }
                  else
                  {
                     _loc4_ = int(li32(_loc3_));
                     si32(_loc4_,_loc2_);
                     _loc3_ = int(li32(_loc3_ + 4));
                     si32(_loc3_,_loc2_ + 4);
                     _loc1_ = _loc1_ & 8;
                     if(_loc1_ != 0)
                     {
                        §§goto(addr250);
                     }
                  }
               }
            }
            else
            {
               addr167:
               _loc3_ = 0;
               si32(_loc3_,_loc2_ + 4);
               si32(_loc3_,_loc2_);
               _loc1_ = _loc1_ & 8;
               if(_loc1_ != 0)
               {
                  §§goto(addr250);
               }
            }
            addr265:
            FSM___ULtod_D2A.esp = FSM___ULtod_D2A.ebp;
            FSM___ULtod_D2A.ebp = li32(FSM___ULtod_D2A.esp);
            FSM___ULtod_D2A.esp = FSM___ULtod_D2A.esp + 4;
            FSM___ULtod_D2A.esp = FSM___ULtod_D2A.esp + 4;
            return;
         }
         if(_loc5_ <= 4)
         {
            if(_loc5_ != 3)
            {
               if(_loc5_ == 4)
               {
                  _loc3_ = 2147483647;
                  si32(_loc3_,_loc2_ + 4);
                  _loc3_ = -1;
                  si32(_loc3_,_loc2_);
               }
               §§goto(addr149);
            }
            else
            {
               _loc3_ = 2146435072;
               si32(_loc3_,_loc2_ + 4);
               _loc3_ = 0;
               si32(_loc3_,_loc2_);
               _loc1_ = _loc1_ & 8;
               if(_loc1_ != 0)
               {
                  §§goto(addr250);
               }
            }
         }
         else if(_loc5_ != 5)
         {
            if(_loc5_ == 6)
            {
               §§goto(addr167);
            }
            else
            {
               §§goto(addr149);
            }
         }
         §§goto(addr265);
         _loc5_ = int(li32(_loc3_));
         si32(_loc5_,_loc2_);
         _loc3_ = int(li32(_loc3_ + 4));
         _loc4_ = _loc4_ << 20;
         _loc4_ = int(_loc4_ + 1127219200);
         _loc3_ = _loc3_ & -1048577;
         _loc3_ = _loc3_ | _loc4_;
         si32(_loc3_,_loc2_ + 4);
         _loc1_ = _loc1_ & 8;
         if(_loc1_ != 0)
         {
            §§goto(addr250);
         }
         §§goto(addr265);
      }
   }
}
