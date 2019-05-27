package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.si32;
   import avm2.intrinsics.memory.si8;
   
   public final class FSM__UTF8_wcsnrtombs extends Machine
   {
       
      
      public function FSM__UTF8_wcsnrtombs()
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
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc15_:int = 0;
         FSM__UTF8_wcsnrtombs.esp = FSM__UTF8_wcsnrtombs.esp - 4;
         si32(FSM__UTF8_wcsnrtombs.ebp,FSM__UTF8_wcsnrtombs.esp);
         FSM__UTF8_wcsnrtombs.ebp = FSM__UTF8_wcsnrtombs.esp;
         FSM__UTF8_wcsnrtombs.esp = FSM__UTF8_wcsnrtombs.esp - 16;
         _loc1_ = li32(FSM__UTF8_wcsnrtombs.ebp + 8);
         _loc2_ = li32(FSM__UTF8_wcsnrtombs.ebp + 12);
         _loc3_ = li32(FSM__UTF8_wcsnrtombs.ebp + 16);
         _loc4_ = li32(FSM__UTF8_wcsnrtombs.ebp + 20);
         _loc5_ = li32(FSM__UTF8_wcsnrtombs.ebp + 24);
         _loc6_ = li32(_loc5_ + 4);
         if(_loc6_ != 0)
         {
            _loc1_ = 22;
            si32(_loc1_,FSM__UTF8_wcsnrtombs);
            _loc1_ = -1;
         }
         else
         {
            _loc6_ = li32(_loc2_);
            if(_loc1_ != 0)
            {
               _loc7_ = 0;
               _loc8_ = FSM__UTF8_wcsnrtombs.ebp + -16;
               _loc9_ = _loc7_;
               _loc10_ = _loc7_;
               while(true)
               {
                  _loc12_ = _loc4_;
                  _loc11_ = _loc7_;
                  _loc7_ = _loc1_ + _loc11_;
                  _loc4_ = _loc6_;
                  if(_loc12_ != 0)
                  {
                     if(_loc9_ == _loc3_)
                     {
                        break;
                     }
                     _loc13_ = li32(_loc4_);
                     if(uint(_loc13_) <= uint(127))
                     {
                        si8(_loc13_,_loc7_);
                        _loc4_ = li32(_loc4_);
                        if(_loc4_ != 0)
                        {
                           _loc4_ = 1;
                           continue;
                        }
                        _loc4_ = 1;
                     }
                     else
                     {
                        _loc14_ = li32(FSM__UTF8_wcsnrtombs);
                        if(uint(_loc14_) < uint(_loc12_))
                        {
                           FSM__UTF8_wcsnrtombs.esp = FSM__UTF8_wcsnrtombs.esp - 12;
                           si32(_loc7_,FSM__UTF8_wcsnrtombs.esp);
                           si32(_loc13_,FSM__UTF8_wcsnrtombs.esp + 4);
                           si32(_loc5_,FSM__UTF8_wcsnrtombs.esp + 8);
                           FSM__UTF8_wcsnrtombs.esp = FSM__UTF8_wcsnrtombs.esp - 4;
                           FSM__UTF8_wcsnrtombs.start();
                           _loc7_ = FSM__UTF8_wcsnrtombs.eax;
                           FSM__UTF8_wcsnrtombs.esp = FSM__UTF8_wcsnrtombs.esp + 12;
                           if(_loc7_ != -1)
                           {
                              addr547:
                              _loc4_ = li32(_loc4_);
                              if(_loc4_ != 0)
                              {
                                 _loc4_ = _loc7_;
                                 continue;
                              }
                              _loc4_ = _loc7_;
                           }
                        }
                        else
                        {
                           FSM__UTF8_wcsnrtombs.esp = FSM__UTF8_wcsnrtombs.esp - 12;
                           si32(_loc8_,FSM__UTF8_wcsnrtombs.esp);
                           si32(_loc13_,FSM__UTF8_wcsnrtombs.esp + 4);
                           si32(_loc5_,FSM__UTF8_wcsnrtombs.esp + 8);
                           FSM__UTF8_wcsnrtombs.esp = FSM__UTF8_wcsnrtombs.esp - 4;
                           FSM__UTF8_wcsnrtombs.start();
                           _loc13_ = FSM__UTF8_wcsnrtombs.eax;
                           FSM__UTF8_wcsnrtombs.esp = FSM__UTF8_wcsnrtombs.esp + 12;
                           if(_loc13_ != -1)
                           {
                              if(uint(_loc13_) <= uint(_loc12_))
                              {
                                 _loc14_ = _loc8_;
                                 _loc15_ = _loc13_;
                                 memcpy(_loc7_,_loc14_,_loc15_);
                                 _loc7_ = _loc13_;
                                 §§goto(addr547);
                              }
                              else
                              {
                                 break;
                              }
                           }
                        }
                        _loc6_ = -1;
                        si32(_loc4_,_loc2_);
                        addr292:
                        FSM__UTF8_wcsnrtombs.eax = _loc6_;
                     }
                     _loc6_ = 0;
                     _loc4_ = _loc10_ + _loc4_;
                     si32(_loc6_,_loc2_);
                     _loc4_ = _loc4_ + -1;
                     FSM__UTF8_wcsnrtombs.eax = _loc4_;
                  }
                  break;
               }
               si32(_loc4_,_loc2_);
               FSM__UTF8_wcsnrtombs.eax = _loc10_;
            }
            else
            {
               if(_loc3_ == 0)
               {
                  _loc6_ = 0;
               }
               else
               {
                  _loc4_ = 0;
                  _loc2_ = _loc3_ + -1;
                  _loc3_ = -1;
                  _loc1_ = FSM__UTF8_wcsnrtombs.ebp + -16;
                  while(true)
                  {
                     _loc7_ = li32(_loc6_);
                     _loc8_ = _loc6_;
                     if(uint(_loc7_) <= uint(127))
                     {
                        _loc7_ = 1;
                     }
                     else
                     {
                        FSM__UTF8_wcsnrtombs.esp = FSM__UTF8_wcsnrtombs.esp - 12;
                        si32(_loc1_,FSM__UTF8_wcsnrtombs.esp);
                        si32(_loc7_,FSM__UTF8_wcsnrtombs.esp + 4);
                        si32(_loc5_,FSM__UTF8_wcsnrtombs.esp + 8);
                        FSM__UTF8_wcsnrtombs.esp = FSM__UTF8_wcsnrtombs.esp - 4;
                        FSM__UTF8_wcsnrtombs.start();
                        _loc7_ = FSM__UTF8_wcsnrtombs.eax;
                        FSM__UTF8_wcsnrtombs.esp = FSM__UTF8_wcsnrtombs.esp + 12;
                        if(_loc7_ == -1)
                        {
                           _loc6_ = -1;
                        }
                     }
                     _loc8_ = li32(_loc8_);
                     if(_loc8_ == 0)
                     {
                        _loc6_ = _loc4_ + _loc7_;
                        _loc6_ = _loc6_ + -1;
                        §§goto(addr292);
                     }
                     else
                     {
                        _loc6_ = _loc6_ + 4;
                        _loc3_ = _loc3_ + 1;
                        _loc4_ = _loc7_ + _loc4_;
                        if(_loc2_ != _loc3_)
                        {
                           continue;
                        }
                        _loc6_ = _loc4_;
                     }
                  }
               }
               _loc1_ = _loc6_;
            }
            addr591:
            FSM__UTF8_wcsnrtombs.esp = FSM__UTF8_wcsnrtombs.ebp;
            FSM__UTF8_wcsnrtombs.ebp = li32(FSM__UTF8_wcsnrtombs.esp);
            FSM__UTF8_wcsnrtombs.esp = FSM__UTF8_wcsnrtombs.esp + 4;
            FSM__UTF8_wcsnrtombs.esp = FSM__UTF8_wcsnrtombs.esp + 4;
            return;
         }
         FSM__UTF8_wcsnrtombs.eax = _loc1_;
         §§goto(addr591);
      }
   }
}
