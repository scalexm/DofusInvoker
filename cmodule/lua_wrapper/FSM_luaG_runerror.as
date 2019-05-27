package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.li8;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_luaG_runerror extends Machine
   {
      
      public static const intRegCount:int = 7;
      
      public static const NumberRegCount:int = 0;
       
      
      public var i0:int;
      
      public var i1:int;
      
      public var i2:int;
      
      public var i3:int;
      
      public var i4:int;
      
      public var i5:int;
      
      public var i6:int;
      
      public function FSM_luaG_runerror()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM_luaG_runerror = null;
         _loc1_ = new FSM_luaG_runerror();
         FSM_luaG_runerror.gworker = _loc1_;
      }
      
      override public final function work() : void
      {
         switch(state)
         {
            case 0:
               mstate.esp = mstate.esp - 4;
               si32(mstate.ebp,mstate.esp);
               mstate.ebp = mstate.esp;
               mstate.esp = mstate.esp - 64;
               this.i0 = mstate.ebp + 16;
               si32(this.i0,mstate.ebp + -4);
               mstate.esp = mstate.esp - 12;
               this.i1 = li32(mstate.ebp + 8);
               this.i2 = li32(mstate.ebp + 12);
               si32(this.i1,mstate.esp);
               si32(this.i2,mstate.esp + 4);
               si32(this.i0,mstate.esp + 8);
               state = 1;
               mstate.esp = mstate.esp - 4;
               FSM_luaG_runerror.start();
               return;
            case 1:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               this.i2 = li32(this.i1 + 20);
               this.i3 = li32(this.i2 + 4);
               this.i4 = li32(this.i3 + 8);
               this.i5 = this.i2 + 4;
               this.i6 = mstate.ebp + -4;
               if(this.i4 == 6)
               {
                  this.i3 = li32(this.i3);
                  this.i3 = li8(this.i3 + 6);
                  if(this.i3 == 0)
                  {
                     mstate.esp = mstate.esp - 8;
                     si32(this.i1,mstate.esp);
                     si32(this.i2,mstate.esp + 4);
                     mstate.esp = mstate.esp - 4;
                     FSM_luaG_runerror.start();
                  }
               }
               addr371:
               mstate.esp = mstate.esp - 4;
               si32(this.i1,mstate.esp);
               state = 5;
               mstate.esp = mstate.esp - 4;
               FSM_luaG_runerror.start();
               return;
            case 2:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i3 = li32(this.i5);
               this.i4 = li32(this.i3 + 8);
               if(this.i4 == 6)
               {
                  this.i3 = li32(this.i3);
                  this.i4 = li8(this.i3 + 6);
                  if(this.i4 == 0)
                  {
                     this.i3 = li32(this.i3 + 16);
                  }
                  addr243:
                  this.i4 = 60;
                  this.i3 = li32(this.i3 + 32);
                  mstate.esp = mstate.esp - 12;
                  this.i5 = mstate.ebp + -64;
                  this.i3 = this.i3 + 16;
                  si32(this.i5,mstate.esp);
                  si32(this.i3,mstate.esp + 4);
                  si32(this.i4,mstate.esp + 8);
                  mstate.esp = mstate.esp - 4;
                  FSM_luaG_runerror.start();
               }
               this.i3 = 0;
               §§goto(addr243);
            case 3:
               mstate.esp = mstate.esp + 12;
               mstate.esp = mstate.esp - 20;
               this.i3 = FSM_luaG_runerror;
               si32(this.i1,mstate.esp);
               si32(this.i3,mstate.esp + 4);
               si32(this.i5,mstate.esp + 8);
               si32(this.i2,mstate.esp + 12);
               si32(this.i0,mstate.esp + 16);
               state = 4;
               mstate.esp = mstate.esp - 4;
               FSM_luaG_runerror.start();
               return;
            case 4:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 20;
               §§goto(addr371);
            case 5:
               mstate.esp = mstate.esp + 4;
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
