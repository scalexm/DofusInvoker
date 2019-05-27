package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.li8;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_strstr extends Machine
   {
       
      
      public function FSM_strstr()
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
         var _loc8_:* = 0;
         var _loc9_:int = 0;
         var _loc10_:* = 0;
         var _loc11_:int = 0;
         var _loc12_:* = 0;
         FSM_strstr.esp = FSM_strstr.esp - 4;
         si32(FSM_strstr.ebp,FSM_strstr.esp);
         FSM_strstr.ebp = FSM_strstr.esp;
         FSM_strstr.esp = FSM_strstr.esp - 0;
         _loc1_ = li32(FSM_strstr.ebp + 12);
         _loc2_ = li8(_loc1_);
         _loc3_ = li32(FSM_strstr.ebp + 8);
         _loc4_ = _loc1_ + 1;
         _loc5_ = _loc3_;
         if(_loc2_ == 0)
         {
            _loc1_ = _loc3_;
            addr94:
            FSM_strstr.eax = _loc1_;
         }
         else
         {
            _loc3_ = li8(_loc4_);
            if(_loc3_ != 0)
            {
               _loc3_ = _loc1_;
               while(true)
               {
                  _loc6_ = li8(_loc3_ + 2);
                  _loc3_ = _loc3_ + 1;
                  if(_loc6_ != 0)
                  {
                     continue;
                  }
                  break;
               }
               _loc3_ = _loc3_ + 1;
            }
            else
            {
               _loc3_ = _loc4_;
            }
            _loc6_ = _loc4_;
            _loc7_ = _loc3_;
            loop1:
            while(true)
            {
               _loc8_ = int(li8(_loc5_));
               _loc9_ = _loc5_;
               if(_loc8_ == 0)
               {
                  _loc1_ = 0;
                  §§goto(addr94);
               }
               else
               {
                  _loc10_ = _loc2_ & 255;
                  _loc8_ = _loc8_ & 255;
                  if(_loc8_ != _loc10_)
                  {
                     continue;
                  }
                  if(_loc3_ != _loc4_)
                  {
                     _loc8_ = 1;
                     _loc10_ = int(_loc7_ - _loc6_);
                     while(true)
                     {
                        _loc11_ = _loc1_ + _loc8_;
                        _loc12_ = int(_loc5_ + _loc8_);
                        _loc12_ = int(li8(_loc12_));
                        _loc11_ = li8(_loc11_);
                        if(_loc12_ == _loc11_)
                        {
                           _loc11_ = _loc10_ + -1;
                           _loc8_ = int(_loc8_ + 1);
                           _loc12_ = _loc12_ & 255;
                           if(_loc12_ != 0)
                           {
                              if(_loc10_ != 1)
                              {
                                 _loc10_ = int(_loc11_);
                                 continue;
                              }
                              break;
                           }
                           break;
                        }
                        continue loop1;
                     }
                  }
                  FSM_strstr.eax = _loc9_;
                  break;
               }
            }
         }
         FSM_strstr.esp = FSM_strstr.ebp;
         FSM_strstr.ebp = li32(FSM_strstr.esp);
         FSM_strstr.esp = FSM_strstr.esp + 4;
         FSM_strstr.esp = FSM_strstr.esp + 4;
      }
   }
}
