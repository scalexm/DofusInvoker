package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.li8;
   import avm2.intrinsics.memory.si32;
   import avm2.intrinsics.memory.si8;
   
   public final class FSM_luaC_separateudata extends Machine
   {
       
      
      public function FSM_luaC_separateudata()
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
         var _loc7_:* = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:* = 0;
         var _loc11_:int = 0;
         FSM_luaC_separateudata.esp = FSM_luaC_separateudata.esp - 4;
         si32(FSM_luaC_separateudata.ebp,FSM_luaC_separateudata.esp);
         FSM_luaC_separateudata.ebp = FSM_luaC_separateudata.esp;
         FSM_luaC_separateudata.esp = FSM_luaC_separateudata.esp - 0;
         _loc1_ = li32(FSM_luaC_separateudata.ebp + 8);
         _loc2_ = li32(_loc1_ + 16);
         _loc3_ = int(li32(_loc2_ + 104));
         _loc4_ = li32(_loc3_);
         _loc1_ = _loc1_ + 16;
         _loc5_ = li32(FSM_luaC_separateudata.ebp + 12);
         if(_loc4_ == 0)
         {
            _loc1_ = 0;
         }
         else
         {
            _loc6_ = 0;
            _loc2_ = _loc2_ + 48;
            while(true)
            {
               _loc7_ = int(li8(_loc4_ + 5));
               _loc7_ = _loc7_ & 3;
               _loc7_ = _loc7_ | _loc5_;
               if(_loc7_ != 0)
               {
                  _loc7_ = int(li8(_loc4_ + 5));
                  _loc8_ = _loc4_ + 5;
                  _loc9_ = _loc4_;
                  _loc7_ = _loc7_ & 8;
                  if(_loc7_ == 0)
                  {
                     _loc7_ = int(li32(_loc9_ + 8));
                     if(_loc7_ != 0)
                     {
                        _loc10_ = int(li8(_loc7_ + 6));
                        _loc10_ = _loc10_ & 4;
                        if(_loc10_ == 0)
                        {
                           _loc10_ = 2;
                           _loc11_ = li32(_loc1_);
                           _loc11_ = li32(_loc11_ + 176);
                           FSM_luaC_separateudata.esp = FSM_luaC_separateudata.esp - 12;
                           si32(_loc7_,FSM_luaC_separateudata.esp);
                           si32(_loc10_,FSM_luaC_separateudata.esp + 4);
                           si32(_loc11_,FSM_luaC_separateudata.esp + 8);
                           FSM_luaC_separateudata.esp = FSM_luaC_separateudata.esp - 4;
                           FSM_luaC_separateudata.start();
                           _loc7_ = int(FSM_luaC_separateudata.eax);
                           FSM_luaC_separateudata.esp = FSM_luaC_separateudata.esp + 12;
                           if(_loc7_ != 0)
                           {
                              _loc7_ = int(li8(_loc8_));
                              _loc9_ = li32(_loc9_ + 16);
                              _loc7_ = _loc7_ | 8;
                              si8(_loc7_,_loc8_);
                              _loc7_ = int(li32(_loc4_));
                              _loc6_ = _loc6_ + _loc9_;
                              si32(_loc7_,_loc3_);
                              _loc7_ = int(li32(_loc2_));
                              _loc6_ = _loc6_ + 20;
                              _loc8_ = _loc4_;
                              if(_loc7_ == 0)
                              {
                                 si32(_loc4_,_loc8_);
                                 si32(_loc4_,_loc2_);
                                 _loc4_ = _loc6_;
                              }
                              else
                              {
                                 _loc7_ = int(li32(_loc7_));
                                 si32(_loc7_,_loc8_);
                                 _loc7_ = int(li32(_loc2_));
                                 si32(_loc4_,_loc7_);
                                 si32(_loc4_,_loc2_);
                                 _loc4_ = _loc6_;
                              }
                           }
                        }
                     }
                     _loc3_ = int(li8(_loc8_));
                     _loc3_ = _loc3_ | 8;
                     si8(_loc3_,_loc8_);
                     _loc3_ = int(_loc4_);
                     _loc4_ = _loc6_;
                  }
                  addr342:
                  _loc7_ = int(li32(_loc3_));
                  if(_loc7_ != 0)
                  {
                     _loc6_ = _loc4_;
                     _loc4_ = _loc7_;
                     continue;
                  }
                  break;
               }
               _loc3_ = int(_loc4_);
               _loc4_ = _loc6_;
               §§goto(addr342);
            }
            _loc1_ = _loc4_;
         }
         FSM_luaC_separateudata.eax = _loc1_;
         FSM_luaC_separateudata.esp = FSM_luaC_separateudata.ebp;
         FSM_luaC_separateudata.ebp = li32(FSM_luaC_separateudata.esp);
         FSM_luaC_separateudata.esp = FSM_luaC_separateudata.esp + 4;
         FSM_luaC_separateudata.esp = FSM_luaC_separateudata.esp + 4;
      }
   }
}
