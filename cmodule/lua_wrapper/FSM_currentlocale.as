package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.li8;
   import avm2.intrinsics.memory.si32;
   import avm2.intrinsics.memory.si8;
   
   public final class FSM_currentlocale extends Machine
   {
       
      
      public function FSM_currentlocale()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:* = 0;
         var _loc8_:int = 0;
         FSM_currentlocale.esp = FSM_currentlocale.esp - 4;
         si32(FSM_currentlocale.ebp,FSM_currentlocale.esp);
         FSM_currentlocale.ebp = FSM_currentlocale.esp;
         FSM_currentlocale.esp = FSM_currentlocale.esp - 0;
         _loc1_ = li8(FSM_currentlocale + 32);
         si8(_loc1_,FSM_currentlocale);
         if(_loc1_ != 0)
         {
            _loc2_ = FSM_currentlocale;
            _loc3_ = FSM_currentlocale;
            _loc4_ = 0;
            while(true)
            {
               _loc5_ = _loc2_ + _loc4_;
               _loc5_ = li8(_loc5_ + 33);
               _loc6_ = _loc3_ + _loc4_;
               si8(_loc5_,_loc6_ + 1);
               _loc4_ = _loc4_ + 1;
               if(_loc5_ != 0)
               {
                  continue;
               }
               break;
            }
         }
         _loc2_ = FSM_currentlocale;
         _loc3_ = 2;
         _loc4_ = 0;
         _loc5_ = _loc2_ + 64;
         loop1:
         while(true)
         {
            _loc6_ = _loc2_ + _loc4_;
            _loc6_ = li8(_loc6_ + 64);
            _loc7_ = _loc1_ & 255;
            if(_loc7_ == _loc6_)
            {
               _loc6_ = FSM_currentlocale;
               _loc7_ = int(_loc1_);
               while(true)
               {
                  _loc8_ = _loc4_ + _loc6_;
                  _loc8_ = _loc8_ + 65;
                  _loc7_ = _loc7_ & 255;
                  if(_loc7_ != 0)
                  {
                     _loc7_ = int(li8(_loc6_ + 33));
                     _loc8_ = li8(_loc8_);
                     _loc6_ = _loc6_ + 1;
                     if(_loc7_ == _loc8_)
                     {
                        continue;
                     }
                     _loc6_ = _loc4_ + _loc6_;
                     _loc6_ = _loc6_ + 64;
                  }
                  break;
               }
               _loc4_ = _loc4_ + 32;
               _loc3_ = _loc3_ + 1;
               if(_loc3_ <= 6)
               {
                  continue;
               }
               break;
            }
            _loc6_ = _loc5_ + _loc4_;
            _loc7_ = int(_loc1_);
            _loc6_ = li8(_loc6_);
            _loc7_ = _loc7_ & 255;
            if(_loc7_ != _loc6_)
            {
               _loc3_ = li8(FSM_currentlocale);
               if(_loc3_ != 0)
               {
                  _loc3_ = FSM_currentlocale;
                  while(true)
                  {
                     _loc4_ = li8(_loc3_ + 1);
                     _loc3_ = _loc3_ + 1;
                     _loc1_ = _loc3_;
                     if(_loc4_ != 0)
                     {
                        _loc3_ = _loc1_;
                        continue;
                     }
                     break;
                  }
               }
               else
               {
                  _loc3_ = FSM_currentlocale;
               }
               _loc4_ = 47;
               _loc1_ = 0;
               si8(_loc4_,_loc3_);
               si8(_loc1_,_loc3_ + 1);
               _loc3_ = li8(FSM_currentlocale);
               if(_loc3_ != 0)
               {
                  _loc3_ = FSM_currentlocale;
                  while(true)
                  {
                     _loc4_ = li8(_loc3_ + 1);
                     _loc3_ = _loc3_ + 1;
                     _loc1_ = _loc3_;
                     if(_loc4_ != 0)
                     {
                        _loc3_ = _loc1_;
                        continue;
                     }
                     break;
                  }
               }
               else
               {
                  _loc3_ = FSM_currentlocale;
               }
               _loc4_ = FSM_currentlocale;
               _loc1_ = 0;
               while(true)
               {
                  _loc2_ = _loc4_ + _loc1_;
                  _loc2_ = li8(_loc2_ + 64);
                  _loc5_ = _loc3_ + _loc1_;
                  si8(_loc2_,_loc5_);
                  _loc1_ = _loc1_ + 1;
                  if(_loc2_ != 0)
                  {
                     continue;
                  }
                  break;
               }
               _loc3_ = li8(FSM_currentlocale);
               if(_loc3_ != 0)
               {
                  _loc3_ = FSM_currentlocale;
                  while(true)
                  {
                     _loc4_ = li8(_loc3_ + 1);
                     _loc3_ = _loc3_ + 1;
                     _loc1_ = _loc3_;
                     if(_loc4_ != 0)
                     {
                        _loc3_ = _loc1_;
                        continue;
                     }
                     break;
                  }
               }
               else
               {
                  _loc3_ = FSM_currentlocale;
               }
               _loc4_ = 47;
               _loc1_ = 0;
               si8(_loc4_,_loc3_);
               si8(_loc1_,_loc3_ + 1);
               _loc3_ = li8(FSM_currentlocale);
               if(_loc3_ != 0)
               {
                  _loc3_ = FSM_currentlocale;
                  while(true)
                  {
                     _loc4_ = li8(_loc3_ + 1);
                     _loc3_ = _loc3_ + 1;
                     _loc1_ = _loc3_;
                     if(_loc4_ != 0)
                     {
                        _loc3_ = _loc1_;
                        continue;
                     }
                     break;
                  }
               }
               else
               {
                  _loc3_ = FSM_currentlocale;
               }
               _loc4_ = FSM_currentlocale;
               _loc1_ = 0;
               while(true)
               {
                  _loc2_ = _loc4_ + _loc1_;
                  _loc2_ = li8(_loc2_ + 96);
                  _loc5_ = _loc3_ + _loc1_;
                  si8(_loc2_,_loc5_);
                  _loc1_ = _loc1_ + 1;
                  if(_loc2_ != 0)
                  {
                     continue;
                  }
                  break;
               }
               _loc3_ = li8(FSM_currentlocale);
               if(_loc3_ != 0)
               {
                  _loc3_ = FSM_currentlocale;
                  while(true)
                  {
                     _loc4_ = li8(_loc3_ + 1);
                     _loc3_ = _loc3_ + 1;
                     _loc1_ = _loc3_;
                     if(_loc4_ != 0)
                     {
                        _loc3_ = _loc1_;
                        continue;
                     }
                     break;
                  }
               }
               else
               {
                  _loc3_ = FSM_currentlocale;
               }
               _loc4_ = 47;
               _loc1_ = 0;
               si8(_loc4_,_loc3_);
               si8(_loc1_,_loc3_ + 1);
               _loc3_ = li8(FSM_currentlocale);
               if(_loc3_ != 0)
               {
                  _loc3_ = FSM_currentlocale;
                  while(true)
                  {
                     _loc4_ = li8(_loc3_ + 1);
                     _loc3_ = _loc3_ + 1;
                     _loc1_ = _loc3_;
                     if(_loc4_ != 0)
                     {
                        _loc3_ = _loc1_;
                        continue;
                     }
                     break;
                  }
               }
               else
               {
                  _loc3_ = FSM_currentlocale;
               }
               _loc4_ = FSM_currentlocale;
               _loc1_ = 0;
               while(true)
               {
                  _loc2_ = _loc4_ + _loc1_;
                  _loc2_ = li8(_loc2_ + 128);
                  _loc5_ = _loc3_ + _loc1_;
                  si8(_loc2_,_loc5_);
                  _loc1_ = _loc1_ + 1;
                  if(_loc2_ != 0)
                  {
                     continue;
                  }
                  break;
               }
               _loc3_ = li8(FSM_currentlocale);
               if(_loc3_ != 0)
               {
                  _loc3_ = FSM_currentlocale;
                  while(true)
                  {
                     _loc4_ = li8(_loc3_ + 1);
                     _loc3_ = _loc3_ + 1;
                     _loc1_ = _loc3_;
                     if(_loc4_ != 0)
                     {
                        _loc3_ = _loc1_;
                        continue;
                     }
                     break;
                  }
               }
               else
               {
                  _loc3_ = FSM_currentlocale;
               }
               _loc4_ = 47;
               _loc1_ = 0;
               si8(_loc4_,_loc3_);
               si8(_loc1_,_loc3_ + 1);
               _loc3_ = li8(FSM_currentlocale);
               if(_loc3_ != 0)
               {
                  _loc3_ = FSM_currentlocale;
                  while(true)
                  {
                     _loc4_ = li8(_loc3_ + 1);
                     _loc3_ = _loc3_ + 1;
                     _loc1_ = _loc3_;
                     if(_loc4_ != 0)
                     {
                        _loc3_ = _loc1_;
                        continue;
                     }
                     break;
                  }
               }
               else
               {
                  _loc3_ = FSM_currentlocale;
               }
               _loc4_ = FSM_currentlocale;
               _loc1_ = 0;
               while(true)
               {
                  _loc2_ = _loc4_ + _loc1_;
                  _loc2_ = li8(_loc2_ + 160);
                  _loc5_ = _loc3_ + _loc1_;
                  si8(_loc2_,_loc5_);
                  _loc1_ = _loc1_ + 1;
                  if(_loc2_ != 0)
                  {
                     continue;
                  }
                  break;
               }
               _loc3_ = li8(FSM_currentlocale);
               if(_loc3_ != 0)
               {
                  _loc3_ = FSM_currentlocale;
                  while(true)
                  {
                     _loc4_ = li8(_loc3_ + 1);
                     _loc3_ = _loc3_ + 1;
                     _loc1_ = _loc3_;
                     if(_loc4_ != 0)
                     {
                        _loc3_ = _loc1_;
                        continue;
                     }
                     break;
                  }
               }
               else
               {
                  _loc3_ = FSM_currentlocale;
               }
               _loc4_ = 47;
               _loc1_ = 0;
               si8(_loc4_,_loc3_);
               si8(_loc1_,_loc3_ + 1);
               _loc3_ = li8(FSM_currentlocale);
               if(_loc3_ != 0)
               {
                  _loc3_ = FSM_currentlocale;
                  while(true)
                  {
                     _loc4_ = li8(_loc3_ + 1);
                     _loc3_ = _loc3_ + 1;
                     _loc1_ = _loc3_;
                     if(_loc4_ != 0)
                     {
                        _loc3_ = _loc1_;
                        continue;
                     }
                     break;
                  }
               }
               else
               {
                  _loc3_ = FSM_currentlocale;
               }
               _loc4_ = FSM_currentlocale;
               _loc1_ = 0;
               while(true)
               {
                  _loc2_ = _loc4_ + _loc1_;
                  _loc2_ = li8(_loc2_ + 192);
                  _loc5_ = _loc3_ + _loc1_;
                  si8(_loc2_,_loc5_);
                  _loc1_ = _loc1_ + 1;
                  if(_loc2_ != 0)
                  {
                     continue;
                  }
                  break loop1;
               }
            }
            else
            {
               §§goto(addr618);
            }
         }
         FSM_currentlocale.esp = FSM_currentlocale.ebp;
         FSM_currentlocale.ebp = li32(FSM_currentlocale.esp);
         FSM_currentlocale.esp = FSM_currentlocale.esp + 4;
         FSM_currentlocale.esp = FSM_currentlocale.esp + 4;
      }
   }
}
