package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.li8;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_read_long_string extends Machine
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
      
      public function FSM_read_long_string()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM_read_long_string = null;
         _loc1_ = new FSM_read_long_string();
         FSM_read_long_string.gworker = _loc1_;
      }
      
      override public final function work() : void
      {
         switch(state)
         {
            case 0:
               mstate.esp = mstate.esp - 4;
               si32(mstate.ebp,mstate.esp);
               mstate.ebp = mstate.esp;
               mstate.esp = mstate.esp - 200;
               this.i0 = li32(mstate.ebp + 8);
               this.i1 = li32(this.i0);
               mstate.esp = mstate.esp - 8;
               si32(this.i0,mstate.esp);
               si32(this.i1,mstate.esp + 4);
               state = 1;
               mstate.esp = mstate.esp - 4;
               FSM_read_long_string.start();
               return;
            case 1:
               mstate.esp = mstate.esp + 8;
               this.i1 = li32(this.i0 + 44);
               this.i2 = li32(this.i1);
               this.i3 = this.i2 + -1;
               si32(this.i3,this.i1);
               this.i1 = li32(this.i0 + 44);
               this.i3 = this.i0 + 44;
               this.i4 = li32(mstate.ebp + 12);
               this.i5 = li32(mstate.ebp + 16);
               this.i6 = this.i0;
               if(this.i2 != 0)
               {
                  this.i2 = li32(this.i1 + 4);
                  this.i7 = li8(this.i2);
                  this.i2 = this.i2 + 1;
                  si32(this.i2,this.i1 + 4);
                  si32(this.i7,this.i6);
                  if(this.i7 != 10)
                  {
                     if(this.i7 != 13)
                     {
                        addr365:
                        this.i1 = FSM_read_long_string;
                        this.i2 = FSM_read_long_string;
                        this.i1 = this.i4 == 0?int(this.i1):int(this.i2);
                        this.i2 = mstate.ebp + -192;
                        this.i7 = this.i0 + 40;
                        this.i8 = this.i0 + 4;
                        this.i9 = mstate.ebp + -96;
                        this.i10 = this.i0 + 52;
                        addr424:
                        this.i11 = this.i0 + 48;
                        addr445:
                        this.i12 = li32(this.i6);
                        addr445:
                        if(this.i12 <= 12)
                        {
                           if(this.i12 != -1)
                           {
                              if(this.i12 != 10)
                              {
                                 addr2383:
                                 if(this.i4 != 0)
                                 {
                                    addr2390:
                                    mstate.esp = mstate.esp - 8;
                                    si32(this.i0,mstate.esp);
                                    si32(this.i12,mstate.esp + 4);
                                    state = 27;
                                    mstate.esp = mstate.esp - 4;
                                    FSM_read_long_string.start();
                                    return;
                                 }
                                 loop0:
                                 while(true)
                                 {
                                    this.i12 = li32(this.i3);
                                    this.i13 = li32(this.i12);
                                    this.i14 = this.i13 + -1;
                                    si32(this.i14,this.i12);
                                    this.i12 = li32(this.i3);
                                    if(this.i13 != 0)
                                    {
                                       this.i13 = li32(this.i12 + 4);
                                       this.i14 = li8(this.i13);
                                       this.i13 = this.i13 + 1;
                                       si32(this.i13,this.i12 + 4);
                                       si32(this.i14,this.i6);
                                       if(this.i14 <= 12)
                                       {
                                          if(this.i14 != -1)
                                          {
                                             if(this.i14 == 10)
                                             {
                                                break;
                                             }
                                          }
                                          else
                                          {
                                             addr576:
                                          }
                                       }
                                       else if(this.i14 != 13)
                                       {
                                          if(this.i14 != 91)
                                          {
                                             if(this.i14 == 93)
                                             {
                                                addr1835:
                                                mstate.esp = mstate.esp - 4;
                                                si32(this.i0,mstate.esp);
                                                state = 22;
                                                mstate.esp = mstate.esp - 4;
                                                FSM_read_long_string.start();
                                                return;
                                             }
                                          }
                                          else
                                          {
                                             addr904:
                                             if(this.i5 == 0)
                                             {
                                                addr912:
                                                mstate.esp = mstate.esp - 4;
                                                si32(this.i0,mstate.esp);
                                                state = 11;
                                                mstate.esp = mstate.esp - 4;
                                                FSM_read_long_string.start();
                                                return;
                                             }
                                             mstate.esp = mstate.esp - 4;
                                             si32(this.i0,mstate.esp);
                                             state = 19;
                                             mstate.esp = mstate.esp - 4;
                                             FSM_read_long_string.start();
                                             return;
                                          }
                                       }
                                       else
                                       {
                                          break;
                                       }
                                       addr2504:
                                       while(true)
                                       {
                                          continue loop0;
                                       }
                                    }
                                    else
                                    {
                                       this.i13 = mstate.ebp + -100;
                                       this.i14 = li32(this.i12 + 16);
                                       this.i15 = li32(this.i12 + 8);
                                       this.i16 = li32(this.i12 + 12);
                                       mstate.esp = mstate.esp - 12;
                                       si32(this.i14,mstate.esp);
                                       si32(this.i16,mstate.esp + 4);
                                       si32(this.i13,mstate.esp + 8);
                                       state = 28;
                                       mstate.esp = mstate.esp - 4;
                                       mstate.funcs[this.i15]();
                                       return;
                                    }
                                 }
                              }
                              addr446:
                              if(this.i4 == 0)
                              {
                                 addr454:
                                 this.i12 = 10;
                                 mstate.esp = mstate.esp - 8;
                                 si32(this.i0,mstate.esp);
                                 si32(this.i12,mstate.esp + 4);
                                 state = 4;
                                 mstate.esp = mstate.esp - 4;
                                 FSM_read_long_string.start();
                                 return;
                              }
                              this.i12 = 10;
                              mstate.esp = mstate.esp - 8;
                              si32(this.i0,mstate.esp);
                              si32(this.i12,mstate.esp + 4);
                              state = 30;
                              mstate.esp = mstate.esp - 4;
                              FSM_read_long_string.start();
                              return;
                           }
                           addr577:
                           this.i12 = 80;
                           this.i13 = li32(this.i10);
                           mstate.esp = mstate.esp - 12;
                           this.i13 = this.i13 + 16;
                           si32(this.i2,mstate.esp);
                           si32(this.i13,mstate.esp + 4);
                           si32(this.i12,mstate.esp + 8);
                           mstate.esp = mstate.esp - 4;
                           FSM_read_long_string.start();
                        }
                        else if(this.i12 != 13)
                        {
                           if(this.i12 != 91)
                           {
                              if(this.i12 != 93)
                              {
                                 §§goto(addr2383);
                              }
                              §§goto(addr1835);
                           }
                           §§goto(addr904);
                        }
                        §§goto(addr446);
                     }
                  }
                  addr335:
                  mstate.esp = mstate.esp - 4;
                  si32(this.i0,mstate.esp);
                  state = 3;
                  mstate.esp = mstate.esp - 4;
                  FSM_read_long_string.start();
                  return;
               }
               this.i2 = mstate.ebp + -200;
               this.i7 = li32(this.i1 + 16);
               this.i8 = li32(this.i1 + 8);
               this.i9 = li32(this.i1 + 12);
               mstate.esp = mstate.esp - 12;
               si32(this.i7,mstate.esp);
               si32(this.i9,mstate.esp + 4);
               si32(this.i2,mstate.esp + 8);
               state = 2;
               mstate.esp = mstate.esp - 4;
               mstate.funcs[this.i8]();
               return;
            case 2:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               if(this.i2 != 0)
               {
                  this.i7 = li32(mstate.ebp + -200);
                  if(this.i7 != 0)
                  {
                     this.i7 = this.i7 + -1;
                     si32(this.i7,this.i1);
                     si32(this.i2,this.i1 + 4);
                     this.i7 = li8(this.i2);
                     this.i2 = this.i2 + 1;
                     si32(this.i2,this.i1 + 4);
                     this.i1 = this.i7;
                  }
                  addr319:
                  si32(this.i1,this.i6);
                  if(this.i1 != 10)
                  {
                     if(this.i1 != 13)
                     {
                        §§goto(addr365);
                     }
                  }
                  §§goto(addr335);
               }
               this.i1 = -1;
               §§goto(addr319);
            case 3:
               mstate.esp = mstate.esp + 4;
               §§goto(addr365);
            case 4:
               mstate.esp = mstate.esp + 8;
               mstate.esp = mstate.esp - 4;
               si32(this.i0,mstate.esp);
               state = 5;
               mstate.esp = mstate.esp - 4;
               FSM_read_long_string.start();
               return;
            case 5:
               mstate.esp = mstate.esp + 4;
               this.i12 = li32(this.i11);
               this.i13 = 0;
               si32(this.i13,this.i12 + 4);
               this.i12 = li32(this.i6);
               if(this.i12 <= 12)
               {
                  if(this.i12 != -1)
                  {
                     if(this.i12 != 10)
                     {
                        §§goto(addr2383);
                     }
                     §§goto(addr454);
                  }
                  §§goto(addr577);
               }
               else
               {
                  if(this.i12 != 13)
                  {
                     if(this.i12 != 91)
                     {
                        if(this.i12 != 93)
                        {
                           §§goto(addr2383);
                        }
                        §§goto(addr1835);
                     }
                     §§goto(addr904);
                  }
                  §§goto(addr454);
               }
               §§goto(addr454);
            case 6:
               mstate.esp = mstate.esp + 12;
               this.i12 = li32(this.i8);
               this.i13 = li32(this.i7);
               mstate.esp = mstate.esp - 20;
               this.i14 = FSM_read_long_string;
               this.i15 = mstate.ebp + -192;
               si32(this.i13,mstate.esp);
               si32(this.i14,mstate.esp + 4);
               si32(this.i15,mstate.esp + 8);
               si32(this.i12,mstate.esp + 12);
               si32(this.i1,mstate.esp + 16);
               state = 7;
               mstate.esp = mstate.esp - 4;
               FSM_read_long_string.start();
               return;
            case 7:
               this.i12 = mstate.eax;
               mstate.esp = mstate.esp + 20;
               mstate.esp = mstate.esp - 8;
               this.i13 = 287;
               si32(this.i0,mstate.esp);
               si32(this.i13,mstate.esp + 4);
               state = 8;
               mstate.esp = mstate.esp - 4;
               FSM_read_long_string.start();
               return;
            case 8:
               this.i13 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i14 = li32(this.i7);
               mstate.esp = mstate.esp - 16;
               this.i15 = FSM_read_long_string;
               si32(this.i14,mstate.esp);
               si32(this.i15,mstate.esp + 4);
               si32(this.i12,mstate.esp + 8);
               si32(this.i13,mstate.esp + 12);
               state = 9;
               mstate.esp = mstate.esp - 4;
               FSM_read_long_string.start();
               return;
            case 9:
               this.i12 = mstate.eax;
               mstate.esp = mstate.esp + 16;
               this.i12 = li32(this.i7);
               mstate.esp = mstate.esp - 8;
               this.i13 = 3;
               si32(this.i12,mstate.esp);
               si32(this.i13,mstate.esp + 4);
               state = 10;
               mstate.esp = mstate.esp - 4;
               FSM_read_long_string.start();
               return;
            case 10:
               mstate.esp = mstate.esp + 8;
               this.i12 = li32(this.i6);
               if(this.i12 <= 12)
               {
                  if(this.i12 != -1)
                  {
                     if(this.i12 != 10)
                     {
                        §§goto(addr2383);
                     }
                  }
                  §§goto(addr576);
               }
               else if(this.i12 != 13)
               {
                  if(this.i12 != 91)
                  {
                     if(this.i12 != 93)
                     {
                        §§goto(addr2383);
                     }
                     §§goto(addr1835);
                  }
                  §§goto(addr904);
               }
               §§goto(addr445);
            case 11:
               this.i12 = mstate.eax;
               mstate.esp = mstate.esp + 4;
               if(this.i12 != this.i5)
               {
                  addr423:
                  §§goto(addr424);
               }
               else
               {
                  this.i12 = li32(this.i6);
                  mstate.esp = mstate.esp - 8;
                  si32(this.i0,mstate.esp);
                  si32(this.i12,mstate.esp + 4);
                  state = 12;
                  mstate.esp = mstate.esp - 4;
                  FSM_read_long_string.start();
                  return;
               }
            case 12:
               mstate.esp = mstate.esp + 8;
               this.i12 = li32(this.i3);
               this.i13 = li32(this.i12);
               this.i14 = this.i13 + -1;
               si32(this.i14,this.i12);
               this.i12 = li32(this.i3);
               if(this.i13 == 0)
               {
                  this.i13 = mstate.ebp + -12;
                  this.i14 = li32(this.i12 + 16);
                  this.i15 = li32(this.i12 + 8);
                  this.i16 = li32(this.i12 + 12);
                  mstate.esp = mstate.esp - 12;
                  si32(this.i14,mstate.esp);
                  si32(this.i16,mstate.esp + 4);
                  si32(this.i13,mstate.esp + 8);
                  state = 18;
                  mstate.esp = mstate.esp - 4;
                  mstate.funcs[this.i15]();
                  return;
               }
               this.i13 = li32(this.i12 + 4);
               this.i14 = li8(this.i13);
               this.i13 = this.i13 + 1;
               si32(this.i13,this.i12 + 4);
               this.i12 = this.i14;
               addr1059:
               this.i13 = 80;
               si32(this.i12,this.i6);
               this.i12 = li32(this.i10);
               mstate.esp = mstate.esp - 12;
               this.i12 = this.i12 + 16;
               si32(this.i9,mstate.esp);
               si32(this.i12,mstate.esp + 4);
               si32(this.i13,mstate.esp + 8);
               mstate.esp = mstate.esp - 4;
               FSM_read_long_string.start();
            case 13:
               mstate.esp = mstate.esp + 12;
               this.i12 = li32(this.i8);
               this.i13 = li32(this.i7);
               mstate.esp = mstate.esp - 20;
               this.i14 = FSM_read_long_string;
               this.i15 = FSM_read_long_string;
               this.i16 = mstate.ebp + -96;
               si32(this.i13,mstate.esp);
               si32(this.i14,mstate.esp + 4);
               si32(this.i16,mstate.esp + 8);
               si32(this.i12,mstate.esp + 12);
               si32(this.i15,mstate.esp + 16);
               state = 14;
               mstate.esp = mstate.esp - 4;
               FSM_read_long_string.start();
               return;
            case 14:
               this.i12 = mstate.eax;
               mstate.esp = mstate.esp + 20;
               mstate.esp = mstate.esp - 8;
               this.i13 = 91;
               si32(this.i0,mstate.esp);
               si32(this.i13,mstate.esp + 4);
               state = 15;
               mstate.esp = mstate.esp - 4;
               FSM_read_long_string.start();
               return;
            case 15:
               this.i13 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i14 = li32(this.i7);
               mstate.esp = mstate.esp - 16;
               this.i15 = FSM_read_long_string;
               si32(this.i14,mstate.esp);
               si32(this.i15,mstate.esp + 4);
               si32(this.i12,mstate.esp + 8);
               si32(this.i13,mstate.esp + 12);
               state = 16;
               mstate.esp = mstate.esp - 4;
               FSM_read_long_string.start();
               return;
            case 16:
               this.i12 = mstate.eax;
               mstate.esp = mstate.esp + 16;
               this.i12 = li32(this.i7);
               mstate.esp = mstate.esp - 8;
               this.i13 = 3;
               si32(this.i12,mstate.esp);
               si32(this.i13,mstate.esp + 4);
               state = 17;
               mstate.esp = mstate.esp - 4;
               FSM_read_long_string.start();
               return;
            case 17:
               mstate.esp = mstate.esp + 8;
               this.i12 = li32(this.i6);
               if(this.i12 <= 12)
               {
                  if(this.i12 != -1)
                  {
                     if(this.i12 != 10)
                     {
                        §§goto(addr2383);
                     }
                  }
                  §§goto(addr576);
               }
               else if(this.i12 != 13)
               {
                  if(this.i12 != 91)
                  {
                     if(this.i12 != 93)
                     {
                        §§goto(addr2383);
                     }
                     §§goto(addr1835);
                  }
                  §§goto(addr912);
               }
               §§goto(addr445);
            case 18:
               this.i13 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               if(this.i13 != 0)
               {
                  this.i14 = li32(mstate.ebp + -12);
                  if(this.i14 != 0)
                  {
                     this.i14 = this.i14 + -1;
                     si32(this.i14,this.i12);
                     si32(this.i13,this.i12 + 4);
                     this.i14 = li8(this.i13);
                     this.i13 = this.i13 + 1;
                     si32(this.i13,this.i12 + 4);
                     this.i12 = this.i14;
                  }
                  addr1058:
                  §§goto(addr1059);
               }
               this.i12 = -1;
               §§goto(addr1058);
            case 19:
               this.i12 = mstate.eax;
               mstate.esp = mstate.esp + 4;
               if(this.i12 == this.i5)
               {
                  this.i12 = li32(this.i6);
                  mstate.esp = mstate.esp - 8;
                  si32(this.i0,mstate.esp);
                  si32(this.i12,mstate.esp + 4);
                  state = 20;
                  mstate.esp = mstate.esp - 4;
                  FSM_read_long_string.start();
                  return;
               }
               §§goto(addr423);
            case 20:
               mstate.esp = mstate.esp + 8;
               this.i12 = li32(this.i3);
               this.i13 = li32(this.i12);
               this.i14 = this.i13 + -1;
               si32(this.i14,this.i12);
               this.i12 = li32(this.i3);
               if(this.i13 != 0)
               {
                  this.i13 = li32(this.i12 + 4);
                  this.i14 = li8(this.i13);
                  this.i13 = this.i13 + 1;
                  si32(this.i13,this.i12 + 4);
                  si32(this.i14,this.i6);
                  §§goto(addr423);
               }
               else
               {
                  this.i13 = mstate.ebp + -8;
                  this.i14 = li32(this.i12 + 16);
                  this.i15 = li32(this.i12 + 8);
                  this.i16 = li32(this.i12 + 12);
                  mstate.esp = mstate.esp - 12;
                  si32(this.i14,mstate.esp);
                  si32(this.i16,mstate.esp + 4);
                  si32(this.i13,mstate.esp + 8);
                  state = 21;
                  mstate.esp = mstate.esp - 4;
                  mstate.funcs[this.i15]();
                  return;
               }
            case 21:
               this.i13 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               if(this.i13 != 0)
               {
                  this.i14 = li32(mstate.ebp + -8);
                  if(this.i14 != 0)
                  {
                     this.i14 = this.i14 + -1;
                     si32(this.i14,this.i12);
                     si32(this.i13,this.i12 + 4);
                     this.i14 = li8(this.i13);
                     this.i13 = this.i13 + 1;
                     si32(this.i13,this.i12 + 4);
                     this.i12 = this.i14;
                  }
                  addr1828:
                  si32(this.i12,this.i6);
                  §§goto(addr423);
               }
               this.i12 = -1;
               §§goto(addr1828);
            case 22:
               this.i12 = mstate.eax;
               mstate.esp = mstate.esp + 4;
               if(this.i12 == this.i5)
               {
                  this.i1 = li32(this.i6);
                  mstate.esp = mstate.esp - 8;
                  si32(this.i0,mstate.esp);
                  si32(this.i1,mstate.esp + 4);
                  state = 23;
                  mstate.esp = mstate.esp - 4;
                  FSM_read_long_string.start();
                  return;
               }
               §§goto(addr423);
            case 23:
               mstate.esp = mstate.esp + 8;
               this.i1 = li32(this.i3);
               this.i2 = li32(this.i1);
               this.i8 = this.i2 + -1;
               si32(this.i8,this.i1);
               this.i1 = li32(this.i3);
               if(this.i2 != 0)
               {
                  this.i2 = li32(this.i1 + 4);
                  this.i3 = li8(this.i2);
                  this.i2 = this.i2 + 1;
                  si32(this.i2,this.i1 + 4);
                  si32(this.i3,this.i6);
                  if(this.i4 != 0)
                  {
                     addr1986:
                     this.i1 = li32(this.i11);
                     this.i2 = li32(this.i1);
                     this.i1 = li32(this.i1 + 4);
                     this.i3 = li32(this.i7);
                     this.i6 = this.i5 << 1;
                     this.i1 = this.i1 - this.i6;
                     this.i2 = this.i5 + this.i2;
                     mstate.esp = mstate.esp - 12;
                     this.i1 = this.i1 + -4;
                     this.i2 = this.i2 + 2;
                     si32(this.i3,mstate.esp);
                     si32(this.i2,mstate.esp + 4);
                     si32(this.i1,mstate.esp + 8);
                     state = 24;
                     mstate.esp = mstate.esp - 4;
                     FSM_read_long_string.start();
                     return;
                  }
                  break;
               }
               this.i2 = mstate.ebp + -4;
               this.i3 = li32(this.i1 + 16);
               this.i8 = li32(this.i1 + 8);
               this.i9 = li32(this.i1 + 12);
               mstate.esp = mstate.esp - 12;
               si32(this.i3,mstate.esp);
               si32(this.i9,mstate.esp + 4);
               si32(this.i2,mstate.esp + 8);
               state = 26;
               mstate.esp = mstate.esp - 4;
               mstate.funcs[this.i8]();
               return;
            case 24:
               this.i1 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               this.i0 = li32(this.i0 + 36);
               this.i0 = li32(this.i0 + 4);
               mstate.esp = mstate.esp - 12;
               si32(this.i3,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               si32(this.i1,mstate.esp + 8);
               state = 25;
               mstate.esp = mstate.esp - 4;
               FSM_read_long_string.start();
               return;
            case 25:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               this.i2 = li32(this.i0 + 8);
               this.i3 = this.i0 + 8;
               if(this.i2 == 0)
               {
                  this.i2 = 1;
                  si32(this.i2,this.i0);
                  si32(this.i2,this.i3);
               }
               si32(this.i1,this.i4);
               break;
            case 26:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               if(this.i2 != 0)
               {
                  this.i3 = li32(mstate.ebp + -4);
                  if(this.i3 != 0)
                  {
                     this.i3 = this.i3 + -1;
                     si32(this.i3,this.i1);
                     si32(this.i2,this.i1 + 4);
                     this.i3 = li8(this.i2);
                     this.i2 = this.i2 + 1;
                     si32(this.i2,this.i1 + 4);
                     this.i1 = this.i3;
                  }
                  addr2332:
                  si32(this.i1,this.i6);
                  if(this.i4 != 0)
                  {
                     §§goto(addr1986);
                  }
                  else
                  {
                     break;
                  }
               }
               this.i1 = -1;
               §§goto(addr2332);
            case 27:
               mstate.esp = mstate.esp + 8;
               this.i12 = li32(this.i3);
               this.i13 = li32(this.i12);
               this.i14 = this.i13 + -1;
               si32(this.i14,this.i12);
               this.i12 = li32(this.i3);
               if(this.i13 != 0)
               {
                  this.i13 = li32(this.i12 + 4);
                  this.i14 = li8(this.i13);
                  this.i13 = this.i13 + 1;
                  si32(this.i13,this.i12 + 4);
                  si32(this.i14,this.i6);
                  if(this.i14 <= 12)
                  {
                     if(this.i14 != -1)
                     {
                        if(this.i14 != 10)
                        {
                           addr2794:
                           addr2389:
                           this.i12 = this.i14;
                           §§goto(addr2390);
                        }
                     }
                     else
                     {
                        §§goto(addr576);
                     }
                  }
                  else if(this.i14 != 13)
                  {
                     if(this.i14 != 91)
                     {
                        if(this.i14 != 93)
                        {
                           §§goto(addr2794);
                        }
                        else
                        {
                           §§goto(addr1835);
                        }
                     }
                     else
                     {
                        §§goto(addr904);
                     }
                  }
                  §§goto(addr445);
               }
               else
               {
                  this.i13 = mstate.ebp + -196;
                  this.i14 = li32(this.i12 + 16);
                  this.i15 = li32(this.i12 + 8);
                  this.i16 = li32(this.i12 + 12);
                  mstate.esp = mstate.esp - 12;
                  si32(this.i14,mstate.esp);
                  si32(this.i16,mstate.esp + 4);
                  si32(this.i13,mstate.esp + 8);
                  state = 29;
                  mstate.esp = mstate.esp - 4;
                  mstate.funcs[this.i15]();
                  return;
               }
            case 28:
               this.i13 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               if(this.i13 != 0)
               {
                  this.i14 = li32(mstate.ebp + -100);
                  if(this.i14 != 0)
                  {
                     this.i14 = this.i14 + -1;
                     si32(this.i14,this.i12);
                     si32(this.i13,this.i12 + 4);
                     this.i14 = li8(this.i13);
                     this.i13 = this.i13 + 1;
                     si32(this.i13,this.i12 + 4);
                     this.i12 = this.i14;
                  }
                  addr2742:
                  si32(this.i12,this.i6);
                  if(this.i12 <= 12)
                  {
                     if(this.i12 != -1)
                     {
                        if(this.i12 != 10)
                        {
                           §§goto(addr2504);
                        }
                     }
                     §§goto(addr576);
                  }
                  else if(this.i12 != 13)
                  {
                     if(this.i12 != 91)
                     {
                        if(this.i12 != 93)
                        {
                           §§goto(addr2504);
                        }
                        §§goto(addr1835);
                     }
                     §§goto(addr904);
                  }
                  §§goto(addr445);
               }
               this.i12 = -1;
               §§goto(addr2742);
            case 29:
               this.i13 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               if(this.i13 != 0)
               {
                  this.i14 = li32(mstate.ebp + -196);
                  if(this.i14 != 0)
                  {
                     this.i14 = this.i14 + -1;
                     si32(this.i14,this.i12);
                     si32(this.i13,this.i12 + 4);
                     this.i14 = li8(this.i13);
                     this.i13 = this.i13 + 1;
                     si32(this.i13,this.i12 + 4);
                     this.i12 = this.i14;
                  }
                  addr2943:
                  si32(this.i12,this.i6);
                  if(this.i12 <= 12)
                  {
                     if(this.i12 != -1)
                     {
                        if(this.i12 != 10)
                        {
                           §§goto(addr2389);
                        }
                     }
                     else
                     {
                        §§goto(addr576);
                     }
                  }
                  else if(this.i12 != 13)
                  {
                     if(this.i12 != 91)
                     {
                        if(this.i12 != 93)
                        {
                           §§goto(addr2389);
                        }
                        else
                        {
                           §§goto(addr1835);
                        }
                     }
                     else
                     {
                        §§goto(addr904);
                     }
                  }
                  §§goto(addr445);
               }
               this.i12 = -1;
               §§goto(addr2943);
            case 30:
               mstate.esp = mstate.esp + 8;
               mstate.esp = mstate.esp - 4;
               si32(this.i0,mstate.esp);
               state = 31;
               mstate.esp = mstate.esp - 4;
               FSM_read_long_string.start();
               return;
            case 31:
               mstate.esp = mstate.esp + 4;
               §§goto(addr423);
         }
         mstate.esp = mstate.ebp;
         mstate.ebp = li32(mstate.esp);
         mstate.esp = mstate.esp + 4;
         mstate.esp = mstate.esp + 4;
         mstate.gworker = caller;
      }
   }
}
