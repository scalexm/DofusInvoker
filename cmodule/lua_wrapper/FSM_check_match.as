package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.lf64;
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.sf64;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_check_match extends Machine
   {
      
      public static const intRegCount:int = 8;
      
      public static const NumberRegCount:int = 1;
       
      
      public var i0:int;
      
      public var i1:int;
      
      public var i2:int;
      
      public var i3:int;
      
      public var i4:int;
      
      public var i5:int;
      
      public var i6:int;
      
      public var f0:Number;
      
      public var i7:int;
      
      public function FSM_check_match()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM_check_match = null;
         _loc1_ = new FSM_check_match();
         FSM_check_match.gworker = _loc1_;
      }
      
      override public final function work() : void
      {
         switch(state)
         {
            case 0:
               mstate.esp = mstate.esp - 4;
               si32(mstate.ebp,mstate.esp);
               mstate.ebp = mstate.esp;
               mstate.esp = mstate.esp - 80;
               this.i0 = li32(mstate.ebp + 8);
               this.i1 = li32(this.i0 + 12);
               this.i2 = li32(this.i0 + 4);
               this.i3 = this.i0 + 4;
               this.i4 = this.i0 + 12;
               this.i5 = li32(mstate.ebp + 12);
               this.i6 = li32(mstate.ebp + 16);
               this.i7 = li32(mstate.ebp + 20);
               if(this.i1 == this.i5)
               {
                  si32(this.i2,this.i0 + 8);
                  this.i2 = li32(this.i0 + 24);
                  this.i3 = this.i0 + 24;
                  if(this.i2 != 287)
                  {
                     this.i5 = 287;
                     si32(this.i2,this.i4);
                     this.f0 = lf64(this.i0 + 28);
                     sf64(this.f0,this.i0 + 16);
                     si32(this.i5,this.i3);
                     break;
                  }
                  mstate.esp = mstate.esp - 8;
                  this.i2 = this.i0 + 16;
                  si32(this.i0,mstate.esp);
                  si32(this.i2,mstate.esp + 4);
                  state = 1;
                  mstate.esp = mstate.esp - 4;
                  FSM_check_match.start();
                  return;
               }
               if(this.i2 == this.i7)
               {
                  mstate.esp = mstate.esp - 8;
                  si32(this.i0,mstate.esp);
                  si32(this.i5,mstate.esp + 4);
                  state = 2;
                  mstate.esp = mstate.esp - 4;
                  FSM_check_match.start();
                  return;
               }
               this.i1 = FSM_check_match;
               mstate.esp = mstate.esp - 8;
               si32(this.i0,mstate.esp);
               si32(this.i6,mstate.esp + 4);
               state = 3;
               mstate.esp = mstate.esp - 4;
               FSM_check_match.start();
               return;
            case 1:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               si32(this.i0,this.i4);
               break;
            case 2:
            case 3:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               mstate.esp = mstate.esp - 8;
               si32(this.i0,mstate.esp);
               si32(this.i5,mstate.esp + 4);
               state = 4;
               mstate.esp = mstate.esp - 4;
               FSM_check_match.start();
               return;
            case 4:
               this.i5 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i6 = li32(this.i0 + 40);
               mstate.esp = mstate.esp - 20;
               si32(this.i6,mstate.esp);
               si32(this.i1,mstate.esp + 4);
               si32(this.i5,mstate.esp + 8);
               si32(this.i2,mstate.esp + 12);
               si32(this.i7,mstate.esp + 16);
               state = 5;
               mstate.esp = mstate.esp - 4;
               FSM_check_match.start();
               return;
            case 5:
               this.i1 = mstate.eax;
               mstate.esp = mstate.esp + 20;
               this.i2 = li32(this.i0 + 52);
               this.i4 = li32(this.i4);
               mstate.esp = mstate.esp - 12;
               this.i5 = 80;
               this.i6 = mstate.ebp + -80;
               this.i2 = this.i2 + 16;
               si32(this.i6,mstate.esp);
               si32(this.i2,mstate.esp + 4);
               si32(this.i5,mstate.esp + 8);
               mstate.esp = mstate.esp - 4;
               FSM_check_match.start();
            case 6:
               mstate.esp = mstate.esp + 12;
               this.i2 = li32(this.i3);
               this.i3 = li32(this.i0 + 40);
               mstate.esp = mstate.esp - 20;
               this.i5 = FSM_check_match;
               si32(this.i3,mstate.esp);
               si32(this.i5,mstate.esp + 4);
               si32(this.i6,mstate.esp + 8);
               si32(this.i2,mstate.esp + 12);
               si32(this.i1,mstate.esp + 16);
               state = 7;
               mstate.esp = mstate.esp - 4;
               FSM_check_match.start();
               return;
            case 7:
               this.i1 = mstate.eax;
               mstate.esp = mstate.esp + 20;
               this.i2 = this.i0 + 40;
               if(this.i4 != 0)
               {
                  this.i3 = this.i4 + -284;
                  if(uint(this.i3) <= uint(2))
                  {
                     this.i4 = 0;
                     mstate.esp = mstate.esp - 8;
                     si32(this.i0,mstate.esp);
                     si32(this.i4,mstate.esp + 4);
                     state = 8;
                     mstate.esp = mstate.esp - 4;
                     FSM_check_match.start();
                     return;
                  }
                  this.i3 = FSM_check_match;
                  mstate.esp = mstate.esp - 8;
                  si32(this.i0,mstate.esp);
                  si32(this.i4,mstate.esp + 4);
                  state = 10;
                  mstate.esp = mstate.esp - 4;
                  FSM_check_match.start();
                  return;
               }
               this.i0 = 3;
               this.i1 = li32(this.i2);
               mstate.esp = mstate.esp - 8;
               si32(this.i1,mstate.esp);
               addr845:
               si32(this.i0,mstate.esp + 4);
               addr852:
               state = 12;
               mstate.esp = mstate.esp - 4;
               FSM_check_match.start();
               return;
            case 8:
               mstate.esp = mstate.esp + 8;
               this.i0 = li32(this.i0 + 48);
               this.i0 = li32(this.i0);
               this.i4 = li32(this.i2);
               mstate.esp = mstate.esp - 16;
               this.i3 = FSM_check_match;
               si32(this.i4,mstate.esp);
               si32(this.i3,mstate.esp + 4);
               si32(this.i1,mstate.esp + 8);
               si32(this.i0,mstate.esp + 12);
               state = 9;
               mstate.esp = mstate.esp - 4;
               FSM_check_match.start();
               return;
            case 9:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 16;
               this.i0 = li32(this.i2);
               mstate.esp = mstate.esp - 8;
               this.i1 = 3;
               si32(this.i0,mstate.esp);
               si32(this.i1,mstate.esp + 4);
               §§goto(addr852);
            case 10:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i4 = li32(this.i2);
               mstate.esp = mstate.esp - 16;
               si32(this.i4,mstate.esp);
               si32(this.i3,mstate.esp + 4);
               si32(this.i1,mstate.esp + 8);
               si32(this.i0,mstate.esp + 12);
               state = 11;
               mstate.esp = mstate.esp - 4;
               FSM_check_match.start();
               return;
            case 11:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 16;
               this.i2 = li32(this.i2);
               mstate.esp = mstate.esp - 8;
               this.i0 = 3;
               si32(this.i2,mstate.esp);
               §§goto(addr845);
            case 12:
               mstate.esp = mstate.esp + 8;
         }
         mstate.esp = mstate.ebp;
         mstate.ebp = li32(mstate.esp);
         mstate.esp = mstate.esp + 4;
         mstate.esp = mstate.esp + 4;
         mstate.gworker = caller;
      }
   }
}
