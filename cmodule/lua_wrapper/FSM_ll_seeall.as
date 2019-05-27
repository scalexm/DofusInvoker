package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.lf64;
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.li8;
   import avm2.intrinsics.memory.sf64;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_ll_seeall extends Machine
   {
      
      public static const intRegCount:int = 6;
      
      public static const NumberRegCount:int = 1;
       
      
      public var i0:int;
      
      public var i1:int;
      
      public var i2:int;
      
      public var i3:int;
      
      public var i4:int;
      
      public var i5:int;
      
      public var f0:Number;
      
      public function FSM_ll_seeall()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM_ll_seeall = null;
         _loc1_ = new FSM_ll_seeall();
         FSM_ll_seeall.gworker = _loc1_;
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
               this.i0 = 1;
               mstate.esp = mstate.esp - 8;
               this.i1 = li32(mstate.ebp + 8);
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_ll_seeall.start();
            case 1:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i2 = FSM_ll_seeall;
               if(this.i0 != this.i2)
               {
                  this.i0 = li32(this.i0 + 8);
                  if(this.i0 == 5)
                  {
                     addr145:
                     this.i0 = 1;
                     mstate.esp = mstate.esp - 8;
                     si32(this.i1,mstate.esp);
                     si32(this.i0,mstate.esp + 4);
                     mstate.esp = mstate.esp - 4;
                     FSM_ll_seeall.start();
                  }
               }
               this.i0 = 5;
               mstate.esp = mstate.esp - 12;
               this.i2 = 1;
               si32(this.i1,mstate.esp);
               si32(this.i2,mstate.esp + 4);
               si32(this.i0,mstate.esp + 8);
               state = 2;
               mstate.esp = mstate.esp - 4;
               FSM_ll_seeall.start();
               return;
            case 2:
               mstate.esp = mstate.esp + 12;
               §§goto(addr145);
            case 3:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               if(this.i0 == 0)
               {
                  this.i0 = 1;
                  mstate.esp = mstate.esp - 8;
                  si32(this.i1,mstate.esp);
                  si32(this.i0,mstate.esp + 4);
                  state = 4;
                  mstate.esp = mstate.esp - 4;
                  FSM_ll_seeall.start();
                  return;
               }
               this.i0 = -10002;
               mstate.esp = mstate.esp - 8;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_ll_seeall.start();
            case 4:
               mstate.esp = mstate.esp + 8;
               mstate.esp = mstate.esp - 8;
               this.i2 = -1;
               si32(this.i1,mstate.esp);
               si32(this.i2,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_ll_seeall.start();
            case 5:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i3 = li32(this.i1 + 8);
               this.f0 = lf64(this.i2);
               sf64(this.f0,this.i3);
               this.i2 = li32(this.i2 + 8);
               si32(this.i2,this.i3 + 8);
               this.i2 = li32(this.i1 + 8);
               this.i2 = this.i2 + 12;
               si32(this.i2,this.i1 + 8);
               mstate.esp = mstate.esp - 8;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_ll_seeall.start();
            case 6:
               mstate.esp = mstate.esp + 8;
               mstate.esp = mstate.esp - 8;
               this.i0 = -10002;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_ll_seeall.start();
            case 7:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i2 = li32(this.i1 + 8);
               this.f0 = lf64(this.i0);
               sf64(this.f0,this.i2);
               this.i0 = li32(this.i0 + 8);
               si32(this.i0,this.i2 + 8);
               this.i0 = li32(this.i1 + 8);
               this.i0 = this.i0 + 12;
               si32(this.i0,this.i1 + 8);
               mstate.esp = mstate.esp - 8;
               this.i0 = -2;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_ll_seeall.start();
            case 8:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i2 = FSM_ll_seeall;
               this.i3 = this.i1 + 8;
               while(true)
               {
                  this.i4 = li8(this.i2 + 1);
                  this.i2 = this.i2 + 1;
                  this.i5 = this.i2;
                  if(this.i4 != 0)
                  {
                     this.i2 = this.i5;
                     continue;
                  }
                  break;
               }
               this.i4 = FSM_ll_seeall;
               mstate.esp = mstate.esp - 12;
               this.i2 = this.i2 - this.i4;
               si32(this.i1,mstate.esp);
               si32(this.i4,mstate.esp + 4);
               si32(this.i2,mstate.esp + 8);
               state = 9;
               mstate.esp = mstate.esp - 4;
               FSM_ll_seeall.start();
               return;
            case 9:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i2,mstate.ebp + -16);
               this.i2 = 4;
               si32(this.i2,mstate.ebp + -8);
               this.i2 = li32(this.i3);
               mstate.esp = mstate.esp - 16;
               this.i2 = this.i2 + -12;
               this.i4 = mstate.ebp + -16;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               si32(this.i4,mstate.esp + 8);
               si32(this.i2,mstate.esp + 12);
               state = 10;
               mstate.esp = mstate.esp - 4;
               FSM_ll_seeall.start();
               return;
            case 10:
               mstate.esp = mstate.esp + 16;
               this.i1 = li32(this.i3);
               this.i1 = this.i1 + -12;
               si32(this.i1,this.i3);
               this.i1 = 0;
               mstate.eax = this.i1;
               break;
            case 11:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i2 = li32(this.i1 + 8);
               this.f0 = lf64(this.i0);
               sf64(this.f0,this.i2);
               this.i0 = li32(this.i0 + 8);
               si32(this.i0,this.i2 + 8);
               this.i0 = li32(this.i1 + 8);
               this.i0 = this.i0 + 12;
               si32(this.i0,this.i1 + 8);
               mstate.esp = mstate.esp - 8;
               this.i0 = -2;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_ll_seeall.start();
            case 12:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i2 = FSM_ll_seeall;
               this.i3 = this.i1 + 8;
               while(true)
               {
                  this.i4 = li8(this.i2 + 1);
                  this.i2 = this.i2 + 1;
                  this.i5 = this.i2;
                  if(this.i4 != 0)
                  {
                     this.i2 = this.i5;
                     continue;
                  }
                  break;
               }
               this.i4 = FSM_ll_seeall;
               mstate.esp = mstate.esp - 12;
               this.i2 = this.i2 - this.i4;
               si32(this.i1,mstate.esp);
               si32(this.i4,mstate.esp + 4);
               si32(this.i2,mstate.esp + 8);
               state = 13;
               mstate.esp = mstate.esp - 4;
               FSM_ll_seeall.start();
               return;
            case 13:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i2,mstate.ebp + -32);
               this.i2 = 4;
               si32(this.i2,mstate.ebp + -24);
               this.i2 = li32(this.i3);
               mstate.esp = mstate.esp - 16;
               this.i2 = this.i2 + -12;
               this.i4 = mstate.ebp + -32;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               si32(this.i4,mstate.esp + 8);
               si32(this.i2,mstate.esp + 12);
               state = 14;
               mstate.esp = mstate.esp - 4;
               FSM_ll_seeall.start();
               return;
            case 14:
               mstate.esp = mstate.esp + 16;
               this.i0 = li32(this.i3);
               this.i0 = this.i0 + -12;
               si32(this.i0,this.i3);
               this.i0 = 0;
               mstate.eax = this.i0;
         }
         mstate.esp = mstate.ebp;
         mstate.ebp = li32(mstate.esp);
         mstate.esp = mstate.esp + 4;
         mstate.esp = mstate.esp + 4;
         mstate.gworker = caller;
      }
   }
}
