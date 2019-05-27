package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.li8;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_findlocal extends Machine
   {
       
      
      public function FSM_findlocal()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:int = 0;
         var _loc2_:* = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         FSM_findlocal.esp = FSM_findlocal.esp - 4;
         si32(FSM_findlocal.ebp,FSM_findlocal.esp);
         FSM_findlocal.ebp = FSM_findlocal.esp;
         FSM_findlocal.esp = FSM_findlocal.esp - 0;
         _loc1_ = li32(FSM_findlocal.ebp + 12);
         _loc2_ = int(li32(_loc1_ + 4));
         _loc3_ = li32(_loc2_ + 8);
         _loc4_ = li32(FSM_findlocal.ebp + 8);
         _loc5_ = li32(FSM_findlocal.ebp + 16);
         if(_loc3_ == 6)
         {
            _loc6_ = li32(_loc2_);
            _loc7_ = li8(_loc6_ + 6);
            if(_loc7_ == 0)
            {
               _loc6_ = li32(_loc6_ + 16);
            }
            addr112:
            if(_loc6_ != 0)
            {
               if(_loc3_ == 6)
               {
                  _loc3_ = li32(_loc2_);
                  _loc3_ = li8(_loc3_ + 6);
                  if(_loc3_ == 0)
                  {
                     _loc3_ = li32(_loc4_ + 20);
                     if(_loc3_ == _loc1_)
                     {
                        _loc3_ = li32(_loc4_ + 24);
                        si32(_loc3_,_loc1_ + 12);
                     }
                     _loc2_ = int(li32(_loc2_));
                     _loc2_ = int(li32(_loc2_ + 16));
                     _loc3_ = li32(_loc1_ + 12);
                     _loc2_ = int(li32(_loc2_ + 12));
                     _loc2_ = int(_loc3_ - _loc2_);
                     _loc2_ = _loc2_ >> 2;
                     _loc2_ = int(_loc2_ + -1);
                  }
                  addr198:
                  _loc3_ = li32(_loc6_ + 24);
                  _loc6_ = li32(_loc6_ + 56);
                  FSM_findlocal.esp = FSM_findlocal.esp - 16;
                  si32(_loc3_,FSM_findlocal.esp);
                  si32(_loc6_,FSM_findlocal.esp + 4);
                  si32(_loc5_,FSM_findlocal.esp + 8);
                  si32(_loc2_,FSM_findlocal.esp + 12);
                  FSM_findlocal.esp = FSM_findlocal.esp - 4;
                  FSM_findlocal.start();
                  _loc2_ = int(FSM_findlocal.eax);
                  FSM_findlocal.esp = FSM_findlocal.esp + 16;
                  addr350:
                  if(_loc2_ == 0)
                  {
                  }
                  FSM_findlocal.eax = _loc2_;
                  FSM_findlocal.esp = FSM_findlocal.ebp;
                  FSM_findlocal.ebp = li32(FSM_findlocal.esp);
                  FSM_findlocal.esp = FSM_findlocal.esp + 4;
                  FSM_findlocal.esp = FSM_findlocal.esp + 4;
                  return;
               }
               _loc2_ = -1;
               §§goto(addr198);
            }
            _loc2_ = int(li32(_loc4_ + 20));
            if(_loc2_ == _loc1_)
            {
               _loc2_ = int(_loc4_ + 8);
            }
            else
            {
               _loc2_ = int(_loc1_ + 28);
            }
            _loc3_ = FSM_findlocal;
            _loc2_ = int(li32(_loc2_));
            _loc1_ = li32(_loc1_);
            _loc2_ = int(_loc2_ - _loc1_);
            _loc2_ = int(_loc2_ / 12);
            _loc2_ = int(_loc2_ >= _loc5_?1:0);
            _loc1_ = _loc5_ > 0?1:0;
            _loc2_ = _loc2_ & _loc1_;
            _loc2_ = _loc2_ & 1;
            _loc2_ = int(_loc2_ != 0?int(_loc3_):0);
            §§goto(addr350);
         }
         _loc6_ = 0;
         §§goto(addr112);
      }
   }
}
