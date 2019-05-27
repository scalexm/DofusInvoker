package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.li8;
   import avm2.intrinsics.memory.si32;
   import avm2.intrinsics.memory.si8;
   
   public final class FSM_strerror_r extends Machine
   {
       
      
      public function FSM_strerror_r()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:* = 0;
         var _loc2_:* = 0;
         var _loc3_:* = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:* = 0;
         var _loc7_:* = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         FSM_strerror_r.esp = FSM_strerror_r.esp - 4;
         si32(FSM_strerror_r.ebp,FSM_strerror_r.esp);
         FSM_strerror_r.ebp = FSM_strerror_r.esp;
         FSM_strerror_r.esp = FSM_strerror_r.esp - 48;
         _loc1_ = int(FSM_strerror_r.ebp + -48);
         _loc2_ = int(li32(FSM_strerror_r.ebp + 8));
         _loc3_ = int(li32(FSM_strerror_r.ebp + 12));
         _loc4_ = li32(FSM_strerror_r.ebp + 16);
         _loc5_ = _loc3_;
         _loc6_ = int(_loc2_ + -1);
         if(uint(_loc6_) >= uint(92))
         {
            _loc6_ = 0;
            _loc7_ = _loc2_ >> 31;
            _loc8_ = _loc2_ + _loc7_;
            si8(_loc6_,FSM_strerror_r.ebp + -13);
            _loc6_ = _loc8_ ^ _loc7_;
            _loc7_ = -1;
            while(true)
            {
               _loc8_ = FSM_strerror_r;
               _loc9_ = uint(_loc6_) / uint(10);
               _loc10_ = _loc9_ * 10;
               _loc10_ = _loc6_ - _loc10_;
               _loc8_ = _loc8_ + _loc10_;
               _loc8_ = li8(_loc8_);
               si8(_loc8_,_loc1_ + 34);
               _loc1_ = int(_loc1_ + -1);
               _loc7_ = int(_loc7_ + 1);
               if(uint(_loc6_) >= uint(10))
               {
                  _loc6_ = int(_loc9_);
                  continue;
               }
               break;
            }
            if(_loc2_ >= 0)
            {
               _loc2_ = int(_loc1_ + 35);
            }
            else
            {
               _loc2_ = int(FSM_strerror_r.ebp + -48);
               _loc1_ = int(33 - _loc7_);
               _loc6_ = 45;
               _loc2_ = int(_loc2_ + _loc1_);
               si8(_loc6_,_loc2_);
            }
            _loc1_ = 32;
            si8(_loc1_,_loc2_ + -1);
            _loc1_ = 58;
            si8(_loc1_,_loc2_ + -2);
            FSM_strerror_r.esp = FSM_strerror_r.esp - 12;
            _loc1_ = int(FSM_strerror_r);
            si32(_loc3_,FSM_strerror_r.esp);
            si32(_loc1_,FSM_strerror_r.esp + 4);
            si32(_loc4_,FSM_strerror_r.esp + 8);
            FSM_strerror_r.esp = FSM_strerror_r.esp - 4;
            FSM_strerror_r.start();
            _loc1_ = int(FSM_strerror_r.eax);
            FSM_strerror_r.esp = FSM_strerror_r.esp + 12;
            _loc1_ = int(_loc2_ + -2);
            if(_loc4_ != 0)
            {
               _loc3_ = 0;
               _loc6_ = int(_loc4_ + -1);
               while(true)
               {
                  _loc7_ = int(_loc5_ + _loc3_);
                  _loc7_ = int(li8(_loc7_));
                  if(_loc7_ == 0)
                  {
                     _loc3_ = int(_loc5_ + _loc3_);
                     break;
                  }
                  _loc7_ = int(_loc3_ + 1);
                  if(_loc6_ != _loc3_)
                  {
                     _loc3_ = int(_loc7_);
                     continue;
                  }
                  _loc3_ = int(_loc5_ + _loc7_);
                  break;
               }
            }
            _loc5_ = _loc3_ - _loc5_;
            _loc1_ = int(li8(_loc1_));
            _loc6_ = int(_loc4_ - _loc5_);
            if(_loc5_ != _loc4_)
            {
               _loc1_ = _loc1_ & 255;
               if(_loc1_ != 0)
               {
                  _loc1_ = int(_loc6_);
                  while(true)
                  {
                     if(_loc1_ != 1)
                     {
                        _loc4_ = li8(_loc2_ + -2);
                        si8(_loc4_,_loc3_);
                        _loc1_ = int(_loc1_ + -1);
                        _loc3_ = int(_loc3_ + 1);
                     }
                     _loc4_ = li8(_loc2_ + -1);
                     _loc2_ = int(_loc2_ + 1);
                     if(_loc4_ != 0)
                     {
                        continue;
                     }
                     break;
                  }
                  _loc2_ = int(_loc3_);
               }
               else
               {
                  _loc2_ = int(_loc3_);
               }
               _loc3_ = 0;
               si8(_loc3_,_loc2_);
            }
            else
            {
               _loc3_ = _loc1_ & 255;
               if(_loc3_ != 0)
               {
                  _loc2_ = int(_loc2_ + -1);
                  while(true)
                  {
                     _loc3_ = int(li8(_loc2_));
                     _loc2_ = int(_loc2_ + 1);
                     if(_loc3_ != 0)
                     {
                        continue;
                     }
                     break;
                  }
               }
            }
            _loc2_ = 22;
            FSM_strerror_r.eax = _loc2_;
         }
         else
         {
            _loc1_ = int(FSM_strerror_r);
            _loc2_ = _loc2_ << 2;
            _loc1_ = int(_loc1_ + _loc2_);
            _loc1_ = int(li32(_loc1_));
            FSM_strerror_r.esp = FSM_strerror_r.esp - 12;
            si32(_loc3_,FSM_strerror_r.esp);
            si32(_loc1_,FSM_strerror_r.esp + 4);
            si32(_loc4_,FSM_strerror_r.esp + 8);
            FSM_strerror_r.esp = FSM_strerror_r.esp - 4;
            FSM_strerror_r.start();
            _loc1_ = int(FSM_strerror_r.eax);
            FSM_strerror_r.esp = FSM_strerror_r.esp + 12;
            _loc1_ = int(uint(_loc1_) < uint(_loc4_)?0:34);
            FSM_strerror_r.eax = _loc1_;
         }
         FSM_strerror_r.esp = FSM_strerror_r.ebp;
         FSM_strerror_r.ebp = li32(FSM_strerror_r.esp);
         FSM_strerror_r.esp = FSM_strerror_r.esp + 4;
         FSM_strerror_r.esp = FSM_strerror_r.esp + 4;
      }
   }
}
