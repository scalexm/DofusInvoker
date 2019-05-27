package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.li8;
   import avm2.intrinsics.memory.si32;
   import avm2.intrinsics.memory.si8;
   
   public final class FSM___fix_locale_grouping_str extends Machine
   {
       
      
      public function FSM___fix_locale_grouping_str()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:* = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:* = 0;
         var _loc11_:* = 0;
         FSM___fix_locale_grouping_str.esp = FSM___fix_locale_grouping_str.esp - 4;
         si32(FSM___fix_locale_grouping_str.ebp,FSM___fix_locale_grouping_str.esp);
         FSM___fix_locale_grouping_str.ebp = FSM___fix_locale_grouping_str.esp;
         FSM___fix_locale_grouping_str.esp = FSM___fix_locale_grouping_str.esp - 0;
         _loc1_ = li32(FSM___fix_locale_grouping_str.ebp + 8);
         if(_loc1_ != 0)
         {
            _loc2_ = li8(_loc1_);
            if(_loc2_ != 0)
            {
               _loc2_ = _loc1_;
               _loc3_ = _loc1_;
               loop0:
               while(true)
               {
                  _loc7_ = _loc2_;
                  _loc5_ = _loc3_;
                  _loc3_ = li8(_loc7_);
                  _loc4_ = int(_loc5_);
                  _loc6_ = _loc7_;
                  if(_loc3_ != 0)
                  {
                     _loc3_ = 0;
                     _loc2_ = _loc3_;
                     while(true)
                     {
                        _loc8_ = _loc6_ + _loc2_;
                        _loc8_ = li8(_loc8_);
                        _loc9_ = _loc4_ + _loc3_;
                        if(_loc8_ != 59)
                        {
                           _loc10_ = _loc8_ & 255;
                           if(_loc10_ == 45)
                           {
                              _loc10_ = int(_loc6_ + _loc2_);
                              _loc10_ = int(li8(_loc10_ + 1));
                              if(_loc10_ == 49)
                              {
                                 _loc8_ = 127;
                                 si8(_loc8_,_loc9_);
                                 _loc8_ = _loc6_ + _loc2_;
                                 _loc8_ = li8(_loc8_ + 2);
                                 _loc2_ = _loc2_ + 2;
                                 _loc3_ = _loc3_ + 1;
                                 if(_loc8_ != 0)
                                 {
                                    continue;
                                 }
                                 _loc3_ = _loc5_ + _loc3_;
                              }
                              addr375:
                              FSM___fix_locale_grouping_str.esp = FSM___fix_locale_grouping_str.ebp;
                              FSM___fix_locale_grouping_str.ebp = li32(FSM___fix_locale_grouping_str.esp);
                              FSM___fix_locale_grouping_str.esp = FSM___fix_locale_grouping_str.esp + 4;
                              FSM___fix_locale_grouping_str.esp = FSM___fix_locale_grouping_str.esp + 4;
                              return;
                           }
                           _loc4_ = int(FSM___fix_locale_grouping_str);
                           _loc10_ = _loc8_ & 255;
                           _loc10_ = _loc10_ << 2;
                           _loc4_ = int(_loc4_ + _loc10_);
                           _loc4_ = int(li32(_loc4_ + 52));
                           _loc4_ = _loc4_ & 1024;
                           if(_loc4_ != 0)
                           {
                              _loc4_ = int(FSM___fix_locale_grouping_str);
                              _loc10_ = _loc2_ | 1;
                              _loc7_ = _loc7_ + _loc10_;
                              _loc10_ = int(li8(_loc7_));
                              _loc11_ = _loc10_ << 2;
                              _loc4_ = int(_loc4_ + _loc11_);
                              _loc4_ = int(li32(_loc4_ + 52));
                              _loc8_ = _loc8_ + -48;
                              _loc4_ = _loc4_ & 1024;
                              if(_loc4_ == 0)
                              {
                                 _loc2_ = _loc6_ + _loc2_;
                                 _loc7_ = _loc8_;
                              }
                              else
                              {
                                 _loc2_ = _loc8_ * 10;
                                 _loc2_ = _loc2_ + _loc10_;
                                 _loc4_ = int(_loc2_ + -48);
                                 _loc2_ = _loc7_;
                                 _loc7_ = _loc4_;
                              }
                              _loc4_ = int(_loc7_);
                              si8(_loc4_,_loc9_);
                              _loc4_ = _loc4_ & 255;
                              if(_loc4_ == 0)
                              {
                                 _loc2_ = FSM___fix_locale_grouping_str;
                                 _loc2_ = _loc9_ == _loc1_?int(_loc2_):int(_loc1_);
                                 FSM___fix_locale_grouping_str.eax = _loc2_;
                                 §§goto(addr375);
                              }
                              else
                              {
                                 _loc3_ = _loc3_ + _loc5_;
                                 _loc3_ = _loc3_ + 1;
                                 break;
                              }
                           }
                           else
                           {
                              break loop0;
                           }
                        }
                        else
                        {
                           _loc2_ = _loc6_ + _loc2_;
                           _loc3_ = _loc4_ + _loc3_;
                           break;
                        }
                     }
                     _loc2_ = _loc2_ + 1;
                     continue;
                  }
                  _loc3_ = _loc5_;
                  _loc2_ = _loc3_;
                  _loc3_ = 0;
                  addr371:
                  si8(_loc3_,_loc2_);
                  FSM___fix_locale_grouping_str.eax = _loc1_;
                  §§goto(addr375);
               }
            }
         }
         _loc1_ = FSM___fix_locale_grouping_str;
         §§goto(addr371);
      }
   }
}
