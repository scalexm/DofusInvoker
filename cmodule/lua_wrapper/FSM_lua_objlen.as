package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.lf64;
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.li8;
   import avm2.intrinsics.memory.sf64;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_lua_objlen extends Machine
   {
      
      public static const intRegCount:int = 8;
      
      public static const NumberRegCount:int = 1;
       
      
      public var i0:int;
      
      public var i1:int;
      
      public var i2:int;
      
      public var i3:int;
      
      public var i4:int;
      
      public var i5:int;
      
      public var i6:int;
      
      public var f0:Number;
      
      public var i7:int;
      
      public function FSM_lua_objlen()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM_lua_objlen = null;
         _loc1_ = new FSM_lua_objlen();
         FSM_lua_objlen.gworker = _loc1_;
      }
      
      override public final function work() : void
      {
         switch(state)
         {
            case 0:
               mstate.esp = mstate.esp - 4;
               si32(mstate.ebp,mstate.esp);
               mstate.ebp = mstate.esp;
               mstate.esp = mstate.esp - 32;
               this.i0 = mstate.ebp + -32;
               this.i1 = li32(mstate.ebp + 8);
               mstate.esp = mstate.esp - 8;
               this.i2 = li32(mstate.ebp + 12);
               si32(this.i1,mstate.esp);
               si32(this.i2,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_lua_objlen.start();
            case 1:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i3 = li32(this.i2 + 8);
               this.i4 = this.i2 + 8;
               if(this.i3 <= 4)
               {
                  if(this.i3 != 3)
                  {
                     if(this.i3 != 4)
                     {
                        addr320:
                        this.i0 = 0;
                     }
                     else
                     {
                        addr113:
                        this.i0 = li32(this.i2);
                        this.i0 = li32(this.i0 + 12);
                        break;
                     }
                  }
                  else
                  {
                     this.i3 = FSM_lua_objlen;
                     this.f0 = lf64(this.i2);
                     mstate.esp = mstate.esp - 16;
                     this.i5 = mstate.ebp + -32;
                     si32(this.i5,mstate.esp);
                     si32(this.i3,mstate.esp + 4);
                     sf64(this.f0,mstate.esp + 8);
                     state = 3;
                     mstate.esp = mstate.esp - 4;
                     FSM_lua_objlen.start();
                     return;
                  }
               }
               else if(this.i3 != 5)
               {
                  if(this.i3 != 7)
                  {
                     §§goto(addr320);
                  }
                  else
                  {
                     this.i0 = li32(this.i2);
                     this.i0 = li32(this.i0 + 16);
                  }
               }
               else
               {
                  this.i0 = li32(this.i2);
                  mstate.esp = mstate.esp - 4;
                  si32(this.i0,mstate.esp);
                  mstate.esp = mstate.esp - 4;
                  FSM_lua_objlen.start();
               }
               addr126:
               break;
            case 2:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 4;
               §§goto(addr126);
            case 3:
               mstate.esp = mstate.esp + 16;
               this.i3 = li8(mstate.ebp + -32);
               if(this.i3 != 0)
               {
                  this.i3 = this.i0;
                  while(true)
                  {
                     this.i6 = li8(this.i3 + 1);
                     this.i3 = this.i3 + 1;
                     this.i7 = this.i3;
                     if(this.i6 != 0)
                     {
                        this.i3 = this.i7;
                        continue;
                     }
                     break;
                  }
               }
               else
               {
                  this.i3 = this.i5;
               }
               this.i6 = 4;
               mstate.esp = mstate.esp - 12;
               this.i0 = this.i3 - this.i0;
               si32(this.i1,mstate.esp);
               si32(this.i5,mstate.esp + 4);
               si32(this.i0,mstate.esp + 8);
               state = 4;
               mstate.esp = mstate.esp - 4;
               FSM_lua_objlen.start();
               return;
            case 4:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i0,this.i2);
               si32(this.i6,this.i4);
               §§goto(addr113);
         }
         mstate.eax = this.i0;
         mstate.esp = mstate.ebp;
         mstate.ebp = li32(mstate.esp);
         mstate.esp = mstate.esp + 4;
         mstate.esp = mstate.esp + 4;
         mstate.gworker = caller;
      }
   }
}
