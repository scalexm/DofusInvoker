package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.lf64;
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.li8;
   import avm2.intrinsics.memory.sf64;
   import avm2.intrinsics.memory.si32;
   import avm2.intrinsics.memory.si8;
   
   public final class FSM_luaV_settable extends Machine
   {
      
      public static const intRegCount:int = 16;
      
      public static const NumberRegCount:int = 2;
       
      
      public var i10:int;
      
      public var i11:int;
      
      public var i12:int;
      
      public var i13:int;
      
      public var i14:int;
      
      public var i15:int;
      
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
      
      public var f1:Number;
      
      public function FSM_luaV_settable()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM_luaV_settable = null;
         _loc1_ = new FSM_luaV_settable();
         FSM_luaV_settable.gworker = _loc1_;
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
               this.i2 = li32(mstate.ebp + 16);
               this.i3 = li32(mstate.ebp + 12);
               this.i4 = li32(mstate.ebp + 20);
               this.i5 = this.i2 + 8;
               this.i6 = this.i1 + 16;
               this.i7 = this.i2;
               loop0:
               while(true)
               {
                  this.i8 = li32(this.i3 + 8);
                  this.i9 = this.i3 + 8;
                  if(this.i8 == 5)
                  {
                     this.i8 = 0;
                     this.i10 = li32(this.i3);
                     mstate.esp = mstate.esp - 8;
                     si32(this.i10,mstate.esp);
                     si32(this.i2,mstate.esp + 4);
                     mstate.esp = mstate.esp - 4;
                     FSM_luaV_settable.start();
                  }
                  else
                  {
                     this.i8 = 1;
                     mstate.esp = mstate.esp - 12;
                     si32(this.i1,mstate.esp);
                     si32(this.i3,mstate.esp + 4);
                     si32(this.i8,mstate.esp + 8);
                     mstate.esp = mstate.esp - 4;
                     FSM_luaV_settable.start();
                  }
                  addr782:
                  while(true)
                  {
                     this.i10 = li32(this.i8 + 8);
                     this.i11 = this.i8 + 8;
                     if(this.i10 == 6)
                     {
                        break loop0;
                     }
                     this.i0 = this.i0 + 1;
                     if(this.i0 <= 99)
                     {
                        this.i3 = this.i8;
                        continue loop0;
                     }
                     this.i0 = FSM_luaV_settable;
                     mstate.esp = mstate.esp - 8;
                     si32(this.i1,mstate.esp);
                     si32(this.i0,mstate.esp + 4);
                     state = 13;
                     mstate.esp = mstate.esp - 4;
                     FSM_luaV_settable.start();
                     return;
                  }
               }
               this.i0 = li32(this.i1 + 8);
               this.f0 = lf64(this.i8);
               sf64(this.f0,this.i0);
               this.i2 = li32(this.i11);
               si32(this.i2,this.i0 + 8);
               this.i0 = li32(this.i1 + 8);
               this.f0 = lf64(this.i3);
               sf64(this.f0,this.i0 + 12);
               this.i2 = li32(this.i9);
               si32(this.i2,this.i0 + 20);
               this.i0 = li32(this.i1 + 8);
               this.f0 = lf64(this.i7);
               sf64(this.f0,this.i0 + 24);
               this.i2 = li32(this.i5);
               si32(this.i2,this.i0 + 32);
               this.i0 = li32(this.i1 + 8);
               this.f0 = lf64(this.i4);
               sf64(this.f0,this.i0 + 36);
               this.i2 = li32(this.i4 + 8);
               si32(this.i2,this.i0 + 44);
               this.i0 = li32(this.i1 + 28);
               this.i2 = li32(this.i1 + 8);
               this.i3 = this.i1 + 8;
               this.i0 = this.i0 - this.i2;
               if(this.i0 <= 48)
               {
                  this.i0 = li32(this.i1 + 44);
                  if(this.i0 >= 4)
                  {
                     mstate.esp = mstate.esp - 8;
                     this.i0 = this.i0 << 1;
                     si32(this.i1,mstate.esp);
                     si32(this.i0,mstate.esp + 4);
                     state = 10;
                     mstate.esp = mstate.esp - 4;
                     FSM_luaV_settable.start();
                     return;
                  }
                  mstate.esp = mstate.esp - 8;
                  this.i0 = this.i0 + 4;
                  si32(this.i1,mstate.esp);
                  si32(this.i0,mstate.esp + 4);
                  state = 11;
                  mstate.esp = mstate.esp - 4;
                  FSM_luaV_settable.start();
                  return;
               }
               addr1056:
               this.i0 = 0;
               this.i2 = li32(this.i3);
               this.i4 = this.i2 + 48;
               si32(this.i4,this.i3);
               mstate.esp = mstate.esp - 12;
               si32(this.i1,mstate.esp);
               si32(this.i2,mstate.esp + 4);
               si32(this.i0,mstate.esp + 8);
               state = 12;
               mstate.esp = mstate.esp - 4;
               FSM_luaV_settable.start();
               return;
            case 1:
               loop1:
               while(true)
               {
                  this.i11 = mstate.eax;
                  mstate.esp = mstate.esp + 8;
                  si8(this.i8,this.i10 + 6);
                  this.i8 = this.i10;
                  this.i12 = FSM_luaV_settable;
                  if(this.i11 != this.i12)
                  {
                     addr429:
                     while(true)
                     {
                        this.i12 = li32(this.i11 + 8);
                        this.i13 = this.i11 + 8;
                        if(this.i12 == 0)
                        {
                           this.i12 = li32(this.i10 + 8);
                           if(this.i12 != 0)
                           {
                              this.i14 = li8(this.i12 + 6);
                              this.i14 = this.i14 & 2;
                              if(this.i14 == 0)
                              {
                                 this.i14 = 1;
                                 this.i15 = li32(this.i6);
                                 this.i15 = li32(this.i15 + 172);
                                 mstate.esp = mstate.esp - 12;
                                 si32(this.i12,mstate.esp);
                                 si32(this.i14,mstate.esp + 4);
                                 si32(this.i15,mstate.esp + 8);
                                 mstate.esp = mstate.esp - 4;
                                 FSM_luaV_settable.start();
                              }
                              addr545:
                              while(true)
                              {
                                 if(this.i12 != 0)
                                 {
                                    this.i8 = this.i12;
                                    §§goto(addr782);
                                 }
                                 else
                                 {
                                    break loop1;
                                 }
                              }
                           }
                           this.i12 = 0;
                           §§goto(addr545);
                        }
                        break loop1;
                     }
                  }
                  else
                  {
                     this.i11 = li32(this.i5);
                     if(this.i11 != 3)
                     {
                        if(this.i11 == 0)
                        {
                           this.i11 = FSM_luaV_settable;
                           mstate.esp = mstate.esp - 8;
                           si32(this.i1,mstate.esp);
                           si32(this.i11,mstate.esp + 4);
                           state = 2;
                           mstate.esp = mstate.esp - 4;
                           FSM_luaV_settable.start();
                           return;
                        }
                     }
                     else
                     {
                        this.f0 = 0;
                        this.f1 = lf64(this.i7);
                        if(!(this.f1 != Number.NaN && this.f0 != Number.NaN))
                        {
                           this.i11 = FSM_luaV_settable;
                           mstate.esp = mstate.esp - 8;
                           si32(this.i1,mstate.esp);
                           si32(this.i11,mstate.esp + 4);
                           state = 4;
                           mstate.esp = mstate.esp - 4;
                           FSM_luaV_settable.start();
                           return;
                        }
                     }
                     mstate.esp = mstate.esp - 12;
                     si32(this.i1,mstate.esp);
                     si32(this.i10,mstate.esp + 4);
                     si32(this.i2,mstate.esp + 8);
                     state = 6;
                     mstate.esp = mstate.esp - 4;
                     FSM_luaV_settable.start();
                     return;
                  }
               }
               this.f0 = lf64(this.i4);
               sf64(this.f0,this.i11);
               this.i0 = li32(this.i4 + 8);
               si32(this.i0,this.i13);
               this.i0 = li32(this.i4 + 8);
               if(this.i0 >= 4)
               {
                  this.i0 = li32(this.i4);
                  this.i0 = li8(this.i0 + 5);
                  this.i0 = this.i0 & 3;
                  if(this.i0 != 0)
                  {
                     this.i0 = li8(this.i8 + 5);
                     this.i3 = this.i8 + 5;
                     this.i1 = this.i0 & 4;
                     if(this.i1 != 0)
                     {
                        this.i1 = li32(this.i6);
                        this.i0 = this.i0 & -5;
                        si8(this.i0,this.i3);
                        this.i0 = li32(this.i1 + 40);
                        si32(this.i0,this.i10 + 24);
                        si32(this.i8,this.i1 + 40);
                        break;
                     }
                     break;
                  }
                  break;
               }
               break;
            case 2:
               mstate.esp = mstate.esp + 8;
               mstate.esp = mstate.esp - 12;
               si32(this.i1,mstate.esp);
               si32(this.i10,mstate.esp + 4);
               si32(this.i2,mstate.esp + 8);
               state = 3;
               mstate.esp = mstate.esp - 4;
               FSM_luaV_settable.start();
               return;
            case 3:
               this.i11 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               §§goto(addr429);
            case 4:
               mstate.esp = mstate.esp + 8;
               mstate.esp = mstate.esp - 12;
               si32(this.i1,mstate.esp);
               si32(this.i10,mstate.esp + 4);
               si32(this.i2,mstate.esp + 8);
               state = 5;
               mstate.esp = mstate.esp - 4;
               FSM_luaV_settable.start();
               return;
            case 5:
               this.i11 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               §§goto(addr429);
            case 6:
               this.i11 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               §§goto(addr429);
            case 7:
               while(true)
               {
                  this.i12 = mstate.eax;
                  mstate.esp = mstate.esp + 12;
                  §§goto(addr545);
               }
            case 8:
               while(true)
               {
                  this.i8 = mstate.eax;
                  mstate.esp = mstate.esp + 12;
                  this.i10 = li32(this.i8 + 8);
                  if(this.i10 != 0)
                  {
                     §§goto(addr782);
                  }
                  else
                  {
                     break;
                  }
               }
               this.i10 = FSM_luaV_settable;
               mstate.esp = mstate.esp - 12;
               si32(this.i1,mstate.esp);
               si32(this.i3,mstate.esp + 4);
               si32(this.i10,mstate.esp + 8);
               state = 9;
               mstate.esp = mstate.esp - 4;
               FSM_luaV_settable.start();
               return;
            case 9:
               mstate.esp = mstate.esp + 12;
               §§goto(addr782);
            case 10:
               mstate.esp = mstate.esp + 8;
               §§goto(addr1056);
            case 11:
               mstate.esp = mstate.esp + 8;
               §§goto(addr1056);
            case 12:
               mstate.esp = mstate.esp + 12;
               break;
            case 13:
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
