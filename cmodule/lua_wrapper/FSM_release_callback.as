package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_release_callback extends Machine
   {
      
      public static const intRegCount:int = 5;
      
      public static const NumberRegCount:int = 0;
       
      
      public var i0:int;
      
      public var i1:int;
      
      public var i2:int;
      
      public var i3:int;
      
      public var i4:int;
      
      public function FSM_release_callback()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM_release_callback = null;
         _loc1_ = new FSM_release_callback();
         FSM_release_callback.gworker = _loc1_;
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
               this.i0 = FSM_release_callback;
               mstate.esp = mstate.esp - 8;
               this.i1 = li32(mstate.ebp + 8);
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               state = 1;
               mstate.esp = mstate.esp - 4;
               FSM_release_callback.start();
               return;
            case 1:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               if(this.i0 != 0)
               {
                  this.i1 = li32(this.i0);
                  if(this.i1 != 0)
                  {
                     this.i2 = li32(this.i1);
                     this.i3 = this.i1;
                     if(this.i2 != 0)
                     {
                        this.i2 = li32(this.i1 + 8);
                        state = 2;
                        mstate.esp = mstate.esp - 4;
                        mstate.funcs[FSM_release_callback]();
                        return;
                     }
                     this.i1 = 0;
                     break;
                  }
               }
               this.i0 = 0;
               mstate.eax = this.i0;
               addr244:
               mstate.esp = mstate.ebp;
               mstate.ebp = li32(mstate.esp);
               mstate.esp = mstate.esp + 4;
               mstate.esp = mstate.esp + 4;
               mstate.gworker = caller;
               return;
            case 2:
               this.i4 = mstate.eax;
               this.i1 = this.i1 + 8;
               if(this.i2 != this.i4)
               {
                  this.i2 = li32(this.i1);
                  mstate.esp = mstate.esp - 4;
                  si32(this.i2,mstate.esp);
                  state = 3;
                  mstate.esp = mstate.esp - 4;
                  mstate.funcs[FSM_release_callback]();
                  return;
               }
               addr215:
               this.i1 = 0;
               si32(this.i1,this.i3);
               break;
            case 3:
               mstate.esp = mstate.esp + 4;
               state = 4;
               mstate.esp = mstate.esp - 4;
               mstate.funcs[FSM_release_callback]();
               return;
            case 4:
               this.i2 = mstate.eax;
               si32(this.i2,this.i1);
               §§goto(addr215);
         }
         si32(this.i1,this.i0);
         mstate.eax = this.i1;
         §§goto(addr244);
      }
   }
}
