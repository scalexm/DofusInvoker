package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.li8;
   import avm2.intrinsics.memory.si32;
   import avm2.intrinsics.memory.si8;
   
   public final class FSM_loadlocale extends Machine
   {
      
      public static const intRegCount:int = 10;
      
      public static const NumberRegCount:int = 0;
       
      
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
      
      public function FSM_loadlocale()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM_loadlocale = null;
         _loc1_ = new FSM_loadlocale();
         FSM_loadlocale.gworker = _loc1_;
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
               this.i0 = FSM_loadlocale;
               this.i2 = li32(mstate.ebp + 8);
               this.i1 = this.i2 << 5;
               this.i3 = FSM_loadlocale;
               this.i4 = this.i0 + this.i1;
               this.i0 = li8(this.i4);
               this.i3 = this.i3 + this.i1;
               if(this.i0 != 46)
               {
                  this.i0 = this.i0 & 255;
                  if(this.i0 == 47)
                  {
                     addr85:
                     this.i0 = this.i4;
                  }
                  else
                  {
                     addr195:
                     this.i0 = FSM_loadlocale;
                     this.i1 = this.i2 << 5;
                     this.i0 = this.i0 + this.i1;
                     while(true)
                     {
                        this.i1 = li8(this.i0);
                        if(this.i1 == 0)
                        {
                           this.i0 = 0;
                           break;
                        }
                        this.i1 = li8(this.i0 + 1);
                        this.i0 = this.i0 + 1;
                        this.i5 = this.i0;
                        if(this.i1 != 47)
                        {
                           this.i0 = this.i5;
                           continue;
                        }
                        break;
                     }
                  }
                  addr91:
                  addr1441:
                  if(this.i0 != 0)
                  {
                     addr98:
                     this.i2 = 22;
                     si32(this.i2,FSM_loadlocale);
                     this.i2 = 0;
                     mstate.eax = this.i2;
                  }
                  else
                  {
                     this.i5 = li32(FSM_loadlocale);
                     this.i0 = li32(FSM_loadlocale);
                     if(this.i0 != 0)
                     {
                        addr273:
                        this.i0 = 0;
                     }
                     else
                     {
                        this.i0 = FSM_loadlocale;
                        mstate.esp = mstate.esp - 4;
                        si32(this.i0,mstate.esp);
                        mstate.esp = mstate.esp - 4;
                        FSM_loadlocale.start();
                     }
                     addr483:
                     si32(this.i0,FSM_loadlocale);
                     if(this.i0 != 0)
                     {
                        break;
                     }
                     si32(this.i5,FSM_loadlocale);
                     if(this.i2 <= 3)
                     {
                        if(this.i2 != 1)
                        {
                           if(this.i2 != 2)
                           {
                              if(this.i2 == 3)
                              {
                                 this.i0 = li8(this.i4);
                                 this.i1 = li8(this.i3);
                                 if(this.i0 != this.i1)
                                 {
                                    this.i1 = this.i3;
                                    addr1066:
                                    this.i1 = li8(this.i1);
                                    this.i0 = this.i0 & 255;
                                    if(this.i0 != this.i1)
                                    {
                                       this.i0 = FSM_loadlocale;
                                       addr1320:
                                       mstate.esp = mstate.esp - 4;
                                       si32(this.i4,mstate.esp);
                                       state = 2;
                                       mstate.esp = mstate.esp - 4;
                                       mstate.funcs[this.i0]();
                                       return;
                                    }
                                 }
                                 else
                                 {
                                    this.i1 = FSM_loadlocale;
                                    this.i5 = FSM_loadlocale;
                                    this.i6 = this.i2 << 5;
                                    while(true)
                                    {
                                       this.i7 = this.i1 + this.i6;
                                       this.i7 = this.i7 + 1;
                                       this.i0 = this.i0 & 255;
                                       if(this.i0 != 0)
                                       {
                                          this.i0 = this.i5 + this.i6;
                                          this.i0 = li8(this.i0 + 1);
                                          this.i7 = li8(this.i7);
                                          this.i6 = this.i6 + 1;
                                          if(this.i0 == this.i7)
                                          {
                                             continue;
                                          }
                                          this.i1 = FSM_loadlocale;
                                          this.i1 = this.i1 + this.i6;
                                          §§goto(addr1066);
                                       }
                                    }
                                 }
                              }
                           }
                           else
                           {
                              this.i0 = li8(this.i4);
                              this.i1 = li8(this.i3);
                              if(this.i0 != this.i1)
                              {
                                 this.i1 = this.i3;
                                 addr1299:
                                 this.i1 = li8(this.i1);
                                 this.i0 = this.i0 & 255;
                                 if(this.i0 != this.i1)
                                 {
                                    this.i0 = FSM_loadlocale;
                                    §§goto(addr1320);
                                 }
                              }
                              else
                              {
                                 this.i1 = FSM_loadlocale;
                                 this.i5 = FSM_loadlocale;
                                 this.i6 = this.i2 << 5;
                                 while(true)
                                 {
                                    this.i7 = this.i1 + this.i6;
                                    this.i7 = this.i7 + 1;
                                    this.i0 = this.i0 & 255;
                                    if(this.i0 != 0)
                                    {
                                       this.i0 = this.i5 + this.i6;
                                       this.i0 = li8(this.i0 + 1);
                                       this.i7 = li8(this.i7);
                                       this.i6 = this.i6 + 1;
                                       if(this.i0 == this.i7)
                                       {
                                          continue;
                                       }
                                       this.i1 = FSM_loadlocale;
                                       this.i1 = this.i1 + this.i6;
                                       §§goto(addr1299);
                                    }
                                 }
                              }
                           }
                        }
                        else
                        {
                           this.i0 = li8(this.i4);
                           this.i1 = li8(this.i3);
                           if(this.i0 != this.i1)
                           {
                              this.i1 = this.i3;
                           }
                           else
                           {
                              this.i1 = FSM_loadlocale;
                              this.i5 = FSM_loadlocale;
                              this.i6 = this.i2 << 5;
                              while(true)
                              {
                                 this.i7 = this.i1 + this.i6;
                                 this.i7 = this.i7 + 1;
                                 this.i0 = this.i0 & 255;
                                 if(this.i0 == 0)
                                 {
                                    break;
                                 }
                                 this.i0 = this.i5 + this.i6;
                                 this.i0 = li8(this.i0 + 1);
                                 this.i7 = li8(this.i7);
                                 this.i6 = this.i6 + 1;
                                 if(this.i0 == this.i7)
                                 {
                                    continue;
                                 }
                                 this.i1 = FSM_loadlocale;
                                 this.i1 = this.i1 + this.i6;
                              }
                              this.i2 = this.i3;
                              this.i0 = this.i2;
                              mstate.eax = this.i0;
                           }
                           this.i1 = li8(this.i1);
                           this.i0 = this.i0 & 255;
                           if(this.i0 != this.i1)
                           {
                              this.i0 = FSM_loadlocale;
                              §§goto(addr1320);
                           }
                        }
                     }
                     else if(this.i2 != 4)
                     {
                        if(this.i2 != 5)
                        {
                           if(this.i2 == 6)
                           {
                              this.i0 = li8(this.i4);
                              this.i1 = li8(this.i3);
                              if(this.i0 != this.i1)
                              {
                                 this.i1 = this.i3;
                                 addr1172:
                                 this.i1 = li8(this.i1);
                                 this.i0 = this.i0 & 255;
                                 if(this.i0 != this.i1)
                                 {
                                    this.i0 = FSM_loadlocale;
                                    §§goto(addr1320);
                                 }
                              }
                              else
                              {
                                 this.i1 = FSM_loadlocale;
                                 this.i5 = FSM_loadlocale;
                                 this.i6 = this.i2 << 5;
                                 while(true)
                                 {
                                    this.i7 = this.i1 + this.i6;
                                    this.i7 = this.i7 + 1;
                                    this.i0 = this.i0 & 255;
                                    if(this.i0 != 0)
                                    {
                                       this.i0 = this.i5 + this.i6;
                                       this.i0 = li8(this.i0 + 1);
                                       this.i7 = li8(this.i7);
                                       this.i6 = this.i6 + 1;
                                       if(this.i0 == this.i7)
                                       {
                                          continue;
                                       }
                                       this.i1 = FSM_loadlocale;
                                       this.i1 = this.i1 + this.i6;
                                       §§goto(addr1172);
                                    }
                                 }
                              }
                           }
                        }
                        else
                        {
                           this.i0 = li8(this.i4);
                           this.i1 = li8(this.i3);
                           if(this.i0 != this.i1)
                           {
                              this.i1 = this.i3;
                              addr833:
                              this.i1 = li8(this.i1);
                              this.i0 = this.i0 & 255;
                              if(this.i0 != this.i1)
                              {
                                 this.i0 = FSM_loadlocale;
                                 §§goto(addr1320);
                              }
                           }
                           else
                           {
                              this.i1 = FSM_loadlocale;
                              this.i5 = FSM_loadlocale;
                              this.i6 = this.i2 << 5;
                              while(true)
                              {
                                 this.i7 = this.i1 + this.i6;
                                 this.i7 = this.i7 + 1;
                                 this.i0 = this.i0 & 255;
                                 if(this.i0 != 0)
                                 {
                                    this.i0 = this.i5 + this.i6;
                                    this.i0 = li8(this.i0 + 1);
                                    this.i7 = li8(this.i7);
                                    this.i6 = this.i6 + 1;
                                    if(this.i0 == this.i7)
                                    {
                                       continue;
                                    }
                                    this.i1 = FSM_loadlocale;
                                    this.i1 = this.i1 + this.i6;
                                    §§goto(addr833);
                                 }
                              }
                           }
                        }
                     }
                     else
                     {
                        this.i0 = li8(this.i4);
                        this.i1 = li8(this.i3);
                        if(this.i0 != this.i1)
                        {
                           this.i1 = this.i3;
                        }
                        else
                        {
                           this.i1 = FSM_loadlocale;
                           this.i5 = FSM_loadlocale;
                           this.i6 = this.i2 << 5;
                           while(true)
                           {
                              this.i7 = this.i1 + this.i6;
                              this.i7 = this.i7 + 1;
                              this.i0 = this.i0 & 255;
                              if(this.i0 != 0)
                              {
                                 this.i0 = this.i5 + this.i6;
                                 this.i0 = li8(this.i0 + 1);
                                 this.i7 = li8(this.i7);
                                 this.i6 = this.i6 + 1;
                                 if(this.i0 == this.i7)
                                 {
                                    continue;
                                 }
                                 this.i1 = FSM_loadlocale;
                                 this.i1 = this.i1 + this.i6;
                              }
                              break;
                           }
                        }
                        this.i1 = li8(this.i1);
                        this.i0 = this.i0 & 255;
                        if(this.i0 != this.i1)
                        {
                           this.i0 = FSM_loadlocale;
                           §§goto(addr1320);
                        }
                     }
                     §§goto(addr657);
                  }
                  mstate.esp = mstate.ebp;
                  mstate.ebp = li32(mstate.esp);
                  mstate.esp = mstate.esp + 4;
                  mstate.esp = mstate.esp + 4;
                  mstate.gworker = caller;
                  return;
               }
               this.i1 = FSM_loadlocale;
               this.i5 = this.i2 << 5;
               this.i1 = this.i1 + this.i5;
               this.i1 = li8(this.i1 + 1);
               if(this.i1 != 0)
               {
                  this.i1 = this.i1 & 255;
                  if(this.i1 == 46)
                  {
                     this.i1 = FSM_loadlocale;
                     this.i5 = this.i2 << 5;
                     this.i1 = this.i1 + this.i5;
                     this.i1 = li8(this.i1 + 2);
                     if(this.i1 != 0)
                     {
                     }
                  }
                  this.i0 = this.i0 & 255;
                  if(this.i0 != 47)
                  {
                     §§goto(addr195);
                  }
                  else
                  {
                     §§goto(addr85);
                  }
                  §§goto(addr91);
               }
               §§goto(addr98);
            case 1:
               this.i6 = mstate.eax;
               mstate.esp = mstate.esp + 4;
               this.i7 = this.i6;
               if(this.i6 != 0)
               {
                  this.i0 = FSM_loadlocale;
                  this.i1 = 4;
                  log(this.i1,mstate.gworker.stringFromPtr(this.i0));
                  this.i0 = li8(this.i6);
                  if(this.i0 != 0)
                  {
                     this.i1 = this.i7;
                     while(true)
                     {
                        this.i8 = li8(this.i1 + 1);
                        this.i1 = this.i1 + 1;
                        this.i9 = this.i1;
                        if(this.i8 != 0)
                        {
                           this.i1 = this.i9;
                           continue;
                        }
                        break;
                     }
                  }
                  else
                  {
                     this.i1 = this.i6;
                  }
                  this.i1 = this.i1 - this.i7;
                  this.i1 = this.i1 + 44;
                  if(uint(this.i1) >= uint(1024))
                  {
                     this.i0 = 63;
                  }
                  else
                  {
                     this.i0 = this.i0 & 255;
                     if(this.i0 != 0)
                     {
                        this.i0 = this.i7;
                        while(true)
                        {
                           this.i1 = li8(this.i0 + 1);
                           this.i0 = this.i0 + 1;
                           this.i8 = this.i0;
                           if(this.i1 != 0)
                           {
                              this.i0 = this.i8;
                              continue;
                           }
                           break;
                        }
                     }
                     else
                     {
                        this.i0 = this.i6;
                     }
                     this.i1 = 0;
                     this.i0 = this.i0 - this.i7;
                     mstate.esp = mstate.esp - 8;
                     this.i0 = this.i0 + 1;
                     si32(this.i1,mstate.esp);
                     si32(this.i0,mstate.esp + 4);
                     state = 3;
                     mstate.esp = mstate.esp - 4;
                     FSM_loadlocale.start();
                     return;
                  }
               }
               else
               {
                  this.i0 = FSM_loadlocale;
                  si32(this.i0,FSM_loadlocale);
                  this.i0 = 0;
               }
               §§goto(addr483);
            case 2:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 4;
               if(this.i0 != -1)
               {
                  this.i0 = li8(this.i4);
                  si8(this.i0,this.i3);
                  if(this.i0 != 0)
                  {
                     this.i0 = FSM_loadlocale;
                     this.i2 = this.i2 << 5;
                     this.i1 = FSM_loadlocale;
                     this.i2 = this.i2 | 1;
                     while(true)
                     {
                        this.i4 = this.i0 + this.i2;
                        this.i4 = li8(this.i4);
                        this.i5 = this.i1 + this.i2;
                        si8(this.i4,this.i5);
                        this.i2 = this.i2 + 1;
                        if(this.i4 != 0)
                        {
                           continue;
                        }
                        break;
                     }
                  }
                  mstate.eax = this.i3;
                  §§goto(addr1441);
               }
               else
               {
                  break;
               }
            case 3:
               this.i1 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               if(this.i1 == 0)
               {
                  this.i0 = 0;
               }
               else
               {
                  this.i7 = this.i1;
                  memcpy(this.i7,this.i6,this.i0);
                  this.i0 = this.i1;
               }
               si32(this.i0,FSM_loadlocale);
               if(this.i0 == 0)
               {
                  this.i0 = li32(FSM_loadlocale);
                  if(this.i0 == 0)
                  {
                     this.i0 = 12;
                  }
               }
               else
               {
                  §§goto(addr273);
               }
               §§goto(addr483);
         }
         this.i2 = 0;
         §§goto(addr500);
      }
   }
}
