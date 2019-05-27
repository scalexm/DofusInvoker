package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.li8;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM___collate_lookup extends Machine
   {
       
      
      public function FSM___collate_lookup()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:* = 0;
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
         var _loc12_:* = 0;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc15_:* = 0;
         var _loc16_:int = 0;
         FSM___collate_lookup.esp = FSM___collate_lookup.esp - 4;
         si32(FSM___collate_lookup.ebp,FSM___collate_lookup.esp);
         FSM___collate_lookup.ebp = FSM___collate_lookup.esp;
         FSM___collate_lookup.esp = FSM___collate_lookup.esp - 0;
         _loc1_ = 1;
         _loc2_ = li32(FSM___collate_lookup.ebp + 12);
         _loc3_ = li32(FSM___collate_lookup.ebp + 20);
         si32(_loc1_,_loc2_);
         _loc1_ = 0;
         _loc4_ = li32(FSM___collate_lookup.ebp + 16);
         si32(_loc1_,_loc3_);
         si32(_loc1_,_loc4_);
         _loc1_ = int(li32(FSM___collate_lookup));
         _loc5_ = li8(_loc1_);
         _loc6_ = li32(FSM___collate_lookup.ebp + 8);
         _loc7_ = _loc1_;
         _loc8_ = _loc6_;
         if(_loc5_ != 0)
         {
            _loc5_ = 0;
            _loc9_ = li8(_loc6_);
            loop0:
            while(true)
            {
               _loc10_ = li8(_loc1_);
               _loc11_ = _loc1_;
               _loc12_ = _loc9_ & 255;
               if(_loc12_ == _loc10_)
               {
                  _loc12_ = _loc10_ & 255;
                  if(_loc12_ != 0)
                  {
                     _loc12_ = int(_loc1_);
                     while(true)
                     {
                        _loc13_ = li8(_loc12_ + 1);
                        _loc12_ = int(_loc12_ + 1);
                        _loc14_ = _loc12_;
                        if(_loc13_ != 0)
                        {
                           _loc12_ = int(_loc14_);
                           continue;
                        }
                        break;
                     }
                  }
                  else
                  {
                     _loc12_ = int(_loc11_);
                  }
                  _loc13_ = _loc11_;
                  _loc14_ = _loc12_;
                  if(_loc12_ != _loc11_)
                  {
                     _loc12_ = 0;
                     _loc14_ = _loc14_ - _loc13_;
                     _loc14_ = _loc14_ + 1;
                     while(true)
                     {
                        _loc15_ = int(_loc1_ + _loc12_);
                        _loc16_ = _loc8_ + _loc12_;
                        _loc16_ = li8(_loc16_);
                        _loc15_ = int(li8(_loc15_));
                        if(_loc16_ == _loc15_)
                        {
                           _loc15_ = _loc16_ & 255;
                           if(_loc15_ != 0)
                           {
                              _loc14_ = _loc14_ + -1;
                              _loc12_ = int(_loc12_ + 1);
                              if(_loc14_ != 1)
                              {
                                 continue;
                              }
                              break loop0;
                           }
                           break loop0;
                        }
                     }
                     si32(_loc1_,_loc3_);
                     FSM___collate_lookup.esp = FSM___collate_lookup.ebp;
                     FSM___collate_lookup.ebp = li32(FSM___collate_lookup.esp);
                     FSM___collate_lookup.esp = FSM___collate_lookup.esp + 4;
                     FSM___collate_lookup.esp = FSM___collate_lookup.esp + 4;
                     return;
                  }
                  break;
               }
               _loc10_ = li8(_loc1_ + 20);
               _loc5_ = _loc5_ + 1;
               _loc1_ = int(_loc1_ + 20);
               if(_loc10_ != 0)
               {
                  continue;
               }
            }
            _loc1_ = _loc10_ & 255;
            if(_loc1_ != 0)
            {
               _loc1_ = 1;
               while(true)
               {
                  _loc6_ = _loc5_ * 20;
                  _loc6_ = _loc7_ + _loc6_;
                  _loc6_ = _loc6_ + _loc1_;
                  _loc8_ = li8(_loc6_);
                  _loc1_ = int(_loc1_ + 1);
                  if(_loc8_ != 0)
                  {
                     continue;
                  }
                  break;
               }
               _loc1_ = int(_loc6_);
            }
            else
            {
               _loc1_ = int(_loc11_);
            }
            _loc5_ = _loc5_ * 20;
            _loc1_ = int(_loc1_ - _loc13_);
            si32(_loc1_,_loc2_);
            _loc1_ = int(_loc7_ + _loc5_);
            _loc5_ = li32(_loc1_ + 12);
            si32(_loc5_,_loc4_);
            _loc1_ = int(li32(_loc1_ + 16));
            §§goto(addr269);
         }
         _loc1_ = int(li8(_loc6_));
         _loc2_ = li32(FSM___collate_lookup);
         _loc1_ = _loc1_ << 3;
         _loc1_ = int(_loc2_ + _loc1_);
         _loc1_ = int(li32(_loc1_));
         si32(_loc1_,_loc4_);
         _loc1_ = int(li8(_loc6_));
         _loc1_ = _loc1_ << 3;
         _loc1_ = int(_loc2_ + _loc1_);
         _loc1_ = int(li32(_loc1_ + 4));
         §§goto(addr269);
      }
   }
}
