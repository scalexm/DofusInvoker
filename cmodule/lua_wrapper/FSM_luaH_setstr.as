package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.li8;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_luaH_setstr extends Machine
   {
      
      public static const intRegCount:int = 5;
      
      public static const NumberRegCount:int = 0;
       
      
      public var i0:int;
      
      public var i1:int;
      
      public var i2:int;
      
      public var i3:int;
      
      public var i4:int;
      
      public function FSM_luaH_setstr()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM_luaH_setstr = null;
         _loc1_ = new FSM_luaH_setstr();
         FSM_luaH_setstr.gworker = _loc1_;
      }
      
      override public final function work() : void
      {
         loop1:
         switch(state)
         {
            case 0:
               mstate.esp = mstate.esp - 4;
               si32(mstate.ebp,mstate.esp);
               mstate.ebp = mstate.esp;
               mstate.esp = mstate.esp - 16;
               this.i0 = 1;
               this.i1 = li32(mstate.ebp + 12);
               this.i2 = li8(this.i1 + 7);
               this.i0 = this.i0 << this.i2;
               this.i2 = li32(mstate.ebp + 16);
               this.i3 = li32(this.i2 + 8);
               this.i0 = this.i0 + -1;
               this.i0 = this.i0 & this.i3;
               this.i3 = li32(this.i1 + 16);
               this.i0 = this.i0 * 28;
               this.i4 = li32(mstate.ebp + 8);
               this.i0 = this.i3 + this.i0;
               while(true)
               {
                  this.i3 = li32(this.i0 + 20);
                  if(this.i3 == 4)
                  {
                     this.i3 = li32(this.i0 + 12);
                     if(this.i3 == this.i2)
                     {
                        addr151:
                        this.i3 = FSM_luaH_setstr;
                        if(this.i0 == this.i3)
                        {
                           this.i0 = 4;
                           si32(this.i2,mstate.ebp + -16);
                           si32(this.i0,mstate.ebp + -8);
                           mstate.esp = mstate.esp - 12;
                           this.i0 = mstate.ebp + -16;
                           si32(this.i4,mstate.esp);
                           si32(this.i1,mstate.esp + 4);
                           si32(this.i0,mstate.esp + 8);
                           state = 1;
                           mstate.esp = mstate.esp - 4;
                           FSM_luaH_setstr.start();
                           return;
                        }
                        break loop1;
                     }
                  }
                  this.i0 = li32(this.i0 + 24);
                  if(this.i0 != 0)
                  {
                     continue;
                  }
                  break;
               }
               this.i0 = FSM_luaH_setstr;
               §§goto(addr151);
            case 1:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 12;
         }
         mstate.eax = this.i0;
         mstate.esp = mstate.ebp;
         mstate.ebp = li32(mstate.esp);
         mstate.esp = mstate.esp + 4;
         mstate.esp = mstate.esp + 4;
         mstate.gworker = caller;
      }
   }
}
