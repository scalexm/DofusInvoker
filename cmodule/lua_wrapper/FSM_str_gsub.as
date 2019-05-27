package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.lf64;
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.li8;
   import avm2.intrinsics.memory.sf64;
   import avm2.intrinsics.memory.si32;
   import avm2.intrinsics.memory.si8;
   
   public final class FSM_str_gsub extends Machine
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
      
      public function FSM_str_gsub()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM_str_gsub = null;
         _loc1_ = new FSM_str_gsub();
         FSM_str_gsub.gworker = _loc1_;
      }
      
      override public final function work() : void
      {
         switch(state)
         {
            case 0:
               mstate.esp = mstate.esp - 4;
               si32(mstate.ebp,mstate.esp);
               mstate.ebp = mstate.esp;
               mstate.esp = mstate.esp - 1332;
               this.i0 = mstate.ebp + -4;
               mstate.esp = mstate.esp - 12;
               this.i1 = li32(mstate.ebp + 8);
               this.i2 = 1;
               si32(this.i1,mstate.esp);
               si32(this.i2,mstate.esp + 4);
               si32(this.i0,mstate.esp + 8);
               state = 1;
               mstate.esp = mstate.esp - 4;
               FSM_str_gsub.start();
               return;
            case 1:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               mstate.esp = mstate.esp - 12;
               this.i2 = 2;
               this.i3 = 0;
               si32(this.i1,mstate.esp);
               si32(this.i2,mstate.esp + 4);
               si32(this.i3,mstate.esp + 8);
               state = 2;
               mstate.esp = mstate.esp - 4;
               FSM_str_gsub.start();
               return;
            case 2:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               mstate.esp = mstate.esp - 8;
               this.i3 = 3;
               si32(this.i1,mstate.esp);
               si32(this.i3,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_str_gsub.start();
            case 3:
               this.i3 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i4 = FSM_str_gsub;
               if(this.i3 == this.i4)
               {
                  this.i3 = -1;
               }
               else
               {
                  this.i3 = li32(this.i3 + 8);
               }
               this.i4 = 4;
               this.i5 = li32(mstate.ebp + -4);
               mstate.esp = mstate.esp - 8;
               si32(this.i1,mstate.esp);
               si32(this.i4,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_str_gsub.start();
            case 4:
               this.i4 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i5 = this.i5 + 1;
               this.i6 = FSM_str_gsub;
               if(this.i4 != this.i6)
               {
                  this.i4 = li32(this.i4 + 8);
                  if(this.i4 >= 1)
                  {
                     this.i4 = 4;
                     mstate.esp = mstate.esp - 8;
                     si32(this.i1,mstate.esp);
                     si32(this.i4,mstate.esp + 4);
                     state = 5;
                     mstate.esp = mstate.esp - 4;
                     FSM_str_gsub.start();
                     return;
                  }
               }
               this.i4 = this.i5;
               addr333:
               this.i5 = li8(this.i2);
               if(this.i5 != 94)
               {
                  this.i5 = 1;
               }
               else
               {
                  this.i5 = 0;
                  this.i2 = this.i2 + 1;
               }
               this.i6 = this.i3 + -3;
               this.i3 = this.i3 + -5;
               addr437:
               if(uint(this.i3) >= uint(2))
               {
                  if(uint(this.i6) >= uint(2))
                  {
                     this.i3 = FSM_str_gsub;
                     mstate.esp = mstate.esp - 12;
                     this.i6 = 3;
                     si32(this.i1,mstate.esp);
                     si32(this.i6,mstate.esp + 4);
                     si32(this.i3,mstate.esp + 8);
                     state = 6;
                     mstate.esp = mstate.esp - 4;
                     FSM_str_gsub.start();
                     return;
                  }
               }
               this.i3 = mstate.ebp + -1328;
               si32(this.i1,mstate.ebp + -1320);
               this.i6 = this.i3 + 12;
               si32(this.i6,mstate.ebp + -1328);
               this.i6 = 0;
               si32(this.i6,mstate.ebp + -1324);
               si32(this.i1,mstate.ebp + -280);
               si32(this.i0,mstate.ebp + -288);
               this.i6 = li32(mstate.ebp + -4);
               this.i7 = mstate.ebp + -288;
               this.i6 = this.i0 + this.i6;
               si32(this.i6,mstate.ebp + -284);
               this.i6 = this.i7 + 4;
               this.i7 = this.i7 + 8;
               this.i8 = this.i3 + 4;
               this.i9 = this.i3 + 8;
               if(this.i4 <= 0)
               {
                  this.i2 = 0;
                  addr2620:
                  this.i3 = mstate.ebp + -1328;
                  this.i4 = li32(this.i6);
                  mstate.esp = mstate.esp - 12;
                  this.i4 = this.i4 - this.i0;
                  si32(this.i3,mstate.esp);
                  si32(this.i0,mstate.esp + 4);
                  si32(this.i4,mstate.esp + 8);
                  state = 34;
                  mstate.esp = mstate.esp - 4;
                  FSM_str_gsub.start();
                  return;
               }
               this.i10 = mstate.ebp + -1328;
               this.i11 = mstate.ebp + -288;
               this.i10 = this.i10 + 1036;
               this.i12 = 0;
               this.i11 = this.i11 + 12;
               break;
            case 5:
               this.i4 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               §§goto(addr333);
            case 6:
               mstate.esp = mstate.esp + 12;
               §§goto(addr437);
            case 7:
               this.i13 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               if(this.i13 == 0)
               {
                  addr2422:
                  addr2437:
                  if(this.i13 != 0)
                  {
                     if(uint(this.i13) > uint(this.i0))
                     {
                        this.i0 = this.i13;
                     }
                     addr2587:
                     this.i13 = this.i12 < this.i4?1:0;
                     this.i13 = this.i13 & this.i5;
                     this.i13 = this.i13 & 1;
                     if(this.i13 == 0)
                     {
                        this.i2 = this.i12;
                        §§goto(addr2620);
                     }
                     else
                     {
                        break;
                     }
                  }
                  this.i13 = li32(this.i6);
                  if(uint(this.i13) <= uint(this.i0))
                  {
                     this.i2 = this.i12;
                  }
                  else
                  {
                     this.i13 = li32(this.i3);
                     if(uint(this.i13) >= uint(this.i10))
                     {
                        this.i13 = mstate.ebp + -1328;
                        mstate.esp = mstate.esp - 4;
                        si32(this.i13,mstate.esp);
                        state = 32;
                        mstate.esp = mstate.esp - 4;
                        FSM_str_gsub.start();
                        return;
                     }
                     addr2553:
                     this.i13 = li32(this.i3);
                     this.i14 = li8(this.i0);
                     si8(this.i14,this.i13);
                     this.i13 = this.i13 + 1;
                     si32(this.i13,this.i3);
                     this.i0 = this.i0 + 1;
                     §§goto(addr2587);
                  }
                  §§goto(addr2620);
               }
               else
               {
                  this.i14 = 3;
                  this.i15 = li32(this.i7);
                  mstate.esp = mstate.esp - 8;
                  si32(this.i15,mstate.esp);
                  si32(this.i14,mstate.esp + 4);
                  mstate.esp = mstate.esp - 4;
                  FSM_str_gsub.start();
               }
            case 8:
               this.i14 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i12 = this.i12 + 1;
               this.i16 = FSM_str_gsub;
               if(this.i14 == this.i16)
               {
                  this.i14 = -1;
               }
               else
               {
                  this.i14 = li32(this.i14 + 8);
               }
               if(this.i14 != 6)
               {
                  if(this.i14 != 5)
                  {
                     this.i14 = this.i14 + -3;
                     if(uint(this.i14) <= uint(1))
                     {
                        this.i15 = mstate.ebp + -1332;
                        this.i14 = li32(this.i7);
                        mstate.esp = mstate.esp - 12;
                        this.i16 = 3;
                        si32(this.i14,mstate.esp);
                        si32(this.i16,mstate.esp + 4);
                        si32(this.i15,mstate.esp + 8);
                        state = 9;
                        mstate.esp = mstate.esp - 4;
                        FSM_str_gsub.start();
                        return;
                     }
                     addr1994:
                     this.i14 = -1;
                     mstate.esp = mstate.esp - 8;
                     si32(this.i15,mstate.esp);
                     si32(this.i14,mstate.esp + 4);
                     mstate.esp = mstate.esp - 4;
                     FSM_str_gsub.start();
                  }
                  else
                  {
                     this.i14 = 0;
                     mstate.esp = mstate.esp - 16;
                     this.i16 = mstate.ebp + -288;
                     si32(this.i16,mstate.esp);
                     si32(this.i14,mstate.esp + 4);
                     si32(this.i0,mstate.esp + 8);
                     si32(this.i13,mstate.esp + 12);
                     state = 23;
                     mstate.esp = mstate.esp - 4;
                     FSM_str_gsub.start();
                     return;
                  }
               }
               else
               {
                  this.i14 = 3;
                  mstate.esp = mstate.esp - 8;
                  si32(this.i15,mstate.esp);
                  si32(this.i14,mstate.esp + 4);
                  mstate.esp = mstate.esp - 4;
                  FSM_str_gsub.start();
               }
            case 9:
               this.i15 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               this.i14 = li32(mstate.ebp + -1332);
               if(this.i14 != 0)
               {
                  this.i14 = 0;
                  this.i16 = this.i13 - this.i0;
                  loop0:
                  while(true)
                  {
                     this.i17 = this.i15 + this.i14;
                     this.i18 = li8(this.i17);
                     if(this.i18 != 37)
                     {
                        this.i18 = li32(this.i3);
                        if(uint(this.i18) >= uint(this.i10))
                        {
                           this.i18 = mstate.ebp + -1328;
                           mstate.esp = mstate.esp - 4;
                           si32(this.i18,mstate.esp);
                           state = 10;
                           mstate.esp = mstate.esp - 4;
                           FSM_str_gsub.start();
                           return;
                        }
                        addr946:
                        while(true)
                        {
                           this.i18 = li32(this.i3);
                           this.i17 = li8(this.i17);
                           si8(this.i17,this.i18);
                           this.i17 = this.i18 + 1;
                           si32(this.i17,this.i3);
                           this.i17 = li32(mstate.ebp + -1332);
                           this.i14 = this.i14 + 1;
                           if(uint(this.i14) >= uint(this.i17))
                           {
                              break loop0;
                           }
                        }
                     }
                     else
                     {
                        this.i17 = FSM_str_gsub;
                        this.i18 = this.i14 + this.i15;
                        this.i19 = li8(this.i18 + 1);
                        this.i20 = this.i19 << 2;
                        this.i17 = this.i17 + this.i20;
                        this.i17 = li32(this.i17 + 52);
                        this.i18 = this.i18 + 1;
                        this.i17 = this.i17 & 1024;
                        if(this.i17 == 0)
                        {
                           this.i19 = li32(this.i3);
                           if(uint(this.i19) >= uint(this.i10))
                           {
                              this.i19 = mstate.ebp + -1328;
                              mstate.esp = mstate.esp - 4;
                              si32(this.i19,mstate.esp);
                              state = 12;
                              mstate.esp = mstate.esp - 4;
                              FSM_str_gsub.start();
                              return;
                           }
                           addr1148:
                           while(true)
                           {
                              this.i19 = li32(this.i3);
                              this.i17 = li8(this.i18);
                              si8(this.i17,this.i19);
                              this.i19 = this.i19 + 1;
                              si32(this.i19,this.i3);
                              this.i19 = li32(mstate.ebp + -1332);
                              this.i14 = this.i14 + 2;
                              if(uint(this.i14) >= uint(this.i19))
                              {
                                 break loop0;
                              }
                           }
                        }
                        else
                        {
                           this.i14 = this.i14 + 2;
                           this.i17 = this.i19 & 255;
                           if(this.i17 == 48)
                           {
                              this.i19 = mstate.ebp + -1328;
                              mstate.esp = mstate.esp - 12;
                              si32(this.i19,mstate.esp);
                              si32(this.i0,mstate.esp + 4);
                              si32(this.i16,mstate.esp + 8);
                              state = 14;
                              mstate.esp = mstate.esp - 4;
                              FSM_str_gsub.start();
                              return;
                           }
                           this.i17 = mstate.ebp + -288;
                           this.i18 = this.i19 << 24;
                           this.i18 = this.i18 >> 24;
                           mstate.esp = mstate.esp - 16;
                           this.i18 = this.i18 + -49;
                           si32(this.i17,mstate.esp);
                           si32(this.i18,mstate.esp + 4);
                           si32(this.i0,mstate.esp + 8);
                           si32(this.i13,mstate.esp + 12);
                           state = 15;
                           mstate.esp = mstate.esp - 4;
                           FSM_str_gsub.start();
                           return;
                        }
                     }
                     addr832:
                     while(true)
                     {
                        continue loop0;
                     }
                  }
               }
               §§goto(addr2422);
            case 10:
               this.i18 = mstate.eax;
               mstate.esp = mstate.esp + 4;
               if(this.i18 != 0)
               {
                  this.i18 = mstate.ebp + -1328;
                  mstate.esp = mstate.esp - 4;
                  si32(this.i18,mstate.esp);
                  state = 11;
                  mstate.esp = mstate.esp - 4;
                  FSM_str_gsub.start();
                  return;
               }
               §§goto(addr946);
            case 11:
               mstate.esp = mstate.esp + 4;
               §§goto(addr946);
            case 12:
               this.i19 = mstate.eax;
               mstate.esp = mstate.esp + 4;
               if(this.i19 != 0)
               {
                  this.i19 = mstate.ebp + -1328;
                  mstate.esp = mstate.esp - 4;
                  si32(this.i19,mstate.esp);
                  state = 13;
                  mstate.esp = mstate.esp - 4;
                  FSM_str_gsub.start();
                  return;
               }
               §§goto(addr1148);
            case 13:
               mstate.esp = mstate.esp + 4;
               §§goto(addr1148);
            case 14:
               mstate.esp = mstate.esp + 12;
               this.i19 = li32(mstate.ebp + -1332);
               if(uint(this.i14) < uint(this.i19))
               {
                  §§goto(addr832);
               }
               §§goto(addr819);
            case 15:
               mstate.esp = mstate.esp + 16;
               mstate.esp = mstate.esp - 4;
               this.i17 = mstate.ebp + -1328;
               si32(this.i17,mstate.esp);
               state = 16;
               mstate.esp = mstate.esp - 4;
               FSM_str_gsub.start();
               return;
            case 16:
               mstate.esp = mstate.esp + 4;
               this.i17 = li32(mstate.ebp + -1332);
               if(uint(this.i14) < uint(this.i17))
               {
                  §§goto(addr832);
               }
               §§goto(addr819);
            case 17:
               this.i14 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i16 = li32(this.i15 + 8);
               this.f0 = lf64(this.i14);
               sf64(this.f0,this.i16);
               this.i14 = li32(this.i14 + 8);
               si32(this.i14,this.i16 + 8);
               this.i14 = li32(this.i15 + 8);
               this.i14 = this.i14 + 12;
               si32(this.i14,this.i15 + 8);
               mstate.esp = mstate.esp - 12;
               this.i14 = mstate.ebp + -288;
               si32(this.i14,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               si32(this.i13,mstate.esp + 8);
               state = 18;
               mstate.esp = mstate.esp - 4;
               FSM_str_gsub.start();
               return;
            case 18:
               this.i14 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               this.i14 = this.i14 ^ -1;
               this.i16 = li32(this.i15 + 8);
               this.i14 = this.i14 * 12;
               mstate.esp = mstate.esp - 12;
               this.i17 = 1;
               this.i14 = this.i16 + this.i14;
               si32(this.i15,mstate.esp);
               si32(this.i14,mstate.esp + 4);
               si32(this.i17,mstate.esp + 8);
               state = 19;
               mstate.esp = mstate.esp - 4;
               FSM_str_gsub.start();
               return;
            case 19:
               mstate.esp = mstate.esp + 12;
               mstate.esp = mstate.esp - 8;
               this.i14 = -1;
               si32(this.i15,mstate.esp);
               si32(this.i14,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_str_gsub.start();
            case 20:
               this.i14 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i16 = li32(this.i14 + 8);
               if(this.i16 != 0)
               {
                  if(this.i16 == 1)
                  {
                     this.i14 = li32(this.i14);
                     if(this.i14 != 0)
                     {
                     }
                  }
                  addr1703:
                  this.i14 = -1;
                  mstate.esp = mstate.esp - 8;
                  si32(this.i15,mstate.esp);
                  si32(this.i14,mstate.esp + 4);
                  mstate.esp = mstate.esp - 4;
                  FSM_str_gsub.start();
               }
               addr2063:
               this.i14 = li32(this.i15 + 8);
               this.i14 = this.i14 + -12;
               si32(this.i14,this.i15 + 8);
               this.i14 = li32(this.i15 + 16);
               this.i16 = li32(this.i14 + 68);
               this.i14 = li32(this.i14 + 64);
               this.i17 = this.i13 - this.i0;
               this.i18 = this.i15 + 8;
               if(uint(this.i16) >= uint(this.i14))
               {
                  mstate.esp = mstate.esp - 4;
                  si32(this.i15,mstate.esp);
                  state = 27;
                  mstate.esp = mstate.esp - 4;
                  FSM_str_gsub.start();
                  return;
               }
               addr2157:
               this.i14 = 4;
               this.i16 = li32(this.i18);
               mstate.esp = mstate.esp - 12;
               si32(this.i15,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               si32(this.i17,mstate.esp + 8);
               state = 28;
               mstate.esp = mstate.esp - 4;
               FSM_str_gsub.start();
               return;
            case 21:
               this.i14 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i16 = FSM_str_gsub;
               if(this.i14 != this.i16)
               {
                  this.i14 = li32(this.i14 + 8);
                  this.i14 = this.i14 + -3;
                  if(uint(this.i14) < uint(2))
                  {
                     addr2386:
                     this.i14 = mstate.ebp + -1328;
                     mstate.esp = mstate.esp - 4;
                     si32(this.i14,mstate.esp);
                     state = 31;
                     mstate.esp = mstate.esp - 4;
                     FSM_str_gsub.start();
                     return;
                  }
               }
               this.i14 = -1;
               mstate.esp = mstate.esp - 8;
               si32(this.i15,mstate.esp);
               si32(this.i14,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_str_gsub.start();
            case 22:
               this.i14 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i16 = FSM_str_gsub;
               if(this.i14 == this.i16)
               {
                  this.i14 = -1;
               }
               else
               {
                  this.i14 = li32(this.i14 + 8);
               }
               if(this.i14 == -1)
               {
                  this.i14 = FSM_str_gsub;
               }
               else
               {
                  this.i16 = FSM_str_gsub;
                  this.i14 = this.i14 << 2;
                  this.i14 = this.i16 + this.i14;
                  this.i14 = li32(this.i14);
               }
               this.i16 = FSM_str_gsub;
               mstate.esp = mstate.esp - 12;
               si32(this.i15,mstate.esp);
               si32(this.i16,mstate.esp + 4);
               si32(this.i14,mstate.esp + 8);
               state = 30;
               mstate.esp = mstate.esp - 4;
               FSM_str_gsub.start();
               return;
            case 23:
               mstate.esp = mstate.esp + 16;
               mstate.esp = mstate.esp - 8;
               this.i14 = 3;
               si32(this.i15,mstate.esp);
               si32(this.i14,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_str_gsub.start();
            case 24:
               this.i14 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i16 = li32(this.i15 + 8);
               mstate.esp = mstate.esp - 16;
               this.i16 = this.i16 + -12;
               si32(this.i15,mstate.esp);
               si32(this.i14,mstate.esp + 4);
               si32(this.i16,mstate.esp + 8);
               si32(this.i16,mstate.esp + 12);
               state = 25;
               mstate.esp = mstate.esp - 4;
               FSM_str_gsub.start();
               return;
            case 25:
               mstate.esp = mstate.esp + 16;
               §§goto(addr1994);
            case 26:
               this.i14 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i16 = li32(this.i14 + 8);
               if(this.i16 != 0)
               {
                  if(this.i16 == 1)
                  {
                     this.i14 = li32(this.i14);
                     if(this.i14 == 0)
                     {
                     }
                  }
                  §§goto(addr1703);
               }
               §§goto(addr2063);
            case 27:
               mstate.esp = mstate.esp + 4;
               §§goto(addr2157);
            case 28:
               this.i15 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i15,this.i16);
               si32(this.i14,this.i16 + 8);
               this.i15 = li32(this.i18);
               this.i15 = this.i15 + 12;
               si32(this.i15,this.i18);
               mstate.esp = mstate.esp - 4;
               this.i15 = mstate.ebp + -1328;
               si32(this.i15,mstate.esp);
               state = 29;
               mstate.esp = mstate.esp - 4;
               FSM_str_gsub.start();
               return;
            case 29:
               mstate.esp = mstate.esp + 4;
               if(this.i13 != 0)
               {
                  if(uint(this.i13) > uint(this.i0))
                  {
                     this.i0 = this.i13;
                  }
                  §§goto(addr2587);
               }
               §§goto(addr2437);
            case 30:
               mstate.esp = mstate.esp + 12;
               §§goto(addr2386);
            case 31:
               mstate.esp = mstate.esp + 4;
               §§goto(addr2422);
            case 32:
               this.i13 = mstate.eax;
               mstate.esp = mstate.esp + 4;
               if(this.i13 != 0)
               {
                  this.i13 = mstate.ebp + -1328;
                  mstate.esp = mstate.esp - 4;
                  si32(this.i13,mstate.esp);
                  state = 33;
                  mstate.esp = mstate.esp - 4;
                  FSM_str_gsub.start();
                  return;
               }
               §§goto(addr2553);
            case 33:
               mstate.esp = mstate.esp + 4;
               §§goto(addr2553);
            case 34:
               mstate.esp = mstate.esp + 12;
               mstate.esp = mstate.esp - 4;
               si32(this.i3,mstate.esp);
               state = 35;
               mstate.esp = mstate.esp - 4;
               FSM_str_gsub.start();
               return;
            case 35:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 4;
               this.i0 = li32(this.i8);
               this.i3 = li32(this.i9);
               mstate.esp = mstate.esp - 8;
               si32(this.i3,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               state = 36;
               mstate.esp = mstate.esp - 4;
               FSM_str_gsub.start();
               return;
            case 36:
               mstate.esp = mstate.esp + 8;
               this.i0 = li32(this.i1 + 8);
               this.f0 = Number(this.i2);
               sf64(this.f0,this.i0);
               this.i2 = 3;
               si32(this.i2,this.i0 + 8);
               this.i0 = li32(this.i1 + 8);
               this.i0 = this.i0 + 12;
               si32(this.i0,this.i1 + 8);
               this.i0 = 2;
               mstate.eax = this.i0;
               mstate.esp = mstate.ebp;
               mstate.ebp = li32(mstate.esp);
               mstate.esp = mstate.esp + 4;
               mstate.esp = mstate.esp + 4;
               mstate.gworker = caller;
               return;
         }
         this.i13 = 0;
         si32(this.i13,this.i11);
         mstate.esp = mstate.esp - 12;
         this.i13 = mstate.ebp + -288;
         si32(this.i13,mstate.esp);
         si32(this.i0,mstate.esp + 4);
         si32(this.i2,mstate.esp + 8);
         state = 7;
         mstate.esp = mstate.esp - 4;
         FSM_str_gsub.start();
      }
   }
}
