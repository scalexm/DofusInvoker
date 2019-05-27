package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_timesub398 extends Machine
   {
       
      
      public function FSM_timesub398()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:int = 0;
         var _loc2_:* = 0;
         var _loc3_:* = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:* = 0;
         var _loc7_:* = 0;
         var _loc8_:* = 0;
         var _loc9_:* = 0;
         var _loc10_:int = 0;
         var _loc11_:* = 0;
         FSM_timesub398.esp = FSM_timesub398.esp - 4;
         si32(FSM_timesub398.ebp,FSM_timesub398.esp);
         FSM_timesub398.ebp = FSM_timesub398.esp;
         FSM_timesub398.esp = FSM_timesub398.esp - 0;
         _loc1_ = li32(FSM_timesub398.ebp + 16);
         _loc2_ = int(li32(_loc1_));
         _loc3_ = int(li32(FSM_timesub398.ebp + 8));
         _loc4_ = li32(FSM_timesub398.ebp + 12);
         _loc5_ = li32(FSM_timesub398.ebp + 20);
         _loc6_ = int(_loc1_);
         _loc7_ = int(_loc2_ + -1);
         if(_loc7_ >= 0)
         {
            _loc7_ = 0;
            _loc8_ = _loc2_ << 3;
            _loc6_ = int(_loc6_ + _loc8_);
            _loc6_ = int(_loc6_ + 7492);
            _loc8_ = int(_loc2_ + -1);
            loop0:
            while(true)
            {
               _loc9_ = int(li32(_loc6_));
               if(_loc9_ <= _loc3_)
               {
                  _loc6_ = int(_loc2_ - _loc7_);
                  if(_loc9_ != _loc3_)
                  {
                     addr144:
                     _loc6_ = 0;
                  }
                  else
                  {
                     if(_loc6_ == 1)
                     {
                        _loc7_ = _loc8_ << 3;
                        _loc7_ = int(_loc1_ + _loc7_);
                        _loc7_ = int(li32(_loc7_ + 7504));
                        if(_loc7_ >= 1)
                        {
                        }
                        addr173:
                        _loc6_ = 0;
                        while(true)
                        {
                           _loc7_ = int(_loc8_ - _loc6_);
                           if(_loc7_ >= 1)
                           {
                              _loc2_ = int(_loc7_ + -1);
                              _loc9_ = _loc2_ << 3;
                              _loc10_ = _loc1_ + 7500;
                              _loc11_ = _loc7_ << 3;
                              _loc9_ = int(_loc10_ + _loc9_);
                              _loc10_ = _loc10_ + _loc11_;
                              _loc9_ = int(li32(_loc9_));
                              _loc10_ = li32(_loc10_);
                              _loc9_ = int(_loc9_ + 1);
                              if(_loc10_ == _loc9_)
                              {
                                 _loc2_ = _loc2_ << 3;
                                 _loc9_ = int(_loc1_ + 7500);
                                 _loc7_ = _loc7_ << 3;
                                 _loc2_ = int(_loc9_ + _loc2_);
                                 _loc7_ = int(_loc9_ + _loc7_);
                                 _loc2_ = int(li32(_loc2_ + 4));
                                 _loc7_ = int(li32(_loc7_ + 4));
                                 _loc9_ = int(_loc6_ + 1);
                                 _loc2_ = int(_loc2_ + 1);
                                 if(_loc7_ == _loc2_)
                                 {
                                    _loc6_ = int(_loc9_);
                                    continue;
                                 }
                                 break;
                              }
                              break;
                           }
                           break;
                        }
                        _loc6_ = int(_loc6_ + 1);
                     }
                     _loc6_ = _loc6_ << 3;
                     _loc7_ = int(_loc1_ + 7500);
                     _loc2_ = _loc8_ << 3;
                     _loc6_ = int(_loc6_ + _loc7_);
                     _loc7_ = int(_loc7_ + _loc2_);
                     _loc7_ = int(li32(_loc7_ + 4));
                     _loc6_ = int(li32(_loc6_ + -12));
                     if(_loc7_ <= _loc6_)
                     {
                        §§goto(addr144);
                     }
                     else
                     {
                        §§goto(addr173);
                     }
                  }
                  addr291:
                  _loc7_ = _loc8_ << 3;
                  _loc8_ = int(_loc3_ / 86400);
                  _loc7_ = int(_loc1_ + _loc7_);
                  _loc7_ = int(li32(_loc7_ + 7504));
                  _loc1_ = _loc8_ * 86400;
                  _loc1_ = _loc3_ - _loc1_;
                  _loc7_ = int(_loc4_ - _loc7_);
                  _loc7_ = int(_loc1_ + _loc7_);
                  if(_loc7_ < 0)
                  {
                     addr378:
                     while(true)
                     {
                        _loc2_ = 86400;
                        _loc3_ = int(_loc8_ + -1);
                        _loc1_ = _loc7_;
                        _loc8_ = int(_loc2_);
                        _loc7_ = int(_loc3_);
                        break loop0;
                        §§goto(addr291);
                     }
                     _loc8_ = int(_loc2_);
                  }
                  _loc1_ = _loc6_;
                  _loc2_ = int(_loc7_);
                  _loc3_ = int(_loc8_);
                  if(_loc2_ > 86399)
                  {
                     _loc6_ = -1;
                     while(true)
                     {
                        _loc2_ = int(_loc2_ + -86400);
                        _loc6_ = int(_loc6_ + 1);
                        if(_loc2_ >= 86400)
                        {
                           continue;
                        }
                        break;
                     }
                     _loc3_ = int(_loc6_ + _loc3_);
                     _loc3_ = int(_loc3_ + 1);
                  }
                  _loc6_ = int(_loc2_ / 3600);
                  _loc7_ = int(_loc6_ * 3600);
                  _loc2_ = int(_loc2_ - _loc7_);
                  _loc7_ = int(_loc2_ / 60);
                  _loc8_ = int(_loc7_ * 60);
                  _loc9_ = int(_loc3_ + 4);
                  si32(_loc6_,_loc5_ + 8);
                  _loc6_ = int(_loc9_ / 7);
                  _loc2_ = int(_loc2_ - _loc8_);
                  _loc6_ = int(_loc6_ * 7);
                  si32(_loc7_,_loc5_ + 4);
                  _loc1_ = _loc2_ + _loc1_;
                  si32(_loc1_,_loc5_);
                  _loc1_ = _loc9_ - _loc6_;
                  si32(_loc1_,_loc5_ + 24);
                  _loc2_ = int(_loc5_ + 24);
                  if(_loc1_ >= 0)
                  {
                     _loc1_ = 1970;
                     _loc2_ = int(_loc3_);
                     addr698:
                     while(true)
                     {
                        if(_loc2_ >= 0)
                        {
                           addr702:
                           while(true)
                           {
                              _loc3_ = _loc1_ & 3;
                              if(_loc3_ == 0)
                              {
                                 _loc3_ = int(_loc1_ / 100);
                                 _loc3_ = int(_loc3_ * 100);
                                 _loc3_ = int(_loc1_ - _loc3_);
                                 if(_loc3_ == 0)
                                 {
                                    _loc3_ = int(_loc1_ / 400);
                                    _loc3_ = int(_loc3_ * 400);
                                    _loc3_ = int(_loc1_ - _loc3_);
                                    if(_loc3_ != 0)
                                    {
                                    }
                                    addr756:
                                    _loc6_ = int(FSM_timesub398);
                                    _loc7_ = _loc3_ << 2;
                                    _loc6_ = int(_loc6_ + _loc7_);
                                    _loc6_ = int(li32(_loc6_));
                                    if(_loc6_ > _loc2_)
                                    {
                                       break;
                                    }
                                 }
                                 _loc3_ = 1;
                                 §§goto(addr756);
                              }
                              _loc3_ = 0;
                              §§goto(addr756);
                           }
                           _loc6_ = int(FSM_timesub398);
                           _loc1_ = _loc1_ + -1900;
                           si32(_loc1_,_loc5_ + 20);
                           _loc1_ = _loc3_ * 48;
                           si32(_loc2_,_loc5_ + 28);
                           _loc7_ = 0;
                           si32(_loc7_,_loc5_ + 16);
                           _loc1_ = _loc6_ + _loc1_;
                           _loc1_ = li32(_loc1_);
                           _loc6_ = int(_loc5_ + 16);
                           if(_loc1_ <= _loc2_)
                           {
                              _loc1_ = FSM_timesub398;
                              _loc3_ = int(_loc3_ * 48);
                              _loc7_ = 0;
                              _loc1_ = _loc1_ + _loc3_;
                              _loc3_ = int(_loc7_);
                              while(true)
                              {
                                 _loc7_ = int(li32(_loc1_));
                                 _loc8_ = int(li32(_loc1_ + 4));
                                 _loc3_ = int(_loc3_ + 1);
                                 _loc1_ = _loc1_ + 4;
                                 _loc2_ = int(_loc2_ - _loc7_);
                                 if(_loc8_ <= _loc2_)
                                 {
                                    continue;
                                 }
                                 break;
                              }
                              si32(_loc3_,_loc6_);
                           }
                           _loc1_ = _loc2_;
                           _loc2_ = 0;
                           _loc1_ = _loc1_ + 1;
                           si32(_loc1_,_loc5_ + 12);
                           si32(_loc2_,_loc5_ + 32);
                           si32(_loc4_,_loc5_ + 36);
                           FSM_timesub398.esp = FSM_timesub398.ebp;
                           FSM_timesub398.ebp = li32(FSM_timesub398.esp);
                           FSM_timesub398.esp = FSM_timesub398.esp + 4;
                           FSM_timesub398.esp = FSM_timesub398.esp + 4;
                           return;
                        }
                        while(true)
                        {
                        }
                     }
                  }
                  else
                  {
                     _loc1_ = _loc1_ + 7;
                     si32(_loc1_,_loc2_);
                     if(_loc3_ >= 0)
                     {
                        _loc1_ = 1970;
                        _loc2_ = int(_loc3_);
                        §§goto(addr702);
                     }
                     else
                     {
                        _loc1_ = 1970;
                        _loc2_ = int(_loc3_);
                     }
                  }
                  while(true)
                  {
                     _loc3_ = _loc2_ >> 31;
                     _loc3_ = int(_loc3_ + _loc1_);
                     _loc6_ = int(_loc2_ / 365);
                     _loc3_ = int(_loc3_ + _loc6_);
                     _loc6_ = int(_loc3_ + -1);
                     _loc7_ = _loc6_ >> 31;
                     _loc7_ = int(_loc7_ >>> 30);
                     _loc7_ = int(_loc6_ + _loc7_);
                     _loc8_ = int(_loc1_ + -1);
                     _loc7_ = _loc7_ >> 2;
                     _loc9_ = _loc8_ >> 31;
                     _loc2_ = int(_loc2_ - _loc7_);
                     _loc7_ = int(_loc6_ / 100);
                     _loc9_ = int(_loc9_ >>> 30);
                     _loc1_ = _loc3_ - _loc1_;
                     _loc2_ = int(_loc2_ + _loc7_);
                     _loc6_ = int(_loc6_ / 400);
                     _loc7_ = int(_loc8_ + _loc9_);
                     _loc2_ = int(_loc2_ - _loc6_);
                     _loc1_ = _loc1_ * 365;
                     _loc6_ = _loc7_ >> 2;
                     _loc1_ = _loc2_ - _loc1_;
                     _loc1_ = _loc1_ + _loc6_;
                     _loc2_ = int(_loc8_ / 100);
                     _loc1_ = _loc1_ - _loc2_;
                     _loc2_ = int(_loc8_ / 400);
                     _loc2_ = int(_loc1_ + _loc2_);
                     _loc1_ = _loc3_;
                     §§goto(addr698);
                  }
               }
               else
               {
                  _loc6_ = int(_loc6_ + -8);
                  _loc8_ = int(_loc8_ + -1);
                  _loc7_ = int(_loc7_ + 1);
                  if(_loc8_ >= 0)
                  {
                     continue;
                  }
               }
            }
            while(true)
            {
               _loc2_ = int(_loc7_);
               _loc7_ = int(_loc8_ + _loc1_);
               if(_loc7_ < 0)
               {
                  _loc8_ = int(_loc2_);
                  §§goto(addr378);
               }
               §§goto(addr406);
            }
         }
         _loc6_ = 0;
         _loc7_ = int(_loc3_ / 86400);
         _loc8_ = int(_loc7_ * 86400);
         _loc8_ = int(_loc3_ - _loc8_);
         _loc1_ = _loc4_;
         §§goto(addr394);
      }
   }
}
