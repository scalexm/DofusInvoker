package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.li8;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_time1 extends Machine
   {
       
      
      public function FSM_time1()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:* = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:* = 0;
         var _loc11_:int = 0;
         var _loc12_:* = 0;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc15_:int = 0;
         FSM_time1.esp = FSM_time1.esp - 4;
         si32(FSM_time1.ebp,FSM_time1.esp);
         FSM_time1.ebp = FSM_time1.esp;
         FSM_time1.esp = FSM_time1.esp - 2064;
         _loc1_ = FSM_time1.ebp + -2064;
         _loc2_ = li32(FSM_time1.ebp + 8);
         _loc3_ = int(li32(_loc2_ + 32));
         _loc4_ = _loc2_ + 32;
         _loc5_ = FSM_time1.ebp + -1040;
         if(_loc3_ >= 2)
         {
            _loc3_ = 1;
            si32(_loc3_,_loc4_);
         }
         _loc3_ = 0;
         FSM_time1.esp = FSM_time1.esp - 12;
         _loc6_ = FSM_time1.ebp + -4;
         si32(_loc2_,FSM_time1.esp);
         si32(_loc6_,FSM_time1.esp + 4);
         si32(_loc3_,FSM_time1.esp + 8);
         FSM_time1.esp = FSM_time1.esp - 4;
         FSM_time1.start();
         _loc3_ = int(FSM_time1.eax);
         FSM_time1.esp = FSM_time1.esp + 12;
         _loc6_ = li32(FSM_time1.ebp + -4);
         if(_loc6_ == 0)
         {
            _loc3_ = 1;
            FSM_time1.esp = FSM_time1.esp - 12;
            _loc6_ = FSM_time1.ebp + -4;
            si32(_loc2_,FSM_time1.esp);
            si32(_loc6_,FSM_time1.esp + 4);
            si32(_loc3_,FSM_time1.esp + 8);
            FSM_time1.esp = FSM_time1.esp - 4;
            FSM_time1.start();
            _loc3_ = int(FSM_time1.eax);
            FSM_time1.esp = FSM_time1.esp + 12;
         }
         _loc6_ = li32(FSM_time1.ebp + -4);
         if(_loc6_ != 0)
         {
            _loc1_ = _loc3_;
         }
         else
         {
            _loc3_ = int(li32(_loc4_));
            if(_loc3_ <= -1)
            {
               _loc3_ = 0;
               si32(_loc3_,_loc4_);
               _loc3_ = int(li32(FSM_time1 + 8));
               if(_loc3_ <= 0)
               {
                  _loc1_ = 0;
               }
               else
               {
                  _loc6_ = 0;
               }
               addr330:
               _loc3_ = int(li32(FSM_time1 + 4));
               _loc3_ = int(_loc3_ + -1);
               if(_loc3_ <= -1)
               {
                  _loc3_ = 0;
               }
               else
               {
                  _loc6_ = 0;
                  _loc7_ = _loc5_;
                  loop0:
                  while(true)
                  {
                     _loc8_ = FSM_time1;
                     _loc9_ = _loc7_;
                     while(true)
                     {
                        _loc10_ = int(FSM_time1.ebp + -2064);
                        _loc11_ = _loc8_ + _loc3_;
                        _loc11_ = li8(_loc11_ + 1496);
                        _loc12_ = _loc11_ << 2;
                        _loc10_ = int(_loc10_ + _loc12_);
                        _loc12_ = int(li32(_loc10_));
                        if(_loc12_ == 0)
                        {
                           _loc8_ = 1;
                           si32(_loc8_,_loc10_);
                           si32(_loc11_,_loc9_);
                           _loc7_ = _loc7_ + 4;
                           _loc6_ = _loc6_ + 1;
                           _loc3_ = int(_loc3_ + -1);
                           if(_loc3_ <= -1)
                           {
                              _loc3_ = int(_loc6_);
                              break;
                           }
                           continue loop0;
                        }
                        _loc3_ = int(_loc3_ + -1);
                        if(_loc3_ <= -1)
                        {
                           _loc3_ = int(_loc6_);
                           break;
                        }
                     }
                  }
               }
               _loc9_ = _loc3_;
               _loc6_ = 0;
               _loc8_ = _loc2_;
               _loc3_ = int(_loc5_);
               loop2:
               while(true)
               {
                  _loc7_ = _loc3_;
                  _loc3_ = int(_loc1_);
                  _loc1_ = _loc7_;
                  if(_loc6_ >= _loc9_)
                  {
                     _loc1_ = -1;
                     break;
                  }
                  _loc10_ = int(FSM_time1);
                  _loc1_ = li32(_loc1_);
                  _loc11_ = _loc1_ * 20;
                  _loc10_ = int(_loc10_ + _loc11_);
                  _loc10_ = int(li32(_loc10_ + 1872));
                  if(_loc10_ != _loc3_)
                  {
                     _loc1_ = _loc3_;
                  }
                  else
                  {
                     _loc10_ = int(FSM_time1);
                     _loc1_ = _loc1_ * 20;
                     _loc1_ = _loc10_ + _loc1_;
                     _loc1_ = _loc1_ + 1868;
                     _loc10_ = 0;
                     _loc11_ = _loc5_;
                     while(true)
                     {
                        _loc12_ = int(_loc11_);
                        _loc11_ = _loc10_;
                        _loc10_ = int(_loc3_);
                        _loc3_ = int(_loc12_);
                        if(_loc11_ >= _loc9_)
                        {
                           break;
                        }
                        _loc13_ = FSM_time1;
                        _loc3_ = int(li32(_loc3_));
                        _loc14_ = _loc3_ * 20;
                        _loc13_ = _loc13_ + _loc14_;
                        _loc13_ = li32(_loc13_ + 1872);
                        if(_loc13_ == _loc10_)
                        {
                           _loc3_ = int(_loc10_);
                        }
                        else
                        {
                           _loc13_ = FSM_time1;
                           _loc3_ = int(_loc3_ * 20);
                           _loc3_ = int(_loc13_ + _loc3_);
                           _loc13_ = li32(_loc8_);
                           _loc14_ = li32(_loc3_ + 1868);
                           _loc15_ = li32(_loc1_);
                           _loc13_ = _loc14_ + _loc13_;
                           _loc10_ = int(_loc10_ == 0?1:0);
                           _loc13_ = _loc13_ - _loc15_;
                           si32(_loc13_,_loc8_);
                           _loc10_ = _loc10_ & 1;
                           si32(_loc10_,_loc4_);
                           FSM_time1.esp = FSM_time1.esp - 12;
                           _loc10_ = int(FSM_time1.ebp + -4);
                           _loc13_ = 0;
                           si32(_loc2_,FSM_time1.esp);
                           si32(_loc10_,FSM_time1.esp + 4);
                           si32(_loc13_,FSM_time1.esp + 8);
                           FSM_time1.esp = FSM_time1.esp - 4;
                           FSM_time1.start();
                           _loc10_ = int(FSM_time1.eax);
                           FSM_time1.esp = FSM_time1.esp + 12;
                           _loc13_ = li32(FSM_time1.ebp + -4);
                           _loc3_ = int(_loc3_ + 1868);
                           if(_loc13_ == 0)
                           {
                              _loc10_ = 1;
                              FSM_time1.esp = FSM_time1.esp - 12;
                              _loc13_ = FSM_time1.ebp + -4;
                              si32(_loc2_,FSM_time1.esp);
                              si32(_loc13_,FSM_time1.esp + 4);
                              si32(_loc10_,FSM_time1.esp + 8);
                              FSM_time1.esp = FSM_time1.esp - 4;
                              FSM_time1.start();
                              _loc10_ = int(FSM_time1.eax);
                              FSM_time1.esp = FSM_time1.esp + 12;
                           }
                           _loc13_ = li32(FSM_time1.ebp + -4);
                           if(_loc13_ != 0)
                           {
                              _loc1_ = _loc10_;
                              break loop2;
                           }
                           _loc10_ = int(li32(_loc8_));
                           _loc3_ = int(li32(_loc3_));
                           _loc13_ = li32(_loc1_);
                           _loc3_ = int(_loc10_ - _loc3_);
                           _loc3_ = int(_loc3_ + _loc13_);
                           si32(_loc3_,_loc8_);
                           _loc3_ = int(li32(_loc4_));
                           _loc3_ = int(_loc3_ == 0?1:0);
                           _loc3_ = _loc3_ & 1;
                           si32(_loc3_,_loc4_);
                        }
                        _loc10_ = int(_loc12_ + 4);
                        _loc12_ = int(_loc11_ + 1);
                        _loc11_ = _loc10_;
                        _loc10_ = int(_loc12_);
                     }
                     _loc1_ = _loc10_;
                  }
                  _loc3_ = int(_loc7_ + 4);
                  _loc6_ = _loc6_ + 1;
               }
            }
            else
            {
               _loc7_ = li32(FSM_time1 + 8);
               if(_loc7_ <= 0)
               {
                  _loc1_ = _loc3_;
               }
               else
               {
                  _loc6_ = _loc3_;
                  _loc3_ = int(_loc7_);
               }
               §§goto(addr330);
            }
            _loc7_ = 0;
            do
            {
               _loc8_ = 0;
               si32(_loc8_,_loc1_);
               _loc1_ = _loc1_ + 4;
               _loc7_ = _loc7_ + 1;
            }
            while(_loc3_ > _loc7_);
            
            _loc1_ = _loc6_;
            §§goto(addr330);
         }
         FSM_time1.eax = _loc1_;
         FSM_time1.esp = FSM_time1.ebp;
         FSM_time1.ebp = li32(FSM_time1.esp);
         FSM_time1.esp = FSM_time1.esp + 4;
         FSM_time1.esp = FSM_time1.esp + 4;
      }
   }
}
