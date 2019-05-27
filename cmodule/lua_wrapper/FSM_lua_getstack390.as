package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.li8;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_lua_getstack390 extends Machine
   {
       
      
      public function FSM_lua_getstack390()
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
         var _loc7_:* = 0;
         FSM_lua_getstack390.esp = FSM_lua_getstack390.esp - 4;
         si32(FSM_lua_getstack390.ebp,FSM_lua_getstack390.esp);
         FSM_lua_getstack390.ebp = FSM_lua_getstack390.esp;
         FSM_lua_getstack390.esp = FSM_lua_getstack390.esp - 0;
         _loc1_ = li32(FSM_lua_getstack390.ebp + 8);
         _loc2_ = li32(FSM_lua_getstack390.ebp + 12);
         _loc3_ = li32(FSM_lua_getstack390.ebp + 16);
         _loc4_ = li32(FSM_lua_getstack390.ebp + 20);
         _loc5_ = _loc1_;
         if(_loc3_ >= 1)
         {
            _loc6_ = 0;
            while(true)
            {
               _loc7_ = int(_loc5_);
               if(uint(_loc5_) <= uint(_loc2_))
               {
                  _loc1_ = _loc7_;
                  break;
               }
               _loc7_ = int(li32(_loc5_ + 4));
               _loc7_ = int(li32(_loc7_));
               _loc7_ = int(li8(_loc7_ + 6));
               _loc3_ = _loc3_ + -1;
               if(_loc7_ == 0)
               {
                  _loc7_ = int(li32(_loc5_ + 20));
                  _loc3_ = _loc3_ - _loc7_;
               }
               _loc7_ = _loc6_ ^ -1;
               _loc7_ = int(_loc7_ * 24);
               _loc5_ = _loc5_ + -24;
               _loc6_ = _loc6_ + 1;
               _loc7_ = int(_loc1_ + _loc7_);
               if(_loc3_ >= 1)
               {
                  continue;
               }
               _loc1_ = _loc7_;
               break;
            }
         }
         if(_loc3_ == 0)
         {
            if(uint(_loc1_) > uint(_loc2_))
            {
               _loc3_ = 1;
               _loc1_ = _loc1_ - _loc2_;
               _loc1_ = _loc1_ / 24;
               si32(_loc1_,_loc4_ + 96);
               FSM_lua_getstack390.eax = _loc3_;
            }
            addr225:
            FSM_lua_getstack390.esp = FSM_lua_getstack390.ebp;
            FSM_lua_getstack390.ebp = li32(FSM_lua_getstack390.esp);
            FSM_lua_getstack390.esp = FSM_lua_getstack390.esp + 4;
            FSM_lua_getstack390.esp = FSM_lua_getstack390.esp + 4;
            return;
         }
         if(_loc3_ <= -1)
         {
            _loc1_ = 0;
            si32(_loc1_,_loc4_ + 96);
            _loc1_ = 1;
         }
         else
         {
            _loc1_ = 0;
         }
         FSM_lua_getstack390.eax = _loc1_;
         §§goto(addr225);
      }
   }
}
