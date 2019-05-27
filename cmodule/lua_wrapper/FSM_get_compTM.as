package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.li8;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_get_compTM extends Machine
   {
       
      
      public function FSM_get_compTM()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:int = 0;
         var _loc2_:* = 0;
         var _loc3_:int = 0;
         var _loc4_:* = 0;
         var _loc5_:int = 0;
         FSM_get_compTM.esp = FSM_get_compTM.esp - 4;
         si32(FSM_get_compTM.ebp,FSM_get_compTM.esp);
         FSM_get_compTM.ebp = FSM_get_compTM.esp;
         FSM_get_compTM.esp = FSM_get_compTM.esp - 0;
         _loc1_ = li32(FSM_get_compTM.ebp + 8);
         _loc2_ = int(li32(FSM_get_compTM.ebp + 12));
         _loc3_ = li32(FSM_get_compTM.ebp + 16);
         if(_loc2_ != 0)
         {
            _loc4_ = int(li8(_loc2_ + 6));
            _loc4_ = _loc4_ & 16;
            if(_loc4_ == 0)
            {
               _loc4_ = 4;
               _loc5_ = li32(_loc1_ + 16);
               _loc5_ = li32(_loc5_ + 184);
               FSM_get_compTM.esp = FSM_get_compTM.esp - 12;
               si32(_loc2_,FSM_get_compTM.esp);
               si32(_loc4_,FSM_get_compTM.esp + 4);
               si32(_loc5_,FSM_get_compTM.esp + 8);
               FSM_get_compTM.esp = FSM_get_compTM.esp - 4;
               FSM_get_compTM.start();
               _loc4_ = int(FSM_get_compTM.eax);
               FSM_get_compTM.esp = FSM_get_compTM.esp + 12;
            }
            addr156:
            if(_loc4_ != 0)
            {
               if(_loc2_ == _loc3_)
               {
                  _loc1_ = _loc4_;
               }
               else
               {
                  if(_loc3_ != 0)
                  {
                     _loc2_ = int(li8(_loc3_ + 6));
                     _loc2_ = _loc2_ & 16;
                     if(_loc2_ == 0)
                     {
                        _loc2_ = 4;
                        _loc1_ = li32(_loc1_ + 16);
                        _loc1_ = li32(_loc1_ + 184);
                        FSM_get_compTM.esp = FSM_get_compTM.esp - 12;
                        si32(_loc3_,FSM_get_compTM.esp);
                        si32(_loc2_,FSM_get_compTM.esp + 4);
                        si32(_loc1_,FSM_get_compTM.esp + 8);
                        FSM_get_compTM.esp = FSM_get_compTM.esp - 4;
                        FSM_get_compTM.start();
                        _loc1_ = FSM_get_compTM.eax;
                        FSM_get_compTM.esp = FSM_get_compTM.esp + 12;
                     }
                     addr265:
                     if(_loc1_ != 0)
                     {
                        FSM_get_compTM.esp = FSM_get_compTM.esp - 8;
                        si32(_loc4_,FSM_get_compTM.esp);
                        si32(_loc1_,FSM_get_compTM.esp + 4);
                        FSM_get_compTM.esp = FSM_get_compTM.esp - 4;
                        FSM_get_compTM.start();
                        _loc1_ = FSM_get_compTM.eax;
                        FSM_get_compTM.esp = FSM_get_compTM.esp + 8;
                        _loc1_ = _loc1_ == 0?0:int(_loc4_);
                     }
                  }
                  _loc1_ = 0;
                  §§goto(addr265);
               }
               addr322:
               FSM_get_compTM.eax = _loc1_;
               FSM_get_compTM.esp = FSM_get_compTM.ebp;
               FSM_get_compTM.ebp = li32(FSM_get_compTM.esp);
               FSM_get_compTM.esp = FSM_get_compTM.esp + 4;
               FSM_get_compTM.esp = FSM_get_compTM.esp + 4;
               return;
            }
            _loc1_ = 0;
            §§goto(addr322);
         }
         _loc4_ = 0;
         §§goto(addr156);
      }
   }
}
