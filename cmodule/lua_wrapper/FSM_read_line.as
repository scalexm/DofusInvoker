package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.li8;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_read_line extends Machine
   {
      
      public static const intRegCount:int = 10;
      
      public static const NumberRegCount:int = 0;
       
      
      public var i0:int;
      
      public var i1:int;
      
      public var i2:int;
      
      public var i3:int;
      
      public var i4:int;
      
      public var i5:int;
      
      public var i6:int;
      
      public var i8:int;
      
      public var i7:int;
      
      public var i9:int;
      
      public function FSM_read_line()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM_read_line = null;
         _loc1_ = new FSM_read_line();
         FSM_read_line.gworker = _loc1_;
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
               si32(this.i1,mstate.ebp + -1032);
               this.i2 = this.i0 + 12;
               si32(this.i2,mstate.ebp + -1040);
               this.i3 = 0;
               si32(this.i3,mstate.ebp + -1036);
               mstate.esp = mstate.esp - 4;
               si32(this.i0,mstate.esp);
               state = 1;
               mstate.esp = mstate.esp - 4;
               FSM_read_line.start();
               return;
            case 1:
               this.i3 = mstate.eax;
               mstate.esp = mstate.esp + 4;
               this.i4 = this.i0 + 4;
               this.i5 = this.i0 + 8;
               this.i6 = li32(mstate.ebp + 12);
               this.i7 = this.i0;
               if(this.i3 != 0)
               {
                  this.i3 = mstate.ebp + -1040;
                  mstate.esp = mstate.esp - 4;
                  si32(this.i3,mstate.esp);
                  state = 2;
                  mstate.esp = mstate.esp - 4;
                  FSM_read_line.start();
                  return;
               }
               break;
            case 2:
               mstate.esp = mstate.esp + 4;
               break;
            case 3:
               this.i3 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               if(this.i3 == 0)
               {
                  addr226:
                  this.i0 = mstate.ebp + -1040;
                  mstate.esp = mstate.esp - 4;
                  si32(this.i0,mstate.esp);
                  state = 4;
                  mstate.esp = mstate.esp - 4;
                  FSM_read_line.start();
                  return;
               }
               addr382:
               this.i3 = li8(this.i2);
               if(this.i3 != 0)
               {
                  this.i3 = this.i0;
                  while(true)
                  {
                     this.i8 = li8(this.i3 + 13);
                     this.i3 = this.i3 + 1;
                     if(this.i8 != 0)
                     {
                        continue;
                     }
                     break;
                  }
                  this.i3 = this.i3 + 12;
               }
               else
               {
                  this.i3 = this.i2;
               }
               this.i8 = this.i3 - this.i2;
               if(this.i3 != this.i2)
               {
                  this.i3 = mstate.ebp + -1040;
                  this.i9 = this.i8 + -1;
                  this.i3 = this.i3 + this.i9;
                  this.i3 = li8(this.i3 + 12);
                  if(this.i3 == 10)
                  {
                     this.i0 = mstate.ebp + -1040;
                     this.i1 = li32(this.i7);
                     this.i1 = this.i1 + this.i9;
                     si32(this.i1,this.i7);
                     mstate.esp = mstate.esp - 4;
                     si32(this.i0,mstate.esp);
                     state = 10;
                     mstate.esp = mstate.esp - 4;
                     FSM_read_line.start();
                     return;
                  }
               }
               this.i9 = mstate.ebp + -1040;
               this.i3 = li32(this.i7);
               this.i3 = this.i3 + this.i8;
               si32(this.i3,this.i7);
               mstate.esp = mstate.esp - 4;
               si32(this.i9,mstate.esp);
               state = 7;
               mstate.esp = mstate.esp - 4;
               FSM_read_line.start();
               return;
            case 4:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 4;
               this.i0 = li32(this.i4);
               this.i2 = li32(this.i5);
               mstate.esp = mstate.esp - 8;
               si32(this.i2,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               state = 5;
               mstate.esp = mstate.esp - 4;
               FSM_read_line.start();
               return;
            case 5:
               mstate.esp = mstate.esp + 8;
               this.i0 = 1;
               si32(this.i0,this.i4);
               mstate.esp = mstate.esp - 8;
               this.i0 = -1;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               state = 6;
               mstate.esp = mstate.esp - 4;
               FSM_read_line.start();
               return;
            case 6:
               this.i0 = mstate.eax;
               this.i0 = this.i0 != 0?1:0;
               mstate.esp = mstate.esp + 8;
               this.i0 = this.i0 & 1;
               addr731:
               mstate.eax = this.i0;
               mstate.esp = mstate.ebp;
               mstate.ebp = li32(mstate.esp);
               mstate.esp = mstate.esp + 4;
               mstate.esp = mstate.esp + 4;
               mstate.gworker = caller;
               return;
            case 7:
               this.i9 = mstate.eax;
               mstate.esp = mstate.esp + 4;
               if(this.i9 != 0)
               {
                  this.i9 = mstate.ebp + -1040;
                  mstate.esp = mstate.esp - 4;
                  si32(this.i9,mstate.esp);
                  state = 8;
                  mstate.esp = mstate.esp - 4;
                  FSM_read_line.start();
                  return;
               }
               addr567:
               this.i9 = 1024;
               mstate.esp = mstate.esp - 12;
               si32(this.i2,mstate.esp);
               si32(this.i9,mstate.esp + 4);
               si32(this.i6,mstate.esp + 8);
               state = 9;
               mstate.esp = mstate.esp - 4;
               FSM_read_line.start();
               return;
            case 8:
               mstate.esp = mstate.esp + 4;
               §§goto(addr567);
            case 9:
               this.i9 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               if(this.i9 != 0)
               {
                  §§goto(addr382);
               }
               else
               {
                  §§goto(addr226);
               }
            case 10:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 4;
               this.i0 = li32(this.i4);
               this.i1 = li32(this.i5);
               mstate.esp = mstate.esp - 8;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               state = 11;
               mstate.esp = mstate.esp - 4;
               FSM_read_line.start();
               return;
            case 11:
               mstate.esp = mstate.esp + 8;
               this.i0 = 1;
               §§goto(addr731);
         }
         this.i3 = 1024;
         mstate.esp = mstate.esp - 12;
         si32(this.i2,mstate.esp);
         si32(this.i3,mstate.esp + 4);
         si32(this.i6,mstate.esp + 8);
         state = 3;
         mstate.esp = mstate.esp - 4;
         FSM_read_line.start();
      }
   }
}
