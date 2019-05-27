package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.li8;
   import avm2.intrinsics.memory.si32;
   import avm2.intrinsics.memory.si8;
   
   public final class FSM_markroot extends Machine
   {
       
      
      public function FSM_markroot()
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
         var _loc6_:int = 0;
         FSM_markroot.esp = FSM_markroot.esp - 4;
         si32(FSM_markroot.ebp,FSM_markroot.esp);
         FSM_markroot.ebp = FSM_markroot.esp;
         FSM_markroot.esp = FSM_markroot.esp - 0;
         _loc1_ = 0;
         _loc2_ = int(li32(FSM_markroot.ebp + 8));
         _loc3_ = li32(_loc2_ + 16);
         si32(_loc1_,_loc3_ + 36);
         si32(_loc1_,_loc3_ + 40);
         si32(_loc1_,_loc3_ + 44);
         _loc1_ = li32(_loc3_ + 104);
         _loc4_ = int(li8(_loc1_ + 5));
         _loc5_ = _loc3_ + 104;
         _loc2_ = int(_loc2_ + 16);
         _loc6_ = _loc3_;
         _loc4_ = _loc4_ & 3;
         if(_loc4_ != 0)
         {
            FSM_markroot.esp = FSM_markroot.esp - 8;
            si32(_loc6_,FSM_markroot.esp);
            si32(_loc1_,FSM_markroot.esp + 4);
            FSM_markroot.esp = FSM_markroot.esp - 4;
            FSM_markroot.start();
            FSM_markroot.esp = FSM_markroot.esp + 8;
         }
         _loc1_ = li32(_loc5_);
         _loc4_ = int(li32(_loc1_ + 80));
         if(_loc4_ >= 4)
         {
            _loc1_ = li32(_loc1_ + 72);
            _loc4_ = int(li8(_loc1_ + 5));
            _loc4_ = _loc4_ & 3;
            if(_loc4_ != 0)
            {
               FSM_markroot.esp = FSM_markroot.esp - 8;
               si32(_loc6_,FSM_markroot.esp);
               si32(_loc1_,FSM_markroot.esp + 4);
               FSM_markroot.esp = FSM_markroot.esp - 4;
               FSM_markroot.start();
               FSM_markroot.esp = FSM_markroot.esp + 8;
            }
         }
         _loc1_ = li32(_loc2_);
         _loc2_ = int(li32(_loc1_ + 100));
         if(_loc2_ >= 4)
         {
            _loc1_ = li32(_loc1_ + 92);
            _loc2_ = int(li8(_loc1_ + 5));
            _loc2_ = _loc2_ & 3;
            if(_loc2_ != 0)
            {
               _loc2_ = 0;
               FSM_markroot.esp = FSM_markroot.esp - 8;
               si32(_loc6_,FSM_markroot.esp);
               si32(_loc1_,FSM_markroot.esp + 4);
               FSM_markroot.esp = FSM_markroot.esp - 4;
               FSM_markroot.start();
               FSM_markroot.esp = FSM_markroot.esp + 8;
               _loc1_ = _loc3_ + 132;
               _loc3_ = _loc2_;
               while(true)
               {
                  _loc2_ = int(li32(_loc1_));
                  if(_loc2_ != 0)
                  {
                     _loc4_ = int(li8(_loc2_ + 5));
                     _loc4_ = _loc4_ & 3;
                     if(_loc4_ != 0)
                     {
                        FSM_markroot.esp = FSM_markroot.esp - 8;
                        si32(_loc6_,FSM_markroot.esp);
                        si32(_loc2_,FSM_markroot.esp + 4);
                        FSM_markroot.esp = FSM_markroot.esp - 4;
                        FSM_markroot.start();
                        FSM_markroot.esp = FSM_markroot.esp + 8;
                     }
                  }
                  _loc1_ = _loc1_ + 4;
                  _loc3_ = _loc3_ + 1;
                  if(_loc3_ != 9)
                  {
                     continue;
                  }
                  break;
               }
            }
            addr467:
            _loc1_ = 1;
            si8(_loc1_,_loc6_ + 21);
            FSM_markroot.esp = FSM_markroot.ebp;
            FSM_markroot.ebp = li32(FSM_markroot.esp);
            FSM_markroot.esp = FSM_markroot.esp + 4;
            FSM_markroot.esp = FSM_markroot.esp + 4;
            return;
         }
         _loc1_ = 0;
         _loc3_ = _loc3_ + 132;
         while(true)
         {
            _loc2_ = int(li32(_loc3_));
            if(_loc2_ != 0)
            {
               _loc4_ = int(li8(_loc2_ + 5));
               _loc4_ = _loc4_ & 3;
               if(_loc4_ != 0)
               {
                  FSM_markroot.esp = FSM_markroot.esp - 8;
                  si32(_loc6_,FSM_markroot.esp);
                  si32(_loc2_,FSM_markroot.esp + 4);
                  FSM_markroot.esp = FSM_markroot.esp - 4;
                  FSM_markroot.start();
                  FSM_markroot.esp = FSM_markroot.esp + 8;
               }
            }
            _loc3_ = _loc3_ + 4;
            _loc1_ = _loc1_ + 1;
            if(_loc1_ != 9)
            {
               continue;
            }
            §§goto(addr467);
         }
      }
   }
}
