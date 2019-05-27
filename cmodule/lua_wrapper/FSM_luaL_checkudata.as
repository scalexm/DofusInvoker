package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.li8;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_luaL_checkudata extends Machine
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
      
      public function FSM_luaL_checkudata()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM_luaL_checkudata = null;
         _loc1_ = new FSM_luaL_checkudata();
         FSM_luaL_checkudata.gworker = _loc1_;
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
               FSM_luaL_checkudata.start();
            case 1:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i2 = li32(this.i0 + 8);
               this.i3 = li32(mstate.ebp + 12);
               this.i4 = this.i3;
               if(this.i2 != 2)
               {
                  if(this.i2 != 7)
                  {
                     this.i0 = 0;
                  }
                  else
                  {
                     this.i0 = li32(this.i0);
                     this.i0 = this.i0 + 20;
                  }
               }
               else
               {
                  this.i0 = li32(this.i0);
               }
               if(this.i0 != 0)
               {
                  this.i2 = 1;
                  mstate.esp = mstate.esp - 8;
                  si32(this.i1,mstate.esp);
                  si32(this.i2,mstate.esp + 4);
                  mstate.esp = mstate.esp - 4;
                  FSM_luaL_checkudata.start();
               }
               addr256:
               this.i0 = 1;
               mstate.esp = mstate.esp - 8;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_luaL_checkudata.start();
            case 2:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               if(this.i2 != 0)
               {
                  this.i2 = -10000;
                  mstate.esp = mstate.esp - 8;
                  si32(this.i1,mstate.esp);
                  si32(this.i2,mstate.esp + 4);
                  mstate.esp = mstate.esp - 4;
                  FSM_luaL_checkudata.start();
               }
               else
               {
                  §§goto(addr256);
               }
            case 3:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i5 = li8(this.i3);
               if(this.i5 != 0)
               {
                  this.i5 = this.i4;
                  while(true)
                  {
                     this.i6 = li8(this.i5 + 1);
                     this.i5 = this.i5 + 1;
                     this.i7 = this.i5;
                     if(this.i6 != 0)
                     {
                        this.i5 = this.i7;
                        continue;
                     }
                     break;
                  }
               }
               else
               {
                  this.i5 = this.i3;
               }
               this.i6 = 4;
               mstate.esp = mstate.esp - 12;
               this.i4 = this.i5 - this.i4;
               si32(this.i1,mstate.esp);
               si32(this.i3,mstate.esp + 4);
               si32(this.i4,mstate.esp + 8);
               state = 7;
               mstate.esp = mstate.esp - 4;
               FSM_luaL_checkudata.start();
               return;
            case 4:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i2 = FSM_luaL_checkudata;
               if(this.i0 == this.i2)
               {
                  this.i0 = -1;
               }
               else
               {
                  this.i0 = li32(this.i0 + 8);
               }
               if(this.i0 == -1)
               {
                  this.i0 = FSM_luaL_checkudata;
               }
               else
               {
                  this.i2 = FSM_luaL_checkudata;
                  this.i0 = this.i0 << 2;
                  this.i0 = this.i2 + this.i0;
                  this.i0 = li32(this.i0);
               }
               this.i2 = FSM_luaL_checkudata;
               mstate.esp = mstate.esp - 16;
               si32(this.i1,mstate.esp);
               si32(this.i2,mstate.esp + 4);
               si32(this.i3,mstate.esp + 8);
               si32(this.i0,mstate.esp + 12);
               state = 5;
               mstate.esp = mstate.esp - 4;
               FSM_luaL_checkudata.start();
               return;
            case 5:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 16;
               mstate.esp = mstate.esp - 12;
               this.i2 = 1;
               si32(this.i1,mstate.esp);
               si32(this.i2,mstate.esp + 4);
               si32(this.i0,mstate.esp + 8);
               state = 6;
               mstate.esp = mstate.esp - 4;
               FSM_luaL_checkudata.start();
               return;
            case 6:
               mstate.esp = mstate.esp + 12;
               this.i0 = 0;
               addr785:
               mstate.eax = this.i0;
               mstate.esp = mstate.ebp;
               mstate.ebp = li32(mstate.esp);
               mstate.esp = mstate.esp + 4;
               mstate.esp = mstate.esp + 4;
               mstate.gworker = caller;
               return;
            case 7:
               this.i4 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i4,mstate.ebp + -16);
               si32(this.i6,mstate.ebp + -8);
               this.i4 = li32(this.i1 + 8);
               mstate.esp = mstate.esp - 16;
               this.i5 = mstate.ebp + -16;
               si32(this.i1,mstate.esp);
               si32(this.i2,mstate.esp + 4);
               si32(this.i5,mstate.esp + 8);
               si32(this.i4,mstate.esp + 12);
               state = 8;
               mstate.esp = mstate.esp - 4;
               FSM_luaL_checkudata.start();
               return;
            case 8:
               mstate.esp = mstate.esp + 16;
               this.i2 = li32(this.i1 + 8);
               this.i2 = this.i2 + 12;
               si32(this.i2,this.i1 + 8);
               mstate.esp = mstate.esp - 8;
               this.i2 = -1;
               si32(this.i1,mstate.esp);
               si32(this.i2,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_luaL_checkudata.start();
            case 9:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               mstate.esp = mstate.esp - 8;
               this.i4 = -2;
               si32(this.i1,mstate.esp);
               si32(this.i4,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_luaL_checkudata.start();
            case 10:
               this.i4 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i5 = this.i1 + 8;
               this.i6 = FSM_luaL_checkudata;
               if(this.i4 != this.i6)
               {
                  this.i6 = FSM_luaL_checkudata;
                  if(this.i2 != this.i6)
                  {
                     mstate.esp = mstate.esp - 8;
                     si32(this.i2,mstate.esp);
                     si32(this.i4,mstate.esp + 4);
                     mstate.esp = mstate.esp - 4;
                     FSM_luaL_checkudata.start();
                  }
               }
               addr255:
               §§goto(addr256);
            case 11:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               if(this.i2 != 0)
               {
                  this.i1 = li32(this.i5);
                  this.i1 = this.i1 + -24;
                  si32(this.i1,this.i5);
                  §§goto(addr785);
               }
               else
               {
                  §§goto(addr255);
               }
         }
      }
   }
}
