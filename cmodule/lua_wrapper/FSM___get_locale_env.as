package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.li8;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM___get_locale_env extends Machine
   {
       
      
      public function FSM___get_locale_env()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:int = 0;
         var _loc2_:* = 0;
         var _loc3_:int = 0;
         FSM___get_locale_env.esp = FSM___get_locale_env.esp - 4;
         si32(FSM___get_locale_env.ebp,FSM___get_locale_env.esp);
         FSM___get_locale_env.ebp = FSM___get_locale_env.esp;
         FSM___get_locale_env.esp = FSM___get_locale_env.esp - 0;
         _loc1_ = FSM___get_locale_env;
         FSM___get_locale_env.esp = FSM___get_locale_env.esp - 4;
         si32(_loc1_,FSM___get_locale_env.esp);
         FSM___get_locale_env.esp = FSM___get_locale_env.esp - 4;
         FSM___get_locale_env.start();
         _loc1_ = FSM___get_locale_env.eax;
         FSM___get_locale_env.esp = FSM___get_locale_env.esp + 4;
         _loc2_ = int(li32(FSM___get_locale_env.ebp + 8));
         if(_loc1_ != 0)
         {
            _loc3_ = li8(_loc1_);
            if(_loc3_ != 0)
            {
               _loc2_ = int(_loc1_);
            }
            addr157:
            _loc1_ = _loc2_;
            if(_loc1_ != 0)
            {
               _loc2_ = int(li8(_loc1_));
               if(_loc2_ != 0)
               {
               }
               addr214:
               if(_loc1_ != 0)
               {
                  _loc2_ = int(FSM___get_locale_env);
                  _loc3_ = li8(_loc1_);
                  _loc1_ = _loc3_ == 0?int(_loc2_):int(_loc1_);
               }
               else
               {
                  _loc1_ = FSM___get_locale_env;
               }
               FSM___get_locale_env.eax = _loc1_;
               FSM___get_locale_env.esp = FSM___get_locale_env.ebp;
               FSM___get_locale_env.ebp = li32(FSM___get_locale_env.esp);
               FSM___get_locale_env.esp = FSM___get_locale_env.esp + 4;
               FSM___get_locale_env.esp = FSM___get_locale_env.esp + 4;
               return;
            }
            _loc1_ = FSM___get_locale_env;
            FSM___get_locale_env.esp = FSM___get_locale_env.esp - 4;
            si32(_loc1_,FSM___get_locale_env.esp);
            FSM___get_locale_env.esp = FSM___get_locale_env.esp - 4;
            FSM___get_locale_env.start();
            _loc1_ = FSM___get_locale_env.eax;
            FSM___get_locale_env.esp = FSM___get_locale_env.esp + 4;
            §§goto(addr214);
         }
         _loc1_ = FSM___get_locale_env;
         _loc2_ = _loc2_ << 2;
         _loc2_ = int(_loc1_ + _loc2_);
         _loc2_ = int(li32(_loc2_));
         FSM___get_locale_env.esp = FSM___get_locale_env.esp - 4;
         si32(_loc2_,FSM___get_locale_env.esp);
         FSM___get_locale_env.esp = FSM___get_locale_env.esp - 4;
         FSM___get_locale_env.start();
         _loc2_ = int(FSM___get_locale_env.eax);
         FSM___get_locale_env.esp = FSM___get_locale_env.esp + 4;
         §§goto(addr157);
      }
   }
}
