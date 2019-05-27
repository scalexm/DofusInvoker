package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.li8;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM__UTF8_mbsnrtowcs extends Machine
   {
       
      
      public function FSM__UTF8_mbsnrtowcs()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:* = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:* = 0;
         var _loc6_:int = 0;
         var _loc7_:* = 0;
         var _loc8_:* = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:* = 0;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:* = 0;
         FSM__UTF8_mbsnrtowcs.esp = FSM__UTF8_mbsnrtowcs.esp - 4;
         si32(FSM__UTF8_mbsnrtowcs.ebp,FSM__UTF8_mbsnrtowcs.esp);
         FSM__UTF8_mbsnrtowcs.ebp = FSM__UTF8_mbsnrtowcs.esp;
         FSM__UTF8_mbsnrtowcs.esp = FSM__UTF8_mbsnrtowcs.esp - 4;
         _loc1_ = int(li32(FSM__UTF8_mbsnrtowcs.ebp + 12));
         _loc2_ = li32(_loc1_);
         _loc3_ = li32(FSM__UTF8_mbsnrtowcs.ebp + 24);
         _loc4_ = li32(FSM__UTF8_mbsnrtowcs.ebp + 8);
         _loc5_ = int(li32(FSM__UTF8_mbsnrtowcs.ebp + 16));
         _loc6_ = li32(FSM__UTF8_mbsnrtowcs.ebp + 20);
         _loc7_ = int(_loc3_);
         if(_loc4_ == 0)
         {
            if(_loc5_ != 0)
            {
               _loc1_ = int(li32(_loc7_ + 4));
               if(_loc1_ >= 1)
               {
                  _loc1_ = int(li8(_loc2_));
                  _loc1_ = _loc1_ << 24;
                  _loc1_ = _loc1_ >> 24;
                  if(_loc1_ >= 1)
                  {
                     addr144:
                     _loc1_ = 86;
                     si32(_loc1_,FSM__UTF8_mbsnrtowcs);
                  }
                  addr152:
                  addr658:
                  _loc1_ = -1;
                  FSM__UTF8_mbsnrtowcs.eax = _loc1_;
               }
            }
            if(_loc5_ != 0)
            {
               _loc1_ = 0;
               _loc4_ = _loc5_;
               while(true)
               {
                  _loc5_ = int(li8(_loc2_));
                  _loc5_ = _loc5_ << 24;
                  _loc5_ = _loc5_ >> 24;
                  if(_loc5_ >= 1)
                  {
                     _loc5_ = 1;
                     addr186:
                     while(true)
                     {
                        _loc1_ = int(_loc1_ + 1);
                        _loc6_ = _loc4_ - _loc5_;
                        _loc2_ = _loc2_ + _loc5_;
                        if(_loc4_ != _loc5_)
                        {
                           break;
                        }
                        _loc4_ = _loc6_;
                     }
                     _loc4_ = _loc6_;
                     continue;
                  }
               }
            }
            else
            {
               _loc1_ = 0;
               _loc4_ = _loc5_;
            }
            while(true)
            {
               _loc5_ = int(FSM__UTF8_mbsnrtowcs.ebp + -4);
               FSM__UTF8_mbsnrtowcs.esp = FSM__UTF8_mbsnrtowcs.esp - 16;
               si32(_loc5_,FSM__UTF8_mbsnrtowcs.esp);
               si32(_loc2_,FSM__UTF8_mbsnrtowcs.esp + 4);
               si32(_loc4_,FSM__UTF8_mbsnrtowcs.esp + 8);
               si32(_loc3_,FSM__UTF8_mbsnrtowcs.esp + 12);
               FSM__UTF8_mbsnrtowcs.esp = FSM__UTF8_mbsnrtowcs.esp - 4;
               FSM__UTF8_mbsnrtowcs.start();
               _loc5_ = int(FSM__UTF8_mbsnrtowcs.eax);
               FSM__UTF8_mbsnrtowcs.esp = FSM__UTF8_mbsnrtowcs.esp + 16;
               if(_loc5_ != -2)
               {
                  if(_loc5_ != -1)
                  {
                     if(_loc5_ != 0)
                     {
                        §§goto(addr186);
                     }
                     else
                     {
                        break;
                     }
                  }
                  else
                  {
                     §§goto(addr152);
                  }
               }
               break;
            }
            §§goto(addr658);
         }
         else
         {
            _loc8_ = int(_loc5_ == 0?1:0);
            if(_loc6_ != 0)
            {
               _loc8_ = _loc8_ ^ 1;
               _loc8_ = _loc8_ & 1;
               if(_loc8_ != 0)
               {
                  _loc7_ = int(li32(_loc7_ + 4));
                  if(_loc7_ >= 1)
                  {
                     _loc7_ = int(li8(_loc2_));
                     _loc7_ = _loc7_ << 24;
                     _loc7_ = _loc7_ >> 24;
                     if(_loc7_ >= 1)
                     {
                        §§goto(addr144);
                     }
                  }
               }
            }
            _loc7_ = 0;
            while(true)
            {
               _loc10_ = _loc7_;
               _loc9_ = _loc2_;
               _loc2_ = _loc6_;
               _loc8_ = int(_loc5_);
               _loc7_ = int(_loc4_);
               _loc5_ = int(_loc9_);
               _loc4_ = _loc7_;
               if(_loc2_ == 0)
               {
                  _loc2_ = _loc10_;
                  _loc4_ = _loc9_;
                  addr533:
                  _loc3_ = _loc4_;
                  si32(_loc3_,_loc1_);
               }
               else
               {
                  _loc11_ = 0;
                  _loc6_ = _loc2_ + -1;
                  _loc2_ = _loc11_;
                  while(true)
                  {
                     _loc11_ = int(_loc5_ + _loc2_);
                     _loc12_ = _loc4_;
                     if(_loc8_ != _loc2_)
                     {
                        _loc13_ = li8(_loc11_);
                        _loc14_ = _loc13_ << 24;
                        _loc14_ = _loc14_ >> 24;
                        if(_loc14_ >= 1)
                        {
                           _loc11_ = _loc13_ << 24;
                           _loc11_ = _loc11_ >> 24;
                           si32(_loc11_,_loc12_);
                           _loc4_ = _loc4_ + 4;
                           _loc11_ = int(_loc2_ + 1);
                           if(_loc6_ != _loc2_)
                           {
                              _loc2_ = _loc11_;
                              continue;
                           }
                           _loc2_ = _loc11_ + _loc10_;
                           _loc4_ = _loc9_ + _loc11_;
                           §§goto(addr533);
                        }
                        else
                        {
                           break;
                        }
                     }
                     break;
                  }
                  FSM__UTF8_mbsnrtowcs.esp = FSM__UTF8_mbsnrtowcs.esp - 16;
                  _loc4_ = _loc8_ - _loc2_;
                  si32(_loc12_,FSM__UTF8_mbsnrtowcs.esp);
                  si32(_loc11_,FSM__UTF8_mbsnrtowcs.esp + 4);
                  si32(_loc4_,FSM__UTF8_mbsnrtowcs.esp + 8);
                  si32(_loc3_,FSM__UTF8_mbsnrtowcs.esp + 12);
                  FSM__UTF8_mbsnrtowcs.esp = FSM__UTF8_mbsnrtowcs.esp - 4;
                  FSM__UTF8_mbsnrtowcs.start();
                  _loc5_ = int(FSM__UTF8_mbsnrtowcs.eax);
                  FSM__UTF8_mbsnrtowcs.esp = FSM__UTF8_mbsnrtowcs.esp + 16;
                  _loc10_ = _loc2_ + _loc10_;
                  _loc6_ = _loc6_ - _loc2_;
                  if(_loc5_ != -2)
                  {
                     if(_loc5_ != 0)
                     {
                        if(_loc5_ == -1)
                        {
                           _loc2_ = -1;
                           si32(_loc11_,_loc1_);
                        }
                        else
                        {
                           _loc8_ = _loc2_ << 2;
                           _loc7_ = int(_loc8_ + _loc7_);
                           _loc2_ = _loc2_ + _loc5_;
                           _loc8_ = int(_loc7_ + 4);
                           _loc7_ = int(_loc10_ + 1);
                           _loc4_ = _loc4_ - _loc5_;
                           _loc2_ = _loc9_ + _loc2_;
                           _loc5_ = int(_loc4_);
                           _loc4_ = _loc8_;
                           continue;
                        }
                     }
                     else
                     {
                        _loc2_ = 0;
                     }
                  }
                  else
                  {
                     _loc2_ = _loc9_ + _loc8_;
                  }
                  si32(_loc2_,_loc1_);
                  FSM__UTF8_mbsnrtowcs.eax = _loc10_;
                  break;
               }
               FSM__UTF8_mbsnrtowcs.eax = _loc2_;
               break;
            }
         }
         FSM__UTF8_mbsnrtowcs.esp = FSM__UTF8_mbsnrtowcs.ebp;
         FSM__UTF8_mbsnrtowcs.ebp = li32(FSM__UTF8_mbsnrtowcs.esp);
         FSM__UTF8_mbsnrtowcs.esp = FSM__UTF8_mbsnrtowcs.esp + 4;
         FSM__UTF8_mbsnrtowcs.esp = FSM__UTF8_mbsnrtowcs.esp + 4;
      }
   }
}
