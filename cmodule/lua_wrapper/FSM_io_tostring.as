package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_io_tostring extends Machine
   {
      
      public static const intRegCount:int = 4;
      
      public static const NumberRegCount:int = 0;
       
      
      public var i0:int;
      
      public var i1:int;
      
      public var i2:int;
      
      public var i3:int;
      
      public function FSM_io_tostring()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM_io_tostring = null;
         _loc1_ = new FSM_io_tostring();
         FSM_io_tostring.gworker = _loc1_;
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
               this.i0 = FSM_io_tostring;
               mstate.esp = mstate.esp - 8;
               this.i1 = li32(mstate.ebp + 8);
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               state = 1;
               mstate.esp = mstate.esp - 4;
               FSM_io_tostring.start();
               return;
            case 1:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i0 = li32(this.i0);
               if(this.i0 == 0)
               {
                  this.i0 = li32(this.i1 + 16);
                  this.i2 = li32(this.i0 + 68);
                  this.i0 = li32(this.i0 + 64);
                  if(uint(this.i2) >= uint(this.i0))
                  {
                     mstate.esp = mstate.esp - 4;
                     si32(this.i1,mstate.esp);
                     state = 2;
                     mstate.esp = mstate.esp - 4;
                     FSM_io_tostring.start();
                     return;
                  }
                  addr150:
                  this.i0 = FSM_io_tostring;
                  this.i2 = li32(this.i1 + 8);
                  mstate.esp = mstate.esp - 12;
                  this.i3 = 13;
                  si32(this.i1,mstate.esp);
                  si32(this.i0,mstate.esp + 4);
                  si32(this.i3,mstate.esp + 8);
                  state = 3;
                  mstate.esp = mstate.esp - 4;
                  FSM_io_tostring.start();
                  return;
               }
               this.i2 = FSM_io_tostring;
               mstate.esp = mstate.esp - 12;
               si32(this.i1,mstate.esp);
               si32(this.i2,mstate.esp + 4);
               si32(this.i0,mstate.esp + 8);
               state = 4;
               mstate.esp = mstate.esp - 4;
               FSM_io_tostring.start();
               return;
            case 2:
               mstate.esp = mstate.esp + 4;
               §§goto(addr150);
            case 3:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i0,this.i2);
               this.i0 = 4;
               si32(this.i0,this.i2 + 8);
               this.i0 = li32(this.i1 + 8);
               this.i0 = this.i0 + 12;
               si32(this.i0,this.i1 + 8);
               break;
            case 4:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 12;
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
