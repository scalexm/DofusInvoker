package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_match_class extends Machine
   {
       
      
      public function FSM_match_class()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:* = 0;
         var _loc2_:* = 0;
         var _loc3_:* = 0;
         var _loc4_:* = 0;
         var _loc5_:* = 0;
         var _loc6_:* = 0;
         var _loc7_:int = 0;
         var _loc8_:* = 0;
         FSM_match_class.esp = FSM_match_class.esp - 4;
         si32(FSM_match_class.ebp,FSM_match_class.esp);
         FSM_match_class.ebp = FSM_match_class.esp;
         FSM_match_class.esp = FSM_match_class.esp - 0;
         _loc1_ = int(li32(FSM_match_class));
         _loc2_ = int(li32(FSM_match_class.ebp + 8));
         _loc3_ = int(li32(FSM_match_class.ebp + 12));
         if(uint(_loc3_) >= uint(256))
         {
            if(_loc3_ > -1)
            {
               _loc4_ = int(li32(_loc1_ + 3136));
               _loc5_ = int(li32(_loc1_ + 3132));
               if(_loc5_ != 0)
               {
                  while(true)
                  {
                     _loc6_ = _loc5_ & 536870910;
                     _loc6_ = _loc6_ << 3;
                     _loc6_ = int(_loc4_ + _loc6_);
                     _loc6_ = int(li32(_loc6_));
                     _loc7_ = _loc5_ >>> 1;
                     if(_loc6_ <= _loc3_)
                     {
                        _loc8_ = _loc7_ << 4;
                        _loc8_ = int(_loc4_ + _loc8_);
                        _loc8_ = int(li32(_loc8_ + 4));
                        if(_loc8_ >= _loc3_)
                        {
                           _loc5_ = _loc7_ << 4;
                           _loc4_ = int(_loc4_ + _loc5_);
                           _loc4_ = int(li32(_loc4_ + 8));
                           _loc4_ = int(_loc4_ + _loc3_);
                           _loc4_ = int(_loc4_ - _loc6_);
                           addr88:
                           addr1225:
                           if(_loc4_ <= 114)
                           {
                              if(_loc4_ <= 99)
                              {
                                 if(_loc4_ != 97)
                                 {
                                    if(_loc4_ != 99)
                                    {
                                       addr573:
                                       _loc2_ = int(_loc3_ == _loc2_?1:0);
                                       _loc2_ = _loc2_ & 1;
                                       FSM_match_class.eax = _loc2_;
                                    }
                                    else
                                    {
                                       addr106:
                                       if(uint(_loc2_) >= uint(256))
                                       {
                                          FSM_match_class.esp = FSM_match_class.esp - 4;
                                          si32(_loc2_,FSM_match_class.esp);
                                          FSM_match_class.esp = FSM_match_class.esp - 4;
                                          FSM_match_class.start();
                                          _loc2_ = int(FSM_match_class.eax);
                                          _loc2_ = int(_loc2_ >>> 9);
                                          FSM_match_class.esp = FSM_match_class.esp + 4;
                                          _loc2_ = _loc2_ & 1;
                                          if(uint(_loc3_) <= uint(255))
                                          {
                                             addr654:
                                             _loc3_ = _loc3_ << 2;
                                             _loc1_ = int(_loc1_ + _loc3_);
                                             _loc1_ = int(li32(_loc1_ + 52));
                                             _loc1_ = _loc1_ & 4096;
                                             addr1289:
                                             if(_loc1_ != 0)
                                             {
                                                _loc1_ = int(_loc2_);
                                             }
                                             else
                                             {
                                                _loc1_ = int(_loc2_);
                                             }
                                             addr1289:
                                             FSM_match_class.eax = _loc1_;
                                          }
                                          addr1277:
                                          _loc1_ = int(_loc1_ == 0?1:0);
                                          _loc1_ = _loc1_ & 1;
                                          §§goto(addr1289);
                                       }
                                       else
                                       {
                                          _loc2_ = _loc2_ << 2;
                                          _loc2_ = int(_loc1_ + _loc2_);
                                          _loc2_ = int(li32(_loc2_ + 52));
                                          _loc2_ = int(_loc2_ >>> 9);
                                          _loc2_ = _loc2_ & 1;
                                          if(uint(_loc3_) <= uint(255))
                                          {
                                             addr653:
                                             §§goto(addr654);
                                          }
                                          §§goto(addr1277);
                                       }
                                    }
                                    addr1293:
                                    FSM_match_class.esp = FSM_match_class.ebp;
                                    FSM_match_class.ebp = li32(FSM_match_class.esp);
                                    FSM_match_class.esp = FSM_match_class.esp + 4;
                                    FSM_match_class.esp = FSM_match_class.esp + 4;
                                    return;
                                 }
                                 addr590:
                                 if(uint(_loc2_) >= uint(256))
                                 {
                                    FSM_match_class.esp = FSM_match_class.esp - 4;
                                    si32(_loc2_,FSM_match_class.esp);
                                    FSM_match_class.esp = FSM_match_class.esp - 4;
                                    FSM_match_class.start();
                                    _loc2_ = int(FSM_match_class.eax);
                                    _loc2_ = int(_loc2_ >>> 8);
                                    FSM_match_class.esp = FSM_match_class.esp + 4;
                                    _loc2_ = _loc2_ & 1;
                                    if(uint(_loc3_) <= uint(255))
                                    {
                                       §§goto(addr654);
                                    }
                                    §§goto(addr1277);
                                 }
                                 else
                                 {
                                    _loc2_ = _loc2_ << 2;
                                    _loc2_ = int(_loc1_ + _loc2_);
                                    _loc2_ = int(li32(_loc2_ + 52));
                                    _loc2_ = int(_loc2_ >>> 8);
                                    _loc2_ = _loc2_ & 1;
                                    if(uint(_loc3_) <= uint(255))
                                    {
                                       §§goto(addr653);
                                    }
                                    §§goto(addr1277);
                                 }
                              }
                              else if(_loc4_ != 100)
                              {
                                 if(_loc4_ != 108)
                                 {
                                    if(_loc4_ != 112)
                                    {
                                       §§goto(addr573);
                                    }
                                    else
                                    {
                                       addr328:
                                       if(uint(_loc2_) >= uint(256))
                                       {
                                          FSM_match_class.esp = FSM_match_class.esp - 4;
                                          si32(_loc2_,FSM_match_class.esp);
                                          FSM_match_class.esp = FSM_match_class.esp - 4;
                                          FSM_match_class.start();
                                          _loc2_ = int(FSM_match_class.eax);
                                          _loc2_ = int(_loc2_ >>> 13);
                                          FSM_match_class.esp = FSM_match_class.esp + 4;
                                          _loc2_ = _loc2_ & 1;
                                          if(uint(_loc3_) <= uint(255))
                                          {
                                             §§goto(addr654);
                                          }
                                          §§goto(addr1277);
                                       }
                                       else
                                       {
                                          _loc2_ = _loc2_ << 2;
                                          _loc2_ = int(_loc1_ + _loc2_);
                                          _loc2_ = int(li32(_loc2_ + 52));
                                          _loc2_ = int(_loc2_ >>> 13);
                                          _loc2_ = _loc2_ & 1;
                                          if(uint(_loc3_) <= uint(255))
                                          {
                                             §§goto(addr653);
                                          }
                                          §§goto(addr1277);
                                       }
                                    }
                                    §§goto(addr1293);
                                 }
                                 else
                                 {
                                    addr796:
                                    if(uint(_loc2_) >= uint(256))
                                    {
                                       FSM_match_class.esp = FSM_match_class.esp - 4;
                                       si32(_loc2_,FSM_match_class.esp);
                                       FSM_match_class.esp = FSM_match_class.esp - 4;
                                       FSM_match_class.start();
                                       _loc2_ = int(FSM_match_class.eax);
                                       _loc2_ = int(_loc2_ >>> 12);
                                       FSM_match_class.esp = FSM_match_class.esp + 4;
                                       _loc2_ = _loc2_ & 1;
                                       if(uint(_loc3_) <= uint(255))
                                       {
                                          §§goto(addr653);
                                       }
                                       §§goto(addr1277);
                                    }
                                    else
                                    {
                                       _loc2_ = _loc2_ << 2;
                                       _loc2_ = int(_loc1_ + _loc2_);
                                       _loc2_ = int(li32(_loc2_ + 52));
                                       _loc2_ = int(_loc2_ >>> 12);
                                       _loc2_ = _loc2_ & 1;
                                       if(uint(_loc3_) <= uint(255))
                                       {
                                          §§goto(addr653);
                                       }
                                       §§goto(addr1277);
                                    }
                                 }
                              }
                              else
                              {
                                 addr747:
                                 if(uint(_loc2_) <= uint(255))
                                 {
                                    _loc4_ = int(FSM_match_class);
                                    _loc2_ = _loc2_ << 2;
                                    _loc2_ = int(_loc4_ + _loc2_);
                                    _loc2_ = int(li32(_loc2_ + 52));
                                    _loc2_ = _loc2_ & 1024;
                                    if(_loc2_ != 0)
                                    {
                                       addr1212:
                                       if(uint(_loc3_) <= uint(255))
                                       {
                                          _loc2_ = 1;
                                          §§goto(addr653);
                                       }
                                       else
                                       {
                                          _loc2_ = 1;
                                       }
                                       §§goto(addr1277);
                                    }
                                 }
                                 if(uint(_loc3_) <= uint(255))
                                 {
                                    addr793:
                                    _loc2_ = 0;
                                    §§goto(addr653);
                                 }
                                 else
                                 {
                                    addr1209:
                                    _loc2_ = 0;
                                 }
                                 §§goto(addr1277);
                              }
                           }
                           else if(_loc4_ <= 118)
                           {
                              if(_loc4_ != 115)
                              {
                                 if(_loc4_ != 117)
                                 {
                                    §§goto(addr573);
                                 }
                                 else
                                 {
                                    addr405:
                                    if(uint(_loc2_) >= uint(256))
                                    {
                                       FSM_match_class.esp = FSM_match_class.esp - 4;
                                       si32(_loc2_,FSM_match_class.esp);
                                       FSM_match_class.esp = FSM_match_class.esp - 4;
                                       FSM_match_class.start();
                                       _loc2_ = int(FSM_match_class.eax);
                                       _loc2_ = int(_loc2_ >>> 15);
                                       FSM_match_class.esp = FSM_match_class.esp + 4;
                                       _loc2_ = _loc2_ & 1;
                                       if(uint(_loc3_) <= uint(255))
                                       {
                                          §§goto(addr654);
                                       }
                                       §§goto(addr1277);
                                    }
                                    else
                                    {
                                       _loc2_ = _loc2_ << 2;
                                       _loc2_ = int(_loc1_ + _loc2_);
                                       _loc2_ = int(li32(_loc2_ + 52));
                                       _loc2_ = int(_loc2_ >>> 15);
                                       _loc2_ = _loc2_ & 1;
                                       if(uint(_loc3_) <= uint(255))
                                       {
                                          §§goto(addr653);
                                       }
                                       §§goto(addr1277);
                                    }
                                 }
                                 §§goto(addr1293);
                              }
                              else
                              {
                                 addr925:
                                 if(uint(_loc2_) >= uint(256))
                                 {
                                    FSM_match_class.esp = FSM_match_class.esp - 4;
                                    si32(_loc2_,FSM_match_class.esp);
                                    FSM_match_class.esp = FSM_match_class.esp - 4;
                                    FSM_match_class.start();
                                    _loc2_ = int(FSM_match_class.eax);
                                    _loc2_ = int(_loc2_ >>> 14);
                                    FSM_match_class.esp = FSM_match_class.esp + 4;
                                    _loc2_ = _loc2_ & 1;
                                    if(uint(_loc3_) <= uint(255))
                                    {
                                       §§goto(addr653);
                                    }
                                    §§goto(addr1277);
                                 }
                                 else
                                 {
                                    _loc2_ = _loc2_ << 2;
                                    _loc2_ = int(_loc1_ + _loc2_);
                                    _loc2_ = int(li32(_loc2_ + 52));
                                    _loc2_ = int(_loc2_ >>> 14);
                                    _loc2_ = _loc2_ & 1;
                                    if(uint(_loc3_) <= uint(255))
                                    {
                                       §§goto(addr653);
                                    }
                                    §§goto(addr1277);
                                 }
                              }
                           }
                           else if(_loc4_ != 119)
                           {
                              if(_loc4_ != 120)
                              {
                                 if(_loc4_ != 122)
                                 {
                                    §§goto(addr573);
                                 }
                                 else
                                 {
                                    addr482:
                                    _loc2_ = int(_loc2_ == 0?1:0);
                                    _loc2_ = _loc2_ & 1;
                                    if(uint(_loc3_) <= uint(255))
                                    {
                                       §§goto(addr654);
                                    }
                                    §§goto(addr1277);
                                 }
                                 §§goto(addr1293);
                              }
                              else
                              {
                                 addr1164:
                                 if(uint(_loc2_) <= uint(255))
                                 {
                                    _loc4_ = int(FSM_match_class);
                                    _loc2_ = _loc2_ << 2;
                                    _loc2_ = int(_loc4_ + _loc2_);
                                    _loc2_ = int(li32(_loc2_ + 52));
                                    _loc2_ = _loc2_ & 65536;
                                    if(_loc2_ != 0)
                                    {
                                       §§goto(addr1212);
                                    }
                                 }
                                 if(uint(_loc3_) <= uint(255))
                                 {
                                    §§goto(addr793);
                                 }
                                 else
                                 {
                                    §§goto(addr1209);
                                 }
                                 §§goto(addr1277);
                              }
                           }
                           _loc1_ = int(_loc2_);
                           FSM_match_class.esp = FSM_match_class.esp - 4;
                           si32(_loc3_,FSM_match_class.esp);
                           FSM_match_class.esp = FSM_match_class.esp - 4;
                           FSM_match_class.start();
                           _loc2_ = int(FSM_match_class.eax);
                           FSM_match_class.esp = FSM_match_class.esp + 4;
                           _loc2_ = _loc2_ & 4096;
                           if(_loc2_ == 0)
                           {
                              §§goto(addr1277);
                           }
                           §§goto(addr1289);
                        }
                     }
                     _loc6_ = _loc7_ << 4;
                     _loc6_ = int(_loc4_ + _loc6_);
                     _loc6_ = int(li32(_loc6_ + 4));
                     if(_loc6_ < _loc3_)
                     {
                        _loc6_ = _loc7_ << 4;
                        _loc4_ = int(_loc6_ + _loc4_);
                        _loc4_ = int(_loc4_ + 16);
                        _loc5_ = int(_loc5_ + -1);
                     }
                     _loc6_ = int(_loc5_ >>> 1);
                     if(uint(_loc5_) >= uint(2))
                     {
                        _loc5_ = int(_loc6_);
                        continue;
                     }
                     break;
                  }
               }
            }
            _loc4_ = int(_loc3_);
            §§goto(addr88);
         }
         else
         {
            _loc4_ = _loc3_ << 2;
            _loc4_ = int(_loc1_ + _loc4_);
            _loc4_ = int(li32(_loc4_ + 1076));
            if(_loc4_ <= 114)
            {
               if(_loc4_ <= 99)
               {
                  if(_loc4_ != 97)
                  {
                     if(_loc4_ != 99)
                     {
                        §§goto(addr573);
                     }
                     else
                     {
                        §§goto(addr106);
                     }
                     §§goto(addr1293);
                  }
                  else
                  {
                     §§goto(addr590);
                  }
               }
               else if(_loc4_ != 100)
               {
                  if(_loc4_ != 108)
                  {
                     if(_loc4_ != 112)
                     {
                        §§goto(addr573);
                     }
                     else
                     {
                        §§goto(addr328);
                     }
                     §§goto(addr1293);
                  }
                  else
                  {
                     §§goto(addr796);
                  }
               }
               else
               {
                  §§goto(addr747);
               }
            }
            else if(_loc4_ <= 118)
            {
               if(_loc4_ != 115)
               {
                  if(_loc4_ != 117)
                  {
                     §§goto(addr573);
                  }
                  else
                  {
                     §§goto(addr405);
                  }
                  §§goto(addr1293);
               }
               else
               {
                  §§goto(addr925);
               }
            }
            else if(_loc4_ != 119)
            {
               if(_loc4_ != 120)
               {
                  if(_loc4_ != 122)
                  {
                     §§goto(addr573);
                  }
                  else
                  {
                     §§goto(addr482);
                  }
                  §§goto(addr1293);
               }
               else
               {
                  §§goto(addr1164);
               }
            }
            §§goto(addr1225);
         }
         if(uint(_loc2_) >= uint(256))
         {
            FSM_match_class.esp = FSM_match_class.esp - 4;
            si32(_loc2_,FSM_match_class.esp);
            FSM_match_class.esp = FSM_match_class.esp - 4;
            FSM_match_class.start();
            _loc2_ = int(FSM_match_class.eax);
            _loc2_ = _loc2_ & 1280;
            _loc2_ = int(_loc2_ != 0?1:0);
            FSM_match_class.esp = FSM_match_class.esp + 4;
            _loc2_ = _loc2_ & 1;
            if(uint(_loc3_) <= uint(255))
            {
               §§goto(addr653);
            }
            §§goto(addr1277);
         }
         else
         {
            _loc2_ = _loc2_ << 2;
            _loc2_ = int(_loc1_ + _loc2_);
            _loc2_ = int(li32(_loc2_ + 52));
            _loc2_ = _loc2_ & 1280;
            _loc2_ = int(_loc2_ != 0?1:0);
            _loc2_ = _loc2_ & 1;
            if(uint(_loc3_) <= uint(255))
            {
               §§goto(addr653);
            }
            §§goto(addr1277);
         }
         §§goto(addr1225);
      }
   }
}
