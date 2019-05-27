package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.lf64;
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.li8;
   import avm2.intrinsics.memory.sf64;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_luaB_setfenv extends Machine
   {
      
      public static const intRegCount:int = 8;
      
      public static const NumberRegCount:int = 2;
       
      
      public var f1:Number;
      
      public var i0:int;
      
      public var i1:int;
      
      public var i2:int;
      
      public var i3:int;
      
      public var i4:int;
      
      public var i5:int;
      
      public var i6:int;
      
      public var f0:Number;
      
      public var i7:int;
      
      public function FSM_luaB_setfenv()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM_luaB_setfenv = null;
         _loc1_ = new FSM_luaB_setfenv();
         FSM_luaB_setfenv.gworker = _loc1_;
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
               this.i0 = 2;
               mstate.esp = mstate.esp - 8;
               this.i1 = li32(mstate.ebp + 8);
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_luaB_setfenv.start();
            case 1:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i2 = FSM_luaB_setfenv;
               if(this.i0 != this.i2)
               {
                  this.i0 = li32(this.i0 + 8);
                  if(this.i0 == 5)
                  {
                     addr145:
                     this.i0 = 0;
                     mstate.esp = mstate.esp - 8;
                     si32(this.i1,mstate.esp);
                     si32(this.i0,mstate.esp + 4);
                     state = 3;
                     mstate.esp = mstate.esp - 4;
                     FSM_luaB_setfenv.start();
                     return;
                  }
               }
               this.i0 = 5;
               mstate.esp = mstate.esp - 12;
               this.i2 = 2;
               si32(this.i1,mstate.esp);
               si32(this.i2,mstate.esp + 4);
               si32(this.i0,mstate.esp + 8);
               state = 2;
               mstate.esp = mstate.esp - 4;
               FSM_luaB_setfenv.start();
               return;
            case 2:
               mstate.esp = mstate.esp + 12;
               §§goto(addr145);
            case 3:
               mstate.esp = mstate.esp + 8;
               mstate.esp = mstate.esp - 8;
               this.i0 = 2;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_luaB_setfenv.start();
            case 4:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i2 = li32(this.i1 + 8);
               this.f0 = lf64(this.i0);
               sf64(this.f0,this.i2);
               this.i0 = li32(this.i0 + 8);
               si32(this.i0,this.i2 + 8);
               this.i0 = li32(this.i1 + 8);
               this.i0 = this.i0 + 12;
               si32(this.i0,this.i1 + 8);
               mstate.esp = mstate.esp - 8;
               this.i0 = 1;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               state = 5;
               mstate.esp = mstate.esp - 4;
               FSM_luaB_setfenv.start();
               return;
            case 5:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i2 = this.i1 + 8;
               if(this.i0 != 0)
               {
                  this.i0 = 1;
                  mstate.esp = mstate.esp - 8;
                  si32(this.i1,mstate.esp);
                  si32(this.i0,mstate.esp + 4);
                  state = 6;
                  mstate.esp = mstate.esp - 4;
                  FSM_luaB_setfenv.start();
                  return;
               }
               addr628:
               this.i0 = -2;
               mstate.esp = mstate.esp - 8;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_luaB_setfenv.start();
            case 6:
               this.f0 = mstate.st0;
               mstate.esp = mstate.esp + 8;
               this.f1 = 0;
               if(this.f0 == this.f1)
               {
                  this.i0 = 8;
                  this.i3 = li32(this.i2);
                  si32(this.i1,this.i3);
                  si32(this.i0,this.i3 + 8);
                  this.i0 = li32(this.i2);
                  this.i0 = this.i0 + 12;
                  si32(this.i0,this.i2);
                  mstate.esp = mstate.esp - 8;
                  this.i0 = -2;
                  si32(this.i1,mstate.esp);
                  si32(this.i0,mstate.esp + 4);
                  mstate.esp = mstate.esp - 4;
                  FSM_luaB_setfenv.start();
               }
               else
               {
                  §§goto(addr628);
               }
            case 7:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i3 = li32(this.i2);
               this.i4 = this.i3;
               if(uint(this.i3) > uint(this.i0))
               {
                  this.i5 = 0;
                  while(true)
                  {
                     this.i6 = this.i5 ^ -1;
                     this.i6 = this.i6 * 12;
                     this.i6 = this.i4 + this.i6;
                     this.f0 = lf64(this.i6);
                     sf64(this.f0,this.i3);
                     this.i7 = li32(this.i6 + 8);
                     si32(this.i7,this.i3 + 8);
                     this.i3 = this.i3 + -12;
                     this.i5 = this.i5 + 1;
                     if(uint(this.i6) > uint(this.i0))
                     {
                        continue;
                     }
                     break;
                  }
               }
               this.i3 = -2;
               this.i2 = li32(this.i2);
               this.f0 = lf64(this.i2);
               sf64(this.f0,this.i0);
               this.i2 = li32(this.i2 + 8);
               si32(this.i2,this.i0 + 8);
               mstate.esp = mstate.esp - 8;
               si32(this.i1,mstate.esp);
               si32(this.i3,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_luaB_setfenv.start();
            case 8:
               this.i1 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i1 = 0;
               mstate.eax = this.i1;
               break;
            case 9:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i2 = li32(this.i0 + 8);
               if(this.i2 == 6)
               {
                  this.i0 = li32(this.i0);
                  this.i0 = li8(this.i0 + 6);
                  if(this.i0 == 0)
                  {
                  }
                  addr745:
                  this.i0 = FSM_luaB_setfenv;
                  mstate.esp = mstate.esp - 8;
                  si32(this.i1,mstate.esp);
                  si32(this.i0,mstate.esp + 4);
                  state = 11;
                  mstate.esp = mstate.esp - 4;
                  FSM_luaB_setfenv.start();
                  return;
               }
               this.i0 = -2;
               mstate.esp = mstate.esp - 8;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_luaB_setfenv.start();
            case 10:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               if(this.i0 == 0)
               {
                  §§goto(addr745);
               }
               else
               {
                  addr786:
                  this.i0 = 1;
                  mstate.eax = this.i0;
                  break;
               }
            case 11:
               mstate.esp = mstate.esp + 8;
               §§goto(addr786);
         }
         mstate.esp = mstate.ebp;
         mstate.ebp = li32(mstate.esp);
         mstate.esp = mstate.esp + 4;
         mstate.esp = mstate.esp + 4;
         mstate.gworker = caller;
      }
   }
}
