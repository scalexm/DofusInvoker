package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.li8;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM__start extends Machine
   {
      
      public static const intRegCount:int = 4;
      
      public static const NumberRegCount:int = 0;
       
      
      public var i0:int;
      
      public var i1:int;
      
      public var i2:int;
      
      public var i3:int;
      
      public function FSM__start()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM__start = null;
         _loc1_ = new FSM__start();
         FSM__start.gworker = _loc1_;
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
               this.i2 = li32(this.i0);
               this.i1 = this.i2 << 2;
               this.i1 = this.i1 + this.i0;
               this.i1 = this.i1 + 8;
               si32(this.i1,FSM__start);
               if(this.i2 >= 1)
               {
                  this.i0 = li32(this.i0 + 4);
                  this.i1 = this.i0;
                  if(this.i0 != 0)
                  {
                     si32(this.i1,FSM__start);
                     this.i3 = li8(this.i1);
                     if(this.i3 != 0)
                     {
                        while(true)
                        {
                           this.i3 = li8(this.i0);
                           if(this.i3 == 47)
                           {
                              this.i1 = this.i0 + 1;
                           }
                           this.i3 = li8(this.i0 + 1);
                           this.i0 = this.i0 + 1;
                           if(this.i3 != 0)
                           {
                              continue;
                           }
                           break;
                        }
                        si32(this.i1,FSM__start);
                     }
                  }
               }
               this.i0 = 0;
               mstate.esp = mstate.esp - 4;
               si32(this.i0,mstate.esp);
               state = 1;
               mstate.esp = mstate.esp - 4;
               FSM__start.start();
               return;
            case 1:
               mstate.esp = mstate.esp + 4;
               mstate.esp = mstate.esp - 4;
               this.i0 = FSM__start;
               si32(this.i0,mstate.esp);
               state = 2;
               mstate.esp = mstate.esp - 4;
               FSM__start.start();
               return;
            case 2:
               mstate.esp = mstate.esp + 4;
               this.i0 = FSM__start;
               this.i1 = 4;
               this.i3 = FSM__start;
               log(this.i1,mstate.gworker.stringFromPtr(this.i0));
               si32(this.i3,FSM__start);
               this.i0 = FSM__start;
               si32(this.i0,FSM__start);
               this.i0 = FSM__start;
               si32(this.i0,FSM__start);
               this.i0 = FSM__start;
               si32(this.i0,FSM__start);
               this.i0 = FSM__start;
               si32(this.i0,FSM__start);
               this.i0 = FSM__start;
               si32(this.i0,FSM__start);
               this.i0 = 6;
               si32(this.i0,FSM__start);
               mstate.esp = mstate.esp - 4;
               si32(this.i2,mstate.esp);
               state = 3;
               mstate.esp = mstate.esp - 4;
               FSM__start.start();
               return;
            case 3:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 4;
               mstate.esp = mstate.esp - 4;
               si32(this.i0,mstate.esp);
               state = 4;
               mstate.esp = mstate.esp - 4;
               FSM__start.start();
               return;
            case 4:
               mstate.esp = mstate.esp + 4;
         }
      }
   }
}
