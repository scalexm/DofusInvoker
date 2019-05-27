package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.lf64;
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.li8;
   import avm2.intrinsics.memory.sf64;
   import avm2.intrinsics.memory.si32;
   import avm2.intrinsics.memory.si8;
   
   public final class FSM_luaV_execute extends Machine
   {
      
      public static const intRegCount:int = 32;
      
      public static const NumberRegCount:int = 5;
       
      
      public var i21:int;
      
      public var i30:int;
      
      public var i31:int;
      
      public var f0:Number;
      
      public var f1:Number;
      
      public var f3:Number;
      
      public var f2:Number;
      
      public var f4:Number;
      
      public var i10:int;
      
      public var i11:int;
      
      public var i12:int;
      
      public var i13:int;
      
      public var i14:int;
      
      public var i15:int;
      
      public var i17:int;
      
      public var i19:int;
      
      public var i16:int;
      
      public var i18:int;
      
      public var i0:int;
      
      public var i1:int;
      
      public var i22:int;
      
      public var i3:int;
      
      public var i4:int;
      
      public var i5:int;
      
      public var i6:int;
      
      public var i7:int;
      
      public var i8:int;
      
      public var i2:int;
      
      public var i23:int;
      
      public var i24:int;
      
      public var i25:int;
      
      public var i26:int;
      
      public var i27:int;
      
      public var i20:int;
      
      public var i9:int;
      
      public var i28:int;
      
      public var i29:int;
      
      public function FSM_luaV_execute()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM_luaV_execute = null;
         _loc1_ = new FSM_luaV_execute();
         FSM_luaV_execute.gworker = _loc1_;
      }
      
      override public final function work() : void
      {
         switch(state)
         {
            case 0:
               mstate.esp = mstate.esp - 4;
               si32(mstate.ebp,mstate.esp);
               mstate.ebp = mstate.esp;
               mstate.esp = mstate.esp - 172;
               this.i0 = mstate.ebp + -16;
               this.i1 = li32(mstate.ebp + 8);
               this.i2 = mstate.ebp + -80;
               si32(this.i2,mstate.ebp + -99);
               this.i2 = mstate.ebp + -64;
               si32(this.i2,mstate.ebp + -117);
               this.i2 = li32(mstate.ebp + 12);
               this.i3 = this.i1 + 44;
               si32(this.i3,mstate.ebp + -108);
               this.i3 = this.i0 + 8;
               this.i4 = this.i1 + 32;
               si32(this.i4,mstate.ebp + -171);
               this.i4 = this.i1 + 96;
               this.i5 = this.i1 + 28;
               this.i6 = this.i1 + 8;
               this.i7 = this.i1 + 16;
               this.i8 = li32(mstate.ebp + -99);
               this.i8 = this.i8 + 8;
               si32(this.i8,mstate.ebp + -126);
               this.i8 = li32(mstate.ebp + -117);
               this.i8 = this.i8 + 8;
               si32(this.i8,mstate.ebp + -135);
               this.i8 = this.i1 + 6;
               si32(this.i8,mstate.ebp + -144);
               this.i8 = this.i1 + 60;
               si32(this.i8,mstate.ebp + -153);
               this.i8 = this.i1 + 64;
               this.i9 = this.i1 + 56;
               si32(this.i9,mstate.ebp + -162);
               this.i9 = this.i1 + 12;
               this.i10 = this.i1 + 20;
               this.i11 = this.i1 + 24;
               addr233:
               si32(this.i2,mstate.ebp + -90);
               addr242:
               this.i2 = li32(this.i10);
               this.i2 = li32(this.i2 + 4);
               this.i2 = li32(this.i2);
               this.i12 = li32(this.i2 + 16);
               this.i13 = li32(this.i11);
               this.i14 = li32(this.i9);
               this.i12 = li32(this.i12 + 8);
               this.i15 = this.i2 + 12;
               this.i16 = this.i2 + 16;
               loop0:
               while(true)
               {
                  this.i17 = li32(mstate.ebp + -162);
                  this.i17 = li8(this.i17);
                  this.i18 = li32(this.i13);
                  this.i19 = this.i13 + 4;
                  this.i20 = this.i13;
                  this.i21 = this.i17 & 12;
                  if(this.i21 != 0)
                  {
                     this.i21 = li32(this.i8);
                     this.i21 = this.i21 + -1;
                     si32(this.i21,this.i8);
                     if(this.i21 != 0)
                     {
                        this.i22 = this.i17 & 4;
                        if(this.i22 != 0)
                        {
                        }
                     }
                     this.i14 = li32(this.i11);
                     si32(this.i19,this.i11);
                     this.i21 = this.i21 != 0?1:0;
                     this.i22 = this.i17 & 8;
                     if(this.i22 != 0)
                     {
                        this.i21 = this.i21 & 1;
                        if(this.i21 == 0)
                        {
                           this.i21 = -1;
                           this.i22 = li32(mstate.ebp + -153);
                           this.i22 = li32(this.i22);
                           si32(this.i22,this.i8);
                           mstate.esp = mstate.esp - 12;
                           this.i22 = 3;
                           si32(this.i1,mstate.esp);
                           si32(this.i22,mstate.esp + 4);
                           si32(this.i21,mstate.esp + 8);
                           state = 1;
                           mstate.esp = mstate.esp - 4;
                           FSM_luaV_execute.start();
                           return;
                        }
                     }
                     addr480:
                     while(true)
                     {
                        this.i17 = this.i17 & 4;
                        if(this.i17 != 0)
                        {
                           this.i17 = li32(this.i10);
                           this.i17 = li32(this.i17 + 4);
                           this.i17 = li32(this.i17);
                           this.i17 = li32(this.i17 + 16);
                           this.i21 = li32(this.i17 + 12);
                           this.i17 = li32(this.i17 + 20);
                           this.i22 = this.i19 - this.i21;
                           this.i22 = this.i22 >> 2;
                           if(this.i17 == 0)
                           {
                              this.i23 = 0;
                           }
                           else
                           {
                              this.i23 = this.i22 << 2;
                              this.i23 = this.i23 + this.i17;
                              this.i23 = li32(this.i23 + -4);
                           }
                           if(this.i22 != 1)
                           {
                              if(uint(this.i19) > uint(this.i14))
                              {
                                 if(this.i17 == 0)
                                 {
                                    this.i14 = 0;
                                 }
                                 else
                                 {
                                    this.i14 = this.i14 - this.i21;
                                    this.i14 = this.i14 & -4;
                                    this.i14 = this.i14 + this.i17;
                                    this.i14 = li32(this.i14 + -4);
                                 }
                                 if(this.i14 != this.i23)
                                 {
                                 }
                              }
                           }
                           this.i14 = 2;
                           mstate.esp = mstate.esp - 12;
                           si32(this.i1,mstate.esp);
                           si32(this.i14,mstate.esp + 4);
                           si32(this.i23,mstate.esp + 8);
                           state = 2;
                           mstate.esp = mstate.esp - 4;
                           FSM_luaV_execute.start();
                           return;
                        }
                        addr677:
                        while(true)
                        {
                           this.i14 = li32(mstate.ebp + -144);
                           this.i14 = li8(this.i14);
                           if(this.i14 == 1)
                           {
                              si32(this.i13,this.i11);
                              addr702:
                              mstate.esp = mstate.ebp;
                              mstate.ebp = li32(mstate.esp);
                              mstate.esp = mstate.esp + 4;
                              mstate.esp = mstate.esp + 4;
                              mstate.gworker = caller;
                              return;
                           }
                           this.i14 = li32(this.i9);
                        }
                     }
                  }
                  while(true)
                  {
                     this.i17 = this.i18 >>> 6;
                     this.i17 = this.i17 & 255;
                     this.i21 = this.i17 * 12;
                     this.i22 = this.i18 & 63;
                     this.i21 = this.i14 + this.i21;
                     this.i23 = this.i14;
                     if(this.i22 <= 18)
                     {
                        if(this.i22 <= 8)
                        {
                           if(this.i22 <= 3)
                           {
                              if(this.i22 <= 1)
                              {
                                 if(this.i22 != 0)
                                 {
                                    if(this.i22 == 1)
                                    {
                                       this.i13 = this.i18 >>> 14;
                                       this.i13 = this.i13 * 12;
                                       this.i17 = this.i17 * 12;
                                       this.i13 = this.i12 + this.i13;
                                       this.f0 = lf64(this.i13);
                                       this.i17 = this.i14 + this.i17;
                                       sf64(this.f0,this.i17);
                                       this.i13 = li32(this.i13 + 8);
                                       si32(this.i13,this.i17 + 8);
                                       this.i13 = this.i19;
                                    }
                                 }
                                 else
                                 {
                                    this.i13 = this.i18 >>> 23;
                                    this.i13 = this.i13 * 12;
                                    this.i17 = this.i17 * 12;
                                    this.i13 = this.i14 + this.i13;
                                    this.f0 = lf64(this.i13);
                                    this.i17 = this.i14 + this.i17;
                                    sf64(this.f0,this.i17);
                                    this.i13 = li32(this.i13 + 8);
                                    si32(this.i13,this.i17 + 8);
                                    this.i13 = this.i19;
                                 }
                              }
                              else if(this.i22 != 2)
                              {
                                 if(this.i22 == 3)
                                 {
                                    this.i13 = 0;
                                    this.i18 = this.i18 >>> 23;
                                    this.i20 = this.i18 * 12;
                                    this.i20 = this.i14 + this.i20;
                                    si32(this.i13,this.i20 + 8);
                                    this.i13 = this.i18 + -1;
                                    if(this.i13 >= this.i17)
                                    {
                                       this.i20 = 0;
                                       this.i18 = this.i18 * 12;
                                       this.i18 = this.i23 + this.i18;
                                       this.i18 = this.i18 + -4;
                                       while(true)
                                       {
                                          this.i21 = 0;
                                          si32(this.i21,this.i18);
                                          this.i18 = this.i18 + -12;
                                          this.i21 = this.i20 + 1;
                                          this.i20 = this.i20 ^ -1;
                                          this.i20 = this.i13 + this.i20;
                                          if(this.i20 >= this.i17)
                                          {
                                             this.i20 = this.i21;
                                             continue;
                                          }
                                          break;
                                       }
                                    }
                                 }
                              }
                              else
                              {
                                 this.i20 = 1;
                                 this.i17 = this.i17 * 12;
                                 this.i23 = this.i18 >>> 23;
                                 si32(this.i23,this.i21);
                                 this.i17 = this.i14 + this.i17;
                                 si32(this.i20,this.i17 + 8);
                                 this.i17 = this.i18 & 8372224;
                                 if(this.i17 != 0)
                                 {
                                    this.i13 = this.i13 + 8;
                                 }
                              }
                           }
                           else if(this.i22 <= 5)
                           {
                              if(this.i22 != 4)
                              {
                                 if(this.i22 == 5)
                                 {
                                    this.i13 = 5;
                                    this.i14 = li32(this.i15);
                                    this.i17 = li32(mstate.ebp + -117);
                                    si32(this.i14,this.i17);
                                    this.i14 = this.i18 >>> 14;
                                    this.i17 = li32(mstate.ebp + -135);
                                    si32(this.i13,this.i17);
                                    si32(this.i19,this.i11);
                                    this.i13 = this.i14 * 12;
                                    mstate.esp = mstate.esp - 16;
                                    this.i14 = mstate.ebp + -64;
                                    this.i13 = this.i12 + this.i13;
                                    si32(this.i1,mstate.esp);
                                    si32(this.i14,mstate.esp + 4);
                                    si32(this.i13,mstate.esp + 8);
                                    si32(this.i21,mstate.esp + 12);
                                    state = 3;
                                    mstate.esp = mstate.esp - 4;
                                    FSM_luaV_execute.start();
                                    return;
                                 }
                              }
                              else
                              {
                                 this.i13 = this.i18 & -8388608;
                                 this.i13 = this.i13 >>> 21;
                                 this.i13 = this.i2 + this.i13;
                                 this.i13 = li32(this.i13 + 20);
                                 this.i13 = li32(this.i13 + 8);
                                 this.f0 = lf64(this.i13);
                                 this.i17 = this.i17 * 12;
                                 this.i17 = this.i14 + this.i17;
                                 sf64(this.f0,this.i17);
                                 this.i13 = li32(this.i13 + 8);
                                 si32(this.i13,this.i17 + 8);
                                 this.i13 = this.i19;
                              }
                           }
                           else if(this.i22 != 6)
                           {
                              if(this.i22 != 7)
                              {
                                 if(this.i22 == 8)
                                 {
                                    this.i13 = this.i18 & -8388608;
                                    this.i13 = this.i13 >>> 21;
                                    this.i13 = this.i2 + this.i13;
                                    this.i17 = this.i17 * 12;
                                    this.i13 = li32(this.i13 + 20);
                                    this.i17 = this.i14 + this.i17;
                                    this.i18 = li32(this.i13 + 8);
                                    this.f0 = lf64(this.i17);
                                    sf64(this.f0,this.i18);
                                    this.i20 = li32(this.i17 + 8);
                                    si32(this.i20,this.i18 + 8);
                                    this.i17 = li32(this.i17 + 8);
                                    if(this.i17 >= 4)
                                    {
                                       this.i17 = li32(this.i21);
                                       this.i18 = li8(this.i17 + 5);
                                       this.i18 = this.i18 & 3;
                                       if(this.i18 != 0)
                                       {
                                          this.i18 = li8(this.i13 + 5);
                                          this.i13 = this.i13 + 5;
                                          this.i20 = this.i18 & 4;
                                          if(this.i20 != 0)
                                          {
                                             this.i20 = li32(this.i7);
                                             this.i21 = li8(this.i20 + 21);
                                             if(this.i21 == 1)
                                             {
                                                mstate.esp = mstate.esp - 8;
                                                si32(this.i20,mstate.esp);
                                                si32(this.i17,mstate.esp + 4);
                                                mstate.esp = mstate.esp - 4;
                                                FSM_luaV_execute.start();
                                             }
                                             else
                                             {
                                                this.i17 = li8(this.i20 + 20);
                                                this.i18 = this.i18 & -8;
                                                this.i17 = this.i17 & 3;
                                                this.i17 = this.i17 | this.i18;
                                                si8(this.i17,this.i13);
                                                this.i13 = this.i19;
                                             }
                                          }
                                       }
                                    }
                                 }
                              }
                              else
                              {
                                 this.i13 = 5;
                                 this.i14 = li32(this.i15);
                                 this.i17 = li32(mstate.ebp + -99);
                                 si32(this.i14,this.i17);
                                 this.i14 = this.i18 >>> 14;
                                 this.i17 = li32(mstate.ebp + -126);
                                 si32(this.i13,this.i17);
                                 si32(this.i19,this.i11);
                                 this.i13 = this.i14 * 12;
                                 mstate.esp = mstate.esp - 16;
                                 this.i14 = mstate.ebp + -80;
                                 this.i13 = this.i12 + this.i13;
                                 si32(this.i1,mstate.esp);
                                 si32(this.i14,mstate.esp + 4);
                                 si32(this.i13,mstate.esp + 8);
                                 si32(this.i21,mstate.esp + 12);
                                 state = 12;
                                 mstate.esp = mstate.esp - 4;
                                 FSM_luaV_execute.start();
                                 return;
                              }
                           }
                           else
                           {
                              this.i13 = this.i18 >>> 23;
                              this.i13 = this.i13 * 12;
                              si32(this.i19,this.i11);
                              this.i13 = this.i14 + this.i13;
                              this.i17 = this.i18 >>> 14;
                              this.i18 = this.i18 & 4194304;
                              if(this.i18 != 0)
                              {
                                 this.i14 = this.i17 & 255;
                                 this.i14 = this.i14 * 12;
                                 mstate.esp = mstate.esp - 16;
                                 this.i14 = this.i12 + this.i14;
                                 si32(this.i1,mstate.esp);
                                 si32(this.i13,mstate.esp + 4);
                                 si32(this.i14,mstate.esp + 8);
                                 si32(this.i21,mstate.esp + 12);
                                 state = 10;
                                 mstate.esp = mstate.esp - 4;
                                 FSM_luaV_execute.start();
                                 return;
                              }
                              this.i17 = this.i17 & 511;
                              this.i17 = this.i17 * 12;
                              mstate.esp = mstate.esp - 16;
                              this.i14 = this.i14 + this.i17;
                              si32(this.i1,mstate.esp);
                              si32(this.i13,mstate.esp + 4);
                              si32(this.i14,mstate.esp + 8);
                              si32(this.i21,mstate.esp + 12);
                              state = 11;
                              mstate.esp = mstate.esp - 4;
                              FSM_luaV_execute.start();
                              return;
                           }
                           addr2522:
                           this.i13 = this.i19;
                        }
                        else if(this.i22 <= 13)
                        {
                           if(this.i22 <= 10)
                           {
                              if(this.i22 != 9)
                              {
                                 if(this.i22 != 10)
                                 {
                                    §§goto(addr2522);
                                 }
                                 else
                                 {
                                    this.i13 = this.i18 >>> 14;
                                    this.i13 = this.i13 & 511;
                                    this.i20 = this.i13 >>> 3;
                                    this.i20 = this.i20 & 31;
                                    this.i23 = this.i18 >>> 23;
                                    if(this.i20 != 0)
                                    {
                                       this.i13 = this.i13 | 8;
                                       this.i20 = this.i20 + -1;
                                       this.i13 = this.i13 & 15;
                                       this.i13 = this.i13 << this.i20;
                                    }
                                    this.i18 = this.i18 >>> 26;
                                    this.i18 = this.i18 & 31;
                                    if(this.i18 == 0)
                                    {
                                       this.i18 = this.i23;
                                    }
                                    else
                                    {
                                       this.i20 = this.i23 | 8;
                                       this.i18 = this.i18 + -1;
                                       this.i20 = this.i20 & 15;
                                       this.i18 = this.i20 << this.i18;
                                    }
                                    this.i20 = 32;
                                    mstate.esp = mstate.esp - 16;
                                    this.i23 = 0;
                                    si32(this.i1,mstate.esp);
                                    si32(this.i23,mstate.esp + 4);
                                    si32(this.i23,mstate.esp + 8);
                                    si32(this.i20,mstate.esp + 12);
                                    state = 15;
                                    mstate.esp = mstate.esp - 4;
                                    FSM_luaV_execute.start();
                                    return;
                                 }
                              }
                              else
                              {
                                 si32(this.i19,this.i11);
                                 this.i13 = this.i18 >>> 23;
                                 this.i17 = this.i18 >>> 31;
                                 this.i20 = this.i18 >>> 14;
                                 this.i18 = this.i18 & 4194304;
                                 if(this.i18 != 0)
                                 {
                                    this.i20 = this.i20 & 255;
                                    this.i20 = this.i20 * 12;
                                    this.i20 = this.i12 + this.i20;
                                    this.i17 = this.i17 & 255;
                                    if(this.i17 == 0)
                                    {
                                       addr3255:
                                       this.i17 = this.i20;
                                       this.i13 = this.i13 * 12;
                                       mstate.esp = mstate.esp - 16;
                                       this.i13 = this.i14 + this.i13;
                                       si32(this.i1,mstate.esp);
                                       si32(this.i21,mstate.esp + 4);
                                       si32(this.i13,mstate.esp + 8);
                                       si32(this.i17,mstate.esp + 12);
                                       state = 14;
                                       mstate.esp = mstate.esp - 4;
                                       FSM_luaV_execute.start();
                                       return;
                                    }
                                 }
                                 else
                                 {
                                    this.i20 = this.i20 & 511;
                                    this.i20 = this.i20 * 12;
                                    this.i20 = this.i14 + this.i20;
                                    this.i17 = this.i17 & 255;
                                    if(this.i17 == 0)
                                    {
                                       §§goto(addr3255);
                                    }
                                 }
                                 this.i14 = this.i20;
                                 this.i13 = this.i13 & 255;
                                 this.i13 = this.i13 * 12;
                                 mstate.esp = mstate.esp - 16;
                                 this.i13 = this.i12 + this.i13;
                                 si32(this.i1,mstate.esp);
                                 si32(this.i21,mstate.esp + 4);
                                 si32(this.i13,mstate.esp + 8);
                                 si32(this.i14,mstate.esp + 12);
                                 state = 13;
                                 mstate.esp = mstate.esp - 4;
                                 FSM_luaV_execute.start();
                                 return;
                              }
                           }
                           else if(this.i22 != 11)
                           {
                              if(this.i22 != 12)
                              {
                                 if(this.i22 != 13)
                                 {
                                    §§goto(addr2522);
                                 }
                                 else
                                 {
                                    this.i13 = this.i18 >>> 14;
                                    this.i20 = this.i18 & 4194304;
                                    this.i23 = this.i18 >>> 23;
                                    this.i18 = this.i18 >>> 31;
                                    if(this.i18 != 0)
                                    {
                                       this.i23 = this.i23 & 255;
                                       this.i23 = this.i23 * 12;
                                       this.i23 = this.i12 + this.i23;
                                       if(this.i20 == 0)
                                       {
                                          addr4302:
                                          this.i13 = this.i13 & 511;
                                          this.i13 = this.i13 * 12;
                                          this.i18 = li32(this.i23 + 8);
                                          this.i13 = this.i14 + this.i13;
                                          if(this.i18 == 3)
                                          {
                                             addr4288:
                                             this.i18 = li32(this.i13 + 8);
                                             if(this.i18 == 3)
                                             {
                                                this.i18 = 3;
                                                this.f0 = lf64(this.i23);
                                                this.f1 = lf64(this.i13);
                                                this.i13 = this.i17 * 12;
                                                this.i13 = this.i14 + this.i13;
                                                this.f0 = this.f0 - this.f1;
                                                sf64(this.f0,this.i13);
                                                si32(this.i18,this.i13 + 8);
                                                this.i13 = this.i19;
                                             }
                                          }
                                       }
                                       addr4333:
                                       this.i14 = this.i23;
                                       this.i17 = 6;
                                       si32(this.i19,this.i11);
                                       mstate.esp = mstate.esp - 20;
                                       si32(this.i1,mstate.esp);
                                       si32(this.i21,mstate.esp + 4);
                                       si32(this.i14,mstate.esp + 8);
                                       si32(this.i13,mstate.esp + 12);
                                       si32(this.i17,mstate.esp + 16);
                                       state = 22;
                                       mstate.esp = mstate.esp - 4;
                                       FSM_luaV_execute.start();
                                       return;
                                    }
                                    this.i23 = this.i23 * 12;
                                    this.i23 = this.i14 + this.i23;
                                    if(this.i20 == 0)
                                    {
                                       §§goto(addr4302);
                                    }
                                    §§goto(addr4333);
                                    this.i13 = this.i13 & 255;
                                    this.i13 = this.i13 * 12;
                                    this.i18 = li32(this.i23 + 8);
                                    this.i13 = this.i12 + this.i13;
                                    if(this.i18 == 3)
                                    {
                                       §§goto(addr4288);
                                    }
                                    §§goto(addr4333);
                                 }
                              }
                              else
                              {
                                 this.i13 = this.i18 >>> 14;
                                 this.i20 = this.i18 & 4194304;
                                 this.i23 = this.i18 >>> 23;
                                 this.i18 = this.i18 >>> 31;
                                 if(this.i18 != 0)
                                 {
                                    this.i23 = this.i23 & 255;
                                    this.i23 = this.i23 * 12;
                                    this.i23 = this.i12 + this.i23;
                                    if(this.i20 == 0)
                                    {
                                       addr4126:
                                       this.i13 = this.i13 & 511;
                                       this.i13 = this.i13 * 12;
                                       this.i18 = li32(this.i23 + 8);
                                       this.i13 = this.i14 + this.i13;
                                       if(this.i18 == 3)
                                       {
                                          addr4112:
                                          this.i18 = li32(this.i13 + 8);
                                          if(this.i18 == 3)
                                          {
                                             this.i18 = 3;
                                             this.f0 = lf64(this.i23);
                                             this.f1 = lf64(this.i13);
                                             this.i13 = this.i17 * 12;
                                             this.i13 = this.i14 + this.i13;
                                             this.f0 = this.f0 + this.f1;
                                             sf64(this.f0,this.i13);
                                             si32(this.i18,this.i13 + 8);
                                             this.i13 = this.i19;
                                          }
                                       }
                                    }
                                    addr4157:
                                    this.i14 = this.i23;
                                    this.i17 = 5;
                                    si32(this.i19,this.i11);
                                    mstate.esp = mstate.esp - 20;
                                    si32(this.i1,mstate.esp);
                                    si32(this.i21,mstate.esp + 4);
                                    si32(this.i14,mstate.esp + 8);
                                    si32(this.i13,mstate.esp + 12);
                                    si32(this.i17,mstate.esp + 16);
                                    state = 21;
                                    mstate.esp = mstate.esp - 4;
                                    FSM_luaV_execute.start();
                                    return;
                                 }
                                 this.i23 = this.i23 * 12;
                                 this.i23 = this.i14 + this.i23;
                                 if(this.i20 == 0)
                                 {
                                    §§goto(addr4126);
                                 }
                                 §§goto(addr4157);
                                 this.i13 = this.i13 & 255;
                                 this.i13 = this.i13 * 12;
                                 this.i18 = li32(this.i23 + 8);
                                 this.i13 = this.i12 + this.i13;
                                 if(this.i18 == 3)
                                 {
                                    §§goto(addr4112);
                                 }
                                 §§goto(addr4157);
                              }
                           }
                           else
                           {
                              this.i13 = this.i18 >>> 23;
                              this.i13 = this.i13 * 12;
                              this.i17 = this.i17 * 12;
                              this.i13 = this.i14 + this.i13;
                              this.f0 = lf64(this.i13);
                              this.i17 = this.i17 + this.i14;
                              sf64(this.f0,this.i17 + 12);
                              this.i20 = li32(this.i13 + 8);
                              si32(this.i20,this.i17 + 20);
                              si32(this.i19,this.i11);
                              this.i17 = this.i18 >>> 14;
                              this.i18 = this.i18 & 4194304;
                              if(this.i18 != 0)
                              {
                                 this.i14 = this.i17 & 255;
                                 this.i14 = this.i14 * 12;
                                 mstate.esp = mstate.esp - 16;
                                 this.i14 = this.i12 + this.i14;
                                 si32(this.i1,mstate.esp);
                                 si32(this.i13,mstate.esp + 4);
                                 si32(this.i14,mstate.esp + 8);
                                 si32(this.i21,mstate.esp + 12);
                                 state = 19;
                                 mstate.esp = mstate.esp - 4;
                                 FSM_luaV_execute.start();
                                 return;
                              }
                              this.i17 = this.i17 & 511;
                              this.i17 = this.i17 * 12;
                              mstate.esp = mstate.esp - 16;
                              this.i14 = this.i14 + this.i17;
                              si32(this.i1,mstate.esp);
                              si32(this.i13,mstate.esp + 4);
                              si32(this.i14,mstate.esp + 8);
                              si32(this.i21,mstate.esp + 12);
                              state = 20;
                              mstate.esp = mstate.esp - 4;
                              FSM_luaV_execute.start();
                              return;
                           }
                        }
                        else if(this.i22 <= 15)
                        {
                           if(this.i22 != 14)
                           {
                              if(this.i22 != 15)
                              {
                                 §§goto(addr2522);
                              }
                              else
                              {
                                 this.i13 = this.i18 >>> 14;
                                 this.i20 = this.i18 & 4194304;
                                 this.i23 = this.i18 >>> 23;
                                 this.i18 = this.i18 >>> 31;
                                 if(this.i18 != 0)
                                 {
                                    this.i23 = this.i23 & 255;
                                    this.i23 = this.i23 * 12;
                                    this.i23 = this.i12 + this.i23;
                                    if(this.i20 == 0)
                                    {
                                       addr4708:
                                       this.i13 = this.i13 & 511;
                                       this.i13 = this.i13 * 12;
                                       this.i18 = li32(this.i23 + 8);
                                       this.i13 = this.i14 + this.i13;
                                       if(this.i18 == 3)
                                       {
                                          addr4694:
                                          this.i18 = li32(this.i13 + 8);
                                          if(this.i18 == 3)
                                          {
                                             this.i18 = 3;
                                             this.f0 = lf64(this.i23);
                                             this.f1 = lf64(this.i13);
                                             this.i13 = this.i17 * 12;
                                             this.i13 = this.i14 + this.i13;
                                             this.f0 = this.f0 / this.f1;
                                             sf64(this.f0,this.i13);
                                             si32(this.i18,this.i13 + 8);
                                             this.i13 = this.i19;
                                          }
                                       }
                                    }
                                    addr4739:
                                    this.i14 = this.i23;
                                    this.i17 = 8;
                                    si32(this.i19,this.i11);
                                    mstate.esp = mstate.esp - 20;
                                    si32(this.i1,mstate.esp);
                                    si32(this.i21,mstate.esp + 4);
                                    si32(this.i14,mstate.esp + 8);
                                    si32(this.i13,mstate.esp + 12);
                                    si32(this.i17,mstate.esp + 16);
                                    state = 24;
                                    mstate.esp = mstate.esp - 4;
                                    FSM_luaV_execute.start();
                                    return;
                                 }
                                 this.i23 = this.i23 * 12;
                                 this.i23 = this.i14 + this.i23;
                                 if(this.i20 == 0)
                                 {
                                    §§goto(addr4708);
                                 }
                                 §§goto(addr4739);
                                 this.i13 = this.i13 & 255;
                                 this.i13 = this.i13 * 12;
                                 this.i18 = li32(this.i23 + 8);
                                 this.i13 = this.i12 + this.i13;
                                 if(this.i18 == 3)
                                 {
                                    §§goto(addr4694);
                                 }
                                 §§goto(addr4739);
                              }
                           }
                           else
                           {
                              this.i13 = this.i18 >>> 14;
                              this.i20 = this.i18 & 4194304;
                              this.i23 = this.i18 >>> 23;
                              this.i18 = this.i18 >>> 31;
                              if(this.i18 != 0)
                              {
                                 this.i23 = this.i23 & 255;
                                 this.i23 = this.i23 * 12;
                                 this.i23 = this.i12 + this.i23;
                                 if(this.i20 == 0)
                                 {
                                    addr4532:
                                    this.i13 = this.i13 & 511;
                                    this.i13 = this.i13 * 12;
                                    this.i18 = li32(this.i23 + 8);
                                    this.i13 = this.i14 + this.i13;
                                    if(this.i18 == 3)
                                    {
                                       addr4518:
                                       this.i18 = li32(this.i13 + 8);
                                       if(this.i18 == 3)
                                       {
                                          this.i18 = 3;
                                          this.f0 = lf64(this.i23);
                                          this.f1 = lf64(this.i13);
                                          this.i13 = this.i17 * 12;
                                          this.i13 = this.i14 + this.i13;
                                          this.f0 = this.f0 * this.f1;
                                          sf64(this.f0,this.i13);
                                          si32(this.i18,this.i13 + 8);
                                          this.i13 = this.i19;
                                       }
                                    }
                                 }
                                 addr4563:
                                 this.i14 = this.i23;
                                 this.i17 = 7;
                                 si32(this.i19,this.i11);
                                 mstate.esp = mstate.esp - 20;
                                 si32(this.i1,mstate.esp);
                                 si32(this.i21,mstate.esp + 4);
                                 si32(this.i14,mstate.esp + 8);
                                 si32(this.i13,mstate.esp + 12);
                                 si32(this.i17,mstate.esp + 16);
                                 state = 23;
                                 mstate.esp = mstate.esp - 4;
                                 FSM_luaV_execute.start();
                                 return;
                              }
                              this.i23 = this.i23 * 12;
                              this.i23 = this.i14 + this.i23;
                              if(this.i20 == 0)
                              {
                                 §§goto(addr4532);
                              }
                              §§goto(addr4563);
                              this.i13 = this.i13 & 255;
                              this.i13 = this.i13 * 12;
                              this.i18 = li32(this.i23 + 8);
                              this.i13 = this.i12 + this.i13;
                              if(this.i18 == 3)
                              {
                                 §§goto(addr4518);
                              }
                              §§goto(addr4563);
                           }
                        }
                        else if(this.i22 != 16)
                        {
                           if(this.i22 != 17)
                           {
                              if(this.i22 != 18)
                              {
                                 §§goto(addr2522);
                              }
                              else
                              {
                                 this.i13 = this.i18 >>> 23;
                                 this.i18 = this.i13 * 12;
                                 this.i18 = this.i14 + this.i18;
                                 this.i20 = li32(this.i18 + 8);
                                 if(this.i20 == 3)
                                 {
                                    this.i18 = 3;
                                    this.i13 = this.i13 * 12;
                                    this.i13 = this.i14 + this.i13;
                                    this.f0 = lf64(this.i13);
                                    this.i13 = this.i17 * 12;
                                    this.i13 = this.i14 + this.i13;
                                    this.f0 = -this.f0;
                                    sf64(this.f0,this.i13);
                                    si32(this.i18,this.i13 + 8);
                                    this.i13 = this.i19;
                                 }
                                 else
                                 {
                                    this.i13 = 11;
                                    si32(this.i19,this.i11);
                                    mstate.esp = mstate.esp - 20;
                                    si32(this.i1,mstate.esp);
                                    si32(this.i21,mstate.esp + 4);
                                    si32(this.i18,mstate.esp + 8);
                                    si32(this.i18,mstate.esp + 12);
                                    si32(this.i13,mstate.esp + 16);
                                    state = 27;
                                    mstate.esp = mstate.esp - 4;
                                    FSM_luaV_execute.start();
                                    return;
                                 }
                              }
                           }
                           else
                           {
                              this.i13 = this.i18 >>> 14;
                              this.i20 = this.i18 & 4194304;
                              this.i23 = this.i18 >>> 23;
                              this.i18 = this.i18 >>> 31;
                              if(this.i18 != 0)
                              {
                                 this.i23 = this.i23 & 255;
                                 this.i23 = this.i23 * 12;
                                 this.i23 = this.i12 + this.i23;
                                 if(this.i20 == 0)
                                 {
                                    addr5168:
                                    this.i13 = this.i13 & 511;
                                    this.i13 = this.i13 * 12;
                                    this.i18 = li32(this.i23 + 8);
                                    this.i13 = this.i14 + this.i13;
                                    if(this.i18 == 3)
                                    {
                                       addr5154:
                                       this.i18 = li32(this.i13 + 8);
                                       if(this.i18 == 3)
                                       {
                                          this.i18 = 3;
                                          this.f0 = lf64(this.i23);
                                          this.f1 = lf64(this.i13);
                                          this.i13 = this.i17 * 12;
                                          this.i13 = this.i14 + this.i13;
                                          this.f0 = Math.pow(this.f0,this.f1);
                                          sf64(this.f0,this.i13);
                                          si32(this.i18,this.i13 + 8);
                                          this.i13 = this.i19;
                                       }
                                    }
                                 }
                                 addr5199:
                                 this.i14 = this.i23;
                                 this.i17 = 10;
                                 si32(this.i19,this.i11);
                                 mstate.esp = mstate.esp - 20;
                                 si32(this.i1,mstate.esp);
                                 si32(this.i21,mstate.esp + 4);
                                 si32(this.i14,mstate.esp + 8);
                                 si32(this.i13,mstate.esp + 12);
                                 si32(this.i17,mstate.esp + 16);
                                 state = 26;
                                 mstate.esp = mstate.esp - 4;
                                 FSM_luaV_execute.start();
                                 return;
                              }
                              this.i23 = this.i23 * 12;
                              this.i23 = this.i14 + this.i23;
                              if(this.i20 == 0)
                              {
                                 §§goto(addr5168);
                              }
                              §§goto(addr5199);
                              this.i13 = this.i13 & 255;
                              this.i13 = this.i13 * 12;
                              this.i18 = li32(this.i23 + 8);
                              this.i13 = this.i12 + this.i13;
                              if(this.i18 == 3)
                              {
                                 §§goto(addr5154);
                              }
                              §§goto(addr5199);
                           }
                        }
                        else
                        {
                           this.i13 = this.i18 >>> 14;
                           this.i20 = this.i18 & 4194304;
                           this.i23 = this.i18 >>> 23;
                           this.i18 = this.i18 >>> 31;
                           if(this.i18 != 0)
                           {
                              this.i23 = this.i23 & 255;
                              this.i23 = this.i23 * 12;
                              this.i23 = this.i12 + this.i23;
                              if(this.i20 == 0)
                              {
                                 addr4938:
                                 this.i13 = this.i13 & 511;
                                 this.i13 = this.i13 * 12;
                                 this.i18 = li32(this.i23 + 8);
                                 this.i13 = this.i14 + this.i13;
                                 if(this.i18 != 3)
                                 {
                                 }
                                 break loop0;
                              }
                              addr4924:
                              this.i18 = li32(this.i13 + 8);
                              if(this.i18 != 3)
                              {
                                 break loop0;
                              }
                              this.i18 = 3;
                              this.f1 = lf64(this.i23);
                              this.f2 = lf64(this.i13);
                              this.f0 = this.f1 / this.f2;
                              this.f0 = Math.floor(this.f0);
                              this.f0 = this.f0 * this.f2;
                              this.i13 = this.i17 * 12;
                              this.i13 = this.i14 + this.i13;
                              this.f0 = this.f1 - this.f0;
                              sf64(this.f0,this.i13);
                              si32(this.i18,this.i13 + 8);
                              this.i13 = this.i19;
                           }
                           else
                           {
                              this.i23 = this.i23 * 12;
                              this.i23 = this.i14 + this.i23;
                              if(this.i20 == 0)
                              {
                                 §§goto(addr4938);
                              }
                              §§goto(addr4924);
                           }
                           this.i13 = this.i13 & 255;
                           this.i13 = this.i13 * 12;
                           this.i18 = li32(this.i23 + 8);
                           this.i13 = this.i12 + this.i13;
                           if(this.i18 != 3)
                           {
                              break loop0;
                           }
                           §§goto(addr4924);
                        }
                        addr296:
                        while(true)
                        {
                           continue loop0;
                        }
                     }
                     else
                     {
                        if(this.i22 <= 27)
                        {
                           if(this.i22 <= 22)
                           {
                              if(this.i22 <= 20)
                              {
                                 if(this.i22 != 19)
                                 {
                                    if(this.i22 == 20)
                                    {
                                       this.i13 = this.i18 >>> 23;
                                       this.i13 = this.i13 * 12;
                                       this.i13 = this.i14 + this.i13;
                                       this.i18 = li32(this.i13 + 8);
                                       if(this.i18 != 4)
                                       {
                                          if(this.i18 == 5)
                                          {
                                             this.i18 = 3;
                                             this.i13 = li32(this.i13);
                                             mstate.esp = mstate.esp - 4;
                                             si32(this.i13,mstate.esp);
                                             mstate.esp = mstate.esp - 4;
                                             FSM_luaV_execute.start();
                                          }
                                          else
                                          {
                                             this.i14 = 12;
                                             si32(this.i19,this.i11);
                                             mstate.esp = mstate.esp - 12;
                                             si32(this.i1,mstate.esp);
                                             si32(this.i13,mstate.esp + 4);
                                             si32(this.i14,mstate.esp + 8);
                                             mstate.esp = mstate.esp - 4;
                                             FSM_luaV_execute.start();
                                          }
                                       }
                                       else
                                       {
                                          this.i18 = 3;
                                          this.i13 = li32(this.i13);
                                          this.i13 = li32(this.i13 + 12);
                                          this.i17 = this.i17 * 12;
                                          this.i17 = this.i14 + this.i17;
                                          this.f0 = Number(uint(this.i13));
                                          sf64(this.f0,this.i17);
                                          si32(this.i18,this.i17 + 8);
                                          this.i13 = this.i19;
                                       }
                                    }
                                 }
                                 else
                                 {
                                    this.i13 = this.i18 >>> 23;
                                    this.i18 = this.i13 * 12;
                                    this.i18 = this.i14 + this.i18;
                                    this.i18 = li32(this.i18 + 8);
                                    if(this.i18 != 0)
                                    {
                                       if(this.i18 == 1)
                                       {
                                          this.i13 = this.i13 * 12;
                                          this.i13 = this.i14 + this.i13;
                                          this.i13 = li32(this.i13);
                                          if(this.i13 != 0)
                                          {
                                          }
                                       }
                                       this.i13 = 0;
                                       this.i17 = this.i17 * 12;
                                       si32(this.i13,this.i21);
                                       this.i13 = 1;
                                       this.i17 = this.i14 + this.i17;
                                       si32(this.i13,this.i17 + 8);
                                       this.i13 = this.i19;
                                    }
                                    this.i13 = 1;
                                    this.i17 = this.i17 * 12;
                                    si32(this.i13,this.i21);
                                    this.i17 = this.i14 + this.i17;
                                    si32(this.i13,this.i17 + 8);
                                    this.i13 = this.i19;
                                 }
                              }
                              else if(this.i22 != 21)
                              {
                                 if(this.i22 == 22)
                                 {
                                    this.i17 = this.i18 & -16384;
                                    this.i17 = this.i17 >>> 12;
                                    this.i13 = this.i17 + this.i13;
                                    this.i13 = this.i13 + -524280;
                                 }
                              }
                              else
                              {
                                 this.i13 = this.i18 >>> 14;
                                 this.i14 = this.i18 >>> 23;
                                 si32(this.i19,this.i11);
                                 this.i18 = 1 - this.i14;
                                 this.i13 = this.i13 & 511;
                                 mstate.esp = mstate.esp - 12;
                                 this.i18 = this.i18 + this.i13;
                                 si32(this.i1,mstate.esp);
                                 si32(this.i18,mstate.esp + 4);
                                 si32(this.i13,mstate.esp + 8);
                                 state = 32;
                                 mstate.esp = mstate.esp - 4;
                                 FSM_luaV_execute.start();
                                 return;
                              }
                           }
                           else if(this.i22 <= 24)
                           {
                              if(this.i22 != 23)
                              {
                                 if(this.i22 == 24)
                                 {
                                    si32(this.i19,this.i11);
                                    this.i20 = this.i18 >>> 23;
                                    this.i21 = this.i18 >>> 31;
                                    this.i23 = this.i18 >>> 14;
                                    this.i18 = this.i18 & 4194304;
                                    if(this.i18 != 0)
                                    {
                                       this.i23 = this.i23 & 255;
                                       this.i23 = this.i23 * 12;
                                       this.i23 = this.i12 + this.i23;
                                       this.i21 = this.i21 & 255;
                                       if(this.i21 == 0)
                                       {
                                          addr6981:
                                          this.i18 = this.i23;
                                          this.i20 = this.i20 * 12;
                                          mstate.esp = mstate.esp - 12;
                                          this.i14 = this.i14 + this.i20;
                                          si32(this.i1,mstate.esp);
                                          si32(this.i14,mstate.esp + 4);
                                          si32(this.i18,mstate.esp + 8);
                                          state = 39;
                                          mstate.esp = mstate.esp - 4;
                                          FSM_luaV_execute.start();
                                          return;
                                       }
                                    }
                                    else
                                    {
                                       this.i23 = this.i23 & 511;
                                       this.i23 = this.i23 * 12;
                                       this.i23 = this.i14 + this.i23;
                                       this.i18 = this.i21 & 255;
                                       if(this.i18 == 0)
                                       {
                                          §§goto(addr6981);
                                       }
                                    }
                                    this.i14 = this.i23;
                                    this.i20 = this.i20 & 255;
                                    this.i20 = this.i20 * 12;
                                    mstate.esp = mstate.esp - 12;
                                    this.i20 = this.i12 + this.i20;
                                    si32(this.i1,mstate.esp);
                                    si32(this.i20,mstate.esp + 4);
                                    si32(this.i14,mstate.esp + 8);
                                    state = 38;
                                    mstate.esp = mstate.esp - 4;
                                    FSM_luaV_execute.start();
                                    return;
                                 }
                              }
                              else
                              {
                                 this.i20 = this.i18 >>> 14;
                                 this.i21 = this.i18 & 4194304;
                                 this.i23 = this.i18 >>> 23;
                                 this.i18 = this.i18 >>> 31;
                                 if(this.i18 != 0)
                                 {
                                    this.i23 = this.i23 & 255;
                                    this.i23 = this.i23 * 12;
                                    this.i23 = this.i12 + this.i23;
                                    if(this.i21 == 0)
                                    {
                                       addr6095:
                                       this.i18 = this.i23;
                                       this.i20 = this.i20 & 511;
                                       this.i20 = this.i20 * 12;
                                       this.i20 = this.i14 + this.i20;
                                       this.i14 = this.i18;
                                    }
                                    addr6122:
                                    this.i18 = this.i20;
                                    si32(this.i19,this.i11);
                                    this.i20 = li32(this.i14 + 8);
                                    this.i21 = li32(this.i18 + 8);
                                    this.i23 = this.i18 + 8;
                                    this.i22 = this.i14 + 8;
                                    if(this.i20 == this.i21)
                                    {
                                       if(this.i20 <= 2)
                                       {
                                          if(this.i20 != 0)
                                          {
                                             if(this.i20 != 1)
                                             {
                                                if(this.i20 != 2)
                                                {
                                                   addr11842:
                                                   this.i14 = li32(this.i14);
                                                   this.i18 = li32(this.i18);
                                                   this.i14 = this.i14 == this.i18?1:0;
                                                   this.i14 = this.i14 & 1;
                                                }
                                                else
                                                {
                                                   this.i14 = li32(this.i14);
                                                   this.i18 = li32(this.i18);
                                                   this.i14 = this.i14 == this.i18?1:0;
                                                   this.i14 = this.i14 & 1;
                                                }
                                             }
                                             else
                                             {
                                                this.i14 = li32(this.i14);
                                                this.i18 = li32(this.i18);
                                                this.i14 = this.i14 == this.i18?1:0;
                                                this.i14 = this.i14 & 1;
                                             }
                                          }
                                          else
                                          {
                                             addr6246:
                                             while(true)
                                             {
                                                this.i14 = 1;
                                             }
                                          }
                                       }
                                       else if(this.i20 != 3)
                                       {
                                          if(this.i20 != 5)
                                          {
                                             if(this.i20 != 7)
                                             {
                                                §§goto(addr11842);
                                             }
                                             else
                                             {
                                                this.i20 = li32(this.i14);
                                                this.i21 = li32(this.i18);
                                                if(this.i20 != this.i21)
                                                {
                                                   this.i21 = li32(this.i21 + 8);
                                                   this.i20 = li32(this.i20 + 8);
                                                   mstate.esp = mstate.esp - 12;
                                                   si32(this.i1,mstate.esp);
                                                   si32(this.i20,mstate.esp + 4);
                                                   si32(this.i21,mstate.esp + 8);
                                                   mstate.esp = mstate.esp - 4;
                                                   FSM_luaV_execute.start();
                                                }
                                             }
                                          }
                                          else
                                          {
                                             this.i20 = li32(this.i14);
                                             this.i21 = li32(this.i18);
                                             if(this.i20 != this.i21)
                                             {
                                                this.i21 = li32(this.i21 + 8);
                                                this.i20 = li32(this.i20 + 8);
                                                mstate.esp = mstate.esp - 12;
                                                si32(this.i1,mstate.esp);
                                                si32(this.i20,mstate.esp + 4);
                                                si32(this.i21,mstate.esp + 8);
                                                mstate.esp = mstate.esp - 4;
                                                FSM_luaV_execute.start();
                                             }
                                             else
                                             {
                                                addr6245:
                                                while(true)
                                                {
                                                }
                                             }
                                          }
                                          §§goto(addr6246);
                                       }
                                       else
                                       {
                                          this.f0 = lf64(this.i14);
                                          this.f1 = lf64(this.i18);
                                          this.i14 = this.f0 == this.f1?1:0;
                                          this.i14 = this.i14 & 1;
                                       }
                                       addr6788:
                                       while(true)
                                       {
                                          if(this.i14 != 0)
                                          {
                                             this.i14 = 1;
                                          }
                                          addr6800:
                                          while(true)
                                          {
                                             if(this.i14 == this.i17)
                                             {
                                                this.i14 = li32(this.i19);
                                                this.i14 = this.i14 & -16384;
                                                this.i14 = this.i14 >>> 12;
                                                this.i17 = li32(this.i9);
                                                this.i13 = this.i14 + this.i13;
                                                this.i13 = this.i13 + -524276;
                                                this.i14 = this.i17;
                                             }
                                             else
                                             {
                                                this.i14 = li32(this.i9);
                                                this.i13 = this.i13 + 8;
                                             }
                                          }
                                       }
                                    }
                                    while(true)
                                    {
                                       this.i14 = 0;
                                       §§goto(addr6800);
                                    }
                                 }
                                 else
                                 {
                                    this.i23 = this.i23 * 12;
                                    this.i23 = this.i14 + this.i23;
                                    if(this.i21 == 0)
                                    {
                                       §§goto(addr6095);
                                    }
                                    §§goto(addr6122);
                                 }
                                 this.i14 = this.i23;
                                 this.i20 = this.i20 & 255;
                                 this.i20 = this.i20 * 12;
                                 this.i20 = this.i12 + this.i20;
                                 §§goto(addr6122);
                              }
                           }
                           else if(this.i22 != 25)
                           {
                              if(this.i22 != 26)
                              {
                                 if(this.i22 == 27)
                                 {
                                    this.i20 = this.i18 >>> 23;
                                    this.i21 = this.i20 * 12;
                                    this.i21 = this.i14 + this.i21;
                                    this.i21 = li32(this.i21 + 8);
                                    if(this.i21 != 1)
                                    {
                                       if(this.i21 == 0)
                                       {
                                          addr1931:
                                          this.i23 = 1;
                                       }
                                       addr8084:
                                       this.i18 = this.i18 >>> 14;
                                       this.i18 = this.i18 & 511;
                                       if(this.i23 != this.i18)
                                       {
                                          this.i18 = this.i20 * 12;
                                          this.i17 = this.i17 * 12;
                                          this.i18 = this.i14 + this.i18;
                                          this.f0 = lf64(this.i18);
                                          this.i17 = this.i14 + this.i17;
                                          sf64(this.f0,this.i17);
                                          si32(this.i21,this.i17 + 8);
                                          this.i17 = li32(this.i19);
                                          this.i17 = this.i17 & -16384;
                                          this.i17 = this.i17 >>> 12;
                                          this.i13 = this.i17 + this.i13;
                                          this.i13 = this.i13 + -524276;
                                       }
                                       else
                                       {
                                          this.i13 = this.i13 + 8;
                                       }
                                    }
                                    else
                                    {
                                       this.i23 = this.i20 * 12;
                                       this.i23 = this.i14 + this.i23;
                                       this.i23 = li32(this.i23);
                                       if(this.i23 == 0)
                                       {
                                          §§goto(addr1931);
                                       }
                                       §§goto(addr8084);
                                    }
                                    this.i23 = 0;
                                    §§goto(addr8084);
                                 }
                              }
                              else
                              {
                                 this.i17 = this.i17 * 12;
                                 this.i17 = this.i14 + this.i17;
                                 this.i17 = li32(this.i17 + 8);
                                 if(this.i17 != 1)
                                 {
                                    if(this.i17 == 0)
                                    {
                                       addr7985:
                                       this.i17 = 1;
                                    }
                                    addr8002:
                                    this.i18 = this.i18 >>> 14;
                                    this.i18 = this.i18 & 511;
                                    if(this.i17 != this.i18)
                                    {
                                       this.i17 = li32(this.i19);
                                       this.i17 = this.i17 & -16384;
                                       this.i17 = this.i17 >>> 12;
                                       this.i13 = this.i17 + this.i13;
                                       this.i13 = this.i13 + -524276;
                                    }
                                    else
                                    {
                                       this.i13 = this.i13 + 8;
                                    }
                                 }
                                 else
                                 {
                                    this.i17 = li32(this.i21);
                                    if(this.i17 == 0)
                                    {
                                       §§goto(addr7985);
                                    }
                                    §§goto(addr8002);
                                 }
                                 this.i17 = 0;
                                 §§goto(addr8002);
                              }
                           }
                           else
                           {
                              si32(this.i19,this.i11);
                              this.i20 = this.i18 >>> 23;
                              this.i21 = this.i18 >>> 31;
                              this.i23 = this.i18 >>> 14;
                              this.i18 = this.i18 & 4194304;
                              if(this.i18 != 0)
                              {
                                 this.i23 = this.i23 & 255;
                                 this.i23 = this.i23 * 12;
                                 this.i23 = this.i12 + this.i23;
                                 this.i21 = this.i21 & 255;
                                 if(this.i21 == 0)
                                 {
                                    addr7213:
                                    this.i18 = this.i23;
                                    this.i20 = this.i20 * 12;
                                    this.i20 = this.i14 + this.i20;
                                    this.i14 = this.i18;
                                 }
                                 addr7234:
                                 this.i18 = this.i20;
                                 this.i20 = li32(this.i18 + 8);
                                 this.i21 = li32(this.i14 + 8);
                                 this.i23 = this.i14 + 8;
                                 this.i22 = this.i18 + 8;
                                 if(this.i20 != this.i21)
                                 {
                                    this.i14 = FSM_luaV_execute;
                                    this.i18 = this.i21 << 2;
                                    this.i20 = this.i20 << 2;
                                    this.i18 = this.i14 + this.i18;
                                    this.i14 = this.i14 + this.i20;
                                    this.i14 = li32(this.i14);
                                    this.i18 = li32(this.i18);
                                    this.i20 = li8(this.i14 + 2);
                                    this.i23 = li8(this.i18 + 2);
                                    if(this.i20 == this.i23)
                                    {
                                       this.i18 = FSM_luaV_execute;
                                       mstate.esp = mstate.esp - 12;
                                       si32(this.i1,mstate.esp);
                                       si32(this.i18,mstate.esp + 4);
                                       si32(this.i14,mstate.esp + 8);
                                       state = 40;
                                       mstate.esp = mstate.esp - 4;
                                       FSM_luaV_execute.start();
                                       return;
                                    }
                                    this.i20 = FSM_luaV_execute;
                                    mstate.esp = mstate.esp - 16;
                                    si32(this.i1,mstate.esp);
                                    si32(this.i20,mstate.esp + 4);
                                    si32(this.i14,mstate.esp + 8);
                                    si32(this.i18,mstate.esp + 12);
                                    state = 41;
                                    mstate.esp = mstate.esp - 4;
                                    FSM_luaV_execute.start();
                                    return;
                                 }
                                 if(this.i20 != 4)
                                 {
                                    if(this.i20 == 3)
                                    {
                                       this.f0 = lf64(this.i18);
                                       this.f1 = lf64(this.i14);
                                       this.i14 = this.f0 <= this.f1?1:0;
                                       this.i14 = this.i14 & 1;
                                       if(this.i14 != this.i17)
                                       {
                                          addr7940:
                                          while(true)
                                          {
                                             this.i14 = li32(this.i9);
                                             this.i13 = this.i13 + 8;
                                          }
                                       }
                                       else
                                       {
                                          addr7828:
                                          while(true)
                                          {
                                             this.i14 = li32(this.i19);
                                             this.i14 = this.i14 & -16384;
                                             this.i14 = this.i14 >>> 12;
                                             this.i17 = li32(this.i9);
                                             this.i13 = this.i14 + this.i13;
                                             this.i13 = this.i13 + -524276;
                                             this.i14 = this.i17;
                                          }
                                       }
                                    }
                                    else
                                    {
                                       this.i20 = 14;
                                       mstate.esp = mstate.esp - 16;
                                       si32(this.i1,mstate.esp);
                                       si32(this.i18,mstate.esp + 4);
                                       si32(this.i14,mstate.esp + 8);
                                       si32(this.i20,mstate.esp + 12);
                                       state = 42;
                                       mstate.esp = mstate.esp - 4;
                                       FSM_luaV_execute.start();
                                       return;
                                    }
                                 }
                                 else
                                 {
                                    this.i14 = li32(this.i14);
                                    this.i18 = li32(this.i18);
                                    mstate.esp = mstate.esp - 8;
                                    si32(this.i18,mstate.esp);
                                    si32(this.i14,mstate.esp + 4);
                                    state = 46;
                                    mstate.esp = mstate.esp - 4;
                                    FSM_luaV_execute.start();
                                    return;
                                 }
                              }
                              else
                              {
                                 this.i23 = this.i23 & 511;
                                 this.i23 = this.i23 * 12;
                                 this.i23 = this.i14 + this.i23;
                                 this.i18 = this.i21 & 255;
                                 if(this.i18 == 0)
                                 {
                                    §§goto(addr7213);
                                 }
                                 §§goto(addr7234);
                              }
                              this.i14 = this.i23;
                              this.i20 = this.i20 & 255;
                              this.i20 = this.i20 * 12;
                              this.i20 = this.i12 + this.i20;
                              §§goto(addr7234);
                           }
                           §§goto(addr296);
                        }
                        else if(this.i22 <= 32)
                        {
                           if(this.i22 <= 29)
                           {
                              if(this.i22 != 28)
                              {
                                 if(this.i22 == 29)
                                 {
                                    if(uint(this.i18) >= uint(8388608))
                                    {
                                       this.i13 = this.i18 >>> 23;
                                       this.i13 = this.i17 + this.i13;
                                       this.i13 = this.i13 * 12;
                                       this.i13 = this.i14 + this.i13;
                                       si32(this.i13,this.i6);
                                    }
                                    this.i13 = -1;
                                    si32(this.i19,this.i11);
                                    mstate.esp = mstate.esp - 12;
                                    si32(this.i1,mstate.esp);
                                    si32(this.i21,mstate.esp + 4);
                                    si32(this.i13,mstate.esp + 8);
                                    state = 6;
                                    mstate.esp = mstate.esp - 4;
                                    FSM_luaV_execute.start();
                                    return;
                                 }
                              }
                              else
                              {
                                 this.i13 = this.i18 >>> 14;
                                 this.i13 = this.i13 & 511;
                                 this.i13 = this.i13 + -1;
                                 if(uint(this.i18) >= uint(8388608))
                                 {
                                    this.i18 = this.i18 >>> 23;
                                    this.i17 = this.i17 + this.i18;
                                    this.i17 = this.i17 * 12;
                                    this.i14 = this.i14 + this.i17;
                                    si32(this.i14,this.i6);
                                 }
                                 si32(this.i19,this.i11);
                                 mstate.esp = mstate.esp - 12;
                                 si32(this.i1,mstate.esp);
                                 si32(this.i21,mstate.esp + 4);
                                 si32(this.i13,mstate.esp + 8);
                                 state = 47;
                                 mstate.esp = mstate.esp - 4;
                                 FSM_luaV_execute.start();
                                 return;
                              }
                           }
                           else if(this.i22 != 30)
                           {
                              if(this.i22 != 31)
                              {
                                 if(this.i22 == 32)
                                 {
                                    this.i20 = this.i17 + 2;
                                    this.i23 = this.i17 + 1;
                                    this.i22 = this.i17 * 12;
                                    this.i22 = this.i14 + this.i22;
                                    si32(this.i19,this.i11);
                                    this.i19 = this.i20 * 12;
                                    this.i24 = this.i23 * 12;
                                    this.i25 = li32(this.i22 + 8);
                                    this.i22 = this.i22 + 8;
                                    this.i19 = this.i14 + this.i19;
                                    this.i24 = this.i14 + this.i24;
                                    if(this.i25 != 3)
                                    {
                                       if(this.i25 == 4)
                                       {
                                          this.i25 = mstate.ebp + -24;
                                          this.i26 = li32(this.i21);
                                          mstate.esp = mstate.esp - 8;
                                          this.i26 = this.i26 + 16;
                                          si32(this.i26,mstate.esp);
                                          si32(this.i25,mstate.esp + 4);
                                          state = 8;
                                          mstate.esp = mstate.esp - 4;
                                          FSM_luaV_execute.start();
                                          return;
                                       }
                                       addr2415:
                                       this.i20 = FSM_luaV_execute;
                                       mstate.esp = mstate.esp - 8;
                                       si32(this.i1,mstate.esp);
                                       si32(this.i20,mstate.esp + 4);
                                       state = 9;
                                       mstate.esp = mstate.esp - 4;
                                       FSM_luaV_execute.start();
                                       return;
                                    }
                                    addr8889:
                                    while(true)
                                    {
                                       this.i21 = this.i23 * 12;
                                       this.i21 = this.i14 + this.i21;
                                       this.i25 = li32(this.i21 + 8);
                                       this.i21 = this.i21 + 8;
                                       if(this.i25 != 3)
                                       {
                                          if(this.i25 == 4)
                                          {
                                             this.i25 = mstate.ebp + -32;
                                             this.i26 = li32(this.i24);
                                             mstate.esp = mstate.esp - 8;
                                             this.i26 = this.i26 + 16;
                                             si32(this.i26,mstate.esp);
                                             si32(this.i25,mstate.esp + 4);
                                             state = 50;
                                             mstate.esp = mstate.esp - 4;
                                             FSM_luaV_execute.start();
                                             return;
                                          }
                                          addr9028:
                                          this.i20 = FSM_luaV_execute;
                                          mstate.esp = mstate.esp - 8;
                                          si32(this.i1,mstate.esp);
                                          si32(this.i20,mstate.esp + 4);
                                          state = 51;
                                          mstate.esp = mstate.esp - 4;
                                          FSM_luaV_execute.start();
                                          return;
                                       }
                                       addr9070:
                                       while(true)
                                       {
                                          this.i21 = this.i20 * 12;
                                          this.i21 = this.i14 + this.i21;
                                          this.i23 = li32(this.i21 + 8);
                                          this.i21 = this.i21 + 8;
                                          if(this.i23 != 4)
                                          {
                                             if(this.i23 != 3)
                                             {
                                                addr9109:
                                                while(true)
                                                {
                                                   this.i19 = 0;
                                                   addr9209:
                                                   while(true)
                                                   {
                                                      if(this.i19 == 0)
                                                      {
                                                         this.i20 = FSM_luaV_execute;
                                                         mstate.esp = mstate.esp - 8;
                                                         si32(this.i1,mstate.esp);
                                                         si32(this.i20,mstate.esp + 4);
                                                         state = 53;
                                                         mstate.esp = mstate.esp - 4;
                                                         FSM_luaV_execute.start();
                                                         return;
                                                      }
                                                   }
                                                }
                                             }
                                             addr9256:
                                             while(true)
                                             {
                                                this.i20 = 3;
                                                this.i17 = this.i17 * 12;
                                                this.i17 = this.i14 + this.i17;
                                                this.i18 = this.i18 & -16384;
                                                this.f0 = lf64(this.i17);
                                                this.f1 = lf64(this.i19);
                                                this.i18 = this.i18 >>> 12;
                                                this.f0 = this.f0 - this.f1;
                                                this.i13 = this.i18 + this.i13;
                                                sf64(this.f0,this.i17);
                                                si32(this.i20,this.i22);
                                                this.i13 = this.i13 + -524280;
                                             }
                                          }
                                          else
                                          {
                                             this.i23 = mstate.ebp + -40;
                                             this.i24 = li32(this.i19);
                                             mstate.esp = mstate.esp - 8;
                                             this.i24 = this.i24 + 16;
                                             si32(this.i24,mstate.esp);
                                             si32(this.i23,mstate.esp + 4);
                                             state = 52;
                                             mstate.esp = mstate.esp - 4;
                                             FSM_luaV_execute.start();
                                             return;
                                          }
                                       }
                                    }
                                 }
                                 §§goto(addr296);
                              }
                              else
                              {
                                 this.f0 = 0;
                                 this.i20 = this.i17 * 12;
                                 this.i21 = this.i20 + this.i14;
                                 this.i20 = this.i14 + this.i20;
                                 this.f1 = lf64(this.i21 + 24);
                                 this.f2 = lf64(this.i20);
                                 this.f3 = lf64(this.i21 + 12);
                                 this.f2 = this.f2 + this.f1;
                                 this.f4 = this.f1 > this.f0?Number(this.f2):Number(this.f3);
                                 this.f0 = this.f1 > this.f0?Number(this.f3):Number(this.f2);
                                 if(this.f4 <= this.f0)
                                 {
                                    this.i19 = 3;
                                    this.i17 = this.i17 * 12;
                                    this.i18 = this.i18 & -16384;
                                    sf64(this.f2,this.i20);
                                    this.i20 = this.i14 + this.i17;
                                    si32(this.i19,this.i20 + 8);
                                    this.i17 = this.i17 + this.i14;
                                    this.i18 = this.i18 >>> 12;
                                    sf64(this.f2,this.i17 + 36);
                                    this.i13 = this.i18 + this.i13;
                                    si32(this.i19,this.i17 + 44);
                                    this.i13 = this.i13 + -524280;
                                 }
                                 §§goto(addr296);
                              }
                           }
                           else
                           {
                              if(uint(this.i18) >= uint(8388608))
                              {
                                 this.i2 = this.i18 >>> 23;
                                 this.i2 = this.i2 + this.i17;
                                 this.i2 = this.i2 * 12;
                                 this.i2 = this.i2 + this.i14;
                                 this.i2 = this.i2 + -12;
                                 si32(this.i2,this.i6);
                              }
                              this.i2 = li32(this.i4);
                              if(this.i2 != 0)
                              {
                                 mstate.esp = mstate.esp - 8;
                                 si32(this.i1,mstate.esp);
                                 si32(this.i14,mstate.esp + 4);
                                 state = 48;
                                 mstate.esp = mstate.esp - 4;
                                 FSM_luaV_execute.start();
                                 return;
                              }
                              addr8627:
                              si32(this.i19,this.i11);
                              mstate.esp = mstate.esp - 8;
                              si32(this.i1,mstate.esp);
                              si32(this.i21,mstate.esp + 4);
                              state = 49;
                              mstate.esp = mstate.esp - 4;
                              FSM_luaV_execute.start();
                              return;
                           }
                        }
                        else if(this.i22 <= 34)
                        {
                           if(this.i22 != 33)
                           {
                              if(this.i22 == 34)
                              {
                                 this.i20 = this.i18 >>> 14;
                                 this.i20 = this.i20 & 511;
                                 this.i22 = this.i18 >>> 23;
                                 if(uint(this.i18) >= uint(8388608))
                                 {
                                    this.i18 = this.i22;
                                 }
                                 else
                                 {
                                    this.i18 = li32(this.i6);
                                    this.i22 = li32(this.i10);
                                    this.i22 = li32(this.i22 + 8);
                                    this.i18 = this.i18 - this.i21;
                                    this.i18 = this.i18 / 12;
                                    si32(this.i22,this.i6);
                                    this.i18 = this.i18 + -1;
                                 }
                                 if(this.i20 != 0)
                                 {
                                    this.i13 = this.i20;
                                 }
                                 else
                                 {
                                    this.i19 = li32(this.i19);
                                    this.i20 = this.i13 + 8;
                                    this.i13 = this.i19;
                                    this.i19 = this.i20;
                                 }
                                 this.i20 = this.i17 * 12;
                                 this.i20 = this.i14 + this.i20;
                                 this.i20 = li32(this.i20 + 8);
                                 if(this.i20 == 5)
                                 {
                                    this.i20 = li32(this.i21);
                                    this.i21 = this.i13 * 50;
                                    this.i22 = li32(this.i20 + 28);
                                    this.i21 = this.i18 + this.i21;
                                    this.i21 = this.i21 + -50;
                                    this.i24 = this.i20;
                                    if(this.i22 < this.i21)
                                    {
                                       this.i22 = FSM_luaV_execute;
                                       this.i25 = li32(this.i20 + 16);
                                       if(this.i25 != this.i22)
                                       {
                                          this.i22 = 1;
                                          this.i25 = li8(this.i20 + 7);
                                          mstate.esp = mstate.esp - 16;
                                          this.i22 = this.i22 << this.i25;
                                          si32(this.i1,mstate.esp);
                                          si32(this.i20,mstate.esp + 4);
                                          si32(this.i21,mstate.esp + 8);
                                          si32(this.i22,mstate.esp + 12);
                                          state = 55;
                                          mstate.esp = mstate.esp - 4;
                                          FSM_luaV_execute.start();
                                          return;
                                       }
                                       this.i22 = 0;
                                       mstate.esp = mstate.esp - 16;
                                       si32(this.i1,mstate.esp);
                                       si32(this.i20,mstate.esp + 4);
                                       si32(this.i21,mstate.esp + 8);
                                       si32(this.i22,mstate.esp + 12);
                                       state = 56;
                                       mstate.esp = mstate.esp - 4;
                                       FSM_luaV_execute.start();
                                       return;
                                    }
                                    addr9759:
                                    addr9759:
                                    if(this.i18 > 0)
                                    {
                                       addr9953:
                                       while(true)
                                       {
                                          this.i17 = this.i18 + this.i17;
                                          this.i13 = this.i13 * 50;
                                          this.i17 = this.i17 * 12;
                                          this.i17 = this.i23 + this.i17;
                                          this.i13 = this.i13 + -50;
                                          this.i21 = this.i20 + 24;
                                          this.i23 = this.i24 + 5;
                                          addr9999:
                                          while(true)
                                          {
                                             this.i22 = FSM_luaV_execute;
                                             mstate.esp = mstate.esp - 8;
                                             this.i25 = this.i13 + this.i18;
                                             si32(this.i20,mstate.esp);
                                             si32(this.i25,mstate.esp + 4);
                                             mstate.esp = mstate.esp - 4;
                                             FSM_luaV_execute.start();
                                          }
                                       }
                                    }
                                    while(true)
                                    {
                                    }
                                 }
                                 while(true)
                                 {
                                    this.i13 = this.i19;
                                 }
                              }
                              §§goto(addr296);
                           }
                           else
                           {
                              this.i20 = this.i17 + 2;
                              this.i21 = this.i20 * 12;
                              this.i23 = this.i17 * 12;
                              this.i21 = this.i14 + this.i21;
                              this.i22 = this.i23 + this.i14;
                              this.f0 = lf64(this.i21);
                              sf64(this.f0,this.i22 + 60);
                              this.i21 = li32(this.i21 + 8);
                              si32(this.i21,this.i22 + 68);
                              this.f0 = lf64(this.i22 + 12);
                              sf64(this.f0,this.i22 + 48);
                              this.i21 = li32(this.i22 + 20);
                              this.i17 = this.i17 + 3;
                              this.i24 = this.i17 * 12;
                              si32(this.i21,this.i22 + 56);
                              this.i21 = this.i14 + this.i23;
                              this.f0 = lf64(this.i21);
                              this.i14 = this.i14 + this.i24;
                              sf64(this.f0,this.i14);
                              this.i21 = li32(this.i21 + 8);
                              si32(this.i21,this.i14 + 8);
                              this.i21 = this.i22 + 72;
                              si32(this.i21,this.i6);
                              si32(this.i19,this.i11);
                              this.i18 = this.i18 >>> 14;
                              mstate.esp = mstate.esp - 12;
                              this.i18 = this.i18 & 511;
                              si32(this.i1,mstate.esp);
                              si32(this.i14,mstate.esp + 4);
                              si32(this.i18,mstate.esp + 8);
                              state = 54;
                              mstate.esp = mstate.esp - 4;
                              FSM_luaV_execute.start();
                              return;
                           }
                        }
                        else if(this.i22 != 35)
                        {
                           if(this.i22 != 36)
                           {
                              if(this.i22 == 37)
                              {
                                 this.i13 = li32(this.i10);
                                 this.i20 = li32(this.i13);
                                 this.i22 = li32(this.i13 + 4);
                                 this.i23 = this.i20 - this.i22;
                                 this.i24 = li32(this.i16);
                                 this.i24 = li8(this.i24 + 73);
                                 this.i23 = this.i23 / 12;
                                 this.i23 = this.i23 - this.i24;
                                 this.i18 = this.i18 >>> 23;
                                 this.i23 = this.i23 + -1;
                                 this.i25 = this.i18 + -1;
                                 if(this.i18 == 0)
                                 {
                                    si32(this.i19,this.i11);
                                    this.i14 = li32(this.i5);
                                    this.i21 = li32(this.i6);
                                    this.i25 = this.i23 * 12;
                                    this.i14 = this.i14 - this.i21;
                                    if(this.i14 <= this.i25)
                                    {
                                       this.i14 = li32(mstate.ebp + -108);
                                       this.i14 = li32(this.i14);
                                       if(this.i14 >= this.i23)
                                       {
                                          mstate.esp = mstate.esp - 8;
                                          this.i14 = this.i14 << 1;
                                          si32(this.i1,mstate.esp);
                                          si32(this.i14,mstate.esp + 4);
                                          state = 64;
                                          mstate.esp = mstate.esp - 4;
                                          FSM_luaV_execute.start();
                                          return;
                                       }
                                       mstate.esp = mstate.esp - 8;
                                       this.i14 = this.i14 + this.i23;
                                       si32(this.i1,mstate.esp);
                                       si32(this.i14,mstate.esp + 4);
                                       state = 65;
                                       mstate.esp = mstate.esp - 4;
                                       FSM_luaV_execute.start();
                                       return;
                                    }
                                    addr11294:
                                    while(true)
                                    {
                                       this.i14 = this.i23 + this.i17;
                                       this.i21 = li32(this.i9);
                                       this.i14 = this.i14 * 12;
                                       this.i25 = this.i17 * 12;
                                       this.i14 = this.i21 + this.i14;
                                       si32(this.i14,this.i6);
                                       this.i14 = this.i21 + this.i25;
                                       if(this.i23 <= 0)
                                       {
                                          this.i13 = this.i19;
                                          this.i14 = this.i21;
                                       }
                                       else
                                       {
                                          this.i17 = this.i14;
                                          this.i14 = this.i21;
                                          this.i21 = this.i23;
                                          addr11377:
                                          while(true)
                                          {
                                             this.i18 = this.i21;
                                             this.i21 = 0;
                                             this.i20 = this.i20 - this.i22;
                                             this.i22 = this.i24 & 255;
                                             this.i20 = this.i20 / 12;
                                             this.i20 = this.i20 - this.i22;
                                             this.i20 = this.i20 * -12;
                                             this.i22 = this.i21;
                                             do
                                             {
                                                if(this.i21 < this.i23)
                                                {
                                                   this.i24 = li32(this.i13);
                                                   this.i25 = this.i20 + this.i22;
                                                   this.i24 = this.i24 + this.i25;
                                                   this.f0 = lf64(this.i24 + 12);
                                                   this.i25 = this.i17 + this.i22;
                                                   sf64(this.f0,this.i25);
                                                   this.i24 = li32(this.i24 + 20);
                                                   si32(this.i24,this.i25 + 8);
                                                }
                                                else
                                                {
                                                   this.i24 = 0;
                                                   this.i25 = this.i17 + this.i22;
                                                   si32(this.i24,this.i25 + 8);
                                                }
                                                this.i22 = this.i22 + 12;
                                                this.i21 = this.i21 + 1;
                                             }
                                             while(this.i21 < this.i18);
                                             
                                             this.i13 = this.i19;
                                          }
                                       }
                                    }
                                 }
                                 else if(this.i25 >= 1)
                                 {
                                    this.i17 = this.i21;
                                    this.i21 = this.i25;
                                    §§goto(addr11377);
                                 }
                                 §§goto(addr296);
                              }
                           }
                           else
                           {
                              this.i18 = this.i18 & -16384;
                              this.i22 = li32(this.i16);
                              this.i22 = li32(this.i22 + 16);
                              this.i18 = this.i18 >>> 12;
                              this.i18 = this.i22 + this.i18;
                              this.i18 = li32(this.i18);
                              this.i22 = li8(this.i18 + 72);
                              this.i23 = li32(this.i15);
                              mstate.esp = mstate.esp - 12;
                              si32(this.i1,mstate.esp);
                              si32(this.i22,mstate.esp + 4);
                              si32(this.i23,mstate.esp + 8);
                              state = 60;
                              mstate.esp = mstate.esp - 4;
                              FSM_luaV_execute.start();
                              return;
                           }
                        }
                        else
                        {
                           mstate.esp = mstate.esp - 8;
                           si32(this.i1,mstate.esp);
                           si32(this.i21,mstate.esp + 4);
                           state = 59;
                           mstate.esp = mstate.esp - 4;
                           FSM_luaV_execute.start();
                           return;
                        }
                        §§goto(addr2522);
                     }
                     §§goto(addr2522);
                  }
               }
               this.i14 = this.i23;
               this.i17 = 9;
               si32(this.i19,this.i11);
               mstate.esp = mstate.esp - 20;
               si32(this.i1,mstate.esp);
               si32(this.i21,mstate.esp + 4);
               si32(this.i14,mstate.esp + 8);
               si32(this.i13,mstate.esp + 12);
               si32(this.i17,mstate.esp + 16);
               state = 25;
               mstate.esp = mstate.esp - 4;
               FSM_luaV_execute.start();
               return;
            case 1:
               mstate.esp = mstate.esp + 12;
               §§goto(addr480);
            case 2:
               mstate.esp = mstate.esp + 12;
               §§goto(addr677);
            case 3:
               mstate.esp = mstate.esp + 16;
               this.i14 = li32(this.i9);
               this.i13 = this.i19;
               §§goto(addr296);
            case 4:
               while(true)
               {
                  mstate.esp = mstate.esp + 8;
                  this.i13 = this.i19;
                  §§goto(addr296);
               }
            case 5:
               while(true)
               {
                  this.i13 = mstate.eax;
                  this.i17 = this.i17 * 12;
                  mstate.esp = mstate.esp + 4;
                  this.i17 = this.i14 + this.i17;
                  this.f0 = Number(this.i13);
                  sf64(this.f0,this.i17);
                  si32(this.i18,this.i17 + 8);
                  this.i13 = this.i19;
                  §§goto(addr296);
               }
            case 6:
               this.i13 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               if(this.i13 != 1)
               {
                  if(this.i13 == 0)
                  {
                     this.i2 = li32(this.i10);
                     this.i13 = li32(this.i2 + -20);
                     this.i14 = li32(this.i2 + 4);
                     this.i12 = li32(this.i4);
                     this.i15 = this.i2 + -20;
                     this.i16 = this.i14;
                     this.i17 = this.i13;
                     if(this.i12 != 0)
                     {
                        this.i12 = li32(this.i2 + -24);
                        mstate.esp = mstate.esp - 8;
                        si32(this.i1,mstate.esp);
                        si32(this.i12,mstate.esp + 4);
                        state = 7;
                        mstate.esp = mstate.esp - 4;
                        FSM_luaV_execute.start();
                        return;
                     }
                     addr2150:
                     this.i12 = li32(this.i2);
                     this.i12 = this.i12 - this.i14;
                     this.i12 = this.i12 / 12;
                     this.i15 = li32(this.i15);
                     this.i12 = this.i12 * 12;
                     this.i12 = this.i15 + this.i12;
                     si32(this.i12,this.i2 + -24);
                     si32(this.i12,this.i9);
                     this.i12 = li32(this.i6);
                     if(uint(this.i16) >= uint(this.i12))
                     {
                        this.i13 = 0;
                     }
                     else
                     {
                        this.i12 = 0;
                        this.i15 = this.i12;
                        do
                        {
                           this.i16 = this.i14 + this.i15;
                           this.f0 = lf64(this.i16);
                           this.i18 = this.i13 + this.i15;
                           sf64(this.f0,this.i18);
                           this.i16 = li32(this.i16 + 8);
                           si32(this.i16,this.i18 + 8);
                           this.i15 = this.i15 + 12;
                           this.i16 = li32(this.i6);
                           this.i12 = this.i12 + 1;
                           this.i18 = this.i14 + this.i15;
                        }
                        while(uint(this.i18) < uint(this.i16));
                        
                        this.i13 = this.i12;
                     }
                     this.i13 = this.i13 * 12;
                     this.i13 = this.i17 + this.i13;
                     si32(this.i13,this.i6);
                     si32(this.i13,this.i2 + -16);
                     this.i13 = li32(this.i11);
                     si32(this.i13,this.i2 + -12);
                     this.i13 = li32(this.i2 + -4);
                     this.i13 = this.i13 + 1;
                     si32(this.i13,this.i2 + -4);
                     this.i2 = li32(this.i10);
                     this.i2 = this.i2 + -24;
                     si32(this.i2,this.i10);
                     §§goto(addr242);
                  }
                  else
                  {
                     addr701:
                  }
                  §§goto(addr702);
               }
               else
               {
                  this.i14 = li32(this.i9);
                  this.i13 = this.i19;
               }
               §§goto(addr296);
            case 7:
               mstate.esp = mstate.esp + 8;
               §§goto(addr2150);
            case 8:
               this.i25 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               if(this.i25 != 0)
               {
                  this.i25 = 3;
                  this.i26 = this.i17 * 12;
                  this.f0 = lf64(mstate.ebp + -24);
                  this.i26 = this.i14 + this.i26;
                  sf64(this.f0,this.i26);
                  si32(this.i25,this.i22);
                  if(this.i21 != 0)
                  {
                     §§goto(addr8889);
                  }
               }
               §§goto(addr2415);
            case 9:
               mstate.esp = mstate.esp + 8;
               §§goto(addr9256);
            case 10:
               mstate.esp = mstate.esp + 16;
               this.i14 = li32(this.i9);
               this.i13 = this.i19;
               §§goto(addr296);
            case 11:
               mstate.esp = mstate.esp + 16;
               this.i14 = li32(this.i9);
               this.i13 = this.i19;
               §§goto(addr296);
            case 12:
               mstate.esp = mstate.esp + 16;
               this.i14 = li32(this.i9);
               this.i13 = this.i19;
               §§goto(addr296);
            case 13:
               mstate.esp = mstate.esp + 16;
               this.i14 = li32(this.i9);
               this.i13 = this.i19;
               §§goto(addr296);
            case 14:
               mstate.esp = mstate.esp + 16;
               this.i14 = li32(this.i9);
               this.i13 = this.i19;
               §§goto(addr296);
            case 15:
               this.i20 = mstate.eax;
               mstate.esp = mstate.esp + 16;
               this.i22 = li32(this.i7);
               this.i24 = li32(this.i22 + 28);
               si32(this.i24,this.i20);
               si32(this.i20,this.i22 + 28);
               this.i22 = li8(this.i22 + 20);
               this.i22 = this.i22 & 3;
               si8(this.i22,this.i20 + 5);
               this.i22 = 5;
               si8(this.i22,this.i20 + 4);
               si32(this.i23,this.i20 + 8);
               this.i24 = -1;
               si8(this.i24,this.i20 + 6);
               si32(this.i23,this.i20 + 12);
               si32(this.i23,this.i20 + 28);
               si8(this.i23,this.i20 + 7);
               this.i23 = FSM_luaV_execute;
               si32(this.i23,this.i20 + 16);
               mstate.esp = mstate.esp - 12;
               si32(this.i1,mstate.esp);
               si32(this.i20,mstate.esp + 4);
               si32(this.i18,mstate.esp + 8);
               state = 16;
               mstate.esp = mstate.esp - 4;
               FSM_luaV_execute.start();
               return;
            case 16:
               mstate.esp = mstate.esp + 12;
               mstate.esp = mstate.esp - 12;
               si32(this.i1,mstate.esp);
               si32(this.i20,mstate.esp + 4);
               si32(this.i13,mstate.esp + 8);
               state = 17;
               mstate.esp = mstate.esp - 4;
               FSM_luaV_execute.start();
               return;
            case 17:
               mstate.esp = mstate.esp + 12;
               this.i13 = this.i17 * 12;
               si32(this.i20,this.i21);
               this.i13 = this.i14 + this.i13;
               si32(this.i22,this.i13 + 8);
               si32(this.i19,this.i11);
               this.i13 = li32(this.i7);
               this.i14 = li32(this.i13 + 68);
               this.i13 = li32(this.i13 + 64);
               if(uint(this.i14) >= uint(this.i13))
               {
                  mstate.esp = mstate.esp - 4;
                  si32(this.i1,mstate.esp);
                  state = 18;
                  mstate.esp = mstate.esp - 4;
                  FSM_luaV_execute.start();
                  return;
               }
               this.i14 = li32(this.i9);
               this.i13 = this.i19;
               §§goto(addr296);
            case 18:
               mstate.esp = mstate.esp + 4;
               this.i14 = li32(this.i9);
               this.i13 = this.i19;
               §§goto(addr296);
            case 19:
               mstate.esp = mstate.esp + 16;
               this.i14 = li32(this.i9);
               this.i13 = this.i19;
               §§goto(addr296);
            case 20:
               mstate.esp = mstate.esp + 16;
               this.i14 = li32(this.i9);
               this.i13 = this.i19;
               §§goto(addr296);
            case 21:
               mstate.esp = mstate.esp + 20;
               this.i14 = li32(this.i9);
               this.i13 = this.i19;
               §§goto(addr296);
            case 22:
               mstate.esp = mstate.esp + 20;
               this.i14 = li32(this.i9);
               this.i13 = this.i19;
               §§goto(addr296);
            case 23:
               mstate.esp = mstate.esp + 20;
               this.i14 = li32(this.i9);
               this.i13 = this.i19;
               §§goto(addr296);
            case 24:
               mstate.esp = mstate.esp + 20;
               this.i14 = li32(this.i9);
               this.i13 = this.i19;
               §§goto(addr296);
            case 25:
               mstate.esp = mstate.esp + 20;
               this.i14 = li32(this.i9);
               this.i13 = this.i19;
               §§goto(addr296);
            case 26:
               mstate.esp = mstate.esp + 20;
               this.i14 = li32(this.i9);
               this.i13 = this.i19;
               §§goto(addr296);
            case 27:
               mstate.esp = mstate.esp + 20;
               this.i14 = li32(this.i9);
               this.i13 = this.i19;
               §§goto(addr296);
            case 28:
               this.i14 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               this.i17 = li32(this.i14 + 8);
               if(this.i17 == 0)
               {
                  this.i14 = FSM_luaV_execute;
                  mstate.esp = mstate.esp - 12;
                  this.i17 = 12;
                  si32(this.i1,mstate.esp);
                  si32(this.i14,mstate.esp + 4);
                  si32(this.i17,mstate.esp + 8);
                  mstate.esp = mstate.esp - 4;
                  FSM_luaV_execute.start();
               }
               addr5653:
               this.i17 = li32(this.i14 + 8);
               if(this.i17 != 0)
               {
                  this.i17 = FSM_luaV_execute;
                  mstate.esp = mstate.esp - 20;
                  si32(this.i1,mstate.esp);
                  si32(this.i21,mstate.esp + 4);
                  si32(this.i14,mstate.esp + 8);
                  si32(this.i13,mstate.esp + 12);
                  si32(this.i17,mstate.esp + 16);
                  state = 30;
                  mstate.esp = mstate.esp - 4;
                  FSM_luaV_execute.start();
                  return;
               }
               this.i14 = FSM_luaV_execute;
               mstate.esp = mstate.esp - 12;
               si32(this.i1,mstate.esp);
               si32(this.i13,mstate.esp + 4);
               si32(this.i14,mstate.esp + 8);
               state = 31;
               mstate.esp = mstate.esp - 4;
               FSM_luaV_execute.start();
               return;
            case 29:
               this.i14 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               §§goto(addr5653);
            case 30:
               mstate.esp = mstate.esp + 20;
               this.i14 = li32(this.i9);
               this.i13 = this.i19;
               §§goto(addr296);
            case 31:
               mstate.esp = mstate.esp + 12;
               this.i14 = li32(this.i9);
               this.i13 = this.i19;
               §§goto(addr296);
            case 32:
               mstate.esp = mstate.esp + 12;
               this.i13 = li32(this.i7);
               this.i18 = li32(this.i13 + 68);
               this.i13 = li32(this.i13 + 64);
               if(uint(this.i18) >= uint(this.i13))
               {
                  mstate.esp = mstate.esp - 4;
                  si32(this.i1,mstate.esp);
                  state = 33;
                  mstate.esp = mstate.esp - 4;
                  FSM_luaV_execute.start();
                  return;
               }
               addr5934:
               this.i18 = li32(this.i9);
               this.i13 = this.i14 * 12;
               this.i13 = this.i18 + this.i13;
               this.f0 = lf64(this.i13);
               this.i14 = this.i17 * 12;
               this.i14 = this.i18 + this.i14;
               sf64(this.f0,this.i14);
               this.i13 = li32(this.i13 + 8);
               si32(this.i13,this.i14 + 8);
               this.i13 = this.i19;
               this.i14 = this.i18;
               §§goto(addr296);
            case 33:
               mstate.esp = mstate.esp + 4;
               §§goto(addr5934);
            case 34:
               while(true)
               {
                  this.i20 = mstate.eax;
                  mstate.esp = mstate.esp + 12;
                  if(this.i20 != 0)
                  {
                     break;
                  }
                  addr6783:
                  while(true)
                  {
                     this.i14 = 0;
                     §§goto(addr6788);
                  }
               }
               this.i21 = li32(this.i6);
               this.i24 = li32(mstate.ebp + -171);
               this.i24 = li32(this.i24);
               this.f0 = lf64(this.i20);
               sf64(this.f0,this.i21);
               this.i20 = li32(this.i20 + 8);
               si32(this.i20,this.i21 + 8);
               this.i20 = li32(this.i6);
               this.f0 = lf64(this.i14);
               sf64(this.f0,this.i20 + 12);
               this.i14 = li32(this.i22);
               si32(this.i14,this.i20 + 20);
               this.i14 = li32(this.i6);
               this.f0 = lf64(this.i18);
               sf64(this.f0,this.i14 + 24);
               this.i18 = li32(this.i23);
               si32(this.i18,this.i14 + 32);
               this.i14 = li32(this.i5);
               this.i18 = li32(this.i6);
               this.i20 = this.i21 - this.i24;
               this.i14 = this.i14 - this.i18;
               if(this.i14 <= 36)
               {
                  this.i14 = 3;
                  mstate.esp = mstate.esp - 8;
                  si32(this.i1,mstate.esp);
                  si32(this.i14,mstate.esp + 4);
                  state = 36;
                  mstate.esp = mstate.esp - 4;
                  FSM_luaV_execute.start();
                  return;
               }
               addr6615:
               this.i14 = 1;
               this.i18 = li32(this.i6);
               this.i21 = this.i18 + 36;
               si32(this.i21,this.i6);
               mstate.esp = mstate.esp - 12;
               si32(this.i1,mstate.esp);
               si32(this.i18,mstate.esp + 4);
               si32(this.i14,mstate.esp + 8);
               state = 37;
               mstate.esp = mstate.esp - 4;
               FSM_luaV_execute.start();
               return;
            case 35:
               while(true)
               {
                  this.i20 = mstate.eax;
                  mstate.esp = mstate.esp + 12;
                  if(this.i20 == 0)
                  {
                     §§goto(addr6783);
                  }
                  §§goto(addr6447);
               }
            case 36:
               mstate.esp = mstate.esp + 8;
               §§goto(addr6615);
            case 37:
               mstate.esp = mstate.esp + 12;
               this.i14 = li32(this.i6);
               this.i18 = li32(mstate.ebp + -171);
               this.i18 = li32(this.i18);
               this.i21 = this.i14 + -12;
               si32(this.i21,this.i6);
               this.f0 = lf64(this.i14 + -12);
               this.i18 = this.i18 + this.i20;
               sf64(this.f0,this.i18);
               this.i14 = li32(this.i14 + -4);
               si32(this.i14,this.i18 + 8);
               this.i14 = li32(this.i6);
               this.i18 = li32(this.i14 + 8);
               if(this.i18 != 0)
               {
                  if(this.i18 == 1)
                  {
                     this.i14 = li32(this.i14);
                     this.i14 = this.i14 != 0?1:0;
                     this.i14 = this.i14 & 1;
                     §§goto(addr6788);
                  }
                  §§goto(addr6245);
               }
               §§goto(addr6783);
            case 38:
               this.i14 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               if(this.i14 != this.i17)
               {
                  addr6968:
                  this.i14 = li32(this.i9);
                  this.i13 = this.i13 + 8;
               }
               else
               {
                  addr7053:
                  this.i14 = li32(this.i19);
                  this.i14 = this.i14 & -16384;
                  this.i14 = this.i14 >>> 12;
                  this.i17 = li32(this.i9);
                  this.i13 = this.i14 + this.i13;
                  this.i13 = this.i13 + -524276;
                  this.i14 = this.i17;
               }
               §§goto(addr296);
            case 39:
               this.i14 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               if(this.i14 == this.i17)
               {
                  §§goto(addr7053);
               }
               else
               {
                  §§goto(addr6968);
               }
               §§goto(addr296);
            case 40:
               mstate.esp = mstate.esp + 12;
               addr7435:
               if(this.i17 != 0)
               {
                  §§goto(addr7940);
               }
               §§goto(addr7828);
            case 41:
               mstate.esp = mstate.esp + 16;
               §§goto(addr7435);
            case 42:
               this.i20 = mstate.eax;
               mstate.esp = mstate.esp + 16;
               if(this.i20 != -1)
               {
                  this.i14 = this.i20;
                  addr7819:
                  if(this.i14 == this.i17)
                  {
                     §§goto(addr7828);
                  }
                  §§goto(addr7940);
               }
               else
               {
                  this.i20 = 13;
                  mstate.esp = mstate.esp - 16;
                  si32(this.i1,mstate.esp);
                  si32(this.i14,mstate.esp + 4);
                  si32(this.i18,mstate.esp + 8);
                  si32(this.i20,mstate.esp + 12);
                  state = 43;
                  mstate.esp = mstate.esp - 4;
                  FSM_luaV_execute.start();
                  return;
               }
            case 43:
               this.i14 = mstate.eax;
               mstate.esp = mstate.esp + 16;
               if(this.i14 != -1)
               {
                  this.i14 = this.i14 == 0?1:0;
                  this.i14 = this.i14 & 1;
                  if(this.i14 != this.i17)
                  {
                     §§goto(addr7940);
                  }
                  §§goto(addr7828);
               }
               else
               {
                  this.i14 = FSM_luaV_execute;
                  this.i18 = li32(this.i22);
                  this.i20 = li32(this.i23);
                  this.i20 = this.i20 << 2;
                  this.i18 = this.i18 << 2;
                  this.i20 = this.i14 + this.i20;
                  this.i14 = this.i14 + this.i18;
                  this.i14 = li32(this.i14);
                  this.i18 = li32(this.i20);
                  this.i20 = li8(this.i14 + 2);
                  this.i21 = li8(this.i18 + 2);
                  if(this.i20 == this.i21)
                  {
                     this.i18 = FSM_luaV_execute;
                     mstate.esp = mstate.esp - 12;
                     si32(this.i1,mstate.esp);
                     si32(this.i18,mstate.esp + 4);
                     si32(this.i14,mstate.esp + 8);
                     state = 44;
                     mstate.esp = mstate.esp - 4;
                     FSM_luaV_execute.start();
                     return;
                  }
                  this.i20 = FSM_luaV_execute;
                  mstate.esp = mstate.esp - 16;
                  si32(this.i1,mstate.esp);
                  si32(this.i20,mstate.esp + 4);
                  si32(this.i14,mstate.esp + 8);
                  si32(this.i18,mstate.esp + 12);
                  state = 45;
                  mstate.esp = mstate.esp - 4;
                  FSM_luaV_execute.start();
                  return;
               }
            case 44:
               mstate.esp = mstate.esp + 12;
               this.i14 = 0;
               §§goto(addr7819);
            case 45:
               mstate.esp = mstate.esp + 16;
               this.i14 = 0;
               §§goto(addr7819);
            case 46:
               this.i14 = mstate.eax;
               this.i14 = this.i14 < 1?1:0;
               mstate.esp = mstate.esp + 8;
               this.i14 = this.i14 & 1;
               if(this.i14 == this.i17)
               {
                  §§goto(addr7828);
               }
               §§goto(addr7940);
            case 47:
               this.i14 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               if(this.i14 != 1)
               {
                  if(this.i14 == 0)
                  {
                     this.i13 = li32(mstate.ebp + -90);
                     this.i13 = this.i13 + 1;
                     this.i2 = this.i13;
                     addr232:
                     §§goto(addr233);
                  }
                  else
                  {
                     §§goto(addr701);
                  }
                  §§goto(addr702);
               }
               else if(this.i13 >= 0)
               {
                  this.i13 = li32(this.i10);
                  this.i13 = li32(this.i13 + 8);
                  si32(this.i13,this.i6);
                  this.i14 = li32(this.i9);
                  this.i13 = this.i19;
               }
               else
               {
                  this.i14 = li32(this.i9);
                  this.i13 = this.i19;
               }
               §§goto(addr296);
            case 48:
               mstate.esp = mstate.esp + 8;
               §§goto(addr8627);
            case 49:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i13 = li32(mstate.ebp + -90);
               this.i13 = this.i13 + -1;
               this.i14 = li32(mstate.ebp + -90);
               if(this.i14 != 1)
               {
                  if(this.i2 == 0)
                  {
                     this.i2 = this.i13;
                  }
                  else
                  {
                     this.i2 = li32(this.i10);
                     this.i2 = li32(this.i2 + 8);
                     si32(this.i2,this.i6);
                     this.i2 = this.i13;
                  }
                  §§goto(addr232);
               }
               else
               {
                  §§goto(addr701);
               }
               §§goto(addr702);
            case 50:
               this.i25 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               if(this.i25 != 0)
               {
                  this.i25 = 3;
                  this.i23 = this.i23 * 12;
                  this.f0 = lf64(mstate.ebp + -32);
                  this.i23 = this.i14 + this.i23;
                  sf64(this.f0,this.i23);
                  si32(this.i25,this.i21);
                  if(this.i24 != 0)
                  {
                     §§goto(addr9070);
                  }
               }
               §§goto(addr9028);
            case 51:
               mstate.esp = mstate.esp + 8;
               §§goto(addr9256);
            case 52:
               this.i23 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               if(this.i23 != 0)
               {
                  this.i23 = 3;
                  this.i20 = this.i20 * 12;
                  this.f0 = lf64(mstate.ebp + -40);
                  this.i20 = this.i14 + this.i20;
                  sf64(this.f0,this.i20);
                  si32(this.i23,this.i21);
                  §§goto(addr9209);
               }
               §§goto(addr9109);
            case 53:
               mstate.esp = mstate.esp + 8;
               §§goto(addr9256);
            case 54:
               mstate.esp = mstate.esp + 12;
               this.i14 = li32(this.i10);
               this.i18 = li32(this.i9);
               this.i14 = li32(this.i14 + 8);
               si32(this.i14,this.i6);
               this.i14 = this.i18 + this.i24;
               this.i14 = li32(this.i14 + 8);
               if(this.i14 != 0)
               {
                  this.i17 = this.i17 * 12;
                  this.i20 = this.i20 * 12;
                  this.i17 = this.i18 + this.i17;
                  this.f0 = lf64(this.i17);
                  this.i17 = this.i18 + this.i20;
                  sf64(this.f0,this.i17);
                  si32(this.i14,this.i17 + 8);
                  this.i14 = li32(this.i19);
                  this.i14 = this.i14 & -16384;
                  this.i14 = this.i14 >>> 12;
                  this.i13 = this.i14 + this.i13;
                  this.i13 = this.i13 + -524276;
                  this.i14 = this.i18;
               }
               else
               {
                  this.i13 = this.i13 + 8;
                  this.i14 = this.i18;
               }
               §§goto(addr296);
            case 55:
               mstate.esp = mstate.esp + 16;
               addr9946:
               if(this.i18 >= 1)
               {
                  §§goto(addr9953);
               }
               §§goto(addr9759);
            case 56:
               mstate.esp = mstate.esp + 16;
               §§goto(addr9946);
            case 57:
               while(true)
               {
                  this.i26 = mstate.eax;
                  mstate.esp = mstate.esp + 8;
                  this.i27 = this.i17;
                  this.i28 = this.i17;
                  if(this.i26 != this.i22)
                  {
                     this.i25 = this.i26;
                     addr10139:
                     while(true)
                     {
                        this.i22 = this.i25;
                        this.f0 = lf64(this.i27);
                        sf64(this.f0,this.i22);
                        this.i25 = li32(this.i17 + 8);
                        si32(this.i25,this.i22 + 8);
                        this.i22 = li32(this.i17 + 8);
                        if(this.i22 >= 4)
                        {
                           this.i22 = li32(this.i28);
                           this.i22 = li8(this.i22 + 5);
                           this.i22 = this.i22 & 3;
                           if(this.i22 != 0)
                           {
                              this.i22 = li8(this.i23);
                              this.i25 = this.i22 & 4;
                              if(this.i25 != 0)
                              {
                                 this.i25 = li32(this.i7);
                                 this.i22 = this.i22 & -5;
                                 si8(this.i22,this.i23);
                                 this.i22 = li32(this.i25 + 40);
                                 si32(this.i22,this.i21);
                                 si32(this.i24,this.i25 + 40);
                              }
                           }
                        }
                        this.i17 = this.i17 + -12;
                        this.i18 = this.i18 + -1;
                        if(this.i18 < 1)
                        {
                           §§goto(addr9759);
                        }
                        §§goto(addr9999);
                     }
                  }
                  else
                  {
                     break;
                  }
               }
               this.i22 = 3;
               this.f0 = Number(this.i25);
               sf64(this.f0,this.i0);
               si32(this.i22,this.i3);
               mstate.esp = mstate.esp - 12;
               this.i25 = mstate.ebp + -16;
               si32(this.i1,mstate.esp);
               si32(this.i20,mstate.esp + 4);
               si32(this.i25,mstate.esp + 8);
               state = 58;
               mstate.esp = mstate.esp - 4;
               FSM_luaV_execute.start();
               return;
            case 58:
               this.i25 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               §§goto(addr10139);
            case 59:
               mstate.esp = mstate.esp + 8;
               this.i13 = this.i19;
               §§goto(addr296);
            case 60:
               this.i23 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i18,this.i23 + 16);
               this.i18 = this.i23;
               if(this.i22 <= 0)
               {
                  this.i13 = this.i19;
               }
               else
               {
                  this.i19 = 0;
                  this.i24 = this.i19;
                  loop31:
                  while(true)
                  {
                     this.i25 = this.i20 + this.i24;
                     this.i25 = li32(this.i25 + 4);
                     this.i26 = this.i25 >>> 23;
                     this.i25 = this.i25 & 63;
                     if(this.i25 == 4)
                     {
                        this.i26 = this.i26 << 2;
                        this.i26 = this.i2 + this.i26;
                        this.i26 = li32(this.i26 + 20);
                        this.i25 = this.i18 + this.i24;
                        si32(this.i26,this.i25 + 20);
                     }
                     else
                     {
                        this.i25 = li32(this.i7);
                        this.i27 = li32(this.i4);
                        this.i26 = this.i26 * 12;
                        this.i26 = this.i14 + this.i26;
                        if(this.i27 != 0)
                        {
                           this.i27 = this.i4;
                           while(true)
                           {
                              this.i30 = this.i27;
                              this.i28 = li32(this.i30);
                              this.i27 = li32(this.i28 + 8);
                              this.i29 = this.i28;
                              if(uint(this.i27) < uint(this.i26))
                              {
                                 this.i27 = this.i30;
                                 break;
                              }
                              if(this.i27 == this.i26)
                              {
                                 this.i27 = li8(this.i25 + 20);
                                 this.i25 = li8(this.i29 + 5);
                                 this.i27 = this.i27 ^ 3;
                                 this.i26 = this.i29 + 5;
                                 this.i27 = this.i27 & this.i25;
                                 this.i27 = this.i27 & 3;
                                 if(this.i27 == 0)
                                 {
                                    this.i27 = this.i28;
                                 }
                                 else
                                 {
                                    this.i27 = this.i25 ^ 3;
                                    si8(this.i27,this.i26);
                                    this.i27 = this.i28;
                                 }
                                 addr10921:
                                 while(true)
                                 {
                                    this.i25 = this.i27;
                                    this.i26 = this.i18 + this.i24;
                                    si32(this.i25,this.i26 + 20);
                                 }
                              }
                              else
                              {
                                 this.i27 = li32(this.i29);
                                 this.i28 = this.i29;
                                 if(this.i27 != 0)
                                 {
                                    this.i27 = this.i28;
                                    continue;
                                 }
                                 this.i27 = this.i28;
                                 break;
                              }
                           }
                        }
                        else
                        {
                           this.i27 = this.i4;
                        }
                        this.i28 = 24;
                        this.i29 = li32(this.i25 + 12);
                        this.i30 = li32(this.i25 + 16);
                        mstate.esp = mstate.esp - 16;
                        this.i31 = 0;
                        si32(this.i30,mstate.esp);
                        si32(this.i31,mstate.esp + 4);
                        si32(this.i31,mstate.esp + 8);
                        si32(this.i28,mstate.esp + 12);
                        state = 61;
                        mstate.esp = mstate.esp - 4;
                        mstate.funcs[this.i29]();
                        return;
                     }
                     while(true)
                     {
                        this.i24 = this.i24 + 4;
                        this.i19 = this.i19 + 1;
                        if(this.i19 != this.i22)
                        {
                           continue loop31;
                        }
                        break loop31;
                     }
                  }
                  this.i18 = this.i19 << 2;
                  this.i13 = this.i18 + this.i13;
                  this.i13 = this.i13 + 4;
               }
               this.i18 = 6;
               this.i17 = this.i17 * 12;
               si32(this.i23,this.i21);
               this.i14 = this.i14 + this.i17;
               si32(this.i18,this.i14 + 8);
               si32(this.i13,this.i11);
               this.i14 = li32(this.i7);
               this.i17 = li32(this.i14 + 68);
               this.i14 = li32(this.i14 + 64);
               if(uint(this.i17) >= uint(this.i14))
               {
                  mstate.esp = mstate.esp - 4;
                  si32(this.i1,mstate.esp);
                  state = 63;
                  mstate.esp = mstate.esp - 4;
                  FSM_luaV_execute.start();
                  return;
               }
               this.i14 = li32(this.i9);
               §§goto(addr296);
            case 61:
               this.i28 = mstate.eax;
               mstate.esp = mstate.esp + 16;
               if(this.i28 == 0)
               {
                  this.i29 = 4;
                  mstate.esp = mstate.esp - 8;
                  si32(this.i1,mstate.esp);
                  si32(this.i29,mstate.esp + 4);
                  state = 62;
                  mstate.esp = mstate.esp - 4;
                  FSM_luaV_execute.start();
                  return;
               }
               addr10804:
               this.i29 = 10;
               this.i30 = li32(this.i25 + 68);
               this.i30 = this.i30 + 24;
               si32(this.i30,this.i25 + 68);
               si8(this.i29,this.i28 + 4);
               this.i29 = li8(this.i25 + 20);
               this.i29 = this.i29 & 3;
               si8(this.i29,this.i28 + 5);
               si32(this.i26,this.i28 + 8);
               this.i26 = li32(this.i27);
               si32(this.i26,this.i28);
               si32(this.i28,this.i27);
               this.i27 = this.i25 + 108;
               si32(this.i27,this.i28 + 12);
               this.i27 = li32(this.i25 + 124);
               si32(this.i27,this.i28 + 16);
               si32(this.i28,this.i27 + 12);
               si32(this.i28,this.i25 + 124);
               this.i27 = this.i28;
               §§goto(addr10921);
            case 62:
               mstate.esp = mstate.esp + 8;
               §§goto(addr10804);
            case 63:
               mstate.esp = mstate.esp + 4;
               this.i14 = li32(this.i9);
               §§goto(addr296);
            case 64:
               mstate.esp = mstate.esp + 8;
               §§goto(addr11294);
            case 65:
               mstate.esp = mstate.esp + 8;
               §§goto(addr11294);
         }
      }
   }
}
