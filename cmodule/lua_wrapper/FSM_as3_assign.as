package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.lf64;
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.sf64;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_as3_assign extends Machine
   {
      
      public static const intRegCount:int = 8;
      
      public static const NumberRegCount:int = 2;
       
      
      public var f1:Number;
      
      public var i0:int;
      
      public var i1:int;
      
      public var i2:int;
      
      public var i3:int;
      
      public var i4:int;
      
      public var i5:int;
      
      public var i6:int;
      
      public var f0:Number;
      
      public var i7:int;
      
      public function FSM_as3_assign()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM_as3_assign = null;
         _loc1_ = new FSM_as3_assign();
         FSM_as3_assign.gworker = _loc1_;
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
               this.i0 = FSM_as3_assign;
               this.i1 = li32(mstate.ebp + 8);
               this.i2 = li32(this.i1 + 8);
               this.i3 = li32(this.i1 + 12);
               mstate.esp = mstate.esp - 8;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               state = 1;
               mstate.esp = mstate.esp - 4;
               FSM_as3_assign.start();
               return;
            case 1:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               mstate.esp = mstate.esp - 8;
               this.i0 = 2;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_as3_assign.start();
            case 2:
               this.i0 = mstate.eax;
               this.i2 = this.i2 - this.i3;
               mstate.esp = mstate.esp + 8;
               this.i2 = this.i2 / 12;
               this.i3 = this.i1 + 12;
               this.i4 = this.i1 + 8;
               this.i5 = FSM_as3_assign;
               if(this.i0 == this.i5)
               {
                  this.i0 = -1;
               }
               else
               {
                  this.i0 = li32(this.i0 + 8);
               }
               this.i5 = 2;
               mstate.esp = mstate.esp - 12;
               si32(this.i1,mstate.esp);
               si32(this.i5,mstate.esp + 4);
               si32(this.i0,mstate.esp + 8);
               state = 3;
               mstate.esp = mstate.esp - 4;
               FSM_as3_assign.start();
               return;
            case 3:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               state = 4;
               mstate.esp = mstate.esp - 4;
               mstate.funcs[FSM_as3_assign]();
               return;
            case 4:
               this.i5 = mstate.eax;
               if(this.i5 == this.i0)
               {
                  this.i0 = FSM_as3_assign;
                  mstate.esp = mstate.esp - 12;
                  this.i5 = 2;
                  si32(this.i1,mstate.esp);
                  si32(this.i5,mstate.esp + 4);
                  si32(this.i0,mstate.esp + 8);
                  state = 5;
                  mstate.esp = mstate.esp - 4;
                  FSM_as3_assign.start();
                  return;
               }
               addr310:
               this.i0 = li32(this.i4);
               this.i5 = li32(this.i3);
               this.i0 = this.i0 - this.i5;
               this.i0 = this.i0 / 12;
               if(this.i0 != this.i2)
               {
                  mstate.esp = mstate.esp - 8;
                  si32(this.i1,mstate.esp);
                  si32(this.i2,mstate.esp + 4);
                  state = 6;
                  mstate.esp = mstate.esp - 4;
                  FSM_as3_assign.start();
                  return;
               }
               break;
            case 5:
               mstate.esp = mstate.esp + 12;
               §§goto(addr310);
            case 6:
               mstate.esp = mstate.esp + 8;
               this.i0 = li32(this.i1 + 16);
               this.i5 = li32(this.i0 + 68);
               this.i0 = li32(this.i0 + 64);
               this.i6 = this.i1 + 16;
               if(uint(this.i5) >= uint(this.i0))
               {
                  mstate.esp = mstate.esp - 4;
                  si32(this.i1,mstate.esp);
                  state = 7;
                  mstate.esp = mstate.esp - 4;
                  FSM_as3_assign.start();
                  return;
               }
               addr443:
               this.i0 = FSM_as3_assign;
               this.i5 = li32(this.i4);
               mstate.esp = mstate.esp - 12;
               this.i7 = 19;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               si32(this.i7,mstate.esp + 8);
               state = 8;
               mstate.esp = mstate.esp - 4;
               FSM_as3_assign.start();
               return;
            case 7:
               mstate.esp = mstate.esp + 4;
               §§goto(addr443);
            case 8:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i0,this.i5);
               this.i0 = 4;
               si32(this.i0,this.i5 + 8);
               this.i0 = li32(this.i4);
               this.i0 = this.i0 + 12;
               si32(this.i0,this.i4);
               this.i0 = li32(this.i6);
               this.i5 = li32(this.i0 + 68);
               this.i0 = li32(this.i0 + 64);
               if(uint(this.i5) >= uint(this.i0))
               {
                  mstate.esp = mstate.esp - 4;
                  si32(this.i1,mstate.esp);
                  state = 9;
                  mstate.esp = mstate.esp - 4;
                  FSM_as3_assign.start();
                  return;
               }
               addr593:
               this.i0 = FSM_as3_assign;
               this.i5 = li32(this.i4);
               mstate.esp = mstate.esp - 12;
               this.i7 = 1;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               si32(this.i7,mstate.esp + 8);
               state = 10;
               mstate.esp = mstate.esp - 4;
               FSM_as3_assign.start();
               return;
            case 9:
               mstate.esp = mstate.esp + 4;
               §§goto(addr593);
            case 10:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i0,this.i5);
               this.i0 = 4;
               si32(this.i0,this.i5 + 8);
               this.i0 = li32(this.i4);
               this.i5 = this.i0 + 12;
               si32(this.i5,this.i4);
               this.i5 = 1081659392;
               this.i7 = 0;
               si32(this.i7,this.i0 + 12);
               si32(this.i5,this.i0 + 16);
               this.i5 = 3;
               si32(this.i5,this.i0 + 20);
               this.i0 = li32(this.i4);
               this.i0 = this.i0 + 12;
               si32(this.i0,this.i4);
               this.i0 = li32(this.i6);
               this.i5 = li32(this.i0 + 68);
               this.i0 = li32(this.i0 + 64);
               if(uint(this.i5) >= uint(this.i0))
               {
                  mstate.esp = mstate.esp - 4;
                  si32(this.i1,mstate.esp);
                  state = 11;
                  mstate.esp = mstate.esp - 4;
                  FSM_as3_assign.start();
                  return;
               }
               addr789:
               this.i0 = FSM_as3_assign;
               this.i5 = li32(this.i4);
               mstate.esp = mstate.esp - 12;
               this.i7 = 38;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               si32(this.i7,mstate.esp + 8);
               state = 12;
               mstate.esp = mstate.esp - 4;
               FSM_as3_assign.start();
               return;
            case 11:
               mstate.esp = mstate.esp + 4;
               §§goto(addr789);
            case 12:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i0,this.i5);
               this.i0 = 4;
               si32(this.i0,this.i5 + 8);
               this.i0 = li32(this.i4);
               this.i5 = this.i0 + 12;
               si32(this.i5,this.i4);
               this.f0 = Number(this.i2);
               sf64(this.f0,this.i0 + 12);
               this.i2 = 3;
               si32(this.i2,this.i0 + 20);
               this.i0 = li32(this.i4);
               this.i0 = this.i0 + 12;
               si32(this.i0,this.i4);
               this.i0 = li32(this.i6);
               this.i2 = li32(this.i0 + 68);
               this.i0 = li32(this.i0 + 64);
               if(uint(this.i2) >= uint(this.i0))
               {
                  mstate.esp = mstate.esp - 4;
                  si32(this.i1,mstate.esp);
                  state = 13;
                  mstate.esp = mstate.esp - 4;
                  FSM_as3_assign.start();
                  return;
               }
               addr978:
               this.i0 = FSM_as3_assign;
               this.i2 = li32(this.i4);
               mstate.esp = mstate.esp - 12;
               this.i5 = 16;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               si32(this.i5,mstate.esp + 8);
               state = 14;
               mstate.esp = mstate.esp - 4;
               FSM_as3_assign.start();
               return;
            case 13:
               mstate.esp = mstate.esp + 4;
               §§goto(addr978);
            case 14:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i0,this.i2);
               this.i0 = 4;
               si32(this.i0,this.i2 + 8);
               this.i0 = li32(this.i4);
               this.i2 = this.i0 + 12;
               si32(this.i2,this.i4);
               this.i5 = li32(this.i3);
               this.i2 = this.i2 - this.i5;
               this.i2 = this.i2 / 12;
               this.i2 = this.i2 + -7;
               this.f1 = Number(this.i2);
               sf64(this.f1,this.i0 + 12);
               this.i2 = 3;
               si32(this.i2,this.i0 + 20);
               this.i0 = li32(this.i4);
               this.i0 = this.i0 + 12;
               si32(this.i0,this.i4);
               this.i0 = li32(this.i6);
               this.i2 = li32(this.i0 + 68);
               this.i0 = li32(this.i0 + 64);
               if(uint(this.i2) >= uint(this.i0))
               {
                  mstate.esp = mstate.esp - 4;
                  si32(this.i1,mstate.esp);
                  state = 15;
                  mstate.esp = mstate.esp - 4;
                  FSM_as3_assign.start();
                  return;
               }
               addr1191:
               this.i0 = FSM_as3_assign;
               this.i2 = li32(this.i4);
               mstate.esp = mstate.esp - 12;
               this.i5 = 18;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               si32(this.i5,mstate.esp + 8);
               state = 16;
               mstate.esp = mstate.esp - 4;
               FSM_as3_assign.start();
               return;
            case 15:
               mstate.esp = mstate.esp + 4;
               §§goto(addr1191);
            case 16:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i0,this.i2);
               this.i0 = 4;
               si32(this.i0,this.i2 + 8);
               this.i0 = li32(this.i4);
               this.i2 = this.i0 + 12;
               si32(this.i2,this.i4);
               sf64(this.f0,this.i0 + 12);
               this.i2 = 3;
               si32(this.i2,this.i0 + 20);
               this.i0 = li32(this.i4);
               this.i0 = this.i0 + 12;
               si32(this.i0,this.i4);
               this.i0 = li32(this.i6);
               this.i2 = li32(this.i0 + 68);
               this.i0 = li32(this.i0 + 64);
               if(uint(this.i2) >= uint(this.i0))
               {
                  mstate.esp = mstate.esp - 4;
                  si32(this.i1,mstate.esp);
                  state = 17;
                  mstate.esp = mstate.esp - 4;
                  FSM_as3_assign.start();
                  return;
               }
               addr1374:
               this.i0 = FSM_as3_assign;
               this.i2 = li32(this.i4);
               mstate.esp = mstate.esp - 12;
               this.i5 = 1;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               si32(this.i5,mstate.esp + 8);
               state = 18;
               mstate.esp = mstate.esp - 4;
               FSM_as3_assign.start();
               return;
            case 17:
               mstate.esp = mstate.esp + 4;
               §§goto(addr1374);
            case 18:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i0,this.i2);
               this.i0 = 4;
               si32(this.i0,this.i2 + 8);
               this.i0 = li32(this.i4);
               this.i0 = this.i0 + 12;
               si32(this.i0,this.i4);
               this.i0 = li32(this.i6);
               this.i2 = li32(this.i0 + 68);
               this.i0 = li32(this.i0 + 64);
               if(uint(this.i2) >= uint(this.i0))
               {
                  mstate.esp = mstate.esp - 4;
                  si32(this.i1,mstate.esp);
                  state = 19;
                  mstate.esp = mstate.esp - 4;
                  FSM_as3_assign.start();
                  return;
               }
               addr1524:
               this.i0 = 10;
               this.i2 = li32(this.i4);
               this.i5 = li32(this.i3);
               this.i2 = this.i2 - this.i5;
               this.i2 = this.i2 / 12;
               mstate.esp = mstate.esp - 12;
               this.i2 = this.i2 + -1;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               si32(this.i2,mstate.esp + 8);
               state = 20;
               mstate.esp = mstate.esp - 4;
               FSM_as3_assign.start();
               return;
            case 19:
               mstate.esp = mstate.esp + 4;
               §§goto(addr1524);
            case 20:
               mstate.esp = mstate.esp + 12;
               this.i0 = li32(this.i4);
               this.i0 = this.i0 + -108;
               si32(this.i0,this.i4);
               mstate.esp = mstate.esp - 8;
               this.i0 = -2;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_as3_assign.start();
            case 21:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i2 = li32(this.i4);
               this.f0 = lf64(this.i0);
               sf64(this.f0,this.i2);
               this.i0 = li32(this.i0 + 8);
               si32(this.i0,this.i2 + 8);
               this.i0 = li32(this.i4);
               this.i0 = this.i0 + 12;
               si32(this.i0,this.i4);
               mstate.esp = mstate.esp - 8;
               this.i0 = -3;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_as3_assign.start();
            case 22:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i2 = li32(this.i4);
               this.i5 = this.i0;
               this.i7 = this.i0 + 12;
               if(uint(this.i7) >= uint(this.i2))
               {
                  this.i0 = this.i2;
               }
               else
               {
                  this.i0 = this.i0 + 12;
                  this.i2 = this.i5;
                  while(true)
                  {
                     this.f0 = lf64(this.i2 + 12);
                     sf64(this.f0,this.i2);
                     this.i5 = li32(this.i2 + 20);
                     si32(this.i5,this.i2 + 8);
                     this.i2 = li32(this.i4);
                     this.i5 = this.i0 + 12;
                     this.i7 = this.i0;
                     if(uint(this.i5) >= uint(this.i2))
                     {
                        break;
                     }
                     this.i0 = this.i5;
                     this.i2 = this.i7;
                  }
                  this.i0 = this.i2;
               }
               this.i0 = this.i0 + -12;
               si32(this.i0,this.i4);
               this.i0 = li32(this.i6);
               this.i2 = li32(this.i0 + 68);
               this.i0 = li32(this.i0 + 64);
               if(uint(this.i2) >= uint(this.i0))
               {
                  mstate.esp = mstate.esp - 4;
                  si32(this.i1,mstate.esp);
                  state = 23;
                  mstate.esp = mstate.esp - 4;
                  FSM_as3_assign.start();
                  return;
               }
               addr1908:
               this.i0 = 2;
               this.i2 = li32(this.i4);
               this.i3 = li32(this.i3);
               this.i2 = this.i2 - this.i3;
               this.i2 = this.i2 / 12;
               mstate.esp = mstate.esp - 12;
               this.i2 = this.i2 + -1;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               si32(this.i2,mstate.esp + 8);
               state = 24;
               mstate.esp = mstate.esp - 4;
               FSM_as3_assign.start();
               return;
            case 23:
               mstate.esp = mstate.esp + 4;
               §§goto(addr1908);
            case 24:
               mstate.esp = mstate.esp + 12;
               this.i0 = li32(this.i4);
               this.i0 = this.i0 + -12;
               si32(this.i0,this.i4);
               mstate.esp = mstate.esp - 4;
               si32(this.i1,mstate.esp);
               state = 25;
               mstate.esp = mstate.esp - 4;
               FSM_as3_assign.start();
               return;
            case 25:
               mstate.esp = mstate.esp + 4;
         }
         this.i0 = 0;
         mstate.eax = this.i0;
         mstate.esp = mstate.ebp;
         mstate.ebp = li32(mstate.esp);
         mstate.esp = mstate.esp + 4;
         mstate.esp = mstate.esp + 4;
         mstate.gworker = caller;
      }
   }
}
