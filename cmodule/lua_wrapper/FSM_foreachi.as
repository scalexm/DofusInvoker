package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.lf64;
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.sf64;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_foreachi extends Machine
   {
      
      public static const intRegCount:int = 7;
      
      public static const NumberRegCount:int = 1;
       
      
      public var i0:int;
      
      public var i1:int;
      
      public var i2:int;
      
      public var i3:int;
      
      public var i4:int;
      
      public var i5:int;
      
      public var i6:int;
      
      public var f0:Number;
      
      public function FSM_foreachi()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM_foreachi = null;
         _loc1_ = new FSM_foreachi();
         FSM_foreachi.gworker = _loc1_;
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
               mstate.esp = mstate.esp - 8;
               this.i1 = li32(mstate.ebp + 8);
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_foreachi.start();
            case 1:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i2 = FSM_foreachi;
               if(this.i0 != this.i2)
               {
                  this.i0 = li32(this.i0 + 8);
                  if(this.i0 == 5)
                  {
                     break;
                  }
               }
               this.i0 = 5;
               mstate.esp = mstate.esp - 12;
               this.i2 = 1;
               si32(this.i1,mstate.esp);
               si32(this.i2,mstate.esp + 4);
               si32(this.i0,mstate.esp + 8);
               state = 2;
               mstate.esp = mstate.esp - 4;
               FSM_foreachi.start();
               return;
            case 2:
               mstate.esp = mstate.esp + 12;
               break;
            case 3:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               mstate.esp = mstate.esp - 8;
               this.i2 = 2;
               si32(this.i1,mstate.esp);
               si32(this.i2,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_foreachi.start();
            case 4:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i3 = FSM_foreachi;
               if(this.i2 != this.i3)
               {
                  this.i2 = li32(this.i2 + 8);
                  if(this.i2 == 6)
                  {
                     addr301:
                     if(this.i0 <= 0)
                     {
                        addr308:
                        addr313:
                        this.i0 = 0;
                        mstate.eax = this.i0;
                        mstate.esp = mstate.ebp;
                        mstate.ebp = li32(mstate.esp);
                        mstate.esp = mstate.esp + 4;
                        mstate.esp = mstate.esp + 4;
                        mstate.gworker = caller;
                        return;
                     }
                     this.i2 = 1;
                     this.i3 = this.i1 + 8;
                     addr353:
                     this.i4 = 2;
                     mstate.esp = mstate.esp - 8;
                     si32(this.i1,mstate.esp);
                     si32(this.i4,mstate.esp + 4);
                     mstate.esp = mstate.esp - 4;
                     FSM_foreachi.start();
                  }
               }
               this.i2 = 6;
               mstate.esp = mstate.esp - 12;
               this.i3 = 2;
               si32(this.i1,mstate.esp);
               si32(this.i3,mstate.esp + 4);
               si32(this.i2,mstate.esp + 8);
               state = 5;
               mstate.esp = mstate.esp - 4;
               FSM_foreachi.start();
               return;
            case 5:
               mstate.esp = mstate.esp + 12;
               §§goto(addr301);
            case 6:
               this.i4 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i5 = li32(this.i3);
               this.f0 = lf64(this.i4);
               sf64(this.f0,this.i5);
               this.i4 = li32(this.i4 + 8);
               si32(this.i4,this.i5 + 8);
               this.i4 = li32(this.i3);
               this.i5 = this.i4 + 12;
               si32(this.i5,this.i3);
               this.f0 = Number(this.i2);
               sf64(this.f0,this.i4 + 12);
               this.i5 = 3;
               si32(this.i5,this.i4 + 20);
               this.i4 = li32(this.i3);
               this.i4 = this.i4 + 12;
               si32(this.i4,this.i3);
               mstate.esp = mstate.esp - 8;
               this.i4 = 1;
               si32(this.i1,mstate.esp);
               si32(this.i4,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_foreachi.start();
            case 7:
               this.i5 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i5 = li32(this.i5);
               mstate.esp = mstate.esp - 8;
               si32(this.i5,mstate.esp);
               si32(this.i2,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_foreachi.start();
            case 8:
               this.i5 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i6 = li32(this.i3);
               this.f0 = lf64(this.i5);
               sf64(this.f0,this.i6);
               this.i5 = li32(this.i5 + 8);
               si32(this.i5,this.i6 + 8);
               this.i5 = li32(this.i3);
               this.i6 = this.i5 + 12;
               si32(this.i6,this.i3);
               mstate.esp = mstate.esp - 12;
               this.i5 = this.i5 + -24;
               si32(this.i1,mstate.esp);
               si32(this.i5,mstate.esp + 4);
               si32(this.i4,mstate.esp + 8);
               state = 9;
               mstate.esp = mstate.esp - 4;
               FSM_foreachi.start();
               return;
            case 9:
               mstate.esp = mstate.esp + 12;
               mstate.esp = mstate.esp - 8;
               this.i4 = -1;
               si32(this.i1,mstate.esp);
               si32(this.i4,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_foreachi.start();
            case 10:
               this.i4 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i5 = FSM_foreachi;
               if(this.i4 != this.i5)
               {
                  this.i4 = li32(this.i4 + 8);
                  if(this.i4 == 0)
                  {
                     this.i4 = li32(this.i3);
                     this.i4 = this.i4 + -12;
                     si32(this.i4,this.i3);
                     this.i2 = this.i2 + 1;
                     if(this.i2 <= this.i0)
                     {
                        §§goto(addr353);
                     }
                     else
                     {
                        §§goto(addr308);
                     }
                  }
                  §§goto(addr313);
               }
               this.i0 = 1;
               §§goto(addr313);
         }
         this.i0 = 1;
         mstate.esp = mstate.esp - 8;
         si32(this.i1,mstate.esp);
         si32(this.i0,mstate.esp + 4);
         state = 3;
         mstate.esp = mstate.esp - 4;
         FSM_foreachi.start();
      }
   }
}
