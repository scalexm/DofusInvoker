package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_luaL_checknumber extends Machine
   {
      
      public static const intRegCount:int = 5;
      
      public static const NumberRegCount:int = 2;
       
      
      public var i0:int;
      
      public var i1:int;
      
      public var i2:int;
      
      public var f0:Number;
      
      public var i4:int;
      
      public var i3:int;
      
      public var f1:Number;
      
      public function FSM_luaL_checknumber()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM_luaL_checknumber = null;
         _loc1_ = new FSM_luaL_checknumber();
         FSM_luaL_checknumber.gworker = _loc1_;
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
               this.f0 = 0;
               this.i0 = li32(mstate.ebp + 8);
               mstate.esp = mstate.esp - 8;
               this.i1 = li32(mstate.ebp + 12);
               si32(this.i0,mstate.esp);
               si32(this.i1,mstate.esp + 4);
               state = 1;
               mstate.esp = mstate.esp - 4;
               FSM_luaL_checknumber.start();
               return;
            case 1:
               this.f1 = mstate.st0;
               mstate.esp = mstate.esp + 8;
               if(this.f1 == this.f0)
               {
                  mstate.esp = mstate.esp - 8;
                  si32(this.i0,mstate.esp);
                  si32(this.i1,mstate.esp + 4);
                  state = 2;
                  mstate.esp = mstate.esp - 4;
                  FSM_luaL_checknumber.start();
                  return;
               }
               break;
            case 2:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               if(this.i2 == 0)
               {
                  this.i2 = FSM_luaL_checknumber;
                  mstate.esp = mstate.esp - 8;
                  si32(this.i0,mstate.esp);
                  si32(this.i1,mstate.esp + 4);
                  mstate.esp = mstate.esp - 4;
                  FSM_luaL_checknumber.start();
               }
               else
               {
                  break;
               }
            case 3:
               this.i3 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               if(this.i3 == this.i2)
               {
                  this.i3 = -1;
               }
               else
               {
                  this.i3 = li32(this.i3 + 8);
               }
               this.i2 = this.i3;
               if(this.i2 == -1)
               {
                  this.i2 = FSM_luaL_checknumber;
               }
               else
               {
                  this.i3 = FSM_luaL_checknumber;
                  this.i2 = this.i2 << 2;
                  this.i2 = this.i3 + this.i2;
                  this.i2 = li32(this.i2);
               }
               this.i3 = FSM_luaL_checknumber;
               mstate.esp = mstate.esp - 16;
               this.i4 = FSM_luaL_checknumber;
               si32(this.i0,mstate.esp);
               si32(this.i3,mstate.esp + 4);
               si32(this.i4,mstate.esp + 8);
               si32(this.i2,mstate.esp + 12);
               state = 4;
               mstate.esp = mstate.esp - 4;
               FSM_luaL_checknumber.start();
               return;
            case 4:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 16;
               mstate.esp = mstate.esp - 12;
               si32(this.i0,mstate.esp);
               si32(this.i1,mstate.esp + 4);
               si32(this.i2,mstate.esp + 8);
               state = 5;
               mstate.esp = mstate.esp - 4;
               FSM_luaL_checknumber.start();
               return;
            case 5:
               mstate.esp = mstate.esp + 12;
         }
         mstate.st0 = this.f1;
         mstate.esp = mstate.ebp;
         mstate.ebp = li32(mstate.esp);
         mstate.esp = mstate.esp + 4;
         mstate.esp = mstate.esp + 4;
         mstate.gworker = caller;
      }
   }
}
