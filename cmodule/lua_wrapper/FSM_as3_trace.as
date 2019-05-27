package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.lf64;
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.sf64;
   import avm2.intrinsics.memory.si32;
   import avm2.intrinsics.memory.si8;
   
   public final class FSM_as3_trace extends Machine
   {
      
      public static const intRegCount:int = 12;
      
      public static const NumberRegCount:int = 2;
       
      
      public var i10:int;
      
      public var i11:int;
      
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
      
      public function FSM_as3_trace()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM_as3_trace = null;
         _loc1_ = new FSM_as3_trace();
         FSM_as3_trace.gworker = _loc1_;
      }
      
      override public final function work() : void
      {
         switch(state)
         {
            case 0:
               mstate.esp = mstate.esp - 4;
               si32(mstate.ebp,mstate.esp);
               mstate.ebp = mstate.esp;
               mstate.esp = mstate.esp - 1040;
               this.i0 = mstate.ebp + -1040;
               this.i1 = li32(mstate.ebp + 8);
               this.i2 = li32(this.i1 + 8);
               this.i3 = li32(this.i1 + 12);
               si32(this.i1,mstate.ebp + -1032);
               this.i4 = this.i0 + 12;
               si32(this.i4,mstate.ebp + -1040);
               this.i4 = 0;
               si32(this.i4,mstate.ebp + -1036);
               mstate.esp = mstate.esp - 12;
               this.i5 = FSM_as3_trace;
               si32(this.i1,mstate.esp);
               si32(this.i5,mstate.esp + 4);
               si32(this.i4,mstate.esp + 8);
               state = 1;
               mstate.esp = mstate.esp - 4;
               FSM_as3_trace.start();
               return;
            case 1:
               this.i2 = this.i2 - this.i3;
               mstate.esp = mstate.esp + 12;
               this.i3 = this.i0 + 4;
               this.i4 = this.i0 + 8;
               this.i5 = this.i2 / 12;
               this.i6 = this.i1 + 12;
               this.i7 = this.i1 + 8;
               if(this.i2 >= 12)
               {
                  this.i2 = mstate.ebp + -1040;
                  this.i2 = this.i2 + 1036;
                  this.i8 = 1;
                  addr190:
                  if(this.i8 >= 2)
                  {
                     this.i9 = li32(this.i0);
                     if(uint(this.i9) >= uint(this.i2))
                     {
                        this.i9 = mstate.ebp + -1040;
                        mstate.esp = mstate.esp - 4;
                        si32(this.i9,mstate.esp);
                        state = 2;
                        mstate.esp = mstate.esp - 4;
                        FSM_as3_trace.start();
                        return;
                     }
                     addr291:
                     this.i9 = 32;
                     this.i10 = li32(this.i0);
                     si8(this.i9,this.i10);
                     this.i9 = this.i10 + 1;
                     si32(this.i9,this.i0);
                  }
                  this.i9 = -1;
                  mstate.esp = mstate.esp - 8;
                  si32(this.i1,mstate.esp);
                  si32(this.i9,mstate.esp + 4);
                  mstate.esp = mstate.esp - 4;
                  FSM_as3_trace.start();
               }
               else
               {
                  addr690:
                  this.i0 = mstate.ebp + -1040;
                  mstate.esp = mstate.esp - 4;
                  si32(this.i0,mstate.esp);
                  state = 10;
                  mstate.esp = mstate.esp - 4;
                  FSM_as3_trace.start();
                  return;
               }
            case 2:
               this.i9 = mstate.eax;
               mstate.esp = mstate.esp + 4;
               if(this.i9 != 0)
               {
                  this.i9 = mstate.ebp + -1040;
                  mstate.esp = mstate.esp - 4;
                  si32(this.i9,mstate.esp);
                  state = 3;
                  mstate.esp = mstate.esp - 4;
                  FSM_as3_trace.start();
                  return;
               }
               §§goto(addr291);
            case 3:
               mstate.esp = mstate.esp + 4;
               §§goto(addr291);
            case 4:
               this.i10 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i11 = li32(this.i7);
               this.f0 = lf64(this.i10);
               sf64(this.f0,this.i11);
               this.i10 = li32(this.i10 + 8);
               si32(this.i10,this.i11 + 8);
               this.i10 = li32(this.i7);
               this.i10 = this.i10 + 12;
               si32(this.i10,this.i7);
               mstate.esp = mstate.esp - 8;
               si32(this.i1,mstate.esp);
               si32(this.i8,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_as3_trace.start();
            case 5:
               this.i10 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i11 = li32(this.i7);
               this.f0 = lf64(this.i10);
               sf64(this.f0,this.i11);
               this.i10 = li32(this.i10 + 8);
               si32(this.i10,this.i11 + 8);
               this.i10 = li32(this.i7);
               this.i11 = this.i10 + 12;
               si32(this.i11,this.i7);
               mstate.esp = mstate.esp - 12;
               this.i11 = 1;
               this.i10 = this.i10 + -12;
               si32(this.i1,mstate.esp);
               si32(this.i10,mstate.esp + 4);
               si32(this.i11,mstate.esp + 8);
               state = 6;
               mstate.esp = mstate.esp - 4;
               FSM_as3_trace.start();
               return;
            case 6:
               mstate.esp = mstate.esp + 12;
               mstate.esp = mstate.esp - 12;
               this.i10 = 0;
               si32(this.i1,mstate.esp);
               si32(this.i9,mstate.esp + 4);
               si32(this.i10,mstate.esp + 8);
               state = 7;
               mstate.esp = mstate.esp - 4;
               FSM_as3_trace.start();
               return;
            case 7:
               this.i9 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               if(this.i9 == 0)
               {
                  this.i8 = FSM_as3_trace;
                  mstate.esp = mstate.esp - 8;
                  si32(this.i1,mstate.esp);
                  si32(this.i8,mstate.esp + 4);
                  state = 8;
                  mstate.esp = mstate.esp - 4;
                  FSM_as3_trace.start();
                  return;
               }
               this.i9 = mstate.ebp + -1040;
               mstate.esp = mstate.esp - 4;
               si32(this.i9,mstate.esp);
               state = 9;
               mstate.esp = mstate.esp - 4;
               FSM_as3_trace.start();
               return;
            case 8:
               mstate.esp = mstate.esp + 8;
               this.i8 = 0;
               mstate.eax = this.i8;
               break;
            case 9:
               mstate.esp = mstate.esp + 4;
               this.i8 = this.i8 + 1;
               if(this.i8 <= this.i5)
               {
                  §§goto(addr190);
               }
               else
               {
                  §§goto(addr690);
               }
            case 10:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 4;
               this.i0 = li32(this.i3);
               this.i2 = li32(this.i4);
               mstate.esp = mstate.esp - 8;
               si32(this.i2,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               state = 11;
               mstate.esp = mstate.esp - 4;
               FSM_as3_trace.start();
               return;
            case 11:
               mstate.esp = mstate.esp + 8;
               this.i0 = 1;
               si32(this.i0,this.i3);
               mstate.esp = mstate.esp - 12;
               this.i0 = -1;
               this.i2 = 0;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               si32(this.i2,mstate.esp + 8);
               state = 12;
               mstate.esp = mstate.esp - 4;
               FSM_as3_trace.start();
               return;
            case 12:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               trace(mstate.gworker.stringFromPtr(this.i0));
               this.i0 = li32(this.i7);
               this.i0 = this.i0 + -24;
               si32(this.i0,this.i7);
               this.i2 = li32(this.i6);
               this.i0 = this.i0 - this.i2;
               this.i0 = this.i0 / 12;
               if(this.i0 != this.i5)
               {
                  mstate.esp = mstate.esp - 8;
                  si32(this.i1,mstate.esp);
                  si32(this.i5,mstate.esp + 4);
                  state = 13;
                  mstate.esp = mstate.esp - 4;
                  FSM_as3_trace.start();
                  return;
               }
               addr2577:
               this.i0 = 0;
               mstate.eax = this.i0;
               break;
            case 13:
               mstate.esp = mstate.esp + 8;
               this.i0 = li32(this.i1 + 16);
               this.i2 = li32(this.i0 + 68);
               this.i0 = li32(this.i0 + 64);
               this.i3 = this.i1 + 16;
               if(uint(this.i2) >= uint(this.i0))
               {
                  mstate.esp = mstate.esp - 4;
                  si32(this.i1,mstate.esp);
                  state = 14;
                  mstate.esp = mstate.esp - 4;
                  FSM_as3_trace.start();
                  return;
               }
               addr990:
               this.i0 = FSM_as3_trace;
               this.i2 = li32(this.i7);
               mstate.esp = mstate.esp - 12;
               this.i4 = 19;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               si32(this.i4,mstate.esp + 8);
               state = 15;
               mstate.esp = mstate.esp - 4;
               FSM_as3_trace.start();
               return;
            case 14:
               mstate.esp = mstate.esp + 4;
               §§goto(addr990);
            case 15:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i0,this.i2);
               this.i0 = 4;
               si32(this.i0,this.i2 + 8);
               this.i0 = li32(this.i7);
               this.i0 = this.i0 + 12;
               si32(this.i0,this.i7);
               this.i0 = li32(this.i3);
               this.i2 = li32(this.i0 + 68);
               this.i0 = li32(this.i0 + 64);
               if(uint(this.i2) >= uint(this.i0))
               {
                  mstate.esp = mstate.esp - 4;
                  si32(this.i1,mstate.esp);
                  state = 16;
                  mstate.esp = mstate.esp - 4;
                  FSM_as3_trace.start();
                  return;
               }
               addr1140:
               this.i0 = FSM_as3_trace;
               this.i2 = li32(this.i7);
               mstate.esp = mstate.esp - 12;
               this.i4 = 1;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               si32(this.i4,mstate.esp + 8);
               state = 17;
               mstate.esp = mstate.esp - 4;
               FSM_as3_trace.start();
               return;
            case 16:
               mstate.esp = mstate.esp + 4;
               §§goto(addr1140);
            case 17:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i0,this.i2);
               this.i0 = 4;
               si32(this.i0,this.i2 + 8);
               this.i0 = li32(this.i7);
               this.i2 = this.i0 + 12;
               si32(this.i2,this.i7);
               this.i2 = 1082449920;
               this.i4 = 0;
               si32(this.i4,this.i0 + 12);
               si32(this.i2,this.i0 + 16);
               this.i2 = 3;
               si32(this.i2,this.i0 + 20);
               this.i0 = li32(this.i7);
               this.i0 = this.i0 + 12;
               si32(this.i0,this.i7);
               this.i0 = li32(this.i3);
               this.i2 = li32(this.i0 + 68);
               this.i0 = li32(this.i0 + 64);
               if(uint(this.i2) >= uint(this.i0))
               {
                  mstate.esp = mstate.esp - 4;
                  si32(this.i1,mstate.esp);
                  state = 18;
                  mstate.esp = mstate.esp - 4;
                  FSM_as3_trace.start();
                  return;
               }
               addr1336:
               this.i0 = FSM_as3_trace;
               this.i2 = li32(this.i7);
               mstate.esp = mstate.esp - 12;
               this.i4 = 38;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               si32(this.i4,mstate.esp + 8);
               state = 19;
               mstate.esp = mstate.esp - 4;
               FSM_as3_trace.start();
               return;
            case 18:
               mstate.esp = mstate.esp + 4;
               §§goto(addr1336);
            case 19:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i0,this.i2);
               this.i0 = 4;
               si32(this.i0,this.i2 + 8);
               this.i0 = li32(this.i7);
               this.i2 = this.i0 + 12;
               si32(this.i2,this.i7);
               this.f0 = Number(this.i5);
               sf64(this.f0,this.i0 + 12);
               this.i2 = 3;
               si32(this.i2,this.i0 + 20);
               this.i0 = li32(this.i7);
               this.i0 = this.i0 + 12;
               si32(this.i0,this.i7);
               this.i0 = li32(this.i3);
               this.i2 = li32(this.i0 + 68);
               this.i0 = li32(this.i0 + 64);
               if(uint(this.i2) >= uint(this.i0))
               {
                  mstate.esp = mstate.esp - 4;
                  si32(this.i1,mstate.esp);
                  state = 20;
                  mstate.esp = mstate.esp - 4;
                  FSM_as3_trace.start();
                  return;
               }
               addr1525:
               this.i0 = FSM_as3_trace;
               this.i2 = li32(this.i7);
               mstate.esp = mstate.esp - 12;
               this.i4 = 16;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               si32(this.i4,mstate.esp + 8);
               state = 21;
               mstate.esp = mstate.esp - 4;
               FSM_as3_trace.start();
               return;
            case 20:
               mstate.esp = mstate.esp + 4;
               §§goto(addr1525);
            case 21:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i0,this.i2);
               this.i0 = 4;
               si32(this.i0,this.i2 + 8);
               this.i0 = li32(this.i7);
               this.i2 = this.i0 + 12;
               si32(this.i2,this.i7);
               this.i4 = li32(this.i6);
               this.i2 = this.i2 - this.i4;
               this.i2 = this.i2 / 12;
               this.i2 = this.i2 + -7;
               this.f1 = Number(this.i2);
               sf64(this.f1,this.i0 + 12);
               this.i2 = 3;
               si32(this.i2,this.i0 + 20);
               this.i0 = li32(this.i7);
               this.i0 = this.i0 + 12;
               si32(this.i0,this.i7);
               this.i0 = li32(this.i3);
               this.i2 = li32(this.i0 + 68);
               this.i0 = li32(this.i0 + 64);
               if(uint(this.i2) >= uint(this.i0))
               {
                  mstate.esp = mstate.esp - 4;
                  si32(this.i1,mstate.esp);
                  state = 22;
                  mstate.esp = mstate.esp - 4;
                  FSM_as3_trace.start();
                  return;
               }
               addr1738:
               this.i0 = FSM_as3_trace;
               this.i2 = li32(this.i7);
               mstate.esp = mstate.esp - 12;
               this.i4 = 18;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               si32(this.i4,mstate.esp + 8);
               state = 23;
               mstate.esp = mstate.esp - 4;
               FSM_as3_trace.start();
               return;
            case 22:
               mstate.esp = mstate.esp + 4;
               §§goto(addr1738);
            case 23:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i0,this.i2);
               this.i0 = 4;
               si32(this.i0,this.i2 + 8);
               this.i0 = li32(this.i7);
               this.i2 = this.i0 + 12;
               si32(this.i2,this.i7);
               sf64(this.f0,this.i0 + 12);
               this.i2 = 3;
               si32(this.i2,this.i0 + 20);
               this.i0 = li32(this.i7);
               this.i0 = this.i0 + 12;
               si32(this.i0,this.i7);
               this.i0 = li32(this.i3);
               this.i2 = li32(this.i0 + 68);
               this.i0 = li32(this.i0 + 64);
               if(uint(this.i2) >= uint(this.i0))
               {
                  mstate.esp = mstate.esp - 4;
                  si32(this.i1,mstate.esp);
                  state = 24;
                  mstate.esp = mstate.esp - 4;
                  FSM_as3_trace.start();
                  return;
               }
               addr1921:
               this.i0 = FSM_as3_trace;
               this.i2 = li32(this.i7);
               mstate.esp = mstate.esp - 12;
               this.i4 = 1;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               si32(this.i4,mstate.esp + 8);
               state = 25;
               mstate.esp = mstate.esp - 4;
               FSM_as3_trace.start();
               return;
            case 24:
               mstate.esp = mstate.esp + 4;
               §§goto(addr1921);
            case 25:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i0,this.i2);
               this.i0 = 4;
               si32(this.i0,this.i2 + 8);
               this.i0 = li32(this.i7);
               this.i0 = this.i0 + 12;
               si32(this.i0,this.i7);
               this.i0 = li32(this.i3);
               this.i2 = li32(this.i0 + 68);
               this.i0 = li32(this.i0 + 64);
               if(uint(this.i2) >= uint(this.i0))
               {
                  mstate.esp = mstate.esp - 4;
                  si32(this.i1,mstate.esp);
                  state = 26;
                  mstate.esp = mstate.esp - 4;
                  FSM_as3_trace.start();
                  return;
               }
               addr2071:
               this.i0 = 10;
               this.i2 = li32(this.i7);
               this.i4 = li32(this.i6);
               this.i2 = this.i2 - this.i4;
               this.i2 = this.i2 / 12;
               mstate.esp = mstate.esp - 12;
               this.i2 = this.i2 + -1;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               si32(this.i2,mstate.esp + 8);
               state = 27;
               mstate.esp = mstate.esp - 4;
               FSM_as3_trace.start();
               return;
            case 26:
               mstate.esp = mstate.esp + 4;
               §§goto(addr2071);
            case 27:
               mstate.esp = mstate.esp + 12;
               this.i0 = li32(this.i7);
               this.i0 = this.i0 + -108;
               si32(this.i0,this.i7);
               mstate.esp = mstate.esp - 8;
               this.i0 = -2;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_as3_trace.start();
            case 28:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i2 = li32(this.i7);
               this.f0 = lf64(this.i0);
               sf64(this.f0,this.i2);
               this.i0 = li32(this.i0 + 8);
               si32(this.i0,this.i2 + 8);
               this.i0 = li32(this.i7);
               this.i0 = this.i0 + 12;
               si32(this.i0,this.i7);
               mstate.esp = mstate.esp - 8;
               this.i0 = -3;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_as3_trace.start();
            case 29:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i2 = li32(this.i7);
               this.i4 = this.i0;
               this.i5 = this.i0 + 12;
               if(uint(this.i5) >= uint(this.i2))
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
                     this.i2 = li32(this.i7);
                     this.i4 = this.i0 + 12;
                     this.i5 = this.i0;
                     if(uint(this.i4) >= uint(this.i2))
                     {
                        break;
                     }
                     this.i0 = this.i4;
                     this.i2 = this.i5;
                  }
                  this.i0 = this.i2;
               }
               this.i0 = this.i0 + -12;
               si32(this.i0,this.i7);
               this.i0 = li32(this.i3);
               this.i2 = li32(this.i0 + 68);
               this.i0 = li32(this.i0 + 64);
               if(uint(this.i2) >= uint(this.i0))
               {
                  mstate.esp = mstate.esp - 4;
                  si32(this.i1,mstate.esp);
                  state = 30;
                  mstate.esp = mstate.esp - 4;
                  FSM_as3_trace.start();
                  return;
               }
               addr2455:
               this.i0 = 2;
               this.i2 = li32(this.i7);
               this.i3 = li32(this.i6);
               this.i2 = this.i2 - this.i3;
               this.i2 = this.i2 / 12;
               mstate.esp = mstate.esp - 12;
               this.i2 = this.i2 + -1;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               si32(this.i2,mstate.esp + 8);
               state = 31;
               mstate.esp = mstate.esp - 4;
               FSM_as3_trace.start();
               return;
            case 30:
               mstate.esp = mstate.esp + 4;
               §§goto(addr2455);
            case 31:
               mstate.esp = mstate.esp + 12;
               this.i0 = li32(this.i7);
               this.i0 = this.i0 + -12;
               si32(this.i0,this.i7);
               mstate.esp = mstate.esp - 4;
               si32(this.i1,mstate.esp);
               state = 32;
               mstate.esp = mstate.esp - 4;
               FSM_as3_trace.start();
               return;
            case 32:
               mstate.esp = mstate.esp + 4;
               §§goto(addr2577);
         }
         mstate.esp = mstate.ebp;
         mstate.ebp = li32(mstate.esp);
         mstate.esp = mstate.esp + 4;
         mstate.esp = mstate.esp + 4;
         mstate.gworker = caller;
      }
   }
}
