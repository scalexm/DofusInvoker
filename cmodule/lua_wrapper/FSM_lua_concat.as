package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_lua_concat extends Machine
   {
      
      public static const intRegCount:int = 4;
      
      public static const NumberRegCount:int = 0;
       
      
      public var i0:int;
      
      public var i1:int;
      
      public var i2:int;
      
      public var i3:int;
      
      public function FSM_lua_concat()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM_lua_concat = null;
         _loc1_ = new FSM_lua_concat();
         FSM_lua_concat.gworker = _loc1_;
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
               this.i1 = li32(mstate.ebp + 12);
               if(this.i1 >= 2)
               {
                  this.i2 = li32(this.i0 + 16);
                  this.i3 = li32(this.i2 + 68);
                  this.i2 = li32(this.i2 + 64);
                  if(uint(this.i3) >= uint(this.i2))
                  {
                     mstate.esp = mstate.esp - 4;
                     si32(this.i0,mstate.esp);
                     state = 1;
                     mstate.esp = mstate.esp - 4;
                     FSM_lua_concat.start();
                     return;
                  }
                  addr106:
                  this.i2 = li32(this.i0 + 8);
                  this.i3 = li32(this.i0 + 12);
                  this.i2 = this.i2 - this.i3;
                  this.i2 = this.i2 / 12;
                  mstate.esp = mstate.esp - 12;
                  this.i2 = this.i2 + -1;
                  si32(this.i0,mstate.esp);
                  si32(this.i1,mstate.esp + 4);
                  si32(this.i2,mstate.esp + 8);
                  state = 2;
                  mstate.esp = mstate.esp - 4;
                  FSM_lua_concat.start();
                  return;
               }
               if(this.i1 == 0)
               {
                  this.i1 = FSM_lua_concat;
                  this.i2 = li32(this.i0 + 8);
                  mstate.esp = mstate.esp - 12;
                  this.i3 = 0;
                  si32(this.i0,mstate.esp);
                  si32(this.i1,mstate.esp + 4);
                  si32(this.i3,mstate.esp + 8);
                  state = 3;
                  mstate.esp = mstate.esp - 4;
                  FSM_lua_concat.start();
                  return;
               }
               break;
            case 1:
               mstate.esp = mstate.esp + 4;
               §§goto(addr106);
            case 2:
               mstate.esp = mstate.esp + 12;
               this.i1 = 1 - this.i1;
               this.i2 = li32(this.i0 + 8);
               this.i1 = this.i1 * 12;
               this.i1 = this.i2 + this.i1;
               addr211:
               si32(this.i1,this.i0 + 8);
               break;
            case 3:
               this.i1 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i1,this.i2);
               this.i1 = 4;
               si32(this.i1,this.i2 + 8);
               this.i1 = li32(this.i0 + 8);
               this.i1 = this.i1 + 12;
               §§goto(addr211);
         }
         mstate.esp = mstate.ebp;
         mstate.ebp = li32(mstate.esp);
         mstate.esp = mstate.esp + 4;
         mstate.esp = mstate.esp + 4;
         mstate.gworker = caller;
      }
   }
}
