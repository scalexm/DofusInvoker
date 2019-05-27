package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.lf64;
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.sf64;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_foreach extends Machine
   {
      
      public static const intRegCount:int = 5;
      
      public static const NumberRegCount:int = 1;
       
      
      public var i0:int;
      
      public var i1:int;
      
      public var i2:int;
      
      public var f0:Number;
      
      public var i4:int;
      
      public var i3:int;
      
      public function FSM_foreach()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM_foreach = null;
         _loc1_ = new FSM_foreach();
         FSM_foreach.gworker = _loc1_;
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
               FSM_foreach.start();
            case 1:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i2 = FSM_foreach;
               if(this.i0 != this.i2)
               {
                  this.i0 = li32(this.i0 + 8);
                  if(this.i0 == 5)
                  {
                     addr145:
                     this.i0 = 2;
                     mstate.esp = mstate.esp - 8;
                     si32(this.i1,mstate.esp);
                     si32(this.i0,mstate.esp + 4);
                     mstate.esp = mstate.esp - 4;
                     FSM_foreach.start();
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
               FSM_foreach.start();
               return;
            case 2:
               mstate.esp = mstate.esp + 12;
               §§goto(addr145);
            case 3:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i2 = FSM_foreach;
               if(this.i0 != this.i2)
               {
                  this.i0 = li32(this.i0 + 8);
                  if(this.i0 == 6)
                  {
                     break;
                  }
               }
               this.i0 = 6;
               mstate.esp = mstate.esp - 12;
               this.i2 = 2;
               si32(this.i1,mstate.esp);
               si32(this.i2,mstate.esp + 4);
               si32(this.i0,mstate.esp + 8);
               state = 4;
               mstate.esp = mstate.esp - 4;
               FSM_foreach.start();
               return;
            case 4:
               mstate.esp = mstate.esp + 12;
               break;
            case 5:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 4;
               this.i2 = this.i1 + 8;
               if(this.i0 == 0)
               {
                  addr342:
                  this.i1 = 0;
                  addr347:
                  this.i0 = this.i1;
                  mstate.eax = this.i0;
                  mstate.esp = mstate.ebp;
                  mstate.ebp = li32(mstate.esp);
                  mstate.esp = mstate.esp + 4;
                  mstate.esp = mstate.esp + 4;
                  mstate.gworker = caller;
                  return;
               }
               addr381:
               this.i0 = 2;
               mstate.esp = mstate.esp - 8;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_foreach.start();
            case 6:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i3 = li32(this.i2);
               this.f0 = lf64(this.i0);
               sf64(this.f0,this.i3);
               this.i0 = li32(this.i0 + 8);
               si32(this.i0,this.i3 + 8);
               this.i0 = li32(this.i2);
               this.i0 = this.i0 + 12;
               si32(this.i0,this.i2);
               mstate.esp = mstate.esp - 8;
               this.i0 = -3;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_foreach.start();
            case 7:
               this.i3 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i4 = li32(this.i2);
               this.f0 = lf64(this.i3);
               sf64(this.f0,this.i4);
               this.i3 = li32(this.i3 + 8);
               si32(this.i3,this.i4 + 8);
               this.i3 = li32(this.i2);
               this.i3 = this.i3 + 12;
               si32(this.i3,this.i2);
               mstate.esp = mstate.esp - 8;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_foreach.start();
            case 8:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i3 = li32(this.i2);
               this.f0 = lf64(this.i0);
               sf64(this.f0,this.i3);
               this.i0 = li32(this.i0 + 8);
               si32(this.i0,this.i3 + 8);
               this.i0 = li32(this.i2);
               this.i3 = this.i0 + 12;
               si32(this.i3,this.i2);
               mstate.esp = mstate.esp - 12;
               this.i3 = 1;
               this.i0 = this.i0 + -24;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               si32(this.i3,mstate.esp + 8);
               state = 9;
               mstate.esp = mstate.esp - 4;
               FSM_foreach.start();
               return;
            case 9:
               mstate.esp = mstate.esp + 12;
               mstate.esp = mstate.esp - 8;
               this.i0 = -1;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_foreach.start();
            case 10:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i3 = FSM_foreach;
               if(this.i0 != this.i3)
               {
                  this.i0 = li32(this.i0 + 8);
                  if(this.i0 == 0)
                  {
                     this.i0 = li32(this.i2);
                     this.i0 = this.i0 + -24;
                     si32(this.i0,this.i2);
                     mstate.esp = mstate.esp - 4;
                     si32(this.i1,mstate.esp);
                     state = 11;
                     mstate.esp = mstate.esp - 4;
                     FSM_foreach.start();
                     return;
                  }
               }
               this.i1 = 1;
               §§goto(addr347);
            case 11:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 4;
               if(this.i0 != 0)
               {
                  §§goto(addr381);
               }
               else
               {
                  §§goto(addr342);
               }
         }
         this.i0 = 0;
         this.i2 = li32(this.i1 + 8);
         si32(this.i0,this.i2 + 8);
         this.i0 = li32(this.i1 + 8);
         this.i0 = this.i0 + 12;
         si32(this.i0,this.i1 + 8);
         mstate.esp = mstate.esp - 4;
         si32(this.i1,mstate.esp);
         state = 5;
         mstate.esp = mstate.esp - 4;
         FSM_foreach.start();
      }
   }
}
