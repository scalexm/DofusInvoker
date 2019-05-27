package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.lf64;
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.li8;
   import avm2.intrinsics.memory.sf64;
   import avm2.intrinsics.memory.si32;
   import avm2.intrinsics.memory.sxi8;
   
   public final class FSM_luaDoStringImpl extends Machine
   {
      
      public static const intRegCount:int = 13;
      
      public static const NumberRegCount:int = 1;
       
      
      public var i10:int;
      
      public var i11:int;
      
      public var i12:int;
      
      public var f0:Number;
      
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
      
      public function FSM_luaDoStringImpl()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM_luaDoStringImpl = null;
         _loc1_ = new FSM_luaDoStringImpl();
         FSM_luaDoStringImpl.gworker = _loc1_;
      }
      
      override public final function work() : void
      {
         switch(state)
         {
            case 0:
               mstate.esp = mstate.esp - 4;
               si32(mstate.ebp,mstate.esp);
               mstate.ebp = mstate.esp;
               mstate.esp = mstate.esp - 72;
               this.i1 = li32(mstate.ebp + 8);
               this.i0 = li32(this.i1 + 8);
               this.i2 = li32(this.i1 + 12);
               mstate.esp = mstate.esp - 4;
               this.i3 = li32(mstate.ebp + 12);
               si32(this.i3,mstate.esp);
               state = 1;
               mstate.esp = mstate.esp - 4;
               mstate.funcs[FSM_luaDoStringImpl]();
               return;
            case 1:
               this.i3 = mstate.eax;
               mstate.esp = mstate.esp + 4;
               this.i0 = this.i0 - this.i2;
               this.i2 = li8(this.i3);
               this.i4 = this.i0 / 12;
               this.i5 = this.i1 + 12;
               this.i6 = this.i1 + 8;
               this.i0 = si8(li8(mstate.ebp + 16));
               this.i7 = this.i3;
               if(this.i2 != 0)
               {
                  this.i2 = this.i7;
                  while(true)
                  {
                     this.i8 = li8(this.i2 + 1);
                     this.i2 = this.i2 + 1;
                     this.i9 = this.i2;
                     if(this.i8 != 0)
                     {
                        this.i2 = this.i9;
                        continue;
                     }
                     break;
                  }
               }
               else
               {
                  this.i2 = this.i3;
               }
               this.i8 = 1;
               this.i9 = li32(this.i6);
               si32(this.i8,this.i9);
               si32(this.i8,this.i9 + 8);
               this.i8 = li32(this.i6);
               this.i8 = this.i8 + 12;
               si32(this.i8,this.i6);
               si32(this.i3,mstate.ebp + -72);
               this.i2 = this.i2 - this.i7;
               si32(this.i2,mstate.ebp + -68);
               si32(this.i1,mstate.ebp + -48);
               this.i2 = FSM_luaDoStringImpl;
               si32(this.i2,mstate.ebp + -56);
               this.i2 = mstate.ebp + -72;
               si32(this.i2,mstate.ebp + -52);
               this.i2 = 0;
               si32(this.i2,mstate.ebp + -64);
               si32(this.i2,mstate.ebp + -60);
               this.i7 = mstate.ebp + -64;
               si32(this.i7,mstate.ebp + -32);
               this.i7 = FSM_luaDoStringImpl;
               si32(this.i7,mstate.ebp + -16);
               si32(this.i2,mstate.ebp + -28);
               si32(this.i2,mstate.ebp + -20);
               this.i7 = li32(this.i1 + 32);
               this.i9 = li32(this.i1 + 108);
               mstate.esp = mstate.esp - 20;
               this.i10 = FSM_luaDoStringImpl;
               this.i7 = this.i8 - this.i7;
               this.i8 = mstate.ebp + -32;
               si32(this.i1,mstate.esp);
               si32(this.i10,mstate.esp + 4);
               si32(this.i8,mstate.esp + 8);
               si32(this.i7,mstate.esp + 12);
               si32(this.i9,mstate.esp + 16);
               state = 28;
               mstate.esp = mstate.esp - 4;
               FSM_luaDoStringImpl.start();
               return;
            case 2:
               mstate.esp = mstate.esp + 8;
               this.i0 = li32(this.i2);
               this.i3 = li32(this.i0 + 68);
               this.i0 = li32(this.i0 + 64);
               if(uint(this.i3) >= uint(this.i0))
               {
                  mstate.esp = mstate.esp - 4;
                  si32(this.i1,mstate.esp);
                  state = 3;
                  mstate.esp = mstate.esp - 4;
                  FSM_luaDoStringImpl.start();
                  return;
               }
               addr305:
               this.i0 = FSM_luaDoStringImpl;
               this.i3 = li32(this.i6);
               mstate.esp = mstate.esp - 12;
               this.i8 = 14;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               si32(this.i8,mstate.esp + 8);
               state = 4;
               mstate.esp = mstate.esp - 4;
               FSM_luaDoStringImpl.start();
               return;
            case 3:
               mstate.esp = mstate.esp + 4;
               §§goto(addr305);
            case 4:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i0,this.i3);
               this.i0 = 4;
               si32(this.i0,this.i3 + 8);
               this.i0 = li32(this.i6);
               this.i0 = this.i0 + 12;
               si32(this.i0,this.i6);
               this.i0 = li32(this.i2);
               this.i3 = li32(this.i0 + 68);
               this.i0 = li32(this.i0 + 64);
               if(uint(this.i3) >= uint(this.i0))
               {
                  mstate.esp = mstate.esp - 4;
                  si32(this.i1,mstate.esp);
                  state = 5;
                  mstate.esp = mstate.esp - 4;
                  FSM_luaDoStringImpl.start();
                  return;
               }
               break;
            case 5:
               mstate.esp = mstate.esp + 4;
               break;
            case 6:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i0,this.i3);
               this.i0 = 4;
               si32(this.i0,this.i3 + 8);
               this.i0 = li32(this.i6);
               this.i3 = this.i0 + 12;
               si32(this.i3,this.i6);
               this.i3 = 1081081856;
               this.i8 = 0;
               si32(this.i8,this.i0 + 12);
               si32(this.i3,this.i0 + 16);
               this.i3 = 3;
               si32(this.i3,this.i0 + 20);
               this.i0 = li32(this.i6);
               this.i0 = this.i0 + 12;
               si32(this.i0,this.i6);
               this.i0 = li32(this.i2);
               this.i3 = li32(this.i0 + 68);
               this.i0 = li32(this.i0 + 64);
               if(uint(this.i3) >= uint(this.i0))
               {
                  mstate.esp = mstate.esp - 4;
                  si32(this.i1,mstate.esp);
                  state = 7;
                  mstate.esp = mstate.esp - 4;
                  FSM_luaDoStringImpl.start();
                  return;
               }
               addr651:
               this.i0 = FSM_luaDoStringImpl;
               this.i3 = li32(this.i6);
               mstate.esp = mstate.esp - 12;
               this.i8 = 38;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               si32(this.i8,mstate.esp + 8);
               state = 8;
               mstate.esp = mstate.esp - 4;
               FSM_luaDoStringImpl.start();
               return;
            case 7:
               mstate.esp = mstate.esp + 4;
               §§goto(addr651);
            case 8:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i0,this.i3);
               this.i0 = 4;
               si32(this.i0,this.i3 + 8);
               this.i0 = li32(this.i6);
               this.i3 = this.i0 + 12;
               si32(this.i3,this.i6);
               this.f0 = Number(this.i4);
               sf64(this.f0,this.i0 + 12);
               this.i4 = 3;
               si32(this.i4,this.i0 + 20);
               this.i0 = li32(this.i6);
               this.i0 = this.i0 + 12;
               si32(this.i0,this.i6);
               this.i0 = li32(this.i2);
               this.i4 = li32(this.i0 + 68);
               this.i0 = li32(this.i0 + 64);
               if(uint(this.i4) >= uint(this.i0))
               {
                  mstate.esp = mstate.esp - 4;
                  si32(this.i1,mstate.esp);
                  state = 9;
                  mstate.esp = mstate.esp - 4;
                  FSM_luaDoStringImpl.start();
                  return;
               }
               addr840:
               this.i0 = FSM_luaDoStringImpl;
               this.i4 = li32(this.i6);
               mstate.esp = mstate.esp - 12;
               this.i3 = 16;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               si32(this.i3,mstate.esp + 8);
               state = 10;
               mstate.esp = mstate.esp - 4;
               FSM_luaDoStringImpl.start();
               return;
            case 9:
               mstate.esp = mstate.esp + 4;
               §§goto(addr840);
            case 10:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i0,this.i4);
               this.i0 = 4;
               si32(this.i0,this.i4 + 8);
               this.i0 = li32(this.i6);
               this.i4 = this.i0 + 12;
               si32(this.i4,this.i6);
               this.i3 = li32(this.i5);
               this.i4 = this.i4 - this.i3;
               this.i4 = this.i4 / 12;
               this.i4 = this.i4 + -7;
               this.f0 = Number(this.i4);
               sf64(this.f0,this.i0 + 12);
               this.i4 = 3;
               si32(this.i4,this.i0 + 20);
               this.i0 = li32(this.i6);
               this.i0 = this.i0 + 12;
               si32(this.i0,this.i6);
               this.i0 = li32(this.i2);
               this.i4 = li32(this.i0 + 68);
               this.i0 = li32(this.i0 + 64);
               if(uint(this.i4) >= uint(this.i0))
               {
                  mstate.esp = mstate.esp - 4;
                  si32(this.i1,mstate.esp);
                  state = 11;
                  mstate.esp = mstate.esp - 4;
                  FSM_luaDoStringImpl.start();
                  return;
               }
               addr1053:
               this.i0 = FSM_luaDoStringImpl;
               this.i4 = li32(this.i6);
               mstate.esp = mstate.esp - 12;
               this.i3 = 18;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               si32(this.i3,mstate.esp + 8);
               state = 12;
               mstate.esp = mstate.esp - 4;
               FSM_luaDoStringImpl.start();
               return;
            case 11:
               mstate.esp = mstate.esp + 4;
               §§goto(addr1053);
            case 12:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i0,this.i4);
               this.i0 = 4;
               si32(this.i0,this.i4 + 8);
               this.i0 = li32(this.i6);
               this.i4 = this.i0 + 12;
               si32(this.i4,this.i6);
               this.f0 = Number(this.i7);
               sf64(this.f0,this.i0 + 12);
               this.i4 = 3;
               si32(this.i4,this.i0 + 20);
               this.i0 = li32(this.i6);
               this.i0 = this.i0 + 12;
               si32(this.i0,this.i6);
               this.i0 = li32(this.i2);
               this.i4 = li32(this.i0 + 68);
               this.i0 = li32(this.i0 + 64);
               if(uint(this.i4) >= uint(this.i0))
               {
                  mstate.esp = mstate.esp - 4;
                  si32(this.i1,mstate.esp);
                  state = 13;
                  mstate.esp = mstate.esp - 4;
                  FSM_luaDoStringImpl.start();
                  return;
               }
               addr1242:
               this.i0 = FSM_luaDoStringImpl;
               this.i4 = li32(this.i6);
               mstate.esp = mstate.esp - 12;
               this.i3 = 1;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               si32(this.i3,mstate.esp + 8);
               state = 14;
               mstate.esp = mstate.esp - 4;
               FSM_luaDoStringImpl.start();
               return;
            case 13:
               mstate.esp = mstate.esp + 4;
               §§goto(addr1242);
            case 14:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i0,this.i4);
               this.i0 = 4;
               si32(this.i0,this.i4 + 8);
               this.i0 = li32(this.i6);
               this.i0 = this.i0 + 12;
               si32(this.i0,this.i6);
               this.i0 = li32(this.i2);
               this.i4 = li32(this.i0 + 68);
               this.i0 = li32(this.i0 + 64);
               if(uint(this.i4) >= uint(this.i0))
               {
                  mstate.esp = mstate.esp - 4;
                  si32(this.i1,mstate.esp);
                  state = 15;
                  mstate.esp = mstate.esp - 4;
                  FSM_luaDoStringImpl.start();
                  return;
               }
               addr1392:
               this.i0 = 10;
               this.i4 = li32(this.i6);
               this.i3 = li32(this.i5);
               this.i4 = this.i4 - this.i3;
               this.i4 = this.i4 / 12;
               mstate.esp = mstate.esp - 12;
               this.i4 = this.i4 + -1;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               si32(this.i4,mstate.esp + 8);
               state = 16;
               mstate.esp = mstate.esp - 4;
               FSM_luaDoStringImpl.start();
               return;
            case 15:
               mstate.esp = mstate.esp + 4;
               §§goto(addr1392);
            case 16:
               mstate.esp = mstate.esp + 12;
               this.i0 = li32(this.i6);
               this.i0 = this.i0 + -108;
               si32(this.i0,this.i6);
               mstate.esp = mstate.esp - 8;
               this.i0 = -2;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_luaDoStringImpl.start();
            case 17:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i4 = li32(this.i6);
               this.f0 = lf64(this.i0);
               sf64(this.f0,this.i4);
               this.i0 = li32(this.i0 + 8);
               si32(this.i0,this.i4 + 8);
               this.i0 = li32(this.i6);
               this.i0 = this.i0 + 12;
               si32(this.i0,this.i6);
               mstate.esp = mstate.esp - 8;
               this.i0 = -3;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_luaDoStringImpl.start();
            case 18:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i4 = li32(this.i6);
               this.i3 = this.i0;
               this.i7 = this.i0 + 12;
               if(uint(this.i7) >= uint(this.i4))
               {
                  this.i0 = this.i4;
               }
               else
               {
                  this.i0 = this.i0 + 12;
                  this.i4 = this.i3;
                  while(true)
                  {
                     this.f0 = lf64(this.i4 + 12);
                     sf64(this.f0,this.i4);
                     this.i3 = li32(this.i4 + 20);
                     si32(this.i3,this.i4 + 8);
                     this.i4 = li32(this.i6);
                     this.i3 = this.i0 + 12;
                     this.i7 = this.i0;
                     if(uint(this.i3) >= uint(this.i4))
                     {
                        break;
                     }
                     this.i0 = this.i3;
                     this.i4 = this.i7;
                  }
                  this.i0 = this.i4;
               }
               this.i0 = this.i0 + -12;
               si32(this.i0,this.i6);
               this.i0 = li32(this.i2);
               this.i4 = li32(this.i0 + 68);
               this.i0 = li32(this.i0 + 64);
               if(uint(this.i4) >= uint(this.i0))
               {
                  mstate.esp = mstate.esp - 4;
                  si32(this.i1,mstate.esp);
                  state = 19;
                  mstate.esp = mstate.esp - 4;
                  FSM_luaDoStringImpl.start();
                  return;
               }
               addr1776:
               this.i0 = 2;
               this.i4 = li32(this.i6);
               this.i5 = li32(this.i5);
               this.i4 = this.i4 - this.i5;
               this.i4 = this.i4 / 12;
               mstate.esp = mstate.esp - 12;
               this.i4 = this.i4 + -1;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               si32(this.i4,mstate.esp + 8);
               state = 20;
               mstate.esp = mstate.esp - 4;
               FSM_luaDoStringImpl.start();
               return;
            case 19:
               mstate.esp = mstate.esp + 4;
               §§goto(addr1776);
            case 20:
               mstate.esp = mstate.esp + 12;
               this.i0 = li32(this.i6);
               this.i0 = this.i0 + -12;
               si32(this.i0,this.i6);
               mstate.esp = mstate.esp - 12;
               this.i0 = 0;
               this.i4 = -1;
               si32(this.i1,mstate.esp);
               si32(this.i4,mstate.esp + 4);
               si32(this.i0,mstate.esp + 8);
               state = 21;
               mstate.esp = mstate.esp - 4;
               FSM_luaDoStringImpl.start();
               return;
            case 21:
               this.i1 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               this.i0 = li32(this.i6);
               this.i0 = this.i0 + -12;
               si32(this.i0,this.i6);
               this.i0 = FSM_luaDoStringImpl;
               trace(mstate.gworker.stringFromPtr(this.i0));
               this.i0 = this.i1;
               trace(mstate.gworker.stringFromPtr(this.i0));
               mstate.esp = mstate.esp - 4;
               si32(this.i4,mstate.esp);
               state = 22;
               mstate.esp = mstate.esp - 4;
               FSM_luaDoStringImpl.start();
               return;
            case 22:
               mstate.esp = mstate.esp + 4;
               addr1990:
               this.i2 = 0;
               mstate.esp = mstate.esp - 12;
               si32(this.i1,mstate.esp);
               si32(this.i2,mstate.esp + 4);
               si32(this.i0,mstate.esp + 8);
               state = 23;
               mstate.esp = mstate.esp - 4;
               FSM_luaDoStringImpl.start();
               return;
            case 23:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               addr2043:
               if(this.i0 != 0)
               {
                  this.i0 = -1;
                  mstate.esp = mstate.esp - 8;
                  si32(this.i1,mstate.esp);
                  si32(this.i0,mstate.esp + 4);
                  mstate.esp = mstate.esp - 4;
                  FSM_luaDoStringImpl.start();
               }
               else
               {
                  addr2313:
                  this.i0 = 0;
                  this.i2 = li32(this.i6);
                  this.i3 = li32(this.i5);
                  this.i2 = this.i2 - this.i3;
                  mstate.esp = mstate.esp - 16;
                  this.i3 = this.i4 + 1;
                  this.i2 = this.i2 / 12;
                  si32(this.i1,mstate.esp);
                  si32(this.i3,mstate.esp + 4);
                  si32(this.i2,mstate.esp + 8);
                  si32(this.i0,mstate.esp + 12);
                  state = 27;
                  mstate.esp = mstate.esp - 4;
                  FSM_luaDoStringImpl.start();
                  return;
               }
            case 24:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i3 = li32(this.i6);
               this.f0 = lf64(this.i2);
               sf64(this.f0,this.i3);
               this.i2 = li32(this.i2 + 8);
               si32(this.i2,this.i3 + 8);
               this.i2 = li32(this.i6);
               this.i2 = this.i2 + 12;
               si32(this.i2,this.i6);
               mstate.esp = mstate.esp - 12;
               this.i2 = 0;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               si32(this.i2,mstate.esp + 8);
               state = 25;
               mstate.esp = mstate.esp - 4;
               FSM_luaDoStringImpl.start();
               return;
            case 25:
               this.i0 = mstate.eax;
               this.i3 = FSM_luaDoStringImpl;
               mstate.esp = mstate.esp + 12;
               this.i7 = FSM_luaDoStringImpl;
               this.i3 = this.i0 == 0?int(this.i3):int(this.i0);
               this.i0 = this.i7;
               trace(mstate.gworker.stringFromPtr(this.i0));
               this.i0 = this.i3;
               trace(mstate.gworker.stringFromPtr(this.i0));
               this.i0 = li32(this.i6);
               this.i3 = this.i0 + -12;
               si32(this.i3,this.i6);
               si32(this.i2,this.i0 + -12);
               this.i2 = 1;
               si32(this.i2,this.i0 + -4);
               this.i0 = li32(this.i6);
               this.i0 = this.i0 + 12;
               si32(this.i0,this.i6);
               mstate.esp = mstate.esp - 8;
               si32(this.i1,mstate.esp);
               si32(this.i2,mstate.esp + 4);
               state = 26;
               mstate.esp = mstate.esp - 4;
               FSM_luaDoStringImpl.start();
               return;
            case 26:
               mstate.esp = mstate.esp + 8;
               §§goto(addr2313);
            case 27:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 16;
               this.i1 = li32(this.i6);
               this.i2 = li32(this.i5);
               this.i3 = this.i1 - this.i2;
               this.i4 = this.i4 + -1;
               this.i3 = this.i3 / 12;
               this.i3 = this.i4 - this.i3;
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
            case 28:
               this.i7 = mstate.eax;
               mstate.esp = mstate.esp + 20;
               this.i8 = li32(this.i1 + 16);
               this.i9 = li32(mstate.ebp + -20);
               this.i10 = li32(mstate.ebp + -28);
               this.i11 = li32(this.i8 + 12);
               this.i12 = li32(this.i8 + 16);
               mstate.esp = mstate.esp - 16;
               si32(this.i12,mstate.esp);
               si32(this.i10,mstate.esp + 4);
               si32(this.i9,mstate.esp + 8);
               si32(this.i2,mstate.esp + 12);
               state = 29;
               mstate.esp = mstate.esp - 4;
               mstate.funcs[this.i11]();
               return;
            case 29:
               this.i10 = mstate.eax;
               mstate.esp = mstate.esp + 16;
               this.i10 = li32(this.i8 + 68);
               this.i9 = this.i10 - this.i9;
               si32(this.i9,this.i8 + 68);
               mstate.esp = mstate.esp - 8;
               si32(this.i3,mstate.esp);
               si32(this.i2,mstate.esp + 4);
               state = 30;
               mstate.esp = mstate.esp - 4;
               FSM_luaDoStringImpl.start();
               return;
            case 30:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i2 = this.i1 + 16;
               if(this.i7 != 0)
               {
                  this.i0 = this.i7;
                  §§goto(addr2043);
               }
               else
               {
                  this.i3 = li32(this.i6);
                  this.i7 = li32(this.i5);
                  this.i3 = this.i3 - this.i7;
                  this.i7 = this.i4 + 2;
                  this.i3 = this.i3 / 12;
                  if(this.i3 != this.i7)
                  {
                     mstate.esp = mstate.esp - 8;
                     si32(this.i1,mstate.esp);
                     si32(this.i4,mstate.esp + 4);
                     state = 2;
                     mstate.esp = mstate.esp - 4;
                     FSM_luaDoStringImpl.start();
                     return;
                  }
                  §§goto(addr1990);
               }
         }
         this.i0 = FSM_luaDoStringImpl;
         this.i3 = li32(this.i6);
         mstate.esp = mstate.esp - 12;
         this.i8 = 1;
         si32(this.i1,mstate.esp);
         si32(this.i0,mstate.esp + 4);
         si32(this.i8,mstate.esp + 8);
         state = 6;
         mstate.esp = mstate.esp - 4;
         FSM_luaDoStringImpl.start();
      }
   }
}
