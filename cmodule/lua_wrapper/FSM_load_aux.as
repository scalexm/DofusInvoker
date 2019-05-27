package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.lf64;
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.sf64;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_load_aux extends Machine
   {
       
      
      public function FSM_load_aux()
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
         var _loc6_:* = 0;
         var _loc7_:int = 0;
         var _loc8_:Number = NaN;
         FSM_load_aux.esp = FSM_load_aux.esp - 4;
         si32(FSM_load_aux.ebp,FSM_load_aux.esp);
         FSM_load_aux.ebp = FSM_load_aux.esp;
         FSM_load_aux.esp = FSM_load_aux.esp - 0;
         _loc1_ = li32(FSM_load_aux.ebp + 8);
         _loc2_ = li32(FSM_load_aux.ebp + 12);
         if(_loc2_ != 0)
         {
            _loc2_ = 0;
            _loc3_ = li32(_loc1_ + 8);
            si32(_loc2_,_loc3_ + 8);
            _loc2_ = li32(_loc1_ + 8);
            _loc2_ = _loc2_ + 12;
            si32(_loc2_,_loc1_ + 8);
            FSM_load_aux.esp = FSM_load_aux.esp - 8;
            _loc2_ = -2;
            si32(_loc1_,FSM_load_aux.esp);
            si32(_loc2_,FSM_load_aux.esp + 4);
            FSM_load_aux.esp = FSM_load_aux.esp - 4;
            FSM_load_aux.start();
            _loc2_ = FSM_load_aux.eax;
            FSM_load_aux.esp = FSM_load_aux.esp + 8;
            _loc3_ = li32(_loc1_ + 8);
            _loc1_ = _loc1_ + 8;
            _loc4_ = _loc3_;
            if(uint(_loc3_) > uint(_loc2_))
            {
               _loc5_ = 0;
               while(true)
               {
                  _loc6_ = _loc5_ ^ -1;
                  _loc6_ = int(_loc6_ * 12);
                  _loc6_ = int(_loc4_ + _loc6_);
                  _loc8_ = lf64(_loc6_);
                  sf64(_loc8_,_loc3_);
                  _loc7_ = li32(_loc6_ + 8);
                  si32(_loc7_,_loc3_ + 8);
                  _loc3_ = _loc3_ + -12;
                  _loc5_ = _loc5_ + 1;
                  if(uint(_loc6_) > uint(_loc2_))
                  {
                     continue;
                  }
                  break;
               }
            }
            _loc3_ = 2;
            _loc1_ = li32(_loc1_);
            _loc8_ = lf64(_loc1_);
            sf64(_loc8_,_loc2_);
            _loc1_ = li32(_loc1_ + 8);
            si32(_loc1_,_loc2_ + 8);
            FSM_load_aux.eax = _loc3_;
         }
         else
         {
            _loc1_ = 1;
            FSM_load_aux.eax = _loc1_;
         }
         FSM_load_aux.esp = FSM_load_aux.ebp;
         FSM_load_aux.ebp = li32(FSM_load_aux.esp);
         FSM_load_aux.esp = FSM_load_aux.esp + 4;
         FSM_load_aux.esp = FSM_load_aux.esp + 4;
      }
   }
}
