package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.li8;
   import avm2.intrinsics.memory.sf64;
   import avm2.intrinsics.memory.si32;
   import avm2.intrinsics.memory.si8;
   import avm2.intrinsics.memory.sxi8;
   
   public final class FSM_lua_getinfo extends Machine
   {
      
      public static const intRegCount:int = 31;
      
      public static const NumberRegCount:int = 1;
       
      
      public var i21:int;
      
      public var i30:int;
      
      public var f0:Number;
      
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
      
      public var i26:int;
      
      public var i27:int;
      
      public var i20:int;
      
      public var i9:int;
      
      public var i28:int;
      
      public var i29:int;
      
      public function FSM_lua_getinfo()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM_lua_getinfo = null;
         _loc1_ = new FSM_lua_getinfo();
         FSM_lua_getinfo.gworker = _loc1_;
      }
      
      override public final function work() : void
      {
         switch(state)
         {
            case 0:
               mstate.esp = mstate.esp - 4;
               si32(mstate.ebp,mstate.esp);
               mstate.ebp = mstate.esp;
               mstate.esp = mstate.esp - 16;
               this.i0 = li32(mstate.ebp + 8);
               this.i1 = li32(mstate.ebp + 12);
               this.i2 = li32(mstate.ebp + 16);
               this.i3 = li8(this.i1);
               if(this.i3 == 62)
               {
                  this.i3 = li32(this.i0 + 8);
                  this.i4 = li32(this.i3 + -12);
                  this.i3 = this.i3 + -12;
                  si32(this.i3,this.i0 + 8);
                  this.i1 = this.i1 + 1;
                  if(this.i4 != 0)
                  {
                     this.i3 = 0;
                     this.i5 = this.i1;
                     addr166:
                     this.i6 = 1;
                     this.i7 = this.i3 + -20;
                     this.i8 = this.i3 + -12;
                     this.i9 = this.i0 + 24;
                     this.i10 = this.i0 + 20;
                     this.i11 = this.i2 + 8;
                     this.i12 = this.i3 + -24;
                     this.i13 = this.i3 + 20;
                     this.i14 = this.i3 + 4;
                     this.i15 = this.i2 + 4;
                     this.i16 = this.i2 + 24;
                     this.i17 = this.i4 + 7;
                     this.i18 = this.i2 + 20;
                     this.i19 = this.i4 + 16;
                     this.i20 = this.i2 + 12;
                     this.i21 = this.i2 + 32;
                     this.i22 = this.i2 + 28;
                     this.i23 = this.i2 + 36;
                     this.i2 = this.i2 + 16;
                     this.i24 = this.i4 + 6;
                     this.i25 = this.i5;
                     loop0:
                     while(true)
                     {
                        this.i26 = li8(this.i1);
                        if(this.i26 != 0)
                        {
                           loop1:
                           while(true)
                           {
                              this.i26 = si8(li8(this.i1));
                              if(this.i26 <= 107)
                              {
                                 if(this.i26 != 76)
                                 {
                                    if(this.i26 != 83)
                                    {
                                       if(this.i26 != 102)
                                       {
                                          addr539:
                                          this.i6 = 0;
                                       }
                                    }
                                    else
                                    {
                                       this.i26 = li8(this.i24);
                                       if(this.i26 != 0)
                                       {
                                          this.i26 = FSM_lua_getinfo;
                                          si32(this.i26,this.i2);
                                          this.i27 = -1;
                                          si32(this.i27,this.i22);
                                          si32(this.i27,this.i21);
                                          this.i27 = FSM_lua_getinfo;
                                          si32(this.i27,this.i20);
                                          mstate.esp = mstate.esp - 12;
                                          this.i27 = 60;
                                          si32(this.i23,mstate.esp);
                                          si32(this.i26,mstate.esp + 4);
                                          si32(this.i27,mstate.esp + 8);
                                          mstate.esp = mstate.esp - 4;
                                          FSM_lua_getinfo.start();
                                       }
                                       else
                                       {
                                          this.i26 = FSM_lua_getinfo;
                                          this.i27 = li32(this.i19);
                                          this.i27 = li32(this.i27 + 32);
                                          this.i27 = this.i27 + 16;
                                          si32(this.i27,this.i2);
                                          this.i28 = li32(this.i19);
                                          this.i28 = li32(this.i28 + 60);
                                          si32(this.i28,this.i22);
                                          this.i29 = li32(this.i19);
                                          this.i29 = li32(this.i29 + 64);
                                          this.i30 = FSM_lua_getinfo;
                                          si32(this.i29,this.i21);
                                          this.i26 = this.i28 == 0?int(this.i26):int(this.i30);
                                          si32(this.i26,this.i20);
                                          mstate.esp = mstate.esp - 12;
                                          this.i26 = 60;
                                          si32(this.i23,mstate.esp);
                                          si32(this.i27,mstate.esp + 4);
                                          si32(this.i26,mstate.esp + 8);
                                          mstate.esp = mstate.esp - 4;
                                          FSM_lua_getinfo.start();
                                       }
                                    }
                                 }
                                 addr544:
                                 while(true)
                                 {
                                    this.i1 = this.i1 + 1;
                                    continue loop0;
                                 }
                              }
                              else if(this.i26 != 108)
                              {
                                 if(this.i26 != 110)
                                 {
                                    if(this.i26 != 117)
                                    {
                                       §§goto(addr539);
                                    }
                                    else
                                    {
                                       this.i26 = li8(this.i17);
                                       si32(this.i26,this.i16);
                                       this.i26 = li8(this.i1 + 1);
                                       this.i1 = this.i1 + 1;
                                       if(this.i26 == 0)
                                       {
                                          break;
                                       }
                                    }
                                 }
                                 else
                                 {
                                    if(this.i3 != 0)
                                    {
                                       this.i26 = li32(this.i14);
                                       this.i27 = li32(this.i26 + 8);
                                       if(this.i27 == 6)
                                       {
                                          this.i26 = li32(this.i26);
                                          this.i26 = li8(this.i26 + 6);
                                          if(this.i26 == 0)
                                          {
                                             this.i26 = li32(this.i13);
                                             if(this.i26 <= 0)
                                             {
                                             }
                                             addr928:
                                          }
                                       }
                                       this.i26 = li32(this.i7);
                                       this.i27 = li32(this.i26 + 8);
                                       if(this.i27 == 6)
                                       {
                                          this.i28 = li32(this.i26);
                                          this.i29 = li8(this.i28 + 6);
                                          if(this.i29 == 0)
                                          {
                                             this.i28 = li32(this.i28 + 16);
                                             this.i28 = li32(this.i28 + 12);
                                             if(this.i27 == 6)
                                             {
                                                this.i27 = this.i29 & 255;
                                                if(this.i27 == 0)
                                                {
                                                   this.i27 = li32(this.i10);
                                                   if(this.i27 == this.i12)
                                                   {
                                                      this.i27 = li32(this.i9);
                                                      si32(this.i27,this.i8);
                                                   }
                                                   this.i26 = li32(this.i26);
                                                   this.i26 = li32(this.i26 + 16);
                                                   this.i27 = li32(this.i8);
                                                   this.i26 = li32(this.i26 + 12);
                                                   this.i26 = this.i27 - this.i26;
                                                   this.i26 = this.i26 >> 2;
                                                   this.i26 = this.i26 + -1;
                                                }
                                                addr1115:
                                                this.i26 = this.i26 << 2;
                                                this.i26 = this.i28 + this.i26;
                                                this.i26 = li32(this.i26);
                                                this.i27 = this.i26 & 63;
                                                this.i28 = this.i27 + -28;
                                                addr1160:
                                                if(uint(this.i28) >= uint(2))
                                                {
                                                   if(this.i27 == 33)
                                                   {
                                                   }
                                                   addr1223:
                                                   while(true)
                                                   {
                                                      si32(this.i26,this.i11);
                                                      if(this.i26 == 0)
                                                      {
                                                         this.i26 = FSM_lua_getinfo;
                                                         si32(this.i26,this.i11);
                                                         this.i26 = 0;
                                                         si32(this.i26,this.i15);
                                                         this.i26 = li8(this.i1 + 1);
                                                         this.i1 = this.i1 + 1;
                                                         if(this.i26 == 0)
                                                         {
                                                            break loop1;
                                                         }
                                                      }
                                                   }
                                                }
                                                this.i26 = this.i26 >>> 6;
                                                mstate.esp = mstate.esp - 16;
                                                this.i26 = this.i26 & 255;
                                                si32(this.i0,mstate.esp);
                                                si32(this.i12,mstate.esp + 4);
                                                si32(this.i26,mstate.esp + 8);
                                                si32(this.i15,mstate.esp + 12);
                                                mstate.esp = mstate.esp - 4;
                                                FSM_lua_getinfo.start();
                                             }
                                             this.i26 = -1;
                                             §§goto(addr1115);
                                          }
                                       }
                                       §§goto(addr928);
                                    }
                                    this.i26 = 0;
                                    §§goto(addr1223);
                                 }
                                 §§goto(addr544);
                              }
                              else if(this.i3 != 0)
                              {
                                 mstate.esp = mstate.esp - 8;
                                 si32(this.i0,mstate.esp);
                                 si32(this.i3,mstate.esp + 4);
                                 mstate.esp = mstate.esp - 4;
                                 FSM_lua_getinfo.start();
                              }
                              else
                              {
                                 this.i26 = -1;
                                 si32(this.i26,this.i18);
                                 this.i26 = li8(this.i1 + 1);
                                 this.i1 = this.i1 + 1;
                                 if(this.i26 == 0)
                                 {
                                    break;
                                 }
                              }
                              addr300:
                              while(true)
                              {
                                 continue loop1;
                              }
                           }
                        }
                        addr1270:
                        this.i1 = li8(this.i5);
                        if(this.i1 != 102)
                        {
                           this.i1 = this.i25;
                           while(true)
                           {
                              this.i2 = li8(this.i1);
                              if(this.i2 == 0)
                              {
                                 this.i1 = 0;
                                 break;
                              }
                              this.i2 = li8(this.i1 + 1);
                              this.i1 = this.i1 + 1;
                              this.i3 = this.i1;
                              if(this.i2 != 102)
                              {
                                 this.i1 = this.i3;
                                 continue;
                              }
                              break;
                           }
                        }
                        else
                        {
                           this.i1 = this.i5;
                        }
                        if(this.i1 != 0)
                        {
                           this.i3 = this.i4;
                           this.i1 = this.i5;
                           this.i2 = this.i6;
                           addr2495:
                           this.i4 = li32(this.i0 + 8);
                           this.i5 = this.i0 + 8;
                           if(this.i3 == 0)
                           {
                              this.i6 = 0;
                              si32(this.i6,this.i4 + 8);
                           }
                           else
                           {
                              this.i6 = 6;
                              si32(this.i3,this.i4);
                              si32(this.i6,this.i4 + 8);
                           }
                           this.i4 = li32(this.i0 + 28);
                           this.i6 = li32(this.i5);
                           this.i4 = this.i4 - this.i6;
                           if(this.i4 <= 12)
                           {
                              this.i4 = li32(this.i0 + 44);
                              if(this.i4 >= 1)
                              {
                                 mstate.esp = mstate.esp - 8;
                                 this.i4 = this.i4 << 1;
                                 si32(this.i0,mstate.esp);
                                 si32(this.i4,mstate.esp + 4);
                                 state = 6;
                                 mstate.esp = mstate.esp - 4;
                                 FSM_lua_getinfo.start();
                                 return;
                              }
                              mstate.esp = mstate.esp - 8;
                              this.i4 = this.i4 + 1;
                              si32(this.i0,mstate.esp);
                              si32(this.i4,mstate.esp + 4);
                              state = 7;
                              mstate.esp = mstate.esp - 4;
                              FSM_lua_getinfo.start();
                              return;
                           }
                           addr1483:
                           this.i4 = li32(this.i5);
                           this.i4 = this.i4 + 12;
                           si32(this.i4,this.i5);
                        }
                        else
                        {
                           this.i3 = this.i4;
                           this.i1 = this.i5;
                           this.i2 = this.i6;
                        }
                     }
                  }
                  else
                  {
                     this.i3 = this.i4;
                  }
                  addr1499:
                  this.i4 = li8(this.i1);
                  this.i5 = this.i1;
                  if(this.i4 != 76)
                  {
                     this.i1 = this.i5;
                     while(true)
                     {
                        this.i4 = li8(this.i1);
                        if(this.i4 == 0)
                        {
                           this.i1 = 0;
                           break;
                        }
                        this.i4 = li8(this.i1 + 1);
                        this.i1 = this.i1 + 1;
                        this.i5 = this.i1;
                        if(this.i4 != 76)
                        {
                           this.i1 = this.i5;
                           continue;
                        }
                        break;
                     }
                  }
                  if(this.i1 != 0)
                  {
                     if(this.i3 != 0)
                     {
                        this.i1 = li8(this.i3 + 6);
                        if(this.i1 == 0)
                        {
                           this.i1 = 32;
                           this.i4 = li32(this.i0 + 16);
                           this.i5 = li32(this.i4 + 12);
                           this.i6 = li32(this.i4 + 16);
                           mstate.esp = mstate.esp - 16;
                           this.i7 = 0;
                           si32(this.i6,mstate.esp);
                           si32(this.i7,mstate.esp + 4);
                           si32(this.i7,mstate.esp + 8);
                           si32(this.i1,mstate.esp + 12);
                           state = 8;
                           mstate.esp = mstate.esp - 4;
                           mstate.funcs[this.i5]();
                           return;
                        }
                     }
                     this.i3 = 0;
                     this.i1 = li32(this.i0 + 8);
                     si32(this.i3,this.i1 + 8);
                     addr2298:
                     this.i1 = li32(this.i0 + 28);
                     this.i3 = li32(this.i0 + 8);
                     this.i4 = this.i0 + 8;
                     this.i1 = this.i1 - this.i3;
                     if(this.i1 <= 12)
                     {
                        this.i1 = li32(this.i0 + 44);
                        if(this.i1 >= 1)
                        {
                           mstate.esp = mstate.esp - 8;
                           this.i1 = this.i1 << 1;
                           si32(this.i0,mstate.esp);
                           si32(this.i1,mstate.esp + 4);
                           state = 14;
                           mstate.esp = mstate.esp - 4;
                           FSM_lua_getinfo.start();
                           return;
                        }
                        mstate.esp = mstate.esp - 8;
                        this.i1 = this.i1 + 1;
                        si32(this.i0,mstate.esp);
                        si32(this.i1,mstate.esp + 4);
                        state = 15;
                        mstate.esp = mstate.esp - 4;
                        FSM_lua_getinfo.start();
                        return;
                     }
                     addr2429:
                     this.i0 = li32(this.i4);
                     this.i0 = this.i0 + 12;
                     si32(this.i0,this.i4);
                     break;
                  }
                  break;
               }
               this.i3 = li32(this.i2 + 96);
               if(this.i3 == 0)
               {
                  this.i3 = 0;
                  this.i4 = this.i3;
               }
               else
               {
                  this.i4 = li32(this.i0 + 40);
                  this.i3 = this.i3 * 24;
                  this.i3 = this.i4 + this.i3;
                  this.i4 = li32(this.i3 + 4);
                  this.i4 = li32(this.i4);
               }
               if(this.i4 != 0)
               {
                  this.i5 = this.i1;
                  §§goto(addr166);
               }
               else
               {
                  this.i3 = this.i4;
               }
               §§goto(addr1499);
               this.i4 = FSM_lua_getinfo;
               si32(this.i4,this.i2 + 8);
               si32(this.i4,this.i2 + 4);
               this.i4 = FSM_lua_getinfo;
               si32(this.i4,this.i2 + 12);
               this.i4 = -1;
               si32(this.i4,this.i2 + 20);
               si32(this.i4,this.i2 + 28);
               si32(this.i4,this.i2 + 32);
               this.i4 = FSM_lua_getinfo;
               si32(this.i4,this.i2 + 16);
               mstate.esp = mstate.esp - 12;
               this.i5 = 60;
               this.i6 = this.i2 + 36;
               si32(this.i6,mstate.esp);
               si32(this.i4,mstate.esp + 4);
               si32(this.i5,mstate.esp + 8);
               mstate.esp = mstate.esp - 4;
               FSM_lua_getinfo.start();
            case 1:
               mstate.esp = mstate.esp + 12;
               this.i4 = 0;
               si32(this.i4,this.i2 + 24);
               this.i2 = li8(this.i1);
               this.i4 = this.i1;
               if(this.i2 != 102)
               {
                  this.i2 = this.i4;
                  while(true)
                  {
                     this.i4 = li8(this.i2);
                     if(this.i4 == 0)
                     {
                        this.i2 = 0;
                        break;
                     }
                     this.i4 = li8(this.i2 + 1);
                     this.i2 = this.i2 + 1;
                     this.i5 = this.i2;
                     if(this.i4 != 102)
                     {
                        this.i2 = this.i5;
                        continue;
                     }
                     break;
                  }
               }
               else
               {
                  this.i2 = this.i1;
               }
               if(this.i2 != 0)
               {
                  this.i2 = 1;
                  §§goto(addr2495);
               }
               else
               {
                  this.i2 = 1;
               }
               §§goto(addr1499);
            case 2:
               while(true)
               {
                  mstate.esp = mstate.esp + 12;
                  this.i26 = li8(this.i1 + 1);
                  this.i1 = this.i1 + 1;
                  if(this.i26 != 0)
                  {
                     §§goto(addr300);
                  }
                  §§goto(addr1270);
               }
            case 3:
               while(true)
               {
                  mstate.esp = mstate.esp + 12;
                  this.i26 = li8(this.i1 + 1);
                  this.i1 = this.i1 + 1;
                  if(this.i26 != 0)
                  {
                     §§goto(addr300);
                  }
                  §§goto(addr1270);
               }
            case 4:
               while(true)
               {
                  this.i26 = mstate.eax;
                  mstate.esp = mstate.esp + 8;
                  si32(this.i26,this.i18);
                  this.i26 = li8(this.i1 + 1);
                  this.i1 = this.i1 + 1;
                  if(this.i26 != 0)
                  {
                     §§goto(addr300);
                  }
                  §§goto(addr1270);
               }
            case 5:
               while(true)
               {
                  this.i26 = mstate.eax;
                  mstate.esp = mstate.esp + 16;
                  §§goto(addr1223);
                  §§goto(addr1160);
               }
            case 6:
               mstate.esp = mstate.esp + 8;
               §§goto(addr1483);
            case 7:
               mstate.esp = mstate.esp + 8;
               §§goto(addr1483);
            case 8:
               this.i1 = mstate.eax;
               mstate.esp = mstate.esp + 16;
               this.i5 = this.i0 + 16;
               if(this.i1 == 0)
               {
                  this.i6 = 4;
                  mstate.esp = mstate.esp - 8;
                  si32(this.i0,mstate.esp);
                  si32(this.i6,mstate.esp + 4);
                  state = 9;
                  mstate.esp = mstate.esp - 4;
                  FSM_lua_getinfo.start();
                  return;
               }
               addr1701:
               this.i6 = 5;
               this.i7 = li32(this.i4 + 68);
               this.i7 = this.i7 + 32;
               si32(this.i7,this.i4 + 68);
               this.i4 = li32(this.i5);
               this.i7 = li32(this.i4 + 28);
               si32(this.i7,this.i1);
               si32(this.i1,this.i4 + 28);
               this.i4 = li8(this.i4 + 20);
               this.i4 = this.i4 & 3;
               si8(this.i4,this.i1 + 5);
               si8(this.i6,this.i1 + 4);
               this.i4 = 0;
               si32(this.i4,this.i1 + 8);
               this.i6 = -1;
               si8(this.i6,this.i1 + 6);
               si32(this.i4,this.i1 + 12);
               si32(this.i4,this.i1 + 28);
               si8(this.i4,this.i1 + 7);
               this.i6 = FSM_lua_getinfo;
               si32(this.i6,this.i1 + 16);
               this.i5 = li32(this.i5);
               this.i6 = li32(this.i5 + 12);
               this.i5 = li32(this.i5 + 16);
               mstate.esp = mstate.esp - 16;
               si32(this.i5,mstate.esp);
               si32(this.i4,mstate.esp + 4);
               si32(this.i4,mstate.esp + 8);
               si32(this.i4,mstate.esp + 12);
               state = 10;
               mstate.esp = mstate.esp - 4;
               mstate.funcs[this.i6]();
               return;
            case 9:
               mstate.esp = mstate.esp + 8;
               §§goto(addr1701);
            case 10:
               this.i4 = mstate.eax;
               mstate.esp = mstate.esp + 16;
               si32(this.i4,this.i1 + 12);
               this.i4 = li32(this.i1 + 28);
               this.i5 = this.i1 + 28;
               this.i6 = this.i1 + 12;
               this.i7 = this.i1;
               if(this.i4 <= -1)
               {
                  this.i8 = this.i4 * 12;
                  this.i8 = this.i8 + 8;
                  while(true)
                  {
                     this.i9 = 0;
                     this.i10 = li32(this.i6);
                     this.i10 = this.i10 + this.i8;
                     si32(this.i9,this.i10);
                     this.i8 = this.i8 + 12;
                     this.i4 = this.i4 + 1;
                     if(this.i4 <= -1)
                     {
                        continue;
                     }
                     break;
                  }
               }
               this.i4 = 0;
               si32(this.i4,this.i5);
               mstate.esp = mstate.esp - 12;
               si32(this.i0,mstate.esp);
               si32(this.i1,mstate.esp + 4);
               si32(this.i4,mstate.esp + 8);
               state = 11;
               mstate.esp = mstate.esp - 4;
               FSM_lua_getinfo.start();
               return;
            case 11:
               mstate.esp = mstate.esp + 12;
               this.i4 = li32(this.i3 + 16);
               this.i5 = li32(this.i4 + 20);
               this.i4 = li32(this.i4 + 48);
               this.i3 = this.i3 + 16;
               if(this.i4 >= 1)
               {
                  this.i4 = mstate.ebp + -16;
                  this.i6 = 0;
                  this.i8 = this.i4 + 8;
                  addr2094:
                  while(true)
                  {
                     this.i9 = FSM_lua_getinfo;
                     this.i10 = li32(this.i5);
                     mstate.esp = mstate.esp - 8;
                     si32(this.i1,mstate.esp);
                     si32(this.i10,mstate.esp + 4);
                     mstate.esp = mstate.esp - 4;
                     FSM_lua_getinfo.start();
                  }
               }
               addr2274:
               this.i1 = 5;
               this.i3 = li32(this.i0 + 8);
               si32(this.i7,this.i3);
               si32(this.i1,this.i3 + 8);
               §§goto(addr2298);
            case 12:
               loop14:
               while(true)
               {
                  this.i11 = mstate.eax;
                  mstate.esp = mstate.esp + 8;
                  if(this.i11 != this.i9)
                  {
                     this.i10 = this.i11;
                     addr2224:
                     while(true)
                     {
                        this.i9 = this.i10;
                        this.i10 = 1;
                        si32(this.i10,this.i9);
                        si32(this.i10,this.i9 + 8);
                        this.i9 = li32(this.i3);
                        this.i9 = li32(this.i9 + 48);
                        this.i5 = this.i5 + 4;
                        this.i6 = this.i6 + 1;
                        if(this.i9 > this.i6)
                        {
                           §§goto(addr2094);
                        }
                        else
                        {
                           break loop14;
                        }
                     }
                     §§goto(addr2298);
                  }
                  else
                  {
                     this.i9 = 3;
                     this.f0 = Number(this.i10);
                     sf64(this.f0,this.i4);
                     si32(this.i9,this.i8);
                     mstate.esp = mstate.esp - 12;
                     this.i10 = mstate.ebp + -16;
                     si32(this.i0,mstate.esp);
                     si32(this.i1,mstate.esp + 4);
                     si32(this.i10,mstate.esp + 8);
                     state = 13;
                     mstate.esp = mstate.esp - 4;
                     FSM_lua_getinfo.start();
                     return;
                  }
               }
               §§goto(addr2274);
            case 13:
               this.i10 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               §§goto(addr2224);
            case 14:
               mstate.esp = mstate.esp + 8;
               §§goto(addr2429);
            case 15:
               mstate.esp = mstate.esp + 8;
               §§goto(addr2429);
         }
         mstate.eax = this.i2;
         mstate.esp = mstate.ebp;
         mstate.ebp = li32(mstate.esp);
         mstate.esp = mstate.esp + 4;
         mstate.esp = mstate.esp + 4;
         mstate.gworker = caller;
      }
   }
}
