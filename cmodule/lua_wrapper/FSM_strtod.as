package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.lf64;
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.li8;
   import avm2.intrinsics.memory.sf64;
   import avm2.intrinsics.memory.si32;
   import avm2.intrinsics.memory.sxi8;
   
   public final class FSM_strtod extends Machine
   {
      
      public static const intRegCount:int = 23;
      
      public static const NumberRegCount:int = 4;
       
      
      public var i21:int;
      
      public var f0:Number;
      
      public var f1:Number;
      
      public var f2:Number;
      
      public var f3:Number;
      
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
      
      public var i20:int;
      
      public var i9:int;
      
      public function FSM_strtod()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM_strtod = null;
         _loc1_ = new FSM_strtod();
         FSM_strtod.gworker = _loc1_;
      }
      
      override public final function work() : void
      {
         switch(state)
         {
            case 0:
               mstate.esp = mstate.esp - 4;
               si32(mstate.ebp,mstate.esp);
               mstate.ebp = mstate.esp;
               mstate.esp = mstate.esp - 88;
               this.i0 = 0;
               si32(this.i0,mstate.ebp + -32);
               si32(this.i0,mstate.ebp + -28);
               this.i0 = li32(mstate.ebp + 8);
               si32(this.i0,mstate.ebp + -36);
               this.i1 = si8(li8(this.i0));
               this.i2 = mstate.ebp + -16;
               this.i3 = li32(mstate.ebp + 12);
               if(this.i1 <= 31)
               {
                  if(this.i1 != 0)
                  {
                     this.i1 = this.i1 + -9;
                     if(uint(this.i1) >= uint(5))
                     {
                        addr7786:
                        this.i1 = 0;
                        addr279:
                        this.i4 = this.i0;
                        this.i5 = li8(this.i4);
                        if(this.i5 != 48)
                        {
                           this.i2 = 0;
                        }
                        else
                        {
                           this.i5 = si8(li8(this.i4 + 1));
                           if(this.i5 != 88)
                           {
                              if(this.i5 != 120)
                              {
                                 this.i2 = this.i4;
                                 while(true)
                                 {
                                    this.i4 = this.i2 + 1;
                                    si32(this.i4,mstate.ebp + -36);
                                    this.i2 = li8(this.i2 + 1);
                                    if(this.i2 != 0)
                                    {
                                       this.i2 = this.i2 & 255;
                                       if(this.i2 == 48)
                                       {
                                          this.i2 = this.i4;
                                          continue;
                                       }
                                       this.i2 = 1;
                                    }
                                    break;
                                 }
                                 if(this.i3 != 0)
                                 {
                                    addr809:
                                    addr478:
                                    this.i2 = this.i1;
                                    addr479:
                                    this.i0 = li32(mstate.ebp + -36);
                                    si32(this.i0,this.i3);
                                 }
                                 else
                                 {
                                    addr875:
                                    this.i2 = this.i1;
                                 }
                                 this.i0 = this.i2;
                                 this.f0 = lf64(mstate.ebp + -32);
                                 if(this.i0 != 0)
                                 {
                                    this.f0 = -this.f0;
                                 }
                                 mstate.st0 = this.f0;
                                 mstate.esp = mstate.ebp;
                                 mstate.ebp = li32(mstate.esp);
                                 mstate.esp = mstate.esp + 4;
                                 mstate.esp = mstate.esp + 4;
                                 mstate.gworker = caller;
                                 return;
                              }
                           }
                           this.i4 = FSM_strtod;
                           mstate.esp = mstate.esp - 20;
                           this.i5 = mstate.ebp + -24;
                           this.i6 = mstate.ebp + -20;
                           this.i7 = mstate.ebp + -36;
                           si32(this.i7,mstate.esp);
                           si32(this.i4,mstate.esp + 4);
                           si32(this.i6,mstate.esp + 8);
                           si32(this.i5,mstate.esp + 12);
                           si32(this.i1,mstate.esp + 16);
                           state = 1;
                           mstate.esp = mstate.esp - 4;
                           FSM_strtod.start();
                           return;
                        }
                        this.i5 = li8(this.i4);
                        this.i6 = this.i5 << 24;
                        this.i6 = this.i6 >> 24;
                        this.i7 = this.i5 + -48;
                        this.i7 = this.i7 & 255;
                        if(uint(this.i7) >= uint(10))
                        {
                           this.i7 = 0;
                           this.i8 = this.i7;
                           this.i9 = this.i7;
                        }
                        else
                        {
                           this.i5 = 0;
                           this.i7 = this.i5;
                           this.i8 = this.i4;
                           this.i9 = this.i5;
                           while(true)
                           {
                              if(this.i7 <= 8)
                              {
                                 this.i9 = this.i9 * 10;
                                 this.i6 = this.i9 + this.i6;
                                 this.i6 = this.i6 + -48;
                              }
                              else if(this.i7 >= 16)
                              {
                                 this.i6 = this.i9;
                              }
                              else
                              {
                                 this.i5 = this.i5 * 10;
                                 this.i5 = this.i6 + this.i5;
                                 this.i5 = this.i5 + -48;
                                 this.i6 = this.i9;
                              }
                              this.i9 = this.i8 + 1;
                              si32(this.i9,mstate.ebp + -36);
                              this.i10 = li8(this.i8 + 1);
                              this.i8 = this.i10 << 24;
                              this.i11 = this.i8 >> 24;
                              this.i7 = this.i7 + 1;
                              this.i8 = this.i10 + -48;
                              this.i8 = this.i8 & 255;
                              if(uint(this.i8) >= uint(10))
                              {
                                 break;
                              }
                              this.i8 = this.i9;
                              this.i9 = this.i6;
                              this.i6 = this.i11;
                           }
                           this.i8 = this.i6;
                           this.i9 = this.i5;
                           this.i5 = this.i10;
                           this.i6 = this.i11;
                        }
                        mstate.esp = mstate.esp - 4;
                        FSM_strtod.start();
                     }
                  }
                  addr3136:
                  addr3140:
                  this.i1 = this.i0;
                  this.i2 = this.i1;
                  si32(this.i2,mstate.ebp + -36);
                  if(this.i3 != 0)
                  {
                     addr474:
                     this.i2 = 0;
                     §§goto(addr479);
                  }
                  else
                  {
                     addr3158:
                     this.i2 = 0;
                  }
                  §§goto(addr3163);
               }
               else
               {
                  if(this.i1 != 32)
                  {
                     if(this.i1 != 43)
                     {
                        if(this.i1 == 45)
                        {
                           this.i1 = this.i0;
                           addr184:
                           this.i4 = this.i1 + 1;
                           si32(this.i4,mstate.ebp + -36);
                           this.i1 = li8(this.i1 + 1);
                           if(this.i1 != 0)
                           {
                              this.i1 = 1;
                           }
                        }
                        else
                        {
                           §§goto(addr7786);
                        }
                        §§goto(addr279);
                     }
                     else
                     {
                        this.i1 = this.i0;
                     }
                     §§goto(addr3136);
                  }
                  addr219:
                  this.i4 = this.i1 + 1;
                  si32(this.i4,mstate.ebp + -36);
                  this.i1 = li8(this.i1 + 1);
                  if(this.i1 != 0)
                  {
                     this.i1 = 0;
                     §§goto(addr279);
                  }
                  §§goto(addr3136);
               }
               this.i1 = this.i0;
               while(true)
               {
                  this.i4 = this.i1 + 1;
                  si32(this.i4,mstate.ebp + -36);
                  this.i1 = si8(li8(this.i1 + 1));
                  if(this.i1 <= 31)
                  {
                     if(this.i1 != 0)
                     {
                        this.i1 = this.i1 + -9;
                        if(uint(this.i1) >= uint(5))
                        {
                           addr274:
                           this.i1 = 0;
                        }
                        else
                        {
                           continue;
                        }
                     }
                     break;
                  }
                  if(this.i1 != 32)
                  {
                     if(this.i1 != 43)
                     {
                        if(this.i1 == 45)
                        {
                           this.i1 = this.i4;
                           §§goto(addr184);
                        }
                        else
                        {
                           §§goto(addr274);
                        }
                     }
                     else
                     {
                        this.i1 = this.i4;
                        §§goto(addr219);
                     }
                  }
                  else
                  {
                     continue;
                  }
                  §§goto(addr279);
               }
               §§goto(addr3136);
            case 1:
               this.i4 = mstate.eax;
               mstate.esp = mstate.esp + 20;
               this.i5 = this.i4 & 7;
               if(this.i5 != 0)
               {
                  if(this.i5 == 6)
                  {
                     si32(this.i0,mstate.ebp + -36);
                     if(this.i3 != 0)
                     {
                        §§goto(addr474);
                     }
                     else
                     {
                        §§goto(addr3158);
                     }
                  }
                  else
                  {
                     this.i0 = mstate.ebp + -16;
                     this.i5 = li32(mstate.ebp + -24);
                     this.i6 = mstate.ebp + -32;
                     this.i7 = this.i5;
                     if(this.i5 != 0)
                     {
                        this.i8 = mstate.ebp + -16;
                        this.i9 = li32(FSM_strtod);
                        this.i9 = this.i9 + -1;
                        this.i9 = this.i9 >> 5;
                        this.i9 = this.i9 << 2;
                        this.i7 = li32(this.i7 + 16);
                        this.i8 = this.i9 + this.i8;
                        this.i8 = this.i8 + 4;
                        if(this.i7 <= 0)
                        {
                           this.i2 = this.i0;
                        }
                        else
                        {
                           this.i9 = 0;
                           this.i10 = this.i9;
                           while(true)
                           {
                              this.i11 = this.i5 + this.i10;
                              this.i11 = li32(this.i11 + 20);
                              this.i12 = this.i2 + this.i10;
                              si32(this.i11,this.i12);
                              this.i10 = this.i10 + 4;
                              this.i9 = this.i9 + 1;
                              if(this.i9 < this.i7)
                              {
                                 continue;
                              }
                              break;
                           }
                           this.i2 = mstate.ebp + -16;
                           this.i5 = this.i9 << 2;
                           this.i2 = this.i2 + this.i5;
                        }
                        this.i5 = this.i2;
                        if(uint(this.i2) < uint(this.i8))
                        {
                           this.i2 = this.i5;
                           while(true)
                           {
                              this.i9 = 0;
                              si32(this.i9,this.i2);
                              this.i2 = this.i2 + 4;
                              if(uint(this.i2) < uint(this.i8))
                              {
                                 continue;
                              }
                              break;
                           }
                        }
                        this.i2 = li32(mstate.ebp + -24);
                        if(this.i2 != 0)
                        {
                           this.i5 = FSM_strtod;
                           this.i7 = li32(this.i2 + 4);
                           this.i7 = this.i7 << 2;
                           this.i5 = this.i5 + this.i7;
                           this.i7 = li32(this.i5);
                           si32(this.i7,this.i2);
                           si32(this.i2,this.i5);
                        }
                        this.i2 = li32(mstate.ebp + -20);
                        mstate.esp = mstate.esp - 16;
                        si32(this.i6,mstate.esp);
                        si32(this.i0,mstate.esp + 4);
                        si32(this.i2,mstate.esp + 8);
                        si32(this.i4,mstate.esp + 12);
                        mstate.esp = mstate.esp - 4;
                        FSM_strtod.start();
                     }
                     else
                     {
                        this.i2 = li32(mstate.ebp + -20);
                        mstate.esp = mstate.esp - 16;
                        si32(this.i6,mstate.esp);
                        si32(this.i0,mstate.esp + 4);
                        si32(this.i2,mstate.esp + 8);
                        si32(this.i4,mstate.esp + 12);
                        mstate.esp = mstate.esp - 4;
                        FSM_strtod.start();
                     }
                  }
                  §§goto(addr3163);
               }
               else
               {
                  §§goto(addr7780);
               }
               §§goto(addr875);
            case 2:
               mstate.esp = mstate.esp + 16;
               if(this.i3 != 0)
               {
                  §§goto(addr809);
               }
               else
               {
                  §§goto(addr875);
               }
               §§goto(addr3163);
            case 3:
               mstate.esp = mstate.esp + 16;
               if(this.i3 != 0)
               {
                  §§goto(addr809);
               }
               else
               {
                  §§goto(addr875);
               }
               §§goto(addr3163);
            case 4:
               this.i10 = li32(FSM_strtod);
               this.i10 = li8(this.i10);
               this.i5 = this.i5 & 255;
               if(this.i10 != this.i5)
               {
                  this.i5 = 0;
                  this.i10 = this.i7;
                  this.i11 = this.i5;
               }
               else
               {
                  this.i5 = li32(mstate.ebp + -36);
                  this.i6 = this.i5 + 1;
                  si32(this.i6,mstate.ebp + -36);
                  this.i5 = li8(this.i5 + 1);
                  this.i10 = this.i5 << 24;
                  this.i10 = this.i10 >> 24;
                  if(this.i7 != 0)
                  {
                     this.i5 = 0;
                     this.i11 = this.i7;
                     this.i12 = this.i5;
                     addr1741:
                     while(true)
                     {
                        this.i13 = this.i11;
                        this.i14 = this.i12;
                        this.i15 = this.i5;
                        this.i16 = this.i4;
                        this.i4 = this.i10 + -48;
                        if(uint(this.i4) >= uint(10))
                        {
                           this.i6 = this.i10;
                           this.i10 = this.i13;
                           this.i11 = this.i14;
                           this.i5 = this.i15;
                           this.i4 = this.i16;
                           break;
                        }
                        this.i11 = this.i6;
                        this.i12 = this.i13;
                        this.i5 = this.i14;
                        this.i4 = this.i15;
                        this.i6 = this.i16;
                     }
                  }
                  else
                  {
                     this.i5 = this.i5 & 255;
                     if(this.i5 != 48)
                     {
                        this.i5 = 0;
                     }
                     else
                     {
                        this.i5 = 0;
                        while(true)
                        {
                           this.i10 = this.i6 + 1;
                           si32(this.i10,mstate.ebp + -36);
                           this.i6 = li8(this.i6 + 1);
                           this.i5 = this.i5 + 1;
                           if(this.i6 == 48)
                           {
                              this.i6 = this.i10;
                              continue;
                           }
                           break;
                        }
                        this.i6 = this.i6 << 24;
                        this.i11 = this.i6 >> 24;
                        this.i6 = this.i10;
                        this.i10 = this.i11;
                     }
                     this.i11 = this.i10 + -49;
                     if(uint(this.i11) >= uint(9))
                     {
                        this.i11 = 0;
                        this.i6 = this.i10;
                        this.i10 = this.i7;
                     }
                     else
                     {
                        this.i4 = 0;
                        this.i11 = this.i6;
                        this.i12 = this.i7;
                     }
                  }
                  while(true)
                  {
                     this.i13 = this.i6;
                     this.i6 = this.i8;
                     this.i8 = this.i9;
                     this.i9 = this.i11;
                     this.i11 = this.i12;
                     while(true)
                     {
                        this.i12 = this.i10 + -48;
                        this.i14 = this.i4 + 1;
                        if(this.i10 == 48)
                        {
                           this.i4 = this.i11;
                           this.i11 = this.i14;
                           break;
                        }
                        this.i10 = this.i11 < 9?1:0;
                        this.i5 = this.i14 + this.i5;
                        if(this.i14 <= 1)
                        {
                           this.i4 = this.i6;
                           this.i6 = this.i8;
                           this.i8 = this.i10;
                        }
                        else
                        {
                           this.i14 = 0;
                           this.i15 = this.i11 + 1;
                           while(true)
                           {
                              this.i10 = this.i10 ^ 1;
                              this.i16 = this.i15 + this.i14;
                              this.i10 = this.i10 & 1;
                              if(this.i10 == 0)
                              {
                                 this.i6 = this.i6 * 10;
                              }
                              else if(this.i16 < 17)
                              {
                                 this.i8 = this.i8 * 10;
                              }
                              this.i10 = this.i16 < 9?1:0;
                              this.i14 = this.i14 + 1;
                              if(this.i14 != this.i4)
                              {
                                 continue;
                              }
                              break;
                           }
                           this.i11 = this.i4 + this.i11;
                           this.i4 = this.i6;
                           this.i6 = this.i8;
                           this.i8 = this.i10;
                        }
                        this.i10 = this.i4;
                        this.i14 = this.i6;
                        this.i4 = this.i8;
                        this.i6 = this.i11;
                        this.i4 = this.i4 ^ 1;
                        this.i8 = this.i6 + 1;
                        this.i4 = this.i4 & 1;
                        if(this.i4 == 0)
                        {
                           this.i4 = this.i9 + 1;
                           si32(this.i4,mstate.ebp + -36);
                           this.i6 = this.i10 * 10;
                           this.i10 = si8(li8(this.i9 + 1));
                           this.i12 = this.i6 + this.i12;
                           this.i6 = this.i10 + -48;
                           if(uint(this.i6) >= uint(10))
                           {
                              this.i4 = 0;
                              this.i6 = this.i10;
                              this.i10 = this.i8;
                              this.i11 = this.i5;
                              this.i5 = this.i4;
                              this.i4 = this.i13;
                              this.i8 = this.i12;
                              this.i9 = this.i14;
                           }
                           else
                           {
                              this.i6 = 0;
                              this.i9 = this.i4;
                              this.i11 = this.i8;
                              this.i4 = this.i6;
                              this.i6 = this.i12;
                              this.i8 = this.i14;
                              continue;
                           }
                        }
                        else
                        {
                           if(this.i8 >= 17)
                           {
                              this.i6 = 0;
                              this.i4 = this.i8;
                              this.i11 = this.i6;
                              this.i6 = this.i10;
                              this.i8 = this.i14;
                              break;
                           }
                           this.i6 = 0;
                           this.i4 = this.i14 * 10;
                           this.i12 = this.i4 + this.i12;
                           this.i4 = this.i8;
                           this.i11 = this.i6;
                           this.i6 = this.i10;
                           this.i8 = this.i12;
                           break;
                        }
                     }
                     this.i14 = this.i11;
                     this.i15 = this.i6;
                     this.i16 = this.i8;
                     this.i6 = this.i9 + 1;
                     si32(this.i6,mstate.ebp + -36);
                     this.i8 = si8(li8(this.i9 + 1));
                     this.i10 = this.i8;
                     this.i11 = this.i4;
                     this.i12 = this.i5;
                     this.i5 = this.i14;
                     this.i4 = this.i13;
                     this.i8 = this.i15;
                     this.i9 = this.i16;
                     §§goto(addr1741);
                  }
               }
               if(this.i6 != 69)
               {
                  if(this.i6 != 101)
                  {
                     this.i12 = 0;
                     addr1807:
                     if(this.i10 != 0)
                     {
                        this.i2 = this.i12;
                        addr2279:
                        this.f0 = Number(uint(this.i8));
                        sf64(this.f0,mstate.ebp + -32);
                        this.i0 = this.i7 == 0?int(this.i10):int(this.i7);
                        this.i5 = this.i10 < 17?int(this.i10):16;
                        this.i6 = this.i2 - this.i11;
                        if(this.i5 <= 9)
                        {
                           this.f1 = this.f0;
                        }
                        else
                        {
                           this.i7 = FSM_strtod;
                           this.i12 = this.i5 << 3;
                           this.i7 = this.i12 + this.i7;
                           this.f1 = lf64(this.i7 + -72);
                           this.f2 = Number(uint(this.i9));
                           this.f0 = this.f1 * this.f0;
                           this.f0 = this.f0 + this.f2;
                           sf64(this.f0,mstate.ebp + -32);
                           this.f1 = this.f0;
                        }
                        if(this.i10 <= 15)
                        {
                           if(this.i2 != this.i11)
                           {
                              if(this.i6 >= 1)
                              {
                                 if(this.i6 <= 22)
                                 {
                                    this.i2 = FSM_strtod;
                                    this.i0 = this.i6 << 3;
                                    this.i2 = this.i2 + this.i0;
                                    if(this.i1 != 0)
                                    {
                                       this.f1 = lf64(this.i2);
                                       this.f0 = -this.f0;
                                       this.f0 = this.f1 * this.f0;
                                       sf64(this.f0,mstate.ebp + -32);
                                       if(this.i3 != 0)
                                       {
                                          §§goto(addr474);
                                       }
                                       else
                                       {
                                          §§goto(addr3158);
                                       }
                                    }
                                    else
                                    {
                                       this.f1 = lf64(this.i2);
                                       this.f0 = this.f0 * this.f1;
                                       sf64(this.f0,mstate.ebp + -32);
                                       if(this.i3 != 0)
                                       {
                                          §§goto(addr809);
                                       }
                                    }
                                    §§goto(addr3163);
                                 }
                                 else
                                 {
                                    this.i2 = 15 - this.i10;
                                    this.i7 = 37 - this.i10;
                                    if(this.i7 >= this.i6)
                                    {
                                       if(this.i1 == 0)
                                       {
                                          this.i0 = this.i1;
                                       }
                                       else
                                       {
                                          this.i0 = 0;
                                          this.f0 = -this.f0;
                                          sf64(this.f0,mstate.ebp + -32);
                                       }
                                       this.i1 = FSM_strtod;
                                       this.i4 = this.i2 << 3;
                                       this.i2 = this.i6 - this.i2;
                                       this.i2 = this.i2 << 3;
                                       this.i4 = this.i1 + this.i4;
                                       this.f1 = lf64(this.i4);
                                       this.i2 = this.i1 + this.i2;
                                       this.f2 = lf64(this.i2);
                                       this.f0 = this.f0 * this.f1;
                                       this.f0 = this.f0 * this.f2;
                                       sf64(this.f0,mstate.ebp + -32);
                                       if(this.i3 != 0)
                                       {
                                          this.i2 = this.i0;
                                          §§goto(addr478);
                                       }
                                       else
                                       {
                                          this.i2 = this.i0;
                                          addr3162:
                                       }
                                    }
                                    §§goto(addr3163);
                                 }
                                 §§goto(addr875);
                              }
                              else
                              {
                                 if(this.i6 >= -22)
                                 {
                                    if(this.i1 == 0)
                                    {
                                       this.i2 = this.i1;
                                    }
                                    else
                                    {
                                       this.i2 = 0;
                                       this.f0 = -this.f0;
                                       sf64(this.f0,mstate.ebp + -32);
                                    }
                                    this.f1 = this.f0;
                                    this.i0 = FSM_strtod;
                                    this.i1 = 0 - this.i6;
                                    this.i1 = this.i1 << 3;
                                    this.i0 = this.i0 + this.i1;
                                    this.f0 = lf64(this.i0);
                                    this.f1 = this.f1 / this.f0;
                                    sf64(this.f1,mstate.ebp + -32);
                                    if(this.i3 != 0)
                                    {
                                       §§goto(addr478);
                                    }
                                    else
                                    {
                                       §§goto(addr3162);
                                    }
                                 }
                                 §§goto(addr3163);
                              }
                           }
                        }
                        this.i2 = this.i10 - this.i5;
                        this.i2 = this.i6 + this.i2;
                        if(this.i2 >= 1)
                        {
                           this.i5 = this.i2 & 15;
                           if(this.i5 != 0)
                           {
                              this.i7 = FSM_strtod;
                              this.i5 = this.i5 << 3;
                              this.i5 = this.i7 + this.i5;
                              this.f0 = lf64(this.i5);
                              this.f1 = this.f1 * this.f0;
                              sf64(this.f1,mstate.ebp + -32);
                           }
                           this.i5 = this.i2 & -16;
                           if(uint(this.i2) > uint(15))
                           {
                              if(this.i5 < 309)
                              {
                                 this.i2 = this.i5 >> 4;
                                 if(this.i2 <= 1)
                                 {
                                    this.i2 = 0;
                                 }
                                 else
                                 {
                                    this.i5 = FSM_strtod;
                                    this.i7 = 0;
                                    while(true)
                                    {
                                       this.i9 = this.i5;
                                       this.i11 = this.i2 & 1;
                                       if(this.i11 != 0)
                                       {
                                          this.f0 = lf64(this.i9);
                                          this.f1 = this.f1 * this.f0;
                                       }
                                       this.i5 = this.i5 + 8;
                                       this.i7 = this.i7 + 1;
                                       this.i2 = this.i2 >> 1;
                                       if(this.i2 >= 2)
                                       {
                                          continue;
                                       }
                                       break;
                                    }
                                    sf64(this.f1,mstate.ebp + -32);
                                    this.i2 = this.i7;
                                 }
                                 this.i5 = FSM_strtod;
                                 this.i7 = li32(mstate.ebp + -28);
                                 this.i2 = this.i2 << 3;
                                 this.i7 = this.i7 + -55574528;
                                 si32(this.i7,mstate.ebp + -28);
                                 this.i2 = this.i5 + this.i2;
                                 this.f1 = lf64(mstate.ebp + -32);
                                 this.f0 = lf64(this.i2);
                                 this.f1 = this.f1 * this.f0;
                                 sf64(this.f1,mstate.ebp + -32);
                                 this.i2 = li32(mstate.ebp + -28);
                                 this.i5 = mstate.ebp + -32;
                                 this.i7 = this.i2 & 2146435072;
                                 this.i5 = this.i5 + 4;
                                 if(uint(this.i7) <= uint(2090860544))
                                 {
                                    if(uint(this.i7) >= uint(2089811969))
                                    {
                                       this.i2 = 2146435071;
                                       si32(this.i2,this.i5);
                                       this.i2 = -1;
                                       si32(this.i2,mstate.ebp + -32);
                                       mstate.esp = mstate.esp - 16;
                                       si32(this.i4,mstate.esp);
                                       si32(this.i0,mstate.esp + 4);
                                       si32(this.i10,mstate.esp + 8);
                                       si32(this.i8,mstate.esp + 12);
                                       state = 7;
                                       mstate.esp = mstate.esp - 4;
                                       FSM_strtod.start();
                                       return;
                                    }
                                    this.i7 = 0;
                                    this.i2 = this.i2 + 55574528;
                                    si32(this.i2,this.i5);
                                    mstate.esp = mstate.esp - 16;
                                    si32(this.i4,mstate.esp);
                                    si32(this.i0,mstate.esp + 4);
                                    si32(this.i10,mstate.esp + 8);
                                    si32(this.i8,mstate.esp + 12);
                                    state = 10;
                                    mstate.esp = mstate.esp - 4;
                                    FSM_strtod.start();
                                    return;
                                 }
                              }
                              this.i2 = 0;
                              this.i4 = this.i0;
                              this.i5 = this.i0;
                              addr3752:
                              this.i6 = 34;
                              si32(this.i6,FSM_strtod);
                              this.i6 = 2146435072;
                              si32(this.i6,mstate.ebp + -28);
                              this.i6 = 0;
                              si32(this.i6,mstate.ebp + -32);
                              if(this.i2 != 0)
                              {
                                 addr7553:
                                 this.i6 = li32(mstate.ebp + -24);
                                 if(this.i6 != 0)
                                 {
                                    this.i7 = FSM_strtod;
                                    this.i8 = li32(this.i6 + 4);
                                    this.i8 = this.i8 << 2;
                                    this.i7 = this.i7 + this.i8;
                                    this.i8 = li32(this.i7);
                                    si32(this.i8,this.i6);
                                    si32(this.i6,this.i7);
                                 }
                                 if(this.i4 != 0)
                                 {
                                    this.i6 = FSM_strtod;
                                    this.i7 = li32(this.i4 + 4);
                                    this.i7 = this.i7 << 2;
                                    this.i6 = this.i6 + this.i7;
                                    this.i7 = li32(this.i6);
                                    si32(this.i7,this.i4);
                                    si32(this.i4,this.i6);
                                 }
                                 if(this.i5 != 0)
                                 {
                                    this.i4 = FSM_strtod;
                                    this.i6 = li32(this.i5 + 4);
                                    this.i6 = this.i6 << 2;
                                    this.i4 = this.i4 + this.i6;
                                    this.i6 = li32(this.i4);
                                    si32(this.i6,this.i5);
                                    si32(this.i5,this.i4);
                                 }
                                 if(this.i2 != 0)
                                 {
                                    this.i4 = FSM_strtod;
                                    this.i5 = li32(this.i2 + 4);
                                    this.i5 = this.i5 << 2;
                                    this.i4 = this.i4 + this.i5;
                                    this.i5 = li32(this.i4);
                                    si32(this.i5,this.i2);
                                    si32(this.i2,this.i4);
                                 }
                                 if(this.i0 != 0)
                                 {
                                    this.i2 = FSM_strtod;
                                    this.i4 = li32(this.i0 + 4);
                                    this.i4 = this.i4 << 2;
                                    this.i2 = this.i2 + this.i4;
                                    this.i4 = li32(this.i2);
                                    si32(this.i4,this.i0);
                                    si32(this.i0,this.i2);
                                 }
                              }
                           }
                        }
                        else if(this.i2 <= -1)
                        {
                           this.i2 = 0 - this.i2;
                           this.i5 = this.i2 & 15;
                           if(this.i5 != 0)
                           {
                              this.i7 = FSM_strtod;
                              this.i5 = this.i5 << 3;
                              this.i5 = this.i7 + this.i5;
                              this.f0 = lf64(this.i5);
                              this.f1 = this.f1 / this.f0;
                              sf64(this.f1,mstate.ebp + -32);
                           }
                           this.f0 = this.f1;
                           this.i5 = this.i2 >> 4;
                           if(uint(this.i2) >= uint(16))
                           {
                              if(this.i5 < 32)
                              {
                                 this.i2 = this.i5 & 16;
                                 this.i2 = this.i2 == 0?0:106;
                                 if(this.i5 >= 1)
                                 {
                                    this.i7 = FSM_strtod;
                                    while(true)
                                    {
                                       this.i9 = this.i7;
                                       this.i11 = this.i5 & 1;
                                       if(this.i11 != 0)
                                       {
                                          this.f1 = lf64(this.i9);
                                          this.f0 = this.f0 * this.f1;
                                       }
                                       this.i7 = this.i7 + 8;
                                       this.i5 = this.i5 >> 1;
                                       if(this.i5 >= 1)
                                       {
                                          continue;
                                       }
                                       break;
                                    }
                                    sf64(this.f0,mstate.ebp + -32);
                                 }
                                 if(this.i2 != 0)
                                 {
                                    this.i5 = mstate.ebp + -32;
                                    this.i7 = li32(mstate.ebp + -28);
                                    this.i9 = this.i7 >>> 20;
                                    this.i9 = this.i9 & 2047;
                                    this.i9 = 107 - this.i9;
                                    this.i5 = this.i5 + 4;
                                    if(this.i9 >= 1)
                                    {
                                       this.i11 = mstate.ebp + -32;
                                       if(this.i9 >= 32)
                                       {
                                          this.i12 = 0;
                                          si32(this.i12,this.i11);
                                          if(this.i9 >= 53)
                                          {
                                             this.i7 = 57671680;
                                             si32(this.i7,this.i5);
                                             this.f0 = lf64(mstate.ebp + -32);
                                             this.f1 = 0;
                                             if(this.f0 != this.f1)
                                             {
                                                addr3667:
                                             }
                                          }
                                          else
                                          {
                                             this.i11 = -1;
                                             this.i9 = this.i9 + -32;
                                             this.i9 = this.i11 << this.i9;
                                             this.i9 = this.i7 & this.i9;
                                             si32(this.i9,this.i5);
                                             this.f0 = lf64(mstate.ebp + -32);
                                             this.f1 = 0;
                                             if(this.f0 != this.f1)
                                             {
                                                addr4649:
                                                §§goto(addr3667);
                                             }
                                          }
                                       }
                                       else
                                       {
                                          this.i5 = -1;
                                          this.i7 = li32(this.i11);
                                          this.i5 = this.i5 << this.i9;
                                          this.i5 = this.i7 & this.i5;
                                          si32(this.i5,this.i11);
                                       }
                                       addr4428:
                                    }
                                 }
                                 this.f0 = 0;
                                 this.f1 = lf64(mstate.ebp + -32);
                                 if(this.f1 != this.f0)
                                 {
                                    §§goto(addr4649);
                                 }
                                 else
                                 {
                                    §§goto(addr4428);
                                 }
                              }
                              this.i2 = 0;
                              this.i4 = this.i0;
                              this.i5 = this.i0;
                              addr4442:
                              this.i6 = 0;
                              si32(this.i6,mstate.ebp + -32);
                              si32(this.i6,mstate.ebp + -28);
                              this.i6 = 34;
                              si32(this.i6,FSM_strtod);
                              if(this.i2 != 0)
                              {
                                 §§goto(addr7553);
                              }
                           }
                           addr3668:
                           mstate.esp = mstate.esp - 16;
                           si32(this.i4,mstate.esp);
                           si32(this.i0,mstate.esp + 4);
                           si32(this.i10,mstate.esp + 8);
                           si32(this.i8,mstate.esp + 12);
                           state = 6;
                           mstate.esp = mstate.esp - 4;
                           FSM_strtod.start();
                           return;
                        }
                        this.i2 = 0;
                        §§goto(addr3668);
                     }
                     §§goto(addr7780);
                  }
                  addr2339:
                  this.i4 = this.i6;
                  this.i7 = this.i0;
                  if(this.i5 == 0)
                  {
                     if(this.i2 == 0)
                     {
                        if(this.i4 <= 104)
                        {
                           if(this.i4 != 73)
                           {
                              if(this.i4 == 78)
                              {
                                 addr2376:
                                 this.i2 = FSM_strtod;
                                 this.i4 = li32(mstate.ebp + -36);
                                 this.i8 = 97;
                                 this.i9 = 0;
                                 this.i10 = this.i4;
                                 while(true)
                                 {
                                    this.i11 = this.i10 + this.i9;
                                    this.i11 = li8(this.i11 + 1);
                                    this.i0 = this.i11 << 24;
                                    this.i0 = this.i0 >> 24;
                                    this.i11 = this.i11 + -65;
                                    this.i8 = this.i8 << 24;
                                    this.i11 = this.i11 & 255;
                                    this.i5 = this.i0 + 32;
                                    this.i11 = uint(this.i11) > uint(25)?int(this.i0):int(this.i5);
                                    this.i8 = this.i8 >> 24;
                                    if(this.i11 != this.i8)
                                    {
                                       this.i2 = 1;
                                       this.i9 = this.i4;
                                       break;
                                    }
                                    this.i8 = this.i2 + this.i9;
                                    this.i8 = li8(this.i8 + 1);
                                    this.i9 = this.i9 + 1;
                                    if(this.i8 != 0)
                                    {
                                       continue;
                                    }
                                    this.i2 = 0;
                                    this.i9 = this.i9 << 0;
                                    this.i9 = this.i9 + this.i4;
                                    this.i9 = this.i9 + 1;
                                    si32(this.i9,mstate.ebp + -36);
                                    break;
                                 }
                                 this.i4 = this.i9;
                                 this.i2 = this.i2 & 1;
                                 if(this.i2 == 0)
                                 {
                                    this.i2 = li8(this.i4);
                                    if(this.i2 == 40)
                                    {
                                       this.i2 = FSM_strtod;
                                       mstate.esp = mstate.esp - 12;
                                       this.i4 = mstate.ebp + -36;
                                       this.i7 = mstate.ebp + -8;
                                       si32(this.i4,mstate.esp);
                                       si32(this.i2,mstate.esp + 4);
                                       si32(this.i7,mstate.esp + 8);
                                       mstate.esp = mstate.esp - 4;
                                       FSM_strtod.start();
                                    }
                                    addr3110:
                                    this.i2 = 2146959360;
                                    si32(this.i2,mstate.ebp + -28);
                                    this.i2 = 0;
                                    si32(this.i2,mstate.ebp + -32);
                                    if(this.i3 != 0)
                                    {
                                       §§goto(addr809);
                                    }
                                 }
                                 §§goto(addr3163);
                              }
                              addr2498:
                              this.i1 = this.i7;
                              §§goto(addr3140);
                           }
                           addr2497:
                           §§goto(addr2498);
                        }
                        else
                        {
                           if(this.i4 != 105)
                           {
                              if(this.i4 == 110)
                              {
                                 §§goto(addr2376);
                              }
                              §§goto(addr2498);
                           }
                           §§goto(addr2497);
                        }
                        this.i2 = FSM_strtod;
                        this.i4 = li32(mstate.ebp + -36);
                        this.i8 = 110;
                        this.i9 = 0;
                        this.i10 = this.i4;
                        while(true)
                        {
                           this.i11 = this.i10 + this.i9;
                           this.i11 = li8(this.i11 + 1);
                           this.i0 = this.i11 << 24;
                           this.i0 = this.i0 >> 24;
                           this.i11 = this.i11 + -65;
                           this.i8 = this.i8 << 24;
                           this.i11 = this.i11 & 255;
                           this.i5 = this.i0 + 32;
                           this.i11 = uint(this.i11) > uint(25)?int(this.i0):int(this.i5);
                           this.i8 = this.i8 >> 24;
                           if(this.i11 != this.i8)
                           {
                              this.i2 = 1;
                              this.i9 = this.i4;
                              break;
                           }
                           this.i8 = this.i2 + this.i9;
                           this.i8 = li8(this.i8 + 1);
                           this.i9 = this.i9 + 1;
                           if(this.i8 != 0)
                           {
                              continue;
                           }
                           this.i2 = 0;
                           this.i9 = this.i9 << 0;
                           this.i9 = this.i9 + this.i4;
                           this.i9 = this.i9 + 1;
                           si32(this.i9,mstate.ebp + -36);
                           break;
                        }
                        this.i4 = this.i9;
                        this.i2 = this.i2 & 1;
                        this.i8 = this.i4;
                        if(this.i2 == 0)
                        {
                           this.i2 = FSM_strtod;
                           this.i7 = this.i4 + -1;
                           si32(this.i7,mstate.ebp + -36);
                           this.i9 = 105;
                           this.i10 = 0;
                           while(true)
                           {
                              this.i11 = this.i8 + this.i10;
                              this.i11 = li8(this.i11);
                              this.i0 = this.i11 << 24;
                              this.i0 = this.i0 >> 24;
                              this.i11 = this.i11 + -65;
                              this.i9 = this.i9 << 24;
                              this.i11 = this.i11 & 255;
                              this.i5 = this.i0 + 32;
                              this.i11 = uint(this.i11) > uint(25)?int(this.i0):int(this.i5);
                              this.i9 = this.i9 >> 24;
                              if(this.i11 != this.i9)
                              {
                                 this.i2 = 1;
                                 break;
                              }
                              this.i9 = this.i2 + this.i10;
                              this.i9 = li8(this.i9 + 1);
                              this.i10 = this.i10 + 1;
                              if(this.i9 != 0)
                              {
                                 continue;
                              }
                              this.i2 = 0;
                              this.i7 = this.i4 + this.i10;
                              si32(this.i7,mstate.ebp + -36);
                              break;
                           }
                           this.i4 = mstate.ebp + -32;
                           this.i8 = this.i4 + 4;
                           this.i2 = this.i2 ^ 1;
                           this.i2 = this.i2 & 1;
                           if(this.i2 == 0)
                           {
                              this.i2 = 2146435072;
                              this.i7 = this.i7 + 1;
                              si32(this.i7,mstate.ebp + -36);
                              si32(this.i2,this.i8);
                              this.i2 = 0;
                              si32(this.i2,this.i4);
                              if(this.i3 != 0)
                              {
                                 §§goto(addr809);
                              }
                           }
                           else
                           {
                              this.i2 = 2146435072;
                              si32(this.i2,this.i8);
                              this.i2 = 0;
                              si32(this.i2,this.i4);
                              if(this.i3 != 0)
                              {
                                 §§goto(addr809);
                              }
                           }
                        }
                        else
                        {
                           §§goto(addr2497);
                        }
                        §§goto(addr3163);
                     }
                     §§goto(addr875);
                  }
                  §§goto(addr7780);
               }
               if(this.i10 == 0)
               {
                  if(this.i2 == 0)
                  {
                     if(this.i5 == 0)
                     {
                        §§goto(addr3136);
                     }
                     §§goto(addr3140);
                  }
               }
               this.i0 = li32(mstate.ebp + -36);
               this.i6 = this.i0 + 1;
               si32(this.i6,mstate.ebp + -36);
               this.i12 = si8(li8(this.i0 + 1));
               if(this.i12 != 45)
               {
                  if(this.i12 == 43)
                  {
                     this.i6 = 0;
                  }
                  else
                  {
                     this.i14 = this.i12 + -48;
                     if(uint(this.i14) >= uint(10))
                     {
                        this.i6 = this.i12;
                        addr1922:
                        this.i12 = 0;
                        si32(this.i0,mstate.ebp + -36);
                        addr1806:
                        §§goto(addr1807);
                     }
                     else
                     {
                        this.i13 = 0;
                        this.i14 = this.i6;
                        this.i6 = this.i13;
                     }
                     §§goto(addr2339);
                  }
                  addr1973:
                  this.i13 = this.i14;
                  if(this.i12 == 48)
                  {
                     this.i12 = this.i13;
                     while(true)
                     {
                        this.i13 = this.i12 + 1;
                        si32(this.i13,mstate.ebp + -36);
                        this.i12 = li8(this.i12 + 1);
                        if(this.i12 == 48)
                        {
                           this.i12 = this.i13;
                           continue;
                        }
                        break;
                     }
                     this.i12 = this.i12 << 24;
                     this.i12 = this.i12 >> 24;
                  }
                  this.i14 = this.i12 + -49;
                  if(uint(this.i14) >= uint(9))
                  {
                     this.i13 = 0;
                     this.i6 = this.i12;
                     this.i12 = this.i13;
                     §§goto(addr1806);
                  }
                  else
                  {
                     this.i14 = this.i13 + 1;
                     si32(this.i14,mstate.ebp + -36);
                     this.i15 = li8(this.i13 + 1);
                     this.i16 = this.i15 << 24;
                     this.i16 = this.i16 >> 24;
                     this.i12 = this.i12 + -48;
                     this.i15 = this.i15 + -48;
                     this.i15 = this.i15 & 255;
                     if(uint(this.i15) < uint(10))
                     {
                        while(true)
                        {
                           this.i15 = this.i14 + 1;
                           si32(this.i15,mstate.ebp + -36);
                           this.i14 = li8(this.i14 + 1);
                           this.i12 = this.i12 * 10;
                           this.i17 = this.i14 << 24;
                           this.i12 = this.i16 + this.i12;
                           this.i16 = this.i17 >> 24;
                           this.i12 = this.i12 + -48;
                           this.i14 = this.i14 + -48;
                           this.i14 = this.i14 & 255;
                           if(uint(this.i14) >= uint(10))
                           {
                              break;
                           }
                           this.i14 = this.i15;
                        }
                        this.i14 = this.i15;
                     }
                     this.i15 = this.i16;
                     this.i13 = this.i14 - this.i13;
                     this.i13 = this.i13 > 8?1:0;
                     this.i14 = this.i12 > 19999?1:0;
                     this.i13 = this.i13 | this.i14;
                     this.i13 = this.i13 & 1;
                     this.i12 = this.i13 != 0?19999:int(this.i12);
                     if(this.i6 == 0)
                     {
                        this.i6 = this.i15;
                        §§goto(addr1806);
                     }
                     else
                     {
                        this.i6 = 0 - this.i12;
                        if(this.i10 != 0)
                        {
                           this.i2 = this.i6;
                           §§goto(addr2279);
                        }
                        else
                        {
                           this.i6 = this.i15;
                        }
                        §§goto(addr7780);
                     }
                  }
                  §§goto(addr2339);
               }
               else
               {
                  this.i6 = 1;
               }
               this.i12 = this.i0 + 2;
               si32(this.i12,mstate.ebp + -36);
               this.i13 = si8(li8(this.i0 + 2));
               this.i14 = this.i13 + -48;
               if(uint(this.i14) >= uint(10))
               {
                  this.i6 = this.i13;
                  §§goto(addr1922);
               }
               else
               {
                  this.i14 = this.i12;
                  this.i12 = this.i13;
                  §§goto(addr1973);
               }
               §§goto(addr2339);
            case 5:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               if(this.i2 == 5)
               {
                  this.i2 = li32(mstate.ebp + -4);
                  this.i2 = this.i2 | 2146435072;
                  si32(this.i2,mstate.ebp + -28);
                  this.i2 = li32(this.i7);
                  si32(this.i2,mstate.ebp + -32);
                  if(this.i3 != 0)
                  {
                     §§goto(addr809);
                  }
                  §§goto(addr3163);
               }
               else
               {
                  §§goto(addr3110);
               }
               §§goto(addr875);
            case 6:
               this.i4 = mstate.eax;
               mstate.esp = mstate.esp + 16;
               this.i0 = this.i2;
               this.i2 = this.i4;
               addr4058:
               this.i4 = mstate.ebp + -32;
               this.i5 = this.i4 + 4;
               this.i7 = 0 - this.i6;
               this.i8 = this.i2 + 12;
               this.i9 = this.i2 + 16;
               addr4096:
               this.i10 = this.i2 + 4;
               this.i11 = mstate.ebp + -40;
               this.i12 = li32(this.i10);
               mstate.esp = mstate.esp - 4;
               si32(this.i12,mstate.esp);
               state = 8;
               mstate.esp = mstate.esp - 4;
               FSM_strtod.start();
               return;
            case 7:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 16;
               this.i0 = 0;
               §§goto(addr4058);
            case 8:
               this.i12 = mstate.eax;
               mstate.esp = mstate.esp + 4;
               this.i13 = li32(this.i9);
               this.i14 = this.i12 + 12;
               this.i13 = this.i13 << 2;
               this.i15 = this.i8;
               this.i13 = this.i13 + 8;
               memcpy(this.i14,this.i15,this.i13);
               this.f0 = lf64(mstate.ebp + -32);
               mstate.esp = mstate.esp - 16;
               this.i13 = mstate.ebp + -44;
               sf64(this.f0,mstate.esp);
               si32(this.i13,mstate.esp + 8);
               si32(this.i11,mstate.esp + 12);
               state = 9;
               mstate.esp = mstate.esp - 4;
               FSM_strtod.start();
               return;
            case 9:
               this.i11 = mstate.eax;
               mstate.esp = mstate.esp + 16;
               si32(this.i11,mstate.ebp + -24);
               this.i11 = li32(FSM_strtod + 4);
               if(this.i11 != 0)
               {
                  this.i13 = li32(this.i11);
                  si32(this.i13,FSM_strtod + 4);
               }
               else
               {
                  this.i11 = FSM_strtod;
                  this.i13 = li32(FSM_strtod);
                  this.i11 = this.i13 - this.i11;
                  this.i11 = this.i11 >> 3;
                  this.i11 = this.i11 + 4;
                  if(uint(this.i11) <= uint(288))
                  {
                     this.i11 = 1;
                     this.i14 = this.i13 + 32;
                     si32(this.i14,FSM_strtod);
                     si32(this.i11,this.i13 + 4);
                     this.i11 = 2;
                     si32(this.i11,this.i13 + 8);
                     this.i11 = this.i13;
                  }
                  else
                  {
                     this.i11 = 32;
                     mstate.esp = mstate.esp - 8;
                     this.i13 = 0;
                     si32(this.i13,mstate.esp);
                     si32(this.i11,mstate.esp + 4);
                     state = 11;
                     mstate.esp = mstate.esp - 4;
                     FSM_strtod.start();
                     return;
                  }
               }
               addr4880:
               this.i13 = 0;
               si32(this.i13,this.i11 + 12);
               this.i13 = 1;
               si32(this.i13,this.i11 + 20);
               si32(this.i13,this.i11 + 16);
               if(this.i6 >= 0)
               {
                  this.i13 = 0;
                  this.i14 = this.i13;
                  this.i15 = this.i6;
                  this.i16 = this.i6;
               }
               else
               {
                  this.i16 = 0;
                  this.i14 = this.i7;
                  this.i13 = this.i7;
                  this.i15 = this.i16;
               }
               this.i17 = li32(mstate.ebp + -44);
               this.i18 = li32(mstate.ebp + -40);
               this.i19 = this.i17 - this.i0;
               this.i20 = this.i18 + this.i19;
               this.i15 = this.i15 + this.i0;
               this.i21 = this.i15 - this.i17;
               this.i22 = this.i14 + this.i17;
               this.i20 = this.i20 + -1;
               this.i19 = this.i19 + 1075;
               this.i18 = 54 - this.i18;
               this.i14 = this.i17 < 0?int(this.i14):int(this.i22);
               this.i18 = this.i20 < -1022?int(this.i19):int(this.i18);
               this.i15 = this.i17 > -1?int(this.i15):int(this.i21);
               this.i15 = this.i15 + this.i18;
               this.i17 = this.i18 + this.i14;
               this.i18 = this.i15 <= this.i17?int(this.i15):int(this.i17);
               this.i18 = this.i18 > this.i14?int(this.i14):int(this.i18);
               this.i18 = this.i18 > 0?int(this.i18):0;
               this.i14 = this.i14 - this.i18;
               this.i15 = this.i15 - this.i18;
               this.i17 = this.i17 - this.i18;
               if(this.i13 <= 0)
               {
                  addr5276:
                  if(this.i17 >= 1)
                  {
                     this.i13 = li32(mstate.ebp + -24);
                     mstate.esp = mstate.esp - 8;
                     si32(this.i13,mstate.esp);
                     si32(this.i17,mstate.esp + 4);
                     state = 14;
                     mstate.esp = mstate.esp - 4;
                     FSM_strtod.start();
                     return;
                  }
                  addr5336:
                  if(this.i16 <= 0)
                  {
                     addr5383:
                     if(this.i15 <= 0)
                     {
                        addr5430:
                        if(this.i14 <= 0)
                        {
                           break;
                        }
                        mstate.esp = mstate.esp - 8;
                        si32(this.i11,mstate.esp);
                        si32(this.i14,mstate.esp + 4);
                        state = 17;
                        mstate.esp = mstate.esp - 4;
                        FSM_strtod.start();
                        return;
                     }
                     mstate.esp = mstate.esp - 8;
                     si32(this.i12,mstate.esp);
                     si32(this.i15,mstate.esp + 4);
                     state = 16;
                     mstate.esp = mstate.esp - 4;
                     FSM_strtod.start();
                     return;
                  }
                  mstate.esp = mstate.esp - 8;
                  si32(this.i12,mstate.esp);
                  si32(this.i16,mstate.esp + 4);
                  state = 15;
                  mstate.esp = mstate.esp - 4;
                  FSM_strtod.start();
                  return;
               }
               mstate.esp = mstate.esp - 8;
               si32(this.i11,mstate.esp);
               si32(this.i13,mstate.esp + 4);
               state = 12;
               mstate.esp = mstate.esp - 4;
               FSM_strtod.start();
               return;
            case 10:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 16;
               this.i0 = this.i7;
               §§goto(addr4058);
            case 11:
               this.i11 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i13 = 1;
               si32(this.i13,this.i11 + 4);
               this.i13 = 2;
               si32(this.i13,this.i11 + 8);
               §§goto(addr4880);
            case 12:
               this.i11 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i13 = li32(mstate.ebp + -24);
               mstate.esp = mstate.esp - 8;
               si32(this.i11,mstate.esp);
               si32(this.i13,mstate.esp + 4);
               state = 13;
               mstate.esp = mstate.esp - 4;
               FSM_strtod.start();
               return;
            case 13:
               this.i13 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i18 = li32(mstate.ebp + -24);
               if(this.i18 != 0)
               {
                  this.i19 = FSM_strtod;
                  this.i20 = li32(this.i18 + 4);
                  this.i20 = this.i20 << 2;
                  this.i19 = this.i19 + this.i20;
                  this.i20 = li32(this.i19);
                  si32(this.i20,this.i18);
                  si32(this.i18,this.i19);
               }
               si32(this.i13,mstate.ebp + -24);
               §§goto(addr5276);
            case 14:
               this.i13 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               si32(this.i13,mstate.ebp + -24);
               §§goto(addr5336);
            case 15:
               this.i12 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               §§goto(addr5383);
            case 16:
               this.i12 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               §§goto(addr5430);
            case 17:
               this.i11 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               break;
            case 18:
               this.i14 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i15 = li32(this.i14 + 12);
               si32(this.i13,this.i14 + 12);
               this.i13 = li32(this.i14 + 16);
               this.i16 = li32(this.i11 + 16);
               this.i17 = this.i13 - this.i16;
               this.i18 = this.i11 + 16;
               if(this.i13 != this.i16)
               {
                  this.i16 = this.i17;
               }
               else
               {
                  this.i17 = 0;
                  while(true)
                  {
                     this.i19 = this.i17 ^ -1;
                     this.i19 = this.i16 + this.i19;
                     this.i20 = this.i19 << 2;
                     this.i21 = this.i14 + this.i20;
                     this.i20 = this.i11 + this.i20;
                     this.i21 = li32(this.i21 + 20);
                     this.i20 = li32(this.i20 + 20);
                     if(this.i21 != this.i20)
                     {
                        this.i16 = uint(this.i21) < uint(this.i20)?-1:1;
                        break;
                     }
                     this.i17 = this.i17 + 1;
                     if(this.i19 <= 0)
                     {
                        this.i16 = 0;
                        break;
                     }
                  }
               }
               if(this.i16 <= -1)
               {
                  if(this.i15 == 0)
                  {
                     this.i6 = li32(this.i4);
                     if(this.i6 == 0)
                     {
                        this.i6 = li32(this.i5);
                        this.i7 = this.i6 & 1048575;
                        if(this.i7 == 0)
                        {
                           this.i6 = this.i6 & 2146435072;
                           if(uint(this.i6) >= uint(112197633))
                           {
                              this.i6 = li32(this.i14 + 20);
                              if(this.i6 == 0)
                              {
                                 if(this.i13 >= 2)
                                 {
                                 }
                              }
                              this.i6 = 1;
                              mstate.esp = mstate.esp - 8;
                              si32(this.i14,mstate.esp);
                              si32(this.i6,mstate.esp + 4);
                              state = 19;
                              mstate.esp = mstate.esp - 4;
                              FSM_strtod.start();
                              return;
                           }
                        }
                     }
                  }
                  addr5679:
                  addr7474:
                  this.i6 = this.i14;
                  addr7474:
                  if(this.i0 != 0)
                  {
                     this.i0 = this.i6;
                     addr7483:
                     this.f0 = lf64(mstate.ebp + -32);
                     this.f0 = this.f0 * 1.2326e-32;
                     sf64(this.f0,mstate.ebp + -32);
                     this.i5 = li32(this.i5);
                     if(this.i5 == 0)
                     {
                        this.i4 = li32(this.i4);
                        if(this.i4 == 0)
                        {
                           this.i4 = 34;
                           si32(this.i4,FSM_strtod);
                           this.i4 = this.i12;
                           this.i5 = this.i11;
                        }
                     }
                     this.i4 = this.i12;
                     this.i5 = this.i11;
                  }
                  else
                  {
                     this.i4 = this.i12;
                     this.i5 = this.i11;
                     this.i0 = this.i6;
                  }
                  §§goto(addr7553);
               }
               else if(this.i16 == 0)
               {
                  this.i6 = li32(this.i5);
                  this.i7 = this.i6 & 1048575;
                  if(this.i15 != 0)
                  {
                     if(this.i7 == 1048575)
                     {
                        this.i7 = li32(this.i4);
                        if(this.i0 != 0)
                        {
                           this.i8 = this.i6 & 2146435072;
                           if(uint(this.i8) <= uint(111149056))
                           {
                              this.i9 = -1;
                              this.i8 = this.i8 >>> 20;
                              this.i8 = 107 - this.i8;
                              this.i8 = this.i9 << this.i8;
                           }
                           addr6006:
                           if(this.i7 == this.i8)
                           {
                              this.i7 = 0;
                              this.i6 = this.i6 & 2146435072;
                              this.i6 = this.i6 + 1048576;
                              si32(this.i6,this.i5);
                              si32(this.i7,this.i4);
                              if(this.i0 != 0)
                              {
                                 addr6045:
                                 this.i0 = this.i14;
                                 §§goto(addr7483);
                              }
                              else
                              {
                                 addr6274:
                                 this.i4 = this.i12;
                                 this.i5 = this.i11;
                                 this.i0 = this.i14;
                              }
                           }
                           §§goto(addr7553);
                        }
                        this.i8 = -1;
                        §§goto(addr6006);
                     }
                  }
                  else if(this.i7 == 0)
                  {
                     this.i6 = li32(this.i4);
                     if(this.i6 == 0)
                     {
                        this.i6 = this.i14;
                        addr6071:
                        this.i7 = li32(this.i5);
                        this.i7 = this.i7 & 2146435072;
                        if(this.i0 != 0)
                        {
                           if(this.i7 <= 112197632)
                           {
                              if(this.i7 <= 57671680)
                              {
                                 this.i4 = this.i12;
                                 this.i5 = this.i11;
                                 this.i0 = this.i6;
                                 addr4441:
                                 §§goto(addr4442);
                              }
                           }
                           else
                           {
                              this.i8 = -1;
                              this.i7 = this.i7 + -1048576;
                              this.i7 = this.i7 | 1048575;
                              si32(this.i7,this.i5);
                              si32(this.i8,this.i4);
                              if(this.i0 != 0)
                              {
                                 this.i0 = this.i6;
                                 §§goto(addr7483);
                              }
                              else
                              {
                                 this.i4 = this.i12;
                                 this.i5 = this.i11;
                                 this.i0 = this.i6;
                              }
                           }
                        }
                        else
                        {
                           this.i0 = -1;
                           this.i7 = this.i7 + -1048576;
                           this.i7 = this.i7 | 1048575;
                           si32(this.i7,this.i5);
                           si32(this.i0,this.i4);
                           this.i4 = this.i12;
                           this.i5 = this.i11;
                           this.i0 = this.i6;
                        }
                        §§goto(addr7553);
                     }
                     §§goto(addr7474);
                  }
                  this.i6 = li32(this.i4);
                  this.i6 = this.i6 & 1;
                  if(this.i6 != 0)
                  {
                     this.f0 = lf64(mstate.ebp + -32);
                     mstate.esp = mstate.esp - 8;
                     sf64(this.f0,mstate.esp);
                     mstate.esp = mstate.esp - 4;
                     FSM_strtod.start();
                  }
               }
               else
               {
                  this.f0 = 2;
                  mstate.esp = mstate.esp - 8;
                  si32(this.i14,mstate.esp);
                  si32(this.i11,mstate.esp + 4);
                  mstate.esp = mstate.esp - 4;
                  FSM_strtod.start();
               }
               addr5678:
               §§goto(addr5679);
            case 19:
               this.i6 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i7 = li32(this.i6 + 16);
               this.i8 = li32(this.i18);
               this.i9 = this.i7 - this.i8;
               if(this.i7 != this.i8)
               {
                  this.i8 = this.i9;
               }
               else
               {
                  this.i7 = 0;
                  while(true)
                  {
                     this.i9 = this.i7 ^ -1;
                     this.i9 = this.i8 + this.i9;
                     this.i10 = this.i9 << 2;
                     this.i14 = this.i6 + this.i10;
                     this.i10 = this.i11 + this.i10;
                     this.i14 = li32(this.i14 + 20);
                     this.i10 = li32(this.i10 + 20);
                     if(this.i14 != this.i10)
                     {
                        this.i7 = uint(this.i14) < uint(this.i10)?-1:1;
                        this.i8 = this.i7;
                        break;
                     }
                     this.i7 = this.i7 + 1;
                     if(this.i9 <= 0)
                     {
                        this.i7 = 0;
                        this.i8 = this.i7;
                        break;
                     }
                  }
               }
               this.i7 = this.i8;
               if(this.i7 <= 0)
               {
                  §§goto(addr7474);
               }
               else
               {
                  §§goto(addr6071);
               }
               §§goto(addr7553);
            case 20:
               this.f1 = mstate.st0;
               mstate.esp = mstate.esp + 8;
               if(this.i15 != 0)
               {
                  this.f0 = this.f0 + this.f1;
                  sf64(this.f0,mstate.ebp + -32);
                  if(this.i0 != 0)
                  {
                     §§goto(addr6045);
                  }
                  else
                  {
                     §§goto(addr6274);
                  }
               }
               else
               {
                  this.f2 = 0;
                  this.f0 = this.f0 - this.f1;
                  sf64(this.f0,mstate.ebp + -32);
                  if(this.f0 == this.f2)
                  {
                     addr6313:
                     this.i4 = this.i12;
                     this.i5 = this.i11;
                     this.i0 = this.i14;
                     §§goto(addr4441);
                  }
                  else
                  {
                     §§goto(addr5678);
                  }
               }
               §§goto(addr7553);
            case 21:
               this.f1 = mstate.st0;
               mstate.esp = mstate.esp + 8;
               if(this.f1 <= this.f0)
               {
                  if(this.i15 != 0)
                  {
                     this.f1 = 1;
                     this.i13 = 1072693248;
                     this.i16 = 0;
                  }
                  else
                  {
                     this.i13 = li32(this.i4);
                     if(this.i13 != 0)
                     {
                        if(this.i13 != 1)
                        {
                           addr6404:
                           this.f1 = 1;
                           this.i13 = -1074790400;
                           this.i16 = 0;
                        }
                        else
                        {
                           addr6436:
                           this.i16 = li32(this.i5);
                           if(this.i16 != 0)
                           {
                              addr6403:
                              §§goto(addr6404);
                           }
                           else
                           {
                              §§goto(addr6313);
                           }
                        }
                        §§goto(addr7780);
                     }
                     else
                     {
                        this.i16 = li32(this.i5);
                        this.i17 = this.i16 & 1048575;
                        if(this.i17 != 0)
                        {
                           if(this.i13 == 1)
                           {
                              §§goto(addr6436);
                           }
                           §§goto(addr6403);
                        }
                        else
                        {
                           this.f0 = 1;
                           if(this.f1 < this.f0)
                           {
                              this.f1 = 0.5;
                              this.i13 = -1075838976;
                              this.i16 = 0;
                           }
                           else
                           {
                              this.f1 = this.f1 * 0.5;
                              this.f0 = -this.f1;
                              sf64(this.f0,mstate.ebp + -56);
                              this.i13 = li32(mstate.ebp + -56);
                              this.i17 = li32(mstate.ebp + -52);
                              this.i18 = this.i16 & 2146435072;
                              if(this.i18 != 2145386496)
                              {
                                 this.i16 = this.i17;
                                 this.i17 = this.i18;
                                 addr6519:
                                 if(uint(this.i17) <= uint(111149056))
                                 {
                                    if(this.i0 != 0)
                                    {
                                       this.f0 = 2147480000;
                                       if(this.f1 <= this.f0)
                                       {
                                          this.f0 = 1;
                                          this.i13 = uint(this.f1);
                                          this.f1 = Number(uint(this.i13));
                                          this.f1 = this.i13 == 0?Number(this.f0):Number(this.f1);
                                          this.f0 = -this.f1;
                                          this.f0 = this.i15 == 0?Number(this.f0):Number(this.f1);
                                          sf64(this.f0,mstate.ebp + -80);
                                          this.i13 = li32(mstate.ebp + -80);
                                          this.i16 = li32(mstate.ebp + -76);
                                       }
                                       this.i18 = 112197632 - this.i17;
                                       this.i16 = this.i18 + this.i16;
                                    }
                                 }
                                 this.f0 = lf64(mstate.ebp + -32);
                                 mstate.esp = mstate.esp - 8;
                                 si32(this.i13,mstate.ebp + -88);
                                 si32(this.i16,mstate.ebp + -84);
                                 sf64(this.f0,mstate.esp);
                                 mstate.esp = mstate.esp - 4;
                                 FSM_strtod.start();
                              }
                              addr7290:
                              this.i13 = li32(mstate.ebp + -24);
                              if(this.i13 != 0)
                              {
                                 this.i15 = FSM_strtod;
                                 this.i16 = li32(this.i13 + 4);
                                 this.i16 = this.i16 << 2;
                                 this.i15 = this.i15 + this.i16;
                                 this.i16 = li32(this.i15);
                                 si32(this.i16,this.i13);
                                 si32(this.i13,this.i15);
                              }
                              if(this.i12 != 0)
                              {
                                 this.i13 = FSM_strtod;
                                 this.i15 = li32(this.i12 + 4);
                                 this.i15 = this.i15 << 2;
                                 this.i13 = this.i13 + this.i15;
                                 this.i15 = li32(this.i13);
                                 si32(this.i15,this.i12);
                                 si32(this.i12,this.i13);
                              }
                              if(this.i11 != 0)
                              {
                                 this.i12 = FSM_strtod;
                                 this.i13 = li32(this.i11 + 4);
                                 this.i13 = this.i13 << 2;
                                 this.i12 = this.i12 + this.i13;
                                 this.i13 = li32(this.i12);
                                 si32(this.i13,this.i11);
                                 si32(this.i11,this.i12);
                              }
                              addr4095:
                              if(this.i14 != 0)
                              {
                                 this.i11 = FSM_strtod;
                                 this.i12 = li32(this.i14 + 4);
                                 this.i12 = this.i12 << 2;
                                 this.i11 = this.i11 + this.i12;
                                 this.i12 = li32(this.i11);
                                 si32(this.i12,this.i14);
                                 si32(this.i14,this.i11);
                              }
                              §§goto(addr4096);
                           }
                        }
                     }
                  }
                  addr6641:
                  this.i19 = li32(mstate.ebp + -32);
                  this.i20 = li32(mstate.ebp + -28);
                  this.i16 = this.i16 + -55574528;
                  si32(this.i16,this.i5);
                  this.f0 = lf64(mstate.ebp + -32);
                  mstate.esp = mstate.esp - 8;
                  si32(this.i13,mstate.ebp + -72);
                  si32(this.i17,mstate.ebp + -68);
                  sf64(this.f0,mstate.esp);
                  mstate.esp = mstate.esp - 4;
                  FSM_strtod.start();
               }
               else
               {
                  this.f1 = this.f1 * 0.5;
                  this.f0 = -this.f1;
                  this.f0 = this.i15 == 0?Number(this.f0):Number(this.f1);
                  sf64(this.f0,mstate.ebp + -64);
                  this.i13 = li32(mstate.ebp + -64);
                  this.i17 = li32(mstate.ebp + -60);
                  this.i16 = this.i13;
                  this.i13 = this.i17;
               }
               this.i17 = this.i16;
               this.i18 = this.i13;
               this.i13 = li32(this.i5);
               this.i19 = this.i13 & 2146435072;
               if(this.i19 != 2145386496)
               {
                  this.i13 = this.i17;
                  this.i16 = this.i18;
                  this.i17 = this.i19;
                  §§goto(addr6519);
               }
               else
               {
                  this.i16 = this.i13;
                  this.i13 = this.i17;
                  this.i17 = this.i18;
                  this.i18 = this.i19;
                  §§goto(addr6641);
               }
               §§goto(addr7290);
            case 22:
               this.f2 = mstate.st0;
               this.f3 = lf64(mstate.ebp + -72);
               this.f2 = this.f2 * this.f3;
               mstate.esp = mstate.esp + 8;
               this.f0 = this.f0 + this.f2;
               sf64(this.f0,mstate.ebp + -32);
               this.i13 = li32(this.i5);
               this.i16 = this.i13 & 2146435072;
               if(uint(this.i16) >= uint(2090860544))
               {
                  if(this.i20 == 2146435071)
                  {
                     if(this.i19 == -1)
                     {
                        this.i4 = this.i12;
                        this.i5 = this.i11;
                        this.i0 = this.i14;
                        §§goto(addr3752);
                     }
                  }
                  this.i13 = 2146435071;
                  si32(this.i13,this.i5);
                  this.i13 = -1;
                  si32(this.i13,this.i4);
                  this.i13 = li32(mstate.ebp + -24);
                  if(this.i13 != 0)
                  {
                     this.i15 = FSM_strtod;
                     this.i16 = li32(this.i13 + 4);
                     this.i16 = this.i16 << 2;
                     this.i15 = this.i15 + this.i16;
                     this.i16 = li32(this.i15);
                     si32(this.i16,this.i13);
                     si32(this.i13,this.i15);
                  }
                  if(this.i12 != 0)
                  {
                     this.i13 = FSM_strtod;
                     this.i15 = li32(this.i12 + 4);
                     this.i15 = this.i15 << 2;
                     this.i13 = this.i13 + this.i15;
                     this.i15 = li32(this.i13);
                     si32(this.i15,this.i12);
                     si32(this.i12,this.i13);
                  }
                  if(this.i11 != 0)
                  {
                     this.i13 = FSM_strtod;
                     this.i12 = li32(this.i11 + 4);
                     this.i12 = this.i12 << 2;
                     this.i13 = this.i13 + this.i12;
                     this.i12 = li32(this.i13);
                     si32(this.i12,this.i11);
                     si32(this.i11,this.i13);
                  }
                  if(this.i14 != 0)
                  {
                     this.i13 = FSM_strtod;
                     this.i11 = li32(this.i14 + 4);
                     this.i11 = this.i11 << 2;
                     this.i13 = this.i13 + this.i11;
                     this.i11 = li32(this.i13);
                     si32(this.i11,this.i14);
                     si32(this.i14,this.i13);
                  }
               }
               else
               {
                  this.i13 = this.i13 + 55574528;
                  si32(this.i13,this.i5);
                  if(this.i0 == 0)
                  {
                     this.i13 = this.i18;
                     addr7193:
                     this.f0 = this.f1;
                     this.i16 = li32(this.i5);
                     this.i17 = this.i16 & 2146435072;
                     if(this.i13 == this.i17)
                     {
                        this.i13 = int(this.f0);
                        this.f1 = Number(this.i13);
                        this.f0 = this.f0 - this.f1;
                        if(this.i15 == 0)
                        {
                           this.i13 = li32(this.i4);
                           if(this.i13 == 0)
                           {
                              this.i13 = this.i16 & 1048575;
                              if(this.i13 == 0)
                              {
                                 this.f1 = 0.25;
                                 if(this.f0 >= this.f1)
                                 {
                                 }
                              }
                              §§goto(addr5678);
                           }
                        }
                        this.f1 = 0.5;
                        if(this.f0 >= this.f1)
                        {
                           this.f1 = 0.5;
                           if(this.f0 <= this.f1)
                           {
                           }
                        }
                        §§goto(addr5678);
                     }
                  }
                  §§goto(addr7290);
               }
               §§goto(addr4095);
            case 23:
               this.f2 = mstate.st0;
               this.f3 = lf64(mstate.ebp + -88);
               this.f2 = this.f2 * this.f3;
               mstate.esp = mstate.esp + 8;
               this.f0 = this.f0 + this.f2;
               sf64(this.f0,mstate.ebp + -32);
               if(this.i0 == 0)
               {
                  this.i13 = this.i17;
                  §§goto(addr7193);
               }
               §§goto(addr7290);
         }
         this.i13 = 0;
         this.i14 = li32(mstate.ebp + -24);
         mstate.esp = mstate.esp - 8;
         si32(this.i14,mstate.esp);
         si32(this.i12,mstate.esp + 4);
         state = 18;
         mstate.esp = mstate.esp - 4;
         FSM_strtod.start();
      }
   }
}
