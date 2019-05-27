package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.li8;
   import avm2.intrinsics.memory.sf64;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_luaB_select extends Machine
   {
      
      public static const intRegCount:int = 5;
      
      public static const NumberRegCount:int = 1;
       
      
      public var i0:int;
      
      public var i1:int;
      
      public var i2:int;
      
      public var f0:Number;
      
      public var i4:int;
      
      public var i3:int;
      
      public function FSM_luaB_select()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM_luaB_select = null;
         _loc1_ = new FSM_luaB_select();
         FSM_luaB_select.gworker = _loc1_;
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
               this.i0 = 1;
               this.i1 = li32(mstate.ebp + 8);
               this.i2 = li32(this.i1 + 8);
               this.i3 = li32(this.i1 + 12);
               mstate.esp = mstate.esp - 8;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_luaB_select.start();
            case 1:
               this.i0 = mstate.eax;
               this.i2 = this.i2 - this.i3;
               mstate.esp = mstate.esp + 8;
               this.i2 = this.i2 / 12;
               this.i3 = this.i1 + 8;
               this.i4 = FSM_luaB_select;
               if(this.i0 != this.i4)
               {
                  this.i0 = li32(this.i0 + 8);
                  if(this.i0 == 4)
                  {
                     this.i0 = 0;
                     mstate.esp = mstate.esp - 12;
                     this.i4 = 1;
                     si32(this.i1,mstate.esp);
                     si32(this.i4,mstate.esp + 4);
                     si32(this.i0,mstate.esp + 8);
                     state = 2;
                     mstate.esp = mstate.esp - 4;
                     FSM_luaB_select.start();
                     return;
                  }
               }
               addr250:
               this.i0 = 1;
               mstate.esp = mstate.esp - 8;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               state = 3;
               mstate.esp = mstate.esp - 4;
               FSM_luaB_select.start();
               return;
            case 2:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               this.i0 = li8(this.i0);
               if(this.i0 == 35)
               {
                  this.i1 = 3;
                  this.i2 = this.i2 + -1;
                  this.i0 = li32(this.i3);
                  this.f0 = Number(this.i2);
                  sf64(this.f0,this.i0);
                  si32(this.i1,this.i0 + 8);
                  this.i1 = li32(this.i3);
                  this.i1 = this.i1 + 12;
                  si32(this.i1,this.i3);
                  this.i1 = 1;
                  mstate.eax = this.i1;
                  break;
               }
               §§goto(addr250);
            case 3:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               if(this.i0 <= -1)
               {
                  this.i0 = this.i0 + this.i2;
                  if(this.i0 > 0)
                  {
                     addr384:
                     this.i0 = this.i2 - this.i0;
                     mstate.eax = this.i0;
                     break;
                  }
               }
               else
               {
                  this.i0 = this.i0 > this.i2?int(this.i2):int(this.i0);
                  if(this.i0 > 0)
                  {
                     §§goto(addr384);
                  }
               }
               this.i3 = FSM_luaB_select;
               mstate.esp = mstate.esp - 12;
               this.i4 = 1;
               si32(this.i1,mstate.esp);
               si32(this.i4,mstate.esp + 4);
               si32(this.i3,mstate.esp + 8);
               state = 4;
               mstate.esp = mstate.esp - 4;
               FSM_luaB_select.start();
               return;
            case 4:
               mstate.esp = mstate.esp + 12;
               §§goto(addr384);
         }
         mstate.esp = mstate.ebp;
         mstate.ebp = li32(mstate.esp);
         mstate.esp = mstate.esp + 4;
         mstate.esp = mstate.esp + 4;
         mstate.gworker = caller;
      }
   }
}
