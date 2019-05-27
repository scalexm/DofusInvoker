package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.lf64;
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.li8;
   import avm2.intrinsics.memory.sf64;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_as3_new2 extends Machine
   {
      
      public static const intRegCount:int = 10;
      
      public static const NumberRegCount:int = 1;
       
      
      public var i0:int;
      
      public var i1:int;
      
      public var i2:int;
      
      public var i3:int;
      
      public var i4:int;
      
      public var i5:int;
      
      public var i6:int;
      
      public var i8:int;
      
      public var f0:Number;
      
      public var i7:int;
      
      public var i9:int;
      
      public function FSM_as3_new2()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM_as3_new2 = null;
         _loc1_ = new FSM_as3_new2();
         FSM_as3_new2.gworker = _loc1_;
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
               this.i0 = 1;
               this.i1 = li32(mstate.ebp + 8);
               this.i2 = li32(this.i1 + 8);
               this.i3 = li32(this.i1 + 12);
               mstate.esp = mstate.esp - 8;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_as3_new2.start();
            case 1:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i2 = this.i2 - this.i3;
               this.i3 = li32(this.i0 + 8);
               this.i2 = this.i2 / 12;
               this.i4 = this.i1 + 12;
               this.i5 = this.i1 + 8;
               if(this.i3 != 0)
               {
                  if(this.i3 == 1)
                  {
                     this.i0 = li32(this.i0);
                     if(this.i0 != 0)
                     {
                     }
                  }
                  this.i0 = 0;
                  mstate.esp = mstate.esp - 12;
                  this.i3 = 1;
                  si32(this.i1,mstate.esp);
                  si32(this.i3,mstate.esp + 4);
                  si32(this.i0,mstate.esp + 8);
                  state = 2;
                  mstate.esp = mstate.esp - 4;
                  FSM_as3_new2.start();
                  return;
               }
               addr205:
               addr208:
               this.i0 = 0;
               this.i3 = 0;
               mstate.esp = mstate.esp - 12;
               this.i6 = 2;
               si32(this.i1,mstate.esp);
               si32(this.i6,mstate.esp + 4);
               si32(this.i3,mstate.esp + 8);
               state = 3;
               mstate.esp = mstate.esp - 4;
               FSM_as3_new2.start();
               return;
            case 2:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               this.i3 = li8(this.i0);
               if(this.i3 == 0)
               {
                  §§goto(addr205);
               }
               §§goto(addr208);
            case 3:
               this.i3 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               if(this.i0 == 0)
               {
                  this.i6 = 0;
                  addr311:
                  mstate.esp = mstate.esp - 8;
                  si32(this.i6,mstate.esp);
                  si32(this.i3,mstate.esp + 4);
                  state = 5;
                  mstate.esp = mstate.esp - 4;
                  mstate.funcs[FSM_as3_new2]();
                  return;
               }
               mstate.esp = mstate.esp - 4;
               si32(this.i0,mstate.esp);
               state = 4;
               mstate.esp = mstate.esp - 4;
               mstate.funcs[FSM_as3_new2]();
               return;
            case 4:
               this.i6 = mstate.eax;
               mstate.esp = mstate.esp + 4;
               §§goto(addr311);
            case 5:
               this.i7 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               if(this.i6 != 0)
               {
                  mstate.esp = mstate.esp - 4;
                  si32(this.i6,mstate.esp);
                  state = 6;
                  mstate.esp = mstate.esp - 4;
                  mstate.funcs[FSM_as3_new2]();
                  return;
               }
               addr397:
               if(this.i7 == 0)
               {
                  this.i2 = FSM_as3_new2;
                  mstate.esp = mstate.esp - 16;
                  si32(this.i1,mstate.esp);
                  si32(this.i2,mstate.esp + 4);
                  si32(this.i0,mstate.esp + 8);
                  si32(this.i3,mstate.esp + 12);
                  state = 7;
                  mstate.esp = mstate.esp - 4;
                  FSM_as3_new2.start();
                  return;
               }
               this.i6 = 0;
               this.i8 = li32(this.i5);
               this.i9 = li32(this.i4);
               this.i8 = this.i8 - this.i9;
               mstate.esp = mstate.esp - 16;
               this.i9 = 3;
               this.i8 = this.i8 / 12;
               si32(this.i1,mstate.esp);
               si32(this.i9,mstate.esp + 4);
               si32(this.i8,mstate.esp + 8);
               si32(this.i6,mstate.esp + 12);
               state = 8;
               mstate.esp = mstate.esp - 4;
               FSM_as3_new2.start();
               return;
            case 6:
               mstate.esp = mstate.esp + 4;
               §§goto(addr397);
            case 7:
               mstate.esp = mstate.esp + 16;
               this.i0 = 0;
               addr2573:
               mstate.eax = this.i0;
               break;
            case 8:
               this.i6 = mstate.eax;
               mstate.esp = mstate.esp + 16;
               mstate.esp = mstate.esp - 8;
               si32(this.i7,mstate.esp);
               si32(this.i6,mstate.esp + 4);
               state = 9;
               mstate.esp = mstate.esp - 4;
               mstate.funcs[FSM_as3_new2]();
               return;
            case 9:
               this.i8 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               if(this.i8 == 0)
               {
                  this.i2 = FSM_as3_new2;
                  mstate.esp = mstate.esp - 4;
                  si32(this.i7,mstate.esp);
                  state = 10;
                  mstate.esp = mstate.esp - 4;
                  mstate.funcs[FSM_as3_new2]();
                  return;
               }
               mstate.esp = mstate.esp - 8;
               si32(this.i1,mstate.esp);
               si32(this.i8,mstate.esp + 4);
               state = 13;
               mstate.esp = mstate.esp - 4;
               FSM_as3_new2.start();
               return;
            case 10:
               mstate.esp = mstate.esp + 4;
               mstate.esp = mstate.esp - 4;
               si32(this.i6,mstate.esp);
               state = 11;
               mstate.esp = mstate.esp - 4;
               mstate.funcs[FSM_as3_new2]();
               return;
            case 11:
               mstate.esp = mstate.esp + 4;
               mstate.esp = mstate.esp - 16;
               si32(this.i1,mstate.esp);
               si32(this.i2,mstate.esp + 4);
               si32(this.i0,mstate.esp + 8);
               si32(this.i3,mstate.esp + 12);
               state = 12;
               mstate.esp = mstate.esp - 4;
               FSM_as3_new2.start();
               return;
            case 12:
               mstate.esp = mstate.esp + 16;
               this.i1 = 0;
               mstate.eax = this.i1;
               break;
            case 13:
               mstate.esp = mstate.esp + 8;
               mstate.esp = mstate.esp - 4;
               si32(this.i6,mstate.esp);
               state = 14;
               mstate.esp = mstate.esp - 4;
               mstate.funcs[FSM_as3_new2]();
               return;
            case 14:
               mstate.esp = mstate.esp + 4;
               mstate.esp = mstate.esp - 4;
               si32(this.i7,mstate.esp);
               state = 15;
               mstate.esp = mstate.esp - 4;
               mstate.funcs[FSM_as3_new2]();
               return;
            case 15:
               mstate.esp = mstate.esp + 4;
               this.i0 = li32(this.i5);
               this.i3 = li32(this.i4);
               this.i6 = this.i2 + 1;
               this.i0 = this.i0 - this.i3;
               this.i0 = this.i0 / 12;
               if(this.i0 != this.i6)
               {
                  mstate.esp = mstate.esp - 8;
                  si32(this.i1,mstate.esp);
                  si32(this.i2,mstate.esp + 4);
                  state = 16;
                  mstate.esp = mstate.esp - 4;
                  FSM_as3_new2.start();
                  return;
               }
               addr2570:
               this.i0 = 1;
               §§goto(addr2573);
            case 16:
               mstate.esp = mstate.esp + 8;
               this.i0 = li32(this.i1 + 16);
               this.i3 = li32(this.i0 + 68);
               this.i0 = li32(this.i0 + 64);
               this.i7 = this.i1 + 16;
               if(uint(this.i3) >= uint(this.i0))
               {
                  mstate.esp = mstate.esp - 4;
                  si32(this.i1,mstate.esp);
                  state = 17;
                  mstate.esp = mstate.esp - 4;
                  FSM_as3_new2.start();
                  return;
               }
               addr977:
               this.i0 = FSM_as3_new2;
               this.i3 = li32(this.i5);
               mstate.esp = mstate.esp - 12;
               this.i8 = 19;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               si32(this.i8,mstate.esp + 8);
               state = 18;
               mstate.esp = mstate.esp - 4;
               FSM_as3_new2.start();
               return;
            case 17:
               mstate.esp = mstate.esp + 4;
               §§goto(addr977);
            case 18:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i0,this.i3);
               this.i0 = 4;
               si32(this.i0,this.i3 + 8);
               this.i0 = li32(this.i5);
               this.i0 = this.i0 + 12;
               si32(this.i0,this.i5);
               this.i0 = li32(this.i7);
               this.i3 = li32(this.i0 + 68);
               this.i0 = li32(this.i0 + 64);
               if(uint(this.i3) >= uint(this.i0))
               {
                  mstate.esp = mstate.esp - 4;
                  si32(this.i1,mstate.esp);
                  state = 19;
                  mstate.esp = mstate.esp - 4;
                  FSM_as3_new2.start();
                  return;
               }
               addr1127:
               this.i0 = FSM_as3_new2;
               this.i3 = li32(this.i5);
               mstate.esp = mstate.esp - 12;
               this.i8 = 1;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               si32(this.i8,mstate.esp + 8);
               state = 20;
               mstate.esp = mstate.esp - 4;
               FSM_as3_new2.start();
               return;
            case 19:
               mstate.esp = mstate.esp + 4;
               §§goto(addr1127);
            case 20:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i0,this.i3);
               this.i0 = 4;
               si32(this.i0,this.i3 + 8);
               this.i0 = li32(this.i5);
               this.i3 = this.i0 + 12;
               si32(this.i3,this.i5);
               this.i3 = 1081040896;
               this.i8 = 0;
               si32(this.i8,this.i0 + 12);
               si32(this.i3,this.i0 + 16);
               this.i3 = 3;
               si32(this.i3,this.i0 + 20);
               this.i0 = li32(this.i5);
               this.i0 = this.i0 + 12;
               si32(this.i0,this.i5);
               this.i0 = li32(this.i7);
               this.i3 = li32(this.i0 + 68);
               this.i0 = li32(this.i0 + 64);
               if(uint(this.i3) >= uint(this.i0))
               {
                  mstate.esp = mstate.esp - 4;
                  si32(this.i1,mstate.esp);
                  state = 21;
                  mstate.esp = mstate.esp - 4;
                  FSM_as3_new2.start();
                  return;
               }
               addr1323:
               this.i0 = FSM_as3_new2;
               this.i3 = li32(this.i5);
               mstate.esp = mstate.esp - 12;
               this.i8 = 38;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               si32(this.i8,mstate.esp + 8);
               state = 22;
               mstate.esp = mstate.esp - 4;
               FSM_as3_new2.start();
               return;
            case 21:
               mstate.esp = mstate.esp + 4;
               §§goto(addr1323);
            case 22:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i0,this.i3);
               this.i0 = 4;
               si32(this.i0,this.i3 + 8);
               this.i0 = li32(this.i5);
               this.i3 = this.i0 + 12;
               si32(this.i3,this.i5);
               this.f0 = Number(this.i2);
               sf64(this.f0,this.i0 + 12);
               this.i2 = 3;
               si32(this.i2,this.i0 + 20);
               this.i0 = li32(this.i5);
               this.i0 = this.i0 + 12;
               si32(this.i0,this.i5);
               this.i0 = li32(this.i7);
               this.i2 = li32(this.i0 + 68);
               this.i0 = li32(this.i0 + 64);
               if(uint(this.i2) >= uint(this.i0))
               {
                  mstate.esp = mstate.esp - 4;
                  si32(this.i1,mstate.esp);
                  state = 23;
                  mstate.esp = mstate.esp - 4;
                  FSM_as3_new2.start();
                  return;
               }
               addr1512:
               this.i0 = FSM_as3_new2;
               this.i2 = li32(this.i5);
               mstate.esp = mstate.esp - 12;
               this.i3 = 16;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               si32(this.i3,mstate.esp + 8);
               state = 24;
               mstate.esp = mstate.esp - 4;
               FSM_as3_new2.start();
               return;
            case 23:
               mstate.esp = mstate.esp + 4;
               §§goto(addr1512);
            case 24:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i0,this.i2);
               this.i0 = 4;
               si32(this.i0,this.i2 + 8);
               this.i0 = li32(this.i5);
               this.i2 = this.i0 + 12;
               si32(this.i2,this.i5);
               this.i3 = li32(this.i4);
               this.i2 = this.i2 - this.i3;
               this.i2 = this.i2 / 12;
               this.i2 = this.i2 + -7;
               this.f0 = Number(this.i2);
               sf64(this.f0,this.i0 + 12);
               this.i2 = 3;
               si32(this.i2,this.i0 + 20);
               this.i0 = li32(this.i5);
               this.i0 = this.i0 + 12;
               si32(this.i0,this.i5);
               this.i0 = li32(this.i7);
               this.i2 = li32(this.i0 + 68);
               this.i0 = li32(this.i0 + 64);
               if(uint(this.i2) >= uint(this.i0))
               {
                  mstate.esp = mstate.esp - 4;
                  si32(this.i1,mstate.esp);
                  state = 25;
                  mstate.esp = mstate.esp - 4;
                  FSM_as3_new2.start();
                  return;
               }
               addr1725:
               this.i0 = FSM_as3_new2;
               this.i2 = li32(this.i5);
               mstate.esp = mstate.esp - 12;
               this.i3 = 18;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               si32(this.i3,mstate.esp + 8);
               state = 26;
               mstate.esp = mstate.esp - 4;
               FSM_as3_new2.start();
               return;
            case 25:
               mstate.esp = mstate.esp + 4;
               §§goto(addr1725);
            case 26:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i0,this.i2);
               this.i0 = 4;
               si32(this.i0,this.i2 + 8);
               this.i0 = li32(this.i5);
               this.i2 = this.i0 + 12;
               si32(this.i2,this.i5);
               this.f0 = Number(this.i6);
               sf64(this.f0,this.i0 + 12);
               this.i2 = 3;
               si32(this.i2,this.i0 + 20);
               this.i0 = li32(this.i5);
               this.i0 = this.i0 + 12;
               si32(this.i0,this.i5);
               this.i0 = li32(this.i7);
               this.i2 = li32(this.i0 + 68);
               this.i0 = li32(this.i0 + 64);
               if(uint(this.i2) >= uint(this.i0))
               {
                  mstate.esp = mstate.esp - 4;
                  si32(this.i1,mstate.esp);
                  state = 27;
                  mstate.esp = mstate.esp - 4;
                  FSM_as3_new2.start();
                  return;
               }
               addr1914:
               this.i0 = FSM_as3_new2;
               this.i2 = li32(this.i5);
               mstate.esp = mstate.esp - 12;
               this.i3 = 1;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               si32(this.i3,mstate.esp + 8);
               state = 28;
               mstate.esp = mstate.esp - 4;
               FSM_as3_new2.start();
               return;
            case 27:
               mstate.esp = mstate.esp + 4;
               §§goto(addr1914);
            case 28:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i0,this.i2);
               this.i0 = 4;
               si32(this.i0,this.i2 + 8);
               this.i0 = li32(this.i5);
               this.i0 = this.i0 + 12;
               si32(this.i0,this.i5);
               this.i0 = li32(this.i7);
               this.i2 = li32(this.i0 + 68);
               this.i0 = li32(this.i0 + 64);
               if(uint(this.i2) >= uint(this.i0))
               {
                  mstate.esp = mstate.esp - 4;
                  si32(this.i1,mstate.esp);
                  state = 29;
                  mstate.esp = mstate.esp - 4;
                  FSM_as3_new2.start();
                  return;
               }
               addr2064:
               this.i0 = 10;
               this.i2 = li32(this.i5);
               this.i3 = li32(this.i4);
               this.i2 = this.i2 - this.i3;
               this.i2 = this.i2 / 12;
               mstate.esp = mstate.esp - 12;
               this.i2 = this.i2 + -1;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               si32(this.i2,mstate.esp + 8);
               state = 30;
               mstate.esp = mstate.esp - 4;
               FSM_as3_new2.start();
               return;
            case 29:
               mstate.esp = mstate.esp + 4;
               §§goto(addr2064);
            case 30:
               mstate.esp = mstate.esp + 12;
               this.i0 = li32(this.i5);
               this.i0 = this.i0 + -108;
               si32(this.i0,this.i5);
               mstate.esp = mstate.esp - 8;
               this.i0 = -2;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_as3_new2.start();
            case 31:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i2 = li32(this.i5);
               this.f0 = lf64(this.i0);
               sf64(this.f0,this.i2);
               this.i0 = li32(this.i0 + 8);
               si32(this.i0,this.i2 + 8);
               this.i0 = li32(this.i5);
               this.i0 = this.i0 + 12;
               si32(this.i0,this.i5);
               mstate.esp = mstate.esp - 8;
               this.i0 = -3;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_as3_new2.start();
            case 32:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i2 = li32(this.i5);
               this.i3 = this.i0;
               this.i6 = this.i0 + 12;
               if(uint(this.i6) >= uint(this.i2))
               {
                  this.i0 = this.i2;
               }
               else
               {
                  this.i0 = this.i0 + 12;
                  this.i2 = this.i3;
                  while(true)
                  {
                     this.f0 = lf64(this.i2 + 12);
                     sf64(this.f0,this.i2);
                     this.i3 = li32(this.i2 + 20);
                     si32(this.i3,this.i2 + 8);
                     this.i2 = li32(this.i5);
                     this.i3 = this.i0 + 12;
                     this.i6 = this.i0;
                     if(uint(this.i3) >= uint(this.i2))
                     {
                        break;
                     }
                     this.i0 = this.i3;
                     this.i2 = this.i6;
                  }
                  this.i0 = this.i2;
               }
               this.i0 = this.i0 + -12;
               si32(this.i0,this.i5);
               this.i0 = li32(this.i7);
               this.i2 = li32(this.i0 + 68);
               this.i0 = li32(this.i0 + 64);
               if(uint(this.i2) >= uint(this.i0))
               {
                  mstate.esp = mstate.esp - 4;
                  si32(this.i1,mstate.esp);
                  state = 33;
                  mstate.esp = mstate.esp - 4;
                  FSM_as3_new2.start();
                  return;
               }
               addr2448:
               this.i0 = 2;
               this.i2 = li32(this.i5);
               this.i3 = li32(this.i4);
               this.i2 = this.i2 - this.i3;
               this.i2 = this.i2 / 12;
               mstate.esp = mstate.esp - 12;
               this.i2 = this.i2 + -1;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               si32(this.i2,mstate.esp + 8);
               state = 34;
               mstate.esp = mstate.esp - 4;
               FSM_as3_new2.start();
               return;
            case 33:
               mstate.esp = mstate.esp + 4;
               §§goto(addr2448);
            case 34:
               mstate.esp = mstate.esp + 12;
               this.i0 = li32(this.i5);
               this.i0 = this.i0 + -12;
               si32(this.i0,this.i5);
               mstate.esp = mstate.esp - 4;
               si32(this.i1,mstate.esp);
               state = 35;
               mstate.esp = mstate.esp - 4;
               FSM_as3_new2.start();
               return;
            case 35:
               mstate.esp = mstate.esp + 4;
               §§goto(addr2570);
         }
         mstate.esp = mstate.ebp;
         mstate.ebp = li32(mstate.esp);
         mstate.esp = mstate.esp + 4;
         mstate.esp = mstate.esp + 4;
         mstate.gworker = caller;
      }
   }
}
