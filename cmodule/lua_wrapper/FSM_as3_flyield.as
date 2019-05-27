package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.lf64;
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.sf64;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_as3_flyield extends Machine
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
      
      public function FSM_as3_flyield()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM_as3_flyield = null;
         _loc1_ = new FSM_as3_flyield();
         FSM_as3_flyield.gworker = _loc1_;
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
               this.i1 = li32(mstate.ebp + 8);
               this.i0 = li32(this.i1 + 8);
               this.i2 = li32(this.i1 + 12);
               mstate.esp = mstate.esp - 4;
               si32(this.i1,mstate.esp);
               state = 1;
               mstate.esp = mstate.esp - 4;
               FSM_as3_flyield.start();
               return;
            case 1:
               this.i3 = mstate.eax;
               this.i0 = this.i0 - this.i2;
               mstate.esp = mstate.esp + 4;
               this.i2 = this.i0 / 12;
               this.i4 = this.i1 + 12;
               this.i5 = this.i1 + 8;
               if(this.i3 == 0)
               {
                  this.i0 = 0;
                  this.i3 = li32(this.i5);
                  si32(this.i0,this.i3 + 8);
                  this.i0 = li32(this.i5);
                  this.i0 = this.i0 + 12;
                  si32(this.i0,this.i5);
                  this.i0 = li32(this.i1 + 16);
                  this.i3 = li32(this.i0 + 68);
                  this.i0 = li32(this.i0 + 64);
                  this.i6 = this.i1 + 16;
                  if(uint(this.i3) >= uint(this.i0))
                  {
                     mstate.esp = mstate.esp - 4;
                     si32(this.i1,mstate.esp);
                     state = 2;
                     mstate.esp = mstate.esp - 4;
                     FSM_as3_flyield.start();
                     return;
                  }
                  addr210:
                  this.i0 = FSM_as3_flyield;
                  this.i3 = li32(this.i5);
                  mstate.esp = mstate.esp - 12;
                  this.i7 = 24;
                  si32(this.i1,mstate.esp);
                  si32(this.i0,mstate.esp + 4);
                  si32(this.i7,mstate.esp + 8);
                  state = 3;
                  mstate.esp = mstate.esp - 4;
                  FSM_as3_flyield.start();
                  return;
               }
               this.i3 = 1;
               this.i0 = this.i3;
               state = 24;
            case 2:
               mstate.esp = mstate.esp + 4;
               §§goto(addr210);
            case 3:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i0,this.i3);
               this.i0 = 4;
               si32(this.i0,this.i3 + 8);
               this.i0 = li32(this.i5);
               this.i0 = this.i0 + 12;
               si32(this.i0,this.i5);
               this.i3 = li32(this.i4);
               this.i7 = this.i2 + 2;
               this.i0 = this.i0 - this.i3;
               this.i0 = this.i0 / 12;
               if(this.i0 == this.i7)
               {
                  this.i1 = 2;
                  addr337:
                  this.i0 = this.i1;
                  mstate.eax = this.i0;
                  break;
               }
               mstate.esp = mstate.esp - 8;
               si32(this.i1,mstate.esp);
               si32(this.i2,mstate.esp + 4);
               state = 4;
               mstate.esp = mstate.esp - 4;
               FSM_as3_flyield.start();
               return;
            case 4:
               mstate.esp = mstate.esp + 8;
               this.i0 = li32(this.i6);
               this.i3 = li32(this.i0 + 68);
               this.i0 = li32(this.i0 + 64);
               if(uint(this.i3) >= uint(this.i0))
               {
                  mstate.esp = mstate.esp - 4;
                  si32(this.i1,mstate.esp);
                  state = 5;
                  mstate.esp = mstate.esp - 4;
                  FSM_as3_flyield.start();
                  return;
               }
               addr442:
               this.i0 = FSM_as3_flyield;
               this.i3 = li32(this.i5);
               mstate.esp = mstate.esp - 12;
               this.i8 = 19;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               si32(this.i8,mstate.esp + 8);
               state = 6;
               mstate.esp = mstate.esp - 4;
               FSM_as3_flyield.start();
               return;
            case 5:
               mstate.esp = mstate.esp + 4;
               §§goto(addr442);
            case 6:
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
                  state = 7;
                  mstate.esp = mstate.esp - 4;
                  FSM_as3_flyield.start();
                  return;
               }
               addr592:
               this.i0 = FSM_as3_flyield;
               this.i3 = li32(this.i5);
               mstate.esp = mstate.esp - 12;
               this.i8 = 1;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               si32(this.i8,mstate.esp + 8);
               state = 8;
               mstate.esp = mstate.esp - 4;
               FSM_as3_flyield.start();
               return;
            case 7:
               mstate.esp = mstate.esp + 4;
               §§goto(addr592);
            case 8:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i0,this.i3);
               this.i0 = 4;
               si32(this.i0,this.i3 + 8);
               this.i0 = li32(this.i5);
               this.i3 = this.i0 + 12;
               si32(this.i3,this.i5);
               this.i3 = 1077870592;
               this.i8 = 0;
               si32(this.i8,this.i0 + 12);
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
                  state = 9;
                  mstate.esp = mstate.esp - 4;
                  FSM_as3_flyield.start();
                  return;
               }
               addr788:
               this.i0 = FSM_as3_flyield;
               this.i3 = li32(this.i5);
               mstate.esp = mstate.esp - 12;
               this.i8 = 38;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               si32(this.i8,mstate.esp + 8);
               state = 10;
               mstate.esp = mstate.esp - 4;
               FSM_as3_flyield.start();
               return;
            case 9:
               mstate.esp = mstate.esp + 4;
               §§goto(addr788);
            case 10:
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
               this.i2 = li32(this.i5);
               this.i2 = this.i2 + 12;
               si32(this.i2,this.i5);
               this.i2 = li32(this.i6);
               this.i0 = li32(this.i2 + 68);
               this.i2 = li32(this.i2 + 64);
               if(uint(this.i0) >= uint(this.i2))
               {
                  mstate.esp = mstate.esp - 4;
                  si32(this.i1,mstate.esp);
                  state = 11;
                  mstate.esp = mstate.esp - 4;
                  FSM_as3_flyield.start();
                  return;
               }
               addr977:
               this.i2 = FSM_as3_flyield;
               this.i0 = li32(this.i5);
               mstate.esp = mstate.esp - 12;
               this.i3 = 16;
               si32(this.i1,mstate.esp);
               si32(this.i2,mstate.esp + 4);
               si32(this.i3,mstate.esp + 8);
               state = 12;
               mstate.esp = mstate.esp - 4;
               FSM_as3_flyield.start();
               return;
            case 11:
               mstate.esp = mstate.esp + 4;
               §§goto(addr977);
            case 12:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i2,this.i0);
               this.i2 = 4;
               si32(this.i2,this.i0 + 8);
               this.i2 = li32(this.i5);
               this.i0 = this.i2 + 12;
               si32(this.i0,this.i5);
               this.i3 = li32(this.i4);
               this.i0 = this.i0 - this.i3;
               this.i0 = this.i0 / 12;
               this.i0 = this.i0 + -7;
               this.f0 = Number(this.i0);
               sf64(this.f0,this.i2 + 12);
               this.i0 = 3;
               si32(this.i0,this.i2 + 20);
               this.i2 = li32(this.i5);
               this.i2 = this.i2 + 12;
               si32(this.i2,this.i5);
               this.i2 = li32(this.i6);
               this.i0 = li32(this.i2 + 68);
               this.i2 = li32(this.i2 + 64);
               if(uint(this.i0) >= uint(this.i2))
               {
                  mstate.esp = mstate.esp - 4;
                  si32(this.i1,mstate.esp);
                  state = 13;
                  mstate.esp = mstate.esp - 4;
                  FSM_as3_flyield.start();
                  return;
               }
               addr1190:
               this.i2 = FSM_as3_flyield;
               this.i0 = li32(this.i5);
               mstate.esp = mstate.esp - 12;
               this.i3 = 18;
               si32(this.i1,mstate.esp);
               si32(this.i2,mstate.esp + 4);
               si32(this.i3,mstate.esp + 8);
               state = 14;
               mstate.esp = mstate.esp - 4;
               FSM_as3_flyield.start();
               return;
            case 13:
               mstate.esp = mstate.esp + 4;
               §§goto(addr1190);
            case 14:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i2,this.i0);
               this.i2 = 4;
               si32(this.i2,this.i0 + 8);
               this.i2 = li32(this.i5);
               this.i0 = this.i2 + 12;
               si32(this.i0,this.i5);
               this.f0 = Number(this.i7);
               sf64(this.f0,this.i2 + 12);
               this.i0 = 3;
               si32(this.i0,this.i2 + 20);
               this.i2 = li32(this.i5);
               this.i2 = this.i2 + 12;
               si32(this.i2,this.i5);
               this.i2 = li32(this.i6);
               this.i0 = li32(this.i2 + 68);
               this.i2 = li32(this.i2 + 64);
               if(uint(this.i0) >= uint(this.i2))
               {
                  mstate.esp = mstate.esp - 4;
                  si32(this.i1,mstate.esp);
                  state = 15;
                  mstate.esp = mstate.esp - 4;
                  FSM_as3_flyield.start();
                  return;
               }
               addr1379:
               this.i2 = FSM_as3_flyield;
               this.i0 = li32(this.i5);
               mstate.esp = mstate.esp - 12;
               this.i3 = 1;
               si32(this.i1,mstate.esp);
               si32(this.i2,mstate.esp + 4);
               si32(this.i3,mstate.esp + 8);
               state = 16;
               mstate.esp = mstate.esp - 4;
               FSM_as3_flyield.start();
               return;
            case 15:
               mstate.esp = mstate.esp + 4;
               §§goto(addr1379);
            case 16:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i2,this.i0);
               this.i2 = 4;
               si32(this.i2,this.i0 + 8);
               this.i2 = li32(this.i5);
               this.i2 = this.i2 + 12;
               si32(this.i2,this.i5);
               this.i2 = li32(this.i6);
               this.i0 = li32(this.i2 + 68);
               this.i2 = li32(this.i2 + 64);
               if(uint(this.i0) >= uint(this.i2))
               {
                  mstate.esp = mstate.esp - 4;
                  si32(this.i1,mstate.esp);
                  state = 17;
                  mstate.esp = mstate.esp - 4;
                  FSM_as3_flyield.start();
                  return;
               }
               addr1529:
               this.i2 = 10;
               this.i0 = li32(this.i5);
               this.i3 = li32(this.i4);
               this.i0 = this.i0 - this.i3;
               this.i0 = this.i0 / 12;
               mstate.esp = mstate.esp - 12;
               this.i0 = this.i0 + -1;
               si32(this.i1,mstate.esp);
               si32(this.i2,mstate.esp + 4);
               si32(this.i0,mstate.esp + 8);
               state = 18;
               mstate.esp = mstate.esp - 4;
               FSM_as3_flyield.start();
               return;
            case 17:
               mstate.esp = mstate.esp + 4;
               §§goto(addr1529);
            case 18:
               mstate.esp = mstate.esp + 12;
               this.i2 = li32(this.i5);
               this.i2 = this.i2 + -108;
               si32(this.i2,this.i5);
               mstate.esp = mstate.esp - 8;
               this.i2 = -2;
               si32(this.i1,mstate.esp);
               si32(this.i2,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_as3_flyield.start();
            case 19:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i0 = li32(this.i5);
               this.f0 = lf64(this.i2);
               sf64(this.f0,this.i0);
               this.i2 = li32(this.i2 + 8);
               si32(this.i2,this.i0 + 8);
               this.i2 = li32(this.i5);
               this.i2 = this.i2 + 12;
               si32(this.i2,this.i5);
               mstate.esp = mstate.esp - 8;
               this.i2 = -3;
               si32(this.i1,mstate.esp);
               si32(this.i2,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_as3_flyield.start();
            case 20:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i0 = li32(this.i5);
               this.i3 = this.i2;
               this.i7 = this.i2 + 12;
               if(uint(this.i7) >= uint(this.i0))
               {
                  this.i2 = this.i0;
               }
               else
               {
                  this.i2 = this.i2 + 12;
                  this.i0 = this.i3;
                  while(true)
                  {
                     this.f0 = lf64(this.i0 + 12);
                     sf64(this.f0,this.i0);
                     this.i3 = li32(this.i0 + 20);
                     si32(this.i3,this.i0 + 8);
                     this.i0 = li32(this.i5);
                     this.i3 = this.i2 + 12;
                     this.i7 = this.i2;
                     if(uint(this.i3) >= uint(this.i0))
                     {
                        break;
                     }
                     this.i2 = this.i3;
                     this.i0 = this.i7;
                  }
                  this.i2 = this.i0;
               }
               this.i2 = this.i2 + -12;
               si32(this.i2,this.i5);
               this.i2 = li32(this.i6);
               this.i0 = li32(this.i2 + 68);
               this.i2 = li32(this.i2 + 64);
               if(uint(this.i0) >= uint(this.i2))
               {
                  mstate.esp = mstate.esp - 4;
                  si32(this.i1,mstate.esp);
                  state = 21;
                  mstate.esp = mstate.esp - 4;
                  FSM_as3_flyield.start();
                  return;
               }
               addr1913:
               this.i2 = 2;
               this.i0 = li32(this.i5);
               this.i4 = li32(this.i4);
               this.i4 = this.i0 - this.i4;
               this.i4 = this.i4 / 12;
               mstate.esp = mstate.esp - 12;
               this.i4 = this.i4 + -1;
               si32(this.i1,mstate.esp);
               si32(this.i2,mstate.esp + 4);
               si32(this.i4,mstate.esp + 8);
               state = 22;
               mstate.esp = mstate.esp - 4;
               FSM_as3_flyield.start();
               return;
            case 21:
               mstate.esp = mstate.esp + 4;
               §§goto(addr1913);
            case 22:
               mstate.esp = mstate.esp + 12;
               this.i4 = li32(this.i5);
               this.i4 = this.i4 + -12;
               si32(this.i4,this.i5);
               mstate.esp = mstate.esp - 4;
               si32(this.i1,mstate.esp);
               state = 23;
               mstate.esp = mstate.esp - 4;
               FSM_as3_flyield.start();
               return;
            case 23:
               mstate.esp = mstate.esp + 4;
               mstate.eax = this.i2;
               break;
            case 24:
               if(this.i0)
               {
                  this.i0 = 0;
                  throw new AlchemyYield();
               }
               this.i0 = li32(this.i5);
               si32(this.i3,this.i0);
               si32(this.i3,this.i0 + 8);
               this.i0 = li32(this.i5);
               this.i0 = this.i0 + 12;
               si32(this.i0,this.i5);
               this.i3 = li32(this.i4);
               this.i6 = this.i2 + 1;
               this.i0 = this.i0 - this.i3;
               this.i0 = this.i0 / 12;
               if(this.i0 == this.i6)
               {
                  this.i1 = 1;
                  §§goto(addr337);
               }
               else
               {
                  mstate.esp = mstate.esp - 8;
                  si32(this.i1,mstate.esp);
                  si32(this.i2,mstate.esp + 4);
                  state = 25;
                  mstate.esp = mstate.esp - 4;
                  FSM_as3_flyield.start();
                  return;
               }
            case 25:
               mstate.esp = mstate.esp + 8;
               this.i0 = li32(this.i1 + 16);
               this.i3 = li32(this.i0 + 68);
               this.i0 = li32(this.i0 + 64);
               this.i7 = this.i1 + 16;
               if(uint(this.i3) >= uint(this.i0))
               {
                  mstate.esp = mstate.esp - 4;
                  si32(this.i1,mstate.esp);
                  state = 26;
                  mstate.esp = mstate.esp - 4;
                  FSM_as3_flyield.start();
                  return;
               }
               addr2231:
               this.i0 = FSM_as3_flyield;
               this.i3 = li32(this.i5);
               mstate.esp = mstate.esp - 12;
               this.i8 = 19;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               si32(this.i8,mstate.esp + 8);
               state = 27;
               mstate.esp = mstate.esp - 4;
               FSM_as3_flyield.start();
               return;
            case 26:
               mstate.esp = mstate.esp + 4;
               §§goto(addr2231);
            case 27:
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
                  state = 28;
                  mstate.esp = mstate.esp - 4;
                  FSM_as3_flyield.start();
                  return;
               }
               addr2381:
               this.i0 = FSM_as3_flyield;
               this.i3 = li32(this.i5);
               mstate.esp = mstate.esp - 12;
               this.i8 = 1;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               si32(this.i8,mstate.esp + 8);
               state = 29;
               mstate.esp = mstate.esp - 4;
               FSM_as3_flyield.start();
               return;
            case 28:
               mstate.esp = mstate.esp + 4;
               §§goto(addr2381);
            case 29:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i0,this.i3);
               this.i0 = 4;
               si32(this.i0,this.i3 + 8);
               this.i0 = li32(this.i5);
               this.i3 = this.i0 + 12;
               si32(this.i3,this.i5);
               this.i3 = 1078099968;
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
                  state = 30;
                  mstate.esp = mstate.esp - 4;
                  FSM_as3_flyield.start();
                  return;
               }
               addr2577:
               this.i0 = FSM_as3_flyield;
               this.i3 = li32(this.i5);
               mstate.esp = mstate.esp - 12;
               this.i8 = 38;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               si32(this.i8,mstate.esp + 8);
               state = 31;
               mstate.esp = mstate.esp - 4;
               FSM_as3_flyield.start();
               return;
            case 30:
               mstate.esp = mstate.esp + 4;
               §§goto(addr2577);
            case 31:
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
                  state = 32;
                  mstate.esp = mstate.esp - 4;
                  FSM_as3_flyield.start();
                  return;
               }
               addr2766:
               this.i0 = FSM_as3_flyield;
               this.i2 = li32(this.i5);
               mstate.esp = mstate.esp - 12;
               this.i3 = 16;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               si32(this.i3,mstate.esp + 8);
               state = 33;
               mstate.esp = mstate.esp - 4;
               FSM_as3_flyield.start();
               return;
            case 32:
               mstate.esp = mstate.esp + 4;
               §§goto(addr2766);
            case 33:
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
                  state = 34;
                  mstate.esp = mstate.esp - 4;
                  FSM_as3_flyield.start();
                  return;
               }
               addr2979:
               this.i0 = FSM_as3_flyield;
               this.i2 = li32(this.i5);
               mstate.esp = mstate.esp - 12;
               this.i3 = 18;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               si32(this.i3,mstate.esp + 8);
               state = 35;
               mstate.esp = mstate.esp - 4;
               FSM_as3_flyield.start();
               return;
            case 34:
               mstate.esp = mstate.esp + 4;
               §§goto(addr2979);
            case 35:
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
                  state = 36;
                  mstate.esp = mstate.esp - 4;
                  FSM_as3_flyield.start();
                  return;
               }
               addr3168:
               this.i0 = FSM_as3_flyield;
               this.i2 = li32(this.i5);
               mstate.esp = mstate.esp - 12;
               this.i3 = 1;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               si32(this.i3,mstate.esp + 8);
               state = 37;
               mstate.esp = mstate.esp - 4;
               FSM_as3_flyield.start();
               return;
            case 36:
               mstate.esp = mstate.esp + 4;
               §§goto(addr3168);
            case 37:
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
                  state = 38;
                  mstate.esp = mstate.esp - 4;
                  FSM_as3_flyield.start();
                  return;
               }
               addr3318:
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
               state = 39;
               mstate.esp = mstate.esp - 4;
               FSM_as3_flyield.start();
               return;
            case 38:
               mstate.esp = mstate.esp + 4;
               §§goto(addr3318);
            case 39:
               mstate.esp = mstate.esp + 12;
               this.i0 = li32(this.i5);
               this.i0 = this.i0 + -108;
               si32(this.i0,this.i5);
               mstate.esp = mstate.esp - 8;
               this.i0 = -2;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_as3_flyield.start();
            case 40:
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
               FSM_as3_flyield.start();
            case 41:
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
                  state = 42;
                  mstate.esp = mstate.esp - 4;
                  FSM_as3_flyield.start();
                  return;
               }
               addr3702:
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
               state = 43;
               mstate.esp = mstate.esp - 4;
               FSM_as3_flyield.start();
               return;
            case 42:
               mstate.esp = mstate.esp + 4;
               §§goto(addr3702);
            case 43:
               mstate.esp = mstate.esp + 12;
               this.i0 = li32(this.i5);
               this.i0 = this.i0 + -12;
               si32(this.i0,this.i5);
               mstate.esp = mstate.esp - 4;
               si32(this.i1,mstate.esp);
               state = 44;
               mstate.esp = mstate.esp - 4;
               FSM_as3_flyield.start();
               return;
            case 44:
               mstate.esp = mstate.esp + 4;
               this.i1 = 1;
               mstate.eax = this.i1;
         }
         mstate.esp = mstate.ebp;
         mstate.ebp = li32(mstate.esp);
         mstate.esp = mstate.esp + 4;
         mstate.esp = mstate.esp + 4;
         mstate.gworker = caller;
      }
   }
}
