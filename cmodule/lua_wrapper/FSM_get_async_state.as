package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.li8;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_get_async_state extends Machine
   {
      
      public static const intRegCount:int = 6;
      
      public static const NumberRegCount:int = 0;
       
      
      public var i0:int;
      
      public var i1:int;
      
      public var i2:int;
      
      public var i3:int;
      
      public var i4:int;
      
      public var i5:int;
      
      public function FSM_get_async_state()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM_get_async_state = null;
         _loc1_ = new FSM_get_async_state();
         FSM_get_async_state.gworker = _loc1_;
      }
      
      override public final function work() : void
      {
         switch(state)
         {
            case 0:
               mstate.esp = mstate.esp - 4;
               si32(mstate.ebp,mstate.esp);
               mstate.ebp = mstate.esp;
               mstate.esp = mstate.esp - 32;
               this.i0 = -10002;
               mstate.esp = mstate.esp - 8;
               this.i1 = li32(mstate.ebp + 8);
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_get_async_state.start();
            case 1:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i2 = FSM_get_async_state;
               while(true)
               {
                  this.i3 = li8(this.i2 + 1);
                  this.i2 = this.i2 + 1;
                  this.i4 = this.i2;
                  if(this.i3 != 0)
                  {
                     this.i2 = this.i4;
                     continue;
                  }
                  break;
               }
               this.i3 = FSM_get_async_state;
               mstate.esp = mstate.esp - 12;
               this.i2 = this.i2 - this.i3;
               si32(this.i1,mstate.esp);
               si32(this.i3,mstate.esp + 4);
               si32(this.i2,mstate.esp + 8);
               state = 2;
               mstate.esp = mstate.esp - 4;
               FSM_get_async_state.start();
               return;
            case 2:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i2,mstate.ebp + -32);
               this.i2 = 4;
               si32(this.i2,mstate.ebp + -24);
               this.i2 = li32(this.i1 + 8);
               mstate.esp = mstate.esp - 16;
               this.i3 = mstate.ebp + -32;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               si32(this.i3,mstate.esp + 8);
               si32(this.i2,mstate.esp + 12);
               state = 3;
               mstate.esp = mstate.esp - 4;
               FSM_get_async_state.start();
               return;
            case 3:
               mstate.esp = mstate.esp + 16;
               this.i0 = li32(this.i1 + 8);
               this.i0 = this.i0 + 12;
               si32(this.i0,this.i1 + 8);
               mstate.esp = mstate.esp - 8;
               this.i0 = -1;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_get_async_state.start();
            case 4:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i2 = this.i1 + 8;
               this.i3 = FSM_get_async_state;
               if(this.i0 != this.i3)
               {
                  this.i0 = li32(this.i0 + 8);
                  if(this.i0 == 5)
                  {
                     this.i0 = -1;
                     mstate.esp = mstate.esp - 8;
                     si32(this.i1,mstate.esp);
                     si32(this.i0,mstate.esp + 4);
                     mstate.esp = mstate.esp - 4;
                     FSM_get_async_state.start();
                  }
               }
               this.i1 = FSM_get_async_state;
               this.i0 = li32(this.i2);
               this.i0 = this.i0 + -12;
               si32(this.i0,this.i2);
               this.i2 = 0;
               this.i0 = this.i1;
               trace(mstate.gworker.stringFromPtr(this.i0));
               mstate.eax = this.i2;
               addr711:
               mstate.esp = mstate.ebp;
               mstate.ebp = li32(mstate.esp);
               mstate.esp = mstate.esp + 4;
               mstate.esp = mstate.esp + 4;
               mstate.gworker = caller;
               return;
            case 5:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i3 = FSM_get_async_state;
               while(true)
               {
                  this.i4 = li8(this.i3 + 1);
                  this.i3 = this.i3 + 1;
                  this.i5 = this.i3;
                  if(this.i4 != 0)
                  {
                     this.i3 = this.i5;
                     continue;
                  }
                  break;
               }
               this.i4 = FSM_get_async_state;
               mstate.esp = mstate.esp - 12;
               this.i3 = this.i3 - this.i4;
               si32(this.i1,mstate.esp);
               si32(this.i4,mstate.esp + 4);
               si32(this.i3,mstate.esp + 8);
               state = 6;
               mstate.esp = mstate.esp - 4;
               FSM_get_async_state.start();
               return;
            case 6:
               this.i3 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i3,mstate.ebp + -16);
               this.i3 = 4;
               si32(this.i3,mstate.ebp + -8);
               this.i3 = li32(this.i2);
               mstate.esp = mstate.esp - 16;
               this.i4 = mstate.ebp + -16;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               si32(this.i4,mstate.esp + 8);
               si32(this.i3,mstate.esp + 12);
               state = 7;
               mstate.esp = mstate.esp - 4;
               FSM_get_async_state.start();
               return;
            case 7:
               mstate.esp = mstate.esp + 16;
               this.i0 = li32(this.i2);
               this.i0 = this.i0 + 12;
               si32(this.i0,this.i2);
               mstate.esp = mstate.esp - 8;
               this.i0 = -1;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_get_async_state.start();
            case 8:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i1 = li32(this.i0 + 8);
               if(this.i1 != 0)
               {
                  if(this.i1 != 1)
                  {
                     this.i0 = 1;
                  }
                  else
                  {
                     this.i0 = li32(this.i0);
                     this.i0 = this.i0 != 0?1:0;
                     this.i0 = this.i0 & 1;
                  }
               }
               else
               {
                  this.i0 = 0;
               }
               this.i1 = li32(this.i2);
               this.i1 = this.i1 + -24;
               si32(this.i1,this.i2);
               this.i0 = this.i0 & 255;
               mstate.eax = this.i0;
               §§goto(addr711);
         }
      }
   }
}
