package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_transtime extends Machine
   {
       
      
      public function FSM_transtime()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:* = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:* = 0;
         var _loc9_:* = 0;
         var _loc10_:* = 0;
         FSM_transtime.esp = FSM_transtime.esp - 4;
         si32(FSM_transtime.ebp,FSM_transtime.esp);
         FSM_transtime.ebp = FSM_transtime.esp;
         FSM_transtime.esp = FSM_transtime.esp - 0;
         _loc1_ = li32(FSM_transtime.ebp + 12);
         _loc2_ = li32(FSM_transtime.ebp + 8);
         _loc3_ = li32(FSM_transtime.ebp + 16);
         _loc4_ = li32(FSM_transtime.ebp + 20);
         _loc5_ = _loc1_ & 3;
         if(_loc5_ == 0)
         {
            _loc5_ = int(_loc1_ / 100);
            _loc5_ = int(_loc5_ * 100);
            _loc5_ = int(_loc1_ - _loc5_);
            if(_loc5_ == 0)
            {
               _loc5_ = int(_loc1_ / 400);
               _loc5_ = int(_loc5_ * 400);
               _loc5_ = int(_loc1_ - _loc5_);
               if(_loc5_ != 0)
               {
               }
               addr138:
               _loc6_ = li32(_loc3_);
               if(_loc6_ != 0)
               {
                  if(_loc6_ != 1)
                  {
                     if(_loc6_ == 2)
                     {
                        _loc6_ = li32(_loc3_ + 12);
                        _loc7_ = _loc6_ + -1;
                        if(_loc7_ > 0)
                        {
                           _loc8_ = int(FSM_transtime);
                           _loc9_ = int(_loc5_ * 48);
                           _loc10_ = 0;
                           _loc8_ = int(_loc8_ + _loc9_);
                           _loc9_ = int(_loc10_);
                           do
                           {
                              _loc10_ = int(li32(_loc8_));
                              _loc10_ = int(_loc10_ * 86400);
                              _loc8_ = int(_loc8_ + 4);
                              _loc9_ = int(_loc9_ + 1);
                              _loc2_ = _loc10_ + _loc2_;
                           }
                           while(_loc7_ > _loc9_);
                           
                        }
                        _loc7_ = _loc1_ + -1;
                        _loc1_ = _loc6_ > 2?int(_loc1_):int(_loc7_);
                        _loc7_ = _loc6_ + 9;
                        _loc8_ = int(_loc1_ / 100);
                        _loc9_ = int(_loc7_ / 12);
                        _loc9_ = int(_loc9_ * 12);
                        _loc10_ = int(_loc8_ * 100);
                        _loc7_ = _loc7_ - _loc9_;
                        _loc9_ = int(_loc1_ - _loc10_);
                        _loc10_ = _loc9_ >> 31;
                        _loc8_ = _loc8_ << 1;
                        _loc7_ = _loc7_ * 26;
                        _loc10_ = int(_loc10_ >>> 30);
                        _loc8_ = int(1 - _loc8_);
                        _loc7_ = _loc7_ + 24;
                        _loc10_ = int(_loc9_ + _loc10_);
                        _loc8_ = int(_loc8_ + _loc9_);
                        _loc7_ = _loc7_ / 10;
                        _loc9_ = _loc10_ >> 2;
                        _loc7_ = _loc8_ + _loc7_;
                        _loc7_ = _loc7_ + _loc9_;
                        _loc1_ = _loc1_ / 400;
                        _loc1_ = _loc7_ + _loc1_;
                        _loc7_ = _loc1_ / 7;
                        _loc7_ = _loc7_ * 7;
                        _loc8_ = int(li32(_loc3_ + 4));
                        _loc1_ = _loc1_ - _loc7_;
                        _loc7_ = _loc8_ - _loc1_;
                        _loc8_ = int(_loc7_ + -7);
                        _loc1_ = _loc1_ > -1?int(_loc7_):int(_loc8_);
                        if(_loc1_ >= 0)
                        {
                           _loc7_ = 1;
                           addr563:
                           while(true)
                           {
                              _loc8_ = int(li32(_loc3_ + 8));
                              if(_loc8_ <= _loc7_)
                              {
                              }
                              break;
                           }
                           _loc3_ = li32(_loc3_ + 16);
                           _loc4_ = _loc2_ + _loc4_;
                           _loc3_ = _loc4_ + _loc3_;
                           _loc1_ = _loc1_ * 86400;
                           _loc1_ = _loc3_ + _loc1_;
                        }
                        else
                        {
                           _loc7_ = li32(_loc3_ + 8);
                           _loc1_ = _loc1_ + 7;
                           if(_loc7_ > 1)
                           {
                              _loc7_ = 1;
                           }
                           §§goto(addr573);
                        }
                        while(true)
                        {
                           _loc8_ = int(FSM_transtime);
                           _loc9_ = int(_loc5_ * 48);
                           _loc10_ = _loc6_ << 2;
                           _loc8_ = int(_loc8_ + _loc9_);
                           _loc8_ = int(_loc10_ + _loc8_);
                           _loc8_ = int(li32(_loc8_ + -4));
                           _loc9_ = int(_loc1_ + 7);
                           if(_loc9_ < _loc8_)
                           {
                              _loc7_ = _loc7_ + 1;
                              _loc1_ = _loc9_;
                              §§goto(addr563);
                           }
                           §§goto(addr573);
                        }
                     }
                  }
                  else
                  {
                     _loc1_ = li32(_loc3_ + 4);
                     _loc3_ = li32(_loc3_ + 16);
                     _loc2_ = _loc4_ + _loc2_;
                     _loc2_ = _loc2_ + _loc3_;
                     _loc1_ = _loc1_ * 86400;
                     _loc1_ = _loc2_ + _loc1_;
                  }
                  addr599:
                  FSM_transtime.eax = _loc1_;
                  addr603:
                  FSM_transtime.esp = FSM_transtime.ebp;
                  FSM_transtime.ebp = li32(FSM_transtime.esp);
                  FSM_transtime.esp = FSM_transtime.esp + 4;
                  FSM_transtime.esp = FSM_transtime.esp + 4;
                  return;
               }
               _loc1_ = li32(_loc3_ + 4);
               _loc6_ = _loc1_ * 86400;
               _loc2_ = _loc2_ + _loc6_;
               _loc2_ = _loc2_ + -86400;
               if(_loc1_ >= 60)
               {
                  if(_loc5_ != 0)
                  {
                     _loc1_ = li32(_loc3_ + 16);
                     _loc2_ = _loc4_ + _loc2_;
                     _loc2_ = _loc2_ + _loc1_;
                     _loc2_ = _loc2_ + 86400;
                     FSM_transtime.eax = _loc2_;
                  }
                  §§goto(addr603);
               }
               _loc1_ = _loc2_;
               _loc2_ = li32(_loc3_ + 16);
               _loc1_ = _loc1_ + _loc4_;
               _loc1_ = _loc1_ + _loc2_;
               §§goto(addr599);
            }
            _loc5_ = 1;
            §§goto(addr138);
         }
         _loc5_ = 0;
         §§goto(addr138);
      }
   }
}
