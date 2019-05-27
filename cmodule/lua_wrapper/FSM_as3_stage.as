package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.lf64;
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.sf64;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_as3_stage extends Machine
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
      
      public function FSM_as3_stage()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM_as3_stage = null;
         _loc1_ = new FSM_as3_stage();
         FSM_as3_stage.gworker = _loc1_;
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
               this.i0 = li32(mstate.ebp + 8);
               this.i1 = li32(this.i0 + 8);
               this.i2 = li32(this.i0 + 12);
               state = 1;
               mstate.esp = mstate.esp - 4;
               mstate.funcs[FSM_as3_stage]();
               return;
            case 1:
               this.i3 = mstate.eax;
               mstate.esp = mstate.esp - 8;
               si32(this.i0,mstate.esp);
               si32(this.i3,mstate.esp + 4);
               state = 2;
               mstate.esp = mstate.esp - 4;
               FSM_as3_stage.start();
               return;
            case 2:
               mstate.esp = mstate.esp + 8;
               this.i1 = this.i1 - this.i2;
               this.i1 = this.i1 / 12;
               this.i2 = li32(this.i0 + 8);
               this.i3 = li32(this.i0 + 12);
               this.i4 = this.i1 + 1;
               this.i5 = this.i0 + 12;
               this.i6 = this.i0 + 8;
               this.i2 = this.i2 - this.i3;
               this.i2 = this.i2 / 12;
               if(this.i2 != this.i4)
               {
                  mstate.esp = mstate.esp - 8;
                  si32(this.i0,mstate.esp);
                  si32(this.i1,mstate.esp + 4);
                  state = 3;
                  mstate.esp = mstate.esp - 4;
                  FSM_as3_stage.start();
                  return;
               }
               break;
            case 3:
               mstate.esp = mstate.esp + 8;
               this.i2 = li32(this.i0 + 16);
               this.i3 = li32(this.i2 + 68);
               this.i2 = li32(this.i2 + 64);
               this.i7 = this.i0 + 16;
               if(uint(this.i3) >= uint(this.i2))
               {
                  mstate.esp = mstate.esp - 4;
                  si32(this.i0,mstate.esp);
                  state = 4;
                  mstate.esp = mstate.esp - 4;
                  FSM_as3_stage.start();
                  return;
               }
               addr274:
               this.i2 = FSM_as3_stage;
               this.i3 = li32(this.i6);
               mstate.esp = mstate.esp - 12;
               this.i8 = 19;
               si32(this.i0,mstate.esp);
               si32(this.i2,mstate.esp + 4);
               si32(this.i8,mstate.esp + 8);
               state = 5;
               mstate.esp = mstate.esp - 4;
               FSM_as3_stage.start();
               return;
            case 4:
               mstate.esp = mstate.esp + 4;
               §§goto(addr274);
            case 5:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i2,this.i3);
               this.i2 = 4;
               si32(this.i2,this.i3 + 8);
               this.i2 = li32(this.i6);
               this.i2 = this.i2 + 12;
               si32(this.i2,this.i6);
               this.i2 = li32(this.i7);
               this.i3 = li32(this.i2 + 68);
               this.i2 = li32(this.i2 + 64);
               if(uint(this.i3) >= uint(this.i2))
               {
                  mstate.esp = mstate.esp - 4;
                  si32(this.i0,mstate.esp);
                  state = 6;
                  mstate.esp = mstate.esp - 4;
                  FSM_as3_stage.start();
                  return;
               }
               addr424:
               this.i2 = FSM_as3_stage;
               this.i3 = li32(this.i6);
               mstate.esp = mstate.esp - 12;
               this.i8 = 1;
               si32(this.i0,mstate.esp);
               si32(this.i2,mstate.esp + 4);
               si32(this.i8,mstate.esp + 8);
               state = 7;
               mstate.esp = mstate.esp - 4;
               FSM_as3_stage.start();
               return;
            case 6:
               mstate.esp = mstate.esp + 4;
               §§goto(addr424);
            case 7:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i2,this.i3);
               this.i2 = 4;
               si32(this.i2,this.i3 + 8);
               this.i2 = li32(this.i6);
               this.i3 = this.i2 + 12;
               si32(this.i3,this.i6);
               this.i3 = 1078558720;
               this.i8 = 0;
               si32(this.i8,this.i2 + 12);
               si32(this.i3,this.i2 + 16);
               this.i3 = 3;
               si32(this.i3,this.i2 + 20);
               this.i2 = li32(this.i6);
               this.i2 = this.i2 + 12;
               si32(this.i2,this.i6);
               this.i2 = li32(this.i7);
               this.i3 = li32(this.i2 + 68);
               this.i2 = li32(this.i2 + 64);
               if(uint(this.i3) >= uint(this.i2))
               {
                  mstate.esp = mstate.esp - 4;
                  si32(this.i0,mstate.esp);
                  state = 8;
                  mstate.esp = mstate.esp - 4;
                  FSM_as3_stage.start();
                  return;
               }
               addr620:
               this.i2 = FSM_as3_stage;
               this.i3 = li32(this.i6);
               mstate.esp = mstate.esp - 12;
               this.i8 = 38;
               si32(this.i0,mstate.esp);
               si32(this.i2,mstate.esp + 4);
               si32(this.i8,mstate.esp + 8);
               state = 9;
               mstate.esp = mstate.esp - 4;
               FSM_as3_stage.start();
               return;
            case 8:
               mstate.esp = mstate.esp + 4;
               §§goto(addr620);
            case 9:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i2,this.i3);
               this.i2 = 4;
               si32(this.i2,this.i3 + 8);
               this.i2 = li32(this.i6);
               this.i3 = this.i2 + 12;
               si32(this.i3,this.i6);
               this.f0 = Number(this.i1);
               sf64(this.f0,this.i2 + 12);
               this.i1 = 3;
               si32(this.i1,this.i2 + 20);
               this.i1 = li32(this.i6);
               this.i1 = this.i1 + 12;
               si32(this.i1,this.i6);
               this.i1 = li32(this.i7);
               this.i2 = li32(this.i1 + 68);
               this.i1 = li32(this.i1 + 64);
               if(uint(this.i2) >= uint(this.i1))
               {
                  mstate.esp = mstate.esp - 4;
                  si32(this.i0,mstate.esp);
                  state = 10;
                  mstate.esp = mstate.esp - 4;
                  FSM_as3_stage.start();
                  return;
               }
               addr809:
               this.i1 = FSM_as3_stage;
               this.i2 = li32(this.i6);
               mstate.esp = mstate.esp - 12;
               this.i3 = 16;
               si32(this.i0,mstate.esp);
               si32(this.i1,mstate.esp + 4);
               si32(this.i3,mstate.esp + 8);
               state = 11;
               mstate.esp = mstate.esp - 4;
               FSM_as3_stage.start();
               return;
            case 10:
               mstate.esp = mstate.esp + 4;
               §§goto(addr809);
            case 11:
               this.i1 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i1,this.i2);
               this.i1 = 4;
               si32(this.i1,this.i2 + 8);
               this.i1 = li32(this.i6);
               this.i2 = this.i1 + 12;
               si32(this.i2,this.i6);
               this.i3 = li32(this.i5);
               this.i2 = this.i2 - this.i3;
               this.i2 = this.i2 / 12;
               this.i2 = this.i2 + -7;
               this.f0 = Number(this.i2);
               sf64(this.f0,this.i1 + 12);
               this.i2 = 3;
               si32(this.i2,this.i1 + 20);
               this.i1 = li32(this.i6);
               this.i1 = this.i1 + 12;
               si32(this.i1,this.i6);
               this.i1 = li32(this.i7);
               this.i2 = li32(this.i1 + 68);
               this.i1 = li32(this.i1 + 64);
               if(uint(this.i2) >= uint(this.i1))
               {
                  mstate.esp = mstate.esp - 4;
                  si32(this.i0,mstate.esp);
                  state = 12;
                  mstate.esp = mstate.esp - 4;
                  FSM_as3_stage.start();
                  return;
               }
               addr1022:
               this.i1 = FSM_as3_stage;
               this.i2 = li32(this.i6);
               mstate.esp = mstate.esp - 12;
               this.i3 = 18;
               si32(this.i0,mstate.esp);
               si32(this.i1,mstate.esp + 4);
               si32(this.i3,mstate.esp + 8);
               state = 13;
               mstate.esp = mstate.esp - 4;
               FSM_as3_stage.start();
               return;
            case 12:
               mstate.esp = mstate.esp + 4;
               §§goto(addr1022);
            case 13:
               this.i1 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i1,this.i2);
               this.i1 = 4;
               si32(this.i1,this.i2 + 8);
               this.i1 = li32(this.i6);
               this.i2 = this.i1 + 12;
               si32(this.i2,this.i6);
               this.f0 = Number(this.i4);
               sf64(this.f0,this.i1 + 12);
               this.i2 = 3;
               si32(this.i2,this.i1 + 20);
               this.i1 = li32(this.i6);
               this.i1 = this.i1 + 12;
               si32(this.i1,this.i6);
               this.i1 = li32(this.i7);
               this.i2 = li32(this.i1 + 68);
               this.i1 = li32(this.i1 + 64);
               if(uint(this.i2) >= uint(this.i1))
               {
                  mstate.esp = mstate.esp - 4;
                  si32(this.i0,mstate.esp);
                  state = 14;
                  mstate.esp = mstate.esp - 4;
                  FSM_as3_stage.start();
                  return;
               }
               addr1211:
               this.i1 = FSM_as3_stage;
               this.i2 = li32(this.i6);
               mstate.esp = mstate.esp - 12;
               this.i3 = 1;
               si32(this.i0,mstate.esp);
               si32(this.i1,mstate.esp + 4);
               si32(this.i3,mstate.esp + 8);
               state = 15;
               mstate.esp = mstate.esp - 4;
               FSM_as3_stage.start();
               return;
            case 14:
               mstate.esp = mstate.esp + 4;
               §§goto(addr1211);
            case 15:
               this.i1 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i1,this.i2);
               this.i1 = 4;
               si32(this.i1,this.i2 + 8);
               this.i1 = li32(this.i6);
               this.i1 = this.i1 + 12;
               si32(this.i1,this.i6);
               this.i1 = li32(this.i7);
               this.i2 = li32(this.i1 + 68);
               this.i1 = li32(this.i1 + 64);
               if(uint(this.i2) >= uint(this.i1))
               {
                  mstate.esp = mstate.esp - 4;
                  si32(this.i0,mstate.esp);
                  state = 16;
                  mstate.esp = mstate.esp - 4;
                  FSM_as3_stage.start();
                  return;
               }
               addr1361:
               this.i1 = 10;
               this.i2 = li32(this.i6);
               this.i3 = li32(this.i5);
               this.i2 = this.i2 - this.i3;
               this.i2 = this.i2 / 12;
               mstate.esp = mstate.esp - 12;
               this.i2 = this.i2 + -1;
               si32(this.i0,mstate.esp);
               si32(this.i1,mstate.esp + 4);
               si32(this.i2,mstate.esp + 8);
               state = 17;
               mstate.esp = mstate.esp - 4;
               FSM_as3_stage.start();
               return;
            case 16:
               mstate.esp = mstate.esp + 4;
               §§goto(addr1361);
            case 17:
               mstate.esp = mstate.esp + 12;
               this.i1 = li32(this.i6);
               this.i1 = this.i1 + -108;
               si32(this.i1,this.i6);
               mstate.esp = mstate.esp - 8;
               this.i1 = -2;
               si32(this.i0,mstate.esp);
               si32(this.i1,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_as3_stage.start();
            case 18:
               this.i1 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i2 = li32(this.i6);
               this.f0 = lf64(this.i1);
               sf64(this.f0,this.i2);
               this.i1 = li32(this.i1 + 8);
               si32(this.i1,this.i2 + 8);
               this.i1 = li32(this.i6);
               this.i1 = this.i1 + 12;
               si32(this.i1,this.i6);
               mstate.esp = mstate.esp - 8;
               this.i1 = -3;
               si32(this.i0,mstate.esp);
               si32(this.i1,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_as3_stage.start();
            case 19:
               this.i1 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i2 = li32(this.i6);
               this.i3 = this.i1;
               this.i4 = this.i1 + 12;
               if(uint(this.i4) >= uint(this.i2))
               {
                  this.i1 = this.i2;
               }
               else
               {
                  this.i1 = this.i1 + 12;
                  this.i2 = this.i3;
                  while(true)
                  {
                     this.f0 = lf64(this.i2 + 12);
                     sf64(this.f0,this.i2);
                     this.i3 = li32(this.i2 + 20);
                     si32(this.i3,this.i2 + 8);
                     this.i2 = li32(this.i6);
                     this.i3 = this.i1 + 12;
                     this.i4 = this.i1;
                     if(uint(this.i3) >= uint(this.i2))
                     {
                        break;
                     }
                     this.i1 = this.i3;
                     this.i2 = this.i4;
                  }
                  this.i1 = this.i2;
               }
               this.i1 = this.i1 + -12;
               si32(this.i1,this.i6);
               this.i1 = li32(this.i7);
               this.i2 = li32(this.i1 + 68);
               this.i1 = li32(this.i1 + 64);
               if(uint(this.i2) >= uint(this.i1))
               {
                  mstate.esp = mstate.esp - 4;
                  si32(this.i0,mstate.esp);
                  state = 20;
                  mstate.esp = mstate.esp - 4;
                  FSM_as3_stage.start();
                  return;
               }
               addr1745:
               this.i1 = 2;
               this.i2 = li32(this.i6);
               this.i3 = li32(this.i5);
               this.i2 = this.i2 - this.i3;
               this.i2 = this.i2 / 12;
               mstate.esp = mstate.esp - 12;
               this.i2 = this.i2 + -1;
               si32(this.i0,mstate.esp);
               si32(this.i1,mstate.esp + 4);
               si32(this.i2,mstate.esp + 8);
               state = 21;
               mstate.esp = mstate.esp - 4;
               FSM_as3_stage.start();
               return;
            case 20:
               mstate.esp = mstate.esp + 4;
               §§goto(addr1745);
            case 21:
               mstate.esp = mstate.esp + 12;
               this.i1 = li32(this.i6);
               this.i1 = this.i1 + -12;
               si32(this.i1,this.i6);
               mstate.esp = mstate.esp - 4;
               si32(this.i0,mstate.esp);
               state = 22;
               mstate.esp = mstate.esp - 4;
               FSM_as3_stage.start();
               return;
            case 22:
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
