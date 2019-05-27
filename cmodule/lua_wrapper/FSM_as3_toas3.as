package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.lf64;
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.li8;
   import avm2.intrinsics.memory.sf64;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_as3_toas3 extends Machine
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
      
      public function FSM_as3_toas3()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM_as3_toas3 = null;
         _loc1_ = new FSM_as3_toas3();
         FSM_as3_toas3.gworker = _loc1_;
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
               this.i0 = -10000;
               this.i1 = li32(mstate.ebp + 8);
               this.i2 = li32(this.i1 + 8);
               this.i3 = li32(this.i1 + 12);
               mstate.esp = mstate.esp - 8;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_as3_toas3.start();
            case 1:
               this.i0 = mstate.eax;
               this.i2 = this.i2 - this.i3;
               mstate.esp = mstate.esp + 8;
               this.i3 = FSM_as3_toas3;
               this.i4 = this.i2 / 12;
               this.i5 = this.i1 + 12;
               this.i6 = this.i1 + 8;
               while(true)
               {
                  this.i7 = li8(this.i3 + 1);
                  this.i3 = this.i3 + 1;
                  this.i8 = this.i3;
                  if(this.i7 != 0)
                  {
                     this.i3 = this.i8;
                     continue;
                  }
                  break;
               }
               this.i7 = FSM_as3_toas3;
               mstate.esp = mstate.esp - 12;
               this.i3 = this.i3 - this.i7;
               si32(this.i1,mstate.esp);
               si32(this.i7,mstate.esp + 4);
               si32(this.i3,mstate.esp + 8);
               state = 2;
               mstate.esp = mstate.esp - 4;
               FSM_as3_toas3.start();
               return;
            case 2:
               this.i3 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i3,mstate.ebp + -16);
               this.i3 = 4;
               si32(this.i3,mstate.ebp + -8);
               this.i3 = li32(this.i6);
               mstate.esp = mstate.esp - 16;
               this.i7 = mstate.ebp + -16;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               si32(this.i7,mstate.esp + 8);
               si32(this.i3,mstate.esp + 12);
               state = 3;
               mstate.esp = mstate.esp - 4;
               FSM_as3_toas3.start();
               return;
            case 3:
               mstate.esp = mstate.esp + 16;
               this.i0 = li32(this.i6);
               this.i0 = this.i0 + 12;
               si32(this.i0,this.i6);
               if(this.i2 >= 12)
               {
                  this.i0 = 1;
                  addr309:
                  while(true)
                  {
                     this.i2 = FSM_as3_toas3;
                     mstate.esp = mstate.esp - 8;
                     si32(this.i1,mstate.esp);
                     si32(this.i0,mstate.esp + 4);
                     mstate.esp = mstate.esp - 4;
                     FSM_as3_toas3.start();
                  }
               }
               addr973:
               mstate.esp = mstate.esp - 8;
               this.i0 = this.i4 + 1;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_as3_toas3.start();
            case 4:
               while(true)
               {
                  this.i3 = mstate.eax;
                  mstate.esp = mstate.esp + 8;
                  if(this.i3 == this.i2)
                  {
                     this.i3 = -1;
                  }
                  else
                  {
                     this.i3 = li32(this.i3 + 8);
                  }
                  this.i2 = this.i3;
                  if(this.i2 != 7)
                  {
                     break;
                  }
                  mstate.esp = mstate.esp - 8;
                  si32(this.i1,mstate.esp);
                  si32(this.i0,mstate.esp + 4);
                  mstate.esp = mstate.esp - 4;
                  FSM_as3_toas3.start();
               }
               mstate.esp = mstate.esp - 12;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               si32(this.i2,mstate.esp + 8);
               state = 5;
               mstate.esp = mstate.esp - 4;
               FSM_as3_toas3.start();
               return;
            case 5:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               mstate.esp = mstate.esp - 8;
               si32(this.i1,mstate.esp);
               si32(this.i2,mstate.esp + 4);
               state = 6;
               mstate.esp = mstate.esp - 4;
               FSM_as3_toas3.start();
               return;
            case 6:
               mstate.esp = mstate.esp + 8;
               this.i0 = this.i0 + 1;
               if(this.i0 <= this.i4)
               {
                  addr308:
                  while(true)
                  {
                     §§goto(addr309);
                  }
               }
               §§goto(addr973);
            case 7:
               while(true)
               {
                  this.i2 = mstate.eax;
                  mstate.esp = mstate.esp + 8;
                  if(this.i2 == 0)
                  {
                     break;
                  }
                  this.i2 = -1;
                  mstate.esp = mstate.esp - 8;
                  si32(this.i1,mstate.esp);
                  si32(this.i2,mstate.esp + 4);
                  mstate.esp = mstate.esp - 4;
                  FSM_as3_toas3.start();
               }
               this.i2 = FSM_as3_toas3;
               mstate.esp = mstate.esp - 4;
               si32(this.i2,mstate.esp);
               state = 8;
               mstate.esp = mstate.esp - 4;
               mstate.funcs[FSM_as3_toas3]();
               return;
            case 8:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 4;
               mstate.esp = mstate.esp - 8;
               si32(this.i1,mstate.esp);
               si32(this.i2,mstate.esp + 4);
               state = 9;
               mstate.esp = mstate.esp - 4;
               FSM_as3_toas3.start();
               return;
            case 9:
               mstate.esp = mstate.esp + 8;
               this.i0 = this.i0 + 1;
               if(this.i0 <= this.i4)
               {
                  §§goto(addr308);
               }
               §§goto(addr973);
            case 10:
               while(true)
               {
                  this.i2 = mstate.eax;
                  mstate.esp = mstate.esp + 8;
                  mstate.esp = mstate.esp - 8;
                  this.i3 = -2;
                  si32(this.i1,mstate.esp);
                  si32(this.i3,mstate.esp + 4);
                  mstate.esp = mstate.esp - 4;
                  FSM_as3_toas3.start();
               }
            case 11:
               while(true)
               {
                  this.i3 = mstate.eax;
                  mstate.esp = mstate.esp + 8;
                  this.i7 = FSM_as3_toas3;
                  if(this.i3 != this.i7)
                  {
                     this.i7 = FSM_as3_toas3;
                     if(this.i2 != this.i7)
                     {
                        mstate.esp = mstate.esp - 8;
                        si32(this.i2,mstate.esp);
                        si32(this.i3,mstate.esp + 4);
                        mstate.esp = mstate.esp - 4;
                        FSM_as3_toas3.start();
                     }
                     else
                     {
                        break;
                     }
                  }
                  break;
               }
               this.i2 = li32(this.i6);
               this.i2 = this.i2 + -12;
               si32(this.i2,this.i6);
               this.i2 = FSM_as3_toas3;
               mstate.esp = mstate.esp - 4;
               si32(this.i2,mstate.esp);
               state = 14;
               mstate.esp = mstate.esp - 4;
               mstate.funcs[FSM_as3_toas3]();
               return;
            case 12:
               while(true)
               {
                  this.i2 = mstate.eax;
                  mstate.esp = mstate.esp + 8;
                  this.i3 = li32(this.i6);
                  this.i3 = this.i3 + -12;
                  si32(this.i3,this.i6);
                  if(this.i2 != 0)
                  {
                     mstate.esp = mstate.esp - 8;
                     si32(this.i1,mstate.esp);
                     si32(this.i0,mstate.esp + 4);
                     mstate.esp = mstate.esp - 4;
                     FSM_as3_toas3.start();
                  }
                  break;
               }
               §§goto(addr880);
            case 13:
               while(true)
               {
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
                  this.i0 = this.i0 + 1;
                  if(this.i0 <= this.i4)
                  {
                     §§goto(addr308);
                  }
                  else
                  {
                     break;
                  }
               }
               §§goto(addr973);
            case 14:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 4;
               mstate.esp = mstate.esp - 8;
               si32(this.i1,mstate.esp);
               si32(this.i2,mstate.esp + 4);
               state = 15;
               mstate.esp = mstate.esp - 4;
               FSM_as3_toas3.start();
               return;
            case 15:
               mstate.esp = mstate.esp + 8;
               this.i0 = this.i0 + 1;
               if(this.i0 <= this.i4)
               {
                  §§goto(addr308);
               }
               §§goto(addr973);
            case 16:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i2 = li32(this.i6);
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
                     this.i2 = li32(this.i6);
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
               si32(this.i0,this.i6);
               this.i2 = li32(this.i5);
               this.i3 = this.i4 << 1;
               this.i0 = this.i0 - this.i2;
               this.i0 = this.i0 / 12;
               if(this.i0 != this.i3)
               {
                  mstate.esp = mstate.esp - 8;
                  si32(this.i1,mstate.esp);
                  si32(this.i4,mstate.esp + 4);
                  state = 17;
                  mstate.esp = mstate.esp - 4;
                  FSM_as3_toas3.start();
                  return;
               }
               addr2851:
               mstate.eax = this.i4;
               mstate.esp = mstate.ebp;
               mstate.ebp = li32(mstate.esp);
               mstate.esp = mstate.esp + 4;
               mstate.esp = mstate.esp + 4;
               mstate.gworker = caller;
               return;
            case 17:
               mstate.esp = mstate.esp + 8;
               this.i0 = li32(this.i1 + 16);
               this.i2 = li32(this.i0 + 68);
               this.i0 = li32(this.i0 + 64);
               this.i7 = this.i1 + 16;
               if(uint(this.i2) >= uint(this.i0))
               {
                  mstate.esp = mstate.esp - 4;
                  si32(this.i1,mstate.esp);
                  state = 18;
                  mstate.esp = mstate.esp - 4;
                  FSM_as3_toas3.start();
                  return;
               }
               addr1258:
               this.i0 = FSM_as3_toas3;
               this.i2 = li32(this.i6);
               mstate.esp = mstate.esp - 12;
               this.i8 = 19;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               si32(this.i8,mstate.esp + 8);
               state = 19;
               mstate.esp = mstate.esp - 4;
               FSM_as3_toas3.start();
               return;
            case 18:
               mstate.esp = mstate.esp + 4;
               §§goto(addr1258);
            case 19:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i0,this.i2);
               this.i0 = 4;
               si32(this.i0,this.i2 + 8);
               this.i0 = li32(this.i6);
               this.i0 = this.i0 + 12;
               si32(this.i0,this.i6);
               this.i0 = li32(this.i7);
               this.i2 = li32(this.i0 + 68);
               this.i0 = li32(this.i0 + 64);
               if(uint(this.i2) >= uint(this.i0))
               {
                  mstate.esp = mstate.esp - 4;
                  si32(this.i1,mstate.esp);
                  state = 20;
                  mstate.esp = mstate.esp - 4;
                  FSM_as3_toas3.start();
                  return;
               }
               addr1408:
               this.i0 = FSM_as3_toas3;
               this.i2 = li32(this.i6);
               mstate.esp = mstate.esp - 12;
               this.i8 = 1;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               si32(this.i8,mstate.esp + 8);
               state = 21;
               mstate.esp = mstate.esp - 4;
               FSM_as3_toas3.start();
               return;
            case 20:
               mstate.esp = mstate.esp + 4;
               §§goto(addr1408);
            case 21:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i0,this.i2);
               this.i0 = 4;
               si32(this.i0,this.i2 + 8);
               this.i0 = li32(this.i6);
               this.i2 = this.i0 + 12;
               si32(this.i2,this.i6);
               this.i2 = 1082562560;
               this.i8 = 0;
               si32(this.i8,this.i0 + 12);
               si32(this.i2,this.i0 + 16);
               this.i2 = 3;
               si32(this.i2,this.i0 + 20);
               this.i0 = li32(this.i6);
               this.i0 = this.i0 + 12;
               si32(this.i0,this.i6);
               this.i0 = li32(this.i7);
               this.i2 = li32(this.i0 + 68);
               this.i0 = li32(this.i0 + 64);
               if(uint(this.i2) >= uint(this.i0))
               {
                  mstate.esp = mstate.esp - 4;
                  si32(this.i1,mstate.esp);
                  state = 22;
                  mstate.esp = mstate.esp - 4;
                  FSM_as3_toas3.start();
                  return;
               }
               addr1604:
               this.i0 = FSM_as3_toas3;
               this.i2 = li32(this.i6);
               mstate.esp = mstate.esp - 12;
               this.i8 = 38;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               si32(this.i8,mstate.esp + 8);
               state = 23;
               mstate.esp = mstate.esp - 4;
               FSM_as3_toas3.start();
               return;
            case 22:
               mstate.esp = mstate.esp + 4;
               §§goto(addr1604);
            case 23:
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
               this.i0 = li32(this.i7);
               this.i2 = li32(this.i0 + 68);
               this.i0 = li32(this.i0 + 64);
               if(uint(this.i2) >= uint(this.i0))
               {
                  mstate.esp = mstate.esp - 4;
                  si32(this.i1,mstate.esp);
                  state = 24;
                  mstate.esp = mstate.esp - 4;
                  FSM_as3_toas3.start();
                  return;
               }
               addr1793:
               this.i0 = FSM_as3_toas3;
               this.i2 = li32(this.i6);
               mstate.esp = mstate.esp - 12;
               this.i8 = 16;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               si32(this.i8,mstate.esp + 8);
               state = 25;
               mstate.esp = mstate.esp - 4;
               FSM_as3_toas3.start();
               return;
            case 24:
               mstate.esp = mstate.esp + 4;
               §§goto(addr1793);
            case 25:
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
               this.i0 = li32(this.i7);
               this.i2 = li32(this.i0 + 68);
               this.i0 = li32(this.i0 + 64);
               if(uint(this.i2) >= uint(this.i0))
               {
                  mstate.esp = mstate.esp - 4;
                  si32(this.i1,mstate.esp);
                  state = 26;
                  mstate.esp = mstate.esp - 4;
                  FSM_as3_toas3.start();
                  return;
               }
               addr2006:
               this.i0 = FSM_as3_toas3;
               this.i2 = li32(this.i6);
               mstate.esp = mstate.esp - 12;
               this.i8 = 18;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               si32(this.i8,mstate.esp + 8);
               state = 27;
               mstate.esp = mstate.esp - 4;
               FSM_as3_toas3.start();
               return;
            case 26:
               mstate.esp = mstate.esp + 4;
               §§goto(addr2006);
            case 27:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i0,this.i2);
               this.i0 = 4;
               si32(this.i0,this.i2 + 8);
               this.i0 = li32(this.i6);
               this.i2 = this.i0 + 12;
               si32(this.i2,this.i6);
               this.f0 = Number(this.i3);
               sf64(this.f0,this.i0 + 12);
               this.i2 = 3;
               si32(this.i2,this.i0 + 20);
               this.i0 = li32(this.i6);
               this.i0 = this.i0 + 12;
               si32(this.i0,this.i6);
               this.i0 = li32(this.i7);
               this.i2 = li32(this.i0 + 68);
               this.i0 = li32(this.i0 + 64);
               if(uint(this.i2) >= uint(this.i0))
               {
                  mstate.esp = mstate.esp - 4;
                  si32(this.i1,mstate.esp);
                  state = 28;
                  mstate.esp = mstate.esp - 4;
                  FSM_as3_toas3.start();
                  return;
               }
               break;
            case 28:
               mstate.esp = mstate.esp + 4;
               break;
            case 29:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i0,this.i2);
               this.i0 = 4;
               si32(this.i0,this.i2 + 8);
               this.i0 = li32(this.i6);
               this.i0 = this.i0 + 12;
               si32(this.i0,this.i6);
               this.i0 = li32(this.i7);
               this.i2 = li32(this.i0 + 68);
               this.i0 = li32(this.i0 + 64);
               if(uint(this.i2) >= uint(this.i0))
               {
                  mstate.esp = mstate.esp - 4;
                  si32(this.i1,mstate.esp);
                  state = 30;
                  mstate.esp = mstate.esp - 4;
                  FSM_as3_toas3.start();
                  return;
               }
               addr2345:
               this.i0 = 10;
               this.i2 = li32(this.i6);
               this.i3 = li32(this.i5);
               this.i2 = this.i2 - this.i3;
               this.i2 = this.i2 / 12;
               mstate.esp = mstate.esp - 12;
               this.i2 = this.i2 + -1;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               si32(this.i2,mstate.esp + 8);
               state = 31;
               mstate.esp = mstate.esp - 4;
               FSM_as3_toas3.start();
               return;
            case 30:
               mstate.esp = mstate.esp + 4;
               §§goto(addr2345);
            case 31:
               mstate.esp = mstate.esp + 12;
               this.i0 = li32(this.i6);
               this.i0 = this.i0 + -108;
               si32(this.i0,this.i6);
               mstate.esp = mstate.esp - 8;
               this.i0 = -2;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_as3_toas3.start();
            case 32:
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
               FSM_as3_toas3.start();
            case 33:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i2 = li32(this.i6);
               this.i3 = this.i0;
               this.i8 = this.i0 + 12;
               if(uint(this.i8) >= uint(this.i2))
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
                     this.i2 = li32(this.i6);
                     this.i3 = this.i0 + 12;
                     this.i8 = this.i0;
                     if(uint(this.i3) >= uint(this.i2))
                     {
                        break;
                     }
                     this.i0 = this.i3;
                     this.i2 = this.i8;
                  }
                  this.i0 = this.i2;
               }
               this.i0 = this.i0 + -12;
               si32(this.i0,this.i6);
               this.i0 = li32(this.i7);
               this.i2 = li32(this.i0 + 68);
               this.i0 = li32(this.i0 + 64);
               if(uint(this.i2) >= uint(this.i0))
               {
                  mstate.esp = mstate.esp - 4;
                  si32(this.i1,mstate.esp);
                  state = 34;
                  mstate.esp = mstate.esp - 4;
                  FSM_as3_toas3.start();
                  return;
               }
               addr2729:
               this.i0 = 2;
               this.i2 = li32(this.i6);
               this.i3 = li32(this.i5);
               this.i2 = this.i2 - this.i3;
               this.i2 = this.i2 / 12;
               mstate.esp = mstate.esp - 12;
               this.i2 = this.i2 + -1;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               si32(this.i2,mstate.esp + 8);
               state = 35;
               mstate.esp = mstate.esp - 4;
               FSM_as3_toas3.start();
               return;
            case 34:
               mstate.esp = mstate.esp + 4;
               §§goto(addr2729);
            case 35:
               mstate.esp = mstate.esp + 12;
               this.i0 = li32(this.i6);
               this.i0 = this.i0 + -12;
               si32(this.i0,this.i6);
               mstate.esp = mstate.esp - 4;
               si32(this.i1,mstate.esp);
               state = 36;
               mstate.esp = mstate.esp - 4;
               FSM_as3_toas3.start();
               return;
            case 36:
               mstate.esp = mstate.esp + 4;
               §§goto(addr2851);
         }
         this.i0 = FSM_as3_toas3;
         this.i2 = li32(this.i6);
         mstate.esp = mstate.esp - 12;
         this.i3 = 1;
         si32(this.i1,mstate.esp);
         si32(this.i0,mstate.esp + 4);
         si32(this.i3,mstate.esp + 8);
         state = 29;
         mstate.esp = mstate.esp - 4;
         FSM_as3_toas3.start();
      }
   }
}
