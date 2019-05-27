package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.lf64;
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.sf64;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_io_close extends Machine
   {
      
      public static const intRegCount:int = 3;
      
      public static const NumberRegCount:int = 1;
       
      
      public var i0:int;
      
      public var i1:int;
      
      public var i2:int;
      
      public var f0:Number;
      
      public function FSM_io_close()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM_io_close = null;
         _loc1_ = new FSM_io_close();
         FSM_io_close.gworker = _loc1_;
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
               FSM_io_close.start();
            case 1:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i2 = FSM_io_close;
               if(this.i0 != this.i2)
               {
                  this.i0 = li32(this.i0 + 8);
                  if(this.i0 != -1)
                  {
                     this.i0 = FSM_io_close;
                     mstate.esp = mstate.esp - 8;
                     si32(this.i1,mstate.esp);
                     si32(this.i0,mstate.esp + 4);
                     state = 7;
                     mstate.esp = mstate.esp - 4;
                     FSM_io_close.start();
                     return;
                  }
               }
               this.i0 = -10001;
               mstate.esp = mstate.esp - 8;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_io_close.start();
            case 2:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i0 = li32(this.i0);
               mstate.esp = mstate.esp - 8;
               this.i2 = 2;
               si32(this.i0,mstate.esp);
               si32(this.i2,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_io_close.start();
            case 3:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i2 = li32(this.i1 + 8);
               this.f0 = lf64(this.i0);
               sf64(this.f0,this.i2);
               this.i0 = li32(this.i0 + 8);
               si32(this.i0,this.i2 + 8);
               this.i0 = li32(this.i1 + 8);
               this.i0 = this.i0 + 12;
               si32(this.i0,this.i1 + 8);
               mstate.esp = mstate.esp - 8;
               this.i0 = FSM_io_close;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               state = 4;
               mstate.esp = mstate.esp - 4;
               FSM_io_close.start();
               return;
            case 4:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i0 = li32(this.i0);
               if(this.i0 == 0)
               {
                  this.i0 = FSM_io_close;
                  mstate.esp = mstate.esp - 8;
                  si32(this.i1,mstate.esp);
                  si32(this.i0,mstate.esp + 4);
                  state = 5;
                  mstate.esp = mstate.esp - 4;
                  FSM_io_close.start();
                  return;
               }
               break;
            case 5:
               mstate.esp = mstate.esp + 8;
               break;
            case 6:
               this.i1 = mstate.eax;
               mstate.esp = mstate.esp + 4;
               mstate.eax = this.i1;
               addr369:
               mstate.esp = mstate.ebp;
               mstate.ebp = li32(mstate.esp);
               mstate.esp = mstate.esp + 4;
               mstate.esp = mstate.esp + 4;
               mstate.gworker = caller;
               return;
            case 7:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i0 = li32(this.i0);
               if(this.i0 == 0)
               {
                  this.i0 = FSM_io_close;
                  mstate.esp = mstate.esp - 8;
                  si32(this.i1,mstate.esp);
                  si32(this.i0,mstate.esp + 4);
                  state = 8;
                  mstate.esp = mstate.esp - 4;
                  FSM_io_close.start();
                  return;
               }
               addr491:
               mstate.esp = mstate.esp - 4;
               si32(this.i1,mstate.esp);
               state = 9;
               mstate.esp = mstate.esp - 4;
               FSM_io_close.start();
               return;
            case 8:
               mstate.esp = mstate.esp + 8;
               §§goto(addr491);
            case 9:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 4;
               mstate.eax = this.i0;
               §§goto(addr369);
         }
         mstate.esp = mstate.esp - 4;
         si32(this.i1,mstate.esp);
         state = 6;
         mstate.esp = mstate.esp - 4;
         FSM_io_close.start();
      }
   }
}
