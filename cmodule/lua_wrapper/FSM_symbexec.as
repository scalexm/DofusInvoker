package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.li8;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_symbexec extends Machine
   {
       
      
      public function FSM_symbexec()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:* = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:* = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:* = 0;
         var _loc8_:int = 0;
         var _loc9_:* = 0;
         var _loc10_:int = 0;
         var _loc11_:* = 0;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc15_:int = 0;
         var _loc16_:* = 0;
         var _loc17_:int = 0;
         var _loc18_:int = 0;
         var _loc19_:* = 0;
         var _loc20_:* = 0;
         var _loc21_:* = 0;
         var _loc22_:* = 0;
         var _loc23_:* = 0;
         var _loc24_:int = 0;
         var _loc25_:* = 0;
         var _loc26_:* = 0;
         var _loc27_:* = 0;
         var _loc28_:int = 0;
         var _loc29_:int = 0;
         var _loc30_:* = 0;
         FSM_symbexec.esp = FSM_symbexec.esp - 4;
         si32(FSM_symbexec.ebp,FSM_symbexec.esp);
         FSM_symbexec.ebp = FSM_symbexec.esp;
         FSM_symbexec.esp = FSM_symbexec.esp - 0;
         _loc1_ = int(li32(FSM_symbexec.ebp + 8));
         _loc2_ = li32(_loc1_ + 44);
         _loc3_ = li8(_loc1_ + 75);
         _loc4_ = int(_loc2_ + -1);
         _loc5_ = li32(FSM_symbexec.ebp + 12);
         _loc6_ = li32(FSM_symbexec.ebp + 16);
         if(uint(_loc3_) <= uint(250))
         {
            _loc7_ = int(li8(_loc1_ + 74));
            _loc8_ = li8(_loc1_ + 73);
            _loc9_ = _loc7_ & 1;
            _loc10_ = _loc7_;
            _loc11_ = _loc3_ & 255;
            _loc8_ = _loc9_ + _loc8_;
            if(_loc8_ <= _loc11_)
            {
               _loc7_ = _loc7_ & 4;
               if(_loc9_ == 0)
               {
                  if(_loc7_ == 0)
                  {
                  }
               }
               _loc7_ = int(li32(_loc1_ + 36));
               _loc8_ = li8(_loc1_ + 72);
               if(_loc7_ <= _loc8_)
               {
                  _loc7_ = int(li32(_loc1_ + 48));
                  _loc9_ = int(_loc7_ != 0?1:0);
                  _loc7_ = int(_loc7_ != _loc2_?1:0);
                  _loc7_ = _loc7_ & _loc9_;
                  if(_loc2_ >= 1)
                  {
                     _loc7_ = _loc7_ & 1;
                     if(_loc7_ == 0)
                     {
                        _loc7_ = int(li32(_loc1_ + 12));
                        _loc9_ = _loc4_ << 2;
                        _loc9_ = int(_loc7_ + _loc9_);
                        _loc9_ = int(li32(_loc9_));
                        _loc11_ = int(_loc7_);
                        _loc9_ = _loc9_ & 63;
                        if(_loc9_ == 30)
                        {
                           _loc9_ = 0;
                           _loc12_ = _loc1_ + 16;
                           _loc13_ = _loc1_ + 52;
                           _loc14_ = _loc1_ + 8;
                           _loc15_ = _loc1_ + 40;
                           loop0:
                           while(true)
                           {
                              _loc19_ = int(_loc4_);
                              _loc17_ = _loc9_;
                              if(_loc17_ < _loc5_)
                              {
                                 _loc18_ = 0;
                                 _loc4_ = _loc17_ << 2;
                                 _loc20_ = int(_loc7_ + _loc4_);
                                 _loc9_ = int(_loc17_ + 2);
                                 _loc16_ = int(_loc17_ + -131070);
                                 _loc4_ = int(_loc17_ + -131071);
                                 loop1:
                                 while(true)
                                 {
                                    _loc21_ = int(li32(_loc20_));
                                    _loc22_ = int(_loc21_ >>> 6);
                                    _loc22_ = _loc22_ & 255;
                                    _loc23_ = _loc21_ & 63;
                                    _loc24_ = _loc17_ + _loc18_;
                                    if(uint(_loc23_) <= uint(37))
                                    {
                                       _loc25_ = _loc3_ & 255;
                                       if(_loc25_ > _loc22_)
                                       {
                                          _loc25_ = int(FSM_symbexec);
                                          _loc25_ = int(_loc25_ + _loc23_);
                                          _loc25_ = int(li8(_loc25_));
                                          _loc26_ = _loc25_ & 3;
                                          if(_loc26_ != 0)
                                          {
                                             if(_loc26_ != 1)
                                             {
                                                if(_loc26_ != 2)
                                                {
                                                   _loc21_ = 0;
                                                   _loc26_ = int(_loc21_);
                                                }
                                                else
                                                {
                                                   _loc21_ = int(_loc21_ >>> 14);
                                                   _loc26_ = int(_loc21_ + -131071);
                                                   _loc27_ = int(_loc25_ >>> 4);
                                                   _loc27_ = _loc27_ & 3;
                                                   if(_loc27_ == 2)
                                                   {
                                                      _loc27_ = int(_loc16_ + _loc18_);
                                                      _loc27_ = int(_loc21_ + _loc27_);
                                                      if(_loc2_ > _loc27_)
                                                      {
                                                         if(_loc27_ >= 0)
                                                         {
                                                            if(_loc27_ >= 1)
                                                            {
                                                               _loc28_ = 0;
                                                               _loc29_ = _loc4_ + _loc18_;
                                                               _loc21_ = int(_loc21_ + _loc29_);
                                                               _loc21_ = _loc21_ << 2;
                                                               _loc21_ = int(_loc7_ + _loc21_);
                                                               while(true)
                                                               {
                                                                  _loc29_ = _loc21_;
                                                                  _loc21_ = int(_loc29_);
                                                                  if(_loc28_ < _loc27_)
                                                                  {
                                                                     _loc21_ = int(li32(_loc21_));
                                                                     _loc30_ = _loc21_ & 63;
                                                                     if(_loc30_ == 34)
                                                                     {
                                                                        _loc21_ = _loc21_ & 8372224;
                                                                        if(_loc21_ == 0)
                                                                        {
                                                                           _loc21_ = int(_loc29_ + -4);
                                                                           _loc28_ = _loc28_ + 1;
                                                                           continue;
                                                                        }
                                                                        break;
                                                                     }
                                                                     break;
                                                                  }
                                                                  break;
                                                               }
                                                               _loc21_ = _loc28_ & 1;
                                                               if(_loc21_ != 0)
                                                               {
                                                                  break;
                                                               }
                                                            }
                                                         }
                                                         break;
                                                      }
                                                      break;
                                                   }
                                                   _loc21_ = 0;
                                                }
                                                addr399:
                                                _loc27_ = _loc25_ << 24;
                                                _loc27_ = _loc27_ >> 24;
                                                if(_loc27_ <= -1)
                                                {
                                                   _loc27_ = int(_loc9_ + _loc18_);
                                                   if(_loc27_ < _loc2_)
                                                   {
                                                      _loc27_ = int(li32(_loc20_ + 4));
                                                      _loc27_ = _loc27_ & 63;
                                                      if(_loc27_ == 22)
                                                      {
                                                      }
                                                      break;
                                                   }
                                                   break;
                                                }
                                                if(_loc23_ <= 21)
                                                {
                                                   if(_loc23_ <= 6)
                                                   {
                                                      if(_loc23_ <= 3)
                                                      {
                                                         if(_loc23_ != 2)
                                                         {
                                                            if(_loc23_ == 3)
                                                            {
                                                               if(_loc26_ >= _loc6_)
                                                               {
                                                                  if(_loc22_ <= _loc6_)
                                                                  {
                                                                     _loc19_ = int(_loc18_ + 1);
                                                                     _loc20_ = int(_loc20_ + 4);
                                                                     _loc21_ = int(_loc17_ + _loc18_);
                                                                     _loc18_ = _loc17_ + _loc19_;
                                                                     if(_loc18_ < _loc5_)
                                                                     {
                                                                        _loc18_ = _loc19_;
                                                                        _loc19_ = int(_loc21_);
                                                                        continue;
                                                                     }
                                                                     _loc19_ = int(_loc17_ + _loc19_);
                                                                     _loc19_ = int(_loc19_ + -1);
                                                                  }
                                                               }
                                                            }
                                                            addr2103:
                                                            _loc4_ = _loc25_ & 64;
                                                            _loc4_ = int(_loc4_ != 0?1:0);
                                                            _loc9_ = int(_loc22_ == _loc6_?1:0);
                                                            _loc4_ = _loc4_ & _loc9_;
                                                            _loc4_ = _loc4_ & 1;
                                                            _loc4_ = int(_loc4_ != 0?int(_loc24_):int(_loc19_));
                                                            _loc9_ = int(_loc17_ + _loc18_);
                                                         }
                                                         else
                                                         {
                                                            _loc4_ = _loc25_ & 64;
                                                            _loc4_ = int(_loc4_ != 0?1:0);
                                                            _loc9_ = int(_loc22_ == _loc6_?1:0);
                                                            _loc4_ = _loc4_ & _loc9_;
                                                            _loc4_ = _loc4_ & 1;
                                                            _loc4_ = int(_loc4_ != 0?int(_loc24_):int(_loc19_));
                                                            if(_loc21_ != 1)
                                                            {
                                                               _loc9_ = int(_loc17_ + _loc18_);
                                                            }
                                                            else
                                                            {
                                                               _loc9_ = int(_loc24_ + 2);
                                                               if(_loc9_ < _loc2_)
                                                               {
                                                                  _loc9_ = _loc24_ << 2;
                                                                  _loc9_ = int(_loc9_ + _loc11_);
                                                                  _loc9_ = int(li32(_loc9_ + 4));
                                                                  _loc19_ = _loc9_ & 63;
                                                                  if(_loc19_ != 34)
                                                                  {
                                                                     _loc9_ = int(_loc17_ + _loc18_);
                                                                  }
                                                                  else
                                                                  {
                                                                     _loc9_ = _loc9_ & 8372224;
                                                                     if(_loc9_ != 0)
                                                                     {
                                                                        _loc9_ = int(_loc17_ + _loc18_);
                                                                     }
                                                                     else
                                                                     {
                                                                        break;
                                                                     }
                                                                  }
                                                               }
                                                               break;
                                                            }
                                                         }
                                                      }
                                                      else if(_loc23_ != 4)
                                                      {
                                                         if(_loc23_ != 5)
                                                         {
                                                            §§goto(addr2103);
                                                         }
                                                         else
                                                         {
                                                            addr804:
                                                            _loc4_ = _loc25_ & 64;
                                                            _loc9_ = int(li32(_loc14_));
                                                            _loc16_ = int(_loc26_ * 12);
                                                            _loc4_ = int(_loc4_ != 0?1:0);
                                                            _loc20_ = int(_loc22_ == _loc6_?1:0);
                                                            _loc4_ = _loc4_ & _loc20_;
                                                            _loc9_ = int(_loc9_ + _loc16_);
                                                            _loc9_ = int(li32(_loc9_ + 8));
                                                            _loc4_ = _loc4_ & 1;
                                                            _loc4_ = int(_loc4_ != 0?int(_loc24_):int(_loc19_));
                                                            if(_loc9_ == 4)
                                                            {
                                                               _loc9_ = int(_loc17_ + _loc18_);
                                                            }
                                                            else
                                                            {
                                                               break;
                                                            }
                                                         }
                                                      }
                                                      else
                                                      {
                                                         addr886:
                                                         _loc4_ = _loc25_ & 64;
                                                         _loc4_ = int(_loc4_ != 0?1:0);
                                                         _loc9_ = int(_loc22_ == _loc6_?1:0);
                                                         _loc4_ = _loc4_ & _loc9_;
                                                         _loc4_ = _loc4_ & 1;
                                                         _loc4_ = int(_loc4_ != 0?int(_loc24_):int(_loc19_));
                                                         _loc9_ = _loc8_ & 255;
                                                         if(_loc9_ > _loc26_)
                                                         {
                                                            _loc9_ = int(_loc17_ + _loc18_);
                                                         }
                                                         else
                                                         {
                                                            break;
                                                         }
                                                      }
                                                   }
                                                   else if(_loc23_ <= 10)
                                                   {
                                                      if(_loc23_ != 7)
                                                      {
                                                         if(_loc23_ != 8)
                                                         {
                                                            §§goto(addr2103);
                                                         }
                                                         else
                                                         {
                                                            §§goto(addr886);
                                                         }
                                                      }
                                                      else
                                                      {
                                                         §§goto(addr804);
                                                      }
                                                   }
                                                   else if(_loc23_ != 11)
                                                   {
                                                      if(_loc23_ != 21)
                                                      {
                                                         §§goto(addr2103);
                                                      }
                                                      else
                                                      {
                                                         _loc4_ = _loc25_ & 64;
                                                         _loc4_ = int(_loc4_ != 0?1:0);
                                                         _loc9_ = int(_loc22_ == _loc6_?1:0);
                                                         _loc4_ = _loc4_ & _loc9_;
                                                         _loc4_ = _loc4_ & 1;
                                                         _loc4_ = int(_loc4_ != 0?int(_loc24_):int(_loc19_));
                                                         if(_loc26_ < _loc21_)
                                                         {
                                                            _loc9_ = int(_loc17_ + _loc18_);
                                                         }
                                                         else
                                                         {
                                                            break;
                                                         }
                                                      }
                                                   }
                                                   else
                                                   {
                                                      _loc4_ = _loc25_ & 64;
                                                      _loc4_ = int(_loc4_ != 0?1:0);
                                                      _loc9_ = int(_loc22_ == _loc6_?1:0);
                                                      _loc4_ = _loc4_ & _loc9_;
                                                      _loc4_ = _loc4_ & 1;
                                                      _loc4_ = int(_loc4_ != 0?int(_loc24_):int(_loc19_));
                                                      _loc9_ = int(_loc22_ + 1);
                                                      _loc19_ = _loc3_ & 255;
                                                      if(_loc9_ < _loc19_)
                                                      {
                                                         if(_loc9_ != _loc6_)
                                                         {
                                                            _loc9_ = int(_loc17_ + _loc18_);
                                                         }
                                                         else
                                                         {
                                                            _loc4_ = int(_loc17_ + _loc18_);
                                                            _loc9_ = int(_loc24_ + 1);
                                                            continue loop0;
                                                         }
                                                      }
                                                      else
                                                      {
                                                         break;
                                                      }
                                                   }
                                                }
                                                else if(_loc23_ <= 32)
                                                {
                                                   if(_loc23_ <= 29)
                                                   {
                                                      if(_loc23_ != 22)
                                                      {
                                                         _loc4_ = int(_loc23_ + -28);
                                                         if(uint(_loc4_) >= uint(2))
                                                         {
                                                            §§goto(addr2103);
                                                         }
                                                         else
                                                         {
                                                            _loc4_ = _loc25_ & 64;
                                                            _loc4_ = int(_loc4_ != 0?1:0);
                                                            _loc9_ = int(_loc22_ == _loc6_?1:0);
                                                            _loc4_ = _loc4_ & _loc9_;
                                                            _loc4_ = _loc4_ & 1;
                                                            _loc4_ = int(_loc4_ != 0?int(_loc24_):int(_loc19_));
                                                            if(_loc26_ != 0)
                                                            {
                                                               _loc9_ = int(_loc22_ + _loc26_);
                                                               _loc9_ = int(_loc9_ + -1);
                                                               _loc19_ = _loc3_ & 255;
                                                               if(_loc9_ < _loc19_)
                                                               {
                                                               }
                                                               break;
                                                            }
                                                            _loc9_ = int(_loc21_ + -1);
                                                            if(_loc21_ == 0)
                                                            {
                                                               _loc9_ = 1;
                                                               _loc19_ = _loc24_ << 2;
                                                               _loc19_ = int(_loc19_ + _loc11_);
                                                               _loc19_ = int(li32(_loc19_ + 4));
                                                               _loc16_ = _loc19_ & 63;
                                                               _loc16_ = int(_loc16_ + -28);
                                                               _loc9_ = _loc9_ << _loc16_;
                                                               if(uint(_loc16_) <= uint(6))
                                                               {
                                                                  _loc9_ = _loc9_ & 71;
                                                                  if(_loc9_ == 0)
                                                                  {
                                                                     break;
                                                                  }
                                                                  if(uint(_loc19_) > uint(8388607))
                                                                  {
                                                                     break;
                                                                  }
                                                               }
                                                               break;
                                                            }
                                                            if(_loc21_ != 1)
                                                            {
                                                               _loc9_ = int(_loc22_ + _loc9_);
                                                               _loc9_ = int(_loc9_ + -1);
                                                               _loc19_ = _loc3_ & 255;
                                                               if(_loc9_ >= _loc19_)
                                                               {
                                                                  break;
                                                               }
                                                            }
                                                            if(_loc22_ > _loc6_)
                                                            {
                                                               _loc9_ = int(_loc17_ + _loc18_);
                                                            }
                                                            else
                                                            {
                                                               _loc4_ = int(_loc17_ + _loc18_);
                                                               _loc9_ = int(_loc24_ + 1);
                                                               continue loop0;
                                                            }
                                                         }
                                                      }
                                                      else
                                                      {
                                                         _loc4_ = _loc25_ & 64;
                                                         _loc4_ = int(_loc4_ != 0?1:0);
                                                         _loc9_ = int(_loc22_ == _loc6_?1:0);
                                                         _loc4_ = _loc4_ & _loc9_;
                                                         _loc4_ = _loc4_ & 1;
                                                         _loc4_ = int(_loc4_ != 0?int(_loc24_):int(_loc19_));
                                                         addr1745:
                                                         _loc9_ = int(_loc24_ + _loc26_);
                                                         _loc9_ = int(_loc9_ + 1);
                                                         _loc19_ = int(_loc6_ == 255?1:0);
                                                         _loc16_ = int(_loc24_ >= _loc9_?1:0);
                                                         _loc19_ = _loc16_ | _loc19_;
                                                         if(_loc9_ <= _loc5_)
                                                         {
                                                            _loc19_ = _loc19_ & 1;
                                                            if(_loc19_ == 0)
                                                            {
                                                               continue loop0;
                                                            }
                                                         }
                                                         _loc9_ = int(_loc17_ + _loc18_);
                                                      }
                                                   }
                                                   else if(_loc23_ != 30)
                                                   {
                                                      _loc4_ = int(_loc23_ + -31);
                                                      if(uint(_loc4_) >= uint(2))
                                                      {
                                                         §§goto(addr2103);
                                                      }
                                                      else
                                                      {
                                                         _loc4_ = _loc25_ & 64;
                                                         _loc4_ = int(_loc4_ != 0?1:0);
                                                         _loc9_ = int(_loc22_ == _loc6_?1:0);
                                                         _loc4_ = _loc4_ & _loc9_;
                                                         _loc4_ = _loc4_ & 1;
                                                         _loc4_ = int(_loc4_ != 0?int(_loc24_):int(_loc19_));
                                                         _loc9_ = _loc3_ & 255;
                                                         _loc19_ = int(_loc22_ + 3);
                                                         if(_loc19_ < _loc9_)
                                                         {
                                                            §§goto(addr1745);
                                                         }
                                                         else
                                                         {
                                                            break;
                                                         }
                                                      }
                                                   }
                                                   else
                                                   {
                                                      _loc4_ = _loc25_ & 64;
                                                      _loc4_ = int(_loc4_ != 0?1:0);
                                                      _loc9_ = int(_loc22_ == _loc6_?1:0);
                                                      _loc4_ = _loc4_ & _loc9_;
                                                      _loc4_ = _loc4_ & 1;
                                                      _loc4_ = int(_loc4_ != 0?int(_loc24_):int(_loc19_));
                                                      _loc9_ = int(_loc26_ + -1);
                                                      if(_loc9_ <= 0)
                                                      {
                                                         _loc9_ = int(_loc17_ + _loc18_);
                                                      }
                                                      else
                                                      {
                                                         _loc9_ = int(_loc22_ + _loc9_);
                                                         _loc9_ = int(_loc9_ + -1);
                                                         _loc19_ = _loc3_ & 255;
                                                         if(_loc9_ < _loc19_)
                                                         {
                                                            _loc9_ = int(_loc17_ + _loc18_);
                                                         }
                                                         else
                                                         {
                                                            break;
                                                         }
                                                      }
                                                   }
                                                }
                                                else if(_loc23_ <= 35)
                                                {
                                                   if(_loc23_ != 33)
                                                   {
                                                      if(_loc23_ != 34)
                                                      {
                                                         §§goto(addr2103);
                                                      }
                                                      else
                                                      {
                                                         _loc4_ = _loc25_ & 64;
                                                         _loc4_ = int(_loc4_ != 0?1:0);
                                                         _loc9_ = int(_loc22_ == _loc6_?1:0);
                                                         _loc4_ = _loc4_ & _loc9_;
                                                         _loc4_ = _loc4_ & 1;
                                                         _loc4_ = int(_loc4_ != 0?int(_loc24_):int(_loc19_));
                                                         if(_loc26_ >= 1)
                                                         {
                                                            _loc9_ = _loc3_ & 255;
                                                            _loc19_ = int(_loc26_ + _loc22_);
                                                            if(_loc19_ < _loc9_)
                                                            {
                                                            }
                                                            break;
                                                         }
                                                         if(_loc21_ != 0)
                                                         {
                                                            _loc9_ = int(_loc17_ + _loc18_);
                                                         }
                                                         else
                                                         {
                                                            _loc9_ = int(_loc24_ + 1);
                                                            _loc19_ = int(_loc2_ + -1);
                                                            if(_loc19_ <= _loc9_)
                                                            {
                                                               break;
                                                            }
                                                         }
                                                      }
                                                   }
                                                   else
                                                   {
                                                      _loc4_ = _loc25_ & 64;
                                                      _loc4_ = int(_loc4_ != 0?1:0);
                                                      _loc9_ = int(_loc22_ == _loc6_?1:0);
                                                      _loc4_ = _loc4_ & _loc9_;
                                                      _loc4_ = _loc4_ & 1;
                                                      _loc4_ = int(_loc4_ != 0?int(_loc24_):int(_loc19_));
                                                      if(_loc21_ >= 1)
                                                      {
                                                         _loc9_ = int(_loc22_ + 2);
                                                         _loc19_ = _loc3_ & 255;
                                                         _loc16_ = int(_loc9_ + _loc21_);
                                                         if(_loc16_ < _loc19_)
                                                         {
                                                            if(_loc9_ > _loc6_)
                                                            {
                                                               _loc9_ = int(_loc17_ + _loc18_);
                                                            }
                                                            else
                                                            {
                                                               _loc4_ = int(_loc17_ + _loc18_);
                                                               _loc9_ = int(_loc24_ + 1);
                                                               continue loop0;
                                                            }
                                                         }
                                                         else
                                                         {
                                                            break;
                                                         }
                                                      }
                                                      break;
                                                   }
                                                }
                                                else if(_loc23_ != 36)
                                                {
                                                   if(_loc23_ != 37)
                                                   {
                                                      §§goto(addr2103);
                                                   }
                                                   else
                                                   {
                                                      _loc4_ = _loc25_ & 64;
                                                      _loc4_ = int(_loc4_ != 0?1:0);
                                                      _loc9_ = int(_loc22_ == _loc6_?1:0);
                                                      _loc4_ = _loc4_ & _loc9_;
                                                      _loc4_ = _loc4_ & 1;
                                                      _loc4_ = int(_loc4_ != 0?int(_loc24_):int(_loc19_));
                                                      _loc9_ = _loc10_ & 255;
                                                      _loc19_ = _loc10_ & 2;
                                                      if(_loc19_ != 0)
                                                      {
                                                         _loc9_ = _loc9_ & 4;
                                                         if(_loc9_ == 0)
                                                         {
                                                            _loc9_ = int(_loc26_ + -1);
                                                            if(_loc26_ == 0)
                                                            {
                                                               _loc19_ = 1;
                                                               _loc16_ = _loc24_ << 2;
                                                               _loc16_ = int(_loc16_ + _loc11_);
                                                               _loc16_ = int(li32(_loc16_ + 4));
                                                               _loc20_ = _loc16_ & 63;
                                                               _loc20_ = int(_loc20_ + -28);
                                                               _loc19_ = _loc19_ << _loc20_;
                                                               if(uint(_loc20_) <= uint(6))
                                                               {
                                                                  _loc19_ = _loc19_ & 71;
                                                                  if(_loc19_ == 0)
                                                                  {
                                                                     break;
                                                                  }
                                                                  if(uint(_loc16_) <= uint(8388607))
                                                                  {
                                                                  }
                                                                  break;
                                                               }
                                                               break;
                                                            }
                                                            _loc9_ = int(_loc22_ + _loc9_);
                                                            _loc9_ = int(_loc9_ + -1);
                                                            _loc19_ = _loc3_ & 255;
                                                            if(_loc9_ < _loc19_)
                                                            {
                                                               _loc9_ = int(_loc17_ + _loc18_);
                                                            }
                                                            else
                                                            {
                                                               break;
                                                            }
                                                         }
                                                         break;
                                                      }
                                                      break;
                                                   }
                                                }
                                                else
                                                {
                                                   _loc4_ = _loc25_ & 64;
                                                   _loc4_ = int(_loc4_ != 0?1:0);
                                                   _loc9_ = int(_loc22_ == _loc6_?1:0);
                                                   _loc4_ = _loc4_ & _loc9_;
                                                   _loc4_ = _loc4_ & 1;
                                                   _loc9_ = int(li32(_loc13_));
                                                   _loc4_ = int(_loc4_ != 0?int(_loc24_):int(_loc19_));
                                                   if(_loc9_ > _loc26_)
                                                   {
                                                      _loc9_ = int(li32(_loc12_));
                                                      _loc19_ = _loc26_ << 2;
                                                      _loc9_ = int(_loc9_ + _loc19_);
                                                      _loc9_ = int(li32(_loc9_));
                                                      _loc9_ = int(li8(_loc9_ + 72));
                                                      _loc19_ = int(_loc9_ + _loc24_);
                                                      if(_loc19_ < _loc2_)
                                                      {
                                                         _loc19_ = 1;
                                                         _loc16_ = _loc17_ << 2;
                                                         _loc20_ = _loc18_ << 2;
                                                         _loc16_ = int(_loc7_ + _loc16_);
                                                         _loc16_ = int(_loc16_ + _loc20_);
                                                         _loc16_ = int(_loc16_ + 4);
                                                         while(true)
                                                         {
                                                            _loc20_ = int(_loc16_);
                                                            _loc16_ = int(_loc19_);
                                                            _loc19_ = int(_loc20_);
                                                            if(_loc16_ > _loc9_)
                                                            {
                                                               break;
                                                            }
                                                            _loc19_ = int(li32(_loc19_));
                                                            _loc19_ = _loc19_ & 63;
                                                            if(_loc19_ != 0)
                                                            {
                                                               if(_loc19_ != 4)
                                                               {
                                                                  break loop1;
                                                               }
                                                            }
                                                            _loc19_ = int(_loc20_ + 4);
                                                            _loc20_ = int(_loc16_ + 1);
                                                            _loc16_ = int(_loc19_);
                                                            _loc19_ = int(_loc20_);
                                                         }
                                                         if(_loc6_ == 255)
                                                         {
                                                            _loc9_ = int(_loc17_ + _loc18_);
                                                         }
                                                         else
                                                         {
                                                            _loc9_ = int(_loc24_ + _loc9_);
                                                            _loc9_ = int(_loc9_ + 1);
                                                            continue loop0;
                                                         }
                                                      }
                                                      break;
                                                   }
                                                   break;
                                                }
                                                _loc9_ = int(_loc9_ + 1);
                                                continue loop0;
                                             }
                                             _loc26_ = int(_loc25_ >>> 4);
                                             _loc21_ = int(_loc21_ >>> 14);
                                             _loc26_ = _loc26_ & 3;
                                             if(_loc26_ == 3)
                                             {
                                                _loc26_ = int(li32(_loc15_));
                                                if(_loc26_ <= _loc21_)
                                                {
                                                }
                                                break;
                                             }
                                             _loc27_ = 0;
                                             _loc26_ = int(_loc21_);
                                             _loc21_ = int(_loc27_);
                                          }
                                          else
                                          {
                                             _loc26_ = int(_loc25_ >>> 4);
                                             FSM_symbexec.esp = FSM_symbexec.esp - 12;
                                             _loc26_ = _loc26_ & 3;
                                             _loc27_ = int(_loc21_ >>> 23);
                                             si32(_loc1_,FSM_symbexec.esp);
                                             si32(_loc27_,FSM_symbexec.esp + 4);
                                             si32(_loc26_,FSM_symbexec.esp + 8);
                                             FSM_symbexec.esp = FSM_symbexec.esp - 4;
                                             FSM_symbexec.start();
                                             _loc26_ = int(FSM_symbexec.eax);
                                             _loc21_ = int(_loc21_ >>> 14);
                                             FSM_symbexec.esp = FSM_symbexec.esp + 12;
                                             _loc21_ = _loc21_ & 511;
                                             if(_loc26_ != 0)
                                             {
                                                _loc26_ = int(_loc25_ >>> 2);
                                                FSM_symbexec.esp = FSM_symbexec.esp - 12;
                                                _loc26_ = _loc26_ & 3;
                                                si32(_loc1_,FSM_symbexec.esp);
                                                si32(_loc21_,FSM_symbexec.esp + 4);
                                                si32(_loc26_,FSM_symbexec.esp + 8);
                                                FSM_symbexec.esp = FSM_symbexec.esp - 4;
                                                FSM_symbexec.start();
                                                _loc26_ = int(FSM_symbexec.eax);
                                                FSM_symbexec.esp = FSM_symbexec.esp + 12;
                                                if(_loc26_ != 0)
                                                {
                                                   _loc26_ = int(_loc27_);
                                                }
                                                break;
                                             }
                                             break;
                                          }
                                          §§goto(addr399);
                                       }
                                       break;
                                    }
                                    break;
                                 }
                              }
                              _loc1_ = int(_loc19_);
                              _loc1_ = _loc1_ << 2;
                              _loc1_ = int(_loc11_ + _loc1_);
                              _loc1_ = int(li32(_loc1_));
                              break;
                           }
                           FSM_symbexec.eax = _loc1_;
                           FSM_symbexec.esp = FSM_symbexec.ebp;
                           FSM_symbexec.ebp = li32(FSM_symbexec.esp);
                           FSM_symbexec.esp = FSM_symbexec.esp + 4;
                           FSM_symbexec.esp = FSM_symbexec.esp + 4;
                           return;
                        }
                     }
                  }
               }
            }
         }
         _loc1_ = 0;
         §§goto(addr2199);
      }
   }
}
