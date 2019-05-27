package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.li8;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_getnum extends Machine
   {
       
      
      public function FSM_getnum()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:* = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:* = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         FSM_getnum.esp = FSM_getnum.esp - 4;
         si32(FSM_getnum.ebp,FSM_getnum.esp);
         FSM_getnum.ebp = FSM_getnum.esp;
         FSM_getnum.esp = FSM_getnum.esp - 0;
         _loc1_ = int(li32(FSM_getnum.ebp + 8));
         _loc2_ = li32(FSM_getnum.ebp + 12);
         _loc3_ = li32(FSM_getnum.ebp + 16);
         _loc4_ = li32(FSM_getnum.ebp + 20);
         _loc5_ = _loc1_;
         if(_loc1_ != 0)
         {
            _loc1_ = int(li8(_loc1_));
            _loc6_ = _loc1_ << 24;
            _loc6_ = _loc6_ >> 24;
            _loc6_ = int(_loc6_ + -48);
            if(uint(_loc6_) <= uint(9))
            {
               _loc6_ = 0;
               while(true)
               {
                  _loc1_ = _loc1_ << 24;
                  _loc1_ = _loc1_ >> 24;
                  _loc6_ = int(_loc6_ * 10);
                  _loc1_ = int(_loc6_ + _loc1_);
                  _loc1_ = int(_loc1_ + -48);
                  if(_loc1_ <= _loc4_)
                  {
                     _loc7_ = li8(_loc5_ + 1);
                     _loc5_ = _loc5_ + 1;
                     _loc6_ = _loc7_ << 24;
                     _loc6_ = _loc6_ >> 24;
                     _loc8_ = _loc5_;
                     _loc6_ = int(_loc6_ + -48);
                     if(uint(_loc6_) <= uint(9))
                     {
                        _loc5_ = _loc8_;
                        _loc6_ = int(_loc1_);
                        _loc1_ = int(_loc7_);
                        continue;
                     }
                     if(_loc1_ >= _loc3_)
                     {
                        si32(_loc1_,_loc2_);
                        FSM_getnum.eax = _loc5_;
                        addr201:
                        FSM_getnum.esp = FSM_getnum.ebp;
                        FSM_getnum.ebp = li32(FSM_getnum.esp);
                        FSM_getnum.esp = FSM_getnum.esp + 4;
                        FSM_getnum.esp = FSM_getnum.esp + 4;
                        return;
                     }
                     break;
                  }
                  break;
               }
            }
         }
         _loc1_ = 0;
         FSM_getnum.eax = _loc1_;
         §§goto(addr201);
      }
   }
}
