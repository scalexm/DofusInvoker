package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.li8;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_getsecs extends Machine
   {
       
      
      public function FSM_getsecs()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:* = 0;
         var _loc2_:int = 0;
         var _loc3_:* = 0;
         var _loc4_:* = 0;
         var _loc5_:int = 0;
         var _loc6_:* = 0;
         var _loc7_:int = 0;
         FSM_getsecs.esp = FSM_getsecs.esp - 4;
         si32(FSM_getsecs.ebp,FSM_getsecs.esp);
         FSM_getsecs.ebp = FSM_getsecs.esp;
         FSM_getsecs.esp = FSM_getsecs.esp - 0;
         _loc1_ = int(li32(FSM_getsecs.ebp + 8));
         _loc2_ = li32(FSM_getsecs.ebp + 12);
         _loc3_ = int(_loc1_);
         if(_loc1_ != 0)
         {
            _loc1_ = int(li8(_loc1_));
            _loc4_ = _loc1_ << 24;
            _loc4_ = _loc4_ >> 24;
            _loc4_ = int(_loc4_ + -48);
            if(uint(_loc4_) <= uint(9))
            {
               _loc4_ = 0;
               while(true)
               {
                  _loc1_ = _loc1_ << 24;
                  _loc1_ = _loc1_ >> 24;
                  _loc4_ = int(_loc4_ * 10);
                  _loc1_ = int(_loc4_ + _loc1_);
                  _loc1_ = int(_loc1_ + -48);
                  if(_loc1_ <= 167)
                  {
                     _loc5_ = li8(_loc3_ + 1);
                     _loc3_ = int(_loc3_ + 1);
                     _loc4_ = _loc5_ << 24;
                     _loc4_ = _loc4_ >> 24;
                     _loc6_ = int(_loc3_);
                     _loc4_ = int(_loc4_ + -48);
                     if(uint(_loc4_) <= uint(9))
                     {
                        _loc3_ = int(_loc6_);
                        _loc4_ = int(_loc1_);
                        _loc1_ = int(_loc5_);
                        continue;
                     }
                     if(_loc1_ >= 0)
                     {
                        addr177:
                        _loc4_ = int(_loc3_);
                        if(_loc3_ != 0)
                        {
                           _loc5_ = _loc1_ * 3600;
                           si32(_loc5_,_loc2_);
                           _loc6_ = int(li8(_loc3_));
                           if(_loc6_ != 58)
                           {
                              _loc1_ = int(_loc3_);
                              addr190:
                           }
                           else
                           {
                              _loc3_ = int(_loc3_ + 1);
                              if(_loc3_ != 0)
                              {
                                 _loc3_ = int(li8(_loc3_));
                                 _loc6_ = _loc3_ << 24;
                                 _loc6_ = _loc6_ >> 24;
                                 _loc6_ = int(_loc6_ + -48);
                                 if(uint(_loc6_) <= uint(9))
                                 {
                                    _loc6_ = 0;
                                    while(true)
                                    {
                                       _loc3_ = _loc3_ << 24;
                                       _loc3_ = _loc3_ >> 24;
                                       _loc6_ = int(_loc6_ * 10);
                                       _loc3_ = int(_loc6_ + _loc3_);
                                       _loc3_ = int(_loc3_ + -48);
                                       if(_loc3_ <= 59)
                                       {
                                          _loc7_ = li8(_loc4_ + 2);
                                          _loc6_ = _loc7_ << 24;
                                          _loc4_ = int(_loc4_ + 1);
                                          _loc6_ = _loc6_ >> 24;
                                          _loc6_ = int(_loc6_ + -48);
                                          if(uint(_loc6_) <= uint(9))
                                          {
                                             _loc6_ = int(_loc3_);
                                             _loc3_ = int(_loc7_);
                                             continue;
                                          }
                                          if(_loc3_ >= 0)
                                          {
                                             _loc4_ = int(_loc4_ + 1);
                                             _loc1_ = int(_loc3_);
                                             _loc3_ = int(_loc4_);
                                             addr341:
                                             _loc4_ = int(_loc3_);
                                             if(_loc3_ != 0)
                                             {
                                                _loc6_ = int(_loc1_ * 60);
                                                _loc5_ = _loc6_ + _loc5_;
                                                si32(_loc5_,_loc2_);
                                                _loc6_ = int(li8(_loc3_));
                                                if(_loc6_ != 58)
                                                {
                                                   _loc1_ = int(_loc3_);
                                                   §§goto(addr190);
                                                }
                                                else
                                                {
                                                   _loc3_ = int(_loc3_ + 1);
                                                   if(_loc3_ != 0)
                                                   {
                                                      _loc3_ = int(li8(_loc3_));
                                                      _loc6_ = _loc3_ << 24;
                                                      _loc6_ = _loc6_ >> 24;
                                                      _loc6_ = int(_loc6_ + -48);
                                                      if(uint(_loc6_) <= uint(9))
                                                      {
                                                         _loc6_ = 0;
                                                         while(true)
                                                         {
                                                            _loc3_ = _loc3_ << 24;
                                                            _loc3_ = _loc3_ >> 24;
                                                            _loc6_ = int(_loc6_ * 10);
                                                            _loc3_ = int(_loc6_ + _loc3_);
                                                            _loc3_ = int(_loc3_ + -48);
                                                            if(_loc3_ <= 60)
                                                            {
                                                               _loc7_ = li8(_loc4_ + 2);
                                                               _loc6_ = _loc7_ << 24;
                                                               _loc4_ = int(_loc4_ + 1);
                                                               _loc6_ = _loc6_ >> 24;
                                                               _loc6_ = int(_loc6_ + -48);
                                                               if(uint(_loc6_) <= uint(9))
                                                               {
                                                                  _loc6_ = int(_loc3_);
                                                                  _loc3_ = int(_loc7_);
                                                                  continue;
                                                               }
                                                               if(_loc3_ >= 0)
                                                               {
                                                                  _loc4_ = int(_loc4_ + 1);
                                                                  _loc1_ = int(_loc3_);
                                                                  _loc3_ = int(_loc4_);
                                                                  addr498:
                                                                  addr514:
                                                                  if(_loc3_ != 0)
                                                                  {
                                                                     _loc1_ = int(_loc1_ + _loc5_);
                                                                     si32(_loc1_,_loc2_);
                                                                     FSM_getsecs.eax = _loc3_;
                                                                  }
                                                                  FSM_getsecs.esp = FSM_getsecs.ebp;
                                                                  FSM_getsecs.ebp = li32(FSM_getsecs.esp);
                                                                  FSM_getsecs.esp = FSM_getsecs.esp + 4;
                                                                  FSM_getsecs.esp = FSM_getsecs.esp + 4;
                                                                  return;
                                                               }
                                                               break;
                                                            }
                                                            break;
                                                         }
                                                      }
                                                   }
                                                   _loc3_ = 0;
                                                   §§goto(addr498);
                                                }
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
                              }
                              _loc3_ = 0;
                              §§goto(addr341);
                           }
                           addr191:
                           FSM_getsecs.eax = _loc1_;
                           §§goto(addr514);
                        }
                        _loc1_ = 0;
                        §§goto(addr191);
                     }
                     else
                     {
                        break;
                     }
                  }
                  break;
               }
            }
         }
         _loc3_ = 0;
         §§goto(addr177);
      }
   }
}
