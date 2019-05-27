package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.lf64;
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.li8;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_luaH_get extends Machine
   {
       
      
      public function FSM_luaH_get()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:int = 0;
         var _loc2_:* = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         FSM_luaH_get.esp = FSM_luaH_get.esp - 4;
         si32(FSM_luaH_get.ebp,FSM_luaH_get.esp);
         FSM_luaH_get.ebp = FSM_luaH_get.esp;
         FSM_luaH_get.esp = FSM_luaH_get.esp - 0;
         _loc1_ = li32(FSM_luaH_get.ebp + 12);
         _loc2_ = int(li32(_loc1_ + 8));
         _loc3_ = li32(FSM_luaH_get.ebp + 8);
         if(_loc2_ != 0)
         {
            if(_loc2_ != 3)
            {
               if(_loc2_ == 4)
               {
                  _loc2_ = 1;
                  _loc4_ = li8(_loc3_ + 7);
                  _loc2_ = _loc2_ << _loc4_;
                  _loc1_ = li32(_loc1_);
                  _loc4_ = li32(_loc1_ + 8);
                  _loc2_ = int(_loc2_ + -1);
                  _loc2_ = _loc2_ & _loc4_;
                  _loc3_ = li32(_loc3_ + 16);
                  _loc2_ = int(_loc2_ * 28);
                  _loc3_ = _loc3_ + _loc2_;
                  while(true)
                  {
                     _loc2_ = int(li32(_loc3_ + 20));
                     if(_loc2_ == 4)
                     {
                        _loc2_ = int(li32(_loc3_ + 12));
                        if(_loc2_ == _loc1_)
                        {
                           FSM_luaH_get.eax = _loc3_;
                           addr345:
                           FSM_luaH_get.esp = FSM_luaH_get.ebp;
                           FSM_luaH_get.ebp = li32(FSM_luaH_get.esp);
                           FSM_luaH_get.esp = FSM_luaH_get.esp + 4;
                           FSM_luaH_get.esp = FSM_luaH_get.esp + 4;
                           return;
                        }
                     }
                     _loc3_ = li32(_loc3_ + 24);
                     if(_loc3_ != 0)
                     {
                        continue;
                     }
                     break;
                  }
               }
            }
            else
            {
               _loc5_ = lf64(_loc1_);
               _loc2_ = int(int(_loc5_));
               _loc6_ = Number(_loc2_);
               if(_loc6_ == _loc5_)
               {
                  FSM_luaH_get.esp = FSM_luaH_get.esp - 8;
                  si32(_loc3_,FSM_luaH_get.esp);
                  si32(_loc2_,FSM_luaH_get.esp + 4);
                  FSM_luaH_get.esp = FSM_luaH_get.esp - 4;
                  FSM_luaH_get.start();
                  _loc1_ = FSM_luaH_get.eax;
                  FSM_luaH_get.esp = FSM_luaH_get.esp + 8;
               }
               addr173:
               FSM_luaH_get.eax = _loc1_;
               §§goto(addr345);
            }
            FSM_luaH_get.esp = FSM_luaH_get.esp - 8;
            si32(_loc3_,FSM_luaH_get.esp);
            si32(_loc1_,FSM_luaH_get.esp + 4);
            FSM_luaH_get.esp = FSM_luaH_get.esp - 4;
            FSM_luaH_get.start();
            _loc2_ = int(FSM_luaH_get.eax);
            FSM_luaH_get.esp = FSM_luaH_get.esp + 8;
            while(true)
            {
               FSM_luaH_get.esp = FSM_luaH_get.esp - 8;
               _loc3_ = _loc2_ + 12;
               si32(_loc3_,FSM_luaH_get.esp);
               si32(_loc1_,FSM_luaH_get.esp + 4);
               FSM_luaH_get.esp = FSM_luaH_get.esp - 4;
               FSM_luaH_get.start();
               _loc3_ = FSM_luaH_get.eax;
               FSM_luaH_get.esp = FSM_luaH_get.esp + 8;
               if(_loc3_ != 0)
               {
                  FSM_luaH_get.eax = _loc2_;
                  break;
               }
               _loc2_ = int(li32(_loc2_ + 24));
               if(_loc2_ != 0)
               {
                  continue;
               }
            }
            §§goto(addr345);
         }
         _loc1_ = FSM_luaH_get;
         §§goto(addr173);
      }
   }
}
