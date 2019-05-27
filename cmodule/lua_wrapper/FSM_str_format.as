package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.lf64;
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.li8;
   import avm2.intrinsics.memory.sf64;
   import avm2.intrinsics.memory.si32;
   import avm2.intrinsics.memory.si8;
   import avm2.intrinsics.memory.sxi8;
   
   public final class FSM_str_format extends Machine
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
      
      public function FSM_str_format()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM_str_format = null;
         _loc1_ = new FSM_str_format();
         FSM_str_format.gworker = _loc1_;
      }
      
      override public final function work() : void
      {
         loop25:
         switch(state)
         {
            case 0:
               mstate.esp = mstate.esp - 4;
               si32(mstate.ebp,mstate.esp);
               mstate.ebp = mstate.esp;
               mstate.esp = mstate.esp - 1592;
               this.i0 = mstate.ebp + -4;
               mstate.esp = mstate.esp - 12;
               this.i1 = li32(mstate.ebp + 8);
               this.i2 = 1;
               si32(this.i1,mstate.esp);
               si32(this.i2,mstate.esp + 4);
               si32(this.i0,mstate.esp + 8);
               state = 1;
               mstate.esp = mstate.esp - 4;
               FSM_str_format.start();
               return;
            case 1:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               this.i2 = mstate.ebp + -1040;
               this.i3 = li32(mstate.ebp + -4);
               si32(this.i1,mstate.ebp + -1032);
               this.i4 = this.i2 + 12;
               si32(this.i4,mstate.ebp + -1040);
               this.i4 = 0;
               si32(this.i4,mstate.ebp + -1036);
               this.i4 = this.i2 + 4;
               this.i5 = this.i2 + 8;
               this.i3 = this.i0 + this.i3;
               this.i6 = mstate.ebp + -1584;
               this.i7 = mstate.ebp + -1072;
               if(uint(this.i0) < uint(this.i3))
               {
                  this.i8 = mstate.ebp + -1040;
                  this.i8 = this.i8 + 1036;
                  this.i9 = 1;
                  this.i10 = this.i1 + 8;
                  this.i11 = mstate.ebp + -1584;
                  this.i12 = mstate.ebp + -1072;
                  loop0:
                  while(true)
                  {
                     this.i13 = li8(this.i0);
                     this.i14 = this.i0;
                     if(this.i13 != 37)
                     {
                        this.i14 = li32(this.i2);
                        if(uint(this.i14) >= uint(this.i8))
                        {
                           this.i14 = mstate.ebp + -1040;
                           mstate.esp = mstate.esp - 4;
                           si32(this.i14,mstate.esp);
                           state = 2;
                           mstate.esp = mstate.esp - 4;
                           FSM_str_format.start();
                           return;
                        }
                        addr319:
                        while(true)
                        {
                           this.i14 = li32(this.i2);
                           this.i13 = li8(this.i0);
                           si8(this.i13,this.i14);
                           this.i14 = this.i14 + 1;
                           si32(this.i14,this.i2);
                           this.i0 = this.i0 + 1;
                           if(uint(this.i0) >= uint(this.i3))
                           {
                              break loop0;
                           }
                        }
                     }
                     else
                     {
                        this.i13 = li8(this.i0 + 1);
                        this.i15 = this.i0 + 1;
                        if(this.i13 == 37)
                        {
                           this.i13 = li32(this.i2);
                           if(uint(this.i13) >= uint(this.i8))
                           {
                              this.i13 = mstate.ebp + -1040;
                              mstate.esp = mstate.esp - 4;
                              si32(this.i13,mstate.esp);
                              state = 4;
                              mstate.esp = mstate.esp - 4;
                              FSM_str_format.start();
                              return;
                           }
                           addr477:
                           while(true)
                           {
                              this.i13 = li32(this.i2);
                              this.i14 = li8(this.i15);
                              si8(this.i14,this.i13);
                              this.i13 = this.i13 + 1;
                              si32(this.i13,this.i2);
                              this.i0 = this.i0 + 2;
                              if(uint(this.i0) >= uint(this.i3))
                              {
                                 break loop0;
                              }
                           }
                        }
                        else
                        {
                           this.i9 = this.i9 + 1;
                           this.i0 = this.i13 & 255;
                           if(this.i0 != 0)
                           {
                              this.i0 = this.i14;
                              while(true)
                              {
                                 this.i13 = FSM_str_format;
                                 this.i16 = li8(this.i0 + 1);
                                 this.i17 = 7;
                                 while(true)
                                 {
                                    this.i18 = li8(this.i13);
                                    this.i19 = this.i16 & 255;
                                    this.i20 = this.i13;
                                    if(this.i18 == this.i19)
                                    {
                                       this.i13 = this.i20;
                                       break;
                                    }
                                    this.i17 = this.i17 + -1;
                                    this.i13 = this.i13 + 1;
                                    if(this.i17 != 1)
                                    {
                                       continue;
                                    }
                                    this.i13 = 0;
                                    break;
                                 }
                                 if(this.i13 == 0)
                                 {
                                    this.i0 = this.i0 + 1;
                                    break;
                                 }
                                 this.i13 = li8(this.i0 + 2);
                                 this.i0 = this.i0 + 1;
                                 if(this.i13 != 0)
                                 {
                                    continue;
                                 }
                                 this.i0 = this.i0 + 1;
                                 break;
                              }
                           }
                           else
                           {
                              this.i0 = this.i15;
                           }
                           this.i13 = this.i15;
                           this.i15 = this.i0 - this.i15;
                           if(uint(this.i15) >= uint(6))
                           {
                              this.i15 = FSM_str_format;
                              mstate.esp = mstate.esp - 8;
                              si32(this.i1,mstate.esp);
                              si32(this.i15,mstate.esp + 4);
                              state = 6;
                              mstate.esp = mstate.esp - 4;
                              FSM_str_format.start();
                              return;
                           }
                           addr705:
                           this.i15 = FSM_str_format;
                           this.i16 = li8(this.i0);
                           this.i16 = this.i16 << 2;
                           this.i15 = this.i15 + this.i16;
                           this.i15 = li32(this.i15 + 52);
                           this.i15 = this.i15 & 1024;
                           if(this.i15 != 0)
                           {
                              this.i0 = this.i0 + 1;
                           }
                           this.i15 = FSM_str_format;
                           this.i16 = li8(this.i0);
                           this.i16 = this.i16 << 2;
                           this.i15 = this.i15 + this.i16;
                           this.i15 = li32(this.i15 + 52);
                           this.i15 = this.i15 & 1024;
                           if(this.i15 != 0)
                           {
                              this.i0 = this.i0 + 1;
                           }
                           this.i15 = li8(this.i0);
                           if(this.i15 == 46)
                           {
                              this.i15 = FSM_str_format;
                              this.i16 = li8(this.i0 + 1);
                              this.i16 = this.i16 << 2;
                              this.i15 = this.i15 + this.i16;
                              this.i15 = li32(this.i15 + 52);
                              this.i16 = this.i0 + 1;
                              this.i15 = this.i15 & 1024;
                              if(this.i15 == 0)
                              {
                                 this.i0 = this.i16;
                              }
                              else
                              {
                                 this.i0 = this.i0 + 2;
                              }
                              this.i15 = FSM_str_format;
                              this.i16 = li8(this.i0);
                              this.i16 = this.i16 << 2;
                              this.i15 = this.i15 + this.i16;
                              this.i15 = li32(this.i15 + 52);
                              this.i15 = this.i15 & 1024;
                              if(this.i15 != 0)
                              {
                                 this.i0 = this.i0 + 1;
                              }
                           }
                           this.i15 = FSM_str_format;
                           this.i16 = li8(this.i0);
                           this.i16 = this.i16 << 2;
                           this.i15 = this.i15 + this.i16;
                           this.i15 = li32(this.i15 + 52);
                           this.i15 = this.i15 & 1024;
                           if(this.i15 != 0)
                           {
                              this.i15 = FSM_str_format;
                              mstate.esp = mstate.esp - 8;
                              si32(this.i1,mstate.esp);
                              si32(this.i15,mstate.esp + 4);
                              state = 7;
                              mstate.esp = mstate.esp - 4;
                              FSM_str_format.start();
                              return;
                           }
                           break loop25;
                        }
                     }
                     addr208:
                     while(true)
                     {
                        continue loop0;
                     }
                  }
               }
               addr2135:
               this.i0 = mstate.ebp + -1040;
               mstate.esp = mstate.esp - 4;
               si32(this.i0,mstate.esp);
               state = 19;
               mstate.esp = mstate.esp - 4;
               FSM_str_format.start();
               return;
            case 2:
               this.i14 = mstate.eax;
               mstate.esp = mstate.esp + 4;
               if(this.i14 != 0)
               {
                  this.i14 = mstate.ebp + -1040;
                  mstate.esp = mstate.esp - 4;
                  si32(this.i14,mstate.esp);
                  state = 3;
                  mstate.esp = mstate.esp - 4;
                  FSM_str_format.start();
                  return;
               }
               §§goto(addr319);
            case 3:
               mstate.esp = mstate.esp + 4;
               §§goto(addr319);
            case 4:
               this.i13 = mstate.eax;
               mstate.esp = mstate.esp + 4;
               if(this.i13 != 0)
               {
                  this.i13 = mstate.ebp + -1040;
                  mstate.esp = mstate.esp - 4;
                  si32(this.i13,mstate.esp);
                  state = 5;
                  mstate.esp = mstate.esp - 4;
                  FSM_str_format.start();
                  return;
               }
               §§goto(addr477);
            case 5:
               mstate.esp = mstate.esp + 4;
               §§goto(addr477);
            case 6:
               mstate.esp = mstate.esp + 8;
               §§goto(addr705);
            case 7:
               mstate.esp = mstate.esp + 8;
               break;
            case 8:
               mstate.esp = mstate.esp + 12;
               this.i4 = 0;
               mstate.eax = this.i4;
               addr1277:
               mstate.esp = mstate.ebp;
               mstate.ebp = li32(mstate.esp);
               mstate.esp = mstate.esp + 4;
               mstate.esp = mstate.esp + 4;
               mstate.gworker = caller;
               return;
            case 9:
               this.f0 = mstate.st0;
               mstate.esp = mstate.esp + 8;
               mstate.esp = mstate.esp - 16;
               si32(this.i11,mstate.esp);
               si32(this.i12,mstate.esp + 4);
               sf64(this.f0,mstate.esp + 8);
               state = 10;
               mstate.esp = mstate.esp - 4;
               FSM_str_format.start();
               return;
            case 10:
               mstate.esp = mstate.esp + 16;
               this.i13 = li8(this.i11);
               if(this.i13 != 0)
               {
                  this.i13 = this.i6;
                  while(true)
                  {
                     this.i14 = li8(this.i13 + 1);
                     this.i13 = this.i13 + 1;
                     this.i15 = this.i13;
                     if(this.i14 != 0)
                     {
                        this.i13 = this.i15;
                        continue;
                     }
                     break;
                  }
               }
               else
               {
                  this.i13 = this.i11;
               }
               this.i14 = mstate.ebp + -1040;
               mstate.esp = mstate.esp - 12;
               this.i13 = this.i13 - this.i6;
               si32(this.i14,mstate.esp);
               si32(this.i11,mstate.esp + 4);
               si32(this.i13,mstate.esp + 8);
               state = 23;
               mstate.esp = mstate.esp - 4;
               FSM_str_format.start();
               return;
            case 11:
               this.i13 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               this.i14 = li32(this.i2);
               if(uint(this.i14) >= uint(this.i8))
               {
                  this.i14 = mstate.ebp + -1040;
                  mstate.esp = mstate.esp - 4;
                  si32(this.i14,mstate.esp);
                  state = 12;
                  mstate.esp = mstate.esp - 4;
                  FSM_str_format.start();
                  return;
               }
               addr1627:
               this.i14 = 34;
               this.i15 = li32(this.i2);
               si8(this.i14,this.i15);
               this.i14 = this.i15 + 1;
               si32(this.i14,this.i2);
               this.i15 = li32(mstate.ebp + -1588);
               this.i16 = this.i15 + -1;
               si32(this.i16,mstate.ebp + -1588);
               if(this.i15 != 0)
               {
                  loop11:
                  while(true)
                  {
                     this.i15 = si8(li8(this.i13));
                     this.i16 = this.i13;
                     if(this.i15 <= 12)
                     {
                        if(this.i15 != 0)
                        {
                           if(this.i15 != 10)
                           {
                              addr1705:
                              if(uint(this.i14) >= uint(this.i8))
                              {
                                 this.i14 = mstate.ebp + -1040;
                                 mstate.esp = mstate.esp - 4;
                                 si32(this.i14,mstate.esp);
                                 state = 14;
                                 mstate.esp = mstate.esp - 4;
                                 FSM_str_format.start();
                                 return;
                              }
                              addr1796:
                              while(true)
                              {
                                 this.i14 = li32(this.i2);
                                 this.i15 = li8(this.i16);
                                 si8(this.i15,this.i14);
                                 this.i14 = this.i14 + 1;
                                 si32(this.i14,this.i2);
                              }
                           }
                           else
                           {
                              addr2525:
                              if(uint(this.i14) >= uint(this.i8))
                              {
                                 break;
                              }
                              addr2616:
                              while(true)
                              {
                                 this.i14 = 92;
                                 this.i15 = li32(this.i2);
                                 si8(this.i14,this.i15);
                                 this.i14 = this.i15 + 1;
                                 si32(this.i14,this.i2);
                                 if(uint(this.i14) >= uint(this.i8))
                                 {
                                    this.i14 = mstate.ebp + -1040;
                                    mstate.esp = mstate.esp - 4;
                                    si32(this.i14,mstate.esp);
                                    state = 26;
                                    mstate.esp = mstate.esp - 4;
                                    FSM_str_format.start();
                                    return;
                                 }
                                 addr2731:
                                 while(true)
                                 {
                                    this.i14 = li32(this.i2);
                                    this.i16 = li8(this.i16);
                                    si8(this.i16,this.i14);
                                    this.i14 = this.i14 + 1;
                                    si32(this.i14,this.i2);
                                 }
                              }
                           }
                        }
                        else
                        {
                           this.i16 = FSM_str_format;
                           this.i15 = 0;
                           loop13:
                           while(true)
                           {
                              this.i17 = this.i16 + this.i15;
                              if(uint(this.i14) >= uint(this.i8))
                              {
                                 break;
                              }
                              addr3010:
                              while(true)
                              {
                                 this.i14 = li32(this.i2);
                                 this.i17 = li8(this.i17);
                                 si8(this.i17,this.i14);
                                 this.i14 = this.i14 + 1;
                                 si32(this.i14,this.i2);
                                 this.i15 = this.i15 + 1;
                                 if(this.i15 != 4)
                                 {
                                    continue loop13;
                                 }
                              }
                           }
                           this.i14 = mstate.ebp + -1040;
                           mstate.esp = mstate.esp - 4;
                           si32(this.i14,mstate.esp);
                           state = 30;
                           mstate.esp = mstate.esp - 4;
                           FSM_str_format.start();
                           return;
                        }
                     }
                     else if(this.i15 != 13)
                     {
                        if(this.i15 != 34)
                        {
                           if(this.i15 != 92)
                           {
                              §§goto(addr1705);
                           }
                        }
                        §§goto(addr2525);
                     }
                     else
                     {
                        this.i16 = FSM_str_format;
                        this.i15 = 0;
                        loop12:
                        while(true)
                        {
                           this.i17 = this.i16 + this.i15;
                           if(uint(this.i14) >= uint(this.i8))
                           {
                              break;
                           }
                           addr2865:
                           while(true)
                           {
                              this.i14 = li32(this.i2);
                              this.i17 = li8(this.i17);
                              si8(this.i17,this.i14);
                              this.i14 = this.i14 + 1;
                              si32(this.i14,this.i2);
                              this.i15 = this.i15 + 1;
                              if(this.i15 != 2)
                              {
                                 continue loop12;
                              }
                           }
                        }
                        this.i14 = mstate.ebp + -1040;
                        mstate.esp = mstate.esp - 4;
                        si32(this.i14,mstate.esp);
                        state = 28;
                        mstate.esp = mstate.esp - 4;
                        FSM_str_format.start();
                        return;
                     }
                     while(true)
                     {
                        this.i15 = li32(mstate.ebp + -1588);
                        this.i16 = this.i15 + -1;
                        si32(this.i16,mstate.ebp + -1588);
                        this.i13 = this.i13 + 1;
                        if(this.i15 != 0)
                        {
                           continue loop11;
                        }
                        this.i13 = this.i14;
                     }
                  }
                  this.i14 = mstate.ebp + -1040;
                  mstate.esp = mstate.esp - 4;
                  si32(this.i14,mstate.esp);
                  state = 24;
                  mstate.esp = mstate.esp - 4;
                  FSM_str_format.start();
                  return;
               }
               this.i13 = this.i14;
               if(uint(this.i13) >= uint(this.i8))
               {
                  this.i13 = mstate.ebp + -1040;
                  mstate.esp = mstate.esp - 4;
                  si32(this.i13,mstate.esp);
                  state = 32;
                  mstate.esp = mstate.esp - 4;
                  FSM_str_format.start();
                  return;
               }
               addr3175:
               this.i13 = 34;
               this.i14 = li32(this.i2);
               si8(this.i13,this.i14);
               this.i13 = this.i14 + 1;
               si32(this.i13,this.i2);
               if(uint(this.i0) < uint(this.i3))
               {
                  §§goto(addr208);
               }
               else
               {
                  addr2134:
               }
               §§goto(addr2135);
            case 12:
               this.i14 = mstate.eax;
               mstate.esp = mstate.esp + 4;
               if(this.i14 != 0)
               {
                  this.i14 = mstate.ebp + -1040;
                  mstate.esp = mstate.esp - 4;
                  si32(this.i14,mstate.esp);
                  state = 13;
                  mstate.esp = mstate.esp - 4;
                  FSM_str_format.start();
                  return;
               }
               §§goto(addr1627);
            case 13:
               mstate.esp = mstate.esp + 4;
               §§goto(addr1627);
            case 14:
               this.i14 = mstate.eax;
               mstate.esp = mstate.esp + 4;
               if(this.i14 != 0)
               {
                  this.i14 = mstate.ebp + -1040;
                  mstate.esp = mstate.esp - 4;
                  si32(this.i14,mstate.esp);
                  state = 15;
                  mstate.esp = mstate.esp - 4;
                  FSM_str_format.start();
                  return;
               }
               §§goto(addr1796);
            case 15:
               mstate.esp = mstate.esp + 4;
               §§goto(addr1796);
            case 16:
               this.f0 = mstate.st0;
               mstate.esp = mstate.esp + 8;
               mstate.esp = mstate.esp - 12;
               this.i13 = int(this.f0);
               si32(this.i11,mstate.esp);
               si32(this.i12,mstate.esp + 4);
               si32(this.i13,mstate.esp + 8);
               state = 17;
               mstate.esp = mstate.esp - 4;
               FSM_str_format.start();
               return;
            case 17:
               mstate.esp = mstate.esp + 12;
               this.i13 = li8(this.i11);
               if(this.i13 != 0)
               {
                  this.i13 = this.i6;
                  while(true)
                  {
                     this.i14 = li8(this.i13 + 1);
                     this.i13 = this.i13 + 1;
                     this.i15 = this.i13;
                     if(this.i14 != 0)
                     {
                        this.i13 = this.i15;
                        continue;
                     }
                     break;
                  }
               }
               else
               {
                  this.i13 = this.i11;
               }
               this.i14 = mstate.ebp + -1040;
               mstate.esp = mstate.esp - 12;
               this.i13 = this.i13 - this.i6;
               si32(this.i14,mstate.esp);
               si32(this.i11,mstate.esp + 4);
               si32(this.i13,mstate.esp + 8);
               state = 36;
               mstate.esp = mstate.esp - 4;
               FSM_str_format.start();
               return;
            case 18:
               mstate.esp = mstate.esp + 12;
               if(uint(this.i0) < uint(this.i3))
               {
                  §§goto(addr208);
               }
               §§goto(addr2135);
            case 19:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 4;
               this.i0 = li32(this.i4);
               this.i1 = li32(this.i5);
               mstate.esp = mstate.esp - 8;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               state = 20;
               mstate.esp = mstate.esp - 4;
               FSM_str_format.start();
               return;
            case 20:
               mstate.esp = mstate.esp + 8;
               this.i0 = 1;
               mstate.eax = this.i0;
               §§goto(addr1277);
            case 21:
               this.f0 = mstate.st0;
               mstate.esp = mstate.esp + 8;
               mstate.esp = mstate.esp - 12;
               this.i13 = uint(this.f0);
               si32(this.i11,mstate.esp);
               si32(this.i12,mstate.esp + 4);
               si32(this.i13,mstate.esp + 8);
               state = 22;
               mstate.esp = mstate.esp - 4;
               FSM_str_format.start();
               return;
            case 22:
               mstate.esp = mstate.esp + 12;
               this.i13 = li8(this.i11);
               if(this.i13 != 0)
               {
                  this.i13 = this.i6;
                  while(true)
                  {
                     this.i14 = li8(this.i13 + 1);
                     this.i13 = this.i13 + 1;
                     this.i15 = this.i13;
                     if(this.i14 != 0)
                     {
                        this.i13 = this.i15;
                        continue;
                     }
                     break;
                  }
               }
               else
               {
                  this.i13 = this.i11;
               }
               this.i14 = mstate.ebp + -1040;
               mstate.esp = mstate.esp - 12;
               this.i13 = this.i13 - this.i6;
               si32(this.i14,mstate.esp);
               si32(this.i11,mstate.esp + 4);
               si32(this.i13,mstate.esp + 8);
               state = 39;
               mstate.esp = mstate.esp - 4;
               FSM_str_format.start();
               return;
            case 23:
               mstate.esp = mstate.esp + 12;
               if(uint(this.i0) >= uint(this.i3))
               {
                  §§goto(addr2134);
               }
               else
               {
                  §§goto(addr208);
               }
               §§goto(addr2135);
            case 24:
               this.i14 = mstate.eax;
               mstate.esp = mstate.esp + 4;
               if(this.i14 != 0)
               {
                  this.i14 = mstate.ebp + -1040;
                  mstate.esp = mstate.esp - 4;
                  si32(this.i14,mstate.esp);
                  state = 25;
                  mstate.esp = mstate.esp - 4;
                  FSM_str_format.start();
                  return;
               }
               §§goto(addr2616);
            case 25:
               mstate.esp = mstate.esp + 4;
               §§goto(addr2616);
            case 26:
               this.i14 = mstate.eax;
               mstate.esp = mstate.esp + 4;
               if(this.i14 != 0)
               {
                  this.i14 = mstate.ebp + -1040;
                  mstate.esp = mstate.esp - 4;
                  si32(this.i14,mstate.esp);
                  state = 27;
                  mstate.esp = mstate.esp - 4;
                  FSM_str_format.start();
                  return;
               }
               §§goto(addr2731);
            case 27:
               mstate.esp = mstate.esp + 4;
               §§goto(addr2731);
            case 28:
               this.i14 = mstate.eax;
               mstate.esp = mstate.esp + 4;
               if(this.i14 != 0)
               {
                  this.i14 = mstate.ebp + -1040;
                  mstate.esp = mstate.esp - 4;
                  si32(this.i14,mstate.esp);
                  state = 29;
                  mstate.esp = mstate.esp - 4;
                  FSM_str_format.start();
                  return;
               }
               §§goto(addr2865);
            case 29:
               mstate.esp = mstate.esp + 4;
               §§goto(addr2865);
            case 30:
               this.i14 = mstate.eax;
               mstate.esp = mstate.esp + 4;
               if(this.i14 != 0)
               {
                  this.i14 = mstate.ebp + -1040;
                  mstate.esp = mstate.esp - 4;
                  si32(this.i14,mstate.esp);
                  state = 31;
                  mstate.esp = mstate.esp - 4;
                  FSM_str_format.start();
                  return;
               }
               §§goto(addr3010);
            case 31:
               mstate.esp = mstate.esp + 4;
               §§goto(addr3010);
            case 32:
               this.i13 = mstate.eax;
               mstate.esp = mstate.esp + 4;
               if(this.i13 != 0)
               {
                  this.i13 = mstate.ebp + -1040;
                  mstate.esp = mstate.esp - 4;
                  si32(this.i13,mstate.esp);
                  state = 33;
                  mstate.esp = mstate.esp - 4;
                  FSM_str_format.start();
                  return;
               }
               §§goto(addr3175);
            case 33:
               mstate.esp = mstate.esp + 4;
               §§goto(addr3175);
            case 34:
               this.i13 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               this.i14 = li8(this.i12);
               if(this.i14 != 46)
               {
                  this.i14 = this.i7;
                  while(true)
                  {
                     this.i15 = li8(this.i14);
                     if(this.i15 == 0)
                     {
                        this.i14 = 0;
                        break;
                     }
                     this.i15 = li8(this.i14 + 1);
                     this.i14 = this.i14 + 1;
                     this.i16 = this.i14;
                     if(this.i15 != 46)
                     {
                        this.i14 = this.i16;
                        continue;
                     }
                     break;
                  }
               }
               else
               {
                  this.i14 = this.i12;
               }
               if(this.i14 == 0)
               {
                  this.i14 = li32(mstate.ebp + -1592);
                  if(uint(this.i14) >= uint(100))
                  {
                     this.i13 = mstate.ebp + -1040;
                     mstate.esp = mstate.esp - 8;
                     si32(this.i1,mstate.esp);
                     si32(this.i9,mstate.esp + 4);
                     mstate.esp = mstate.esp - 4;
                     FSM_str_format.start();
                  }
               }
               mstate.esp = mstate.esp - 12;
               si32(this.i11,mstate.esp);
               si32(this.i12,mstate.esp + 4);
               si32(this.i13,mstate.esp + 8);
               state = 35;
               mstate.esp = mstate.esp - 4;
               FSM_str_format.start();
               return;
            case 35:
               mstate.esp = mstate.esp + 12;
               this.i13 = li8(this.i11);
               if(this.i13 != 0)
               {
                  this.i13 = this.i6;
                  while(true)
                  {
                     this.i14 = li8(this.i13 + 1);
                     this.i13 = this.i13 + 1;
                     this.i15 = this.i13;
                     if(this.i14 != 0)
                     {
                        this.i13 = this.i15;
                        continue;
                     }
                     break;
                  }
               }
               else
               {
                  this.i13 = this.i11;
               }
               this.i14 = mstate.ebp + -1040;
               mstate.esp = mstate.esp - 12;
               this.i13 = this.i13 - this.i6;
               si32(this.i14,mstate.esp);
               si32(this.i11,mstate.esp + 4);
               si32(this.i13,mstate.esp + 8);
               state = 42;
               mstate.esp = mstate.esp - 4;
               FSM_str_format.start();
               return;
            case 36:
               mstate.esp = mstate.esp + 12;
               if(uint(this.i0) < uint(this.i3))
               {
                  §§goto(addr208);
               }
               else
               {
                  §§goto(addr2134);
               }
               §§goto(addr2135);
            case 37:
               this.f0 = mstate.st0;
               mstate.esp = mstate.esp + 8;
               mstate.esp = mstate.esp - 12;
               this.i13 = int(this.f0);
               si32(this.i11,mstate.esp);
               si32(this.i12,mstate.esp + 4);
               si32(this.i13,mstate.esp + 8);
               state = 38;
               mstate.esp = mstate.esp - 4;
               FSM_str_format.start();
               return;
            case 38:
               mstate.esp = mstate.esp + 12;
               this.i13 = li8(this.i11);
               if(this.i13 != 0)
               {
                  this.i13 = this.i6;
                  while(true)
                  {
                     this.i14 = li8(this.i13 + 1);
                     this.i13 = this.i13 + 1;
                     this.i15 = this.i13;
                     if(this.i14 != 0)
                     {
                        this.i13 = this.i15;
                        continue;
                     }
                     break;
                  }
               }
               else
               {
                  this.i13 = this.i11;
               }
               this.i14 = mstate.ebp + -1040;
               mstate.esp = mstate.esp - 12;
               this.i13 = this.i13 - this.i6;
               si32(this.i14,mstate.esp);
               si32(this.i11,mstate.esp + 4);
               si32(this.i13,mstate.esp + 8);
               state = 18;
               mstate.esp = mstate.esp - 4;
               FSM_str_format.start();
               return;
            case 39:
               mstate.esp = mstate.esp + 12;
               if(uint(this.i0) >= uint(this.i3))
               {
                  §§goto(addr2134);
               }
               else
               {
                  addr3489:
                  §§goto(addr208);
               }
               §§goto(addr2135);
            case 40:
               this.i14 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i15 = li32(this.i10);
               this.f0 = lf64(this.i14);
               sf64(this.f0,this.i15);
               this.i14 = li32(this.i14 + 8);
               si32(this.i14,this.i15 + 8);
               this.i14 = li32(this.i10);
               this.i14 = this.i14 + 12;
               si32(this.i14,this.i10);
               mstate.esp = mstate.esp - 4;
               si32(this.i13,mstate.esp);
               state = 41;
               mstate.esp = mstate.esp - 4;
               FSM_str_format.start();
               return;
            case 41:
               mstate.esp = mstate.esp + 4;
               if(uint(this.i0) >= uint(this.i3))
               {
                  §§goto(addr2134);
               }
               else
               {
                  §§goto(addr3489);
               }
               §§goto(addr2135);
            case 42:
               mstate.esp = mstate.esp + 12;
               if(uint(this.i0) >= uint(this.i3))
               {
                  §§goto(addr2134);
               }
               else
               {
                  §§goto(addr3489);
               }
               §§goto(addr2135);
         }
         this.i15 = 37;
         this.i16 = 1 - this.i13;
         si8(this.i15,this.i12);
         this.i15 = this.i0 + this.i16;
         if(this.i15 != 0)
         {
            this.i16 = 1;
            loop3:
            while(true)
            {
               this.i17 = this.i14 + this.i16;
               this.i17 = li8(this.i17);
               this.i18 = this.i7 + this.i16;
               si8(this.i17,this.i18);
               if(this.i17 != 0)
               {
                  this.i17 = this.i15 + -1;
                  this.i16 = this.i16 + 1;
                  if(this.i15 != 1)
                  {
                     this.i15 = this.i17;
                     continue;
                  }
                  break;
               }
               if(this.i15 != 1)
               {
                  this.i14 = 0;
                  while(true)
                  {
                     this.i17 = mstate.ebp + -1072;
                     this.i18 = this.i16 + this.i14;
                     this.i17 = this.i18 + this.i17;
                     this.i18 = 0;
                     si8(this.i18,this.i17 + 1);
                     this.i17 = this.i14 + 1;
                     this.i14 = this.i15 - this.i14;
                     if(this.i14 != 2)
                     {
                        this.i14 = this.i17;
                        continue;
                     }
                     break loop3;
                  }
               }
               break;
            }
         }
         this.i14 = mstate.ebp + -1072;
         this.i13 = 2 - this.i13;
         this.i13 = this.i0 + this.i13;
         this.i15 = 0;
         this.i13 = this.i14 + this.i13;
         si8(this.i15,this.i13);
         this.i13 = si8(li8(this.i0));
         this.i0 = this.i0 + 1;
         if(this.i13 <= 104)
         {
            if(this.i13 <= 98)
            {
               if(this.i13 != 69)
               {
                  if(this.i13 != 71)
                  {
                     if(this.i13 != 88)
                     {
                        addr1220:
                        this.i4 = FSM_str_format;
                        mstate.esp = mstate.esp - 12;
                        si32(this.i1,mstate.esp);
                        si32(this.i4,mstate.esp + 4);
                        si32(this.i13,mstate.esp + 8);
                        state = 8;
                        mstate.esp = mstate.esp - 4;
                        FSM_str_format.start();
                        return;
                     }
                  }
               }
            }
            else if(this.i13 != 99)
            {
               if(this.i13 != 100)
               {
                  this.i14 = this.i13 + -101;
                  if(uint(this.i14) >= uint(3))
                  {
                     addr1219:
                     §§goto(addr1220);
                  }
               }
               else
               {
                  addr2016:
                  this.i13 = li8(this.i12);
                  if(this.i13 != 0)
                  {
                     this.i13 = this.i7;
                     while(true)
                     {
                        this.i14 = li8(this.i13 + 1);
                        this.i13 = this.i13 + 1;
                        this.i15 = this.i13;
                        if(this.i14 != 0)
                        {
                           this.i13 = this.i15;
                           continue;
                        }
                        break;
                     }
                  }
                  else
                  {
                     this.i13 = this.i12;
                  }
                  this.i14 = mstate.ebp + -1072;
                  this.i13 = this.i13 - this.i7;
                  this.i15 = this.i13 + this.i14;
                  this.i16 = li8(this.i15 + -1);
                  this.i17 = 108;
                  this.i18 = 0;
                  si8(this.i17,this.i15 + -1);
                  si8(this.i18,this.i15);
                  this.i13 = this.i14 + this.i13;
                  si8(this.i16,this.i13);
                  si8(this.i18,this.i15 + 1);
                  mstate.esp = mstate.esp - 8;
                  si32(this.i1,mstate.esp);
                  si32(this.i9,mstate.esp + 4);
                  state = 37;
                  mstate.esp = mstate.esp - 4;
                  FSM_str_format.start();
                  return;
               }
            }
            else
            {
               mstate.esp = mstate.esp - 8;
               si32(this.i1,mstate.esp);
               si32(this.i9,mstate.esp + 4);
               state = 16;
               mstate.esp = mstate.esp - 4;
               FSM_str_format.start();
               return;
            }
            mstate.esp = mstate.esp - 8;
            si32(this.i1,mstate.esp);
            si32(this.i9,mstate.esp + 4);
            state = 9;
            mstate.esp = mstate.esp - 4;
            FSM_str_format.start();
            return;
         }
         if(this.i13 <= 114)
         {
            if(this.i13 != 105)
            {
               if(this.i13 != 111)
               {
                  if(this.i13 != 113)
                  {
                     §§goto(addr1219);
                  }
                  else
                  {
                     this.i13 = mstate.ebp + -1588;
                     mstate.esp = mstate.esp - 12;
                     si32(this.i1,mstate.esp);
                     si32(this.i9,mstate.esp + 4);
                     si32(this.i13,mstate.esp + 8);
                     state = 11;
                     mstate.esp = mstate.esp - 4;
                     FSM_str_format.start();
                     return;
                  }
               }
            }
            else
            {
               §§goto(addr2016);
            }
         }
         else if(this.i13 != 115)
         {
            if(this.i13 != 117)
            {
               if(this.i13 != 120)
               {
                  §§goto(addr1219);
               }
            }
         }
         else
         {
            this.i13 = mstate.ebp + -1592;
            mstate.esp = mstate.esp - 12;
            si32(this.i1,mstate.esp);
            si32(this.i9,mstate.esp + 4);
            si32(this.i13,mstate.esp + 8);
            state = 34;
            mstate.esp = mstate.esp - 4;
            FSM_str_format.start();
            return;
         }
         this.i13 = li8(this.i12);
         if(this.i13 != 0)
         {
            this.i13 = this.i7;
            while(true)
            {
               this.i14 = li8(this.i13 + 1);
               this.i13 = this.i13 + 1;
               this.i15 = this.i13;
               if(this.i14 != 0)
               {
                  this.i13 = this.i15;
                  continue;
               }
               break;
            }
         }
         else
         {
            this.i13 = this.i12;
         }
         this.i14 = mstate.ebp + -1072;
         this.i13 = this.i13 - this.i7;
         this.i15 = this.i13 + this.i14;
         this.i16 = li8(this.i15 + -1);
         this.i17 = 108;
         this.i18 = 0;
         si8(this.i17,this.i15 + -1);
         si8(this.i18,this.i15);
         this.i13 = this.i14 + this.i13;
         si8(this.i16,this.i13);
         si8(this.i18,this.i15 + 1);
         mstate.esp = mstate.esp - 8;
         si32(this.i1,mstate.esp);
         si32(this.i9,mstate.esp + 4);
         state = 21;
         mstate.esp = mstate.esp - 4;
         FSM_str_format.start();
      }
   }
}
