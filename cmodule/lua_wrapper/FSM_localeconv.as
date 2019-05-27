package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.li8;
   import avm2.intrinsics.memory.si32;
   import avm2.intrinsics.memory.si8;
   
   public final class FSM_localeconv extends Machine
   {
       
      
      public function FSM_localeconv()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         FSM_localeconv.esp = FSM_localeconv.esp - 4;
         si32(FSM_localeconv.ebp,FSM_localeconv.esp);
         FSM_localeconv.ebp = FSM_localeconv.esp;
         FSM_localeconv.esp = FSM_localeconv.esp - 0;
         _loc1_ = li8(FSM_localeconv);
         if(_loc1_ == 0)
         {
            _loc1_ = 1;
            si8(_loc1_,FSM_localeconv);
         }
         _loc1_ = li8(FSM_localeconv);
         if(_loc1_ == 0)
         {
            _loc1_ = FSM_localeconv;
            _loc2_ = li32(FSM_localeconv);
            _loc3_ = FSM_localeconv;
            _loc1_ = _loc2_ == 0?int(_loc1_):int(_loc3_);
            _loc2_ = li32(_loc1_);
            si32(_loc2_,FSM_localeconv);
            _loc2_ = li32(_loc1_ + 4);
            si32(_loc2_,FSM_localeconv);
            _loc1_ = li32(_loc1_ + 8);
            si32(_loc1_,FSM_localeconv);
            _loc1_ = 1;
            si8(_loc1_,FSM_localeconv);
         }
         FSM_localeconv.esp = FSM_localeconv.ebp;
         FSM_localeconv.ebp = li32(FSM_localeconv.esp);
         FSM_localeconv.esp = FSM_localeconv.esp + 4;
         FSM_localeconv.esp = FSM_localeconv.esp + 4;
      }
   }
}
