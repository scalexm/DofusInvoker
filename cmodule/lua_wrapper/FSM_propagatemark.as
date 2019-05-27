package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.li8;
   import avm2.intrinsics.memory.si32;
   import avm2.intrinsics.memory.si8;
   
   public final class FSM_propagatemark extends Machine
   {
      
      public static const intRegCount:int = 11;
      
      public static const NumberRegCount:int = 0;
       
      
      public var i10:int;
      
      public var i0:int;
      
      public var i1:int;
      
      public var i2:int;
      
      public var i3:int;
      
      public var i4:int;
      
      public var i5:int;
      
      public var i6:int;
      
      public var i8:int;
      
      public var i7:int;
      
      public var i9:int;
      
      public function FSM_propagatemark()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM_propagatemark = null;
         _loc1_ = new FSM_propagatemark();
         FSM_propagatemark.gworker = _loc1_;
      }
      
      override public final function work() : void
      {
         loop32:
         switch(state)
         {
            case 0:
               mstate.esp = mstate.esp - 4;
               si32(mstate.ebp,mstate.esp);
               mstate.ebp = mstate.esp;
               mstate.esp = mstate.esp - 0;
               this.i0 = li32(mstate.ebp + 8);
               this.i1 = li32(this.i0 + 36);
               this.i2 = li8(this.i1 + 5);
               this.i2 = this.i2 | 4;
               si8(this.i2,this.i1 + 5);
               this.i2 = li8(this.i1 + 4);
               this.i3 = this.i1 + 5;
               this.i4 = this.i0 + 36;
               if(this.i2 <= 7)
               {
                  if(this.i2 != 5)
                  {
                     if(this.i2 != 6)
                     {
                        addr2849:
                        this.i0 = 0;
                     }
                     else
                     {
                        this.i3 = li32(this.i1 + 8);
                        si32(this.i3,this.i4);
                        this.i3 = li32(this.i1 + 12);
                        this.i4 = li8(this.i3 + 5);
                        this.i2 = this.i1 + 6;
                        this.i5 = this.i1;
                        this.i6 = this.i1;
                        this.i4 = this.i4 & 3;
                        if(this.i4 != 0)
                        {
                           mstate.esp = mstate.esp - 8;
                           si32(this.i0,mstate.esp);
                           si32(this.i3,mstate.esp + 4);
                           mstate.esp = mstate.esp - 4;
                           FSM_propagatemark.start();
                        }
                        else
                        {
                           this.i3 = li8(this.i2);
                           if(this.i3 != 0)
                           {
                              addr191:
                              this.i4 = li8(this.i6 + 7);
                              this.i3 = this.i6 + 7;
                              if(this.i4 >= 1)
                              {
                                 this.i4 = 0;
                                 loop11:
                                 while(true)
                                 {
                                    this.i7 = li32(this.i5 + 28);
                                    if(this.i7 >= 4)
                                    {
                                       this.i7 = li32(this.i5 + 20);
                                       this.i8 = li8(this.i7 + 5);
                                       this.i8 = this.i8 & 3;
                                       if(this.i8 != 0)
                                       {
                                          mstate.esp = mstate.esp - 8;
                                          si32(this.i0,mstate.esp);
                                          si32(this.i7,mstate.esp + 4);
                                          mstate.esp = mstate.esp - 4;
                                          FSM_propagatemark.start();
                                       }
                                    }
                                    addr284:
                                    while(true)
                                    {
                                       this.i7 = li8(this.i3);
                                       this.i5 = this.i5 + 12;
                                       this.i4 = this.i4 + 1;
                                       if(this.i7 > this.i4)
                                       {
                                          continue loop11;
                                       }
                                       break loop11;
                                    }
                                    this.i0 = li8(this.i1 + 7);
                                    this.i0 = this.i0 << 2;
                                    this.i0 = this.i0 + 20;
                                    break loop32;
                                 }
                              }
                           }
                           addr1668:
                           this.i0 = li8(this.i2);
                           if(this.i0 != 0)
                           {
                              this.i0 = li8(this.i6 + 7);
                              this.i0 = this.i0 * 12;
                           }
                           else
                           {
                              §§goto(addr1730);
                           }
                           §§goto(addr1693);
                        }
                        addr1493:
                        this.i3 = li32(this.i1 + 16);
                        this.i4 = li8(this.i3 + 5);
                        this.i5 = this.i1;
                        this.i4 = this.i4 & 3;
                        if(this.i4 == 0)
                        {
                           this.i3 = 0;
                           loop12:
                           while(true)
                           {
                              this.i4 = li8(this.i5 + 7);
                              if(this.i4 > this.i3)
                              {
                                 addr1577:
                                 while(true)
                                 {
                                    this.i4 = this.i3 << 2;
                                    this.i4 = this.i5 + this.i4;
                                    this.i4 = li32(this.i4 + 20);
                                    this.i7 = li8(this.i4 + 5);
                                    this.i7 = this.i7 & 3;
                                    if(this.i7 != 0)
                                    {
                                       mstate.esp = mstate.esp - 8;
                                       si32(this.i0,mstate.esp);
                                       si32(this.i4,mstate.esp + 4);
                                       mstate.esp = mstate.esp - 4;
                                       FSM_propagatemark.start();
                                    }
                                    addr1648:
                                    while(true)
                                    {
                                       this.i3 = this.i3 + 1;
                                       continue loop12;
                                    }
                                 }
                              }
                           }
                        }
                        else
                        {
                           mstate.esp = mstate.esp - 8;
                           si32(this.i0,mstate.esp);
                           si32(this.i3,mstate.esp + 4);
                           mstate.esp = mstate.esp - 4;
                           FSM_propagatemark.start();
                        }
                        §§goto(addr1668);
                     }
                  }
                  else
                  {
                     this.i2 = li32(this.i1 + 24);
                     si32(this.i2,this.i4);
                     this.i4 = li32(this.i1 + 8);
                     this.i2 = this.i1 + 8;
                     this.i5 = this.i1 + 24;
                     this.i6 = this.i1;
                     if(this.i4 != 0)
                     {
                        this.i7 = li8(this.i4 + 5);
                        this.i7 = this.i7 & 3;
                        if(this.i7 != 0)
                        {
                           mstate.esp = mstate.esp - 8;
                           si32(this.i0,mstate.esp);
                           si32(this.i4,mstate.esp + 4);
                           mstate.esp = mstate.esp - 4;
                           FSM_propagatemark.start();
                        }
                     }
                     addr600:
                     this.i4 = li32(this.i2);
                     if(this.i4 != 0)
                     {
                        this.i2 = li8(this.i4 + 6);
                        this.i2 = this.i2 & 8;
                        if(this.i2 == 0)
                        {
                           this.i2 = 3;
                           this.i7 = li32(this.i0 + 180);
                           mstate.esp = mstate.esp - 12;
                           si32(this.i4,mstate.esp);
                           si32(this.i2,mstate.esp + 4);
                           si32(this.i7,mstate.esp + 8);
                           mstate.esp = mstate.esp - 4;
                           FSM_propagatemark.start();
                        }
                        addr690:
                        if(this.i4 != 0)
                        {
                           this.i2 = li32(this.i4 + 8);
                           if(this.i2 == 4)
                           {
                              this.i4 = li32(this.i4);
                              this.i2 = li8(this.i4 + 16);
                              this.i4 = this.i4 + 16;
                              this.i7 = this.i4;
                              if(this.i2 != 107)
                              {
                                 this.i8 = this.i4;
                                 while(true)
                                 {
                                    this.i9 = li8(this.i8);
                                    if(this.i9 == 0)
                                    {
                                       this.i8 = 0;
                                       break;
                                    }
                                    this.i9 = li8(this.i8 + 1);
                                    this.i8 = this.i8 + 1;
                                    this.i10 = this.i8;
                                    if(this.i9 != 107)
                                    {
                                       this.i8 = this.i10;
                                       continue;
                                    }
                                    break;
                                 }
                              }
                              else
                              {
                                 this.i8 = this.i7;
                              }
                              this.i9 = this.i8 != 0?1:0;
                              this.i9 = this.i9 & 1;
                              this.i2 = this.i2 & 255;
                              if(this.i2 != 118)
                              {
                                 while(true)
                                 {
                                    this.i2 = li8(this.i4);
                                    if(this.i2 == 0)
                                    {
                                       this.i4 = 0;
                                       break;
                                    }
                                    this.i2 = li8(this.i4 + 1);
                                    this.i4 = this.i4 + 1;
                                    this.i7 = this.i4;
                                    if(this.i2 != 118)
                                    {
                                       this.i4 = this.i7;
                                       continue;
                                    }
                                    break;
                                 }
                              }
                              else
                              {
                                 this.i4 = this.i7;
                              }
                              this.i2 = this.i4 != 0?1:0;
                              this.i2 = this.i2 & 1;
                              if(this.i4 == 0)
                              {
                                 if(this.i8 == 0)
                                 {
                                    this.i1 = this.i2;
                                    this.i4 = this.i9;
                                 }
                              }
                              this.i4 = li8(this.i6 + 5);
                              this.i7 = this.i2 << 4;
                              this.i8 = this.i9 << 3;
                              this.i4 = this.i4 & -25;
                              this.i7 = this.i7 | this.i8;
                              this.i4 = this.i4 | this.i7;
                              si8(this.i4,this.i6 + 5);
                              this.i4 = li32(this.i0 + 44);
                              si32(this.i4,this.i5);
                              si32(this.i1,this.i0 + 44);
                              this.i1 = this.i2;
                              this.i4 = this.i9;
                           }
                           addr938:
                           if(this.i4 != 0)
                           {
                              if(this.i1 == 0)
                              {
                              }
                              addr1422:
                              this.i0 = li8(this.i3);
                              this.i0 = this.i0 & -5;
                              addr1438:
                              si8(this.i0,this.i3);
                              this.i0 = 28;
                              this.i1 = li32(this.i6 + 28);
                              this.i3 = li8(this.i6 + 7);
                              this.i0 = this.i0 << this.i3;
                              this.i1 = this.i1 * 12;
                              this.i0 = this.i1 + this.i0;
                              this.i0 = this.i0 + 32;
                              break;
                           }
                           if(this.i1 == 0)
                           {
                              this.i2 = li32(this.i6 + 28);
                              if(this.i2 != 0)
                              {
                                 this.i5 = 0;
                                 this.i7 = this.i2 * 12;
                                 this.i8 = this.i6 + 12;
                                 loop9:
                                 while(true)
                                 {
                                    this.i9 = li32(this.i8);
                                    this.i10 = this.i9 + this.i7;
                                    this.i10 = li32(this.i10 + -4);
                                    if(this.i10 >= 4)
                                    {
                                       this.i9 = this.i9 + this.i7;
                                       this.i9 = li32(this.i9 + -12);
                                       this.i10 = li8(this.i9 + 5);
                                       this.i10 = this.i10 & 3;
                                       if(this.i10 != 0)
                                       {
                                          mstate.esp = mstate.esp - 8;
                                          si32(this.i0,mstate.esp);
                                          si32(this.i9,mstate.esp + 4);
                                          mstate.esp = mstate.esp - 4;
                                          FSM_propagatemark.start();
                                       }
                                    }
                                    addr1073:
                                    while(true)
                                    {
                                       this.i7 = this.i7 + -12;
                                       this.i5 = this.i5 + 1;
                                       if(this.i5 != this.i2)
                                       {
                                          continue loop9;
                                       }
                                       break loop9;
                                    }
                                 }
                              }
                           }
                           this.i2 = 1;
                           this.i5 = li8(this.i6 + 7);
                           this.i2 = this.i2 << this.i5;
                           this.i5 = this.i2 + -1;
                           if(this.i2 != 0)
                           {
                              this.i2 = this.i6 + 16;
                              loop10:
                              while(true)
                              {
                                 this.i7 = li32(this.i2);
                                 this.i8 = this.i5 * 28;
                                 this.i8 = this.i7 + this.i8;
                                 this.i9 = li32(this.i8 + 8);
                                 this.i10 = this.i8 + 8;
                                 if(this.i9 == 0)
                                 {
                                    this.i8 = this.i5 * 28;
                                    this.i7 = this.i7 + this.i8;
                                    this.i8 = li32(this.i7 + 20);
                                    this.i7 = this.i7 + 20;
                                    if(this.i8 >= 4)
                                    {
                                       this.i8 = 11;
                                       si32(this.i8,this.i7);
                                    }
                                    this.i7 = this.i5 + -1;
                                    if(this.i5 != 0)
                                    {
                                       this.i5 = this.i7;
                                    }
                                    else
                                    {
                                       break;
                                    }
                                 }
                                 else
                                 {
                                    if(this.i4 == 0)
                                    {
                                       this.i9 = this.i5 * 28;
                                       this.i9 = this.i7 + this.i9;
                                       this.i9 = li32(this.i9 + 20);
                                       if(this.i9 >= 4)
                                       {
                                          this.i9 = this.i5 * 28;
                                          this.i7 = this.i7 + this.i9;
                                          this.i7 = li32(this.i7 + 12);
                                          this.i9 = li8(this.i7 + 5);
                                          this.i9 = this.i9 & 3;
                                          if(this.i9 != 0)
                                          {
                                             mstate.esp = mstate.esp - 8;
                                             si32(this.i0,mstate.esp);
                                             si32(this.i7,mstate.esp + 4);
                                             mstate.esp = mstate.esp - 4;
                                             FSM_propagatemark.start();
                                          }
                                       }
                                    }
                                    addr1322:
                                    while(true)
                                    {
                                       if(this.i1 == 0)
                                       {
                                          this.i7 = li32(this.i10);
                                          if(this.i7 >= 4)
                                          {
                                             this.i7 = li32(this.i8);
                                             this.i8 = li8(this.i7 + 5);
                                             this.i8 = this.i8 & 3;
                                             if(this.i8 != 0)
                                             {
                                                mstate.esp = mstate.esp - 8;
                                                si32(this.i0,mstate.esp);
                                                si32(this.i7,mstate.esp + 4);
                                                mstate.esp = mstate.esp - 4;
                                                FSM_propagatemark.start();
                                             }
                                          }
                                       }
                                       addr1394:
                                       while(true)
                                       {
                                          this.i7 = this.i5 + -1;
                                          if(this.i5 != 0)
                                          {
                                             this.i5 = this.i7;
                                          }
                                          else
                                          {
                                             break loop10;
                                          }
                                       }
                                    }
                                 }
                                 while(true)
                                 {
                                    continue loop10;
                                 }
                              }
                           }
                           this.i0 = this.i4 | this.i1;
                           if(this.i0 != 0)
                           {
                              §§goto(addr1422);
                           }
                           §§goto(addr1438);
                        }
                        this.i4 = 0;
                        this.i1 = this.i4;
                        §§goto(addr938);
                     }
                     this.i4 = 0;
                     §§goto(addr690);
                  }
               }
               else if(this.i2 != 8)
               {
                  if(this.i2 != 9)
                  {
                     §§goto(addr2849);
                  }
                  else
                  {
                     this.i2 = li32(this.i1 + 68);
                     si32(this.i2,this.i4);
                     this.i2 = li32(this.i1 + 32);
                     if(this.i2 != 0)
                     {
                        this.i3 = li8(this.i2 + 5);
                        this.i3 = this.i3 & -4;
                        si8(this.i3,this.i2 + 5);
                        this.i2 = li32(this.i1 + 40);
                        if(this.i2 >= 1)
                        {
                           addr377:
                           this.i2 = 0;
                           this.i3 = this.i1 + 40;
                           this.i4 = this.i1 + 8;
                           this.i5 = this.i2;
                           loop3:
                           while(true)
                           {
                              this.i6 = li32(this.i4);
                              this.i7 = this.i6 + this.i5;
                              this.i7 = li32(this.i7 + 8);
                              if(this.i7 >= 4)
                              {
                                 this.i6 = this.i6 + this.i5;
                                 this.i6 = li32(this.i6);
                                 this.i7 = li8(this.i6 + 5);
                                 this.i7 = this.i7 & 3;
                                 if(this.i7 != 0)
                                 {
                                    mstate.esp = mstate.esp - 8;
                                    si32(this.i0,mstate.esp);
                                    si32(this.i6,mstate.esp + 4);
                                    mstate.esp = mstate.esp - 4;
                                    FSM_propagatemark.start();
                                 }
                              }
                              addr485:
                              while(true)
                              {
                                 this.i6 = li32(this.i3);
                                 this.i5 = this.i5 + 12;
                                 this.i2 = this.i2 + 1;
                                 if(this.i6 > this.i2)
                                 {
                                    continue loop3;
                                 }
                                 break loop3;
                              }
                           }
                        }
                     }
                     else
                     {
                        this.i2 = li32(this.i1 + 40);
                        if(this.i2 > 0)
                        {
                           §§goto(addr377);
                        }
                     }
                     this.i2 = li32(this.i1 + 36);
                     this.i4 = this.i1 + 36;
                     if(this.i2 >= 1)
                     {
                        this.i5 = 0;
                        this.i3 = this.i1 + 28;
                        this.i2 = this.i5;
                        while(true)
                        {
                           this.i6 = li32(this.i3);
                           this.i6 = this.i6 + this.i2;
                           this.i6 = li32(this.i6);
                           if(this.i6 != 0)
                           {
                              this.i7 = li8(this.i6 + 5);
                              this.i7 = this.i7 & -4;
                              si8(this.i7,this.i6 + 5);
                           }
                           this.i6 = li32(this.i4);
                           this.i2 = this.i2 + 4;
                           this.i5 = this.i5 + 1;
                           if(this.i6 > this.i5)
                           {
                              continue;
                           }
                           break;
                        }
                     }
                     this.i2 = li32(this.i1 + 52);
                     this.i3 = this.i1 + 52;
                     if(this.i2 >= 1)
                     {
                        this.i2 = 0;
                        this.i5 = this.i1 + 16;
                        this.i6 = this.i2;
                        loop5:
                        while(true)
                        {
                           this.i7 = li32(this.i5);
                           this.i7 = this.i7 + this.i6;
                           this.i7 = li32(this.i7);
                           if(this.i7 != 0)
                           {
                              this.i8 = li8(this.i7 + 5);
                              this.i8 = this.i8 & 3;
                              if(this.i8 != 0)
                              {
                                 mstate.esp = mstate.esp - 8;
                                 si32(this.i0,mstate.esp);
                                 si32(this.i7,mstate.esp + 4);
                                 mstate.esp = mstate.esp - 4;
                                 FSM_propagatemark.start();
                              }
                           }
                           addr2600:
                           while(true)
                           {
                              this.i7 = li32(this.i3);
                              this.i6 = this.i6 + 4;
                              this.i2 = this.i2 + 1;
                              if(this.i7 > this.i2)
                              {
                                 continue loop5;
                              }
                              break loop5;
                           }
                           this.i2 = 0;
                           this.i5 = this.i1 + 24;
                           this.i6 = this.i2;
                           do
                           {
                              this.i7 = li32(this.i5);
                              this.i7 = this.i7 + this.i6;
                              this.i7 = li32(this.i7);
                              if(this.i7 != 0)
                              {
                                 this.i8 = li8(this.i7 + 5);
                                 this.i8 = this.i8 & -4;
                                 si8(this.i8,this.i7 + 5);
                              }
                              this.i7 = li32(this.i0);
                              this.i6 = this.i6 + 12;
                              this.i2 = this.i2 + 1;
                           }
                           while(this.i7 > this.i2);
                           
                           this.i2 = this.i7;
                           this.i0 = this.i2;
                           this.i2 = li32(this.i1 + 44);
                           this.i3 = li32(this.i3);
                           this.i5 = li32(this.i1 + 40);
                           this.i1 = li32(this.i1 + 48);
                           this.i2 = this.i3 + this.i2;
                           this.i3 = li32(this.i4);
                           this.i1 = this.i2 + this.i1;
                           this.i0 = this.i5 + this.i0;
                           this.i1 = this.i1 + this.i3;
                           this.i0 = this.i0 * 3;
                           this.i0 = this.i1 + this.i0;
                           this.i0 = this.i0 << 2;
                           this.i0 = this.i0 + 76;
                        }
                     }
                     this.i2 = li32(this.i1 + 56);
                     this.i0 = this.i1 + 56;
                     if(this.i2 > 0)
                     {
                        §§goto(addr2656);
                     }
                     §§goto(addr2760);
                  }
               }
               else
               {
                  this.i2 = li32(this.i1 + 100);
                  si32(this.i2,this.i4);
                  this.i4 = li32(this.i0 + 40);
                  si32(this.i4,this.i1 + 100);
                  si32(this.i1,this.i0 + 40);
                  this.i4 = li8(this.i3);
                  this.i4 = this.i4 & -5;
                  si8(this.i4,this.i3);
                  this.i4 = li32(this.i1 + 80);
                  this.i2 = this.i1;
                  if(this.i4 >= 4)
                  {
                     this.i4 = li32(this.i1 + 72);
                     this.i3 = li8(this.i4 + 5);
                     this.i3 = this.i3 & 3;
                     if(this.i3 != 0)
                     {
                        mstate.esp = mstate.esp - 8;
                        si32(this.i0,mstate.esp);
                        si32(this.i4,mstate.esp + 4);
                        mstate.esp = mstate.esp - 4;
                        FSM_propagatemark.start();
                     }
                     addr2040:
                     loop0:
                     while(true)
                     {
                        this.i5 = li32(this.i1 + 20);
                        if(uint(this.i5) >= uint(this.i3))
                        {
                           addr1900:
                           while(true)
                           {
                              this.i5 = li32(this.i3 + 8);
                              this.i4 = uint(this.i5) > uint(this.i4)?int(this.i5):int(this.i4);
                              this.i3 = this.i3 + 24;
                              continue loop0;
                           }
                        }
                        else
                        {
                           break;
                        }
                     }
                     this.i3 = li32(this.i1 + 32);
                     this.i5 = li32(this.i1 + 8);
                     this.i6 = this.i1 + 8;
                     this.i7 = this.i1 + 32;
                     this.i8 = this.i3;
                     if(uint(this.i5) <= uint(this.i3))
                     {
                        this.i0 = this.i8;
                     }
                     else
                     {
                        loop1:
                        while(true)
                        {
                           this.i5 = li32(this.i3 + 8);
                           this.i8 = this.i3;
                           if(this.i5 >= 4)
                           {
                              this.i5 = li32(this.i8);
                              this.i8 = li8(this.i5 + 5);
                              this.i8 = this.i8 & 3;
                              if(this.i8 != 0)
                              {
                                 mstate.esp = mstate.esp - 8;
                                 si32(this.i0,mstate.esp);
                                 si32(this.i5,mstate.esp + 4);
                                 mstate.esp = mstate.esp - 4;
                                 FSM_propagatemark.start();
                              }
                           }
                           addr2131:
                           while(true)
                           {
                              this.i5 = li32(this.i6);
                              this.i3 = this.i3 + 12;
                              this.i8 = this.i3;
                              if(uint(this.i5) <= uint(this.i3))
                              {
                                 break loop1;
                              }
                              continue loop1;
                           }
                        }
                        this.i0 = this.i8;
                     }
                     this.i3 = this.i0;
                     if(uint(this.i0) <= uint(this.i4))
                     {
                        this.i0 = this.i3;
                        while(true)
                        {
                           this.i3 = 0;
                           si32(this.i3,this.i0 + 8);
                           this.i0 = this.i0 + 12;
                           if(uint(this.i0) <= uint(this.i4))
                           {
                              continue;
                           }
                           break;
                        }
                     }
                     this.i0 = li32(this.i7);
                     this.i3 = li32(this.i1 + 48);
                     this.i0 = this.i4 - this.i0;
                     this.i4 = this.i1 + 48;
                     this.i0 = this.i0 / 12;
                     if(this.i3 <= 20000)
                     {
                        this.i5 = li32(this.i1 + 20);
                        this.i6 = li32(this.i1 + 40);
                        this.i5 = this.i5 - this.i6;
                        this.i5 = this.i5 / 24;
                        this.i5 = this.i5 << 2;
                        if(this.i5 < this.i3)
                        {
                           if(this.i3 >= 17)
                           {
                              this.i5 = this.i3 >>> 31;
                              this.i3 = this.i3 + this.i5;
                              mstate.esp = mstate.esp - 8;
                              this.i3 = this.i3 >> 1;
                              si32(this.i2,mstate.esp);
                              si32(this.i3,mstate.esp + 4);
                              state = 13;
                              mstate.esp = mstate.esp - 4;
                              FSM_propagatemark.start();
                              return;
                           }
                        }
                        addr2297:
                        this.i3 = li32(this.i1 + 44);
                        this.i0 = this.i0 << 2;
                        if(this.i0 < this.i3)
                        {
                           if(this.i3 >= 91)
                           {
                              this.i0 = this.i3 >>> 31;
                              this.i0 = this.i3 + this.i0;
                              mstate.esp = mstate.esp - 8;
                              this.i0 = this.i0 >> 1;
                              si32(this.i2,mstate.esp);
                              si32(this.i0,mstate.esp + 4);
                              state = 14;
                              mstate.esp = mstate.esp - 4;
                              FSM_propagatemark.start();
                              return;
                           }
                        }
                     }
                     this.i0 = li32(this.i1 + 44);
                     this.i1 = li32(this.i4);
                     this.i1 = this.i1 * 24;
                     this.i0 = this.i0 * 12;
                     this.i0 = this.i0 + this.i1;
                     this.i0 = this.i0 + 112;
                  }
                  this.i4 = li32(this.i1 + 8);
                  this.i3 = li32(this.i1 + 40);
                  §§goto(addr2040);
               }
               break;
            case 1:
               mstate.esp = mstate.esp + 8;
               this.i3 = li8(this.i2);
               if(this.i3 != 0)
               {
                  §§goto(addr191);
               }
               else
               {
                  §§goto(addr1493);
               }
               §§goto(addr1668);
            case 2:
               while(true)
               {
                  mstate.esp = mstate.esp + 8;
                  §§goto(addr284);
               }
            case 3:
               while(true)
               {
                  mstate.esp = mstate.esp + 8;
                  §§goto(addr485);
               }
            case 4:
               mstate.esp = mstate.esp + 8;
               §§goto(addr600);
            case 5:
               this.i4 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               §§goto(addr690);
            case 6:
               while(true)
               {
                  mstate.esp = mstate.esp + 8;
                  §§goto(addr1073);
               }
            case 7:
               while(true)
               {
                  mstate.esp = mstate.esp + 8;
                  §§goto(addr1322);
               }
            case 8:
               while(true)
               {
                  mstate.esp = mstate.esp + 8;
                  §§goto(addr1394);
               }
            case 9:
               mstate.esp = mstate.esp + 8;
               this.i3 = li8(this.i5 + 7);
               if(this.i3 >= 1)
               {
                  this.i3 = 0;
                  §§goto(addr1577);
               }
               §§goto(addr1668);
            case 10:
               while(true)
               {
                  mstate.esp = mstate.esp + 8;
                  §§goto(addr1648);
               }
            case 11:
               mstate.esp = mstate.esp + 8;
               this.i4 = li32(this.i1 + 8);
               this.i3 = li32(this.i1 + 40);
               this.i5 = li32(this.i1 + 20);
               if(uint(this.i5) >= uint(this.i3))
               {
                  §§goto(addr1900);
               }
               §§goto(addr1933);
            case 12:
               while(true)
               {
                  mstate.esp = mstate.esp + 8;
                  §§goto(addr2131);
               }
            case 13:
               mstate.esp = mstate.esp + 8;
               §§goto(addr2297);
            case 14:
               mstate.esp = mstate.esp + 8;
               §§goto(addr2377);
            case 15:
               while(true)
               {
                  mstate.esp = mstate.esp + 8;
                  §§goto(addr2600);
               }
         }
         mstate.eax = this.i0;
         mstate.esp = mstate.ebp;
         mstate.ebp = li32(mstate.esp);
         mstate.esp = mstate.esp + 4;
         mstate.esp = mstate.esp + 4;
         mstate.gworker = caller;
      }
   }
}
