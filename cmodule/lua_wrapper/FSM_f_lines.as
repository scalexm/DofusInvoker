package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.lf64;
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.sf64;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_f_lines extends Machine
   {
      
      public static const intRegCount:int = 4;
      
      public static const NumberRegCount:int = 1;
       
      
      public var i0:int;
      
      public var i1:int;
      
      public var i2:int;
      
      public var f0:Number;
      
      public var i3:int;
      
      public function FSM_f_lines()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM_f_lines = null;
         _loc1_ = new FSM_f_lines();
         FSM_f_lines.gworker = _loc1_;
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
               this.i0 = FSM_f_lines;
               mstate.esp = mstate.esp - 8;
               this.i1 = li32(mstate.ebp + 8);
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               state = 1;
               mstate.esp = mstate.esp - 4;
               FSM_f_lines.start();
               return;
            case 1:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i0 = li32(this.i0);
               if(this.i0 == 0)
               {
                  this.i0 = FSM_f_lines;
                  mstate.esp = mstate.esp - 8;
                  si32(this.i1,mstate.esp);
                  si32(this.i0,mstate.esp + 4);
                  state = 2;
                  mstate.esp = mstate.esp - 4;
                  FSM_f_lines.start();
                  return;
               }
               addr130:
               this.i0 = 1;
               mstate.esp = mstate.esp - 8;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_f_lines.start();
            case 2:
               mstate.esp = mstate.esp + 8;
               §§goto(addr130);
            case 3:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i3 = li32(this.i1 + 8);
               this.f0 = lf64(this.i2);
               sf64(this.f0,this.i3);
               this.i2 = li32(this.i2 + 8);
               si32(this.i2,this.i3 + 8);
               this.i2 = li32(this.i1 + 8);
               this.i3 = this.i2 + 12;
               si32(this.i3,this.i1 + 8);
               this.i3 = 0;
               si32(this.i3,this.i2 + 12);
               si32(this.i0,this.i2 + 20);
               this.i2 = li32(this.i1 + 8);
               this.i2 = this.i2 + 12;
               si32(this.i2,this.i1 + 8);
               mstate.esp = mstate.esp - 12;
               this.i2 = FSM_f_lines;
               this.i3 = 2;
               si32(this.i1,mstate.esp);
               si32(this.i2,mstate.esp + 4);
               si32(this.i3,mstate.esp + 8);
               state = 4;
               mstate.esp = mstate.esp - 4;
               FSM_f_lines.start();
               return;
            case 4:
               mstate.esp = mstate.esp + 12;
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
