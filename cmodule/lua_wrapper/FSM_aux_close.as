package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.li8;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_aux_close extends Machine
   {
      
      public static const intRegCount:int = 5;
      
      public static const NumberRegCount:int = 0;
       
      
      public var i0:int;
      
      public var i1:int;
      
      public var i2:int;
      
      public var i3:int;
      
      public var i4:int;
      
      public function FSM_aux_close()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM_aux_close = null;
         _loc1_ = new FSM_aux_close();
         FSM_aux_close.gworker = _loc1_;
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
               this.i0 = 1;
               mstate.esp = mstate.esp - 8;
               this.i1 = li32(mstate.ebp + 8);
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_aux_close.start();
            case 1:
               mstate.esp = mstate.esp + 8;
               mstate.esp = mstate.esp - 8;
               this.i0 = -1;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_aux_close.start();
            case 2:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i2 = FSM_aux_close;
               while(true)
               {
                  this.i3 = li8(this.i2 + 1);
                  this.i2 = this.i2 + 1;
                  this.i4 = this.i2;
                  if(this.i3 != 0)
                  {
                     this.i2 = this.i4;
                     continue;
                  }
                  break;
               }
               this.i3 = FSM_aux_close;
               mstate.esp = mstate.esp - 12;
               this.i2 = this.i2 - this.i3;
               si32(this.i1,mstate.esp);
               si32(this.i3,mstate.esp + 4);
               si32(this.i2,mstate.esp + 8);
               state = 3;
               mstate.esp = mstate.esp - 4;
               FSM_aux_close.start();
               return;
            case 3:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i2,mstate.ebp + -16);
               this.i2 = 4;
               si32(this.i2,mstate.ebp + -8);
               this.i2 = li32(this.i1 + 8);
               mstate.esp = mstate.esp - 16;
               this.i3 = mstate.ebp + -16;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               si32(this.i3,mstate.esp + 8);
               si32(this.i2,mstate.esp + 12);
               state = 4;
               mstate.esp = mstate.esp - 4;
               FSM_aux_close.start();
               return;
            case 4:
               mstate.esp = mstate.esp + 16;
               this.i0 = li32(this.i1 + 8);
               this.i2 = this.i0 + 12;
               si32(this.i2,this.i1 + 8);
               this.i2 = li32(this.i0 + 8);
               if(this.i2 == 6)
               {
                  this.i0 = li32(this.i0);
                  this.i2 = li8(this.i0 + 6);
                  if(this.i2 != 0)
                  {
                     this.i0 = li32(this.i0 + 16);
                  }
                  addr344:
                  mstate.esp = mstate.esp - 4;
                  si32(this.i1,mstate.esp);
                  state = 5;
                  mstate.esp = mstate.esp - 4;
                  mstate.funcs[this.i0]();
                  return;
               }
               this.i0 = 0;
               §§goto(addr344);
            case 5:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 4;
               mstate.eax = this.i0;
               mstate.esp = mstate.ebp;
               mstate.ebp = li32(mstate.esp);
               mstate.esp = mstate.esp + 4;
               mstate.esp = mstate.esp + 4;
               mstate.gworker = caller;
               return;
         }
      }
   }
}
