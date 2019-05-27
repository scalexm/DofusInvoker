package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.li8;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_settzname extends Machine
   {
       
      
      public function FSM_settzname()
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
         var _loc6_:* = 0;
         FSM_settzname.esp = FSM_settzname.esp - 4;
         si32(FSM_settzname.ebp,FSM_settzname.esp);
         FSM_settzname.ebp = FSM_settzname.esp;
         FSM_settzname.esp = FSM_settzname.esp - 0;
         _loc1_ = FSM_settzname;
         si32(_loc1_,FSM_settzname);
         si32(_loc1_,FSM_settzname + 4);
         _loc1_ = li32(FSM_settzname + 8);
         if(_loc1_ >= 1)
         {
            _loc2_ = FSM_settzname;
            _loc3_ = 0;
            while(true)
            {
               _loc4_ = FSM_settzname;
               _loc5_ = int(li32(_loc2_ + 1872));
               _loc6_ = int(li32(_loc2_ + 1876));
               _loc4_ = _loc4_ + _loc6_;
               _loc6_ = int(FSM_settzname);
               _loc5_ = _loc5_ << 2;
               _loc4_ = _loc4_ + 6988;
               _loc5_ = int(_loc6_ + _loc5_);
               si32(_loc4_,_loc5_);
               _loc2_ = _loc2_ + 20;
               _loc3_ = _loc3_ + 1;
               if(_loc1_ > _loc3_)
               {
                  continue;
               }
               break;
            }
         }
         _loc3_ = li32(FSM_settzname + 4);
         if(_loc3_ >= 1)
         {
            _loc2_ = FSM_settzname;
            _loc1_ = 0;
            while(true)
            {
               _loc4_ = FSM_settzname;
               _loc5_ = int(_loc2_ + _loc1_);
               _loc5_ = int(li8(_loc5_ + 1496));
               _loc5_ = int(_loc5_ * 20);
               _loc5_ = int(_loc4_ + _loc5_);
               _loc6_ = int(li32(_loc5_ + 1872));
               _loc5_ = int(li32(_loc5_ + 1876));
               _loc4_ = _loc4_ + _loc5_;
               _loc5_ = int(FSM_settzname);
               _loc6_ = _loc6_ << 2;
               _loc4_ = _loc4_ + 6988;
               _loc5_ = int(_loc5_ + _loc6_);
               si32(_loc4_,_loc5_);
               _loc1_ = _loc1_ + 1;
               if(_loc3_ > _loc1_)
               {
                  continue;
               }
               break;
            }
         }
         FSM_settzname.esp = FSM_settzname.ebp;
         FSM_settzname.ebp = li32(FSM_settzname.esp);
         FSM_settzname.esp = FSM_settzname.esp + 4;
         FSM_settzname.esp = FSM_settzname.esp + 4;
      }
   }
}
