package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.lf64;
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.li8;
   import avm2.intrinsics.memory.sf64;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_luaV_gettable extends Machine
   {
      
      public static const intRegCount:int = 12;
      
      public static const NumberRegCount:int = 1;
       
      
      public var i10:int;
      
      public var i11:int;
      
      public var f0:Number;
      
      public var i0:int;
      
      public var i1:int;
      
      public var i2:int;
      
      public var i3:int;
      
      public var i4:int;
      
      public var i5:int;
      
      public var i6:int;
      
      public var i7:int;
      
      public var i8:int;
      
      public var i9:int;
      
      public function FSM_luaV_gettable()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM_luaV_gettable = null;
         _loc1_ = new FSM_luaV_gettable();
         FSM_luaV_gettable.gworker = _loc1_;
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
               this.i0 = 0;
               this.i1 = li32(mstate.ebp + 8);
               this.i2 = li32(mstate.ebp + 12);
               this.i3 = li32(mstate.ebp + 16);
               this.i4 = li32(mstate.ebp + 20);
               this.i5 = this.i1 + 16;
               loop0:
               while(true)
               {
                  this.i6 = li32(this.i2 + 8);
                  this.i7 = this.i2 + 8;
                  if(this.i6 == 5)
                  {
                     this.i6 = li32(this.i2);
                     mstate.esp = mstate.esp - 8;
                     si32(this.i6,mstate.esp);
                     si32(this.i3,mstate.esp + 4);
                     mstate.esp = mstate.esp - 4;
                     FSM_luaV_gettable.start();
                  }
                  else
                  {
                     this.i8 = 0;
                     mstate.esp = mstate.esp - 12;
                     si32(this.i1,mstate.esp);
                     si32(this.i2,mstate.esp + 4);
                     si32(this.i8,mstate.esp + 8);
                     mstate.esp = mstate.esp - 4;
                     FSM_luaV_gettable.start();
                  }
                  addr383:
                  while(true)
                  {
                     this.i6 = this.i8;
                     this.i8 = li32(this.i6 + 8);
                     this.i9 = this.i6 + 8;
                     if(this.i8 == 6)
                     {
                        break loop0;
                     }
                     this.i0 = this.i0 + 1;
                     if(this.i0 <= 99)
                     {
                        this.i2 = this.i6;
                        continue loop0;
                     }
                     this.i0 = FSM_luaV_gettable;
                     mstate.esp = mstate.esp - 8;
                     si32(this.i1,mstate.esp);
                     si32(this.i0,mstate.esp + 4);
                     state = 7;
                     mstate.esp = mstate.esp - 4;
                     FSM_luaV_gettable.start();
                     return;
                  }
               }
               this.i0 = li32(this.i1 + 32);
               this.i5 = li32(this.i1 + 8);
               this.f0 = lf64(this.i6);
               sf64(this.f0,this.i5);
               this.i6 = li32(this.i9);
               si32(this.i6,this.i5 + 8);
               this.i5 = li32(this.i1 + 8);
               this.f0 = lf64(this.i2);
               sf64(this.f0,this.i5 + 12);
               this.i2 = li32(this.i7);
               si32(this.i2,this.i5 + 20);
               this.i2 = li32(this.i1 + 8);
               this.f0 = lf64(this.i3);
               sf64(this.f0,this.i2 + 24);
               this.i3 = li32(this.i3 + 8);
               si32(this.i3,this.i2 + 32);
               this.i2 = li32(this.i1 + 28);
               this.i3 = li32(this.i1 + 8);
               this.i5 = this.i1 + 8;
               this.i0 = this.i4 - this.i0;
               this.i4 = this.i1 + 32;
               this.i2 = this.i2 - this.i3;
               if(this.i2 <= 36)
               {
                  this.i2 = 3;
                  mstate.esp = mstate.esp - 8;
                  si32(this.i1,mstate.esp);
                  si32(this.i2,mstate.esp + 4);
                  state = 5;
                  mstate.esp = mstate.esp - 4;
                  FSM_luaV_gettable.start();
                  return;
               }
               addr591:
               this.i2 = 1;
               this.i3 = li32(this.i5);
               this.i6 = this.i3 + 36;
               si32(this.i6,this.i5);
               mstate.esp = mstate.esp - 12;
               si32(this.i1,mstate.esp);
               si32(this.i3,mstate.esp + 4);
               si32(this.i2,mstate.esp + 8);
               state = 6;
               mstate.esp = mstate.esp - 4;
               FSM_luaV_gettable.start();
               return;
            case 1:
               loop1:
               while(true)
               {
                  this.i8 = mstate.eax;
                  mstate.esp = mstate.esp + 8;
                  this.i9 = li32(this.i8 + 8);
                  this.i10 = this.i8 + 8;
                  if(this.i9 == 0)
                  {
                     this.i6 = li32(this.i6 + 8);
                     if(this.i6 != 0)
                     {
                        this.i9 = li8(this.i6 + 6);
                        this.i9 = this.i9 & 1;
                        if(this.i9 == 0)
                        {
                           this.i9 = 0;
                           this.i11 = li32(this.i5);
                           this.i11 = li32(this.i11 + 168);
                           mstate.esp = mstate.esp - 12;
                           si32(this.i6,mstate.esp);
                           si32(this.i9,mstate.esp + 4);
                           si32(this.i11,mstate.esp + 8);
                           mstate.esp = mstate.esp - 4;
                           FSM_luaV_gettable.start();
                        }
                        addr242:
                        while(true)
                        {
                           if(this.i6 != 0)
                           {
                              this.i8 = this.i6;
                              §§goto(addr383);
                           }
                           else
                           {
                              break loop1;
                           }
                        }
                     }
                     this.i6 = 0;
                     §§goto(addr242);
                  }
                  break;
               }
               this.f0 = lf64(this.i8);
               sf64(this.f0,this.i4);
               this.i0 = li32(this.i10);
               si32(this.i0,this.i4 + 8);
               break;
            case 2:
               while(true)
               {
                  this.i6 = mstate.eax;
                  mstate.esp = mstate.esp + 12;
                  §§goto(addr242);
               }
            case 3:
               while(true)
               {
                  this.i8 = mstate.eax;
                  mstate.esp = mstate.esp + 12;
                  this.i6 = li32(this.i8 + 8);
                  if(this.i6 != 0)
                  {
                     §§goto(addr383);
                  }
                  else
                  {
                     break;
                  }
               }
               this.i6 = FSM_luaV_gettable;
               mstate.esp = mstate.esp - 12;
               si32(this.i1,mstate.esp);
               si32(this.i2,mstate.esp + 4);
               si32(this.i6,mstate.esp + 8);
               state = 4;
               mstate.esp = mstate.esp - 4;
               FSM_luaV_gettable.start();
               return;
            case 4:
               mstate.esp = mstate.esp + 12;
               §§goto(addr383);
            case 5:
               mstate.esp = mstate.esp + 8;
               §§goto(addr591);
            case 6:
               mstate.esp = mstate.esp + 12;
               this.i1 = li32(this.i5);
               this.i2 = li32(this.i4);
               this.i3 = this.i1 + -12;
               si32(this.i3,this.i5);
               this.f0 = lf64(this.i1 + -12);
               this.i0 = this.i2 + this.i0;
               sf64(this.f0,this.i0);
               this.i1 = li32(this.i1 + -4);
               si32(this.i1,this.i0 + 8);
               break;
            case 7:
               mstate.esp = mstate.esp + 8;
         }
         mstate.esp = mstate.ebp;
         mstate.ebp = li32(mstate.esp);
         mstate.esp = mstate.esp + 4;
         mstate.esp = mstate.esp + 4;
         mstate.gworker = caller;
      }
   }
}
