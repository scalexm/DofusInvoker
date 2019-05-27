package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.li16;
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.li8;
   import avm2.intrinsics.memory.si32;
   import avm2.intrinsics.memory.si8;
   
   public final class FSM___wrap_setrunelocale extends Machine
   {
      
      public static const intRegCount:int = 26;
      
      public static const NumberRegCount:int = 0;
       
      
      public var i21:int;
      
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
      
      public var i20:int;
      
      public var i9:int;
      
      public function FSM___wrap_setrunelocale()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM___wrap_setrunelocale = null;
         _loc1_ = new FSM___wrap_setrunelocale();
         FSM___wrap_setrunelocale.gworker = _loc1_;
      }
      
      override public final function work() : void
      {
         switch(state)
         {
            case 0:
               mstate.esp = mstate.esp - 4;
               si32(mstate.ebp,mstate.esp);
               mstate.ebp = mstate.esp;
               mstate.esp = mstate.esp - 5120;
               this.i0 = mstate.ebp + -5120;
               this.i2 = li32(mstate.ebp + 8);
               this.i1 = li8(this.i2);
               this.i3 = this.i2;
               if(this.i1 != 67)
               {
                  this.i4 = FSM___wrap_setrunelocale;
                  this.i5 = this.i1;
               }
               else
               {
                  this.i4 = FSM___wrap_setrunelocale;
                  this.i5 = 0;
                  this.i6 = this.i1;
                  while(true)
                  {
                     this.i7 = this.i4 + this.i5;
                     this.i7 = this.i7 + 1;
                     this.i6 = this.i6 & 255;
                     if(this.i6 != 0)
                     {
                        this.i6 = this.i3 + this.i5;
                        this.i6 = li8(this.i6 + 1);
                        this.i7 = li8(this.i7);
                        this.i5 = this.i5 + 1;
                        if(this.i6 == this.i7)
                        {
                           continue;
                        }
                        this.i4 = FSM___wrap_setrunelocale;
                        this.i4 = this.i4 + this.i5;
                        this.i5 = this.i6;
                     }
                     break;
                  }
                  this.i0 = 0;
                  mstate.eax = this.i0;
                  mstate.esp = mstate.ebp;
                  mstate.ebp = li32(mstate.esp);
                  mstate.esp = mstate.esp + 4;
                  mstate.esp = mstate.esp + 4;
                  mstate.gworker = caller;
                  return;
               }
               this.i4 = li8(this.i4);
               this.i5 = this.i5 & 255;
               if(this.i5 != this.i4)
               {
                  this.i4 = this.i1 & 255;
                  if(this.i4 != 80)
                  {
                     this.i4 = FSM___wrap_setrunelocale;
                     this.i5 = this.i1;
                     addr269:
                     this.i4 = li8(this.i4);
                     this.i5 = this.i5 & 255;
                     if(this.i5 != this.i4)
                     {
                        this.i4 = li32(FSM___wrap_setrunelocale);
                        if(this.i4 != 0)
                        {
                           this.i5 = li8(FSM___wrap_setrunelocale);
                           this.i6 = this.i1 & 255;
                           if(this.i6 != this.i5)
                           {
                              this.i5 = FSM___wrap_setrunelocale;
                           }
                           else
                           {
                              this.i5 = FSM___wrap_setrunelocale;
                              this.i6 = 0;
                              while(true)
                              {
                                 this.i7 = this.i5 + this.i6;
                                 this.i7 = this.i7 + 1;
                                 this.i1 = this.i1 & 255;
                                 if(this.i1 != 0)
                                 {
                                    this.i1 = this.i3 + this.i6;
                                    this.i1 = li8(this.i1 + 1);
                                    this.i7 = li8(this.i7);
                                    this.i6 = this.i6 + 1;
                                    if(this.i1 == this.i7)
                                    {
                                       continue;
                                    }
                                    this.i5 = FSM___wrap_setrunelocale;
                                    this.i5 = this.i5 + this.i6;
                                 }
                                 break;
                              }
                              this.i0 = 0;
                              si32(this.i4,FSM___wrap_setrunelocale);
                              this.i2 = li32(FSM___wrap_setrunelocale);
                              si32(this.i2,FSM___wrap_setrunelocale);
                              this.i2 = li32(FSM___wrap_setrunelocale);
                              si32(this.i2,FSM___wrap_setrunelocale);
                              this.i2 = li32(FSM___wrap_setrunelocale);
                              si32(this.i2,FSM___wrap_setrunelocale);
                              this.i2 = li32(FSM___wrap_setrunelocale);
                              si32(this.i2,FSM___wrap_setrunelocale);
                              this.i2 = li32(FSM___wrap_setrunelocale);
                              si32(this.i2,FSM___wrap_setrunelocale);
                              this.i2 = li32(FSM___wrap_setrunelocale);
                              si32(this.i2,FSM___wrap_setrunelocale);
                           }
                           this.i5 = li8(this.i5);
                           this.i1 = this.i1 & 255;
                           if(this.i1 == this.i5)
                           {
                              §§goto(addr452);
                           }
                        }
                        this.i1 = mstate.ebp + -5120;
                        this.i4 = li32(FSM___wrap_setrunelocale);
                        this.i5 = li8(this.i4);
                        si8(this.i5,mstate.ebp + -5120);
                        if(this.i5 != 0)
                        {
                           this.i5 = 1;
                           while(true)
                           {
                              this.i6 = this.i4 + this.i5;
                              this.i6 = li8(this.i6);
                              this.i7 = this.i0 + this.i5;
                              si8(this.i6,this.i7);
                              this.i5 = this.i5 + 1;
                              if(this.i6 != 0)
                              {
                                 continue;
                              }
                              break;
                           }
                        }
                        this.i4 = li8(this.i1);
                        if(this.i4 != 0)
                        {
                           this.i4 = this.i0;
                           while(true)
                           {
                              this.i5 = li8(this.i4 + 1);
                              this.i4 = this.i4 + 1;
                              this.i6 = this.i4;
                              if(this.i5 != 0)
                              {
                                 this.i4 = this.i6;
                                 continue;
                              }
                              break;
                           }
                        }
                        else
                        {
                           this.i4 = this.i1;
                        }
                        this.i5 = mstate.ebp + -5120;
                        this.i4 = this.i4 - this.i0;
                        this.i6 = 47;
                        this.i7 = 0;
                        this.i4 = this.i5 + this.i4;
                        si8(this.i6,this.i4);
                        si8(this.i7,this.i4 + 1);
                        this.i4 = li8(this.i1);
                        if(this.i4 != 0)
                        {
                           this.i4 = this.i0;
                           while(true)
                           {
                              this.i5 = li8(this.i4 + 1);
                              this.i4 = this.i4 + 1;
                              this.i6 = this.i4;
                              if(this.i5 != 0)
                              {
                                 this.i4 = this.i6;
                                 continue;
                              }
                              break;
                           }
                        }
                        else
                        {
                           this.i4 = this.i1;
                        }
                        this.i5 = 0;
                        while(true)
                        {
                           this.i6 = this.i3 + this.i5;
                           this.i6 = li8(this.i6);
                           this.i7 = this.i4 + this.i5;
                           si8(this.i6,this.i7);
                           this.i5 = this.i5 + 1;
                           if(this.i6 != 0)
                           {
                              continue;
                           }
                           break;
                        }
                        this.i4 = li8(this.i1);
                        if(this.i4 != 0)
                        {
                           this.i4 = this.i0;
                           while(true)
                           {
                              this.i5 = li8(this.i4 + 1);
                              this.i4 = this.i4 + 1;
                              this.i6 = this.i4;
                              if(this.i5 != 0)
                              {
                                 this.i4 = this.i6;
                                 continue;
                              }
                              break;
                           }
                        }
                        else
                        {
                           this.i4 = this.i1;
                        }
                        this.i5 = mstate.ebp + -5120;
                        this.i0 = this.i4 - this.i0;
                        this.i0 = this.i5 + this.i0;
                        this.i4 = FSM___wrap_setrunelocale;
                        this.i5 = 10;
                        memcpy(this.i0,this.i4,this.i5);
                        this.i0 = li8(FSM___wrap_setrunelocale + 2);
                        mstate.esp = mstate.esp - 16;
                        this.i4 = 114;
                        this.i5 = 0;
                        si32(this.i1,mstate.esp);
                        si32(this.i4,mstate.esp + 4);
                        si32(this.i5,mstate.esp + 8);
                        si32(this.i0,mstate.esp + 12);
                        state = 21;
                        mstate.esp = mstate.esp - 4;
                        FSM___wrap_setrunelocale.start();
                        return;
                     }
                     §§goto(addr294);
                  }
                  else
                  {
                     this.i4 = FSM___wrap_setrunelocale;
                     this.i5 = 0;
                     this.i6 = this.i1;
                     while(true)
                     {
                        this.i7 = this.i4 + this.i5;
                        this.i7 = this.i7 + 1;
                        this.i6 = this.i6 & 255;
                        if(this.i6 != 0)
                        {
                           this.i6 = this.i3 + this.i5;
                           this.i6 = li8(this.i6 + 1);
                           this.i7 = li8(this.i7);
                           this.i5 = this.i5 + 1;
                           if(this.i6 == this.i7)
                           {
                              continue;
                           }
                           this.i4 = FSM___wrap_setrunelocale;
                           this.i4 = this.i4 + this.i5;
                           this.i5 = this.i6;
                           §§goto(addr269);
                        }
                     }
                  }
               }
               §§goto(addr289);
            case 1:
               this.i0 = mstate.system.fsize(this.i0);
               if(this.i0 >= 0)
               {
                  this.i5 = 0;
                  this.i1 = this.i0;
                  this.i0 = this.i5;
                  addr908:
                  this.i0 = this.i0 ^ 1;
                  this.i0 = this.i0 & 1;
                  if(this.i0 == 0)
                  {
                     addr928:
                     this.i1 = 0;
                     break;
                  }
                  if(uint(this.i1) <= uint(3127))
                  {
                     this.i1 = 79;
                     si32(this.i1,FSM___wrap_setrunelocale);
                     this.i1 = 0;
                     break;
                  }
                  this.i0 = 0;
                  mstate.esp = mstate.esp - 8;
                  si32(this.i0,mstate.esp);
                  si32(this.i1,mstate.esp + 4);
                  state = 3;
                  mstate.esp = mstate.esp - 4;
                  FSM___wrap_setrunelocale.start();
                  return;
               }
               this.i0 = FSM___wrap_setrunelocale;
               mstate.esp = mstate.esp - 20;
               this.i1 = FSM___wrap_setrunelocale;
               this.i5 = 59;
               this.i6 = 2;
               this.i7 = mstate.ebp + -4096;
               si32(this.i7,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               si32(this.i6,mstate.esp + 8);
               si32(this.i1,mstate.esp + 12);
               si32(this.i5,mstate.esp + 16);
               state = 2;
               mstate.esp = mstate.esp - 4;
               FSM___wrap_setrunelocale.start();
               return;
            case 2:
               mstate.esp = mstate.esp + 20;
               this.i1 = 3;
               this.i0 = this.i7;
               log(this.i1,mstate.gworker.stringFromPtr(this.i0));
               si32(this.i6,FSM___wrap_setrunelocale);
               this.i0 = 1;
               §§goto(addr908);
            case 3:
               this.i5 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i0 = this.i5;
               if(this.i5 != 0)
               {
                  this.i6 = 0;
                  si32(this.i6,FSM___wrap_setrunelocale);
                  mstate.esp = mstate.esp - 4;
                  si32(this.i4,mstate.esp);
                  state = 4;
                  mstate.esp = mstate.esp - 4;
                  FSM___wrap_setrunelocale.start();
                  return;
               }
               §§goto(addr928);
            case 4:
               mstate.esp = mstate.esp + 4;
               this.i6 = li32(FSM___wrap_setrunelocale);
               if(this.i6 != 0)
               {
                  this.i1 = 0;
                  mstate.esp = mstate.esp - 8;
                  si32(this.i5,mstate.esp);
                  si32(this.i1,mstate.esp + 4);
                  state = 5;
                  mstate.esp = mstate.esp - 4;
                  FSM___wrap_setrunelocale.start();
                  return;
               }
               this.i6 = 1;
               mstate.esp = mstate.esp - 16;
               si32(this.i5,mstate.esp);
               si32(this.i1,mstate.esp + 4);
               si32(this.i6,mstate.esp + 8);
               si32(this.i4,mstate.esp + 12);
               state = 6;
               mstate.esp = mstate.esp - 4;
               FSM___wrap_setrunelocale.start();
               return;
            case 5:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               si32(this.i6,FSM___wrap_setrunelocale);
               break;
            case 6:
               this.i6 = mstate.eax;
               mstate.esp = mstate.esp + 16;
               if(this.i6 != 1)
               {
                  this.i1 = 0;
                  this.i0 = li32(FSM___wrap_setrunelocale);
                  mstate.esp = mstate.esp - 8;
                  si32(this.i5,mstate.esp);
                  si32(this.i1,mstate.esp + 4);
                  state = 7;
                  mstate.esp = mstate.esp - 4;
                  FSM___wrap_setrunelocale.start();
                  return;
               }
               this.i6 = FSM___wrap_setrunelocale;
               this.i7 = 9;
               this.i8 = this.i5 + this.i1;
               this.i1 = 0;
               this.i9 = this.i5;
               this.i10 = this.i5;
               while(true)
               {
                  this.i11 = this.i6 + this.i1;
                  this.i12 = this.i0 + this.i1;
                  this.i12 = li8(this.i12);
                  this.i11 = li8(this.i11);
                  if(this.i12 == this.i11)
                  {
                     this.i7 = this.i7 + -1;
                     this.i1 = this.i1 + 1;
                     if(this.i7 != 1)
                     {
                        continue;
                     }
                     this.i6 = FSM___wrap_setrunelocale;
                     this.i7 = 4;
                     this.i11 = 0;
                     this.i0 = this.i6;
                     this.i1 = this.i7;
                     log(this.i1,mstate.gworker.stringFromPtr(this.i0));
                     si32(this.i11,this.i10 + 3124);
                     this.i0 = this.i6;
                     this.i1 = this.i7;
                     log(this.i1,mstate.gworker.stringFromPtr(this.i0));
                     si32(this.i11,this.i10 + 3112);
                     this.i0 = this.i6;
                     this.i1 = this.i7;
                     log(this.i1,mstate.gworker.stringFromPtr(this.i0));
                     si32(this.i11,this.i10 + 3116);
                     this.i0 = this.i6;
                     this.i1 = this.i7;
                     log(this.i1,mstate.gworker.stringFromPtr(this.i0));
                     si32(this.i11,this.i10 + 3120);
                     this.i6 = this.i10 + 3120;
                     this.i7 = this.i10 + 3116;
                     this.i12 = this.i10 + 3112;
                     this.i13 = this.i10 + 3124;
                     this.i1 = this.i9;
                     this.i0 = this.i11;
                     while(true)
                     {
                        this.i11 = this.i1;
                        this.i14 = this.i0;
                        this.i15 = FSM___wrap_setrunelocale;
                        this.i16 = 4;
                        this.i17 = 0;
                        this.i0 = this.i15;
                        this.i1 = this.i16;
                        log(this.i1,mstate.gworker.stringFromPtr(this.i0));
                        si32(this.i17,this.i11 + 40);
                        this.i0 = this.i15;
                        this.i1 = this.i16;
                        log(this.i1,mstate.gworker.stringFromPtr(this.i0));
                        si32(this.i17,this.i11 + 1064);
                        this.i0 = this.i15;
                        this.i1 = this.i16;
                        log(this.i1,mstate.gworker.stringFromPtr(this.i0));
                        si32(this.i17,this.i11 + 2088);
                        this.i1 = this.i11 + 4;
                        this.i0 = this.i14 + 1;
                        if(this.i0 != 256)
                        {
                           continue;
                        }
                        break;
                     }
                     this.i11 = li32(this.i12);
                     this.i14 = this.i5 + 3128;
                     this.i1 = this.i11 * 12;
                     this.i15 = this.i14;
                     this.i1 = this.i14 + this.i1;
                     if(uint(this.i1) > uint(this.i8))
                     {
                        this.i1 = 0;
                        mstate.esp = mstate.esp - 8;
                        si32(this.i5,mstate.esp);
                        si32(this.i1,mstate.esp + 4);
                        state = 9;
                        mstate.esp = mstate.esp - 4;
                        FSM___wrap_setrunelocale.start();
                        return;
                     }
                     this.i16 = li32(this.i7);
                     this.i17 = this.i16 + this.i11;
                     this.i1 = this.i17 * 12;
                     this.i1 = this.i15 + this.i1;
                     if(uint(this.i1) > uint(this.i8))
                     {
                        this.i1 = 0;
                        mstate.esp = mstate.esp - 8;
                        si32(this.i5,mstate.esp);
                        si32(this.i1,mstate.esp + 4);
                        state = 10;
                        mstate.esp = mstate.esp - 4;
                        FSM___wrap_setrunelocale.start();
                        return;
                     }
                     this.i1 = li32(this.i6);
                     this.i1 = this.i17 + this.i1;
                     this.i1 = this.i1 * 12;
                     this.i1 = this.i15 + this.i1;
                     if(uint(this.i1) > uint(this.i8))
                     {
                        this.i1 = 0;
                        mstate.esp = mstate.esp - 8;
                        si32(this.i5,mstate.esp);
                        si32(this.i1,mstate.esp + 4);
                        state = 11;
                        mstate.esp = mstate.esp - 4;
                        FSM___wrap_setrunelocale.start();
                        return;
                     }
                     if(this.i11 <= 0)
                     {
                        this.i0 = 0;
                     }
                     else
                     {
                        this.i0 = 0;
                        this.i19 = this.i14;
                        this.i18 = this.i0;
                        while(true)
                        {
                           this.i20 = this.i1;
                           this.i21 = this.i0;
                           this.i22 = FSM___wrap_setrunelocale;
                           this.i23 = 4;
                           this.i24 = 0;
                           this.i0 = this.i22;
                           this.i1 = this.i23;
                           log(this.i1,mstate.gworker.stringFromPtr(this.i0));
                           si32(this.i24,this.i19);
                           this.i0 = this.i22;
                           this.i1 = this.i23;
                           log(this.i1,mstate.gworker.stringFromPtr(this.i0));
                           si32(this.i24,this.i19 + 4);
                           this.i0 = this.i22;
                           this.i1 = this.i23;
                           log(this.i1,mstate.gworker.stringFromPtr(this.i0));
                           si32(this.i24,this.i19 + 8);
                           this.i1 = li32(this.i19 + 4);
                           this.i0 = li32(this.i19);
                           this.i22 = this.i1 - this.i0;
                           this.i22 = this.i22 + 1;
                           this.i23 = this.i22 << 2;
                           this.i21 = this.i22 + this.i21;
                           this.i23 = this.i20 + this.i23;
                           if(uint(this.i23) <= uint(this.i8))
                           {
                              if(this.i22 >= 1)
                              {
                                 this.i1 = this.i1 - this.i0;
                                 this.i0 = this.i1 << 2;
                                 this.i0 = this.i20 + this.i0;
                                 this.i1 = this.i1 + 1;
                                 while(true)
                                 {
                                    this.i20 = this.i0;
                                    this.i22 = this.i1;
                                    this.i1 = FSM___wrap_setrunelocale;
                                    this.i24 = 4;
                                    this.i25 = 0;
                                    this.i0 = this.i1;
                                    this.i1 = this.i24;
                                    log(this.i1,mstate.gworker.stringFromPtr(this.i0));
                                    si32(this.i25,this.i20);
                                    this.i1 = this.i20 + -4;
                                    this.i20 = this.i22 + -1;
                                    if(this.i20 >= 1)
                                    {
                                       this.i0 = this.i1;
                                       this.i1 = this.i20;
                                       continue;
                                    }
                                    break;
                                 }
                              }
                              this.i1 = li32(this.i12);
                              this.i0 = this.i19 + 12;
                              this.i18 = this.i18 + 1;
                              if(this.i1 <= this.i18)
                              {
                                 this.i1 = this.i23;
                                 this.i0 = this.i21;
                              }
                              else
                              {
                                 this.i19 = this.i0;
                                 this.i1 = this.i23;
                                 this.i0 = this.i21;
                                 continue;
                              }
                           }
                           else
                           {
                              break;
                           }
                        }
                        this.i1 = 0;
                        mstate.esp = mstate.esp - 8;
                        si32(this.i5,mstate.esp);
                        si32(this.i1,mstate.esp + 4);
                        state = 22;
                        mstate.esp = mstate.esp - 4;
                        FSM___wrap_setrunelocale.start();
                        return;
                     }
                     this.i19 = this.i1;
                     this.i18 = this.i0;
                     this.i1 = li32(this.i7);
                     if(this.i1 >= 1)
                     {
                        this.i0 = 0;
                        this.i1 = this.i11 * 12;
                        this.i1 = this.i14 + this.i1;
                        while(true)
                        {
                           this.i20 = this.i1;
                           this.i21 = this.i0;
                           this.i22 = FSM___wrap_setrunelocale;
                           this.i23 = 4;
                           this.i24 = 0;
                           this.i0 = this.i22;
                           this.i1 = this.i23;
                           log(this.i1,mstate.gworker.stringFromPtr(this.i0));
                           si32(this.i24,this.i20);
                           this.i0 = this.i22;
                           this.i1 = this.i23;
                           log(this.i1,mstate.gworker.stringFromPtr(this.i0));
                           si32(this.i24,this.i20 + 4);
                           this.i0 = this.i22;
                           this.i1 = this.i23;
                           log(this.i1,mstate.gworker.stringFromPtr(this.i0));
                           si32(this.i24,this.i20 + 8);
                           this.i1 = li32(this.i7);
                           this.i0 = this.i20 + 12;
                           this.i20 = this.i21 + 1;
                           if(this.i1 > this.i20)
                           {
                              this.i1 = this.i0;
                              this.i0 = this.i20;
                              continue;
                           }
                           break;
                        }
                     }
                     this.i0 = li32(this.i6);
                     if(this.i0 > 0)
                     {
                        this.i1 = 0;
                        this.i0 = this.i11 + this.i16;
                        this.i0 = this.i0 * 12;
                        this.i0 = this.i14 + this.i0;
                        while(true)
                        {
                           this.i20 = this.i0;
                           this.i21 = this.i1;
                           this.i22 = FSM___wrap_setrunelocale;
                           this.i23 = 4;
                           this.i24 = 0;
                           this.i0 = this.i22;
                           this.i1 = this.i23;
                           log(this.i1,mstate.gworker.stringFromPtr(this.i0));
                           si32(this.i24,this.i20);
                           this.i0 = this.i22;
                           this.i1 = this.i23;
                           log(this.i1,mstate.gworker.stringFromPtr(this.i0));
                           si32(this.i24,this.i20 + 4);
                           this.i0 = this.i22;
                           this.i1 = this.i23;
                           log(this.i1,mstate.gworker.stringFromPtr(this.i0));
                           si32(this.i24,this.i20 + 8);
                           this.i1 = li32(this.i6);
                           this.i0 = this.i20 + 12;
                           this.i20 = this.i21 + 1;
                           if(this.i1 <= this.i20)
                           {
                              break;
                           }
                           this.i1 = this.i20;
                        }
                        this.i0 = this.i1;
                     }
                     this.i1 = this.i0;
                     this.i0 = li32(this.i13);
                     this.i19 = this.i19 + this.i0;
                     if(uint(this.i19) > uint(this.i8))
                     {
                        this.i1 = 0;
                        mstate.esp = mstate.esp - 8;
                        si32(this.i5,mstate.esp);
                        si32(this.i1,mstate.esp + 4);
                        state = 12;
                        mstate.esp = mstate.esp - 4;
                        FSM___wrap_setrunelocale.start();
                        return;
                     }
                     this.i8 = 0;
                     this.i19 = li32(this.i12);
                     this.i20 = li32(this.i7);
                     this.i19 = this.i20 + this.i19;
                     this.i1 = this.i19 + this.i1;
                     this.i1 = this.i1 << 2;
                     this.i1 = this.i1 + this.i18;
                     this.i1 = this.i1 << 2;
                     this.i1 = this.i0 + this.i1;
                     mstate.esp = mstate.esp - 8;
                     this.i1 = this.i1 + 3156;
                     si32(this.i8,mstate.esp);
                     si32(this.i1,mstate.esp + 4);
                     state = 13;
                     mstate.esp = mstate.esp - 4;
                     FSM___wrap_setrunelocale.start();
                     return;
                  }
                  break;
               }
               this.i1 = 0;
               mstate.esp = mstate.esp - 8;
               si32(this.i5,mstate.esp);
               si32(this.i1,mstate.esp + 4);
               state = 8;
               mstate.esp = mstate.esp - 4;
               FSM___wrap_setrunelocale.start();
               return;
            case 7:
               this.i5 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               si32(this.i0,FSM___wrap_setrunelocale);
               break;
            case 8:
               this.i5 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i5 = 79;
               si32(this.i5,FSM___wrap_setrunelocale);
               break;
            case 9:
               this.i5 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i5 = 79;
               si32(this.i5,FSM___wrap_setrunelocale);
               break;
            case 10:
               this.i5 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i5 = 79;
               si32(this.i5,FSM___wrap_setrunelocale);
               break;
            case 11:
               this.i5 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i5 = 79;
               si32(this.i5,FSM___wrap_setrunelocale);
               break;
            case 12:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i0 = 79;
               si32(this.i0,FSM___wrap_setrunelocale);
               break;
            case 13:
               this.i1 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               if(this.i1 == 0)
               {
                  this.i1 = 0;
                  this.i6 = li32(FSM___wrap_setrunelocale);
                  mstate.esp = mstate.esp - 8;
                  si32(this.i5,mstate.esp);
                  si32(this.i1,mstate.esp + 4);
                  state = 14;
                  mstate.esp = mstate.esp - 4;
                  FSM___wrap_setrunelocale.start();
                  return;
               }
               this.i0 = 82;
               this.i8 = this.i1 + 3156;
               si32(this.i8,this.i1 + 3148);
               this.i8 = 117;
               this.i18 = 110;
               this.i19 = 101;
               this.i20 = 77;
               this.i21 = 97;
               this.i22 = 103;
               this.i23 = 105;
               si8(this.i0,this.i1);
               si8(this.i8,this.i1 + 1);
               si8(this.i18,this.i1 + 2);
               si8(this.i19,this.i1 + 3);
               si8(this.i20,this.i1 + 4);
               si8(this.i21,this.i1 + 5);
               si8(this.i22,this.i1 + 6);
               si8(this.i23,this.i1 + 7);
               this.i0 = this.i1 + 8;
               this.i8 = this.i10 + 8;
               this.i10 = 32;
               memcpy(this.i0,this.i8,this.i10);
               this.i0 = 0;
               si32(this.i0,this.i1 + 48);
               this.i8 = li32(this.i13);
               si32(this.i8,this.i1 + 3152);
               this.i8 = li32(this.i12);
               si32(this.i8,this.i1 + 3124);
               this.i7 = li32(this.i7);
               si32(this.i7,this.i1 + 3132);
               this.i6 = li32(this.i6);
               si32(this.i6,this.i1 + 3140);
               this.i10 = this.i1 + 3140;
               this.i12 = this.i1 + 3132;
               this.i13 = this.i1 + 3124;
               this.i18 = this.i1 + 3152;
               this.i19 = this.i1 + 3148;
               this.i20 = this.i1;
               this.i21 = this.i0;
               while(true)
               {
                  this.i22 = this.i9 + this.i21;
                  this.i23 = li32(this.i22 + 40);
                  this.i24 = this.i20 + this.i21;
                  si32(this.i23,this.i24 + 52);
                  this.i23 = li32(this.i22 + 1064);
                  si32(this.i23,this.i24 + 1076);
                  this.i22 = li32(this.i22 + 2088);
                  si32(this.i22,this.i24 + 2100);
                  this.i21 = this.i21 + 4;
                  this.i0 = this.i0 + 1;
                  if(this.i0 != 256)
                  {
                     continue;
                  }
                  break;
               }
               this.i0 = li32(this.i19);
               this.i9 = this.i7 + this.i6;
               this.i7 = this.i8 + this.i7;
               this.i20 = this.i8 << 4;
               this.i9 = this.i8 + this.i9;
               this.i7 = this.i7 << 4;
               si32(this.i0,this.i1 + 3128);
               this.i20 = this.i0 + this.i20;
               this.i6 = this.i17 + this.i6;
               this.i9 = this.i9 << 4;
               si32(this.i20,this.i1 + 3136);
               this.i7 = this.i0 + this.i7;
               si32(this.i7,this.i1 + 3144);
               this.i7 = this.i0 + this.i9;
               this.i6 = this.i6 * 12;
               si32(this.i7,this.i19);
               this.i7 = this.i1 + 3128;
               this.i9 = this.i1 + 3136;
               this.i17 = this.i1 + 3144;
               this.i6 = this.i15 + this.i6;
               if(this.i8 <= 0)
               {
                  this.i0 = this.i6;
               }
               else
               {
                  this.i8 = 0;
                  this.i15 = this.i14;
                  do
                  {
                     this.i20 = li32(this.i15);
                     si32(this.i20,this.i0);
                     this.i21 = li32(this.i15 + 4);
                     si32(this.i21,this.i0 + 4);
                     this.i22 = li32(this.i15 + 8);
                     si32(this.i22,this.i0 + 8);
                     if(this.i22 == 0)
                     {
                        this.i22 = this.i21 - this.i20;
                        this.i22 = this.i22 + 1;
                        this.i23 = li32(this.i19);
                        this.i24 = this.i22 << 2;
                        si32(this.i23,this.i0 + 12);
                        this.i23 = this.i23 + this.i24;
                        si32(this.i23,this.i19);
                        this.i23 = this.i0 + 12;
                        this.i24 = this.i6 + this.i24;
                        if(this.i22 > 0)
                        {
                           this.i20 = this.i21 - this.i20;
                           this.i21 = this.i20 << 2;
                           this.i20 = this.i20 + 1;
                           while(true)
                           {
                              this.i22 = this.i6 + this.i21;
                              this.i25 = li32(this.i23);
                              this.i22 = li32(this.i22);
                              this.i25 = this.i25 + this.i21;
                              si32(this.i22,this.i25);
                              this.i21 = this.i21 + -4;
                              this.i20 = this.i20 + -1;
                              if(this.i20 >= 1)
                              {
                                 continue;
                              }
                              break;
                           }
                        }
                        this.i6 = this.i24;
                     }
                     else
                     {
                        this.i20 = 0;
                        si32(this.i20,this.i0 + 12);
                     }
                     this.i20 = li32(this.i13);
                     this.i0 = this.i0 + 16;
                     this.i15 = this.i15 + 12;
                     this.i8 = this.i8 + 1;
                  }
                  while(this.i20 > this.i8);
                  
                  this.i0 = this.i6;
               }
               this.i6 = li32(this.i9);
               this.i8 = li32(this.i12);
               if(this.i8 >= 1)
               {
                  this.i8 = 0;
                  this.i15 = this.i11 * 12;
                  this.i15 = this.i14 + this.i15;
                  while(true)
                  {
                     this.i20 = li32(this.i15);
                     si32(this.i20,this.i6);
                     this.i20 = li32(this.i15 + 4);
                     si32(this.i20,this.i6 + 4);
                     this.i20 = li32(this.i15 + 8);
                     si32(this.i20,this.i6 + 8);
                     this.i20 = li32(this.i12);
                     this.i6 = this.i6 + 16;
                     this.i15 = this.i15 + 12;
                     this.i8 = this.i8 + 1;
                     if(this.i20 > this.i8)
                     {
                        continue;
                     }
                     break;
                  }
               }
               this.i6 = li32(this.i17);
               this.i8 = li32(this.i10);
               if(this.i8 >= 1)
               {
                  this.i8 = 0;
                  this.i11 = this.i11 + this.i16;
                  this.i11 = this.i11 * 12;
                  this.i11 = this.i14 + this.i11;
                  while(true)
                  {
                     this.i14 = li32(this.i11);
                     si32(this.i14,this.i6);
                     this.i14 = li32(this.i11 + 4);
                     si32(this.i14,this.i6 + 4);
                     this.i14 = li32(this.i11 + 8);
                     si32(this.i14,this.i6 + 8);
                     this.i14 = li32(this.i10);
                     this.i6 = this.i6 + 16;
                     this.i11 = this.i11 + 12;
                     this.i8 = this.i8 + 1;
                     if(this.i14 > this.i8)
                     {
                        continue;
                     }
                     break;
                  }
               }
               this.i6 = 0;
               this.i8 = li32(this.i18);
               this.i11 = li32(this.i19);
               memcpy(this.i11,this.i0,this.i8);
               mstate.esp = mstate.esp - 8;
               si32(this.i5,mstate.esp);
               si32(this.i6,mstate.esp + 4);
               state = 15;
               mstate.esp = mstate.esp - 4;
               FSM___wrap_setrunelocale.start();
               return;
            case 14:
               this.i5 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               si32(this.i6,FSM___wrap_setrunelocale);
               break;
            case 15:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i0 = li32(this.i18);
               if(this.i0 == 0)
               {
                  this.i0 = 0;
                  si32(this.i0,this.i19);
               }
               this.i0 = li32(this.i13);
               if(this.i0 == 0)
               {
                  this.i0 = 0;
                  si32(this.i0,this.i7);
               }
               this.i0 = li32(this.i12);
               if(this.i0 == 0)
               {
                  this.i0 = 0;
                  si32(this.i0,this.i9);
               }
               this.i0 = li32(this.i10);
               if(this.i0 != 0)
               {
                  break;
               }
               this.i0 = 0;
               si32(this.i0,this.i17);
               break;
            case 16:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 4;
               this.i2 = this.i2 == 0?79:int(this.i2);
               addr5325:
               this.i0 = this.i2;
               this.i1 = -1;
               si32(this.i0,FSM___wrap_setrunelocale);
               mstate.eax = this.i1;
               §§goto(addr294);
            case 17:
               this.i4 = mstate.eax;
               mstate.esp = mstate.esp + 4;
               si32(this.i5,FSM___wrap_setrunelocale);
               si32(this.i5,FSM___wrap_setrunelocale);
               this.i4 = FSM___wrap_setrunelocale;
               si32(this.i4,FSM___wrap_setrunelocale);
               si32(this.i5,FSM___wrap_setrunelocale);
               this.i4 = FSM___wrap_setrunelocale;
               si32(this.i4,FSM___wrap_setrunelocale);
               si32(this.i5,this.i0 + 44);
               si32(this.i5,this.i0 + 40);
               this.i4 = li8(this.i0 + 8);
               if(this.i4 != 78)
               {
                  this.i5 = FSM___wrap_setrunelocale;
                  this.i6 = this.i4;
               }
               else
               {
                  this.i5 = FSM___wrap_setrunelocale;
                  this.i6 = 0;
                  this.i7 = this.i4;
                  while(true)
                  {
                     this.i8 = this.i5 + this.i6;
                     this.i8 = this.i8 + 1;
                     this.i7 = this.i7 & 255;
                     if(this.i7 == 0)
                     {
                        break;
                     }
                     this.i7 = this.i1 + this.i6;
                     this.i7 = li8(this.i7 + 9);
                     this.i8 = li8(this.i8);
                     this.i6 = this.i6 + 1;
                     if(this.i7 == this.i8)
                     {
                        continue;
                     }
                     this.i5 = FSM___wrap_setrunelocale;
                     this.i5 = this.i5 + this.i6;
                     this.i6 = this.i7;
                  }
                  this.i2 = -1;
                  this.i1 = 0;
                  mstate.esp = mstate.esp - 8;
                  si32(this.i0,mstate.esp);
                  si32(this.i1,mstate.esp + 4);
                  state = 18;
                  mstate.esp = mstate.esp - 4;
                  FSM___wrap_setrunelocale.start();
                  return;
               }
               this.i5 = li8(this.i5);
               this.i6 = this.i6 & 255;
               if(this.i6 != this.i5)
               {
                  this.i5 = this.i4 & 255;
                  if(this.i5 != 85)
                  {
                     this.i5 = FSM___wrap_setrunelocale;
                     this.i6 = this.i4;
                  }
                  else
                  {
                     this.i5 = FSM___wrap_setrunelocale;
                     this.i6 = 0;
                     this.i7 = this.i4;
                     while(true)
                     {
                        this.i8 = this.i5 + this.i6;
                        this.i8 = this.i8 + 1;
                        this.i7 = this.i7 & 255;
                        if(this.i7 != 0)
                        {
                           this.i7 = this.i1 + this.i6;
                           this.i7 = li8(this.i7 + 9);
                           this.i8 = li8(this.i8);
                           this.i6 = this.i6 + 1;
                           if(this.i7 == this.i8)
                           {
                              continue;
                           }
                           this.i5 = FSM___wrap_setrunelocale;
                           this.i5 = this.i5 + this.i6;
                           this.i6 = this.i7;
                        }
                        break;
                     }
                     this.i1 = FSM___wrap_setrunelocale;
                     si32(this.i1,FSM___wrap_setrunelocale);
                     this.i1 = FSM___wrap_setrunelocale;
                     si32(this.i1,FSM___wrap_setrunelocale);
                     this.i1 = FSM___wrap_setrunelocale;
                     si32(this.i1,FSM___wrap_setrunelocale);
                     this.i1 = FSM___wrap_setrunelocale;
                     si32(this.i1,FSM___wrap_setrunelocale);
                     this.i1 = FSM___wrap_setrunelocale;
                     si32(this.i1,FSM___wrap_setrunelocale);
                     si32(this.i0,FSM___wrap_setrunelocale);
                     this.i0 = 6;
                     si32(this.i0,FSM___wrap_setrunelocale);
                     this.i0 = 0;
                     this.i1 = li32(FSM___wrap_setrunelocale);
                     this.i4 = this.i1;
                     if(this.i1 != 0)
                     {
                        this.i5 = li8(this.i4 + 8);
                        if(this.i5 != 69)
                        {
                           this.i1 = FSM___wrap_setrunelocale;
                        }
                        else
                        {
                           this.i6 = FSM___wrap_setrunelocale;
                           this.i7 = 0;
                           while(true)
                           {
                              this.i8 = this.i6 + this.i7;
                              this.i8 = this.i8 + 1;
                              this.i5 = this.i5 & 255;
                              if(this.i5 != 0)
                              {
                                 this.i5 = this.i1 + this.i7;
                                 this.i5 = li8(this.i5 + 9);
                                 this.i8 = li8(this.i8);
                                 this.i7 = this.i7 + 1;
                                 if(this.i5 == this.i8)
                                 {
                                    continue;
                                 }
                                 this.i1 = FSM___wrap_setrunelocale;
                                 this.i1 = this.i1 + this.i7;
                              }
                              break;
                           }
                           this.i1 = 0;
                           this.i5 = li32(this.i4 + 3148);
                           mstate.esp = mstate.esp - 8;
                           si32(this.i5,mstate.esp);
                           si32(this.i1,mstate.esp + 4);
                           state = 19;
                           mstate.esp = mstate.esp - 4;
                           FSM___wrap_setrunelocale.start();
                           return;
                        }
                        this.i1 = li8(this.i1);
                        this.i5 = this.i5 & 255;
                        if(this.i5 == this.i1)
                        {
                           §§goto(addr5089);
                        }
                        else
                        {
                           addr5140:
                           this.i1 = 0;
                           mstate.esp = mstate.esp - 8;
                           si32(this.i4,mstate.esp);
                           si32(this.i1,mstate.esp + 4);
                           state = 20;
                           mstate.esp = mstate.esp - 4;
                           FSM___wrap_setrunelocale.start();
                           return;
                        }
                     }
                     else
                     {
                        addr5184:
                        this.i1 = li32(FSM___wrap_setrunelocale);
                        si32(this.i1,FSM___wrap_setrunelocale);
                        this.i1 = li32(FSM___wrap_setrunelocale);
                        si32(this.i1,FSM___wrap_setrunelocale);
                        this.i1 = li32(FSM___wrap_setrunelocale);
                        si32(this.i1,FSM___wrap_setrunelocale);
                        this.i1 = li32(FSM___wrap_setrunelocale);
                        si32(this.i1,FSM___wrap_setrunelocale);
                        this.i1 = li32(FSM___wrap_setrunelocale);
                        si32(this.i1,FSM___wrap_setrunelocale);
                        this.i1 = li32(FSM___wrap_setrunelocale);
                        si32(this.i1,FSM___wrap_setrunelocale);
                        this.i1 = li32(FSM___wrap_setrunelocale);
                        si32(this.i1,FSM___wrap_setrunelocale);
                        this.i2 = li8(this.i2);
                        si8(this.i2,FSM___wrap_setrunelocale);
                        if(this.i2 != 0)
                        {
                           this.i2 = FSM___wrap_setrunelocale;
                           this.i1 = 1;
                           while(true)
                           {
                              this.i4 = this.i3 + this.i1;
                              this.i4 = li8(this.i4);
                              this.i5 = this.i2 + this.i1;
                              si8(this.i4,this.i5);
                              this.i1 = this.i1 + 1;
                              if(this.i4 != 0)
                              {
                                 continue;
                              }
                              break;
                           }
                        }
                        if(this.i0 != 0)
                        {
                           this.i2 = this.i0;
                           §§goto(addr5325);
                        }
                        else
                        {
                           addr288:
                           §§goto(addr289);
                        }
                        §§goto(addr294);
                     }
                  }
                  this.i5 = li8(this.i5);
                  this.i6 = this.i6 & 255;
                  if(this.i6 == this.i5)
                  {
                     §§goto(addr4160);
                  }
                  else
                  {
                     this.i5 = this.i4 & 255;
                     if(this.i5 != 69)
                     {
                        this.i5 = FSM___wrap_setrunelocale;
                        this.i6 = this.i4;
                     }
                     else
                     {
                        this.i5 = FSM___wrap_setrunelocale;
                        this.i6 = 0;
                        this.i7 = this.i4;
                        while(true)
                        {
                           this.i8 = this.i5 + this.i6;
                           this.i8 = this.i8 + 1;
                           this.i7 = this.i7 & 255;
                           if(this.i7 != 0)
                           {
                              this.i7 = this.i1 + this.i6;
                              this.i7 = li8(this.i7 + 9);
                              this.i8 = li8(this.i8);
                              this.i6 = this.i6 + 1;
                              if(this.i7 == this.i8)
                              {
                                 continue;
                              }
                              this.i5 = FSM___wrap_setrunelocale;
                              this.i5 = this.i5 + this.i6;
                              this.i6 = this.i7;
                           }
                           break;
                        }
                     }
                     this.i5 = li8(this.i5);
                     this.i6 = this.i6 & 255;
                     if(this.i6 != this.i5)
                     {
                        this.i5 = this.i4 & 255;
                        if(this.i5 != 71)
                        {
                           this.i5 = FSM___wrap_setrunelocale;
                           this.i6 = this.i4;
                           addr4449:
                           this.i5 = li8(this.i5);
                           this.i6 = this.i6 & 255;
                           if(this.i6 != this.i5)
                           {
                              this.i5 = this.i4 & 255;
                              if(this.i5 != 71)
                              {
                                 this.i5 = FSM___wrap_setrunelocale;
                                 this.i6 = this.i4;
                                 addr4571:
                                 this.i5 = li8(this.i5);
                                 this.i6 = this.i6 & 255;
                                 if(this.i6 != this.i5)
                                 {
                                    this.i5 = this.i4 & 255;
                                    if(this.i5 != 71)
                                    {
                                       this.i5 = FSM___wrap_setrunelocale;
                                       this.i6 = this.i4;
                                       addr4693:
                                       this.i5 = li8(this.i5);
                                       this.i6 = this.i6 & 255;
                                       if(this.i6 != this.i5)
                                       {
                                          this.i5 = this.i4 & 255;
                                          if(this.i5 != 66)
                                          {
                                             this.i5 = FSM___wrap_setrunelocale;
                                             this.i6 = this.i4;
                                             addr4815:
                                             this.i5 = li8(this.i5);
                                             this.i6 = this.i6 & 255;
                                             if(this.i6 != this.i5)
                                             {
                                                this.i5 = this.i4 & 255;
                                                if(this.i5 != 77)
                                                {
                                                   this.i1 = FSM___wrap_setrunelocale;
                                                }
                                                else
                                                {
                                                   this.i5 = FSM___wrap_setrunelocale;
                                                   this.i6 = 0;
                                                   while(true)
                                                   {
                                                      this.i7 = this.i5 + this.i6;
                                                      this.i7 = this.i7 + 1;
                                                      this.i4 = this.i4 & 255;
                                                      if(this.i4 != 0)
                                                      {
                                                         this.i4 = this.i1 + this.i6;
                                                         this.i4 = li8(this.i4 + 9);
                                                         this.i7 = li8(this.i7);
                                                         this.i6 = this.i6 + 1;
                                                         if(this.i4 == this.i7)
                                                         {
                                                            continue;
                                                         }
                                                         this.i1 = FSM___wrap_setrunelocale;
                                                         this.i1 = this.i1 + this.i6;
                                                      }
                                                      break;
                                                   }
                                                   this.i1 = -1;
                                                   if(this.i1 != 0)
                                                   {
                                                      this.i2 = this.i1;
                                                   }
                                                   else
                                                   {
                                                      this.i0 = this.i1;
                                                   }
                                                }
                                                this.i1 = li8(this.i1);
                                                this.i4 = this.i4 & 255;
                                                if(this.i4 != this.i1)
                                                {
                                                   this.i1 = 79;
                                                }
                                                else
                                                {
                                                   §§goto(addr4946);
                                                }
                                                §§goto(addr4949);
                                             }
                                             §§goto(addr3927);
                                          }
                                          else
                                          {
                                             this.i5 = FSM___wrap_setrunelocale;
                                             this.i6 = 0;
                                             this.i7 = this.i4;
                                             while(true)
                                             {
                                                this.i8 = this.i5 + this.i6;
                                                this.i8 = this.i8 + 1;
                                                this.i7 = this.i7 & 255;
                                                if(this.i7 != 0)
                                                {
                                                   this.i7 = this.i1 + this.i6;
                                                   this.i7 = li8(this.i7 + 9);
                                                   this.i8 = li8(this.i8);
                                                   this.i6 = this.i6 + 1;
                                                   if(this.i7 == this.i8)
                                                   {
                                                      continue;
                                                   }
                                                   this.i5 = FSM___wrap_setrunelocale;
                                                   this.i5 = this.i5 + this.i6;
                                                   this.i6 = this.i7;
                                                   §§goto(addr4815);
                                                }
                                             }
                                          }
                                       }
                                    }
                                    else
                                    {
                                       this.i5 = FSM___wrap_setrunelocale;
                                       this.i6 = 0;
                                       this.i7 = this.i4;
                                       while(true)
                                       {
                                          this.i8 = this.i5 + this.i6;
                                          this.i8 = this.i8 + 1;
                                          this.i7 = this.i7 & 255;
                                          if(this.i7 != 0)
                                          {
                                             this.i7 = this.i1 + this.i6;
                                             this.i7 = li8(this.i7 + 9);
                                             this.i8 = li8(this.i8);
                                             this.i6 = this.i6 + 1;
                                             if(this.i7 == this.i8)
                                             {
                                                continue;
                                             }
                                             this.i5 = FSM___wrap_setrunelocale;
                                             this.i5 = this.i5 + this.i6;
                                             this.i6 = this.i7;
                                             §§goto(addr4693);
                                          }
                                       }
                                    }
                                 }
                              }
                              else
                              {
                                 this.i5 = FSM___wrap_setrunelocale;
                                 this.i6 = 0;
                                 this.i7 = this.i4;
                                 while(true)
                                 {
                                    this.i8 = this.i5 + this.i6;
                                    this.i8 = this.i8 + 1;
                                    this.i7 = this.i7 & 255;
                                    if(this.i7 != 0)
                                    {
                                       this.i7 = this.i1 + this.i6;
                                       this.i7 = li8(this.i7 + 9);
                                       this.i8 = li8(this.i8);
                                       this.i6 = this.i6 + 1;
                                       if(this.i7 == this.i8)
                                       {
                                          continue;
                                       }
                                       this.i5 = FSM___wrap_setrunelocale;
                                       this.i5 = this.i5 + this.i6;
                                       this.i6 = this.i7;
                                       §§goto(addr4571);
                                    }
                                 }
                              }
                           }
                        }
                        else
                        {
                           this.i5 = FSM___wrap_setrunelocale;
                           this.i6 = 0;
                           this.i7 = this.i4;
                           while(true)
                           {
                              this.i8 = this.i5 + this.i6;
                              this.i8 = this.i8 + 1;
                              this.i7 = this.i7 & 255;
                              if(this.i7 != 0)
                              {
                                 this.i7 = this.i1 + this.i6;
                                 this.i7 = li8(this.i7 + 9);
                                 this.i8 = li8(this.i8);
                                 this.i6 = this.i6 + 1;
                                 if(this.i7 == this.i8)
                                 {
                                    continue;
                                 }
                                 this.i5 = FSM___wrap_setrunelocale;
                                 this.i5 = this.i5 + this.i6;
                                 this.i6 = this.i7;
                                 §§goto(addr4449);
                              }
                           }
                        }
                     }
                  }
                  §§goto(addr4963);
               }
               §§goto(addr3922);
            case 18:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               addr730:
               if(this.i2 != 0)
               {
                  §§goto(addr5325);
               }
               else
               {
                  §§goto(addr288);
               }
               §§goto(addr294);
            case 19:
               this.i1 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               §§goto(addr5140);
            case 20:
               this.i1 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               §§goto(addr5184);
            case 21:
               this.i4 = mstate.eax;
               mstate.esp = mstate.esp + 16;
               if(this.i4 == 0)
               {
                  this.i2 = li32(FSM___wrap_setrunelocale);
                  if(this.i2 != 0)
                  {
                     §§goto(addr5325);
                  }
                  else
                  {
                     this.i2 = 2;
                     §§goto(addr730);
                  }
                  §§goto(addr294);
               }
               else
               {
                  this.i0 = li16(this.i4 + 14);
                  this.i1 = this.i0 << 16;
                  this.i1 = this.i1 >> 16;
                  if(this.i1 <= 1)
                  {
                     this.i0 = 0;
                  }
                  else
                  {
                     this.i0 = this.i0 << 16;
                     this.i0 = this.i0 >> 16;
                     state = 1;
                  }
                  §§goto(addr908);
               }
            case 22:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i0 = 79;
               si32(this.i0,FSM___wrap_setrunelocale);
         }
         this.i0 = this.i1;
         this.i1 = this.i0;
         if(this.i0 == 0)
         {
            this.i2 = li32(FSM___wrap_setrunelocale);
            mstate.esp = mstate.esp - 4;
            si32(this.i4,mstate.esp);
            state = 16;
            mstate.esp = mstate.esp - 4;
            FSM___wrap_setrunelocale.start();
            return;
         }
         this.i5 = 0;
         mstate.esp = mstate.esp - 4;
         si32(this.i4,mstate.esp);
         state = 17;
         mstate.esp = mstate.esp - 4;
         FSM___wrap_setrunelocale.start();
      }
   }
}
