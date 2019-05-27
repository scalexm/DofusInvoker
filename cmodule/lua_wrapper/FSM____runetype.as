package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM____runetype extends Machine
   {
       
      
      public function FSM____runetype()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:* = 0;
         var _loc2_:int = 0;
         var _loc3_:* = 0;
         var _loc4_:* = 0;
         var _loc5_:int = 0;
         var _loc6_:* = 0;
         FSM____runetype.esp = FSM____runetype.esp - 4;
         si32(FSM____runetype.ebp,FSM____runetype.esp);
         FSM____runetype.ebp = FSM____runetype.esp;
         FSM____runetype.esp = FSM____runetype.esp - 0;
         _loc1_ = int(li32(FSM____runetype));
         _loc2_ = li32(FSM____runetype.ebp + 8);
         if(_loc2_ >= 0)
         {
            _loc3_ = int(li32(_loc1_ + 3128));
            _loc1_ = int(li32(_loc1_ + 3124));
            if(_loc1_ != 0)
            {
               while(true)
               {
                  _loc4_ = _loc1_ & 536870910;
                  _loc4_ = _loc4_ << 3;
                  _loc4_ = int(_loc3_ + _loc4_);
                  _loc4_ = int(li32(_loc4_));
                  _loc5_ = _loc1_ >>> 1;
                  if(_loc4_ <= _loc2_)
                  {
                     _loc6_ = _loc5_ << 4;
                     _loc6_ = int(_loc3_ + _loc6_);
                     _loc6_ = int(li32(_loc6_ + 4));
                     if(_loc6_ >= _loc2_)
                     {
                        _loc1_ = _loc5_ << 4;
                        _loc1_ = int(_loc3_ + _loc1_);
                        _loc1_ = int(li32(_loc1_ + 12));
                        if(_loc1_ != 0)
                        {
                           _loc3_ = int(_loc2_ - _loc4_);
                           _loc3_ = _loc3_ << 2;
                           _loc1_ = int(_loc1_ + _loc3_);
                           _loc1_ = int(li32(_loc1_));
                        }
                        else
                        {
                           _loc1_ = _loc5_ << 4;
                           _loc1_ = int(_loc3_ + _loc1_);
                           _loc1_ = int(li32(_loc1_ + 8));
                        }
                        addr236:
                        FSM____runetype.eax = _loc1_;
                        FSM____runetype.esp = FSM____runetype.ebp;
                        FSM____runetype.ebp = li32(FSM____runetype.esp);
                        FSM____runetype.esp = FSM____runetype.esp + 4;
                        FSM____runetype.esp = FSM____runetype.esp + 4;
                        return;
                     }
                  }
                  _loc4_ = _loc5_ << 4;
                  _loc4_ = int(_loc3_ + _loc4_);
                  _loc4_ = int(li32(_loc4_ + 4));
                  if(_loc4_ < _loc2_)
                  {
                     _loc4_ = _loc5_ << 4;
                     _loc3_ = int(_loc4_ + _loc3_);
                     _loc3_ = int(_loc3_ + 16);
                     _loc1_ = int(_loc1_ + -1);
                  }
                  _loc4_ = int(_loc1_ >>> 1);
                  if(uint(_loc1_) >= uint(2))
                  {
                     _loc1_ = int(_loc4_);
                     continue;
                  }
                  break;
               }
            }
         }
         _loc1_ = 0;
         §§goto(addr236);
      }
   }
}
