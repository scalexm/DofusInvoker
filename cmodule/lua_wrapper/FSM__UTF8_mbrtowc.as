package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.li8;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM__UTF8_mbrtowc extends Machine
   {
       
      
      public function FSM__UTF8_mbrtowc()
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
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:* = 0;
         var _loc10_:int = 0;
         var _loc11_:* = 0;
         var _loc12_:* = 0;
         FSM__UTF8_mbrtowc.esp = FSM__UTF8_mbrtowc.esp - 4;
         si32(FSM__UTF8_mbrtowc.ebp,FSM__UTF8_mbrtowc.esp);
         FSM__UTF8_mbrtowc.ebp = FSM__UTF8_mbrtowc.esp;
         FSM__UTF8_mbrtowc.esp = FSM__UTF8_mbrtowc.esp - 0;
         _loc1_ = int(li32(FSM__UTF8_mbrtowc.ebp + 20));
         _loc2_ = int(li32(_loc1_ + 4));
         _loc3_ = _loc1_ + 4;
         _loc4_ = li32(FSM__UTF8_mbrtowc.ebp + 8);
         _loc5_ = int(li32(FSM__UTF8_mbrtowc.ebp + 12));
         _loc6_ = li32(FSM__UTF8_mbrtowc.ebp + 16);
         _loc7_ = _loc1_;
         if(uint(_loc2_) >= uint(7))
         {
            _loc1_ = 22;
            addr114:
            si32(_loc1_,FSM__UTF8_mbrtowc);
            addr164:
            _loc1_ = -1;
            addr164:
            FSM__UTF8_mbrtowc.eax = _loc1_;
         }
         else
         {
            _loc8_ = FSM__UTF8_mbrtowc;
            _loc8_ = _loc5_ == 0?int(_loc8_):int(_loc5_);
            _loc6_ = _loc5_ == 0?1:int(_loc6_);
            _loc4_ = _loc5_ == 0?0:int(_loc4_);
            if(_loc6_ == 0)
            {
               _loc1_ = -2;
               §§goto(addr164);
            }
            else
            {
               if(_loc2_ == 0)
               {
                  _loc5_ = int(li8(_loc8_));
                  _loc9_ = _loc5_ & 128;
                  _loc10_ = _loc5_;
                  if(_loc9_ == 0)
                  {
                     _loc1_ = _loc5_ & 255;
                     _loc1_ = int(_loc1_ != 0?1:0);
                     _loc1_ = _loc1_ & 1;
                     if(_loc4_ != 0)
                     {
                        si32(_loc10_,_loc4_);
                        addr121:
                     }
                     §§goto(addr164);
                  }
                  else
                  {
                     if(_loc2_ == 0)
                     {
                        if(_loc9_ == 0)
                        {
                           _loc10_ = 0;
                           _loc5_ = 1;
                           _loc9_ = 127;
                        }
                        else
                        {
                           _loc5_ = _loc10_ & 224;
                           if(_loc5_ == 192)
                           {
                              _loc10_ = 128;
                              _loc5_ = 2;
                              _loc9_ = 31;
                           }
                           else
                           {
                              _loc5_ = _loc10_ & 240;
                              if(_loc5_ == 224)
                              {
                                 _loc10_ = 2048;
                                 _loc5_ = 3;
                                 _loc9_ = 15;
                              }
                              else
                              {
                                 _loc5_ = _loc10_ & 248;
                                 if(_loc5_ == 240)
                                 {
                                    _loc10_ = 65536;
                                    _loc5_ = 4;
                                    _loc9_ = 7;
                                 }
                                 else
                                 {
                                    _loc5_ = _loc10_ & 252;
                                    if(_loc5_ == 248)
                                    {
                                       _loc10_ = 2097152;
                                       _loc5_ = 5;
                                       _loc9_ = 3;
                                    }
                                    else
                                    {
                                       _loc5_ = _loc10_ & 254;
                                       if(_loc5_ == 252)
                                       {
                                          _loc10_ = 67108864;
                                          _loc5_ = 6;
                                          _loc9_ = 1;
                                       }
                                    }
                                 }
                              }
                           }
                        }
                        addr536:
                        _loc1_ = 86;
                        §§goto(addr114);
                     }
                     addr356:
                     if(_loc2_ == 0)
                     {
                        _loc2_ = int(_loc2_ == 0?1:0);
                        _loc11_ = int(li8(_loc8_));
                        _loc2_ = _loc2_ & 1;
                        _loc8_ = _loc8_ + 1;
                        _loc9_ = _loc11_ & _loc9_;
                        addr398:
                        _loc11_ = int(uint(_loc6_) <= uint(_loc5_)?int(_loc6_):int(_loc5_));
                        if(uint(_loc2_) >= uint(_loc11_))
                        {
                           _loc8_ = _loc9_;
                           addr502:
                           _loc6_ = _loc8_;
                           if(_loc2_ < _loc5_)
                           {
                              _loc4_ = -2;
                              _loc5_ = int(_loc5_ - _loc2_);
                              si32(_loc5_,_loc3_);
                              si32(_loc10_,_loc7_ + 8);
                              si32(_loc6_,_loc1_);
                              FSM__UTF8_mbrtowc.eax = _loc4_;
                              addr169:
                           }
                           else
                           {
                              if(_loc6_ < _loc10_)
                              {
                                 §§goto(addr536);
                              }
                              else
                              {
                                 if(_loc4_ != 0)
                                 {
                                    _loc1_ = 0;
                                    si32(_loc6_,_loc4_);
                                 }
                                 else
                                 {
                                    _loc1_ = 0;
                                 }
                                 si32(_loc1_,_loc3_);
                                 _loc1_ = int(_loc6_ == 0?0:int(_loc5_));
                                 §§goto(addr121);
                              }
                              §§goto(addr164);
                           }
                        }
                        else
                        {
                           addr430:
                           while(true)
                           {
                              _loc11_ = int(li8(_loc8_));
                              _loc12_ = _loc11_ & 192;
                              if(_loc12_ != 128)
                              {
                                 _loc2_ = 86;
                                 si32(_loc2_,FSM__UTF8_mbrtowc);
                                 _loc2_ = -1;
                                 FSM__UTF8_mbrtowc.eax = _loc2_;
                              }
                              else
                              {
                                 _loc11_ = _loc11_ & 63;
                                 _loc9_ = _loc9_ << 6;
                                 _loc2_ = int(_loc2_ + 1);
                                 _loc8_ = _loc8_ + 1;
                                 _loc9_ = _loc11_ | _loc9_;
                              }
                              §§goto(addr169);
                              §§goto(addr398);
                           }
                        }
                     }
                     else
                     {
                        _loc2_ = int(_loc2_ == 0?1:0);
                        _loc9_ = int(li32(_loc1_));
                        _loc2_ = _loc2_ & 1;
                     }
                     while(true)
                     {
                        _loc11_ = int(uint(_loc6_) <= uint(_loc5_)?int(_loc6_):int(_loc5_));
                        if(uint(_loc2_) >= uint(_loc11_))
                        {
                           _loc8_ = _loc9_;
                           §§goto(addr502);
                        }
                        else
                        {
                           §§goto(addr430);
                        }
                     }
                     §§goto(addr169);
                  }
               }
               _loc10_ = li32(_loc7_ + 8);
               _loc9_ = int(_loc5_);
               _loc5_ = int(_loc2_);
               §§goto(addr356);
            }
         }
         FSM__UTF8_mbrtowc.esp = FSM__UTF8_mbrtowc.ebp;
         FSM__UTF8_mbrtowc.ebp = li32(FSM__UTF8_mbrtowc.esp);
         FSM__UTF8_mbrtowc.esp = FSM__UTF8_mbrtowc.esp + 4;
         FSM__UTF8_mbrtowc.esp = FSM__UTF8_mbrtowc.esp + 4;
      }
   }
}
