package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.lf64;
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.sf64;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_luaB_newproxy extends Machine
   {
      
      public static const intRegCount:int = 6;
      
      public static const NumberRegCount:int = 1;
       
      
      public var i0:int;
      
      public var i1:int;
      
      public var i2:int;
      
      public var i3:int;
      
      public var i4:int;
      
      public var i5:int;
      
      public var f0:Number;
      
      public function FSM_luaB_newproxy()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM_luaB_newproxy = null;
         _loc1_ = new FSM_luaB_newproxy();
         FSM_luaB_newproxy.gworker = _loc1_;
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
               this.i1 = li32(this.i0 + 12);
               this.i2 = li32(this.i0 + 8);
               this.i3 = this.i0 + 12;
               this.i4 = this.i0 + 8;
               this.i5 = this.i1 + 12;
               if(uint(this.i2) >= uint(this.i5))
               {
                  this.i2 = this.i1;
               }
               else
               {
                  while(true)
                  {
                     this.i1 = 0;
                     si32(this.i1,this.i2 + 8);
                     this.i1 = this.i2 + 12;
                     si32(this.i1,this.i4);
                     this.i5 = li32(this.i3);
                     if(this.i2 >= this.i5)
                     {
                        break;
                     }
                     this.i2 = this.i1;
                  }
                  this.i2 = this.i5;
               }
               this.i1 = this.i2;
               this.i2 = 0;
               this.i1 = this.i1 + 12;
               si32(this.i1,this.i4);
               mstate.esp = mstate.esp - 8;
               si32(this.i0,mstate.esp);
               si32(this.i2,mstate.esp + 4);
               state = 1;
               mstate.esp = mstate.esp - 4;
               FSM_luaB_newproxy.start();
               return;
            case 1:
               this.i1 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               mstate.esp = mstate.esp - 8;
               this.i1 = 1;
               si32(this.i0,mstate.esp);
               si32(this.i1,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_luaB_newproxy.start();
            case 2:
               this.i1 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i2 = li32(this.i1 + 8);
               if(this.i2 != 0)
               {
                  if(this.i2 == 1)
                  {
                     this.i1 = li32(this.i1);
                     if(this.i1 != 0)
                     {
                     }
                  }
                  this.i1 = 1;
                  mstate.esp = mstate.esp - 8;
                  si32(this.i0,mstate.esp);
                  si32(this.i1,mstate.esp + 4);
                  mstate.esp = mstate.esp - 4;
                  FSM_luaB_newproxy.start();
               }
               this.i0 = 1;
               mstate.eax = this.i0;
               break;
            case 3:
               this.i1 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i2 = FSM_luaB_newproxy;
               if(this.i1 != this.i2)
               {
                  this.i1 = li32(this.i1 + 8);
                  if(this.i1 == 1)
                  {
                     this.i1 = 0;
                     mstate.esp = mstate.esp - 8;
                     si32(this.i0,mstate.esp);
                     si32(this.i1,mstate.esp + 4);
                     state = 4;
                     mstate.esp = mstate.esp - 4;
                     FSM_luaB_newproxy.start();
                     return;
                  }
               }
               this.i1 = 1;
               mstate.esp = mstate.esp - 8;
               si32(this.i0,mstate.esp);
               si32(this.i1,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_luaB_newproxy.start();
            case 4:
               mstate.esp = mstate.esp + 8;
               mstate.esp = mstate.esp - 8;
               this.i1 = -1;
               si32(this.i0,mstate.esp);
               si32(this.i1,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_luaB_newproxy.start();
            case 5:
               this.i1 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i2 = li32(this.i4);
               this.f0 = lf64(this.i1);
               sf64(this.f0,this.i2);
               this.i1 = li32(this.i1 + 8);
               si32(this.i1,this.i2 + 8);
               this.i1 = li32(this.i4);
               this.i2 = this.i1 + 12;
               si32(this.i2,this.i4);
               this.i2 = 1;
               si32(this.i2,this.i1 + 12);
               si32(this.i2,this.i1 + 20);
               this.i1 = li32(this.i4);
               this.i1 = this.i1 + 12;
               si32(this.i1,this.i4);
               mstate.esp = mstate.esp - 8;
               this.i4 = -10003;
               si32(this.i0,mstate.esp);
               si32(this.i4,mstate.esp + 4);
               state = 6;
               mstate.esp = mstate.esp - 4;
               FSM_luaB_newproxy.start();
               return;
            case 6:
               mstate.esp = mstate.esp + 8;
               mstate.esp = mstate.esp - 8;
               this.i4 = 2;
               si32(this.i0,mstate.esp);
               si32(this.i4,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_luaB_newproxy.start();
            case 7:
               mstate.esp = mstate.esp + 8;
               mstate.eax = this.i2;
               break;
            case 8:
               this.i1 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               if(this.i1 != 0)
               {
                  this.i1 = -10003;
                  mstate.esp = mstate.esp - 8;
                  si32(this.i0,mstate.esp);
                  si32(this.i1,mstate.esp + 4);
                  mstate.esp = mstate.esp - 4;
                  FSM_luaB_newproxy.start();
               }
               addr849:
               this.i4 = FSM_luaB_newproxy;
               mstate.esp = mstate.esp - 12;
               this.i1 = 1;
               si32(this.i0,mstate.esp);
               si32(this.i1,mstate.esp + 4);
               si32(this.i4,mstate.esp + 8);
               state = 12;
               mstate.esp = mstate.esp - 4;
               FSM_luaB_newproxy.start();
               return;
            case 9:
               this.i1 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i2 = li32(this.i4);
               this.i1 = li32(this.i1);
               mstate.esp = mstate.esp - 8;
               this.i3 = this.i2 + -12;
               si32(this.i1,mstate.esp);
               si32(this.i3,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_luaB_newproxy.start();
            case 10:
               this.i1 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.f0 = lf64(this.i1);
               sf64(this.f0,this.i2 + -12);
               this.i1 = li32(this.i1 + 8);
               si32(this.i1,this.i2 + -4);
               mstate.esp = mstate.esp - 8;
               this.i1 = -1;
               si32(this.i0,mstate.esp);
               si32(this.i1,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_luaB_newproxy.start();
            case 11:
               this.i1 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i2 = li32(this.i1 + 8);
               if(this.i2 != 0)
               {
                  if(this.i2 == 1)
                  {
                     this.i2 = li32(this.i4);
                     this.i1 = li32(this.i1);
                     this.i2 = this.i2 + -12;
                     si32(this.i2,this.i4);
                     if(this.i1 != 0)
                     {
                     }
                  }
                  else
                  {
                     this.i1 = li32(this.i4);
                     this.i1 = this.i1 + -12;
                     si32(this.i1,this.i4);
                  }
                  addr917:
                  this.i1 = 1;
                  mstate.esp = mstate.esp - 8;
                  si32(this.i0,mstate.esp);
                  si32(this.i1,mstate.esp + 4);
                  mstate.esp = mstate.esp - 4;
                  FSM_luaB_newproxy.start();
               }
               else
               {
                  this.i1 = li32(this.i4);
                  this.i1 = this.i1 + -12;
                  si32(this.i1,this.i4);
               }
               §§goto(addr849);
            case 12:
               mstate.esp = mstate.esp + 12;
               §§goto(addr917);
            case 13:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               mstate.esp = mstate.esp - 8;
               this.i2 = 2;
               si32(this.i0,mstate.esp);
               si32(this.i2,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_luaB_newproxy.start();
            case 14:
               mstate.esp = mstate.esp + 8;
               mstate.eax = this.i1;
         }
         mstate.esp = mstate.ebp;
         mstate.ebp = li32(mstate.esp);
         mstate.esp = mstate.esp + 4;
         mstate.esp = mstate.esp + 4;
         mstate.gworker = caller;
      }
   }
}
