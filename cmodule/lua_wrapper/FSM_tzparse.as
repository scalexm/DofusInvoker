package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.li8;
   import avm2.intrinsics.memory.si32;
   import avm2.intrinsics.memory.si8;
   
   public final class FSM_tzparse extends Machine
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
      
      public function FSM_tzparse()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM_tzparse = null;
         _loc1_ = new FSM_tzparse();
         FSM_tzparse.gworker = _loc1_;
      }
      
      override public final function work() : void
      {
         loop14:
         switch(state)
         {
            case 0:
               mstate.esp = mstate.esp - 4;
               si32(mstate.ebp,mstate.esp);
               mstate.ebp = mstate.esp;
               mstate.esp = mstate.esp - 72;
               this.i0 = li32(mstate.ebp + 8);
               this.i1 = li8(this.i0);
               this.i2 = li32(mstate.ebp + 12);
               this.i3 = this.i0;
               this.i4 = this.i2;
               this.i5 = li32(mstate.ebp + 16);
               if(this.i5 != 0)
               {
                  this.i1 = this.i1 & 255;
                  if(this.i1 != 0)
                  {
                     this.i1 = this.i3;
                     while(true)
                     {
                        this.i5 = li8(this.i1 + 1);
                        this.i1 = this.i1 + 1;
                        this.i6 = this.i1;
                        if(this.i5 != 0)
                        {
                           this.i1 = this.i6;
                           continue;
                        }
                        break;
                     }
                  }
                  else
                  {
                     this.i1 = this.i0;
                  }
                  this.i5 = 0;
                  si32(this.i5,mstate.ebp + -72);
                  mstate.esp = mstate.esp - 8;
                  this.i5 = FSM_tzparse;
                  si32(this.i5,mstate.esp);
                  si32(this.i2,mstate.esp + 4);
                  state = 10;
                  mstate.esp = mstate.esp - 4;
                  FSM_tzparse.start();
                  return;
               }
               this.i5 = this.i1 & 255;
               if(this.i5 != 0)
               {
                  this.i0 = this.i3;
                  while(true)
                  {
                     this.i5 = this.i1 << 24;
                     this.i5 = this.i5 >> 24;
                     this.i6 = this.i0;
                     this.i5 = this.i5 + -48;
                     this.i7 = this.i1 & 255;
                     if(this.i7 != 45)
                     {
                        this.i7 = this.i1 & 255;
                        if(this.i7 != 43)
                        {
                           this.i1 = this.i1 & 255;
                           if(this.i1 != 44)
                           {
                              if(uint(this.i5) <= uint(9))
                              {
                                 break;
                              }
                              this.i1 = li8(this.i0 + 1);
                              this.i0 = this.i0 + 1;
                              this.i5 = this.i0;
                              if(this.i1 != 0)
                              {
                                 this.i0 = this.i5;
                                 continue;
                              }
                           }
                           break;
                        }
                        break;
                     }
                     break;
                  }
                  this.i0 = this.i6;
               }
               this.i1 = this.i0 - this.i3;
               if(uint(this.i1) <= uint(2))
               {
                  addr242:
                  this.i0 = -1;
                  addr2427:
                  mstate.eax = this.i0;
                  mstate.esp = mstate.ebp;
                  mstate.ebp = li32(mstate.esp);
                  mstate.esp = mstate.esp + 4;
                  mstate.esp = mstate.esp + 4;
                  mstate.gworker = caller;
                  return;
               }
               this.i5 = li8(this.i0);
               if(this.i5 != 0)
               {
                  this.i6 = this.i5 & 255;
                  if(this.i6 != 43)
                  {
                     this.i5 = this.i5 & 255;
                     if(this.i5 == 45)
                     {
                        this.i5 = mstate.ebp + -72;
                        mstate.esp = mstate.esp - 8;
                        this.i0 = this.i0 + 1;
                        si32(this.i0,mstate.esp);
                        si32(this.i5,mstate.esp + 4);
                        mstate.esp = mstate.esp - 4;
                        FSM_tzparse.start();
                     }
                     addr405:
                     this.i5 = this.i0;
                     if(this.i5 != 0)
                     {
                        this.i0 = FSM_tzparse;
                        mstate.esp = mstate.esp - 8;
                        si32(this.i0,mstate.esp);
                        si32(this.i2,mstate.esp + 4);
                        state = 3;
                        mstate.esp = mstate.esp - 4;
                        FSM_tzparse.start();
                        return;
                     }
                     break;
                  }
                  this.i0 = this.i0 + 1;
                  this.i5 = mstate.ebp + -72;
                  mstate.esp = mstate.esp - 8;
                  si32(this.i0,mstate.esp);
                  si32(this.i5,mstate.esp + 4);
                  mstate.esp = mstate.esp - 4;
                  FSM_tzparse.start();
               }
               break;
            case 1:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               if(this.i0 != 0)
               {
                  this.i5 = li32(mstate.ebp + -72);
                  this.i5 = 0 - this.i5;
                  si32(this.i5,mstate.ebp + -72);
               }
               §§goto(addr405);
            case 2:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               §§goto(addr405);
            case 3:
               this.i6 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               if(this.i6 != 0)
               {
                  this.i0 = this.i1;
                  this.i1 = this.i5;
                  this.i5 = this.i6;
                  addr478:
                  this.i6 = 0;
                  si32(this.i6,this.i2);
               }
               else
               {
                  this.i0 = this.i1;
                  this.i1 = this.i5;
                  this.i5 = this.i6;
               }
               addr488:
               this.i6 = li8(this.i1);
               this.i7 = this.i1;
               if(this.i6 != 0)
               {
                  this.i8 = this.i7;
                  while(true)
                  {
                     this.i9 = this.i6 << 24;
                     this.i9 = this.i9 >> 24;
                     this.i10 = this.i8;
                     this.i9 = this.i9 + -48;
                     this.i11 = this.i6 & 255;
                     if(this.i11 != 45)
                     {
                        this.i11 = this.i6 & 255;
                        if(this.i11 != 43)
                        {
                           this.i6 = this.i6 & 255;
                           if(this.i6 != 44)
                           {
                              if(uint(this.i9) <= uint(9))
                              {
                                 break;
                              }
                              this.i6 = li8(this.i8 + 1);
                              this.i8 = this.i8 + 1;
                              this.i9 = this.i8;
                              if(this.i6 != 0)
                              {
                                 this.i8 = this.i9;
                                 continue;
                              }
                              addr604:
                              this.i6 = this.i8;
                              this.i8 = this.i6 - this.i7;
                              if(uint(this.i8) >= uint(3))
                              {
                                 this.i9 = li8(this.i6);
                                 this.i10 = this.i9 << 24;
                                 this.i10 = this.i10 >> 24;
                                 if(this.i10 <= 43)
                                 {
                                    this.i10 = this.i9 & 255;
                                    if(this.i10 != 0)
                                    {
                                       this.i9 = this.i9 & 255;
                                       if(this.i9 != 43)
                                       {
                                          addr709:
                                          this.i9 = this.i6;
                                       }
                                       else
                                       {
                                          this.i9 = this.i6 + 1;
                                       }
                                       this.i10 = mstate.ebp + -68;
                                       mstate.esp = mstate.esp - 8;
                                       si32(this.i9,mstate.esp);
                                       si32(this.i10,mstate.esp + 4);
                                       mstate.esp = mstate.esp - 4;
                                       FSM_tzparse.start();
                                    }
                                    addr863:
                                    this.i10 = FSM_tzparse;
                                    this.i11 = li8(this.i9);
                                    this.i11 = this.i11 != 0?1:0;
                                    this.i5 = this.i5 == 0?1:0;
                                    this.i5 = this.i11 | this.i5;
                                    this.i5 = this.i5 & 1;
                                    this.i5 = this.i5 != 0?int(this.i9):int(this.i10);
                                    this.i9 = li8(this.i5);
                                    addr2083:
                                    if(this.i9 != 0)
                                    {
                                       this.i1 = this.i9 & 255;
                                       if(this.i1 != 44)
                                       {
                                          this.i1 = this.i9 & 255;
                                          if(this.i1 == 59)
                                          {
                                          }
                                          break loop14;
                                       }
                                       this.i1 = mstate.ebp + -64;
                                       mstate.esp = mstate.esp - 8;
                                       this.i6 = this.i5 + 1;
                                       si32(this.i6,mstate.esp);
                                       si32(this.i1,mstate.esp + 4);
                                       mstate.esp = mstate.esp - 4;
                                       FSM_tzparse.start();
                                    }
                                    else
                                    {
                                       this.i5 = 0;
                                       this.i9 = li32(this.i2 + 4);
                                       loop3:
                                       while(true)
                                       {
                                          if(this.i9 <= this.i5)
                                          {
                                             this.i5 = 0;
                                             this.i10 = this.i5;
                                             addr1692:
                                             while(true)
                                             {
                                                this.i11 = this.i5;
                                                if(this.i9 <= this.i11)
                                                {
                                                   this.i5 = this.i10;
                                                   break;
                                                }
                                                this.i5 = this.i10;
                                                this.i10 = this.i11;
                                                break loop3;
                                             }
                                          }
                                          else
                                          {
                                             this.i10 = this.i4 + this.i5;
                                             this.i10 = li8(this.i10 + 1496);
                                             this.i11 = this.i10 * 20;
                                             this.i11 = this.i2 + this.i11;
                                             this.i11 = li32(this.i11 + 1872);
                                             if(this.i11 == 0)
                                             {
                                                this.i5 = this.i10 * 20;
                                                this.i5 = this.i2 + this.i5;
                                                this.i5 = li32(this.i5 + 1868);
                                                this.i5 = 0 - this.i5;
                                                if(this.i9 > 0)
                                                {
                                                   this.i10 = 0;
                                                   break;
                                                }
                                             }
                                             else
                                             {
                                                this.i5 = this.i5 + 1;
                                                continue;
                                             }
                                          }
                                          addr1706:
                                          if(this.i9 >= 1)
                                          {
                                             this.i10 = 0;
                                             this.i11 = li32(mstate.ebp + -72);
                                             this.i12 = this.i4 + 16;
                                             while(true)
                                             {
                                                this.i13 = this.i4 + this.i10;
                                                this.i14 = li8(this.i13 + 1496);
                                                this.i15 = this.i14 * 20;
                                                this.i15 = this.i2 + this.i15;
                                                this.i16 = li32(this.i15 + 1872);
                                                si8(this.i16,this.i13 + 1496);
                                                this.i13 = li32(this.i15 + 1884);
                                                this.i15 = this.i12;
                                                if(this.i13 == 0)
                                                {
                                                   this.i13 = li32(this.i15);
                                                   this.i13 = this.i13 - this.i5;
                                                   this.i13 = this.i13 + this.i11;
                                                   si32(this.i13,this.i15);
                                                }
                                                this.i13 = this.i14 * 20;
                                                this.i13 = this.i2 + this.i13;
                                                this.i13 = li32(this.i13 + 1868);
                                                this.i13 = 0 - this.i13;
                                                this.i5 = this.i16 == 0?int(this.i13):int(this.i5);
                                                this.i12 = this.i12 + 4;
                                                this.i10 = this.i10 + 1;
                                                if(this.i9 > this.i10)
                                                {
                                                   continue;
                                                }
                                                break;
                                             }
                                          }
                                          this.i5 = 0;
                                          this.i9 = li32(mstate.ebp + -72);
                                          this.i9 = 0 - this.i9;
                                          si32(this.i9,this.i2 + 1868);
                                          si32(this.i5,this.i2 + 1872);
                                          si32(this.i5,this.i2 + 1876);
                                          this.i5 = li32(mstate.ebp + -68);
                                          this.i5 = 0 - this.i5;
                                          si32(this.i5,this.i2 + 1888);
                                          this.i5 = 1;
                                          si32(this.i5,this.i2 + 1892);
                                          this.i5 = this.i0 + 1;
                                          si32(this.i5,this.i2 + 1896);
                                          this.i9 = 2;
                                          si32(this.i9,this.i2 + 8);
                                          si32(this.i5,this.i2 + 12);
                                          if(this.i6 != this.i1)
                                          {
                                             this.i1 = this.i8;
                                             addr2054:
                                             this.i5 = li32(this.i2 + 12);
                                             this.i5 = this.i1 + this.i5;
                                             this.i5 = this.i5 + 1;
                                             si32(this.i5,this.i2 + 12);
                                          }
                                          else
                                          {
                                             this.i1 = this.i8;
                                          }
                                       }
                                       while(true)
                                       {
                                          this.i11 = this.i2 + this.i10;
                                          this.i11 = li8(this.i11 + 1496);
                                          this.i11 = this.i11 * 20;
                                          this.i11 = this.i2 + this.i11;
                                          this.i11 = li32(this.i11 + 1872);
                                          if(this.i11 == 0)
                                          {
                                             this.i11 = this.i10 + 1;
                                             this.i10 = this.i5;
                                             this.i5 = this.i11;
                                             §§goto(addr1692);
                                          }
                                          §§goto(addr1706);
                                       }
                                    }
                                    this.i5 = li32(this.i2 + 12);
                                    if(uint(this.i5) <= uint(512))
                                    {
                                       if(this.i0 != 0)
                                       {
                                          this.i5 = 0;
                                          this.i6 = this.i0;
                                          loop7:
                                          while(true)
                                          {
                                             this.i8 = this.i3 + this.i5;
                                             this.i8 = li8(this.i8);
                                             this.i9 = this.i4 + this.i5;
                                             si8(this.i8,this.i9 + 6988);
                                             this.i9 = this.i5 + 1;
                                             if(this.i8 != 0)
                                             {
                                                this.i8 = this.i6 + -1;
                                                this.i5 = this.i5 + 1;
                                                if(this.i6 != 1)
                                                {
                                                   this.i6 = this.i8;
                                                   continue;
                                                }
                                                break;
                                             }
                                             if(this.i6 != 1)
                                             {
                                                this.i5 = 0;
                                                while(true)
                                                {
                                                   this.i3 = 0;
                                                   this.i8 = this.i9 + this.i5;
                                                   this.i8 = this.i2 + this.i8;
                                                   si8(this.i3,this.i8 + 6988);
                                                   this.i3 = this.i5 + 1;
                                                   this.i5 = this.i6 - this.i5;
                                                   if(this.i5 != 2)
                                                   {
                                                      this.i5 = this.i3;
                                                      continue;
                                                   }
                                                   break loop7;
                                                }
                                             }
                                             break;
                                          }
                                       }
                                       this.i3 = 0;
                                       this.i5 = this.i2 + this.i0;
                                       si8(this.i3,this.i5 + 6988);
                                       this.i3 = this.i0 + 1;
                                       if(this.i1 == 0)
                                       {
                                          this.i0 = 0;
                                       }
                                       else
                                       {
                                          this.i5 = 0;
                                          this.i0 = this.i0 + this.i4;
                                          this.i4 = this.i1;
                                          loop9:
                                          while(true)
                                          {
                                             this.i6 = this.i7 + this.i5;
                                             this.i6 = li8(this.i6);
                                             this.i8 = this.i0 + this.i5;
                                             si8(this.i6,this.i8 + 6989);
                                             this.i8 = this.i5 + 1;
                                             if(this.i6 != 0)
                                             {
                                                this.i6 = this.i4 + -1;
                                                this.i5 = this.i5 + 1;
                                                if(this.i4 != 1)
                                                {
                                                   this.i4 = this.i6;
                                                   continue;
                                                }
                                                break;
                                             }
                                             if(this.i4 != 1)
                                             {
                                                this.i0 = 0;
                                                while(true)
                                                {
                                                   this.i5 = 0;
                                                   this.i7 = this.i8 + this.i0;
                                                   this.i7 = this.i3 + this.i7;
                                                   this.i7 = this.i2 + this.i7;
                                                   si8(this.i5,this.i7 + 6988);
                                                   this.i5 = this.i0 + 1;
                                                   this.i0 = this.i4 - this.i0;
                                                   if(this.i0 != 2)
                                                   {
                                                      this.i0 = this.i5;
                                                      continue;
                                                   }
                                                   break loop9;
                                                }
                                             }
                                             break;
                                          }
                                          this.i0 = 0;
                                          this.i1 = this.i1 + this.i3;
                                          this.i1 = this.i2 + this.i1;
                                          si8(this.i0,this.i1 + 6988);
                                       }
                                       §§goto(addr2427);
                                    }
                                    else
                                    {
                                       break loop14;
                                    }
                                 }
                                 else
                                 {
                                    this.i10 = this.i9 & 255;
                                    if(this.i10 != 44)
                                    {
                                       this.i10 = this.i9 & 255;
                                       if(this.i10 != 45)
                                       {
                                          this.i9 = this.i9 & 255;
                                          if(this.i9 != 59)
                                          {
                                             §§goto(addr709);
                                          }
                                          §§goto(addr863);
                                       }
                                       else
                                       {
                                          this.i9 = mstate.ebp + -68;
                                          mstate.esp = mstate.esp - 8;
                                          this.i10 = this.i6 + 1;
                                          si32(this.i10,mstate.esp);
                                          si32(this.i9,mstate.esp + 4);
                                          mstate.esp = mstate.esp - 4;
                                          FSM_tzparse.start();
                                       }
                                       addr833:
                                       if(this.i9 != 0)
                                       {
                                          §§goto(addr863);
                                       }
                                       break loop14;
                                    }
                                 }
                                 this.i9 = li32(mstate.ebp + -72);
                                 this.i9 = this.i9 + -3600;
                                 si32(this.i9,mstate.ebp + -68);
                                 this.i9 = this.i6;
                                 §§goto(addr863);
                              }
                              break loop14;
                           }
                           break;
                        }
                        break;
                     }
                     break;
                  }
                  this.i8 = this.i10;
                  §§goto(addr604);
               }
               else
               {
                  this.i1 = 1;
                  si32(this.i1,this.i2 + 8);
                  this.i1 = 0;
                  si32(this.i1,this.i2 + 4);
                  this.i5 = li32(mstate.ebp + -72);
                  this.i5 = 0 - this.i5;
                  si32(this.i5,this.i2 + 1868);
                  si32(this.i1,this.i2 + 1872);
                  si32(this.i1,this.i2 + 1876);
               }
               addr2036:
               this.i5 = this.i0 + 1;
               si32(this.i5,this.i2 + 12);
               if(this.i1 != 0)
               {
                  §§goto(addr2054);
               }
               §§goto(addr2083);
            case 4:
               this.i9 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               §§goto(addr833);
            case 5:
               this.i9 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               if(this.i9 != 0)
               {
                  this.i10 = li32(mstate.ebp + -68);
                  this.i10 = 0 - this.i10;
                  si32(this.i10,mstate.ebp + -68);
               }
               §§goto(addr833);
            case 6:
               this.i1 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               if(this.i1 != 0)
               {
                  this.i6 = li8(this.i1);
                  if(this.i6 == 44)
                  {
                     this.i6 = mstate.ebp + -32;
                     mstate.esp = mstate.esp - 8;
                     this.i1 = this.i1 + 1;
                     si32(this.i1,mstate.esp);
                     si32(this.i6,mstate.esp + 4);
                     mstate.esp = mstate.esp - 4;
                     FSM_tzparse.start();
                  }
                  break;
               }
               break;
            case 7:
               this.i1 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               if(this.i1 != 0)
               {
                  this.i1 = li8(this.i1);
                  if(this.i1 == 0)
                  {
                     this.i1 = 2;
                     si32(this.i1,this.i2 + 8);
                     this.i1 = 136;
                     si32(this.i1,this.i2 + 4);
                     this.i1 = li32(mstate.ebp + -68);
                     this.i6 = 0 - this.i1;
                     si32(this.i6,this.i2 + 1868);
                     this.i6 = 1;
                     si32(this.i6,this.i2 + 1872);
                     this.i6 = this.i0 + 1;
                     si32(this.i6,this.i2 + 1876);
                     this.i6 = li32(mstate.ebp + -72);
                     this.i5 = 0 - this.i6;
                     si32(this.i5,this.i2 + 1888);
                     this.i5 = 0;
                     si32(this.i5,this.i2 + 1892);
                     si32(this.i5,this.i2 + 1896);
                     this.i9 = this.i4;
                     this.i10 = this.i4;
                     this.i11 = this.i5;
                     addr1193:
                     while(true)
                     {
                        this.i12 = mstate.ebp + -64;
                        mstate.esp = mstate.esp - 16;
                        this.i13 = this.i11 + 1970;
                        si32(this.i5,mstate.esp);
                        si32(this.i13,mstate.esp + 4);
                        si32(this.i12,mstate.esp + 8);
                        si32(this.i6,mstate.esp + 12);
                        mstate.esp = mstate.esp - 4;
                        FSM_tzparse.start();
                     }
                  }
                  break;
               }
               break;
            case 8:
               while(true)
               {
                  this.i12 = mstate.eax;
                  mstate.esp = mstate.esp + 16;
                  mstate.esp = mstate.esp - 16;
                  this.i14 = mstate.ebp + -32;
                  si32(this.i5,mstate.esp);
                  si32(this.i13,mstate.esp + 4);
                  si32(this.i14,mstate.esp + 8);
                  si32(this.i1,mstate.esp + 12);
                  mstate.esp = mstate.esp - 4;
                  FSM_tzparse.start();
               }
            case 9:
               while(true)
               {
                  this.i14 = mstate.eax;
                  mstate.esp = mstate.esp + 16;
                  this.i15 = this.i10 + 1496;
                  this.i16 = this.i9 + 16;
                  if(this.i12 > this.i14)
                  {
                     this.i17 = 1;
                     si32(this.i14,this.i16);
                     si8(this.i17,this.i15);
                     si32(this.i12,this.i9 + 20);
                     this.i12 = 0;
                     si8(this.i12,this.i10 + 1497);
                  }
                  else
                  {
                     this.i17 = 0;
                     si32(this.i12,this.i16);
                     si8(this.i17,this.i15);
                     si32(this.i14,this.i9 + 20);
                     this.i12 = 1;
                     si8(this.i12,this.i10 + 1497);
                  }
                  this.i12 = this.i13 & 3;
                  if(this.i12 == 0)
                  {
                     this.i12 = this.i13 / 100;
                     this.i12 = this.i12 * 100;
                     this.i12 = this.i13 - this.i12;
                     if(this.i12 == 0)
                     {
                        this.i12 = this.i13 / 400;
                        this.i12 = this.i12 * 400;
                        this.i13 = this.i13 - this.i12;
                        if(this.i13 != 0)
                        {
                        }
                        addr1461:
                        this.i12 = this.i13;
                        this.i13 = FSM_tzparse;
                        this.i12 = this.i12 << 2;
                        this.i12 = this.i13 + this.i12;
                        this.i12 = li32(this.i12);
                        this.i12 = this.i12 * 86400;
                        this.i9 = this.i9 + 8;
                        this.i10 = this.i10 + 2;
                        this.i11 = this.i11 + 1;
                        this.i5 = this.i12 + this.i5;
                        if(this.i11 != 68)
                        {
                           §§goto(addr1193);
                        }
                        else
                        {
                           break;
                        }
                     }
                     this.i13 = 1;
                     §§goto(addr1461);
                  }
                  this.i13 = 0;
                  §§goto(addr1461);
               }
               this.i1 = this.i8;
               §§goto(addr2036);
            case 10:
               this.i5 = mstate.eax;
               this.i0 = this.i1 - this.i0;
               mstate.esp = mstate.esp + 8;
               this.i0 = uint(this.i0) > uint(511)?511:int(this.i0);
               if(this.i5 != 0)
               {
                  §§goto(addr478);
               }
               §§goto(addr488);
         }
         §§goto(addr242);
      }
   }
}
