package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.lf64;
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.li8;
   import avm2.intrinsics.memory.sf64;
   import avm2.intrinsics.memory.si32;
   import avm2.intrinsics.memory.si8;
   
   public final class FSM_luaD_precall extends Machine
   {
      
      public static const intRegCount:int = 21;
      
      public static const NumberRegCount:int = 1;
       
      
      public var i10:int;
      
      public var i11:int;
      
      public var i12:int;
      
      public var i13:int;
      
      public var i14:int;
      
      public var i15:int;
      
      public var i17:int;
      
      public var i19:int;
      
      public var i16:int;
      
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
      
      public var i18:int;
      
      public var i20:int;
      
      public var f0:Number;
      
      public function FSM_luaD_precall()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM_luaD_precall = null;
         _loc1_ = new FSM_luaD_precall();
         FSM_luaD_precall.gworker = _loc1_;
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
               this.i0 = li32(mstate.ebp + 8);
               this.i1 = li32(mstate.ebp + 12);
               this.i2 = li32(mstate.ebp + 16);
               this.i3 = li32(this.i1 + 8);
               if(this.i3 != 6)
               {
                  this.i3 = 16;
                  mstate.esp = mstate.esp - 12;
                  si32(this.i0,mstate.esp);
                  si32(this.i1,mstate.esp + 4);
                  si32(this.i3,mstate.esp + 8);
                  mstate.esp = mstate.esp - 4;
                  FSM_luaD_precall.start();
               }
               addr479:
               this.i3 = li32(this.i0 + 32);
               this.i4 = li32(this.i1);
               this.i5 = li32(this.i0 + 20);
               this.i6 = li32(this.i0 + 24);
               si32(this.i6,this.i5 + 12);
               this.i5 = li8(this.i4 + 6);
               this.i6 = this.i0 + 24;
               this.i7 = this.i0 + 20;
               this.i1 = this.i1 - this.i3;
               this.i3 = this.i0 + 32;
               if(this.i5 == 0)
               {
                  this.i4 = li32(this.i4 + 16);
                  this.i5 = li8(this.i4 + 75);
                  this.i8 = li32(this.i0 + 28);
                  this.i9 = li32(this.i0 + 8);
                  this.i10 = this.i4 + 75;
                  this.i11 = this.i0 + 8;
                  this.i12 = this.i5 * 12;
                  this.i8 = this.i8 - this.i9;
                  if(this.i8 <= this.i12)
                  {
                     this.i8 = li32(this.i0 + 44);
                     if(this.i8 >= this.i5)
                     {
                        mstate.esp = mstate.esp - 8;
                        this.i5 = this.i8 << 1;
                        si32(this.i0,mstate.esp);
                        si32(this.i5,mstate.esp + 4);
                        state = 5;
                        mstate.esp = mstate.esp - 4;
                        FSM_luaD_precall.start();
                        return;
                     }
                     mstate.esp = mstate.esp - 8;
                     this.i5 = this.i8 + this.i5;
                     si32(this.i0,mstate.esp);
                     si32(this.i5,mstate.esp + 4);
                     state = 6;
                     mstate.esp = mstate.esp - 4;
                     FSM_luaD_precall.start();
                     return;
                  }
                  addr710:
                  this.i5 = li32(this.i3);
                  this.i8 = li8(this.i4 + 74);
                  this.i5 = this.i5 + this.i1;
                  this.i9 = this.i4 + 74;
                  this.i12 = this.i5;
                  if(this.i8 == 0)
                  {
                     this.i1 = li8(this.i4 + 73);
                     this.i1 = this.i1 * 12;
                     this.i3 = li32(this.i11);
                     this.i1 = this.i1 + this.i12;
                     this.i1 = this.i1 + 12;
                     this.i5 = this.i12 + 12;
                     if(uint(this.i3) <= uint(this.i1))
                     {
                        this.i1 = this.i5;
                        this.i5 = this.i12;
                     }
                     else
                     {
                        si32(this.i1,this.i11);
                        this.i1 = li32(this.i7);
                        this.i3 = li32(this.i0 + 36);
                        if(this.i1 != this.i3)
                        {
                           this.i3 = this.i12;
                           addr830:
                           this.i9 = this.i1 + 24;
                           this.i8 = this.i9;
                           this.i1 = this.i5;
                           addr3091:
                           this.i5 = this.i9;
                           this.i9 = 0;
                           si32(this.i8,this.i7);
                           si32(this.i3,this.i5 + 4);
                           si32(this.i1,this.i5);
                           si32(this.i1,this.i0 + 12);
                           this.i3 = li8(this.i10);
                           this.i3 = this.i3 * 12;
                           this.i1 = this.i1 + this.i3;
                           si32(this.i1,this.i5 + 8);
                           this.i1 = li32(this.i4 + 12);
                           si32(this.i1,this.i6);
                           si32(this.i9,this.i5 + 20);
                           si32(this.i2,this.i5 + 16);
                           this.i1 = li32(this.i11);
                           this.i2 = li32(this.i5 + 8);
                           this.i3 = this.i5 + 8;
                           if(uint(this.i2) <= uint(this.i1))
                           {
                              this.i1 = this.i2;
                           }
                           else
                           {
                              do
                              {
                                 this.i2 = 0;
                                 si32(this.i2,this.i1 + 8);
                                 this.i2 = li32(this.i3);
                                 this.i1 = this.i1 + 12;
                              }
                              while(uint(this.i2) > uint(this.i1));
                              
                              this.i1 = this.i2;
                           }
                           si32(this.i1,this.i11);
                           this.i1 = li8(this.i0 + 56);
                           this.i1 = this.i1 & 1;
                           if(this.i1 == 0)
                           {
                              this.i0 = 0;
                              addr3267:
                              mstate.eax = this.i0;
                              break;
                           }
                           this.i1 = -1;
                           this.i2 = li32(this.i6);
                           this.i2 = this.i2 + 4;
                           si32(this.i2,this.i6);
                           mstate.esp = mstate.esp - 12;
                           this.i2 = 0;
                           si32(this.i0,mstate.esp);
                           si32(this.i2,mstate.esp + 4);
                           si32(this.i1,mstate.esp + 8);
                           state = 27;
                           mstate.esp = mstate.esp - 4;
                           FSM_luaD_precall.start();
                           return;
                        }
                        this.i1 = this.i5;
                        this.i5 = this.i12;
                     }
                     addr2918:
                     this.i3 = this.i5;
                     this.i5 = li32(this.i0 + 48);
                     this.i8 = this.i0 + 48;
                     if(this.i5 >= 20001)
                     {
                        this.i1 = 5;
                        mstate.esp = mstate.esp - 8;
                        si32(this.i0,mstate.esp);
                        si32(this.i1,mstate.esp + 4);
                     }
                     else
                     {
                        addr2982:
                        mstate.esp = mstate.esp - 8;
                        this.i5 = this.i5 << 1;
                        si32(this.i0,mstate.esp);
                        si32(this.i5,mstate.esp + 4);
                        state = 25;
                        mstate.esp = mstate.esp - 4;
                        FSM_luaD_precall.start();
                        return;
                     }
                  }
                  else
                  {
                     this.i8 = li32(this.i11);
                     this.i5 = this.i8 - this.i5;
                     this.i12 = li8(this.i4 + 73);
                     this.i5 = this.i5 / 12;
                     this.i13 = this.i5 + -1;
                     this.i14 = this.i12;
                     if(this.i13 >= this.i12)
                     {
                        this.i5 = this.i8;
                        this.i8 = this.i13;
                     }
                     else
                     {
                        this.i13 = 0;
                        this.i5 = this.i12 - this.i5;
                        this.i5 = this.i5 + 1;
                        while(true)
                        {
                           this.i15 = 0;
                           si32(this.i15,this.i8 + 8);
                           this.i8 = this.i8 + 12;
                           si32(this.i8,this.i11);
                           this.i13 = this.i13 + 1;
                           if(this.i13 != this.i5)
                           {
                              continue;
                           }
                           break;
                        }
                        this.i5 = this.i8;
                        this.i8 = this.i12;
                     }
                     this.i9 = li8(this.i9);
                     this.i9 = this.i9 & 4;
                     if(this.i9 != 0)
                     {
                        this.i5 = li32(this.i0 + 16);
                        this.i9 = li32(this.i5 + 68);
                        this.i13 = li32(this.i5 + 64);
                        this.i15 = this.i5 + 68;
                        this.i16 = this.i0 + 16;
                        this.i17 = this.i8 - this.i12;
                        if(uint(this.i9) >= uint(this.i13))
                        {
                           this.i5 = 32;
                           mstate.esp = mstate.esp - 4;
                           si32(this.i0,mstate.esp);
                           state = 7;
                           mstate.esp = mstate.esp - 4;
                           FSM_luaD_precall.start();
                           return;
                        }
                        this.i9 = 32;
                        this.i13 = li32(this.i5 + 12);
                        this.i5 = li32(this.i5 + 16);
                        mstate.esp = mstate.esp - 16;
                        this.i18 = 0;
                        si32(this.i5,mstate.esp);
                        si32(this.i18,mstate.esp + 4);
                        si32(this.i18,mstate.esp + 8);
                        si32(this.i9,mstate.esp + 12);
                        state = 15;
                        mstate.esp = mstate.esp - 4;
                        mstate.funcs[this.i13]();
                        return;
                     }
                     if(this.i12 <= 0)
                     {
                        this.i8 = 0;
                     }
                     else
                     {
                        this.i14 = 0;
                        this.i13 = this.i5;
                        addr2717:
                        this.i9 = this.i13;
                        this.i13 = this.i14;
                        this.i14 = 0;
                        this.i8 = this.i8 * -12;
                        this.i8 = this.i9 + this.i8;
                        this.i9 = this.i14;
                        do
                        {
                           this.i14 = 0;
                           this.i15 = li32(this.i11);
                           this.i16 = this.i15 + 12;
                           si32(this.i16,this.i11);
                           this.f0 = lf64(this.i8);
                           sf64(this.f0,this.i15);
                           this.i16 = li32(this.i8 + 8);
                           si32(this.i16,this.i15 + 8);
                           si32(this.i14,this.i8 + 8);
                           this.i8 = this.i8 + 12;
                           this.i9 = this.i9 + 1;
                        }
                        while(this.i9 < this.i12);
                        
                        this.i8 = this.i13;
                     }
                     addr2819:
                     if(this.i8 != 0)
                     {
                        this.i9 = 5;
                        this.i12 = li32(this.i11);
                        this.i13 = this.i12 + 12;
                        si32(this.i13,this.i11);
                        si32(this.i8,this.i12);
                        si32(this.i9,this.i12 + 8);
                     }
                     this.i3 = li32(this.i3);
                     this.i3 = this.i3 + this.i1;
                     this.i1 = this.i5;
                     this.i5 = this.i3;
                  }
                  this.i3 = this.i1;
                  this.i8 = this.i5;
                  this.i1 = li32(this.i7);
                  this.i5 = li32(this.i0 + 36);
                  if(this.i1 != this.i5)
                  {
                     this.i5 = this.i3;
                     this.i3 = this.i8;
                     §§goto(addr830);
                  }
                  else
                  {
                     this.i1 = this.i3;
                     this.i5 = this.i8;
                     §§goto(addr2918);
                  }
               }
               else
               {
                  this.i4 = li32(this.i0 + 28);
                  this.i5 = li32(this.i0 + 8);
                  this.i6 = this.i0 + 8;
                  this.i4 = this.i4 - this.i5;
                  if(this.i4 <= 240)
                  {
                     this.i4 = li32(this.i0 + 44);
                     if(this.i4 >= 20)
                     {
                        mstate.esp = mstate.esp - 8;
                        this.i4 = this.i4 << 1;
                        si32(this.i0,mstate.esp);
                        si32(this.i4,mstate.esp + 4);
                        state = 28;
                        mstate.esp = mstate.esp - 4;
                        FSM_luaD_precall.start();
                        return;
                     }
                     mstate.esp = mstate.esp - 8;
                     this.i4 = this.i4 + 20;
                     si32(this.i0,mstate.esp);
                     si32(this.i4,mstate.esp + 4);
                     state = 29;
                     mstate.esp = mstate.esp - 4;
                     FSM_luaD_precall.start();
                     return;
                  }
                  addr3486:
                  this.i4 = li32(this.i7);
                  this.i5 = li32(this.i0 + 36);
                  if(this.i4 == this.i5)
                  {
                     this.i4 = li32(this.i0 + 48);
                     this.i5 = this.i0 + 48;
                     if(this.i4 >= 20001)
                     {
                        this.i4 = 5;
                        mstate.esp = mstate.esp - 8;
                        si32(this.i0,mstate.esp);
                        si32(this.i4,mstate.esp + 4);
                     }
                     else
                     {
                        mstate.esp = mstate.esp - 8;
                        this.i4 = this.i4 << 1;
                        si32(this.i0,mstate.esp);
                        si32(this.i4,mstate.esp + 4);
                        state = 30;
                        mstate.esp = mstate.esp - 4;
                        FSM_luaD_precall.start();
                        return;
                     }
                  }
                  else
                  {
                     this.i4 = this.i4 + 24;
                     this.i5 = this.i4;
                     addr3665:
                     si32(this.i5,this.i7);
                     this.i3 = li32(this.i3);
                     this.i1 = this.i3 + this.i1;
                     si32(this.i1,this.i4 + 4);
                     this.i1 = this.i1 + 12;
                     si32(this.i1,this.i4);
                     si32(this.i1,this.i0 + 12);
                     this.i1 = li32(this.i6);
                     this.i1 = this.i1 + 240;
                     si32(this.i1,this.i4 + 8);
                     si32(this.i2,this.i4 + 16);
                     this.i1 = li8(this.i0 + 56);
                     this.i1 = this.i1 & 1;
                     if(this.i1 != 0)
                     {
                        this.i1 = -1;
                        mstate.esp = mstate.esp - 12;
                        this.i2 = 0;
                        si32(this.i0,mstate.esp);
                        si32(this.i2,mstate.esp + 4);
                        si32(this.i1,mstate.esp + 8);
                        state = 32;
                        mstate.esp = mstate.esp - 4;
                        FSM_luaD_precall.start();
                        return;
                     }
                     addr3800:
                     this.i1 = li32(this.i7);
                     this.i1 = li32(this.i1 + 4);
                     this.i1 = li32(this.i1);
                     this.i1 = li32(this.i1 + 16);
                     mstate.esp = mstate.esp - 4;
                     si32(this.i0,mstate.esp);
                     state = 33;
                     mstate.esp = mstate.esp - 4;
                     mstate.funcs[this.i1]();
                     return;
                  }
               }
               state = 24;
               mstate.esp = mstate.esp - 4;
               FSM_luaD_precall.start();
               return;
            case 1:
               this.i3 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               this.i4 = li32(this.i0 + 32);
               this.i5 = li32(this.i3 + 8);
               this.i6 = this.i0 + 8;
               this.i7 = this.i3 + 8;
               this.i4 = this.i1 - this.i4;
               this.i8 = this.i0 + 32;
               if(this.i5 != 6)
               {
                  this.i5 = FSM_luaD_precall;
                  mstate.esp = mstate.esp - 12;
                  si32(this.i0,mstate.esp);
                  si32(this.i1,mstate.esp + 4);
                  si32(this.i5,mstate.esp + 8);
                  state = 2;
                  mstate.esp = mstate.esp - 4;
                  FSM_luaD_precall.start();
                  return;
               }
               this.i5 = li32(this.i6);
               if(uint(this.i5) > uint(this.i1))
               {
                  addr231:
                  this.i9 = 0;
                  this.i10 = this.i5;
                  while(true)
                  {
                     this.i11 = this.i9 ^ -1;
                     this.i11 = this.i11 * 12;
                     this.i11 = this.i5 + this.i11;
                     this.f0 = lf64(this.i11);
                     sf64(this.f0,this.i10);
                     this.i12 = li32(this.i11 + 8);
                     si32(this.i12,this.i10 + 8);
                     this.i10 = this.i10 + -12;
                     this.i9 = this.i9 + 1;
                     if(uint(this.i11) > uint(this.i1))
                     {
                        continue;
                     }
                     break;
                  }
               }
               addr306:
               this.i1 = li32(this.i0 + 28);
               this.i5 = li32(this.i6);
               this.i1 = this.i1 - this.i5;
               if(this.i1 <= 12)
               {
                  this.i1 = li32(this.i0 + 44);
                  if(this.i1 >= 1)
                  {
                     mstate.esp = mstate.esp - 8;
                     this.i1 = this.i1 << 1;
                     si32(this.i0,mstate.esp);
                     si32(this.i1,mstate.esp + 4);
                     state = 3;
                     mstate.esp = mstate.esp - 4;
                     FSM_luaD_precall.start();
                     return;
                  }
                  mstate.esp = mstate.esp - 8;
                  this.i1 = this.i1 + 1;
                  si32(this.i0,mstate.esp);
                  si32(this.i1,mstate.esp + 4);
                  state = 4;
                  mstate.esp = mstate.esp - 4;
                  FSM_luaD_precall.start();
                  return;
               }
               addr429:
               this.i1 = li32(this.i6);
               this.i1 = this.i1 + 12;
               si32(this.i1,this.i6);
               this.i1 = li32(this.i8);
               this.f0 = lf64(this.i3);
               this.i1 = this.i1 + this.i4;
               sf64(this.f0,this.i1);
               this.i3 = li32(this.i7);
               si32(this.i3,this.i1 + 8);
               §§goto(addr479);
            case 2:
               mstate.esp = mstate.esp + 12;
               this.i5 = li32(this.i6);
               if(uint(this.i5) > uint(this.i1))
               {
                  §§goto(addr231);
               }
               §§goto(addr306);
            case 3:
               mstate.esp = mstate.esp + 8;
               §§goto(addr429);
            case 4:
               mstate.esp = mstate.esp + 8;
               §§goto(addr429);
            case 5:
               mstate.esp = mstate.esp + 8;
               §§goto(addr710);
            case 6:
               mstate.esp = mstate.esp + 8;
               §§goto(addr710);
            case 7:
               mstate.esp = mstate.esp + 4;
               this.i15 = li32(this.i16);
               this.i9 = li32(this.i15 + 12);
               this.i13 = li32(this.i15 + 16);
               mstate.esp = mstate.esp - 16;
               this.i18 = 0;
               si32(this.i13,mstate.esp);
               si32(this.i18,mstate.esp + 4);
               si32(this.i18,mstate.esp + 8);
               si32(this.i5,mstate.esp + 12);
               state = 8;
               mstate.esp = mstate.esp - 4;
               mstate.funcs[this.i9]();
               return;
            case 8:
               this.i5 = mstate.eax;
               mstate.esp = mstate.esp + 16;
               if(this.i5 == 0)
               {
                  this.i9 = 4;
                  mstate.esp = mstate.esp - 8;
                  si32(this.i0,mstate.esp);
                  si32(this.i9,mstate.esp + 4);
                  state = 9;
                  mstate.esp = mstate.esp - 4;
                  FSM_luaD_precall.start();
                  return;
               }
               addr1195:
               this.i9 = 5;
               this.i13 = li32(this.i15 + 68);
               this.i13 = this.i13 + 32;
               si32(this.i13,this.i15 + 68);
               this.i15 = li32(this.i16);
               this.i13 = li32(this.i15 + 28);
               si32(this.i13,this.i5);
               si32(this.i5,this.i15 + 28);
               this.i15 = li8(this.i15 + 20);
               this.i15 = this.i15 & 3;
               si8(this.i15,this.i5 + 5);
               si8(this.i9,this.i5 + 4);
               this.i15 = 0;
               si32(this.i15,this.i5 + 8);
               this.i9 = -1;
               si8(this.i9,this.i5 + 6);
               si32(this.i15,this.i5 + 12);
               si32(this.i15,this.i5 + 28);
               si8(this.i15,this.i5 + 7);
               this.i15 = FSM_luaD_precall;
               si32(this.i15,this.i5 + 16);
               this.i15 = this.i5 + 28;
               this.i9 = this.i5 + 12;
               this.i13 = this.i17 + 1;
               if(uint(this.i13) <= uint(357913941))
               {
                  this.i13 = 0;
                  this.i16 = li32(this.i16);
                  this.i18 = li32(this.i16 + 12);
                  this.i19 = li32(this.i16 + 16);
                  mstate.esp = mstate.esp - 16;
                  this.i20 = this.i17 * 12;
                  si32(this.i19,mstate.esp);
                  si32(this.i13,mstate.esp + 4);
                  si32(this.i13,mstate.esp + 8);
                  si32(this.i20,mstate.esp + 12);
                  state = 10;
                  mstate.esp = mstate.esp - 4;
                  mstate.funcs[this.i18]();
                  return;
               }
               this.i16 = FSM_luaD_precall;
               mstate.esp = mstate.esp - 8;
               si32(this.i0,mstate.esp);
               si32(this.i16,mstate.esp + 4);
               state = 12;
               mstate.esp = mstate.esp - 4;
               FSM_luaD_precall.start();
               return;
            case 9:
               mstate.esp = mstate.esp + 8;
               §§goto(addr1195);
            case 10:
               this.i13 = mstate.eax;
               mstate.esp = mstate.esp + 16;
               if(this.i13 == 0)
               {
                  if(this.i20 != 0)
                  {
                     this.i18 = 4;
                     mstate.esp = mstate.esp - 8;
                     si32(this.i0,mstate.esp);
                     si32(this.i18,mstate.esp + 4);
                     state = 11;
                     mstate.esp = mstate.esp - 4;
                     FSM_luaD_precall.start();
                     return;
                  }
               }
               addr1487:
               this.i18 = li32(this.i16 + 68);
               this.i18 = this.i20 + this.i18;
               si32(this.i18,this.i16 + 68);
               si32(this.i13,this.i9);
               this.i16 = li32(this.i15);
               addr1638:
               if(this.i16 < this.i17)
               {
                  addr1585:
                  this.i13 = this.i16 * 12;
                  this.i13 = this.i13 + 8;
                  while(true)
                  {
                     this.i18 = 0;
                     this.i19 = li32(this.i9);
                     this.i19 = this.i19 + this.i13;
                     si32(this.i18,this.i19);
                     this.i13 = this.i13 + 12;
                     this.i16 = this.i16 + 1;
                     if(this.i16 < this.i17)
                     {
                        continue;
                     }
                     break;
                  }
               }
               this.i16 = 1;
               si32(this.i17,this.i15);
               mstate.esp = mstate.esp - 12;
               si32(this.i0,mstate.esp);
               si32(this.i5,mstate.esp + 4);
               si32(this.i16,mstate.esp + 8);
               state = 13;
               mstate.esp = mstate.esp - 4;
               FSM_luaD_precall.start();
               return;
            case 11:
               mstate.esp = mstate.esp + 8;
               §§goto(addr1487);
            case 12:
               mstate.esp = mstate.esp + 8;
               this.i16 = 0;
               si32(this.i16,this.i9);
               this.i16 = li32(this.i15);
               if(this.i16 < this.i17)
               {
                  §§goto(addr1585);
               }
               §§goto(addr1638);
            case 13:
               mstate.esp = mstate.esp + 12;
               if(this.i17 > 0)
               {
                  addr1697:
                  this.i9 = mstate.ebp + -16;
                  this.i13 = this.i14 & 255;
                  this.i13 = this.i8 - this.i13;
                  this.i13 = this.i13 * -12;
                  this.i14 = 0;
                  this.i15 = this.i9 + 8;
                  addr1733:
                  while(true)
                  {
                     this.i16 = FSM_luaD_precall;
                     this.i18 = li32(this.i11);
                     mstate.esp = mstate.esp - 8;
                     this.i19 = this.i14 + 1;
                     si32(this.i5,mstate.esp);
                     si32(this.i19,mstate.esp + 4);
                     mstate.esp = mstate.esp - 4;
                     FSM_luaD_precall.start();
                  }
               }
               addr2545:
               this.i9 = FSM_luaD_precall;
               mstate.esp = mstate.esp - 12;
               this.i13 = 1;
               si32(this.i0,mstate.esp);
               si32(this.i9,mstate.esp + 4);
               si32(this.i13,mstate.esp + 8);
               state = 22;
               mstate.esp = mstate.esp - 4;
               FSM_luaD_precall.start();
               return;
            case 14:
               while(true)
               {
                  this.i20 = mstate.eax;
                  mstate.esp = mstate.esp + 8;
                  if(this.i20 != this.i16)
                  {
                     this.i19 = this.i20;
                     addr2492:
                     while(true)
                     {
                        this.i16 = this.i19;
                        this.i18 = this.i18 + this.i13;
                        this.f0 = lf64(this.i18);
                        sf64(this.f0,this.i16);
                        this.i18 = li32(this.i18 + 8);
                        si32(this.i18,this.i16 + 8);
                        this.i13 = this.i13 + 12;
                        this.i14 = this.i14 + 1;
                        if(this.i14 >= this.i17)
                        {
                           §§goto(addr2545);
                        }
                        else
                        {
                           §§goto(addr1733);
                        }
                     }
                  }
                  else
                  {
                     break;
                  }
               }
               this.i16 = 3;
               this.f0 = Number(this.i19);
               sf64(this.f0,this.i9);
               si32(this.i16,this.i15);
               mstate.esp = mstate.esp - 12;
               this.i19 = mstate.ebp + -16;
               si32(this.i0,mstate.esp);
               si32(this.i5,mstate.esp + 4);
               si32(this.i19,mstate.esp + 8);
               state = 21;
               mstate.esp = mstate.esp - 4;
               FSM_luaD_precall.start();
               return;
            case 15:
               this.i5 = mstate.eax;
               mstate.esp = mstate.esp + 16;
               if(this.i5 == 0)
               {
                  this.i9 = 4;
                  mstate.esp = mstate.esp - 8;
                  si32(this.i0,mstate.esp);
                  si32(this.i9,mstate.esp + 4);
                  state = 16;
                  mstate.esp = mstate.esp - 4;
                  FSM_luaD_precall.start();
                  return;
               }
               addr1922:
               this.i9 = 5;
               this.i13 = li32(this.i15);
               this.i13 = this.i13 + 32;
               si32(this.i13,this.i15);
               this.i13 = li32(this.i16);
               this.i15 = li32(this.i13 + 28);
               si32(this.i15,this.i5);
               si32(this.i5,this.i13 + 28);
               this.i13 = li8(this.i13 + 20);
               this.i13 = this.i13 & 3;
               si8(this.i13,this.i5 + 5);
               si8(this.i9,this.i5 + 4);
               this.i9 = 0;
               si32(this.i9,this.i5 + 8);
               this.i13 = -1;
               si8(this.i13,this.i5 + 6);
               si32(this.i9,this.i5 + 12);
               si32(this.i9,this.i5 + 28);
               si8(this.i9,this.i5 + 7);
               this.i9 = FSM_luaD_precall;
               si32(this.i9,this.i5 + 16);
               this.i9 = this.i5 + 28;
               this.i13 = this.i5 + 12;
               this.i15 = this.i17 + 1;
               if(uint(this.i15) <= uint(357913941))
               {
                  this.i15 = 0;
                  this.i16 = li32(this.i16);
                  this.i18 = li32(this.i16 + 12);
                  this.i19 = li32(this.i16 + 16);
                  mstate.esp = mstate.esp - 16;
                  this.i20 = this.i17 * 12;
                  si32(this.i19,mstate.esp);
                  si32(this.i15,mstate.esp + 4);
                  si32(this.i15,mstate.esp + 8);
                  si32(this.i20,mstate.esp + 12);
                  state = 17;
                  mstate.esp = mstate.esp - 4;
                  mstate.funcs[this.i18]();
                  return;
               }
               this.i15 = FSM_luaD_precall;
               mstate.esp = mstate.esp - 8;
               si32(this.i0,mstate.esp);
               si32(this.i15,mstate.esp + 4);
               state = 19;
               mstate.esp = mstate.esp - 4;
               FSM_luaD_precall.start();
               return;
            case 16:
               mstate.esp = mstate.esp + 8;
               §§goto(addr1922);
            case 17:
               this.i15 = mstate.eax;
               mstate.esp = mstate.esp + 16;
               if(this.i15 == 0)
               {
                  if(this.i20 != 0)
                  {
                     this.i18 = 4;
                     mstate.esp = mstate.esp - 8;
                     si32(this.i0,mstate.esp);
                     si32(this.i18,mstate.esp + 4);
                     state = 18;
                     mstate.esp = mstate.esp - 4;
                     FSM_luaD_precall.start();
                     return;
                  }
               }
               addr2210:
               this.i18 = li32(this.i16 + 68);
               this.i18 = this.i20 + this.i18;
               si32(this.i18,this.i16 + 68);
               si32(this.i15,this.i13);
               this.i15 = li32(this.i9);
               addr2361:
               if(this.i15 < this.i17)
               {
                  addr2308:
                  this.i16 = this.i15 * 12;
                  this.i16 = this.i16 + 8;
                  while(true)
                  {
                     this.i18 = 0;
                     this.i19 = li32(this.i13);
                     this.i19 = this.i19 + this.i16;
                     si32(this.i18,this.i19);
                     this.i16 = this.i16 + 12;
                     this.i15 = this.i15 + 1;
                     if(this.i15 < this.i17)
                     {
                        continue;
                     }
                     break;
                  }
               }
               this.i13 = 1;
               si32(this.i17,this.i9);
               mstate.esp = mstate.esp - 12;
               si32(this.i0,mstate.esp);
               si32(this.i5,mstate.esp + 4);
               si32(this.i13,mstate.esp + 8);
               state = 20;
               mstate.esp = mstate.esp - 4;
               FSM_luaD_precall.start();
               return;
            case 18:
               mstate.esp = mstate.esp + 8;
               §§goto(addr2210);
            case 19:
               mstate.esp = mstate.esp + 8;
               this.i15 = 0;
               si32(this.i15,this.i13);
               this.i15 = li32(this.i9);
               if(this.i15 < this.i17)
               {
                  §§goto(addr2308);
               }
               §§goto(addr2361);
            case 20:
               mstate.esp = mstate.esp + 12;
               if(this.i17 > 0)
               {
                  §§goto(addr1697);
               }
               §§goto(addr2545);
            case 21:
               this.i19 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               §§goto(addr2492);
            case 22:
               this.i9 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               mstate.esp = mstate.esp - 12;
               si32(this.i0,mstate.esp);
               si32(this.i5,mstate.esp + 4);
               si32(this.i9,mstate.esp + 8);
               state = 23;
               mstate.esp = mstate.esp - 4;
               FSM_luaD_precall.start();
               return;
            case 23:
               this.i9 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               this.f0 = Number(this.i17);
               sf64(this.f0,this.i9);
               this.i13 = 3;
               si32(this.i13,this.i9 + 8);
               this.i9 = li32(this.i11);
               if(this.i12 <= 0)
               {
                  this.i8 = this.i5;
                  this.i5 = this.i9;
               }
               else
               {
                  this.i13 = this.i9;
                  this.i14 = this.i5;
                  this.i5 = this.i9;
                  §§goto(addr2717);
               }
               §§goto(addr2819);
            case 24:
               mstate.esp = mstate.esp + 8;
               §§goto(addr2982);
            case 25:
               mstate.esp = mstate.esp + 8;
               this.i5 = li32(this.i8);
               if(this.i5 >= 20001)
               {
                  this.i5 = FSM_luaD_precall;
                  mstate.esp = mstate.esp - 8;
                  si32(this.i0,mstate.esp);
                  si32(this.i5,mstate.esp + 4);
                  state = 26;
                  mstate.esp = mstate.esp - 4;
                  FSM_luaD_precall.start();
                  return;
               }
               addr3076:
               this.i5 = li32(this.i7);
               this.i5 = this.i5 + 24;
               this.i8 = this.i5;
               §§goto(addr3091);
            case 26:
               mstate.esp = mstate.esp + 8;
               §§goto(addr3076);
            case 27:
               mstate.esp = mstate.esp + 12;
               this.i0 = li32(this.i6);
               this.i0 = this.i0 + -4;
               si32(this.i0,this.i6);
               addr3940:
               mstate.eax = this.i2;
               break;
            case 28:
               mstate.esp = mstate.esp + 8;
               §§goto(addr3486);
            case 29:
               mstate.esp = mstate.esp + 8;
               §§goto(addr3486);
            case 30:
               mstate.esp = mstate.esp + 8;
               this.i4 = li32(this.i5);
               if(this.i4 >= 20001)
               {
                  this.i4 = FSM_luaD_precall;
                  mstate.esp = mstate.esp - 8;
                  si32(this.i0,mstate.esp);
                  si32(this.i4,mstate.esp + 4);
                  state = 31;
                  mstate.esp = mstate.esp - 4;
                  FSM_luaD_precall.start();
                  return;
               }
               addr3639:
               this.i4 = li32(this.i7);
               this.i4 = this.i4 + 24;
               this.i5 = this.i4;
               §§goto(addr3665);
            case 31:
               mstate.esp = mstate.esp + 8;
               §§goto(addr3639);
            case 32:
               mstate.esp = mstate.esp + 12;
               §§goto(addr3800);
            case 33:
               this.i1 = mstate.eax;
               mstate.esp = mstate.esp + 4;
               if(this.i1 <= -1)
               {
                  this.i0 = 2;
                  §§goto(addr3267);
               }
               else
               {
                  this.i2 = 1;
                  this.i1 = 0 - this.i1;
                  this.i3 = li32(this.i6);
                  this.i1 = this.i1 * 12;
                  mstate.esp = mstate.esp - 8;
                  this.i1 = this.i3 + this.i1;
                  si32(this.i0,mstate.esp);
                  si32(this.i1,mstate.esp + 4);
                  state = 34;
                  mstate.esp = mstate.esp - 4;
                  FSM_luaD_precall.start();
                  return;
               }
            case 34:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               §§goto(addr3940);
         }
         mstate.esp = mstate.ebp;
         mstate.ebp = li32(mstate.esp);
         mstate.esp = mstate.esp + 4;
         mstate.esp = mstate.esp + 4;
         mstate.gworker = caller;
      }
   }
}
