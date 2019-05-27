package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_getS extends Machine
   {
       
      
      public function FSM_getS()
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
         FSM_getS.esp = FSM_getS.esp - 4;
         si32(FSM_getS.ebp,FSM_getS.esp);
         FSM_getS.ebp = FSM_getS.esp;
         FSM_getS.esp = FSM_getS.esp - 0;
         _loc1_ = li32(FSM_getS.ebp + 12);
         _loc2_ = li32(_loc1_ + 4);
         _loc3_ = _loc1_ + 4;
         _loc4_ = li32(FSM_getS.ebp + 16);
         if(_loc2_ != 0)
         {
            _loc5_ = 0;
            si32(_loc2_,_loc4_);
            si32(_loc5_,_loc3_);
            _loc1_ = li32(_loc1_);
         }
         else
         {
            _loc1_ = 0;
         }
         FSM_getS.eax = _loc1_;
         FSM_getS.esp = FSM_getS.ebp;
         FSM_getS.ebp = li32(FSM_getS.esp);
         FSM_getS.esp = FSM_getS.esp + 4;
         FSM_getS.esp = FSM_getS.esp + 4;
      }
   }
}
