package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.li8;
   import avm2.intrinsics.memory.si32;
   import avm2.intrinsics.memory.si8;
   
   public final class FSM_os_setlocale extends Machine
   {
      
      public static const intRegCount:int = 15;
      
      public static const NumberRegCount:int = 0;
       
      
      public var i10:int;
      
      public var i11:int;
      
      public var i12:int;
      
      public var i13:int;
      
      public var i14:int;
      
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
      
      public function FSM_os_setlocale()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM_os_setlocale = null;
         _loc1_ = new FSM_os_setlocale();
         FSM_os_setlocale.gworker = _loc1_;
      }
      
      override public final function work() : void
      {
         loop31:
         switch(state)
         {
            case 0:
               mstate.esp = mstate.esp - 4;
               si32(mstate.ebp,mstate.esp);
               mstate.ebp = mstate.esp;
               mstate.esp = mstate.esp - 0;
               this.i0 = 1;
               mstate.esp = mstate.esp - 8;
               this.i1 = li32(mstate.ebp + 8);
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_os_setlocale.start();
            case 1:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i2 = FSM_os_setlocale;
               if(this.i0 != this.i2)
               {
                  this.i0 = li32(this.i0 + 8);
                  if(this.i0 >= 1)
                  {
                     this.i0 = 0;
                     mstate.esp = mstate.esp - 12;
                     this.i2 = 1;
                     si32(this.i1,mstate.esp);
                     si32(this.i2,mstate.esp + 4);
                     si32(this.i0,mstate.esp + 8);
                     state = 2;
                     mstate.esp = mstate.esp - 4;
                     FSM_os_setlocale.start();
                     return;
                  }
               }
               this.i0 = 0;
               addr156:
               this.i2 = FSM_os_setlocale;
               mstate.esp = mstate.esp - 16;
               this.i3 = FSM_os_setlocale;
               this.i4 = 2;
               si32(this.i1,mstate.esp);
               si32(this.i4,mstate.esp + 4);
               si32(this.i2,mstate.esp + 8);
               si32(this.i3,mstate.esp + 12);
               state = 3;
               mstate.esp = mstate.esp - 4;
               FSM_os_setlocale.start();
               return;
            case 2:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               §§goto(addr156);
            case 3:
               this.i2 = mstate.eax;
               this.i3 = FSM_os_setlocale;
               this.i2 = this.i2 << 2;
               mstate.esp = mstate.esp + 16;
               this.i2 = this.i3 + this.i2;
               this.i2 = li32(this.i2);
               this.i3 = this.i0;
               if(uint(this.i2) >= uint(7))
               {
                  this.i0 = 22;
                  si32(this.i0,FSM_os_setlocale);
                  this.i0 = 0;
                  break;
               }
               if(this.i0 != 0)
               {
                  this.i4 = li8(FSM_os_setlocale + 32);
                  si8(this.i4,FSM_os_setlocale + 32);
                  if(this.i4 != 0)
                  {
                     this.i4 = FSM_os_setlocale;
                     this.i5 = FSM_os_setlocale;
                     this.i6 = 33;
                     while(true)
                     {
                        this.i7 = this.i4 + this.i6;
                        this.i7 = li8(this.i7);
                        this.i8 = this.i5 + this.i6;
                        si8(this.i7,this.i8);
                        this.i6 = this.i6 + 1;
                        if(this.i7 != 0)
                        {
                           continue;
                        }
                        break;
                     }
                  }
                  this.i4 = li8(FSM_os_setlocale + 64);
                  si8(this.i4,FSM_os_setlocale + 64);
                  if(this.i4 != 0)
                  {
                     this.i4 = FSM_os_setlocale;
                     this.i5 = FSM_os_setlocale;
                     this.i6 = 65;
                     while(true)
                     {
                        this.i7 = this.i4 + this.i6;
                        this.i7 = li8(this.i7);
                        this.i8 = this.i5 + this.i6;
                        si8(this.i7,this.i8);
                        this.i6 = this.i6 + 1;
                        if(this.i7 != 0)
                        {
                           continue;
                        }
                        break;
                     }
                  }
                  this.i4 = li8(FSM_os_setlocale + 96);
                  si8(this.i4,FSM_os_setlocale + 96);
                  if(this.i4 != 0)
                  {
                     this.i4 = FSM_os_setlocale;
                     this.i5 = FSM_os_setlocale;
                     this.i6 = 97;
                     while(true)
                     {
                        this.i7 = this.i4 + this.i6;
                        this.i7 = li8(this.i7);
                        this.i8 = this.i5 + this.i6;
                        si8(this.i7,this.i8);
                        this.i6 = this.i6 + 1;
                        if(this.i7 != 0)
                        {
                           continue;
                        }
                        break;
                     }
                  }
                  this.i4 = li8(FSM_os_setlocale + 128);
                  si8(this.i4,FSM_os_setlocale + 128);
                  if(this.i4 != 0)
                  {
                     this.i4 = FSM_os_setlocale;
                     this.i5 = FSM_os_setlocale;
                     this.i6 = 129;
                     while(true)
                     {
                        this.i7 = this.i4 + this.i6;
                        this.i7 = li8(this.i7);
                        this.i8 = this.i5 + this.i6;
                        si8(this.i7,this.i8);
                        this.i6 = this.i6 + 1;
                        if(this.i7 != 0)
                        {
                           continue;
                        }
                        break;
                     }
                  }
                  this.i4 = li8(FSM_os_setlocale + 160);
                  si8(this.i4,FSM_os_setlocale + 160);
                  if(this.i4 != 0)
                  {
                     this.i4 = FSM_os_setlocale;
                     this.i5 = FSM_os_setlocale;
                     this.i6 = 161;
                     while(true)
                     {
                        this.i7 = this.i4 + this.i6;
                        this.i7 = li8(this.i7);
                        this.i8 = this.i5 + this.i6;
                        si8(this.i7,this.i8);
                        this.i6 = this.i6 + 1;
                        if(this.i7 != 0)
                        {
                           continue;
                        }
                        break;
                     }
                  }
                  this.i4 = li8(FSM_os_setlocale + 192);
                  si8(this.i4,FSM_os_setlocale + 192);
                  if(this.i4 != 0)
                  {
                     this.i4 = FSM_os_setlocale;
                     this.i5 = FSM_os_setlocale;
                     this.i6 = 193;
                     while(true)
                     {
                        this.i7 = this.i4 + this.i6;
                        this.i7 = li8(this.i7);
                        this.i8 = this.i5 + this.i6;
                        si8(this.i7,this.i8);
                        this.i6 = this.i6 + 1;
                        if(this.i7 != 0)
                        {
                           continue;
                        }
                        break;
                     }
                  }
                  this.i4 = li8(this.i0);
                  if(this.i4 != 0)
                  {
                     if(this.i2 != 0)
                     {
                        this.i5 = this.i4 & 255;
                        if(this.i5 != 0)
                        {
                           this.i5 = this.i3;
                           while(true)
                           {
                              this.i6 = li8(this.i5 + 1);
                              this.i5 = this.i5 + 1;
                              this.i7 = this.i5;
                              if(this.i6 != 0)
                              {
                                 this.i5 = this.i7;
                                 continue;
                              }
                              break;
                           }
                        }
                        else
                        {
                           this.i5 = this.i0;
                        }
                        this.i0 = this.i5 - this.i0;
                        if(uint(this.i0) >= uint(32))
                        {
                           this.i0 = 22;
                           si32(this.i0,FSM_os_setlocale);
                           this.i0 = 0;
                           addr2542:
                           break;
                        }
                        this.i0 = FSM_os_setlocale;
                        this.i5 = this.i2 << 5;
                        this.i0 = this.i0 + this.i5;
                        si8(this.i4,this.i0);
                        this.i0 = this.i4 & 255;
                        if(this.i0 != 0)
                        {
                           this.i0 = FSM_os_setlocale;
                           this.i4 = this.i2 << 5;
                           this.i5 = 1;
                           this.i0 = this.i0 + this.i4;
                           this.i4 = this.i5;
                           while(true)
                           {
                              this.i5 = this.i3 + this.i4;
                              this.i5 = li8(this.i5);
                              this.i6 = this.i0 + this.i4;
                              si8(this.i5,this.i6);
                              this.i4 = this.i4 + 1;
                              if(this.i5 != 0)
                              {
                                 continue;
                              }
                              break;
                           }
                        }
                        if(this.i2 == 0)
                        {
                           addr2054:
                           this.i0 = FSM_os_setlocale;
                           this.i2 = FSM_os_setlocale;
                           this.i3 = 0;
                           addr2071:
                           this.i4 = this.i3;
                           this.i5 = this.i4;
                           this.i4 = this.i3 + 1;
                           if(this.i4 >= 7)
                           {
                              this.i0 = FSM_os_setlocale;
                              mstate.esp = mstate.esp - 4;
                              FSM_os_setlocale.start();
                           }
                           else
                           {
                              this.i6 = this.i2 + this.i5;
                              this.i6 = li8(this.i6 + 32);
                              this.i7 = this.i0 + this.i5;
                              si8(this.i6,this.i7 + 32);
                              if(this.i6 != 0)
                              {
                                 this.i6 = FSM_os_setlocale;
                                 this.i7 = FSM_os_setlocale;
                                 this.i8 = this.i5 + 33;
                                 while(true)
                                 {
                                    this.i9 = this.i6 + this.i8;
                                    this.i9 = li8(this.i9);
                                    this.i10 = this.i7 + this.i8;
                                    si8(this.i9,this.i10);
                                    this.i8 = this.i8 + 1;
                                    if(this.i9 != 0)
                                    {
                                       continue;
                                    }
                                    break;
                                 }
                              }
                              mstate.esp = mstate.esp - 4;
                              si32(this.i4,mstate.esp);
                              state = 10;
                              mstate.esp = mstate.esp - 4;
                              FSM_os_setlocale.start();
                              return;
                           }
                        }
                     }
                     else
                     {
                        this.i5 = this.i4 & 255;
                        if(this.i5 != 47)
                        {
                           this.i5 = this.i3;
                           while(true)
                           {
                              this.i6 = li8(this.i5);
                              if(this.i6 == 0)
                              {
                                 this.i5 = 0;
                                 break;
                              }
                              this.i6 = li8(this.i5 + 1);
                              this.i5 = this.i5 + 1;
                              this.i7 = this.i5;
                              if(this.i6 != 47)
                              {
                                 this.i5 = this.i7;
                                 continue;
                              }
                              break;
                           }
                        }
                        else
                        {
                           this.i5 = this.i0;
                        }
                        this.i6 = this.i5;
                        if(this.i5 != 0)
                        {
                           this.i3 = 0;
                           while(true)
                           {
                              this.i4 = this.i6 + this.i3;
                              this.i4 = li8(this.i4 + 1);
                              this.i3 = this.i3 + 1;
                              if(this.i4 != 0)
                              {
                                 this.i4 = this.i4 & 255;
                                 if(this.i4 == 47)
                                 {
                                    continue;
                                 }
                                 addr1718:
                                 this.i4 = FSM_os_setlocale;
                                 this.i3 = this.i3 + this.i5;
                                 this.i3 = this.i3 + -1;
                                 this.i4 = this.i4 + 32;
                                 this.i5 = 0;
                                 while(true)
                                 {
                                    this.i6 = this.i3;
                                    this.i7 = this.i4;
                                    this.i8 = this.i5 + 1;
                                    if(this.i8 != 7)
                                    {
                                       this.i8 = this.i6 - this.i0;
                                       if(this.i8 >= 32)
                                       {
                                          this.i0 = 22;
                                          si32(this.i0,FSM_os_setlocale);
                                          this.i0 = 0;
                                          break loop31;
                                       }
                                       mstate.esp = mstate.esp - 12;
                                       this.i8 = this.i8 + 1;
                                       si32(this.i7,mstate.esp);
                                       si32(this.i0,mstate.esp + 4);
                                       si32(this.i8,mstate.esp + 8);
                                       mstate.esp = mstate.esp - 4;
                                       FSM_os_setlocale.start();
                                    }
                                    else
                                    {
                                       this.i0 = this.i5 + 1;
                                       break;
                                    }
                                 }
                                 if(this.i0 < 7)
                                 {
                                    this.i5 = FSM_os_setlocale;
                                    this.i3 = this.i0 << 5;
                                    this.i4 = 0;
                                    this.i5 = this.i5 + this.i3;
                                    this.i0 = 7 - this.i0;
                                    this.i3 = this.i4;
                                    while(true)
                                    {
                                       this.i4 = li8(this.i5 + -32);
                                       si8(this.i4,this.i5);
                                       if(this.i4 != 0)
                                       {
                                          this.i4 = this.i5;
                                          while(true)
                                          {
                                             this.i6 = li8(this.i4 + -31);
                                             si8(this.i6,this.i4 + 1);
                                             this.i4 = this.i4 + 1;
                                             if(this.i6 != 0)
                                             {
                                                continue;
                                             }
                                             break;
                                          }
                                       }
                                       this.i5 = this.i5 + 32;
                                       this.i3 = this.i3 + 1;
                                       if(this.i3 != this.i0)
                                       {
                                          continue;
                                       }
                                    }
                                 }
                              }
                              else
                              {
                                 this.i0 = 22;
                                 si32(this.i0,FSM_os_setlocale);
                                 this.i0 = 0;
                                 break loop31;
                              }
                           }
                           break;
                        }
                        this.i5 = this.i4 & 255;
                        if(this.i5 != 0)
                        {
                           this.i5 = this.i3;
                           while(true)
                           {
                              this.i6 = li8(this.i5 + 1);
                              this.i5 = this.i5 + 1;
                              this.i7 = this.i5;
                              if(this.i6 != 0)
                              {
                                 this.i5 = this.i7;
                                 continue;
                              }
                              break;
                           }
                        }
                        else
                        {
                           this.i5 = this.i0;
                        }
                        this.i5 = this.i5 - this.i3;
                        if(uint(this.i5) <= uint(31))
                        {
                           si8(this.i4,FSM_os_setlocale + 32);
                           this.i5 = this.i4 & 255;
                           if(this.i5 != 0)
                           {
                              this.i5 = FSM_os_setlocale;
                              this.i6 = 0;
                              while(true)
                              {
                                 this.i4 = this.i3 + this.i6;
                                 this.i4 = li8(this.i4 + 1);
                                 this.i7 = this.i5 + this.i6;
                                 si8(this.i4,this.i7 + 33);
                                 this.i6 = this.i6 + 1;
                                 if(this.i4 != 0)
                                 {
                                    continue;
                                 }
                                 break;
                              }
                           }
                           this.i5 = li8(this.i0);
                           si8(this.i5,FSM_os_setlocale + 64);
                           if(this.i5 != 0)
                           {
                              this.i5 = FSM_os_setlocale;
                              this.i6 = 0;
                              while(true)
                              {
                                 this.i4 = this.i3 + this.i6;
                                 this.i4 = li8(this.i4 + 1);
                                 this.i7 = this.i5 + this.i6;
                                 si8(this.i4,this.i7 + 65);
                                 this.i6 = this.i6 + 1;
                                 if(this.i4 != 0)
                                 {
                                    continue;
                                 }
                                 break;
                              }
                           }
                           this.i5 = li8(this.i0);
                           si8(this.i5,FSM_os_setlocale + 96);
                           if(this.i5 != 0)
                           {
                              this.i5 = FSM_os_setlocale;
                              this.i6 = 0;
                              while(true)
                              {
                                 this.i4 = this.i3 + this.i6;
                                 this.i4 = li8(this.i4 + 1);
                                 this.i7 = this.i5 + this.i6;
                                 si8(this.i4,this.i7 + 97);
                                 this.i6 = this.i6 + 1;
                                 if(this.i4 != 0)
                                 {
                                    continue;
                                 }
                                 break;
                              }
                           }
                           this.i5 = li8(this.i0);
                           si8(this.i5,FSM_os_setlocale + 128);
                           if(this.i5 != 0)
                           {
                              this.i5 = FSM_os_setlocale;
                              this.i6 = 0;
                              while(true)
                              {
                                 this.i4 = this.i3 + this.i6;
                                 this.i4 = li8(this.i4 + 1);
                                 this.i7 = this.i5 + this.i6;
                                 si8(this.i4,this.i7 + 129);
                                 this.i6 = this.i6 + 1;
                                 if(this.i4 != 0)
                                 {
                                    continue;
                                 }
                                 break;
                              }
                           }
                           this.i5 = li8(this.i0);
                           si8(this.i5,FSM_os_setlocale + 160);
                           if(this.i5 != 0)
                           {
                              this.i5 = FSM_os_setlocale;
                              this.i6 = 0;
                              while(true)
                              {
                                 this.i4 = this.i3 + this.i6;
                                 this.i4 = li8(this.i4 + 1);
                                 this.i7 = this.i5 + this.i6;
                                 si8(this.i4,this.i7 + 161);
                                 this.i6 = this.i6 + 1;
                                 if(this.i4 != 0)
                                 {
                                    continue;
                                 }
                                 break;
                              }
                           }
                           this.i0 = li8(this.i0);
                           si8(this.i0,FSM_os_setlocale + 192);
                           if(this.i0 != 0)
                           {
                              this.i0 = FSM_os_setlocale;
                              this.i5 = 0;
                              while(true)
                              {
                                 this.i6 = this.i3 + this.i5;
                                 this.i6 = li8(this.i6 + 1);
                                 this.i4 = this.i0 + this.i5;
                                 si8(this.i6,this.i4 + 193);
                                 this.i5 = this.i5 + 1;
                                 if(this.i6 != 0)
                                 {
                                    continue;
                                 }
                                 break;
                              }
                           }
                        }
                        else
                        {
                           this.i0 = 22;
                           si32(this.i0,FSM_os_setlocale);
                           this.i0 = 0;
                           break;
                        }
                        addr2046:
                        if(this.i2 == 0)
                        {
                           §§goto(addr2054);
                        }
                     }
                  }
                  else if(this.i2 == 0)
                  {
                     this.i0 = FSM_os_setlocale;
                     this.i3 = 1;
                     addr745:
                     while(true)
                     {
                        mstate.esp = mstate.esp - 4;
                        si32(this.i3,mstate.esp);
                        mstate.esp = mstate.esp - 4;
                        FSM_os_setlocale.start();
                     }
                  }
                  else
                  {
                     mstate.esp = mstate.esp - 4;
                     si32(this.i2,mstate.esp);
                     mstate.esp = mstate.esp - 4;
                     FSM_os_setlocale.start();
                  }
                  addr2105:
                  mstate.esp = mstate.esp - 4;
                  si32(this.i2,mstate.esp);
                  state = 9;
                  mstate.esp = mstate.esp - 4;
                  FSM_os_setlocale.start();
                  return;
               }
               if(this.i2 != 0)
               {
                  this.i0 = FSM_os_setlocale;
                  this.i2 = this.i2 << 5;
                  this.i0 = this.i0 + this.i2;
                  break;
               }
               this.i0 = FSM_os_setlocale;
               mstate.esp = mstate.esp - 4;
               FSM_os_setlocale.start();
            case 4:
               break;
            case 5:
               while(true)
               {
                  this.i4 = mstate.eax;
                  mstate.esp = mstate.esp + 4;
                  this.i5 = li8(this.i4);
                  this.i6 = this.i4;
                  if(this.i5 != 0)
                  {
                     this.i4 = this.i6;
                     while(true)
                     {
                        this.i7 = li8(this.i4 + 1);
                        this.i4 = this.i4 + 1;
                        this.i8 = this.i4;
                        if(this.i7 != 0)
                        {
                           this.i4 = this.i8;
                           continue;
                        }
                        break;
                     }
                  }
                  this.i4 = this.i4 - this.i6;
                  if(uint(this.i4) >= uint(32))
                  {
                     this.i0 = 22;
                     si32(this.i0,FSM_os_setlocale);
                     this.i0 = 0;
                     §§goto(addr2542);
                  }
                  else
                  {
                     si8(this.i5,this.i0 + 32);
                     this.i4 = this.i5 & 255;
                     if(this.i4 != 0)
                     {
                        this.i4 = 0;
                        while(true)
                        {
                           this.i5 = this.i6 + this.i4;
                           this.i5 = li8(this.i5 + 1);
                           this.i7 = this.i0 + this.i4;
                           si8(this.i5,this.i7 + 33);
                           this.i4 = this.i4 + 1;
                           if(this.i5 != 0)
                           {
                              continue;
                           }
                           break;
                        }
                     }
                     this.i0 = this.i0 + 32;
                     this.i3 = this.i3 + 1;
                     if(this.i3 <= 6)
                     {
                        §§goto(addr745);
                     }
                     else
                     {
                        §§goto(addr2046);
                     }
                  }
               }
            case 6:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 4;
               this.i3 = li8(this.i0);
               this.i4 = this.i0;
               if(this.i3 != 0)
               {
                  this.i0 = this.i4;
                  while(true)
                  {
                     this.i5 = li8(this.i0 + 1);
                     this.i0 = this.i0 + 1;
                     this.i6 = this.i0;
                     if(this.i5 != 0)
                     {
                        this.i0 = this.i6;
                        continue;
                     }
                     break;
                  }
               }
               this.i0 = this.i0 - this.i4;
               if(uint(this.i0) >= uint(32))
               {
                  this.i0 = 22;
                  si32(this.i0,FSM_os_setlocale);
                  this.i0 = 0;
                  §§goto(addr2542);
               }
               else
               {
                  this.i0 = FSM_os_setlocale;
                  this.i5 = this.i2 << 5;
                  this.i0 = this.i0 + this.i5;
                  si8(this.i3,this.i0);
                  this.i0 = this.i3 & 255;
                  if(this.i0 != 0)
                  {
                     this.i0 = FSM_os_setlocale;
                     this.i3 = this.i2 << 5;
                     this.i5 = 1;
                     this.i0 = this.i0 + this.i3;
                     this.i3 = this.i5;
                     while(true)
                     {
                        this.i5 = this.i4 + this.i3;
                        this.i5 = li8(this.i5);
                        this.i6 = this.i0 + this.i3;
                        si8(this.i5,this.i6);
                        this.i3 = this.i3 + 1;
                        if(this.i5 != 0)
                        {
                           continue;
                        }
                        break;
                     }
                  }
                  if(this.i2 != 0)
                  {
                     §§goto(addr2105);
                  }
                  else
                  {
                     §§goto(addr2054);
                  }
               }
            case 7:
               while(true)
               {
                  this.i0 = mstate.eax;
                  mstate.esp = mstate.esp + 12;
                  this.i0 = li8(this.i3);
                  if(this.i0 != 47)
                  {
                     this.i0 = this.i3;
                  }
                  else
                  {
                     this.i0 = this.i6;
                     do
                     {
                        this.i3 = li8(this.i0 + 1);
                        this.i6 = this.i0 + 1;
                        this.i0 = this.i6;
                     }
                     while(this.i3 == 47);
                     
                     this.i0 = this.i6;
                     this.i3 = this.i6;
                  }
                  while(true)
                  {
                     this.i6 = li8(this.i3);
                     this.i7 = this.i3;
                     if(this.i6 != 0)
                     {
                        this.i6 = this.i6 & 255;
                        if(this.i6 == 47)
                        {
                           break;
                        }
                        this.i3 = this.i3 + 1;
                        continue;
                     }
                     break;
                  }
                  this.i3 = li8(this.i0);
                  if(this.i3 != 0)
                  {
                     this.i3 = this.i4 + 32;
                     this.i5 = this.i5 + 1;
                     this.i4 = this.i3;
                     this.i3 = this.i7;
                     §§goto(addr1718);
                  }
                  else
                  {
                     this.i0 = this.i5 + 2;
                  }
                  §§goto(addr2041);
               }
            case 8:
               break;
            case 9:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 4;
               break;
            case 10:
               this.i4 = mstate.eax;
               mstate.esp = mstate.esp + 4;
               this.i5 = this.i5 + 32;
               this.i3 = this.i3 + 1;
               if(this.i4 != 0)
               {
                  this.i4 = this.i5;
                  §§goto(addr2071);
               }
               else
               {
                  this.i0 = li32(FSM_os_setlocale);
                  if(this.i3 >= 2)
                  {
                     this.i4 = FSM_os_setlocale;
                     this.i2 = FSM_os_setlocale;
                     this.i5 = 0;
                     this.i6 = this.i4 + 32;
                     this.i7 = this.i5;
                     addr2314:
                     this.i8 = this.i2 + this.i7;
                     this.i8 = li8(this.i8 + 32);
                     this.i9 = this.i4 + this.i7;
                     si8(this.i8,this.i9 + 32);
                     this.i9 = this.i6 + this.i7;
                     this.i10 = this.i5 + 1;
                     if(this.i8 != 0)
                     {
                        this.i8 = FSM_os_setlocale;
                        this.i11 = FSM_os_setlocale;
                        this.i12 = this.i7 + 33;
                        while(true)
                        {
                           this.i13 = this.i8 + this.i12;
                           this.i13 = li8(this.i13);
                           this.i14 = this.i11 + this.i12;
                           si8(this.i13,this.i14);
                           this.i12 = this.i12 + 1;
                           if(this.i13 != 0)
                           {
                              continue;
                           }
                           break;
                        }
                     }
                     mstate.esp = mstate.esp - 4;
                     si32(this.i10,mstate.esp);
                     state = 11;
                     mstate.esp = mstate.esp - 4;
                     FSM_os_setlocale.start();
                     return;
                  }
                  addr2529:
                  this.i3 = 0;
                  si32(this.i0,FSM_os_setlocale);
                  this.i0 = this.i3;
                  break;
               }
            case 11:
               this.i8 = mstate.eax;
               mstate.esp = mstate.esp + 4;
               if(this.i8 == 0)
               {
                  this.i8 = 67;
                  this.i11 = 0;
                  si8(this.i8,this.i9);
                  si8(this.i11,this.i9 + 1);
                  mstate.esp = mstate.esp - 4;
                  si32(this.i10,mstate.esp);
                  state = 12;
                  mstate.esp = mstate.esp - 4;
                  FSM_os_setlocale.start();
                  return;
               }
               addr2504:
               this.i7 = this.i7 + 32;
               this.i5 = this.i5 + 1;
               this.i8 = this.i3 + -1;
               if(this.i5 != this.i8)
               {
                  §§goto(addr2314);
               }
               else
               {
                  §§goto(addr2529);
               }
            case 12:
               this.i8 = mstate.eax;
               mstate.esp = mstate.esp + 4;
               §§goto(addr2504);
            case 13:
               mstate.esp = mstate.esp + 8;
               mstate.eax = this.i2;
               mstate.esp = mstate.ebp;
               mstate.ebp = li32(mstate.esp);
               mstate.esp = mstate.esp + 4;
               mstate.esp = mstate.esp + 4;
               mstate.gworker = caller;
               return;
         }
         this.i2 = 1;
         mstate.esp = mstate.esp - 8;
         si32(this.i1,mstate.esp);
         si32(this.i0,mstate.esp + 4);
         state = 13;
         mstate.esp = mstate.esp - 4;
         FSM_os_setlocale.start();
      }
   }
}
