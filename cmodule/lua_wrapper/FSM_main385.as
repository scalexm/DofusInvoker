package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_main385 extends Machine
   {
      
      public static const intRegCount:int = 4;
      
      public static const NumberRegCount:int = 0;
       
      
      public var i0:int;
      
      public var i1:int;
      
      public var i2:int;
      
      public var i3:int;
      
      public function FSM_main385()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM_main385 = null;
         _loc1_ = new FSM_main385();
         FSM_main385.gworker = _loc1_;
      }
      
      override public final function work() : void
      {
         switch(state)
         {
            case 0:
               mstate.esp = mstate.esp - 4;
               si32(mstate.ebp,mstate.esp);
               mstate.ebp = mstate.esp;
               mstate.esp = mstate.esp - 0;
               this.i0 = FSM_main385;
               mstate.esp = mstate.esp - 8;
               this.i1 = 0;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               state = 1;
               mstate.esp = mstate.esp - 4;
               mstate.funcs[FSM_main385]();
               return;
            case 1:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               si32(this.i0,FSM_main385);
               mstate.esp = mstate.esp - 8;
               this.i0 = FSM_main385;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               state = 2;
               mstate.esp = mstate.esp - 4;
               mstate.funcs[FSM_main385]();
               return;
            case 2:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               si32(this.i0,FSM_main385);
               mstate.esp = mstate.esp - 8;
               this.i0 = FSM_main385;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               state = 3;
               mstate.esp = mstate.esp - 4;
               mstate.funcs[FSM_main385]();
               return;
            case 3:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               si32(this.i0,FSM_main385);
               mstate.esp = mstate.esp - 8;
               this.i0 = FSM_main385;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               state = 4;
               mstate.esp = mstate.esp - 4;
               mstate.funcs[FSM_main385]();
               return;
            case 4:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               si32(this.i0,FSM_main385);
               mstate.esp = mstate.esp - 4;
               this.i0 = FSM_main385;
               si32(this.i0,mstate.esp);
               state = 5;
               mstate.esp = mstate.esp - 4;
               mstate.funcs[FSM_main385]();
               return;
            case 5:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 4;
               mstate.esp = mstate.esp - 8;
               this.i2 = FSM_main385;
               si32(this.i0,mstate.esp);
               si32(this.i2,mstate.esp + 4);
               state = 6;
               mstate.esp = mstate.esp - 4;
               mstate.funcs[FSM_main385]();
               return;
            case 6:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               si32(this.i0,FSM_main385);
               mstate.esp = mstate.esp - 8;
               this.i0 = FSM_main385;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               state = 7;
               mstate.esp = mstate.esp - 4;
               mstate.funcs[FSM_main385]();
               return;
            case 7:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               si32(this.i0,FSM_main385);
               mstate.esp = mstate.esp - 4;
               this.i0 = FSM_main385;
               si32(this.i0,mstate.esp);
               state = 8;
               mstate.esp = mstate.esp - 4;
               mstate.funcs[FSM_main385]();
               return;
            case 8:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 4;
               si32(this.i0,FSM_main385);
               mstate.esp = mstate.esp - 8;
               this.i2 = FSM_main385;
               si32(this.i1,mstate.esp);
               si32(this.i2,mstate.esp + 4);
               state = 9;
               mstate.esp = mstate.esp - 4;
               mstate.funcs[FSM_main385]();
               return;
            case 9:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               mstate.esp = mstate.esp - 12;
               this.i3 = FSM_main385;
               si32(this.i0,mstate.esp);
               si32(this.i3,mstate.esp + 4);
               si32(this.i2,mstate.esp + 8);
               state = 10;
               mstate.esp = mstate.esp - 4;
               mstate.funcs[FSM_main385]();
               return;
            case 10:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               mstate.esp = mstate.esp - 4;
               si32(this.i2,mstate.esp);
               state = 11;
               mstate.esp = mstate.esp - 4;
               mstate.funcs[FSM_main385]();
               return;
            case 11:
               mstate.esp = mstate.esp + 4;
               this.i0 = li32(FSM_main385);
               mstate.esp = mstate.esp - 8;
               this.i2 = FSM_main385;
               si32(this.i1,mstate.esp);
               si32(this.i2,mstate.esp + 4);
               state = 12;
               mstate.esp = mstate.esp - 4;
               mstate.funcs[FSM_main385]();
               return;
            case 12:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               mstate.esp = mstate.esp - 12;
               this.i3 = FSM_main385;
               si32(this.i0,mstate.esp);
               si32(this.i3,mstate.esp + 4);
               si32(this.i2,mstate.esp + 8);
               state = 13;
               mstate.esp = mstate.esp - 4;
               mstate.funcs[FSM_main385]();
               return;
            case 13:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               mstate.esp = mstate.esp - 4;
               si32(this.i2,mstate.esp);
               state = 14;
               mstate.esp = mstate.esp - 4;
               mstate.funcs[FSM_main385]();
               return;
            case 14:
               mstate.esp = mstate.esp + 4;
               this.i0 = li32(FSM_main385);
               mstate.esp = mstate.esp - 8;
               this.i2 = FSM_main385;
               si32(this.i1,mstate.esp);
               si32(this.i2,mstate.esp + 4);
               state = 15;
               mstate.esp = mstate.esp - 4;
               mstate.funcs[FSM_main385]();
               return;
            case 15:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               mstate.esp = mstate.esp - 12;
               this.i3 = FSM_main385;
               si32(this.i0,mstate.esp);
               si32(this.i3,mstate.esp + 4);
               si32(this.i2,mstate.esp + 8);
               state = 16;
               mstate.esp = mstate.esp - 4;
               mstate.funcs[FSM_main385]();
               return;
            case 16:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               mstate.esp = mstate.esp - 4;
               si32(this.i2,mstate.esp);
               state = 17;
               mstate.esp = mstate.esp - 4;
               mstate.funcs[FSM_main385]();
               return;
            case 17:
               mstate.esp = mstate.esp + 4;
               this.i0 = li32(FSM_main385);
               mstate.esp = mstate.esp - 8;
               this.i2 = FSM_main385;
               si32(this.i1,mstate.esp);
               si32(this.i2,mstate.esp + 4);
               state = 18;
               mstate.esp = mstate.esp - 4;
               mstate.funcs[FSM_main385]();
               return;
            case 18:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               mstate.esp = mstate.esp - 12;
               this.i3 = FSM_main385;
               si32(this.i0,mstate.esp);
               si32(this.i3,mstate.esp + 4);
               si32(this.i2,mstate.esp + 8);
               state = 19;
               mstate.esp = mstate.esp - 4;
               mstate.funcs[FSM_main385]();
               return;
            case 19:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               mstate.esp = mstate.esp - 4;
               si32(this.i2,mstate.esp);
               state = 20;
               mstate.esp = mstate.esp - 4;
               mstate.funcs[FSM_main385]();
               return;
            case 20:
               mstate.esp = mstate.esp + 4;
               this.i0 = li32(FSM_main385);
               mstate.esp = mstate.esp - 8;
               this.i2 = FSM_main385;
               si32(this.i1,mstate.esp);
               si32(this.i2,mstate.esp + 4);
               state = 21;
               mstate.esp = mstate.esp - 4;
               mstate.funcs[FSM_main385]();
               return;
            case 21:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               mstate.esp = mstate.esp - 12;
               this.i3 = FSM_main385;
               si32(this.i0,mstate.esp);
               si32(this.i3,mstate.esp + 4);
               si32(this.i2,mstate.esp + 8);
               state = 22;
               mstate.esp = mstate.esp - 4;
               mstate.funcs[FSM_main385]();
               return;
            case 22:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               mstate.esp = mstate.esp - 4;
               si32(this.i2,mstate.esp);
               state = 23;
               mstate.esp = mstate.esp - 4;
               mstate.funcs[FSM_main385]();
               return;
            case 23:
               mstate.esp = mstate.esp + 4;
               this.i0 = li32(FSM_main385);
               mstate.esp = mstate.esp - 8;
               this.i2 = FSM_main385;
               si32(this.i1,mstate.esp);
               si32(this.i2,mstate.esp + 4);
               state = 24;
               mstate.esp = mstate.esp - 4;
               mstate.funcs[FSM_main385]();
               return;
            case 24:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               mstate.esp = mstate.esp - 12;
               this.i3 = FSM_main385;
               si32(this.i0,mstate.esp);
               si32(this.i3,mstate.esp + 4);
               si32(this.i2,mstate.esp + 8);
               state = 25;
               mstate.esp = mstate.esp - 4;
               mstate.funcs[FSM_main385]();
               return;
            case 25:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               mstate.esp = mstate.esp - 4;
               si32(this.i2,mstate.esp);
               state = 26;
               mstate.esp = mstate.esp - 4;
               mstate.funcs[FSM_main385]();
               return;
            case 26:
               mstate.esp = mstate.esp + 4;
               this.i0 = li32(FSM_main385);
               mstate.esp = mstate.esp - 8;
               this.i2 = FSM_main385;
               si32(this.i1,mstate.esp);
               si32(this.i2,mstate.esp + 4);
               state = 27;
               mstate.esp = mstate.esp - 4;
               mstate.funcs[FSM_main385]();
               return;
            case 27:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               mstate.esp = mstate.esp - 12;
               this.i3 = FSM_main385;
               si32(this.i0,mstate.esp);
               si32(this.i3,mstate.esp + 4);
               si32(this.i2,mstate.esp + 8);
               state = 28;
               mstate.esp = mstate.esp - 4;
               mstate.funcs[FSM_main385]();
               return;
            case 28:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               mstate.esp = mstate.esp - 4;
               si32(this.i2,mstate.esp);
               state = 29;
               mstate.esp = mstate.esp - 4;
               mstate.funcs[FSM_main385]();
               return;
            case 29:
               mstate.esp = mstate.esp + 4;
               this.i0 = li32(FSM_main385);
               mstate.esp = mstate.esp - 8;
               this.i2 = FSM_main385;
               si32(this.i1,mstate.esp);
               si32(this.i2,mstate.esp + 4);
               state = 30;
               mstate.esp = mstate.esp - 4;
               mstate.funcs[FSM_main385]();
               return;
            case 30:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               mstate.esp = mstate.esp - 12;
               this.i3 = FSM_main385;
               si32(this.i0,mstate.esp);
               si32(this.i3,mstate.esp + 4);
               si32(this.i2,mstate.esp + 8);
               state = 31;
               mstate.esp = mstate.esp - 4;
               mstate.funcs[FSM_main385]();
               return;
            case 31:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               mstate.esp = mstate.esp - 4;
               si32(this.i2,mstate.esp);
               state = 32;
               mstate.esp = mstate.esp - 4;
               mstate.funcs[FSM_main385]();
               return;
            case 32:
               mstate.esp = mstate.esp + 4;
               this.i0 = li32(FSM_main385);
               mstate.esp = mstate.esp - 8;
               this.i2 = FSM_main385;
               si32(this.i1,mstate.esp);
               si32(this.i2,mstate.esp + 4);
               state = 33;
               mstate.esp = mstate.esp - 4;
               mstate.funcs[FSM_main385]();
               return;
            case 33:
               this.i1 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               mstate.esp = mstate.esp - 12;
               this.i2 = FSM_main385;
               si32(this.i0,mstate.esp);
               si32(this.i2,mstate.esp + 4);
               si32(this.i1,mstate.esp + 8);
               state = 34;
               mstate.esp = mstate.esp - 4;
               mstate.funcs[FSM_main385]();
               return;
            case 34:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               mstate.esp = mstate.esp - 4;
               si32(this.i1,mstate.esp);
               state = 35;
               mstate.esp = mstate.esp - 4;
               mstate.funcs[FSM_main385]();
               return;
            case 35:
               mstate.esp = mstate.esp + 4;
               this.i1 = li32(FSM_main385);
               this.i2 = 1;
               this.i0 = this.i2;
               state = 36;
            case 36:
               if(this.i0)
               {
                  this.i0 = 0;
                  throw new AlchemyLibInit(this.i1);
               }
               mstate.eax = this.i2;
               mstate.esp = mstate.ebp;
               mstate.ebp = li32(mstate.esp);
               mstate.esp = mstate.esp + 4;
               mstate.esp = mstate.esp + 4;
               mstate.gworker = caller;
               return;
         }
      }
   }
}
