package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM___any_on_D2A extends Machine
   {
       
      
      public function FSM___any_on_D2A()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:* = 0;
         var _loc2_:int = 0;
         var _loc3_:* = 0;
         var _loc4_:* = 0;
         var _loc5_:* = 0;
         FSM___any_on_D2A.esp = FSM___any_on_D2A.esp - 4;
         si32(FSM___any_on_D2A.ebp,FSM___any_on_D2A.esp);
         FSM___any_on_D2A.ebp = FSM___any_on_D2A.esp;
         FSM___any_on_D2A.esp = FSM___any_on_D2A.esp - 0;
         _loc1_ = int(li32(FSM___any_on_D2A.ebp + 12));
         _loc2_ = li32(FSM___any_on_D2A.ebp + 8);
         _loc3_ = int(li32(_loc2_ + 16));
         _loc4_ = _loc1_ >> 5;
         if(_loc4_ > _loc3_)
         {
            _loc1_ = int(_loc3_);
         }
         else
         {
            if(_loc4_ < _loc3_)
            {
               _loc1_ = _loc1_ & 31;
               if(_loc1_ != 0)
               {
                  _loc3_ = _loc4_ << 2;
                  _loc3_ = int(_loc2_ + _loc3_);
                  _loc3_ = int(li32(_loc3_ + 20));
                  _loc5_ = int(_loc3_ >>> _loc1_);
                  _loc1_ = _loc5_ << _loc1_;
                  if(_loc1_ != _loc3_)
                  {
                  }
                  addr134:
                  addr136:
                  _loc1_ = 1;
                  FSM___any_on_D2A.eax = _loc1_;
                  FSM___any_on_D2A.esp = FSM___any_on_D2A.ebp;
                  FSM___any_on_D2A.ebp = li32(FSM___any_on_D2A.esp);
                  FSM___any_on_D2A.esp = FSM___any_on_D2A.esp + 4;
                  FSM___any_on_D2A.esp = FSM___any_on_D2A.esp + 4;
                  return;
               }
            }
            _loc1_ = int(_loc4_);
         }
         if(_loc1_ <= 0)
         {
            addr83:
            _loc1_ = 0;
         }
         else
         {
            _loc3_ = 0;
            while(true)
            {
               _loc4_ = _loc3_ ^ -1;
               _loc4_ = int(_loc1_ + _loc4_);
               _loc5_ = _loc4_ << 2;
               _loc5_ = int(_loc2_ + _loc5_);
               _loc5_ = int(li32(_loc5_ + 20));
               if(_loc5_ == 0)
               {
                  _loc3_ = int(_loc3_ + 1);
                  if(_loc4_ >= 1)
                  {
                     continue;
                  }
                  §§goto(addr83);
               }
               else
               {
                  §§goto(addr134);
               }
            }
         }
         §§goto(addr136);
      }
   }
}
