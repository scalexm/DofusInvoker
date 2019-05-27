package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.lf64;
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.li8;
   import avm2.intrinsics.memory.sf64;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_as3_type extends Machine
   {
      
      public static const intRegCount:int = 9;
      
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
      
      public function FSM_as3_type()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM_as3_type = null;
         _loc1_ = new FSM_as3_type();
         FSM_as3_type.gworker = _loc1_;
      }
      
      override public final function work() : void
      {
         switch(state)
         {
            case 0:
               mstate.esp = mstate.esp - 4;
               si32(mstate.ebp,mstate.esp);
               mstate.ebp = mstate.esp;
               mstate.esp = mstate.esp - 16;
               this.i0 = 1;
               this.i1 = li32(mstate.ebp + 8);
               this.i2 = li32(this.i1 + 8);
               this.i3 = li32(this.i1 + 12);
               mstate.esp = mstate.esp - 8;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_as3_type.start();
            case 1:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i2 = this.i2 - this.i3;
               this.i3 = li32(this.i0 + 8);
               this.i2 = this.i2 / 12;
               this.i4 = this.i1 + 12;
               this.i5 = this.i1 + 8;
               if(this.i3 != 2)
               {
                  if(this.i3 != 7)
                  {
                     this.i0 = 0;
                  }
                  else
                  {
                     this.i0 = li32(this.i0);
                     this.i0 = this.i0 + 20;
                  }
               }
               else
               {
                  this.i0 = li32(this.i0);
               }
               if(this.i0 != 0)
               {
                  this.i3 = 1;
                  mstate.esp = mstate.esp - 8;
                  si32(this.i1,mstate.esp);
                  si32(this.i3,mstate.esp + 4);
                  mstate.esp = mstate.esp - 4;
                  FSM_as3_type.start();
               }
               addr201:
               this.i0 = 0;
               this.i3 = li32(this.i5);
               si32(this.i0,this.i3 + 8);
               this.i0 = li32(this.i5);
               this.i0 = this.i0 + 12;
               si32(this.i0,this.i5);
               this.i3 = li32(this.i4);
               this.i0 = this.i0 - this.i3;
               this.i3 = this.i2 + 1;
               this.i0 = this.i0 / 12;
               if(this.i0 != this.i3)
               {
                  addr984:
                  mstate.esp = mstate.esp - 8;
                  si32(this.i1,mstate.esp);
                  si32(this.i2,mstate.esp + 4);
                  state = 14;
                  mstate.esp = mstate.esp - 4;
                  FSM_as3_type.start();
                  return;
               }
               break;
            case 2:
               this.i3 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               if(this.i3 == 0)
               {
                  §§goto(addr201);
               }
               else
               {
                  this.i3 = -10000;
                  mstate.esp = mstate.esp - 8;
                  si32(this.i1,mstate.esp);
                  si32(this.i3,mstate.esp + 4);
                  mstate.esp = mstate.esp - 4;
                  FSM_as3_type.start();
               }
            case 3:
               this.i3 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i6 = FSM_as3_type;
               while(true)
               {
                  this.i7 = li8(this.i6 + 1);
                  this.i6 = this.i6 + 1;
                  this.i8 = this.i6;
                  if(this.i7 != 0)
                  {
                     this.i6 = this.i8;
                     continue;
                  }
                  break;
               }
               this.i7 = FSM_as3_type;
               mstate.esp = mstate.esp - 12;
               this.i6 = this.i6 - this.i7;
               si32(this.i1,mstate.esp);
               si32(this.i7,mstate.esp + 4);
               si32(this.i6,mstate.esp + 8);
               state = 4;
               mstate.esp = mstate.esp - 4;
               FSM_as3_type.start();
               return;
            case 4:
               this.i6 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i6,mstate.ebp + -16);
               this.i6 = 4;
               si32(this.i6,mstate.ebp + -8);
               this.i6 = li32(this.i5);
               mstate.esp = mstate.esp - 16;
               this.i7 = mstate.ebp + -16;
               si32(this.i1,mstate.esp);
               si32(this.i3,mstate.esp + 4);
               si32(this.i7,mstate.esp + 8);
               si32(this.i6,mstate.esp + 12);
               state = 5;
               mstate.esp = mstate.esp - 4;
               FSM_as3_type.start();
               return;
            case 5:
               mstate.esp = mstate.esp + 16;
               this.i3 = li32(this.i5);
               this.i3 = this.i3 + 12;
               si32(this.i3,this.i5);
               mstate.esp = mstate.esp - 8;
               this.i3 = -1;
               si32(this.i1,mstate.esp);
               si32(this.i3,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_as3_type.start();
            case 6:
               this.i3 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               mstate.esp = mstate.esp - 8;
               this.i6 = -2;
               si32(this.i1,mstate.esp);
               si32(this.i6,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_as3_type.start();
            case 7:
               this.i6 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i7 = FSM_as3_type;
               if(this.i6 != this.i7)
               {
                  this.i7 = FSM_as3_type;
                  if(this.i3 != this.i7)
                  {
                     mstate.esp = mstate.esp - 8;
                     si32(this.i3,mstate.esp);
                     si32(this.i6,mstate.esp + 4);
                     mstate.esp = mstate.esp - 4;
                     FSM_as3_type.start();
                  }
                  addr641:
                  this.i6 = li32(this.i5);
                  this.i7 = this.i6 + -24;
                  si32(this.i7,this.i5);
                  this.i7 = this.i2 + 1;
                  this.i3 = this.i3 ^ 1;
                  this.i3 = this.i3 & 1;
                  if(this.i3 == 0)
                  {
                     this.i0 = 0;
                     si32(this.i0,this.i6 + -16);
                     this.i0 = li32(this.i5);
                     this.i0 = this.i0 + 12;
                     si32(this.i0,this.i5);
                     this.i3 = li32(this.i4);
                     this.i0 = this.i0 - this.i3;
                     this.i0 = this.i0 / 12;
                     if(this.i0 != this.i7)
                     {
                        §§goto(addr984);
                     }
                     else
                     {
                        break;
                     }
                  }
                  else
                  {
                     this.i3 = FSM_as3_type;
                     this.i0 = li32(this.i0);
                     mstate.esp = mstate.esp - 8;
                     si32(this.i3,mstate.esp);
                     si32(this.i0,mstate.esp + 4);
                     state = 9;
                     mstate.esp = mstate.esp - 4;
                     mstate.funcs[FSM_as3_type]();
                     return;
                  }
               }
               this.i3 = 1;
               §§goto(addr641);
            case 8:
               this.i3 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i3 = this.i3 == 0?1:0;
               §§goto(addr641);
            case 9:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i3 = li32(FSM_as3_type);
               mstate.esp = mstate.esp - 12;
               this.i6 = 0;
               si32(this.i3,mstate.esp);
               si32(this.i6,mstate.esp + 4);
               si32(this.i0,mstate.esp + 8);
               state = 10;
               mstate.esp = mstate.esp - 4;
               mstate.funcs[FSM_as3_type]();
               return;
            case 10:
               this.i3 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               mstate.esp = mstate.esp - 8;
               si32(this.i1,mstate.esp);
               si32(this.i3,mstate.esp + 4);
               state = 11;
               mstate.esp = mstate.esp - 4;
               FSM_as3_type.start();
               return;
            case 11:
               mstate.esp = mstate.esp + 8;
               mstate.esp = mstate.esp - 4;
               si32(this.i3,mstate.esp);
               state = 12;
               mstate.esp = mstate.esp - 4;
               mstate.funcs[FSM_as3_type]();
               return;
            case 12:
               mstate.esp = mstate.esp + 4;
               mstate.esp = mstate.esp - 4;
               si32(this.i0,mstate.esp);
               state = 13;
               mstate.esp = mstate.esp - 4;
               mstate.funcs[FSM_as3_type]();
               return;
            case 13:
               mstate.esp = mstate.esp + 4;
               this.i0 = li32(this.i5);
               this.i3 = li32(this.i4);
               this.i0 = this.i0 - this.i3;
               this.i0 = this.i0 / 12;
               if(this.i0 != this.i7)
               {
                  §§goto(addr984);
               }
               else
               {
                  break;
               }
            case 14:
               mstate.esp = mstate.esp + 8;
               this.i0 = li32(this.i1 + 16);
               this.i3 = li32(this.i0 + 68);
               this.i0 = li32(this.i0 + 64);
               this.i6 = this.i1 + 16;
               if(uint(this.i3) >= uint(this.i0))
               {
                  mstate.esp = mstate.esp - 4;
                  si32(this.i1,mstate.esp);
                  state = 15;
                  mstate.esp = mstate.esp - 4;
                  FSM_as3_type.start();
                  return;
               }
               addr1088:
               this.i0 = FSM_as3_type;
               this.i3 = li32(this.i5);
               mstate.esp = mstate.esp - 12;
               this.i7 = 19;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               si32(this.i7,mstate.esp + 8);
               state = 16;
               mstate.esp = mstate.esp - 4;
               FSM_as3_type.start();
               return;
            case 15:
               mstate.esp = mstate.esp + 4;
               §§goto(addr1088);
            case 16:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i0,this.i3);
               this.i0 = 4;
               si32(this.i0,this.i3 + 8);
               this.i0 = li32(this.i5);
               this.i0 = this.i0 + 12;
               si32(this.i0,this.i5);
               this.i0 = li32(this.i6);
               this.i3 = li32(this.i0 + 68);
               this.i0 = li32(this.i0 + 64);
               if(uint(this.i3) >= uint(this.i0))
               {
                  mstate.esp = mstate.esp - 4;
                  si32(this.i1,mstate.esp);
                  state = 17;
                  mstate.esp = mstate.esp - 4;
                  FSM_as3_type.start();
                  return;
               }
               addr1238:
               this.i0 = FSM_as3_type;
               this.i3 = li32(this.i5);
               mstate.esp = mstate.esp - 12;
               this.i7 = 1;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               si32(this.i7,mstate.esp + 8);
               state = 18;
               mstate.esp = mstate.esp - 4;
               FSM_as3_type.start();
               return;
            case 17:
               mstate.esp = mstate.esp + 4;
               §§goto(addr1238);
            case 18:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i0,this.i3);
               this.i0 = 4;
               si32(this.i0,this.i3 + 8);
               this.i0 = li32(this.i5);
               this.i3 = this.i0 + 12;
               si32(this.i3,this.i5);
               this.i3 = 1082198016;
               this.i7 = 0;
               si32(this.i7,this.i0 + 12);
               si32(this.i3,this.i0 + 16);
               this.i3 = 3;
               si32(this.i3,this.i0 + 20);
               this.i0 = li32(this.i5);
               this.i0 = this.i0 + 12;
               si32(this.i0,this.i5);
               this.i0 = li32(this.i6);
               this.i3 = li32(this.i0 + 68);
               this.i0 = li32(this.i0 + 64);
               if(uint(this.i3) >= uint(this.i0))
               {
                  mstate.esp = mstate.esp - 4;
                  si32(this.i1,mstate.esp);
                  state = 19;
                  mstate.esp = mstate.esp - 4;
                  FSM_as3_type.start();
                  return;
               }
               addr1434:
               this.i0 = FSM_as3_type;
               this.i3 = li32(this.i5);
               mstate.esp = mstate.esp - 12;
               this.i7 = 38;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               si32(this.i7,mstate.esp + 8);
               state = 20;
               mstate.esp = mstate.esp - 4;
               FSM_as3_type.start();
               return;
            case 19:
               mstate.esp = mstate.esp + 4;
               §§goto(addr1434);
            case 20:
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
               this.i3 = 3;
               si32(this.i3,this.i0 + 20);
               this.i0 = li32(this.i5);
               this.i0 = this.i0 + 12;
               si32(this.i0,this.i5);
               this.i0 = li32(this.i6);
               this.i3 = li32(this.i0 + 68);
               this.i0 = li32(this.i0 + 64);
               if(uint(this.i3) >= uint(this.i0))
               {
                  mstate.esp = mstate.esp - 4;
                  si32(this.i1,mstate.esp);
                  state = 21;
                  mstate.esp = mstate.esp - 4;
                  FSM_as3_type.start();
                  return;
               }
               addr1623:
               this.i0 = FSM_as3_type;
               this.i3 = li32(this.i5);
               mstate.esp = mstate.esp - 12;
               this.i7 = 16;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               si32(this.i7,mstate.esp + 8);
               state = 22;
               mstate.esp = mstate.esp - 4;
               FSM_as3_type.start();
               return;
            case 21:
               mstate.esp = mstate.esp + 4;
               §§goto(addr1623);
            case 22:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i0,this.i3);
               this.i0 = 4;
               si32(this.i0,this.i3 + 8);
               this.i0 = li32(this.i5);
               this.i3 = this.i0 + 12;
               si32(this.i3,this.i5);
               this.i7 = li32(this.i4);
               this.i3 = this.i3 - this.i7;
               this.i3 = this.i3 / 12;
               this.i3 = this.i3 + -7;
               this.f0 = Number(this.i3);
               sf64(this.f0,this.i0 + 12);
               this.i3 = 3;
               si32(this.i3,this.i0 + 20);
               this.i0 = li32(this.i5);
               this.i0 = this.i0 + 12;
               si32(this.i0,this.i5);
               this.i0 = li32(this.i6);
               this.i3 = li32(this.i0 + 68);
               this.i0 = li32(this.i0 + 64);
               if(uint(this.i3) >= uint(this.i0))
               {
                  mstate.esp = mstate.esp - 4;
                  si32(this.i1,mstate.esp);
                  state = 23;
                  mstate.esp = mstate.esp - 4;
                  FSM_as3_type.start();
                  return;
               }
               addr1836:
               this.i0 = FSM_as3_type;
               this.i3 = li32(this.i5);
               mstate.esp = mstate.esp - 12;
               this.i7 = 18;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               si32(this.i7,mstate.esp + 8);
               state = 24;
               mstate.esp = mstate.esp - 4;
               FSM_as3_type.start();
               return;
            case 23:
               mstate.esp = mstate.esp + 4;
               §§goto(addr1836);
            case 24:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i0,this.i3);
               this.i0 = 4;
               si32(this.i0,this.i3 + 8);
               this.i0 = li32(this.i5);
               this.i2 = this.i2 + 1;
               this.i3 = this.i0 + 12;
               si32(this.i3,this.i5);
               this.f0 = Number(this.i2);
               sf64(this.f0,this.i0 + 12);
               this.i2 = 3;
               si32(this.i2,this.i0 + 20);
               this.i0 = li32(this.i5);
               this.i0 = this.i0 + 12;
               si32(this.i0,this.i5);
               this.i0 = li32(this.i6);
               this.i2 = li32(this.i0 + 68);
               this.i0 = li32(this.i0 + 64);
               if(uint(this.i2) >= uint(this.i0))
               {
                  mstate.esp = mstate.esp - 4;
                  si32(this.i1,mstate.esp);
                  state = 25;
                  mstate.esp = mstate.esp - 4;
                  FSM_as3_type.start();
                  return;
               }
               addr2031:
               this.i0 = FSM_as3_type;
               this.i2 = li32(this.i5);
               mstate.esp = mstate.esp - 12;
               this.i3 = 1;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               si32(this.i3,mstate.esp + 8);
               state = 26;
               mstate.esp = mstate.esp - 4;
               FSM_as3_type.start();
               return;
            case 25:
               mstate.esp = mstate.esp + 4;
               §§goto(addr2031);
            case 26:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i0,this.i2);
               this.i0 = 4;
               si32(this.i0,this.i2 + 8);
               this.i0 = li32(this.i5);
               this.i0 = this.i0 + 12;
               si32(this.i0,this.i5);
               this.i0 = li32(this.i6);
               this.i2 = li32(this.i0 + 68);
               this.i0 = li32(this.i0 + 64);
               if(uint(this.i2) >= uint(this.i0))
               {
                  mstate.esp = mstate.esp - 4;
                  si32(this.i1,mstate.esp);
                  state = 27;
                  mstate.esp = mstate.esp - 4;
                  FSM_as3_type.start();
                  return;
               }
               addr2181:
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
               state = 28;
               mstate.esp = mstate.esp - 4;
               FSM_as3_type.start();
               return;
            case 27:
               mstate.esp = mstate.esp + 4;
               §§goto(addr2181);
            case 28:
               mstate.esp = mstate.esp + 12;
               this.i0 = li32(this.i5);
               this.i0 = this.i0 + -108;
               si32(this.i0,this.i5);
               mstate.esp = mstate.esp - 8;
               this.i0 = -2;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_as3_type.start();
            case 29:
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
               FSM_as3_type.start();
            case 30:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i2 = li32(this.i5);
               this.i3 = this.i0;
               this.i7 = this.i0 + 12;
               if(uint(this.i7) >= uint(this.i2))
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
                     this.i7 = this.i0;
                     if(uint(this.i3) >= uint(this.i2))
                     {
                        break;
                     }
                     this.i0 = this.i3;
                     this.i2 = this.i7;
                  }
                  this.i0 = this.i2;
               }
               this.i0 = this.i0 + -12;
               si32(this.i0,this.i5);
               this.i0 = li32(this.i6);
               this.i2 = li32(this.i0 + 68);
               this.i0 = li32(this.i0 + 64);
               if(uint(this.i2) >= uint(this.i0))
               {
                  mstate.esp = mstate.esp - 4;
                  si32(this.i1,mstate.esp);
                  state = 31;
                  mstate.esp = mstate.esp - 4;
                  FSM_as3_type.start();
                  return;
               }
               addr2565:
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
               state = 32;
               mstate.esp = mstate.esp - 4;
               FSM_as3_type.start();
               return;
            case 31:
               mstate.esp = mstate.esp + 4;
               §§goto(addr2565);
            case 32:
               mstate.esp = mstate.esp + 12;
               this.i0 = li32(this.i5);
               this.i0 = this.i0 + -12;
               si32(this.i0,this.i5);
               mstate.esp = mstate.esp - 4;
               si32(this.i1,mstate.esp);
               state = 33;
               mstate.esp = mstate.esp - 4;
               FSM_as3_type.start();
               return;
            case 33:
               mstate.esp = mstate.esp + 4;
         }
         this.i0 = 1;
         mstate.eax = this.i0;
         mstate.esp = mstate.ebp;
         mstate.ebp = li32(mstate.esp);
         mstate.esp = mstate.esp + 4;
         mstate.esp = mstate.esp + 4;
         mstate.gworker = caller;
      }
   }
}
