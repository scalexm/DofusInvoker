package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.li8;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM___hexnan_D2A extends Machine
   {
       
      
      public function FSM___hexnan_D2A()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:int = 0;
         var _loc2_:* = 0;
         var _loc3_:int = 0;
         var _loc4_:* = 0;
         var _loc5_:* = 0;
         var _loc6_:* = 0;
         var _loc7_:int = 0;
         var _loc8_:* = 0;
         var _loc9_:* = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:* = 0;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc15_:int = 0;
         FSM___hexnan_D2A.esp = FSM___hexnan_D2A.esp - 4;
         si32(FSM___hexnan_D2A.ebp,FSM___hexnan_D2A.esp);
         FSM___hexnan_D2A.ebp = FSM___hexnan_D2A.esp;
         FSM___hexnan_D2A.esp = FSM___hexnan_D2A.esp - 0;
         _loc1_ = li32(FSM___hexnan_D2A.ebp + 8);
         _loc2_ = int(li32(FSM___hexnan_D2A.ebp + 12));
         _loc3_ = li32(FSM___hexnan_D2A.ebp + 16);
         _loc4_ = int(li8(FSM___hexnan_D2A + 48));
         _loc5_ = int(_loc3_);
         if(_loc4_ == 0)
         {
            FSM___hexnan_D2A.esp = FSM___hexnan_D2A.esp - 4;
            FSM___hexnan_D2A.start();
         }
         _loc2_ = int(li32(_loc2_));
         _loc4_ = _loc2_ & 31;
         _loc2_ = _loc2_ >> 5;
         if(_loc4_ != 0)
         {
            _loc6_ = 0;
            _loc2_ = _loc2_ << 2;
            _loc2_ = int(_loc3_ + _loc2_);
            si32(_loc6_,_loc2_);
            _loc6_ = int(li32(_loc1_));
            _loc7_ = li8(_loc6_ + 1);
            _loc8_ = int(_loc6_ + 1);
            if(_loc7_ != 0)
            {
               _loc9_ = 0;
               _loc10_ = _loc2_;
               _loc11_ = _loc9_;
               _loc12_ = int(_loc9_);
               _loc13_ = _loc2_;
               addr177:
               while(true)
               {
                  _loc14_ = _loc9_;
                  _loc15_ = _loc8_;
                  _loc8_ = int(FSM___hexnan_D2A);
                  _loc9_ = _loc7_ & 255;
                  _loc8_ = int(_loc8_ + _loc9_);
                  _loc8_ = int(li8(_loc8_));
                  _loc9_ = int(_loc2_);
                  if(_loc8_ == 0)
                  {
                     _loc8_ = _loc7_ & 255;
                     if(uint(_loc8_) <= uint(32))
                     {
                        if(_loc11_ >= _loc14_)
                        {
                           _loc8_ = int(_loc10_);
                           _loc9_ = int(_loc11_);
                           _loc10_ = _loc12_;
                           _loc6_ = int(_loc14_);
                           _loc7_ = _loc15_;
                           _loc11_ = _loc13_;
                        }
                        else
                        {
                           if(uint(_loc2_) < uint(_loc13_))
                           {
                              if(_loc12_ <= 7)
                              {
                                 _loc6_ = int(8 - _loc12_);
                                 _loc6_ = _loc6_ << 2;
                                 _loc7_ = 32 - _loc6_;
                                 _loc8_ = int(_loc9_);
                                 while(true)
                                 {
                                    _loc9_ = int(li32(_loc8_ + 4));
                                    _loc12_ = int(li32(_loc8_));
                                    _loc9_ = _loc9_ << _loc7_;
                                    _loc9_ = _loc9_ | _loc12_;
                                    si32(_loc9_,_loc8_);
                                    _loc9_ = int(li32(_loc8_ + 4));
                                    _loc9_ = int(_loc9_ >>> _loc6_);
                                    si32(_loc9_,_loc8_ + 4);
                                    _loc8_ = int(_loc8_ + 4);
                                    if(uint(_loc8_) < uint(_loc13_))
                                    {
                                       continue;
                                    }
                                    break;
                                 }
                              }
                           }
                           if(uint(_loc2_) <= uint(_loc3_))
                           {
                              _loc6_ = 8;
                              _loc8_ = int(_loc10_);
                              _loc9_ = int(_loc11_);
                              _loc10_ = _loc6_;
                              _loc6_ = int(_loc14_);
                              _loc7_ = _loc15_;
                              _loc11_ = _loc13_;
                           }
                           else
                           {
                              _loc6_ = 0;
                              si32(_loc6_,_loc2_ + -4);
                              _loc2_ = int(_loc2_ + -4);
                              _loc8_ = int(_loc10_);
                              _loc9_ = int(_loc14_);
                              _loc10_ = _loc6_;
                              _loc6_ = int(_loc14_);
                              _loc7_ = _loc15_;
                              _loc11_ = _loc2_;
                           }
                        }
                     }
                     else
                     {
                        _loc8_ = _loc7_ & 255;
                        if(_loc8_ == 41)
                        {
                           if(_loc14_ == 0)
                           {
                              break;
                           }
                           _loc8_ = int(_loc6_ + 2);
                           si32(_loc8_,_loc1_);
                           if(_loc14_ != 0)
                           {
                              _loc8_ = int(_loc10_);
                              _loc6_ = int(_loc12_);
                              _loc7_ = _loc13_;
                              addr680:
                              _loc1_ = _loc8_;
                              _loc8_ = int(_loc1_);
                              _loc9_ = int(_loc2_);
                              if(uint(_loc2_) < uint(_loc7_))
                              {
                                 if(_loc6_ <= 7)
                                 {
                                    _loc6_ = int(8 - _loc6_);
                                    _loc6_ = _loc6_ << 2;
                                    _loc10_ = 32 - _loc6_;
                                    _loc11_ = _loc9_;
                                    while(true)
                                    {
                                       _loc12_ = int(li32(_loc11_ + 4));
                                       _loc13_ = li32(_loc11_);
                                       _loc12_ = _loc12_ << _loc10_;
                                       _loc12_ = _loc12_ | _loc13_;
                                       si32(_loc12_,_loc11_);
                                       _loc12_ = int(li32(_loc11_ + 4));
                                       _loc12_ = int(_loc12_ >>> _loc6_);
                                       si32(_loc12_,_loc11_ + 4);
                                       _loc11_ = _loc11_ + 4;
                                       if(uint(_loc11_) < uint(_loc7_))
                                       {
                                          continue;
                                       }
                                       break;
                                    }
                                 }
                              }
                              if(uint(_loc2_) > uint(_loc3_))
                              {
                                 _loc2_ = 0;
                                 _loc4_ = int(_loc2_);
                                 while(true)
                                 {
                                    _loc6_ = int(_loc9_ + _loc4_);
                                    _loc6_ = int(li32(_loc6_));
                                    _loc7_ = _loc5_ + _loc4_;
                                    _loc4_ = int(_loc4_ + 4);
                                    si32(_loc6_,_loc7_);
                                    _loc2_ = int(_loc2_ + 1);
                                    _loc6_ = int(_loc9_ + _loc4_);
                                    if(uint(_loc6_) <= uint(_loc1_))
                                    {
                                       continue;
                                    }
                                    break;
                                 }
                                 _loc4_ = 0;
                                 while(true)
                                 {
                                    _loc5_ = 0;
                                    _loc6_ = int(_loc2_ + _loc4_);
                                    _loc4_ = int(_loc4_ + 1);
                                    _loc6_ = _loc6_ << 2;
                                    _loc7_ = _loc2_ + _loc4_;
                                    _loc6_ = int(_loc3_ + _loc6_);
                                    si32(_loc5_,_loc6_);
                                    _loc5_ = _loc7_ << 2;
                                    _loc5_ = int(_loc3_ + _loc5_);
                                    if(uint(_loc5_) <= uint(_loc1_))
                                    {
                                       continue;
                                    }
                                    break;
                                 }
                              }
                              else if(_loc4_ != 0)
                              {
                                 _loc2_ = -1;
                                 _loc4_ = int(32 - _loc4_);
                                 _loc5_ = int(li32(_loc1_));
                                 _loc2_ = int(_loc2_ >>> _loc4_);
                                 _loc2_ = _loc5_ & _loc2_;
                                 si32(_loc2_,_loc1_);
                              }
                              _loc2_ = int(li32(_loc1_));
                              if(_loc2_ == 0)
                              {
                                 _loc2_ = 0;
                                 _loc4_ = int(_loc8_);
                                 while(true)
                                 {
                                    _loc5_ = int(_loc4_);
                                    if(_loc4_ == _loc3_)
                                    {
                                       _loc2_ = 1;
                                       si32(_loc2_,_loc5_);
                                       _loc2_ = 5;
                                       FSM___hexnan_D2A.eax = _loc2_;
                                       break;
                                    }
                                    _loc5_ = _loc2_ ^ 1073741823;
                                    _loc5_ = _loc5_ << 2;
                                    _loc5_ = int(_loc1_ + _loc5_);
                                    _loc5_ = int(li32(_loc5_));
                                    _loc4_ = int(_loc4_ + -4);
                                    _loc2_ = int(_loc2_ + 1);
                                    if(_loc5_ == 0)
                                    {
                                       continue;
                                    }
                                 }
                                 FSM___hexnan_D2A.esp = FSM___hexnan_D2A.ebp;
                                 FSM___hexnan_D2A.ebp = li32(FSM___hexnan_D2A.esp);
                                 FSM___hexnan_D2A.esp = FSM___hexnan_D2A.esp + 4;
                                 FSM___hexnan_D2A.esp = FSM___hexnan_D2A.esp + 4;
                                 return;
                              }
                              _loc1_ = 5;
                              addr455:
                              _loc2_ = int(_loc1_);
                              addr455:
                              _loc1_ = _loc2_;
                              FSM___hexnan_D2A.eax = _loc1_;
                              §§goto(addr464);
                           }
                        }
                        break;
                     }
                     addr450:
                     break;
                  }
                  _loc6_ = int(_loc12_ + 1);
                  _loc7_ = _loc14_ + 1;
                  if(_loc6_ > 8)
                  {
                     if(uint(_loc2_) <= uint(_loc3_))
                     {
                        _loc8_ = int(_loc10_);
                        _loc9_ = int(_loc11_);
                        _loc10_ = _loc6_;
                        _loc6_ = int(_loc7_);
                        _loc7_ = _loc15_;
                        _loc11_ = _loc13_;
                     }
                     else
                     {
                        _loc6_ = 0;
                        si32(_loc6_,_loc2_ + -4);
                        _loc6_ = 1;
                        _loc2_ = int(_loc2_ + -4);
                     }
                  }
                  _loc9_ = int(li32(_loc2_));
                  _loc8_ = _loc8_ & 15;
                  _loc9_ = _loc9_ << 4;
                  _loc8_ = _loc9_ | _loc8_;
                  si32(_loc8_,_loc2_);
                  _loc8_ = int(_loc10_);
                  _loc9_ = int(_loc11_);
                  _loc10_ = _loc6_;
                  _loc6_ = int(_loc7_);
                  _loc7_ = _loc15_;
                  _loc11_ = _loc13_;
               }
               _loc2_ = 4;
               §§goto(addr455);
            }
            else
            {
               _loc1_ = 0;
               _loc6_ = int(_loc2_);
               _loc7_ = _loc1_;
               _loc8_ = int(_loc2_);
            }
            addr664:
            _loc9_ = int(_loc8_);
            if(_loc1_ != 0)
            {
               _loc8_ = int(_loc6_);
               _loc6_ = int(_loc7_);
               _loc7_ = _loc9_;
               §§goto(addr680);
            }
            else
            {
               §§goto(addr450);
            }
            §§goto(addr455);
         }
         else
         {
            _loc6_ = 0;
            _loc2_ = _loc2_ << 2;
            _loc2_ = int(_loc2_ + _loc3_);
            si32(_loc6_,_loc2_ + -4);
            _loc7_ = li32(_loc1_);
            _loc2_ = int(_loc2_ + -4);
            _loc8_ = int(_loc2_);
            _loc9_ = int(_loc6_);
            _loc10_ = _loc6_;
            _loc11_ = _loc2_;
         }
         while(true)
         {
            _loc12_ = int(_loc10_);
            _loc13_ = _loc6_;
            _loc6_ = int(_loc7_);
            _loc14_ = _loc11_;
            _loc7_ = li8(_loc6_ + 1);
            _loc15_ = _loc6_ + 1;
            if(_loc7_ != 0)
            {
               _loc10_ = _loc8_;
               _loc11_ = _loc9_;
               _loc9_ = int(_loc13_);
               _loc13_ = _loc14_;
               _loc8_ = int(_loc15_);
               §§goto(addr177);
            }
            else
            {
               _loc6_ = int(_loc8_);
               _loc7_ = _loc12_;
               _loc1_ = _loc13_;
               _loc8_ = int(_loc14_);
               §§goto(addr664);
            }
            §§goto(addr680);
         }
         §§goto(addr450);
      }
   }
}
