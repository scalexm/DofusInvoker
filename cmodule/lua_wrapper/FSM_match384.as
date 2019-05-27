package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.li8;
   import avm2.intrinsics.memory.si32;
   import avm2.intrinsics.memory.sxi8;
   
   public final class FSM_match384 extends Machine
   {
      
      public static const intRegCount:int = 18;
      
      public static const NumberRegCount:int = 0;
       
      
      public var i10:int;
      
      public var i11:int;
      
      public var i12:int;
      
      public var i13:int;
      
      public var i14:int;
      
      public var i15:int;
      
      public var i17:int;
      
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
      
      public function FSM_match384()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM_match384 = null;
         _loc1_ = new FSM_match384();
         FSM_match384.gworker = _loc1_;
      }
      
      override public final function work() : void
      {
         loop8:
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
               this.i3 = this.i0 + 12;
               this.i4 = this.i0 + 8;
               this.i5 = this.i0 + 4;
               this.i6 = this.i0;
               this.i7 = this.i0;
               loop0:
               while(true)
               {
                  this.i8 = si8(li8(this.i2));
                  this.i9 = this.i2;
                  if(this.i8 <= 36)
                  {
                     if(this.i8 != 0)
                     {
                        if(this.i8 == 36)
                        {
                           addr102:
                           this.i9 = li8(this.i2 + 1);
                           if(this.i9 == 0)
                           {
                              this.i2 = li32(this.i5);
                              this.i1 = this.i2 == this.i1?int(this.i1):0;
                              addr342:
                              mstate.eax = this.i1;
                              break loop8;
                           }
                        }
                        addr1761:
                        mstate.esp = mstate.esp - 8;
                        si32(this.i0,mstate.esp);
                        si32(this.i2,mstate.esp + 4);
                        state = 13;
                        mstate.esp = mstate.esp - 4;
                        FSM_match384.start();
                        return;
                     }
                  }
                  else
                  {
                     if(this.i8 != 37)
                     {
                        if(this.i8 != 40)
                        {
                           if(this.i8 == 41)
                           {
                              addr542:
                              this.i3 = li32(this.i3);
                              this.i2 = this.i2 + 1;
                              this.i5 = this.i3 + -1;
                              if(this.i5 >= 0)
                              {
                                 this.i5 = this.i3 << 3;
                                 this.i5 = this.i7 + this.i5;
                                 this.i5 = this.i5 + 12;
                                 this.i3 = this.i3 + -1;
                                 while(true)
                                 {
                                    this.i6 = li32(this.i5);
                                    if(this.i6 == -1)
                                    {
                                       addr670:
                                       this.i3 = this.i3 << 3;
                                       this.i3 = this.i0 + this.i3;
                                       this.i4 = li32(this.i3 + 16);
                                       this.i4 = this.i1 - this.i4;
                                       si32(this.i4,this.i3 + 20);
                                       mstate.esp = mstate.esp - 12;
                                       si32(this.i0,mstate.esp);
                                       si32(this.i1,mstate.esp + 4);
                                       si32(this.i2,mstate.esp + 8);
                                       state = 6;
                                       mstate.esp = mstate.esp - 4;
                                       FSM_match384.start();
                                       return;
                                    }
                                    this.i5 = this.i5 + -8;
                                    this.i3 = this.i3 + -1;
                                    if(this.i3 >= 0)
                                    {
                                       continue;
                                    }
                                    break;
                                 }
                              }
                              this.i3 = FSM_match384;
                              this.i4 = li32(this.i4);
                              mstate.esp = mstate.esp - 8;
                              si32(this.i4,mstate.esp);
                              si32(this.i3,mstate.esp + 4);
                              state = 5;
                              mstate.esp = mstate.esp - 4;
                              FSM_match384.start();
                              return;
                           }
                        }
                        else
                        {
                           addr148:
                           this.i5 = li8(this.i2 + 1);
                           this.i6 = this.i2 + 1;
                           if(this.i5 == 41)
                           {
                              this.i6 = li32(this.i3);
                              this.i2 = this.i2 + 2;
                              if(this.i6 >= 32)
                              {
                                 this.i5 = FSM_match384;
                                 this.i4 = li32(this.i4);
                                 mstate.esp = mstate.esp - 8;
                                 si32(this.i4,mstate.esp);
                                 si32(this.i5,mstate.esp + 4);
                                 state = 1;
                                 mstate.esp = mstate.esp - 4;
                                 FSM_match384.start();
                                 return;
                              }
                              addr229:
                              this.i4 = -2;
                              this.i5 = this.i6 << 3;
                              this.i5 = this.i0 + this.i5;
                              si32(this.i1,this.i5 + 16);
                              si32(this.i4,this.i5 + 20);
                              this.i6 = this.i6 + 1;
                              si32(this.i6,this.i3);
                              mstate.esp = mstate.esp - 12;
                              si32(this.i0,mstate.esp);
                              si32(this.i1,mstate.esp + 4);
                              si32(this.i2,mstate.esp + 8);
                              state = 2;
                              mstate.esp = mstate.esp - 4;
                              FSM_match384.start();
                              return;
                           }
                           this.i2 = li32(this.i3);
                           if(this.i2 >= 32)
                           {
                              this.i5 = FSM_match384;
                              this.i4 = li32(this.i4);
                              mstate.esp = mstate.esp - 8;
                              si32(this.i4,mstate.esp);
                              si32(this.i5,mstate.esp + 4);
                              state = 3;
                              mstate.esp = mstate.esp - 4;
                              FSM_match384.start();
                              return;
                           }
                           addr430:
                           this.i4 = -1;
                           this.i5 = this.i2 << 3;
                           this.i5 = this.i0 + this.i5;
                           si32(this.i1,this.i5 + 16);
                           si32(this.i4,this.i5 + 20);
                           this.i2 = this.i2 + 1;
                           si32(this.i2,this.i3);
                           mstate.esp = mstate.esp - 12;
                           si32(this.i0,mstate.esp);
                           si32(this.i1,mstate.esp + 4);
                           si32(this.i6,mstate.esp + 8);
                           state = 4;
                           mstate.esp = mstate.esp - 4;
                           FSM_match384.start();
                           return;
                        }
                     }
                     else
                     {
                        this.i8 = 0;
                        loop1:
                        while(true)
                        {
                           this.i10 = this.i9 + this.i8;
                           this.i10 = li8(this.i10 + 1);
                           this.i11 = this.i10 << 24;
                           this.i11 = this.i11 >> 24;
                           this.i12 = this.i1;
                           if(this.i11 != 102)
                           {
                              if(this.i11 == 98)
                              {
                                 this.i10 = this.i9 + this.i8;
                                 this.i11 = li8(this.i10 + 2);
                                 this.i10 = this.i10 + 2;
                                 if(this.i11 != 0)
                                 {
                                    this.i11 = this.i9 + this.i8;
                                    this.i11 = li8(this.i11 + 3);
                                    if(this.i11 == 0)
                                    {
                                       break;
                                    }
                                    addr910:
                                    while(true)
                                    {
                                       this.i11 = li8(this.i1);
                                       this.i10 = li8(this.i10);
                                       if(this.i11 != this.i10)
                                       {
                                          break;
                                       }
                                       this.i11 = this.i9 + this.i8;
                                       this.i11 = li8(this.i11 + 3);
                                       this.i13 = li32(this.i5);
                                       this.i14 = this.i1 + 1;
                                       if(uint(this.i14) < uint(this.i13))
                                       {
                                          this.i14 = 1;
                                          this.i12 = this.i12 + 1;
                                          while(true)
                                          {
                                             this.i15 = li8(this.i12);
                                             this.i16 = this.i12;
                                             this.i17 = this.i11 & 255;
                                             if(this.i15 == this.i17)
                                             {
                                                this.i15 = this.i14 + -1;
                                                if(this.i14 != 1)
                                                {
                                                   this.i1 = this.i15;
                                                }
                                                else
                                                {
                                                   this.i10 = this.i1 + 2;
                                                   if(this.i10 != 0)
                                                   {
                                                      this.i1 = this.i9 + this.i8;
                                                      this.i12 = si8(li8(this.i1 + 4));
                                                      this.i1 = this.i8 + 4;
                                                      if(this.i12 <= 36)
                                                      {
                                                         if(this.i12 != 0)
                                                         {
                                                            if(this.i12 == 36)
                                                            {
                                                               this.i1 = this.i9 + this.i1;
                                                               this.i2 = this.i1;
                                                               this.i1 = this.i10;
                                                               §§goto(addr102);
                                                            }
                                                         }
                                                         else
                                                         {
                                                            this.i1 = this.i10;
                                                         }
                                                      }
                                                      else if(this.i12 != 41)
                                                      {
                                                         if(this.i12 != 40)
                                                         {
                                                            if(this.i12 == 37)
                                                            {
                                                               this.i8 = this.i1;
                                                               this.i1 = this.i10;
                                                               continue loop1;
                                                            }
                                                         }
                                                         else
                                                         {
                                                            this.i1 = this.i9 + this.i1;
                                                            this.i2 = this.i1;
                                                            this.i1 = this.i10;
                                                            §§goto(addr148);
                                                         }
                                                      }
                                                      else
                                                      {
                                                         this.i1 = this.i9 + this.i1;
                                                         this.i2 = this.i1;
                                                         this.i1 = this.i10;
                                                         §§goto(addr542);
                                                      }
                                                      this.i1 = this.i9 + this.i1;
                                                      this.i2 = this.i1;
                                                      this.i1 = this.i10;
                                                   }
                                                   else
                                                   {
                                                      break;
                                                   }
                                                }
                                             }
                                             else
                                             {
                                                this.i1 = this.i10 & 255;
                                                this.i15 = this.i15 & 255;
                                                if(this.i15 != this.i1)
                                                {
                                                   this.i1 = this.i14;
                                                }
                                                else
                                                {
                                                   this.i1 = this.i14 + 1;
                                                }
                                             }
                                             this.i14 = this.i1;
                                             this.i1 = this.i12 + 1;
                                             if(uint(this.i1) < uint(this.i13))
                                             {
                                                this.i12 = this.i1;
                                                this.i1 = this.i16;
                                                continue;
                                             }
                                             break;
                                          }
                                       }
                                    }
                                    this.i1 = 0;
                                 }
                                 break;
                              }
                              addr927:
                              this.i9 = FSM_match384;
                              this.i10 = this.i10 & 255;
                              this.i11 = this.i10 << 2;
                              this.i9 = this.i9 + this.i11;
                              this.i9 = li32(this.i9 + 52);
                              this.i11 = this.i2 + this.i8;
                              this.i9 = this.i9 & 1024;
                              if(this.i9 == 0)
                              {
                                 this.i2 = this.i11;
                              }
                              else
                              {
                                 this.i9 = this.i10 + -49;
                                 if(this.i9 >= 0)
                                 {
                                    this.i10 = li32(this.i3);
                                    if(this.i10 > this.i9)
                                    {
                                       this.i10 = this.i9 << 3;
                                       this.i10 = this.i0 + this.i10;
                                       this.i10 = li32(this.i10 + 20);
                                       if(this.i10 != -1)
                                       {
                                          addr1567:
                                          while(true)
                                          {
                                             this.i10 = this.i9 << 3;
                                             this.i10 = this.i0 + this.i10;
                                             this.i10 = li32(this.i10 + 20);
                                             this.i11 = li32(this.i5);
                                             this.i11 = this.i11 - this.i12;
                                             if(uint(this.i11) < uint(this.i10))
                                             {
                                                addr1611:
                                                this.i1 = 0;
                                             }
                                             else
                                             {
                                                this.i9 = this.i9 << 3;
                                                this.i9 = this.i0 + this.i9;
                                                this.i9 = li32(this.i9 + 16);
                                                if(this.i10 != 0)
                                                {
                                                   this.i11 = 0;
                                                   this.i13 = this.i10 + 1;
                                                   while(true)
                                                   {
                                                      this.i14 = this.i12 + this.i11;
                                                      this.i15 = this.i9 + this.i11;
                                                      this.i15 = li8(this.i15);
                                                      this.i14 = li8(this.i14);
                                                      if(this.i15 == this.i14)
                                                      {
                                                         this.i13 = this.i13 + -1;
                                                         this.i11 = this.i11 + 1;
                                                         if(this.i13 != 1)
                                                         {
                                                            continue;
                                                         }
                                                      }
                                                      else
                                                      {
                                                         §§goto(addr1611);
                                                      }
                                                   }
                                                }
                                                this.i1 = this.i1 + this.i10;
                                             }
                                             if(this.i1 != 0)
                                             {
                                                this.i9 = this.i8 | 2;
                                                this.i2 = this.i2 + this.i9;
                                                addr74:
                                                while(true)
                                                {
                                                   continue loop0;
                                                }
                                             }
                                          }
                                       }
                                       else
                                       {
                                          break loop0;
                                       }
                                    }
                                    break loop0;
                                 }
                                 break loop0;
                              }
                              §§goto(addr928);
                           }
                           else
                           {
                              this.i10 = this.i8 | 2;
                              this.i2 = this.i2 + this.i10;
                              this.i10 = li8(this.i2);
                              if(this.i10 != 91)
                              {
                                 this.i10 = FSM_match384;
                                 this.i8 = li32(this.i4);
                                 mstate.esp = mstate.esp - 8;
                                 si32(this.i8,mstate.esp);
                                 si32(this.i10,mstate.esp + 4);
                                 state = 8;
                                 mstate.esp = mstate.esp - 4;
                                 FSM_match384.start();
                                 return;
                              }
                              addr1237:
                              mstate.esp = mstate.esp - 8;
                              si32(this.i0,mstate.esp);
                              si32(this.i2,mstate.esp + 4);
                              state = 9;
                              mstate.esp = mstate.esp - 4;
                              FSM_match384.start();
                              return;
                           }
                        }
                        this.i11 = FSM_match384;
                        this.i13 = li32(this.i4);
                        mstate.esp = mstate.esp - 8;
                        si32(this.i13,mstate.esp);
                        si32(this.i11,mstate.esp + 4);
                        state = 7;
                        mstate.esp = mstate.esp - 4;
                        FSM_match384.start();
                        return;
                     }
                     §§goto(addr1761);
                  }
                  addr2536:
                  this.i0 = this.i1;
                  mstate.eax = this.i0;
                  break loop8;
               }
               this.i9 = FSM_match384;
               this.i10 = li32(this.i4);
               mstate.esp = mstate.esp - 8;
               si32(this.i10,mstate.esp);
               si32(this.i9,mstate.esp + 4);
               state = 12;
               mstate.esp = mstate.esp - 4;
               FSM_match384.start();
               return;
            case 1:
               mstate.esp = mstate.esp + 8;
               §§goto(addr229);
            case 2:
               this.i1 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               if(this.i1 == 0)
               {
                  addr326:
                  this.i2 = li32(this.i3);
                  this.i2 = this.i2 + -1;
                  si32(this.i2,this.i3);
                  §§goto(addr342);
               }
               §§goto(addr342);
            case 3:
               mstate.esp = mstate.esp + 8;
               §§goto(addr430);
            case 4:
               this.i1 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               if(this.i1 == 0)
               {
                  §§goto(addr326);
               }
               §§goto(addr342);
            case 5:
               mstate.esp = mstate.esp + 8;
               this.i3 = 0;
               §§goto(addr670);
            case 6:
               this.i1 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               this.i2 = this.i3 + 20;
               if(this.i1 != 0)
               {
                  §§goto(addr2536);
               }
               else
               {
                  this.i0 = -1;
                  si32(this.i0,this.i2);
                  §§goto(addr342);
               }
            case 7:
               mstate.esp = mstate.esp + 8;
               §§goto(addr910);
            case 8:
               mstate.esp = mstate.esp + 8;
               §§goto(addr1237);
            case 9:
               this.i10 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i8 = li32(this.i6);
               if(this.i8 == this.i1)
               {
                  this.i8 = 0;
               }
               else
               {
                  this.i8 = li8(this.i1 + -1);
               }
               mstate.esp = mstate.esp - 12;
               this.i9 = this.i10 + -1;
               si32(this.i8,mstate.esp);
               si32(this.i2,mstate.esp + 4);
               si32(this.i9,mstate.esp + 8);
               mstate.esp = mstate.esp - 4;
               FSM_match384.start();
            case 10:
               this.i8 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               if(this.i8 == 0)
               {
                  this.i8 = li8(this.i1);
                  mstate.esp = mstate.esp - 12;
                  si32(this.i8,mstate.esp);
                  si32(this.i2,mstate.esp + 4);
                  si32(this.i9,mstate.esp + 8);
                  mstate.esp = mstate.esp - 4;
                  FSM_match384.start();
               }
               §§goto(addr927);
            case 11:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               if(this.i2 != 0)
               {
                  this.i2 = this.i10;
                  §§goto(addr74);
               }
               §§goto(addr927);
            case 12:
               mstate.esp = mstate.esp + 8;
               this.i9 = 0;
               §§goto(addr1567);
            case 13:
               this.i8 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i9 = li32(this.i5);
               this.i10 = this.i1;
               if(uint(this.i9) > uint(this.i1))
               {
                  this.i9 = li8(this.i2);
                  this.i11 = li8(this.i1);
                  this.i12 = this.i9 << 24;
                  this.i12 = this.i12 >> 24;
                  this.i13 = this.i11;
                  if(this.i12 != 37)
                  {
                     if(this.i12 != 91)
                     {
                        if(this.i12 == 46)
                        {
                           this.i9 = 1;
                        }
                        else
                        {
                           this.i11 = this.i11 & 255;
                           this.i9 = this.i9 & 255;
                           this.i9 = this.i9 == this.i11?1:0;
                           this.i9 = this.i9 & 1;
                        }
                     }
                     else
                     {
                        mstate.esp = mstate.esp - 12;
                        this.i9 = this.i8 + -1;
                        si32(this.i13,mstate.esp);
                        si32(this.i2,mstate.esp + 4);
                        si32(this.i9,mstate.esp + 8);
                        mstate.esp = mstate.esp - 4;
                        FSM_match384.start();
                     }
                  }
                  else
                  {
                     this.i9 = li8(this.i2 + 1);
                     mstate.esp = mstate.esp - 8;
                     si32(this.i13,mstate.esp);
                     si32(this.i9,mstate.esp + 4);
                     mstate.esp = mstate.esp - 4;
                     FSM_match384.start();
                  }
                  addr1991:
                  if(this.i9 != 0)
                  {
                     this.i9 = 1;
                  }
                  addr2003:
                  this.i11 = si8(li8(this.i8));
                  if(this.i11 <= 44)
                  {
                     if(this.i11 != 42)
                     {
                        if(this.i11 == 43)
                        {
                           if(this.i9 != 0)
                           {
                              mstate.esp = mstate.esp - 16;
                              this.i1 = this.i1 + 1;
                           }
                        }
                        §§goto(addr927);
                     }
                     else
                     {
                        mstate.esp = mstate.esp - 16;
                     }
                     si32(this.i0,mstate.esp);
                     si32(this.i1,mstate.esp + 4);
                     si32(this.i2,mstate.esp + 8);
                     si32(this.i8,mstate.esp + 12);
                     state = 17;
                     mstate.esp = mstate.esp - 4;
                     FSM_match384.start();
                     return;
                  }
                  if(this.i11 != 45)
                  {
                     if(this.i11 == 63)
                     {
                        if(this.i9 != 0)
                        {
                           mstate.esp = mstate.esp - 12;
                           this.i2 = this.i1 + 1;
                           this.i9 = this.i8 + 1;
                           si32(this.i0,mstate.esp);
                           si32(this.i2,mstate.esp + 4);
                           si32(this.i9,mstate.esp + 8);
                           state = 16;
                           mstate.esp = mstate.esp - 4;
                           FSM_match384.start();
                           return;
                        }
                        addr2129:
                        this.i2 = this.i8 + 1;
                        §§goto(addr74);
                     }
                     §§goto(addr927);
                  }
                  else
                  {
                     mstate.esp = mstate.esp - 12;
                     this.i3 = this.i8 + 1;
                     si32(this.i0,mstate.esp);
                     si32(this.i1,mstate.esp + 4);
                     si32(this.i3,mstate.esp + 8);
                     state = 18;
                     mstate.esp = mstate.esp - 4;
                     FSM_match384.start();
                     return;
                  }
                  if(this.i9 != 0)
                  {
                     this.i1 = this.i1 + 1;
                     this.i2 = this.i8;
                     §§goto(addr74);
                  }
                  §§goto(addr927);
               }
               this.i9 = 0;
               §§goto(addr2003);
            case 14:
               this.i9 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               §§goto(addr1991);
            case 15:
               this.i9 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               §§goto(addr1991);
            case 16:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               if(this.i2 != 0)
               {
                  this.i1 = this.i2;
               }
               else
               {
                  §§goto(addr2129);
               }
               §§goto(addr2536);
            case 17:
               this.i1 = mstate.eax;
               mstate.esp = mstate.esp + 16;
               §§goto(addr342);
            case 18:
               this.i1 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               if(this.i1 == 0)
               {
                  this.i1 = this.i8 + -1;
                  this.i4 = this.i2 + 1;
                  this.i6 = this.i10;
                  addr2270:
                  this.i7 = li32(this.i5);
                  this.i8 = this.i6;
                  if(uint(this.i7) > uint(this.i6))
                  {
                     this.i7 = li8(this.i2);
                     this.i8 = li8(this.i8);
                     this.i9 = this.i7 << 24;
                     this.i9 = this.i9 >> 24;
                     this.i10 = this.i8;
                     if(this.i9 != 37)
                     {
                        if(this.i9 != 91)
                        {
                           if(this.i9 == 46)
                           {
                              this.i7 = 1;
                           }
                           else
                           {
                              this.i8 = this.i8 & 255;
                              this.i7 = this.i7 & 255;
                              this.i7 = this.i7 == this.i8?1:0;
                              this.i7 = this.i7 & 1;
                           }
                        }
                        else
                        {
                           mstate.esp = mstate.esp - 12;
                           si32(this.i10,mstate.esp);
                           si32(this.i2,mstate.esp + 4);
                           si32(this.i1,mstate.esp + 8);
                           mstate.esp = mstate.esp - 4;
                           FSM_match384.start();
                        }
                     }
                     else
                     {
                        this.i7 = li8(this.i4);
                        mstate.esp = mstate.esp - 8;
                        si32(this.i10,mstate.esp);
                        si32(this.i7,mstate.esp + 4);
                        mstate.esp = mstate.esp - 4;
                        FSM_match384.start();
                     }
                     addr2451:
                     if(this.i7 != 0)
                     {
                        mstate.esp = mstate.esp - 12;
                        this.i6 = this.i6 + 1;
                        si32(this.i0,mstate.esp);
                        si32(this.i6,mstate.esp + 4);
                        si32(this.i3,mstate.esp + 8);
                        state = 21;
                        mstate.esp = mstate.esp - 4;
                        FSM_match384.start();
                        return;
                     }
                  }
                  §§goto(addr927);
               }
               §§goto(addr2536);
            case 19:
               this.i7 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               §§goto(addr2451);
            case 20:
               this.i7 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               §§goto(addr2451);
            case 21:
               this.i7 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               if(this.i7 != 0)
               {
                  this.i1 = this.i7;
               }
               else
               {
                  §§goto(addr2270);
               }
               §§goto(addr2536);
         }
         mstate.esp = mstate.ebp;
         mstate.ebp = li32(mstate.esp);
         mstate.esp = mstate.esp + 4;
         mstate.esp = mstate.esp + 4;
         mstate.gworker = caller;
      }
   }
}
