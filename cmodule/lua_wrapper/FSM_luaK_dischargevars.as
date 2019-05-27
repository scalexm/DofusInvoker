package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.li8;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_luaK_dischargevars extends Machine
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
      
      public function FSM_luaK_dischargevars()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM_luaK_dischargevars = null;
         _loc1_ = new FSM_luaK_dischargevars();
         FSM_luaK_dischargevars.gworker = _loc1_;
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
               this.i0 = li32(mstate.ebp + 12);
               this.i1 = li32(this.i0);
               this.i2 = li32(mstate.ebp + 8);
               this.i3 = this.i0;
               if(this.i1 <= 8)
               {
                  if(this.i1 != 6)
                  {
                     if(this.i1 != 7)
                     {
                        if(this.i1 == 8)
                        {
                           this.i1 = 11;
                           this.i4 = li32(this.i2 + 12);
                           this.i5 = li32(this.i0 + 4);
                           this.i4 = li32(this.i4 + 8);
                           this.i5 = this.i5 << 14;
                           mstate.esp = mstate.esp - 12;
                           this.i5 = this.i5 | 5;
                        }
                     }
                     else
                     {
                        this.i1 = 11;
                        this.i4 = li32(this.i2 + 12);
                        this.i5 = li32(this.i0 + 4);
                        this.i4 = li32(this.i4 + 8);
                        this.i5 = this.i5 << 23;
                        mstate.esp = mstate.esp - 12;
                        this.i5 = this.i5 | 4;
                     }
                     si32(this.i2,mstate.esp);
                     si32(this.i5,mstate.esp + 4);
                     si32(this.i4,mstate.esp + 8);
                     state = 1;
                     mstate.esp = mstate.esp - 4;
                     FSM_luaK_dischargevars.start();
                     return;
                  }
                  this.i0 = 12;
                  si32(this.i0,this.i3);
               }
               else if(this.i1 != 9)
               {
                  if(this.i1 != 13)
                  {
                     if(this.i1 == 14)
                     {
                        this.i1 = 11;
                        this.i0 = li32(this.i0 + 4);
                        this.i2 = li32(this.i2);
                        this.i2 = li32(this.i2 + 12);
                        this.i0 = this.i0 << 2;
                        this.i0 = this.i2 + this.i0;
                        this.i2 = li32(this.i0);
                        this.i2 = this.i2 | 16777216;
                        this.i2 = this.i2 & 25165823;
                        addr183:
                        si32(this.i2,this.i0);
                        break;
                     }
                  }
                  else
                  {
                     this.i1 = 12;
                     si32(this.i1,this.i3);
                     this.i2 = li32(this.i2);
                     this.i3 = li32(this.i0 + 4);
                     this.i2 = li32(this.i2 + 12);
                     this.i3 = this.i3 << 2;
                     this.i2 = this.i2 + this.i3;
                     this.i2 = li32(this.i2);
                     this.i2 = this.i2 >>> 6;
                     this.i2 = this.i2 & 255;
                     si32(this.i2,this.i0 + 4);
                  }
               }
               else
               {
                  this.i1 = li32(this.i0 + 8);
                  this.i4 = this.i0 + 8;
                  this.i5 = this.i1 & 256;
                  if(this.i5 == 0)
                  {
                     this.i5 = li8(this.i2 + 50);
                     if(this.i5 <= this.i1)
                     {
                        this.i1 = li32(this.i2 + 36);
                        this.i1 = this.i1 + -1;
                        si32(this.i1,this.i2 + 36);
                     }
                  }
                  this.i1 = li32(this.i0 + 4);
                  this.i0 = this.i0 + 4;
                  this.i5 = this.i1 & 256;
                  if(this.i5 == 0)
                  {
                     this.i5 = li8(this.i2 + 50);
                     if(this.i5 <= this.i1)
                     {
                        this.i1 = li32(this.i2 + 36);
                        this.i1 = this.i1 + -1;
                        si32(this.i1,this.i2 + 36);
                     }
                  }
                  this.i1 = 11;
                  this.i4 = li32(this.i4);
                  this.i5 = li32(this.i0);
                  this.i6 = li32(this.i2 + 12);
                  this.i6 = li32(this.i6 + 8);
                  this.i4 = this.i4 << 14;
                  this.i5 = this.i5 << 23;
                  this.i4 = this.i5 | this.i4;
                  mstate.esp = mstate.esp - 12;
                  this.i4 = this.i4 | 6;
                  si32(this.i2,mstate.esp);
                  si32(this.i4,mstate.esp + 4);
                  si32(this.i6,mstate.esp + 8);
                  state = 2;
                  mstate.esp = mstate.esp - 4;
                  FSM_luaK_dischargevars.start();
                  return;
               }
               addr578:
               mstate.esp = mstate.ebp;
               mstate.ebp = li32(mstate.esp);
               mstate.esp = mstate.esp + 4;
               mstate.esp = mstate.esp + 4;
               mstate.gworker = caller;
               return;
            case 1:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i2,this.i0 + 4);
               break;
            case 2:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               §§goto(addr183);
         }
         si32(this.i1,this.i3);
         §§goto(addr578);
      }
   }
}
