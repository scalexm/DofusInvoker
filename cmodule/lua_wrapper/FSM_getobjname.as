package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.li8;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_getobjname extends Machine
   {
       
      
      public function FSM_getobjname()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:* = 0;
         var _loc2_:int = 0;
         var _loc3_:* = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:* = 0;
         var _loc9_:* = 0;
         var _loc10_:* = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         FSM_getobjname.esp = FSM_getobjname.esp - 4;
         si32(FSM_getobjname.ebp,FSM_getobjname.esp);
         FSM_getobjname.ebp = FSM_getobjname.esp;
         FSM_getobjname.esp = FSM_getobjname.esp - 0;
         _loc1_ = int(li32(FSM_getobjname.ebp + 12));
         _loc2_ = li32(FSM_getobjname.ebp + 8);
         _loc3_ = int(li32(FSM_getobjname.ebp + 16));
         _loc4_ = li32(FSM_getobjname.ebp + 20);
         _loc5_ = _loc1_ + 12;
         _loc6_ = _loc2_ + 24;
         _loc2_ = _loc2_ + 20;
         _loc7_ = _loc1_ + 4;
         while(true)
         {
            _loc8_ = int(li32(_loc7_));
            _loc9_ = int(li32(_loc8_ + 8));
            if(_loc9_ == 6)
            {
               _loc10_ = int(li32(_loc8_));
               _loc11_ = li8(_loc10_ + 6);
               if(_loc11_ == 0)
               {
                  _loc10_ = int(li32(_loc10_ + 16));
                  if(_loc9_ == 6)
                  {
                     _loc9_ = _loc11_ & 255;
                     if(_loc9_ == 0)
                     {
                        _loc9_ = int(li32(_loc2_));
                        if(_loc9_ == _loc1_)
                        {
                           _loc9_ = int(li32(_loc6_));
                           si32(_loc9_,_loc5_);
                        }
                        _loc8_ = int(li32(_loc8_));
                        _loc8_ = int(li32(_loc8_ + 16));
                        _loc9_ = int(li32(_loc5_));
                        _loc8_ = int(li32(_loc8_ + 12));
                        _loc8_ = int(_loc9_ - _loc8_);
                        _loc8_ = _loc8_ >> 2;
                        _loc8_ = int(_loc8_ + -1);
                     }
                     addr221:
                     _loc9_ = int(li32(_loc10_ + 24));
                     _loc11_ = li32(_loc10_ + 56);
                     FSM_getobjname.esp = FSM_getobjname.esp - 16;
                     _loc12_ = _loc3_ + 1;
                     si32(_loc9_,FSM_getobjname.esp);
                     si32(_loc11_,FSM_getobjname.esp + 4);
                     si32(_loc12_,FSM_getobjname.esp + 8);
                     si32(_loc8_,FSM_getobjname.esp + 12);
                     FSM_getobjname.esp = FSM_getobjname.esp - 4;
                     FSM_getobjname.start();
                     _loc9_ = int(FSM_getobjname.eax);
                     FSM_getobjname.esp = FSM_getobjname.esp + 16;
                     si32(_loc9_,_loc4_);
                     if(_loc9_ != 0)
                     {
                        break;
                     }
                     FSM_getobjname.esp = FSM_getobjname.esp - 12;
                     si32(_loc10_,FSM_getobjname.esp);
                     si32(_loc8_,FSM_getobjname.esp + 4);
                     si32(_loc3_,FSM_getobjname.esp + 8);
                     FSM_getobjname.esp = FSM_getobjname.esp - 4;
                     FSM_getobjname.start();
                     _loc3_ = int(FSM_getobjname.eax);
                     FSM_getobjname.esp = FSM_getobjname.esp + 12;
                     _loc8_ = _loc3_ & 63;
                     if(_loc8_ <= 4)
                     {
                        if(_loc8_ != 0)
                        {
                           if(_loc8_ == 4)
                           {
                              _loc10_ = int(li32(_loc10_ + 28));
                              if(_loc10_ != 0)
                              {
                                 _loc1_ = int(FSM_getobjname);
                                 _loc3_ = _loc3_ & -8388608;
                                 _loc3_ = int(_loc3_ >>> 21);
                                 _loc3_ = int(_loc10_ + _loc3_);
                                 addr406:
                                 _loc3_ = int(li32(_loc3_));
                                 _loc3_ = int(_loc3_ + 16);
                              }
                              else
                              {
                                 _loc3_ = int(FSM_getobjname);
                                 si32(_loc3_,_loc4_);
                                 _loc3_ = int(FSM_getobjname);
                                 FSM_getobjname.eax = _loc3_;
                              }
                           }
                           addr655:
                           FSM_getobjname.esp = FSM_getobjname.ebp;
                           FSM_getobjname.ebp = li32(FSM_getobjname.esp);
                           FSM_getobjname.esp = FSM_getobjname.esp + 4;
                           FSM_getobjname.esp = FSM_getobjname.esp + 4;
                           return;
                        }
                        _loc10_ = int(_loc3_ >>> 6);
                        _loc3_ = int(_loc3_ >>> 23);
                        _loc10_ = _loc10_ & 255;
                        if(_loc3_ < _loc10_)
                        {
                           continue;
                        }
                     }
                     else if(_loc8_ != 11)
                     {
                        if(_loc8_ != 6)
                        {
                           if(_loc8_ == 5)
                           {
                              _loc1_ = int(FSM_getobjname);
                              _loc3_ = int(_loc3_ >>> 14);
                              _loc2_ = li32(_loc10_ + 8);
                              _loc3_ = int(_loc3_ * 12);
                              _loc3_ = int(_loc2_ + _loc3_);
                              §§goto(addr406);
                           }
                           addr651:
                           FSM_getobjname.eax = _loc1_;
                        }
                        else
                        {
                           _loc3_ = int(_loc3_ >>> 14);
                           _loc1_ = _loc3_ & 256;
                           if(_loc1_ != 0)
                           {
                              _loc3_ = _loc3_ & 255;
                              _loc10_ = int(li32(_loc10_ + 8));
                              _loc1_ = int(_loc3_ * 12);
                              _loc1_ = int(_loc10_ + _loc1_);
                              _loc1_ = int(li32(_loc1_ + 8));
                              if(_loc1_ == 4)
                              {
                                 _loc3_ = int(_loc3_ * 12);
                                 _loc3_ = int(_loc10_ + _loc3_);
                                 _loc3_ = int(li32(_loc3_));
                                 _loc3_ = int(_loc3_ + 16);
                              }
                              addr545:
                              _loc10_ = int(FSM_getobjname);
                              si32(_loc3_,_loc4_);
                              FSM_getobjname.eax = _loc10_;
                           }
                           _loc3_ = int(FSM_getobjname);
                           §§goto(addr545);
                        }
                        §§goto(addr655);
                     }
                     else
                     {
                        _loc3_ = int(_loc3_ >>> 14);
                        _loc1_ = _loc3_ & 256;
                        if(_loc1_ != 0)
                        {
                           _loc3_ = _loc3_ & 255;
                           _loc1_ = int(li32(_loc10_ + 8));
                           _loc2_ = _loc3_ * 12;
                           _loc2_ = _loc1_ + _loc2_;
                           _loc2_ = li32(_loc2_ + 8);
                           if(_loc2_ == 4)
                           {
                              _loc3_ = int(_loc3_ * 12);
                              _loc3_ = int(_loc1_ + _loc3_);
                              _loc3_ = int(li32(_loc3_));
                              _loc3_ = int(_loc3_ + 16);
                           }
                           addr644:
                           _loc1_ = int(FSM_getobjname);
                        }
                        _loc3_ = int(FSM_getobjname);
                        §§goto(addr644);
                     }
                     si32(_loc3_,_loc4_);
                     §§goto(addr651);
                  }
                  _loc8_ = -1;
                  §§goto(addr221);
               }
            }
            _loc3_ = 0;
            addr130:
            _loc1_ = int(_loc3_);
            §§goto(addr651);
         }
         _loc3_ = int(FSM_getobjname);
         §§goto(addr130);
      }
   }
}
