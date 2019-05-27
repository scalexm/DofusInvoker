package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_time2sub extends Machine
   {
       
      
      public function FSM_time2sub()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:* = 0;
         var _loc5_:* = 0;
         var _loc6_:* = 0;
         var _loc7_:* = 0;
         var _loc8_:* = 0;
         var _loc9_:int = 0;
         var _loc10_:* = 0;
         var _loc11_:* = 0;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc15_:int = 0;
         var _loc16_:int = 0;
         var _loc17_:int = 0;
         var _loc18_:int = 0;
         var _loc19_:int = 0;
         var _loc20_:int = 0;
         var _loc21_:int = 0;
         var _loc22_:int = 0;
         var _loc23_:int = 0;
         var _loc24_:int = 0;
         var _loc25_:int = 0;
         var _loc26_:int = 0;
         var _loc27_:int = 0;
         FSM_time2sub.esp = FSM_time2sub.esp - 4;
         si32(FSM_time2sub.ebp,FSM_time2sub.esp);
         FSM_time2sub.ebp = FSM_time2sub.esp;
         FSM_time2sub.esp = FSM_time2sub.esp - 48;
         _loc1_ = 0;
         _loc2_ = li32(FSM_time2sub.ebp + 12);
         _loc3_ = li32(FSM_time2sub.ebp + 8);
         si32(_loc1_,_loc2_);
         _loc1_ = li32(_loc3_);
         _loc4_ = int(li32(_loc3_ + 4));
         _loc5_ = int(li32(_loc3_ + 8));
         _loc6_ = int(li32(_loc3_ + 12));
         _loc7_ = int(li32(_loc3_ + 16));
         _loc8_ = int(li32(_loc3_ + 20));
         _loc9_ = li32(_loc3_ + 32);
         _loc10_ = int(li32(FSM_time2sub.ebp + 16));
         if(_loc10_ != 0)
         {
            if(_loc1_ >= 0)
            {
               _loc10_ = int(_loc1_ / 60);
               _loc11_ = int(_loc1_ < -59?1:0);
               _loc12_ = _loc4_ + _loc10_;
               _loc13_ = _loc12_;
            }
            else
            {
               _loc10_ = _loc1_ ^ -1;
               _loc11_ = int(_loc10_ / 60);
               _loc11_ = _loc11_ ^ -1;
               _loc14_ = _loc10_ > -60?1:0;
               _loc12_ = _loc4_ + _loc11_;
               _loc13_ = _loc12_;
               _loc10_ = int(_loc11_);
               _loc11_ = int(_loc14_);
            }
            _loc4_ = int(_loc12_ < _loc4_?1:0);
            _loc10_ = int(_loc10_ * 60);
            _loc4_ = _loc4_ ^ _loc11_;
            _loc1_ = _loc1_ - _loc10_;
            _loc4_ = _loc4_ & 1;
            if(_loc4_ == 0)
            {
               _loc4_ = int(_loc13_);
            }
            break loop0;
         }
         if(_loc4_ >= 0)
         {
            _loc10_ = int(_loc4_ / 60);
            _loc11_ = int(_loc4_ < -59?1:0);
            _loc12_ = _loc5_ + _loc10_;
            _loc13_ = _loc12_;
         }
         else
         {
            _loc10_ = _loc4_ ^ -1;
            _loc11_ = int(_loc10_ / 60);
            _loc11_ = _loc11_ ^ -1;
            _loc14_ = _loc10_ > -60?1:0;
            _loc12_ = _loc5_ + _loc11_;
            _loc13_ = _loc12_;
            _loc10_ = int(_loc11_);
            _loc11_ = int(_loc14_);
         }
         _loc5_ = int(_loc12_ < _loc5_?1:0);
         _loc10_ = int(_loc10_ * 60);
         _loc5_ = _loc5_ ^ _loc11_;
         _loc4_ = int(_loc4_ - _loc10_);
         _loc5_ = _loc5_ & 1;
         if(_loc5_ == 0)
         {
            if(_loc13_ >= 0)
            {
               _loc5_ = int(_loc13_ / 24);
               _loc10_ = int(_loc13_ < -23?1:0);
               _loc11_ = int(_loc6_ + _loc5_);
               _loc12_ = _loc11_;
            }
            else
            {
               _loc5_ = _loc13_ ^ -1;
               _loc10_ = int(_loc5_ / 24);
               _loc10_ = _loc10_ ^ -1;
               _loc14_ = _loc5_ > -24?1:0;
               _loc11_ = int(_loc6_ + _loc10_);
               _loc12_ = _loc11_;
               _loc5_ = int(_loc10_);
               _loc10_ = int(_loc14_);
            }
            _loc6_ = int(_loc11_ < _loc6_?1:0);
            _loc5_ = int(_loc5_ * 24);
            _loc6_ = _loc6_ ^ _loc10_;
            _loc5_ = int(_loc13_ - _loc5_);
            _loc6_ = _loc6_ & 1;
            if(_loc6_ == 0)
            {
               if(_loc7_ >= 0)
               {
                  _loc6_ = int(_loc7_ / 12);
                  _loc10_ = int(_loc7_ < -11?1:0);
                  _loc11_ = int(_loc8_ + _loc6_);
                  _loc13_ = _loc11_;
               }
               else
               {
                  _loc6_ = _loc7_ ^ -1;
                  _loc10_ = int(_loc6_ / 12);
                  _loc10_ = _loc10_ ^ -1;
                  _loc14_ = _loc6_ > -12?1:0;
                  _loc11_ = int(_loc8_ + _loc10_);
                  _loc13_ = _loc11_;
                  _loc6_ = int(_loc10_);
                  _loc10_ = int(_loc14_);
               }
               _loc8_ = int(_loc11_ < _loc8_?1:0);
               _loc6_ = int(_loc6_ * 12);
               _loc8_ = _loc8_ ^ _loc10_;
               _loc6_ = int(_loc7_ - _loc6_);
               _loc7_ = _loc8_ & 1;
               if(_loc7_ == 0)
               {
                  _loc7_ = int(_loc13_ + 1900);
                  if(_loc7_ >= _loc13_)
                  {
                     if(_loc12_ >= 1)
                     {
                        _loc13_ = _loc7_;
                        _loc7_ = int(_loc12_);
                        _loc10_ = int(_loc13_);
                        _loc13_ = 0;
                        _loc8_ = int(_loc6_ > 1?1:0);
                        _loc8_ = _loc8_ & 1;
                        _loc11_ = int(_loc10_ + _loc8_);
                        _loc12_ = _loc10_;
                        continue loop1;
                     }
                     _loc8_ = int(_loc6_ > 1?1:0);
                     _loc8_ = _loc8_ & 1;
                     _loc8_ = int(_loc8_ + 1899);
                     _loc10_ = int(_loc7_);
                     _loc7_ = int(_loc12_);
                     continue loop0;
                  }
                  break loop0;
               }
               break loop0;
            }
            break loop0;
         }
         break loop0;
      }
   }
}
