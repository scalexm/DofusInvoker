package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_luaB_loadstring extends Machine
   {
      
      public static const intRegCount:int = 8;
      
      public static const NumberRegCount:int = 0;
       
      
      public var i0:int;
      
      public var i1:int;
      
      public var i2:int;
      
      public var i3:int;
      
      public var i4:int;
      
      public var i5:int;
      
      public var i6:int;
      
      public var i7:int;
      
      public function FSM_luaB_loadstring()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM_luaB_loadstring = null;
         _loc1_ = new FSM_luaB_loadstring();
         FSM_luaB_loadstring.gworker = _loc1_;
      }
      
      override public final function work() : void
      {
         switch(state)
         {
            case 0:
               mstate.esp = mstate.esp - 4;
               si32(mstate.ebp,mstate.esp);
               mstate.ebp = mstate.esp;
               mstate.esp = mstate.esp - 76;
               this.i0 = mstate.ebp + -76;
               mstate.esp = mstate.esp - 12;
               this.i1 = li32(mstate.ebp + 8);
               this.i2 = 1;
               si32(this.i1,mstate.esp);
               si32(this.i2,mstate.esp + 4);
               si32(this.i0,mstate.esp + 8);
               state = 1;
               mstate.esp = mstate.esp - 4;
               FSM_luaB_loadstring.start();
               return;
            case 1:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               mstate.esp = mstate.esp - 16;
               this.i2 = 2;
               this.i3 = 0;
               si32(this.i1,mstate.esp);
               si32(this.i2,mstate.esp + 4);
               si32(this.i0,mstate.esp + 8);
               si32(this.i3,mstate.esp + 12);
               state = 2;
               mstate.esp = mstate.esp - 4;
               FSM_luaB_loadstring.start();
               return;
            case 2:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 16;
               this.i4 = li32(mstate.ebp + -76);
               si32(this.i0,mstate.ebp + -72);
               si32(this.i4,mstate.ebp + -68);
               si32(this.i1,mstate.ebp + -48);
               this.i0 = FSM_luaB_loadstring;
               si32(this.i0,mstate.ebp + -56);
               this.i0 = mstate.ebp + -72;
               si32(this.i0,mstate.ebp + -52);
               si32(this.i3,mstate.ebp + -64);
               this.i0 = FSM_luaB_loadstring;
               si32(this.i3,mstate.ebp + -60);
               this.i4 = mstate.ebp + -64;
               si32(this.i4,mstate.ebp + -32);
               this.i0 = this.i2 == 0?int(this.i0):int(this.i2);
               si32(this.i0,mstate.ebp + -16);
               si32(this.i3,mstate.ebp + -28);
               si32(this.i3,mstate.ebp + -20);
               this.i0 = li32(this.i1 + 108);
               this.i2 = li32(this.i1 + 8);
               this.i4 = li32(this.i1 + 32);
               mstate.esp = mstate.esp - 20;
               this.i5 = FSM_luaB_loadstring;
               this.i2 = this.i2 - this.i4;
               this.i4 = mstate.ebp + -32;
               si32(this.i1,mstate.esp);
               si32(this.i5,mstate.esp + 4);
               si32(this.i4,mstate.esp + 8);
               si32(this.i2,mstate.esp + 12);
               si32(this.i0,mstate.esp + 16);
               state = 3;
               mstate.esp = mstate.esp - 4;
               FSM_luaB_loadstring.start();
               return;
            case 3:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 20;
               this.i2 = li32(this.i1 + 16);
               this.i4 = li32(mstate.ebp + -20);
               this.i5 = li32(mstate.ebp + -28);
               this.i6 = li32(this.i2 + 12);
               this.i7 = li32(this.i2 + 16);
               mstate.esp = mstate.esp - 16;
               si32(this.i7,mstate.esp);
               si32(this.i5,mstate.esp + 4);
               si32(this.i4,mstate.esp + 8);
               si32(this.i3,mstate.esp + 12);
               state = 4;
               mstate.esp = mstate.esp - 4;
               mstate.funcs[this.i6]();
               return;
            case 4:
               this.i3 = mstate.eax;
               mstate.esp = mstate.esp + 16;
               this.i3 = li32(this.i2 + 68);
               this.i3 = this.i3 - this.i4;
               si32(this.i3,this.i2 + 68);
               mstate.esp = mstate.esp - 8;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_luaB_loadstring.start();
            case 5:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
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
