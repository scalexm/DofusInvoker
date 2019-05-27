package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.lf64;
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.li8;
   import avm2.intrinsics.memory.sf64;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_thunk_callGlobal extends Machine
   {
      
      public static const intRegCount:int = 11;
      
      public static const NumberRegCount:int = 2;
       
      
      public var i10:int;
      
      public var f0:Number;
      
      public var f1:Number;
      
      public var i0:int;
      
      public var i1:int;
      
      public var i2:int;
      
      public var i3:int;
      
      public var i4:int;
      
      public var i5:int;
      
      public var i6:int;
      
      public var i7:int;
      
      public var i8:int;
      
      public var i9:int;
      
      public function FSM_thunk_callGlobal()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM_thunk_callGlobal = null;
         _loc1_ = new FSM_thunk_callGlobal();
         FSM_thunk_callGlobal.gworker = _loc1_;
      }
      
      override public final function work() : void
      {
         switch(state)
         {
            case 0:
               mstate.esp = mstate.esp - 4;
               si32(mstate.ebp,mstate.esp);
               mstate.ebp = mstate.esp;
               mstate.esp = mstate.esp - 12;
               this.i0 = FSM_thunk_callGlobal;
               mstate.esp = mstate.esp - 20;
               this.i1 = li32(mstate.ebp + 12);
               this.i2 = mstate.ebp + -12;
               this.i3 = mstate.ebp + -8;
               this.i4 = mstate.ebp + -4;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               si32(this.i4,mstate.esp + 8);
               si32(this.i3,mstate.esp + 12);
               si32(this.i2,mstate.esp + 16);
               state = 1;
               mstate.esp = mstate.esp - 4;
               mstate.funcs[FSM_thunk_callGlobal]();
               return;
            case 1:
               mstate.esp = mstate.esp + 20;
               this.i1 = li32(mstate.ebp + -4);
               this.i0 = li32(mstate.ebp + -12);
               this.i2 = li32(mstate.ebp + -8);
               this.i3 = li32(this.i1 + 8);
               this.i4 = li32(this.i1 + 12);
               mstate.esp = mstate.esp - 4;
               si32(this.i2,mstate.esp);
               state = 2;
               mstate.esp = mstate.esp - 4;
               mstate.funcs[FSM_thunk_callGlobal]();
               return;
            case 2:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 4;
               this.i3 = this.i3 - this.i4;
               this.i4 = li8(this.i2);
               this.i3 = this.i3 / 12;
               this.i5 = this.i1 + 12;
               this.i6 = this.i1 + 8;
               this.i7 = this.i2;
               if(this.i4 != 0)
               {
                  this.i4 = this.i7;
                  while(true)
                  {
                     this.i8 = li8(this.i4 + 1);
                     this.i4 = this.i4 + 1;
                     this.i9 = this.i4;
                     if(this.i8 != 0)
                     {
                        this.i4 = this.i9;
                        continue;
                     }
                     break;
                  }
               }
               else
               {
                  this.i4 = this.i2;
               }
               this.i8 = 1;
               this.i9 = li32(this.i6);
               si32(this.i8,this.i9);
               si32(this.i8,this.i9 + 8);
               this.i8 = li32(this.i6);
               this.i8 = this.i8 + 12;
               si32(this.i8,this.i6);
               this.i8 = li32(this.i1 + 16);
               this.i9 = li32(this.i8 + 68);
               this.i8 = li32(this.i8 + 64);
               this.i10 = this.i1 + 16;
               this.i4 = this.i4 - this.i7;
               if(uint(this.i9) >= uint(this.i8))
               {
                  mstate.esp = mstate.esp - 4;
                  si32(this.i1,mstate.esp);
                  state = 77;
                  mstate.esp = mstate.esp - 4;
                  FSM_thunk_callGlobal.start();
                  return;
               }
               addr6564:
               this.i7 = 4;
               this.i8 = li32(this.i6);
               mstate.esp = mstate.esp - 12;
               si32(this.i1,mstate.esp);
               si32(this.i2,mstate.esp + 4);
               si32(this.i4,mstate.esp + 8);
               state = 78;
               mstate.esp = mstate.esp - 4;
               FSM_thunk_callGlobal.start();
               return;
            case 3:
               mstate.esp = mstate.esp + 8;
               this.i0 = li32(this.i10);
               this.i4 = li32(this.i0 + 68);
               this.i0 = li32(this.i0 + 64);
               if(uint(this.i4) >= uint(this.i0))
               {
                  mstate.esp = mstate.esp - 4;
                  si32(this.i1,mstate.esp);
                  state = 4;
                  mstate.esp = mstate.esp - 4;
                  FSM_thunk_callGlobal.start();
                  return;
               }
               addr361:
               this.i0 = FSM_thunk_callGlobal;
               this.i4 = li32(this.i6);
               mstate.esp = mstate.esp - 12;
               this.i7 = 16;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               si32(this.i7,mstate.esp + 8);
               state = 5;
               mstate.esp = mstate.esp - 4;
               FSM_thunk_callGlobal.start();
               return;
            case 4:
               mstate.esp = mstate.esp + 4;
               §§goto(addr361);
            case 5:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i0,this.i4);
               this.i0 = 4;
               si32(this.i0,this.i4 + 8);
               this.i0 = li32(this.i6);
               this.i0 = this.i0 + 12;
               si32(this.i0,this.i6);
               this.i0 = li32(this.i10);
               this.i4 = li32(this.i0 + 68);
               this.i0 = li32(this.i0 + 64);
               if(uint(this.i4) >= uint(this.i0))
               {
                  mstate.esp = mstate.esp - 4;
                  si32(this.i1,mstate.esp);
                  state = 6;
                  mstate.esp = mstate.esp - 4;
                  FSM_thunk_callGlobal.start();
                  return;
               }
               addr511:
               this.i0 = FSM_thunk_callGlobal;
               this.i4 = li32(this.i6);
               mstate.esp = mstate.esp - 12;
               this.i7 = 1;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               si32(this.i7,mstate.esp + 8);
               state = 7;
               mstate.esp = mstate.esp - 4;
               FSM_thunk_callGlobal.start();
               return;
            case 6:
               mstate.esp = mstate.esp + 4;
               §§goto(addr511);
            case 7:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i0,this.i4);
               this.i0 = 4;
               si32(this.i0,this.i4 + 8);
               this.i0 = li32(this.i6);
               this.i4 = this.i0 + 12;
               si32(this.i4,this.i6);
               this.i4 = 1078591488;
               this.i7 = 0;
               si32(this.i7,this.i0 + 12);
               si32(this.i4,this.i0 + 16);
               this.i4 = 3;
               si32(this.i4,this.i0 + 20);
               this.i0 = li32(this.i6);
               this.i0 = this.i0 + 12;
               si32(this.i0,this.i6);
               this.i0 = li32(this.i10);
               this.i4 = li32(this.i0 + 68);
               this.i0 = li32(this.i0 + 64);
               if(uint(this.i4) >= uint(this.i0))
               {
                  mstate.esp = mstate.esp - 4;
                  si32(this.i1,mstate.esp);
                  state = 8;
                  mstate.esp = mstate.esp - 4;
                  FSM_thunk_callGlobal.start();
                  return;
               }
               addr707:
               this.i0 = FSM_thunk_callGlobal;
               this.i4 = li32(this.i6);
               mstate.esp = mstate.esp - 12;
               this.i7 = 38;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               si32(this.i7,mstate.esp + 8);
               state = 9;
               mstate.esp = mstate.esp - 4;
               FSM_thunk_callGlobal.start();
               return;
            case 8:
               mstate.esp = mstate.esp + 4;
               §§goto(addr707);
            case 9:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i0,this.i4);
               this.i0 = 4;
               si32(this.i0,this.i4 + 8);
               this.i0 = li32(this.i6);
               this.i4 = this.i0 + 12;
               si32(this.i4,this.i6);
               this.f0 = Number(this.i2);
               sf64(this.f0,this.i0 + 12);
               this.i2 = 3;
               si32(this.i2,this.i0 + 20);
               this.i0 = li32(this.i6);
               this.i0 = this.i0 + 12;
               si32(this.i0,this.i6);
               this.i0 = li32(this.i10);
               this.i2 = li32(this.i0 + 68);
               this.i0 = li32(this.i0 + 64);
               if(uint(this.i2) >= uint(this.i0))
               {
                  mstate.esp = mstate.esp - 4;
                  si32(this.i1,mstate.esp);
                  state = 10;
                  mstate.esp = mstate.esp - 4;
                  FSM_thunk_callGlobal.start();
                  return;
               }
               addr896:
               this.i0 = FSM_thunk_callGlobal;
               this.i2 = li32(this.i6);
               mstate.esp = mstate.esp - 12;
               this.i4 = 16;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               si32(this.i4,mstate.esp + 8);
               state = 11;
               mstate.esp = mstate.esp - 4;
               FSM_thunk_callGlobal.start();
               return;
            case 10:
               mstate.esp = mstate.esp + 4;
               §§goto(addr896);
            case 11:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i0,this.i2);
               this.i0 = 4;
               si32(this.i0,this.i2 + 8);
               this.i0 = li32(this.i6);
               this.i2 = this.i0 + 12;
               si32(this.i2,this.i6);
               this.i4 = li32(this.i5);
               this.i2 = this.i2 - this.i4;
               this.i2 = this.i2 / 12;
               this.i2 = this.i2 + -7;
               this.f1 = Number(this.i2);
               sf64(this.f1,this.i0 + 12);
               this.i2 = 3;
               si32(this.i2,this.i0 + 20);
               this.i0 = li32(this.i6);
               this.i0 = this.i0 + 12;
               si32(this.i0,this.i6);
               this.i0 = li32(this.i10);
               this.i2 = li32(this.i0 + 68);
               this.i0 = li32(this.i0 + 64);
               if(uint(this.i2) >= uint(this.i0))
               {
                  mstate.esp = mstate.esp - 4;
                  si32(this.i1,mstate.esp);
                  state = 12;
                  mstate.esp = mstate.esp - 4;
                  FSM_thunk_callGlobal.start();
                  return;
               }
               addr1109:
               this.i0 = FSM_thunk_callGlobal;
               this.i2 = li32(this.i6);
               mstate.esp = mstate.esp - 12;
               this.i4 = 18;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               si32(this.i4,mstate.esp + 8);
               state = 13;
               mstate.esp = mstate.esp - 4;
               FSM_thunk_callGlobal.start();
               return;
            case 12:
               mstate.esp = mstate.esp + 4;
               §§goto(addr1109);
            case 13:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i0,this.i2);
               this.i0 = 4;
               si32(this.i0,this.i2 + 8);
               this.i0 = li32(this.i6);
               this.i2 = this.i0 + 12;
               si32(this.i2,this.i6);
               sf64(this.f0,this.i0 + 12);
               this.i2 = 3;
               si32(this.i2,this.i0 + 20);
               this.i0 = li32(this.i6);
               this.i0 = this.i0 + 12;
               si32(this.i0,this.i6);
               this.i0 = li32(this.i10);
               this.i2 = li32(this.i0 + 68);
               this.i0 = li32(this.i0 + 64);
               if(uint(this.i2) >= uint(this.i0))
               {
                  mstate.esp = mstate.esp - 4;
                  si32(this.i1,mstate.esp);
                  state = 14;
                  mstate.esp = mstate.esp - 4;
                  FSM_thunk_callGlobal.start();
                  return;
               }
               addr1292:
               this.i0 = FSM_thunk_callGlobal;
               this.i2 = li32(this.i6);
               mstate.esp = mstate.esp - 12;
               this.i4 = 1;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               si32(this.i4,mstate.esp + 8);
               state = 15;
               mstate.esp = mstate.esp - 4;
               FSM_thunk_callGlobal.start();
               return;
            case 14:
               mstate.esp = mstate.esp + 4;
               §§goto(addr1292);
            case 15:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i0,this.i2);
               this.i0 = 4;
               si32(this.i0,this.i2 + 8);
               this.i0 = li32(this.i6);
               this.i0 = this.i0 + 12;
               si32(this.i0,this.i6);
               this.i0 = li32(this.i10);
               this.i2 = li32(this.i0 + 68);
               this.i0 = li32(this.i0 + 64);
               if(uint(this.i2) >= uint(this.i0))
               {
                  mstate.esp = mstate.esp - 4;
                  si32(this.i1,mstate.esp);
                  state = 16;
                  mstate.esp = mstate.esp - 4;
                  FSM_thunk_callGlobal.start();
                  return;
               }
               addr1442:
               this.i0 = 10;
               this.i2 = li32(this.i6);
               this.i4 = li32(this.i5);
               this.i2 = this.i2 - this.i4;
               this.i2 = this.i2 / 12;
               mstate.esp = mstate.esp - 12;
               this.i2 = this.i2 + -1;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               si32(this.i2,mstate.esp + 8);
               state = 17;
               mstate.esp = mstate.esp - 4;
               FSM_thunk_callGlobal.start();
               return;
            case 16:
               mstate.esp = mstate.esp + 4;
               §§goto(addr1442);
            case 17:
               mstate.esp = mstate.esp + 12;
               this.i0 = li32(this.i6);
               this.i0 = this.i0 + -108;
               si32(this.i0,this.i6);
               mstate.esp = mstate.esp - 8;
               this.i0 = -2;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_thunk_callGlobal.start();
            case 18:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i2 = li32(this.i6);
               this.f0 = lf64(this.i0);
               sf64(this.f0,this.i2);
               this.i0 = li32(this.i0 + 8);
               si32(this.i0,this.i2 + 8);
               this.i0 = li32(this.i6);
               this.i0 = this.i0 + 12;
               si32(this.i0,this.i6);
               mstate.esp = mstate.esp - 8;
               this.i0 = -3;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_thunk_callGlobal.start();
            case 19:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i2 = li32(this.i6);
               this.i4 = this.i0;
               this.i7 = this.i0 + 12;
               if(uint(this.i7) >= uint(this.i2))
               {
                  this.i0 = this.i2;
               }
               else
               {
                  this.i0 = this.i0 + 12;
                  this.i2 = this.i4;
                  while(true)
                  {
                     this.f0 = lf64(this.i2 + 12);
                     sf64(this.f0,this.i2);
                     this.i4 = li32(this.i2 + 20);
                     si32(this.i4,this.i2 + 8);
                     this.i2 = li32(this.i6);
                     this.i4 = this.i0 + 12;
                     this.i7 = this.i0;
                     if(uint(this.i4) >= uint(this.i2))
                     {
                        break;
                     }
                     this.i0 = this.i4;
                     this.i2 = this.i7;
                  }
                  this.i0 = this.i2;
               }
               this.i0 = this.i0 + -12;
               si32(this.i0,this.i6);
               this.i0 = li32(this.i10);
               this.i2 = li32(this.i0 + 68);
               this.i0 = li32(this.i0 + 64);
               if(uint(this.i2) >= uint(this.i0))
               {
                  mstate.esp = mstate.esp - 4;
                  si32(this.i1,mstate.esp);
                  state = 20;
                  mstate.esp = mstate.esp - 4;
                  FSM_thunk_callGlobal.start();
                  return;
               }
               addr1826:
               this.i0 = 2;
               this.i2 = li32(this.i6);
               this.i4 = li32(this.i5);
               this.i2 = this.i2 - this.i4;
               this.i2 = this.i2 / 12;
               mstate.esp = mstate.esp - 12;
               this.i2 = this.i2 + -1;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               si32(this.i2,mstate.esp + 8);
               state = 21;
               mstate.esp = mstate.esp - 4;
               FSM_thunk_callGlobal.start();
               return;
            case 20:
               mstate.esp = mstate.esp + 4;
               §§goto(addr1826);
            case 21:
               mstate.esp = mstate.esp + 12;
               this.i0 = li32(this.i6);
               this.i0 = this.i0 + -12;
               si32(this.i0,this.i6);
               mstate.esp = mstate.esp - 4;
               si32(this.i1,mstate.esp);
               state = 22;
               mstate.esp = mstate.esp - 4;
               FSM_thunk_callGlobal.start();
               return;
            case 22:
               mstate.esp = mstate.esp + 4;
               this.i0 = 0;
               addr4029:
               this.i2 = this.i3 + this.i0;
               this.i4 = li32(this.i6);
               this.i7 = li32(this.i5);
               this.i4 = this.i4 - this.i7;
               this.i2 = this.i2 + 2;
               this.i4 = this.i4 / 12;
               if(this.i4 != this.i2)
               {
                  mstate.esp = mstate.esp - 8;
                  si32(this.i1,mstate.esp);
                  si32(this.i3,mstate.esp + 4);
                  state = 51;
                  mstate.esp = mstate.esp - 4;
                  FSM_thunk_callGlobal.start();
                  return;
               }
               break;
            case 23:
               this.i4 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               mstate.esp = mstate.esp - 4;
               si32(this.i4,mstate.esp);
               state = 24;
               mstate.esp = mstate.esp - 4;
               mstate.funcs[FSM_thunk_callGlobal]();
               return;
            case 24:
               this.i7 = mstate.eax;
               mstate.esp = mstate.esp + 4;
               mstate.esp = mstate.esp - 4;
               si32(this.i4,mstate.esp);
               state = 25;
               mstate.esp = mstate.esp - 4;
               mstate.funcs[FSM_thunk_callGlobal]();
               return;
            case 25:
               mstate.esp = mstate.esp + 4;
               if(this.i7 >= 1)
               {
                  this.i4 = 0;
                  addr2087:
                  mstate.esp = mstate.esp - 4;
                  si32(this.i4,mstate.esp);
                  state = 26;
                  mstate.esp = mstate.esp - 4;
                  mstate.funcs[FSM_thunk_callGlobal]();
                  return;
               }
               addr2292:
               this.i0 = li32(this.i6);
               this.i4 = li32(this.i5);
               this.i0 = this.i0 - this.i4;
               this.i4 = this.i7 + this.i2;
               this.i0 = this.i0 / 12;
               if(this.i0 == this.i4)
               {
                  this.i0 = this.i7;
                  §§goto(addr4029);
               }
               else
               {
                  mstate.esp = mstate.esp - 8;
                  si32(this.i1,mstate.esp);
                  si32(this.i2,mstate.esp + 4);
                  state = 31;
                  mstate.esp = mstate.esp - 4;
                  FSM_thunk_callGlobal.start();
                  return;
               }
            case 26:
               this.i8 = mstate.eax;
               mstate.esp = mstate.esp + 4;
               mstate.esp = mstate.esp - 8;
               si32(this.i0,mstate.esp);
               si32(this.i8,mstate.esp + 4);
               state = 27;
               mstate.esp = mstate.esp - 4;
               mstate.funcs[FSM_thunk_callGlobal]();
               return;
            case 27:
               this.i9 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               mstate.esp = mstate.esp - 4;
               si32(this.i8,mstate.esp);
               state = 28;
               mstate.esp = mstate.esp - 4;
               mstate.funcs[FSM_thunk_callGlobal]();
               return;
            case 28:
               mstate.esp = mstate.esp + 4;
               mstate.esp = mstate.esp - 8;
               si32(this.i1,mstate.esp);
               si32(this.i9,mstate.esp + 4);
               state = 29;
               mstate.esp = mstate.esp - 4;
               FSM_thunk_callGlobal.start();
               return;
            case 29:
               mstate.esp = mstate.esp + 8;
               mstate.esp = mstate.esp - 4;
               si32(this.i9,mstate.esp);
               state = 30;
               mstate.esp = mstate.esp - 4;
               mstate.funcs[FSM_thunk_callGlobal]();
               return;
            case 30:
               mstate.esp = mstate.esp + 4;
               this.i4 = this.i4 + 1;
               if(this.i4 != this.i7)
               {
                  §§goto(addr2087);
               }
               else
               {
                  §§goto(addr2292);
               }
            case 31:
               mstate.esp = mstate.esp + 8;
               this.i0 = li32(this.i10);
               this.i8 = li32(this.i0 + 68);
               this.i0 = li32(this.i0 + 64);
               if(uint(this.i8) >= uint(this.i0))
               {
                  mstate.esp = mstate.esp - 4;
                  si32(this.i1,mstate.esp);
                  state = 32;
                  mstate.esp = mstate.esp - 4;
                  FSM_thunk_callGlobal.start();
                  return;
               }
               addr2430:
               this.i0 = FSM_thunk_callGlobal;
               this.i8 = li32(this.i6);
               mstate.esp = mstate.esp - 12;
               this.i9 = 16;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               si32(this.i9,mstate.esp + 8);
               state = 33;
               mstate.esp = mstate.esp - 4;
               FSM_thunk_callGlobal.start();
               return;
            case 32:
               mstate.esp = mstate.esp + 4;
               §§goto(addr2430);
            case 33:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i0,this.i8);
               this.i0 = 4;
               si32(this.i0,this.i8 + 8);
               this.i0 = li32(this.i6);
               this.i0 = this.i0 + 12;
               si32(this.i0,this.i6);
               this.i0 = li32(this.i10);
               this.i8 = li32(this.i0 + 68);
               this.i0 = li32(this.i0 + 64);
               if(uint(this.i8) >= uint(this.i0))
               {
                  mstate.esp = mstate.esp - 4;
                  si32(this.i1,mstate.esp);
                  state = 34;
                  mstate.esp = mstate.esp - 4;
                  FSM_thunk_callGlobal.start();
                  return;
               }
               addr2580:
               this.i0 = FSM_thunk_callGlobal;
               this.i8 = li32(this.i6);
               mstate.esp = mstate.esp - 12;
               this.i9 = 1;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               si32(this.i9,mstate.esp + 8);
               state = 35;
               mstate.esp = mstate.esp - 4;
               FSM_thunk_callGlobal.start();
               return;
            case 34:
               mstate.esp = mstate.esp + 4;
               §§goto(addr2580);
            case 35:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i0,this.i8);
               this.i0 = 4;
               si32(this.i0,this.i8 + 8);
               this.i0 = li32(this.i6);
               this.i8 = this.i0 + 12;
               si32(this.i8,this.i6);
               this.i8 = 1079050240;
               this.i9 = 0;
               si32(this.i9,this.i0 + 12);
               si32(this.i8,this.i0 + 16);
               this.i8 = 3;
               si32(this.i8,this.i0 + 20);
               this.i0 = li32(this.i6);
               this.i0 = this.i0 + 12;
               si32(this.i0,this.i6);
               this.i0 = li32(this.i10);
               this.i8 = li32(this.i0 + 68);
               this.i0 = li32(this.i0 + 64);
               if(uint(this.i8) >= uint(this.i0))
               {
                  mstate.esp = mstate.esp - 4;
                  si32(this.i1,mstate.esp);
                  state = 36;
                  mstate.esp = mstate.esp - 4;
                  FSM_thunk_callGlobal.start();
                  return;
               }
               addr2776:
               this.i0 = FSM_thunk_callGlobal;
               this.i8 = li32(this.i6);
               mstate.esp = mstate.esp - 12;
               this.i9 = 38;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               si32(this.i9,mstate.esp + 8);
               state = 37;
               mstate.esp = mstate.esp - 4;
               FSM_thunk_callGlobal.start();
               return;
            case 36:
               mstate.esp = mstate.esp + 4;
               §§goto(addr2776);
            case 37:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i0,this.i8);
               this.i0 = 4;
               si32(this.i0,this.i8 + 8);
               this.i0 = li32(this.i6);
               this.i8 = this.i0 + 12;
               si32(this.i8,this.i6);
               this.f0 = Number(this.i2);
               sf64(this.f0,this.i0 + 12);
               this.i2 = 3;
               si32(this.i2,this.i0 + 20);
               this.i0 = li32(this.i6);
               this.i0 = this.i0 + 12;
               si32(this.i0,this.i6);
               this.i0 = li32(this.i10);
               this.i2 = li32(this.i0 + 68);
               this.i0 = li32(this.i0 + 64);
               if(uint(this.i2) >= uint(this.i0))
               {
                  mstate.esp = mstate.esp - 4;
                  si32(this.i1,mstate.esp);
                  state = 38;
                  mstate.esp = mstate.esp - 4;
                  FSM_thunk_callGlobal.start();
                  return;
               }
               addr2965:
               this.i0 = FSM_thunk_callGlobal;
               this.i2 = li32(this.i6);
               mstate.esp = mstate.esp - 12;
               this.i8 = 16;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               si32(this.i8,mstate.esp + 8);
               state = 39;
               mstate.esp = mstate.esp - 4;
               FSM_thunk_callGlobal.start();
               return;
            case 38:
               mstate.esp = mstate.esp + 4;
               §§goto(addr2965);
            case 39:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i0,this.i2);
               this.i0 = 4;
               si32(this.i0,this.i2 + 8);
               this.i0 = li32(this.i6);
               this.i2 = this.i0 + 12;
               si32(this.i2,this.i6);
               this.i8 = li32(this.i5);
               this.i2 = this.i2 - this.i8;
               this.i2 = this.i2 / 12;
               this.i2 = this.i2 + -7;
               this.f0 = Number(this.i2);
               sf64(this.f0,this.i0 + 12);
               this.i2 = 3;
               si32(this.i2,this.i0 + 20);
               this.i0 = li32(this.i6);
               this.i0 = this.i0 + 12;
               si32(this.i0,this.i6);
               this.i0 = li32(this.i10);
               this.i2 = li32(this.i0 + 68);
               this.i0 = li32(this.i0 + 64);
               if(uint(this.i2) >= uint(this.i0))
               {
                  mstate.esp = mstate.esp - 4;
                  si32(this.i1,mstate.esp);
                  state = 40;
                  mstate.esp = mstate.esp - 4;
                  FSM_thunk_callGlobal.start();
                  return;
               }
               addr3178:
               this.i0 = FSM_thunk_callGlobal;
               this.i2 = li32(this.i6);
               mstate.esp = mstate.esp - 12;
               this.i8 = 18;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               si32(this.i8,mstate.esp + 8);
               state = 41;
               mstate.esp = mstate.esp - 4;
               FSM_thunk_callGlobal.start();
               return;
            case 40:
               mstate.esp = mstate.esp + 4;
               §§goto(addr3178);
            case 41:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i0,this.i2);
               this.i0 = 4;
               si32(this.i0,this.i2 + 8);
               this.i0 = li32(this.i6);
               this.i2 = this.i0 + 12;
               si32(this.i2,this.i6);
               this.f0 = Number(this.i4);
               sf64(this.f0,this.i0 + 12);
               this.i2 = 3;
               si32(this.i2,this.i0 + 20);
               this.i0 = li32(this.i6);
               this.i0 = this.i0 + 12;
               si32(this.i0,this.i6);
               this.i0 = li32(this.i10);
               this.i2 = li32(this.i0 + 68);
               this.i0 = li32(this.i0 + 64);
               if(uint(this.i2) >= uint(this.i0))
               {
                  mstate.esp = mstate.esp - 4;
                  si32(this.i1,mstate.esp);
                  state = 42;
                  mstate.esp = mstate.esp - 4;
                  FSM_thunk_callGlobal.start();
                  return;
               }
               addr3367:
               this.i0 = FSM_thunk_callGlobal;
               this.i2 = li32(this.i6);
               mstate.esp = mstate.esp - 12;
               this.i4 = 1;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               si32(this.i4,mstate.esp + 8);
               state = 43;
               mstate.esp = mstate.esp - 4;
               FSM_thunk_callGlobal.start();
               return;
            case 42:
               mstate.esp = mstate.esp + 4;
               §§goto(addr3367);
            case 43:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i0,this.i2);
               this.i0 = 4;
               si32(this.i0,this.i2 + 8);
               this.i0 = li32(this.i6);
               this.i0 = this.i0 + 12;
               si32(this.i0,this.i6);
               this.i0 = li32(this.i10);
               this.i2 = li32(this.i0 + 68);
               this.i0 = li32(this.i0 + 64);
               if(uint(this.i2) >= uint(this.i0))
               {
                  mstate.esp = mstate.esp - 4;
                  si32(this.i1,mstate.esp);
                  state = 44;
                  mstate.esp = mstate.esp - 4;
                  FSM_thunk_callGlobal.start();
                  return;
               }
               addr3517:
               this.i0 = 10;
               this.i2 = li32(this.i6);
               this.i4 = li32(this.i5);
               this.i2 = this.i2 - this.i4;
               this.i2 = this.i2 / 12;
               mstate.esp = mstate.esp - 12;
               this.i2 = this.i2 + -1;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               si32(this.i2,mstate.esp + 8);
               state = 45;
               mstate.esp = mstate.esp - 4;
               FSM_thunk_callGlobal.start();
               return;
            case 44:
               mstate.esp = mstate.esp + 4;
               §§goto(addr3517);
            case 45:
               mstate.esp = mstate.esp + 12;
               this.i0 = li32(this.i6);
               this.i0 = this.i0 + -108;
               si32(this.i0,this.i6);
               mstate.esp = mstate.esp - 8;
               this.i0 = -2;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_thunk_callGlobal.start();
            case 46:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i2 = li32(this.i6);
               this.f0 = lf64(this.i0);
               sf64(this.f0,this.i2);
               this.i0 = li32(this.i0 + 8);
               si32(this.i0,this.i2 + 8);
               this.i0 = li32(this.i6);
               this.i0 = this.i0 + 12;
               si32(this.i0,this.i6);
               mstate.esp = mstate.esp - 8;
               this.i0 = -3;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_thunk_callGlobal.start();
            case 47:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i2 = li32(this.i6);
               this.i4 = this.i0;
               this.i8 = this.i0 + 12;
               if(uint(this.i8) >= uint(this.i2))
               {
                  this.i0 = this.i2;
               }
               else
               {
                  this.i0 = this.i0 + 12;
                  this.i2 = this.i4;
                  while(true)
                  {
                     this.f0 = lf64(this.i2 + 12);
                     sf64(this.f0,this.i2);
                     this.i4 = li32(this.i2 + 20);
                     si32(this.i4,this.i2 + 8);
                     this.i2 = li32(this.i6);
                     this.i4 = this.i0 + 12;
                     this.i8 = this.i0;
                     if(uint(this.i4) >= uint(this.i2))
                     {
                        break;
                     }
                     this.i0 = this.i4;
                     this.i2 = this.i8;
                  }
                  this.i0 = this.i2;
               }
               this.i0 = this.i0 + -12;
               si32(this.i0,this.i6);
               this.i0 = li32(this.i10);
               this.i2 = li32(this.i0 + 68);
               this.i0 = li32(this.i0 + 64);
               if(uint(this.i2) >= uint(this.i0))
               {
                  mstate.esp = mstate.esp - 4;
                  si32(this.i1,mstate.esp);
                  state = 48;
                  mstate.esp = mstate.esp - 4;
                  FSM_thunk_callGlobal.start();
                  return;
               }
               addr3901:
               this.i0 = 2;
               this.i2 = li32(this.i6);
               this.i4 = li32(this.i5);
               this.i2 = this.i2 - this.i4;
               this.i2 = this.i2 / 12;
               mstate.esp = mstate.esp - 12;
               this.i2 = this.i2 + -1;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               si32(this.i2,mstate.esp + 8);
               state = 49;
               mstate.esp = mstate.esp - 4;
               FSM_thunk_callGlobal.start();
               return;
            case 48:
               mstate.esp = mstate.esp + 4;
               §§goto(addr3901);
            case 49:
               mstate.esp = mstate.esp + 12;
               this.i0 = li32(this.i6);
               this.i0 = this.i0 + -12;
               si32(this.i0,this.i6);
               mstate.esp = mstate.esp - 4;
               si32(this.i1,mstate.esp);
               state = 50;
               mstate.esp = mstate.esp - 4;
               FSM_thunk_callGlobal.start();
               return;
            case 50:
               mstate.esp = mstate.esp + 4;
               this.i0 = this.i7;
               §§goto(addr4029);
            case 51:
               mstate.esp = mstate.esp + 8;
               this.i0 = li32(this.i10);
               this.i4 = li32(this.i0 + 68);
               this.i0 = li32(this.i0 + 64);
               if(uint(this.i4) >= uint(this.i0))
               {
                  mstate.esp = mstate.esp - 4;
                  si32(this.i1,mstate.esp);
                  state = 52;
                  mstate.esp = mstate.esp - 4;
                  FSM_thunk_callGlobal.start();
                  return;
               }
               addr4167:
               this.i0 = FSM_thunk_callGlobal;
               this.i4 = li32(this.i6);
               mstate.esp = mstate.esp - 12;
               this.i7 = 14;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               si32(this.i7,mstate.esp + 8);
               state = 53;
               mstate.esp = mstate.esp - 4;
               FSM_thunk_callGlobal.start();
               return;
            case 52:
               mstate.esp = mstate.esp + 4;
               §§goto(addr4167);
            case 53:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i0,this.i4);
               this.i0 = 4;
               si32(this.i0,this.i4 + 8);
               this.i0 = li32(this.i6);
               this.i0 = this.i0 + 12;
               si32(this.i0,this.i6);
               this.i0 = li32(this.i10);
               this.i4 = li32(this.i0 + 68);
               this.i0 = li32(this.i0 + 64);
               if(uint(this.i4) >= uint(this.i0))
               {
                  mstate.esp = mstate.esp - 4;
                  si32(this.i1,mstate.esp);
                  state = 54;
                  mstate.esp = mstate.esp - 4;
                  FSM_thunk_callGlobal.start();
                  return;
               }
               addr4317:
               this.i0 = FSM_thunk_callGlobal;
               this.i4 = li32(this.i6);
               mstate.esp = mstate.esp - 12;
               this.i7 = 1;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               si32(this.i7,mstate.esp + 8);
               state = 55;
               mstate.esp = mstate.esp - 4;
               FSM_thunk_callGlobal.start();
               return;
            case 54:
               mstate.esp = mstate.esp + 4;
               §§goto(addr4317);
            case 55:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i0,this.i4);
               this.i0 = 4;
               si32(this.i0,this.i4 + 8);
               this.i0 = li32(this.i6);
               this.i4 = this.i0 + 12;
               si32(this.i4,this.i6);
               this.i4 = 1081479168;
               this.i7 = 0;
               si32(this.i7,this.i0 + 12);
               si32(this.i4,this.i0 + 16);
               this.i4 = 3;
               si32(this.i4,this.i0 + 20);
               this.i0 = li32(this.i6);
               this.i0 = this.i0 + 12;
               si32(this.i0,this.i6);
               this.i0 = li32(this.i10);
               this.i4 = li32(this.i0 + 68);
               this.i0 = li32(this.i0 + 64);
               if(uint(this.i4) >= uint(this.i0))
               {
                  mstate.esp = mstate.esp - 4;
                  si32(this.i1,mstate.esp);
                  state = 56;
                  mstate.esp = mstate.esp - 4;
                  FSM_thunk_callGlobal.start();
                  return;
               }
               addr4513:
               this.i0 = FSM_thunk_callGlobal;
               this.i4 = li32(this.i6);
               mstate.esp = mstate.esp - 12;
               this.i7 = 38;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               si32(this.i7,mstate.esp + 8);
               state = 57;
               mstate.esp = mstate.esp - 4;
               FSM_thunk_callGlobal.start();
               return;
            case 56:
               mstate.esp = mstate.esp + 4;
               §§goto(addr4513);
            case 57:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i0,this.i4);
               this.i0 = 4;
               si32(this.i0,this.i4 + 8);
               this.i0 = li32(this.i6);
               this.i4 = this.i0 + 12;
               si32(this.i4,this.i6);
               this.f0 = Number(this.i3);
               sf64(this.f0,this.i0 + 12);
               this.i3 = 3;
               si32(this.i3,this.i0 + 20);
               this.i0 = li32(this.i6);
               this.i0 = this.i0 + 12;
               si32(this.i0,this.i6);
               this.i0 = li32(this.i10);
               this.i3 = li32(this.i0 + 68);
               this.i0 = li32(this.i0 + 64);
               if(uint(this.i3) >= uint(this.i0))
               {
                  mstate.esp = mstate.esp - 4;
                  si32(this.i1,mstate.esp);
                  state = 58;
                  mstate.esp = mstate.esp - 4;
                  FSM_thunk_callGlobal.start();
                  return;
               }
               addr4702:
               this.i0 = FSM_thunk_callGlobal;
               this.i3 = li32(this.i6);
               mstate.esp = mstate.esp - 12;
               this.i4 = 16;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               si32(this.i4,mstate.esp + 8);
               state = 59;
               mstate.esp = mstate.esp - 4;
               FSM_thunk_callGlobal.start();
               return;
            case 58:
               mstate.esp = mstate.esp + 4;
               §§goto(addr4702);
            case 59:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i0,this.i3);
               this.i0 = 4;
               si32(this.i0,this.i3 + 8);
               this.i0 = li32(this.i6);
               this.i3 = this.i0 + 12;
               si32(this.i3,this.i6);
               this.i4 = li32(this.i5);
               this.i3 = this.i3 - this.i4;
               this.i3 = this.i3 / 12;
               this.i3 = this.i3 + -7;
               this.f0 = Number(this.i3);
               sf64(this.f0,this.i0 + 12);
               this.i3 = 3;
               si32(this.i3,this.i0 + 20);
               this.i0 = li32(this.i6);
               this.i0 = this.i0 + 12;
               si32(this.i0,this.i6);
               this.i0 = li32(this.i10);
               this.i3 = li32(this.i0 + 68);
               this.i0 = li32(this.i0 + 64);
               if(uint(this.i3) >= uint(this.i0))
               {
                  mstate.esp = mstate.esp - 4;
                  si32(this.i1,mstate.esp);
                  state = 60;
                  mstate.esp = mstate.esp - 4;
                  FSM_thunk_callGlobal.start();
                  return;
               }
               addr4915:
               this.i0 = FSM_thunk_callGlobal;
               this.i3 = li32(this.i6);
               mstate.esp = mstate.esp - 12;
               this.i4 = 18;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               si32(this.i4,mstate.esp + 8);
               state = 61;
               mstate.esp = mstate.esp - 4;
               FSM_thunk_callGlobal.start();
               return;
            case 60:
               mstate.esp = mstate.esp + 4;
               §§goto(addr4915);
            case 61:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i0,this.i3);
               this.i0 = 4;
               si32(this.i0,this.i3 + 8);
               this.i0 = li32(this.i6);
               this.i3 = this.i0 + 12;
               si32(this.i3,this.i6);
               this.f0 = Number(this.i2);
               sf64(this.f0,this.i0 + 12);
               this.i3 = 3;
               si32(this.i3,this.i0 + 20);
               this.i0 = li32(this.i6);
               this.i0 = this.i0 + 12;
               si32(this.i0,this.i6);
               this.i0 = li32(this.i10);
               this.i3 = li32(this.i0 + 68);
               this.i0 = li32(this.i0 + 64);
               if(uint(this.i3) >= uint(this.i0))
               {
                  mstate.esp = mstate.esp - 4;
                  si32(this.i1,mstate.esp);
                  state = 62;
                  mstate.esp = mstate.esp - 4;
                  FSM_thunk_callGlobal.start();
                  return;
               }
               addr5104:
               this.i0 = FSM_thunk_callGlobal;
               this.i3 = li32(this.i6);
               mstate.esp = mstate.esp - 12;
               this.i2 = 1;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               si32(this.i2,mstate.esp + 8);
               state = 63;
               mstate.esp = mstate.esp - 4;
               FSM_thunk_callGlobal.start();
               return;
            case 62:
               mstate.esp = mstate.esp + 4;
               §§goto(addr5104);
            case 63:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i0,this.i3);
               this.i0 = 4;
               si32(this.i0,this.i3 + 8);
               this.i0 = li32(this.i6);
               this.i0 = this.i0 + 12;
               si32(this.i0,this.i6);
               this.i0 = li32(this.i10);
               this.i3 = li32(this.i0 + 68);
               this.i0 = li32(this.i0 + 64);
               if(uint(this.i3) >= uint(this.i0))
               {
                  mstate.esp = mstate.esp - 4;
                  si32(this.i1,mstate.esp);
                  state = 64;
                  mstate.esp = mstate.esp - 4;
                  FSM_thunk_callGlobal.start();
                  return;
               }
               addr5254:
               this.i0 = 10;
               this.i3 = li32(this.i6);
               this.i2 = li32(this.i5);
               this.i3 = this.i3 - this.i2;
               this.i3 = this.i3 / 12;
               mstate.esp = mstate.esp - 12;
               this.i3 = this.i3 + -1;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               si32(this.i3,mstate.esp + 8);
               state = 65;
               mstate.esp = mstate.esp - 4;
               FSM_thunk_callGlobal.start();
               return;
            case 64:
               mstate.esp = mstate.esp + 4;
               §§goto(addr5254);
            case 65:
               mstate.esp = mstate.esp + 12;
               this.i0 = li32(this.i6);
               this.i0 = this.i0 + -108;
               si32(this.i0,this.i6);
               mstate.esp = mstate.esp - 8;
               this.i0 = -2;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_thunk_callGlobal.start();
            case 66:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i3 = li32(this.i6);
               this.f0 = lf64(this.i0);
               sf64(this.f0,this.i3);
               this.i0 = li32(this.i0 + 8);
               si32(this.i0,this.i3 + 8);
               this.i0 = li32(this.i6);
               this.i0 = this.i0 + 12;
               si32(this.i0,this.i6);
               mstate.esp = mstate.esp - 8;
               this.i0 = -3;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_thunk_callGlobal.start();
            case 67:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i3 = li32(this.i6);
               this.i2 = this.i0;
               this.i4 = this.i0 + 12;
               if(uint(this.i4) >= uint(this.i3))
               {
                  this.i0 = this.i3;
               }
               else
               {
                  this.i0 = this.i0 + 12;
                  this.i3 = this.i2;
                  while(true)
                  {
                     this.f0 = lf64(this.i3 + 12);
                     sf64(this.f0,this.i3);
                     this.i2 = li32(this.i3 + 20);
                     si32(this.i2,this.i3 + 8);
                     this.i3 = li32(this.i6);
                     this.i2 = this.i0 + 12;
                     this.i4 = this.i0;
                     if(uint(this.i2) >= uint(this.i3))
                     {
                        break;
                     }
                     this.i0 = this.i2;
                     this.i3 = this.i4;
                  }
                  this.i0 = this.i3;
               }
               this.i0 = this.i0 + -12;
               si32(this.i0,this.i6);
               this.i0 = li32(this.i10);
               this.i3 = li32(this.i0 + 68);
               this.i0 = li32(this.i0 + 64);
               if(uint(this.i3) >= uint(this.i0))
               {
                  mstate.esp = mstate.esp - 4;
                  si32(this.i1,mstate.esp);
                  state = 68;
                  mstate.esp = mstate.esp - 4;
                  FSM_thunk_callGlobal.start();
                  return;
               }
               addr5638:
               this.i0 = 2;
               this.i3 = li32(this.i6);
               this.i5 = li32(this.i5);
               this.i3 = this.i3 - this.i5;
               this.i3 = this.i3 / 12;
               mstate.esp = mstate.esp - 12;
               this.i3 = this.i3 + -1;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               si32(this.i3,mstate.esp + 8);
               state = 69;
               mstate.esp = mstate.esp - 4;
               FSM_thunk_callGlobal.start();
               return;
            case 68:
               mstate.esp = mstate.esp + 4;
               §§goto(addr5638);
            case 69:
               mstate.esp = mstate.esp + 12;
               this.i0 = li32(this.i6);
               this.i0 = this.i0 + -12;
               si32(this.i0,this.i6);
               mstate.esp = mstate.esp - 12;
               this.i0 = 0;
               this.i3 = -1;
               si32(this.i1,mstate.esp);
               si32(this.i3,mstate.esp + 4);
               si32(this.i0,mstate.esp + 8);
               state = 70;
               mstate.esp = mstate.esp - 4;
               FSM_thunk_callGlobal.start();
               return;
            case 70:
               this.i1 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               this.i0 = li32(this.i6);
               this.i0 = this.i0 + -12;
               si32(this.i0,this.i6);
               this.i0 = FSM_thunk_callGlobal;
               trace(mstate.gworker.stringFromPtr(this.i0));
               this.i0 = this.i1;
               trace(mstate.gworker.stringFromPtr(this.i0));
               mstate.esp = mstate.esp - 4;
               si32(this.i3,mstate.esp);
               state = 71;
               mstate.esp = mstate.esp - 4;
               FSM_thunk_callGlobal.start();
               return;
            case 71:
               mstate.esp = mstate.esp + 4;
               break;
            case 72:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               if(this.i0 != 0)
               {
                  this.i0 = -1;
                  mstate.esp = mstate.esp - 8;
                  si32(this.i1,mstate.esp);
                  si32(this.i0,mstate.esp + 4);
                  mstate.esp = mstate.esp - 4;
                  FSM_thunk_callGlobal.start();
               }
               else
               {
                  addr6173:
                  this.i0 = 0;
                  this.i2 = li32(this.i6);
                  this.i4 = li32(this.i5);
                  this.i2 = this.i2 - this.i4;
                  mstate.esp = mstate.esp - 16;
                  this.i4 = this.i3 + 1;
                  this.i2 = this.i2 / 12;
                  si32(this.i1,mstate.esp);
                  si32(this.i4,mstate.esp + 4);
                  si32(this.i2,mstate.esp + 8);
                  si32(this.i0,mstate.esp + 12);
                  state = 76;
                  mstate.esp = mstate.esp - 4;
                  FSM_thunk_callGlobal.start();
                  return;
               }
            case 73:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i4 = li32(this.i6);
               this.f0 = lf64(this.i2);
               sf64(this.f0,this.i4);
               this.i2 = li32(this.i2 + 8);
               si32(this.i2,this.i4 + 8);
               this.i2 = li32(this.i6);
               this.i2 = this.i2 + 12;
               si32(this.i2,this.i6);
               mstate.esp = mstate.esp - 12;
               this.i2 = 0;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               si32(this.i2,mstate.esp + 8);
               state = 74;
               mstate.esp = mstate.esp - 4;
               FSM_thunk_callGlobal.start();
               return;
            case 74:
               this.i0 = mstate.eax;
               this.i4 = FSM_thunk_callGlobal;
               mstate.esp = mstate.esp + 12;
               this.i7 = FSM_thunk_callGlobal;
               this.i4 = this.i0 == 0?int(this.i4):int(this.i0);
               this.i0 = this.i7;
               trace(mstate.gworker.stringFromPtr(this.i0));
               this.i0 = this.i4;
               trace(mstate.gworker.stringFromPtr(this.i0));
               this.i0 = li32(this.i6);
               this.i4 = this.i0 + -12;
               si32(this.i4,this.i6);
               si32(this.i2,this.i0 + -12);
               this.i2 = 1;
               si32(this.i2,this.i0 + -4);
               this.i0 = li32(this.i6);
               this.i0 = this.i0 + 12;
               si32(this.i0,this.i6);
               mstate.esp = mstate.esp - 8;
               si32(this.i1,mstate.esp);
               si32(this.i2,mstate.esp + 4);
               state = 75;
               mstate.esp = mstate.esp - 4;
               FSM_thunk_callGlobal.start();
               return;
            case 75:
               mstate.esp = mstate.esp + 8;
               §§goto(addr6173);
            case 76:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 16;
               this.i1 = li32(this.i6);
               this.i2 = li32(this.i5);
               this.i4 = this.i1 - this.i2;
               this.i3 = this.i3 + -1;
               this.i4 = this.i4 / 12;
               this.i3 = this.i3 - this.i4;
               if(this.i3 >= 0)
               {
                  this.i4 = this.i3 * 12;
                  this.i4 = this.i2 + this.i4;
                  if(uint(this.i1) >= uint(this.i4))
                  {
                     this.i1 = this.i2;
                  }
                  else
                  {
                     do
                     {
                        this.i2 = 0;
                        si32(this.i2,this.i1 + 8);
                        this.i1 = this.i1 + 12;
                        si32(this.i1,this.i6);
                        this.i2 = li32(this.i5);
                        this.i4 = this.i3 * 12;
                        this.i4 = this.i2 + this.i4;
                     }
                     while(uint(this.i1) < uint(this.i4));
                     
                     this.i1 = this.i2;
                  }
                  this.i3 = this.i3 * 12;
                  this.i1 = this.i1 + this.i3;
               }
               else
               {
                  this.i2 = this.i3 * 12;
                  this.i1 = this.i2 + this.i1;
                  this.i1 = this.i1 + 12;
               }
               si32(this.i1,this.i6);
               mstate.eax = this.i0;
               mstate.esp = mstate.ebp;
               mstate.ebp = li32(mstate.esp);
               mstate.esp = mstate.esp + 4;
               mstate.esp = mstate.esp + 4;
               mstate.gworker = caller;
               return;
            case 77:
               mstate.esp = mstate.esp + 4;
               §§goto(addr6564);
            case 78:
               this.i4 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i4,this.i8);
               si32(this.i7,this.i8 + 8);
               this.i4 = li32(this.i6);
               this.i4 = this.i4 + 12;
               si32(this.i4,this.i6);
               mstate.esp = mstate.esp - 8;
               this.i4 = 0;
               si32(this.i2,mstate.esp);
               si32(this.i4,mstate.esp + 4);
               state = 79;
               mstate.esp = mstate.esp - 4;
               FSM_thunk_callGlobal.start();
               return;
            case 79:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               mstate.esp = mstate.esp - 8;
               this.i2 = -10002;
               si32(this.i1,mstate.esp);
               si32(this.i2,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_thunk_callGlobal.start();
            case 80:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i4 = li32(this.i6);
               mstate.esp = mstate.esp - 16;
               this.i4 = this.i4 + -12;
               si32(this.i1,mstate.esp);
               si32(this.i2,mstate.esp + 4);
               si32(this.i4,mstate.esp + 8);
               si32(this.i4,mstate.esp + 12);
               state = 81;
               mstate.esp = mstate.esp - 4;
               FSM_thunk_callGlobal.start();
               return;
            case 81:
               mstate.esp = mstate.esp + 16;
               this.i2 = li32(this.i6);
               this.i4 = li32(this.i5);
               this.i7 = li32(FSM_thunk_callGlobal);
               mstate.esp = mstate.esp - 8;
               si32(this.i0,mstate.esp);
               si32(this.i7,mstate.esp + 4);
               state = 82;
               mstate.esp = mstate.esp - 4;
               mstate.funcs[FSM_thunk_callGlobal]();
               return;
            case 82:
               this.i7 = mstate.eax;
               this.i2 = this.i2 - this.i4;
               mstate.esp = mstate.esp + 8;
               this.i2 = this.i2 / 12;
               if(this.i7 == 0)
               {
                  this.i0 = li32(this.i6);
                  this.i4 = li32(this.i5);
                  this.i0 = this.i0 - this.i4;
                  this.i0 = this.i0 / 12;
                  if(this.i0 == this.i2)
                  {
                     this.i0 = 0;
                     §§goto(addr4029);
                  }
                  else
                  {
                     mstate.esp = mstate.esp - 8;
                     si32(this.i1,mstate.esp);
                     si32(this.i2,mstate.esp + 4);
                     state = 3;
                     mstate.esp = mstate.esp - 4;
                     FSM_thunk_callGlobal.start();
                     return;
                  }
               }
               else
               {
                  this.i4 = FSM_thunk_callGlobal;
                  mstate.esp = mstate.esp - 8;
                  si32(this.i0,mstate.esp);
                  si32(this.i4,mstate.esp + 4);
                  state = 23;
                  mstate.esp = mstate.esp - 4;
                  mstate.funcs[FSM_thunk_callGlobal]();
                  return;
               }
         }
         this.i2 = 0;
         mstate.esp = mstate.esp - 12;
         si32(this.i1,mstate.esp);
         si32(this.i0,mstate.esp + 4);
         si32(this.i2,mstate.esp + 8);
         state = 72;
         mstate.esp = mstate.esp - 4;
         FSM_thunk_callGlobal.start();
      }
   }
}
