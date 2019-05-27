package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.lf64;
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.sf64;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_db_getregistry extends Machine
   {
       
      
      public function FSM_db_getregistry()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:Number = NaN;
         FSM_db_getregistry.esp = FSM_db_getregistry.esp - 4;
         si32(FSM_db_getregistry.ebp,FSM_db_getregistry.esp);
         FSM_db_getregistry.ebp = FSM_db_getregistry.esp;
         FSM_db_getregistry.esp = FSM_db_getregistry.esp - 0;
         _loc1_ = -10000;
         FSM_db_getregistry.esp = FSM_db_getregistry.esp - 8;
         _loc2_ = li32(FSM_db_getregistry.ebp + 8);
         si32(_loc2_,FSM_db_getregistry.esp);
         si32(_loc1_,FSM_db_getregistry.esp + 4);
         FSM_db_getregistry.esp = FSM_db_getregistry.esp - 4;
         FSM_db_getregistry.start();
         _loc1_ = FSM_db_getregistry.eax;
         FSM_db_getregistry.esp = FSM_db_getregistry.esp + 8;
         _loc3_ = li32(_loc2_ + 8);
         _loc4_ = lf64(_loc1_);
         sf64(_loc4_,_loc3_);
         _loc1_ = li32(_loc1_ + 8);
         si32(_loc1_,_loc3_ + 8);
         _loc1_ = li32(_loc2_ + 8);
         _loc1_ = _loc1_ + 12;
         si32(_loc1_,_loc2_ + 8);
         _loc1_ = 1;
         FSM_db_getregistry.eax = _loc1_;
         FSM_db_getregistry.esp = FSM_db_getregistry.ebp;
         FSM_db_getregistry.ebp = li32(FSM_db_getregistry.esp);
         FSM_db_getregistry.esp = FSM_db_getregistry.esp + 4;
         FSM_db_getregistry.esp = FSM_db_getregistry.esp + 4;
      }
   }
}
