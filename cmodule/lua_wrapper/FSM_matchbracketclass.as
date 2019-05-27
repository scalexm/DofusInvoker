package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.li8;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_matchbracketclass extends Machine
   {
       
      
      public function FSM_matchbracketclass()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:* = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:* = 0;
         var _loc5_:* = 0;
         var _loc6_:int = 0;
         var _loc7_:* = 0;
         var _loc8_:int = 0;
         FSM_matchbracketclass.esp = FSM_matchbracketclass.esp - 4;
         si32(FSM_matchbracketclass.ebp,FSM_matchbracketclass.esp);
         FSM_matchbracketclass.ebp = FSM_matchbracketclass.esp;
         FSM_matchbracketclass.esp = FSM_matchbracketclass.esp - 0;
         _loc1_ = int(li32(FSM_matchbracketclass.ebp + 12));
         _loc2_ = li32(FSM_matchbracketclass.ebp + 8);
         _loc3_ = li32(FSM_matchbracketclass.ebp + 16);
         _loc4_ = int(li8(_loc1_ + 1));
         _loc5_ = int(_loc1_ + 1);
         if(_loc4_ != 94)
         {
            _loc5_ = 1;
            addr251:
            while(true)
            {
               _loc4_ = int(_loc5_);
               _loc6_ = _loc1_ + 1;
               if(uint(_loc6_) >= uint(_loc3_))
               {
                  _loc1_ = int(_loc4_);
                  addr270:
                  _loc4_ = int(_loc1_);
                  _loc4_ = int(_loc4_ == 0?1:0);
                  _loc4_ = _loc4_ & 1;
                  break;
               }
               _loc5_ = int(_loc1_);
               _loc1_ = int(_loc6_);
            }
            FSM_matchbracketclass.eax = _loc4_;
            FSM_matchbracketclass.esp = FSM_matchbracketclass.ebp;
            FSM_matchbracketclass.ebp = li32(FSM_matchbracketclass.esp);
            FSM_matchbracketclass.esp = FSM_matchbracketclass.esp + 4;
            FSM_matchbracketclass.esp = FSM_matchbracketclass.esp + 4;
            return;
         }
         _loc1_ = int(_loc1_ + 2);
         if(uint(_loc1_) >= uint(_loc3_))
         {
            _loc1_ = 0;
            §§goto(addr270);
         }
         else
         {
            _loc4_ = 0;
         }
         §§goto(addr285);
         while(true)
         {
            _loc6_ = li8(_loc1_);
            _loc7_ = int(li8(_loc5_ + 2));
            _loc8_ = _loc5_ + 2;
            if(_loc6_ == 37)
            {
               FSM_matchbracketclass.esp = FSM_matchbracketclass.esp - 8;
               _loc1_ = _loc7_ & 255;
               si32(_loc2_,FSM_matchbracketclass.esp);
               si32(_loc1_,FSM_matchbracketclass.esp + 4);
               FSM_matchbracketclass.esp = FSM_matchbracketclass.esp - 4;
               FSM_matchbracketclass.start();
               _loc1_ = int(FSM_matchbracketclass.eax);
               FSM_matchbracketclass.esp = FSM_matchbracketclass.esp + 8;
               if(_loc1_ == 0)
               {
                  _loc1_ = int(_loc8_);
                  _loc5_ = int(_loc4_);
                  §§goto(addr251);
               }
            }
            else
            {
               _loc7_ = _loc7_ & 255;
               if(_loc7_ == 45)
               {
                  _loc7_ = int(_loc5_ + 3);
                  if(uint(_loc7_) < uint(_loc3_))
                  {
                     _loc1_ = int(li8(_loc5_ + 1));
                     if(_loc1_ <= _loc2_)
                     {
                        _loc1_ = int(li8(_loc7_));
                        if(_loc1_ >= _loc2_)
                        {
                        }
                     }
                     _loc1_ = int(_loc7_);
                     _loc5_ = int(_loc4_);
                     §§goto(addr251);
                  }
               }
               _loc5_ = _loc6_ & 255;
               if(_loc5_ != _loc2_)
               {
                  _loc5_ = int(_loc4_);
                  §§goto(addr251);
               }
            }
            §§goto(addr285);
         }
      }
   }
}
