package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.li8;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_localsub399 extends Machine
   {
       
      
      public function FSM_localsub399()
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
         FSM_localsub399.esp = FSM_localsub399.esp - 4;
         si32(FSM_localsub399.ebp,FSM_localsub399.esp);
         FSM_localsub399.ebp = FSM_localsub399.esp;
         FSM_localsub399.esp = FSM_localsub399.esp - 0;
         _loc1_ = li32(FSM_localsub399 + 4);
         _loc2_ = int(li32(FSM_localsub399.ebp + 8));
         _loc3_ = li32(FSM_localsub399.ebp + 16);
         if(_loc1_ != 0)
         {
            _loc4_ = li32(FSM_localsub399 + 16);
            if(_loc4_ <= _loc2_)
            {
               _loc4_ = FSM_localsub399;
               _loc5_ = 0;
               _loc4_ = _loc4_ + 20;
               while(true)
               {
                  _loc6_ = _loc4_;
                  _loc4_ = _loc5_;
                  _loc5_ = _loc6_;
                  _loc7_ = _loc4_ + 1;
                  if(_loc1_ > _loc7_)
                  {
                     _loc5_ = li32(_loc5_);
                     _loc6_ = _loc6_ + 4;
                     _loc7_ = _loc4_ + 1;
                     if(_loc5_ <= _loc2_)
                     {
                        _loc4_ = _loc6_;
                        _loc5_ = _loc7_;
                        continue;
                     }
                     break;
                  }
                  break;
               }
               _loc1_ = FSM_localsub399;
               _loc1_ = _loc1_ + _loc4_;
               _loc1_ = li8(_loc1_ + 1496);
            }
            addr216:
            _loc4_ = FSM_localsub399;
            _loc1_ = _loc1_ * 20;
            _loc1_ = _loc4_ + _loc1_;
            _loc5_ = li32(_loc1_ + 1868);
            FSM_localsub399.esp = FSM_localsub399.esp - 16;
            si32(_loc2_,FSM_localsub399.esp);
            si32(_loc5_,FSM_localsub399.esp + 4);
            si32(_loc4_,FSM_localsub399.esp + 8);
            si32(_loc3_,FSM_localsub399.esp + 12);
            FSM_localsub399.esp = FSM_localsub399.esp - 4;
            FSM_localsub399.start();
            FSM_localsub399.esp = FSM_localsub399.esp + 16;
            _loc2_ = int(li32(_loc1_ + 1872));
            si32(_loc2_,_loc3_ + 32);
            _loc1_ = li32(_loc1_ + 1876);
            _loc1_ = _loc4_ + _loc1_;
            _loc4_ = FSM_localsub399;
            _loc2_ = _loc2_ << 2;
            _loc1_ = _loc1_ + 6988;
            _loc2_ = int(_loc4_ + _loc2_);
            si32(_loc1_,_loc2_);
            si32(_loc1_,_loc3_ + 40);
            FSM_localsub399.esp = FSM_localsub399.ebp;
            FSM_localsub399.ebp = li32(FSM_localsub399.esp);
            FSM_localsub399.esp = FSM_localsub399.esp + 4;
            FSM_localsub399.esp = FSM_localsub399.esp + 4;
            return;
         }
         _loc1_ = FSM_localsub399;
         _loc4_ = 0;
         _loc1_ = _loc1_ + 1872;
         while(true)
         {
            _loc5_ = _loc1_;
            _loc1_ = _loc4_;
            _loc4_ = li32(_loc5_);
            if(_loc4_ == 0)
            {
               break;
            }
            _loc4_ = li32(FSM_localsub399 + 8);
            _loc5_ = _loc5_ + 20;
            _loc6_ = _loc1_ + 1;
            if(_loc6_ >= _loc4_)
            {
               _loc1_ = 0;
               break;
            }
            _loc1_ = _loc5_;
            _loc4_ = _loc6_;
         }
         §§goto(addr216);
      }
   }
}
