package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.li8;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_strtoul extends Machine
   {
       
      
      public function FSM_strtoul()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:* = 0;
         var _loc2_:* = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:* = 0;
         var _loc6_:* = 0;
         var _loc7_:* = 0;
         var _loc8_:* = 0;
         var _loc9_:int = 0;
         var _loc10_:* = 0;
         var _loc11_:* = 0;
         FSM_strtoul.esp = FSM_strtoul.esp - 4;
         si32(FSM_strtoul.ebp,FSM_strtoul.esp);
         FSM_strtoul.ebp = FSM_strtoul.esp;
         FSM_strtoul.esp = FSM_strtoul.esp - 0;
         _loc1_ = 0;
         _loc2_ = int(li32(FSM_strtoul));
         _loc3_ = li32(FSM_strtoul.ebp + 8);
         _loc4_ = li32(FSM_strtoul.ebp + 12);
         _loc5_ = int(li32(FSM_strtoul.ebp + 16));
         _loc6_ = int(_loc3_);
         while(true)
         {
            _loc7_ = int(_loc6_ + _loc1_);
            _loc7_ = int(li8(_loc7_));
            _loc8_ = _loc7_ << 2;
            _loc8_ = int(_loc2_ + _loc8_);
            _loc8_ = int(li32(_loc8_ + 52));
            _loc1_ = int(_loc1_ + 1);
            _loc8_ = _loc8_ & 16384;
            if(_loc8_ != 0)
            {
               continue;
            }
            break;
         }
         _loc2_ = int(_loc3_ + _loc1_);
         _loc6_ = _loc7_ & 255;
         if(_loc6_ != 43)
         {
            _loc6_ = _loc7_ & 255;
            if(_loc6_ != 45)
            {
               _loc1_ = int(_loc7_);
            }
            else
            {
               _loc1_ = _loc1_ << 0;
               _loc1_ = int(_loc1_ + _loc3_);
               _loc2_ = int(li8(_loc2_));
               _loc1_ = int(_loc1_ + 1);
               if(_loc5_ != 0)
               {
                  if(_loc5_ != 16)
                  {
                     _loc6_ = 1;
                  }
                  addr327:
                  if(_loc5_ == 0)
                  {
                     _loc5_ = _loc2_ & 255;
                     if(_loc5_ == 48)
                     {
                        _loc5_ = 8;
                     }
                     else
                     {
                        _loc5_ = 10;
                     }
                  }
                  _loc7_ = int(_loc5_ + -2);
                  if(uint(_loc7_) >= uint(35))
                  {
                     _loc2_ = 0;
                     _loc5_ = int(_loc2_);
                     addr634:
                     _loc6_ = int(_loc2_);
                     _loc2_ = 22;
                     si32(_loc2_,FSM_strtoul);
                     addr710:
                     if(_loc4_ != 0)
                     {
                        _loc2_ = int(_loc5_);
                        _loc5_ = int(_loc6_);
                     }
                     else
                     {
                        _loc1_ = int(_loc6_);
                        addr706:
                        FSM_strtoul.eax = _loc1_;
                     }
                     addr710:
                     FSM_strtoul.esp = FSM_strtoul.ebp;
                     FSM_strtoul.ebp = li32(FSM_strtoul.esp);
                     FSM_strtoul.esp = FSM_strtoul.esp + 4;
                     FSM_strtoul.esp = FSM_strtoul.esp + 4;
                     return;
                  }
                  _loc7_ = 0;
                  _loc8_ = int(uint(-1) % uint(_loc5_));
                  _loc9_ = uint(-1) / uint(_loc5_);
                  _loc10_ = int(_loc7_);
                  loop1:
                  while(true)
                  {
                     _loc11_ = int(_loc2_ + -48);
                     _loc11_ = _loc11_ & 255;
                     if(uint(_loc11_) >= uint(10))
                     {
                        loop2:
                        while(true)
                        {
                           _loc11_ = int(_loc2_ + -65);
                           _loc11_ = _loc11_ & 255;
                           if(uint(_loc11_) <= uint(25))
                           {
                              _loc2_ = int(_loc2_ + -55);
                              _loc11_ = _loc2_ << 24;
                              _loc11_ = _loc11_ >> 24;
                              if(_loc11_ >= _loc5_)
                              {
                                 break;
                              }
                           }
                           else
                           {
                              _loc11_ = int(_loc2_ + -97);
                              _loc11_ = _loc11_ & 255;
                              if(uint(_loc11_) <= uint(25))
                              {
                                 _loc2_ = int(_loc2_ + -87);
                                 _loc11_ = _loc2_ << 24;
                                 _loc11_ = _loc11_ >> 24;
                                 if(_loc11_ < _loc5_)
                                 {
                                 }
                              }
                              break;
                           }
                           addr529:
                           while(uint(_loc7_) <= uint(_loc9_))
                           {
                              if(_loc10_ >= 0)
                              {
                                 if(_loc7_ == _loc9_)
                                 {
                                    _loc10_ = _loc2_ << 24;
                                    _loc10_ = _loc10_ >> 24;
                                    if(_loc10_ > _loc8_)
                                    {
                                       break;
                                    }
                                 }
                                 _loc2_ = _loc2_ << 24;
                                 _loc2_ = _loc2_ >> 24;
                                 _loc7_ = int(_loc7_ * _loc5_);
                                 _loc10_ = int(li8(_loc1_));
                                 _loc1_ = int(_loc1_ + 1);
                                 _loc7_ = int(_loc7_ + _loc2_);
                                 _loc2_ = int(_loc10_ + -48);
                                 _loc2_ = _loc2_ & 255;
                                 if(uint(_loc2_) >= uint(10))
                                 {
                                    _loc11_ = 1;
                                    _loc2_ = int(_loc10_);
                                    _loc10_ = int(_loc11_);
                                    continue loop2;
                                 }
                                 _loc11_ = 1;
                                 _loc2_ = int(_loc10_);
                                 _loc10_ = int(_loc11_);
                              }
                              break;
                           }
                           _loc10_ = -1;
                           _loc2_ = int(li8(_loc1_));
                           _loc1_ = int(_loc1_ + 1);
                           continue loop1;
                        }
                        _loc2_ = int(_loc10_);
                        if(_loc2_ <= -1)
                        {
                           _loc5_ = 34;
                           si32(_loc5_,FSM_strtoul);
                           if(_loc4_ != 0)
                           {
                              _loc5_ = -1;
                           }
                           else
                           {
                              _loc1_ = -1;
                              §§goto(addr706);
                           }
                           §§goto(addr710);
                        }
                        else if(_loc2_ == 0)
                        {
                           _loc5_ = int(_loc2_);
                           _loc2_ = int(_loc7_);
                           §§goto(addr634);
                        }
                        else
                        {
                           _loc5_ = _loc6_ & 1;
                           _loc6_ = int(0 - _loc7_);
                           _loc5_ = int(_loc5_ != 0?int(_loc6_):int(_loc7_));
                           if(_loc4_ == 0)
                           {
                              _loc1_ = int(_loc5_);
                              §§goto(addr706);
                           }
                           §§goto(addr710);
                        }
                     }
                     while(true)
                     {
                        _loc2_ = int(_loc2_ + -48);
                        _loc11_ = _loc2_ << 24;
                        _loc11_ = _loc11_ >> 24;
                        if(_loc11_ >= _loc5_)
                        {
                           _loc2_ = int(_loc10_);
                        }
                        else
                        {
                           §§goto(addr529);
                        }
                        §§goto(addr478);
                     }
                  }
                  if(_loc2_ != 0)
                  {
                     _loc1_ = int(_loc1_ + -1);
                     si32(_loc1_,_loc4_);
                  }
                  else
                  {
                     si32(_loc3_,_loc4_);
                  }
                  FSM_strtoul.eax = _loc5_;
                  §§goto(addr710);
               }
               _loc6_ = 1;
            }
            addr230:
            _loc7_ = _loc2_ & 255;
            if(_loc7_ == 48)
            {
               _loc7_ = int(li8(_loc1_));
               if(_loc7_ != 88)
               {
                  _loc7_ = _loc7_ & 255;
                  if(_loc7_ == 120)
                  {
                  }
                  addr239:
               }
               _loc7_ = int(li8(_loc1_ + 1));
               _loc8_ = int(_loc7_ + -48);
               _loc8_ = _loc8_ & 255;
               if(uint(_loc8_) >= uint(10))
               {
                  _loc8_ = int(_loc7_ + -65);
                  _loc8_ = _loc8_ & 255;
                  if(uint(_loc8_) >= uint(6))
                  {
                     _loc8_ = int(_loc7_ + -97);
                     _loc8_ = _loc8_ & 255;
                     if(uint(_loc8_) > uint(5))
                     {
                        §§goto(addr239);
                     }
                  }
               }
               _loc5_ = 16;
               _loc1_ = int(_loc1_ + 2);
               _loc2_ = int(_loc7_);
            }
            §§goto(addr327);
         }
         else
         {
            _loc1_ = _loc1_ << 0;
            _loc1_ = int(_loc1_ + _loc3_);
            _loc2_ = int(li8(_loc2_));
            _loc6_ = int(_loc1_ + 1);
            _loc1_ = int(_loc2_);
            _loc2_ = int(_loc6_);
         }
         _loc7_ = int(_loc2_);
         if(_loc5_ != 0)
         {
            if(_loc5_ != 16)
            {
               _loc2_ = 0;
               _loc6_ = int(_loc2_);
               _loc2_ = int(_loc1_);
               _loc1_ = int(_loc7_);
            }
            §§goto(addr327);
         }
         _loc6_ = 0;
         _loc2_ = int(_loc1_);
         _loc1_ = int(_loc7_);
         §§goto(addr230);
      }
   }
}
