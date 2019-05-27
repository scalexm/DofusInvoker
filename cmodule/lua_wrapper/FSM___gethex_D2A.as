package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.li8;
   import avm2.intrinsics.memory.si32;
   import avm2.intrinsics.memory.si8;
   
   public final class FSM___gethex_D2A extends Machine
   {
      
      public static const intRegCount:int = 17;
      
      public static const NumberRegCount:int = 0;
       
      
      public var i10:int;
      
      public var i11:int;
      
      public var i12:int;
      
      public var i13:int;
      
      public var i14:int;
      
      public var i15:int;
      
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
      
      public function FSM___gethex_D2A()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM___gethex_D2A = null;
         _loc1_ = new FSM___gethex_D2A();
         FSM___gethex_D2A.gworker = _loc1_;
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
               this.i1 = li32(mstate.ebp + 12);
               this.i2 = li32(mstate.ebp + 16);
               this.i3 = li32(mstate.ebp + 20);
               this.i4 = li32(mstate.ebp + 24);
               this.i5 = li8(FSM___gethex_D2A);
               if(this.i5 == 0)
               {
                  this.i5 = 1;
                  si8(this.i5,FSM___gethex_D2A);
               }
               this.i5 = li8(FSM___gethex_D2A);
               if(this.i5 == 0)
               {
                  this.i5 = FSM___gethex_D2A;
                  this.i6 = li32(FSM___gethex_D2A);
                  this.i7 = FSM___gethex_D2A;
                  this.i5 = this.i6 == 0?int(this.i5):int(this.i7);
                  this.i6 = li32(this.i5);
                  si32(this.i6,FSM___gethex_D2A);
                  this.i6 = li32(this.i5 + 4);
                  si32(this.i6,FSM___gethex_D2A);
                  this.i5 = li32(this.i5 + 8);
                  si32(this.i5,FSM___gethex_D2A);
                  this.i5 = 1;
                  si8(this.i5,FSM___gethex_D2A);
               }
               this.i5 = li32(FSM___gethex_D2A);
               this.i5 = li8(this.i5);
               this.i6 = li8(FSM___gethex_D2A + 48);
               if(this.i6 == 0)
               {
                  mstate.esp = mstate.esp - 4;
                  FSM___gethex_D2A.start();
               }
               else
               {
                  this.i6 = 0;
                  this.i7 = li32(this.i0);
               }
               loop0:
               while(true)
               {
                  this.i8 = this.i6;
                  this.i6 = this.i8 + this.i7;
                  this.i6 = li8(this.i6 + 2);
                  if(this.i6 != 48)
                  {
                     break;
                  }
                  addr226:
                  this.i6 = this.i7;
                  this.i7 = this.i8;
                  while(true)
                  {
                     this.i8 = this.i7 + 1;
                     this.i7 = this.i6;
                     this.i6 = this.i8;
                     continue loop0;
                  }
               }
               this.i6 = this.i7;
               this.i7 = this.i8;
               this.i8 = FSM___gethex_D2A;
               this.i9 = this.i7 + this.i6;
               this.i10 = li8(this.i9 + 2);
               this.i8 = this.i8 + this.i10;
               this.i8 = li8(this.i8);
               this.i9 = this.i9 + 2;
               this.i11 = this.i6;
               if(this.i8 != 0)
               {
                  this.i6 = 0;
                  this.i7 = this.i9;
               }
               else
               {
                  this.i8 = this.i5 & 255;
                  this.i10 = this.i10 & 255;
                  if(this.i10 != this.i8)
                  {
                     this.i6 = this.i7;
                     this.i7 = this.i9;
                  }
                  else
                  {
                     this.i9 = FSM___gethex_D2A;
                     this.i6 = this.i7 + this.i6;
                     this.i8 = li8(this.i6 + 3);
                     this.i9 = this.i9 + this.i8;
                     this.i9 = li8(this.i9);
                     this.i10 = this.i6 + 3;
                     if(this.i9 == 0)
                     {
                        this.i6 = this.i7;
                        this.i7 = this.i10;
                     }
                     else
                     {
                        this.i6 = this.i8 & 255;
                        if(this.i6 != 48)
                        {
                           this.i7 = this.i10;
                        }
                        else
                        {
                           this.i7 = this.i7 + this.i11;
                           while(true)
                           {
                              this.i6 = li8(this.i7 + 4);
                              this.i7 = this.i7 + 1;
                              if(this.i6 == 48)
                              {
                                 continue;
                              }
                              break;
                           }
                           this.i7 = this.i7 + 3;
                        }
                        this.i9 = this.i7;
                        this.i6 = FSM___gethex_D2A;
                        this.i7 = li8(this.i9);
                        this.i6 = this.i6 + this.i7;
                        this.i6 = li8(this.i6);
                        if(this.i6 != 0)
                        {
                           this.i7 = this.i9;
                           this.i6 = this.i10;
                        }
                        else
                        {
                           this.i6 = 1;
                           this.i7 = this.i9;
                        }
                     }
                  }
                  si32(this.i7,this.i0);
                  this.i7 = this.i6 == 0?6:0;
                  mstate.eax = this.i7;
                  break;
               }
               this.i8 = this.i9;
               this.i9 = FSM___gethex_D2A;
               this.i10 = li8(this.i7);
               this.i9 = this.i9 + this.i10;
               this.i9 = li8(this.i9);
               this.i10 = this.i7;
               if(this.i9 != 0)
               {
                  this.i7 = this.i10;
                  while(true)
                  {
                     this.i9 = FSM___gethex_D2A;
                     this.i10 = li8(this.i7 + 1);
                     this.i9 = this.i9 + this.i10;
                     this.i9 = li8(this.i9);
                     this.i7 = this.i7 + 1;
                     this.i10 = this.i7;
                     if(this.i9 != 0)
                     {
                        this.i7 = this.i10;
                        continue;
                     }
                     break;
                  }
               }
               this.i9 = li8(this.i7);
               this.i10 = this.i5 & 255;
               this.i11 = this.i7;
               if(this.i9 == this.i10)
               {
                  if(this.i6 == 0)
                  {
                     this.i6 = FSM___gethex_D2A;
                     this.i9 = li8(this.i7 + 1);
                     this.i6 = this.i6 + this.i9;
                     this.i6 = li8(this.i6);
                     this.i9 = this.i7 + 1;
                     if(this.i6 != 0)
                     {
                        this.i7 = this.i11;
                        while(true)
                        {
                           this.i11 = FSM___gethex_D2A;
                           this.i6 = li8(this.i7 + 2);
                           this.i11 = this.i11 + this.i6;
                           this.i11 = li8(this.i11);
                           this.i7 = this.i7 + 1;
                           if(this.i11 != 0)
                           {
                              continue;
                           }
                           break;
                        }
                        this.i7 = this.i7 + 1;
                        this.i11 = this.i9;
                     }
                     else
                     {
                        this.i7 = this.i9;
                        this.i11 = this.i9;
                     }
                     addr682:
                     this.i6 = this.i7;
                     this.i7 = this.i11;
                     if(this.i7 == 0)
                     {
                        this.i7 = 0;
                     }
                     else
                     {
                        this.i7 = this.i6 - this.i7;
                        this.i7 = this.i7 << 2;
                        this.i7 = 0 - this.i7;
                     }
                     this.i9 = li8(this.i6);
                     if(this.i9 != 80)
                     {
                        if(this.i9 == 112)
                        {
                        }
                        addr1075:
                        this.i9 = this.i6 - this.i8;
                        si32(this.i6,this.i0);
                        this.i0 = this.i9 + -1;
                        if(this.i0 <= 7)
                        {
                           this.i0 = 0;
                        }
                        else
                        {
                           addr1048:
                           this.i9 = 0;
                           do
                           {
                              this.i9 = this.i9 + 1;
                              this.i0 = this.i0 >> 1;
                           }
                           while(this.i0 > 7);
                           
                           this.i0 = this.i9;
                        }
                        addr1101:
                        mstate.esp = mstate.esp - 4;
                        si32(this.i0,mstate.esp);
                        state = 2;
                        mstate.esp = mstate.esp - 4;
                        FSM___gethex_D2A.start();
                        return;
                     }
                     this.i9 = li8(this.i6 + 1);
                     this.i10 = this.i6 + 1;
                     if(this.i9 != 45)
                     {
                        if(this.i9 == 43)
                        {
                           this.i10 = 0;
                        }
                        else
                        {
                           this.i9 = 0;
                        }
                        addr780:
                        this.i11 = FSM___gethex_D2A;
                        this.i12 = li8(this.i10);
                        this.i11 = this.i11 + this.i12;
                        this.i11 = li8(this.i11);
                        this.i12 = this.i10;
                        this.i13 = this.i11;
                        if(this.i11 <= 25)
                        {
                           this.i13 = this.i13 & 255;
                           if(this.i13 != 0)
                           {
                              this.i13 = FSM___gethex_D2A;
                              this.i14 = li8(this.i10 + 1);
                              this.i13 = this.i13 + this.i14;
                              this.i13 = li8(this.i13);
                              this.i10 = this.i10 + 1;
                              this.i14 = this.i11 + -16;
                              this.i15 = this.i13;
                              if(this.i13 <= 25)
                              {
                                 this.i15 = this.i15 & 255;
                                 if(this.i15 != 0)
                                 {
                                    while(true)
                                    {
                                       this.i10 = FSM___gethex_D2A;
                                       this.i11 = li8(this.i12 + 2);
                                       this.i10 = this.i10 + this.i11;
                                       this.i14 = this.i14 * 10;
                                       this.i10 = li8(this.i10);
                                       this.i14 = this.i13 + this.i14;
                                       this.i12 = this.i12 + 1;
                                       this.i11 = this.i14 + -16;
                                       this.i13 = this.i10;
                                       if(this.i10 <= 25)
                                       {
                                          this.i13 = this.i13 & 255;
                                          if(this.i13 != 0)
                                          {
                                             this.i13 = this.i10;
                                             this.i14 = this.i11;
                                             continue;
                                          }
                                          break;
                                       }
                                       break;
                                    }
                                    this.i12 = this.i12 + 1;
                                    this.i13 = this.i11;
                                 }
                                 addr982:
                                 this.i10 = this.i12;
                                 this.i11 = this.i13;
                                 this.i12 = this.i14;
                                 this.i12 = 16 - this.i12;
                                 this.i13 = this.i6 - this.i8;
                                 this.i9 = this.i9 == 0?int(this.i11):int(this.i12);
                                 si32(this.i10,this.i0);
                                 this.i0 = this.i13 + -1;
                                 this.i7 = this.i9 + this.i7;
                                 if(this.i0 <= 7)
                                 {
                                    this.i0 = 0;
                                 }
                                 §§goto(addr1101);
                              }
                              this.i12 = this.i10;
                              this.i13 = this.i14;
                              this.i14 = this.i11;
                              §§goto(addr982);
                           }
                           §§goto(addr1048);
                        }
                        §§goto(addr1075);
                     }
                     else
                     {
                        this.i10 = 1;
                     }
                     this.i9 = this.i10;
                     this.i10 = this.i6 + 2;
                     §§goto(addr780);
                  }
                  addr681:
                  §§goto(addr682);
               }
               this.i11 = this.i6;
               §§goto(addr681);
            case 1:
               this.i6 = li32(this.i0);
               this.i7 = li8(this.i6 + 2);
               if(this.i7 != 48)
               {
                  this.i7 = 0;
               }
               else
               {
                  this.i7 = 0;
                  §§goto(addr226);
               }
               §§goto(addr271);
            case 2:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 4;
               this.i9 = this.i0 + 20;
               if(uint(this.i6) <= uint(this.i8))
               {
                  this.i5 = 0;
                  this.i6 = this.i9;
               }
               else
               {
                  this.i10 = 0;
                  this.i11 = this.i10;
                  this.i12 = this.i10;
                  this.i13 = this.i9;
                  do
                  {
                     this.i14 = this.i11 ^ -1;
                     this.i14 = this.i6 + this.i14;
                     this.i15 = li8(this.i14);
                     this.i16 = this.i5 & 255;
                     if(this.i15 != this.i16)
                     {
                        if(this.i12 == 32)
                        {
                           this.i15 = 0;
                           si32(this.i10,this.i13);
                           this.i13 = this.i13 + 4;
                           this.i12 = this.i15;
                           this.i10 = this.i15;
                        }
                        this.i15 = FSM___gethex_D2A;
                        this.i16 = li8(this.i14);
                        this.i15 = this.i15 + this.i16;
                        this.i15 = li8(this.i15);
                        this.i15 = this.i15 & 15;
                        this.i15 = this.i15 << this.i12;
                        this.i12 = this.i12 + 4;
                        this.i10 = this.i15 | this.i10;
                     }
                     this.i11 = this.i11 + 1;
                  }
                  while(uint(this.i14) > uint(this.i8));
                  
                  this.i5 = this.i10;
                  this.i6 = this.i13;
               }
               this.i8 = uint(this.i5) < uint(65536)?16:0;
               this.i10 = this.i5 << this.i8;
               this.i11 = uint(this.i10) < uint(16777216)?8:0;
               this.i10 = this.i10 << this.i11;
               this.i12 = uint(this.i10) < uint(268435456)?4:0;
               this.i13 = this.i0 + 20;
               this.i14 = this.i6 + 4;
               this.i13 = this.i14 - this.i13;
               this.i8 = this.i11 | this.i8;
               this.i10 = this.i10 << this.i12;
               this.i11 = uint(this.i10) < uint(1073741824)?2:0;
               this.i8 = this.i8 | this.i12;
               this.i12 = this.i13 << 3;
               si32(this.i5,this.i6);
               this.i5 = this.i13 >> 2;
               si32(this.i5,this.i0 + 16);
               this.i5 = this.i8 | this.i11;
               this.i6 = this.i10 << this.i11;
               this.i8 = this.i12 & -32;
               if(this.i6 > -1)
               {
                  this.i6 = this.i6 & 1073741824;
                  this.i5 = this.i5 + 1;
                  this.i5 = this.i6 == 0?32:int(this.i5);
               }
               this.i6 = li32(this.i1);
               this.i5 = this.i8 - this.i5;
               this.i8 = this.i1;
               if(this.i5 > this.i6)
               {
                  mstate.esp = mstate.esp - 8;
                  this.i5 = this.i5 - this.i6;
                  si32(this.i0,mstate.esp);
                  si32(this.i5,mstate.esp + 4);
                  mstate.esp = mstate.esp - 4;
                  FSM___gethex_D2A.start();
               }
               else if(this.i5 >= this.i6)
               {
                  this.i5 = 0;
                  this.i10 = this.i5;
                  this.i5 = this.i7;
               }
               else
               {
                  this.i9 = 0;
                  mstate.esp = mstate.esp - 8;
                  this.i5 = this.i6 - this.i5;
                  si32(this.i0,mstate.esp);
                  si32(this.i5,mstate.esp + 4);
                  state = 7;
                  mstate.esp = mstate.esp - 4;
                  FSM___gethex_D2A.start();
                  return;
               }
               addr1904:
               this.i7 = this.i10;
               this.i10 = li32(this.i1 + 8);
               addr2177:
               if(this.i10 >= this.i5)
               {
                  addr1786:
                  this.i10 = li32(this.i1 + 4);
                  this.i11 = this.i1 + 4;
                  addr2363:
                  if(this.i10 <= this.i5)
                  {
                     this.i10 = 1;
                  }
                  else
                  {
                     this.i5 = this.i10 - this.i5;
                     if(this.i5 >= this.i6)
                     {
                        this.i7 = li32(this.i1 + 12);
                        if(this.i7 != 3)
                        {
                           if(this.i7 != 2)
                           {
                              if(this.i7 == 1)
                              {
                                 if(this.i5 == this.i6)
                                 {
                                    if(this.i5 >= 2)
                                    {
                                       mstate.esp = mstate.esp - 8;
                                       this.i5 = this.i5 + -1;
                                       si32(this.i0,mstate.esp);
                                       si32(this.i5,mstate.esp + 4);
                                       mstate.esp = mstate.esp - 4;
                                       FSM___gethex_D2A.start();
                                    }
                                    addr2088:
                                    this.i5 = 1;
                                    si32(this.i10,this.i2);
                                    si32(this.i5,this.i0 + 16);
                                    si32(this.i5,this.i9);
                                    si32(this.i0,this.i3);
                                    this.i5 = 98;
                                 }
                              }
                           }
                           else if(this.i4 == 0)
                           {
                              §§goto(addr2088);
                           }
                        }
                        else if(this.i4 != 0)
                        {
                           §§goto(addr2088);
                        }
                        addr2122:
                        if(this.i0 != 0)
                        {
                           this.i5 = FSM___gethex_D2A;
                           this.i6 = li32(this.i0 + 4);
                           this.i6 = this.i6 << 2;
                           this.i5 = this.i5 + this.i6;
                           this.i6 = li32(this.i5);
                           si32(this.i6,this.i0);
                           si32(this.i0,this.i5);
                        }
                        this.i5 = 0;
                        si32(this.i5,this.i3);
                        this.i5 = 80;
                     }
                     else
                     {
                        this.i10 = this.i5 + -1;
                        if(this.i7 != 0)
                        {
                           this.i7 = 1;
                        }
                        else if(this.i10 > 0)
                        {
                           mstate.esp = mstate.esp - 8;
                           si32(this.i0,mstate.esp);
                           si32(this.i10,mstate.esp + 4);
                           mstate.esp = mstate.esp - 4;
                           FSM___gethex_D2A.start();
                        }
                        addr2240:
                        this.i12 = 1;
                        this.i13 = this.i10 >> 5;
                        this.i13 = this.i13 << 2;
                        this.i13 = this.i9 + this.i13;
                        this.i13 = li32(this.i13);
                        mstate.esp = mstate.esp - 8;
                        this.i10 = this.i10 & 31;
                        si32(this.i0,mstate.esp);
                        si32(this.i5,mstate.esp + 4);
                        this.i10 = this.i12 << this.i10;
                        mstate.esp = mstate.esp - 4;
                        FSM___gethex_D2A.start();
                     }
                  }
                  if(this.i7 != 0)
                  {
                     this.i11 = li32(this.i1 + 12);
                     if(this.i11 != 3)
                     {
                        if(this.i11 != 2)
                        {
                           if(this.i11 == 1)
                           {
                              this.i4 = this.i7 & 2;
                              if(this.i4 != 0)
                              {
                                 this.i4 = li32(this.i9);
                                 this.i4 = this.i4 | this.i7;
                                 this.i4 = this.i4 & 1;
                                 if(this.i4 != 0)
                                 {
                                    addr2433:
                                    this.i4 = li32(this.i0 + 16);
                                    mstate.esp = mstate.esp - 4;
                                    si32(this.i0,mstate.esp);
                                    state = 11;
                                    mstate.esp = mstate.esp - 4;
                                    FSM___gethex_D2A.start();
                                    return;
                                 }
                              }
                           }
                        }
                        else if(this.i4 != 1)
                        {
                           §§goto(addr2433);
                        }
                     }
                     else if(this.i4 != 0)
                     {
                        §§goto(addr2433);
                     }
                     si32(this.i0,this.i3);
                     si32(this.i5,this.i2);
                     this.i0 = this.i10 | 16;
                     addr2835:
                     mstate.eax = this.i0;
                     break;
                  }
                  si32(this.i0,this.i3);
                  si32(this.i5,this.i2);
                  mstate.eax = this.i10;
                  break;
               }
               this.i5 = this.i0;
               addr1928:
               if(this.i5 != 0)
               {
                  this.i0 = FSM___gethex_D2A;
                  this.i1 = li32(this.i5 + 4);
                  this.i1 = this.i1 << 2;
                  this.i0 = this.i0 + this.i1;
                  this.i1 = li32(this.i0);
                  si32(this.i1,this.i5);
                  si32(this.i5,this.i0);
               }
               this.i5 = 0;
               si32(this.i5,this.i3);
               this.i5 = 163;
               mstate.eax = this.i5;
               break;
            case 3:
               this.i10 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               if(this.i10 == 0)
               {
                  this.i10 = 0;
               }
               else
               {
                  this.i10 = 1;
                  this.i11 = this.i5 + -1;
                  this.i12 = this.i11 >> 5;
                  this.i12 = this.i12 << 2;
                  this.i13 = this.i11 & 31;
                  this.i12 = this.i0 + this.i12;
                  this.i12 = li32(this.i12 + 20);
                  this.i10 = this.i10 << this.i13;
                  this.i10 = this.i12 & this.i10;
                  if(this.i10 == 0)
                  {
                     this.i10 = 1;
                  }
                  else
                  {
                     if(this.i11 > 1)
                     {
                        mstate.esp = mstate.esp - 8;
                        this.i10 = this.i5 + -2;
                        si32(this.i0,mstate.esp);
                        si32(this.i10,mstate.esp + 4);
                        mstate.esp = mstate.esp - 4;
                        FSM___gethex_D2A.start();
                     }
                     addr1676:
                     this.i10 = 2;
                  }
               }
               mstate.esp = mstate.esp - 8;
               si32(this.i0,mstate.esp);
               si32(this.i5,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM___gethex_D2A.start();
            case 4:
               mstate.esp = mstate.esp + 8;
               this.i5 = this.i5 + this.i7;
               §§goto(addr1904);
            case 5:
               this.i10 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               if(this.i10 != 0)
               {
                  mstate.esp = mstate.esp - 8;
                  si32(this.i0,mstate.esp);
                  si32(this.i5,mstate.esp + 4);
                  mstate.esp = mstate.esp - 4;
                  FSM___gethex_D2A.start();
               }
               else
               {
                  §§goto(addr1676);
               }
               §§goto(addr1928);
            case 6:
               mstate.esp = mstate.esp + 8;
               this.i10 = li32(this.i1 + 8);
               this.i5 = this.i5 + this.i7;
               if(this.i10 >= this.i5)
               {
                  this.i7 = 3;
                  §§goto(addr1786);
               }
               else
               {
                  this.i5 = this.i0;
                  §§goto(addr1928);
               }
               §§goto(addr2177);
            case 7:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i11 = this.i0 + 20;
               this.i5 = this.i7 - this.i5;
               this.i10 = this.i9;
               this.i9 = this.i11;
               §§goto(addr1904);
            case 8:
               this.i5 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               if(this.i5 != 0)
               {
                  §§goto(addr2088);
               }
               else
               {
                  §§goto(addr2122);
               }
               §§goto(addr2177);
            case 9:
               this.i7 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               §§goto(addr2240);
            case 10:
               this.i10 = this.i13 & this.i10;
               mstate.esp = mstate.esp + 8;
               this.i10 = this.i10 == 0?0:2;
               this.i11 = li32(this.i11);
               this.i5 = this.i6 - this.i5;
               this.i7 = this.i10 | this.i7;
               this.i6 = 2;
               this.i10 = this.i6;
               this.i6 = this.i5;
               this.i5 = this.i11;
               §§goto(addr2363);
            case 11:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 4;
               if(this.i10 == 2)
               {
                  this.i1 = li32(this.i8);
                  this.i1 = this.i1 + -1;
                  if(this.i1 == this.i6)
                  {
                     this.i1 = 1;
                     this.i4 = this.i6 >> 5;
                     this.i4 = this.i4 << 2;
                     this.i6 = this.i6 & 31;
                     this.i4 = this.i0 + this.i4;
                     this.i4 = li32(this.i4 + 20);
                     this.i1 = this.i1 << this.i6;
                     this.i1 = this.i4 & this.i1;
                     if(this.i1 != 0)
                     {
                        this.i1 = 33;
                        si32(this.i0,this.i3);
                        si32(this.i5,this.i2);
                        mstate.eax = this.i1;
                        break;
                     }
                     addr2498:
                  }
               }
               else
               {
                  this.i7 = li32(this.i0 + 16);
                  if(this.i7 <= this.i4)
                  {
                     this.i6 = this.i6 & 31;
                     if(this.i6 != 0)
                     {
                        this.i4 = this.i4 << 2;
                        this.i4 = this.i4 + this.i0;
                        this.i4 = li32(this.i4 + 16);
                        this.i7 = uint(this.i4) < uint(65536)?16:0;
                        this.i4 = this.i4 << this.i7;
                        this.i8 = uint(this.i4) < uint(16777216)?8:0;
                        this.i4 = this.i4 << this.i8;
                        this.i9 = uint(this.i4) < uint(268435456)?4:0;
                        this.i7 = this.i8 | this.i7;
                        this.i4 = this.i4 << this.i9;
                        this.i8 = uint(this.i4) < uint(1073741824)?2:0;
                        this.i7 = this.i7 | this.i9;
                        this.i7 = this.i7 | this.i8;
                        this.i4 = this.i4 << this.i8;
                        if(this.i4 <= -1)
                        {
                           this.i4 = this.i7;
                        }
                        else
                        {
                           this.i4 = this.i4 & 1073741824;
                           this.i7 = this.i7 + 1;
                           this.i4 = this.i4 == 0?32:int(this.i7);
                        }
                        this.i6 = 32 - this.i6;
                        if(this.i4 < this.i6)
                        {
                        }
                     }
                     §§goto(addr2498);
                  }
                  this.i4 = 1;
                  mstate.esp = mstate.esp - 8;
                  si32(this.i0,mstate.esp);
                  si32(this.i4,mstate.esp + 4);
                  mstate.esp = mstate.esp - 4;
                  FSM___gethex_D2A.start();
               }
               addr2817:
               si32(this.i0,this.i3);
               si32(this.i5,this.i2);
               this.i0 = this.i10 | 32;
               §§goto(addr2835);
            case 12:
               mstate.esp = mstate.esp + 8;
               this.i1 = li32(this.i1 + 8);
               this.i5 = this.i5 + 1;
               if(this.i5 <= this.i1)
               {
                  §§goto(addr2817);
               }
               else
               {
                  this.i5 = this.i0;
                  §§goto(addr1928);
               }
         }
         mstate.esp = mstate.ebp;
         mstate.ebp = li32(mstate.esp);
         mstate.esp = mstate.esp + 4;
         mstate.esp = mstate.esp + 4;
         mstate.gworker = caller;
      }
   }
}
