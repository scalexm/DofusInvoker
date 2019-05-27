package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.lf64;
   import avm2.intrinsics.memory.li16;
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.li8;
   import avm2.intrinsics.memory.sf64;
   import avm2.intrinsics.memory.si16;
   import avm2.intrinsics.memory.si32;
   import avm2.intrinsics.memory.si8;
   
   public final class FSM_luaL_loadfile extends Machine
   {
      
      public static const intRegCount:int = 16;
      
      public static const NumberRegCount:int = 1;
       
      
      public var i10:int;
      
      public var i11:int;
      
      public var i12:int;
      
      public var i13:int;
      
      public var i14:int;
      
      public var i15:int;
      
      public var f0:Number;
      
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
      
      public function FSM_luaL_loadfile()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM_luaL_loadfile = null;
         _loc1_ = new FSM_luaL_loadfile();
         FSM_luaL_loadfile.gworker = _loc1_;
      }
      
      override public final function work() : void
      {
         loop7:
         switch(state)
         {
            case 0:
               mstate.esp = mstate.esp - 4;
               si32(mstate.ebp,mstate.esp);
               mstate.ebp = mstate.esp;
               mstate.esp = mstate.esp - 9296;
               this.i2 = mstate.ebp + -9296;
               this.i3 = li32(mstate.ebp + 8);
               this.i0 = li32(this.i3 + 8);
               this.i1 = li32(this.i3 + 12);
               this.i0 = this.i0 - this.i1;
               this.i4 = this.i0 / 12;
               this.i0 = 0;
               si32(this.i0,mstate.ebp + -9296);
               this.i5 = this.i2 + 4;
               this.i6 = this.i4 + 1;
               this.i7 = this.i3 + 12;
               this.i8 = this.i3 + 8;
               this.i9 = li32(mstate.ebp + 12);
               if(this.i9 == 0)
               {
                  this.i0 = li32(this.i3 + 16);
                  this.i1 = li32(this.i0 + 68);
                  this.i0 = li32(this.i0 + 64);
                  if(uint(this.i1) >= uint(this.i0))
                  {
                     mstate.esp = mstate.esp - 4;
                     si32(this.i3,mstate.esp);
                     state = 1;
                     mstate.esp = mstate.esp - 4;
                     FSM_luaL_loadfile.start();
                     return;
                  }
                  addr174:
                  this.i0 = FSM_luaL_loadfile;
                  this.i1 = li32(this.i8);
                  mstate.esp = mstate.esp - 12;
                  this.i10 = 6;
                  si32(this.i3,mstate.esp);
                  si32(this.i0,mstate.esp + 4);
                  si32(this.i10,mstate.esp + 8);
                  state = 2;
                  mstate.esp = mstate.esp - 4;
                  FSM_luaL_loadfile.start();
                  return;
               }
               this.i0 = FSM_luaL_loadfile;
               mstate.esp = mstate.esp - 12;
               si32(this.i3,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               si32(this.i9,mstate.esp + 8);
               state = 4;
               mstate.esp = mstate.esp - 4;
               FSM_luaL_loadfile.start();
               return;
            case 1:
               mstate.esp = mstate.esp + 4;
               §§goto(addr174);
            case 2:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i0,this.i1);
               this.i0 = 4;
               si32(this.i0,this.i1 + 8);
               this.i0 = li32(this.i8);
               this.i0 = this.i0 + 12;
               si32(this.i0,this.i8);
               this.i0 = FSM_luaL_loadfile;
               si32(this.i0,this.i5);
               addr276:
               this.i1 = li32(this.i0 + 4);
               this.i1 = this.i1 + -1;
               si32(this.i1,this.i0 + 4);
               this.i0 = li32(this.i5);
               if(this.i1 <= -1)
               {
                  mstate.esp = mstate.esp - 4;
                  si32(this.i0,mstate.esp);
                  state = 3;
                  mstate.esp = mstate.esp - 4;
                  FSM_luaL_loadfile.start();
                  return;
               }
               this.i1 = li32(this.i0);
               this.i10 = li8(this.i1);
               this.i1 = this.i1 + 1;
               si32(this.i1,this.i0);
               if(this.i10 != 35)
               {
                  this.i0 = this.i10;
                  addr589:
                  if(this.i0 == 27)
                  {
                     if(this.i9 != 0)
                     {
                        addr990:
                        this.i10 = li32(this.i5);
                        this.i0 = li8(FSM_luaL_loadfile);
                        if(this.i0 == 0)
                        {
                           this.i0 = FSM_luaL_loadfile;
                           this.i1 = FSM_luaL_loadfile;
                           this.i11 = 0;
                           this.i0 = this.i0 + 56;
                           while(true)
                           {
                              si32(this.i1,this.i0);
                              this.i1 = this.i1 + 148;
                              this.i0 = this.i0 + 88;
                              this.i11 = this.i11 + 1;
                              if(this.i11 != 17)
                              {
                                 continue;
                              }
                              break;
                           }
                           this.i0 = 1;
                           si8(this.i0,FSM_luaL_loadfile);
                           si8(this.i0,FSM_luaL_loadfile);
                        }
                        this.i0 = li16(this.i10 + 12);
                        this.i11 = this.i10 + 12;
                        if(this.i9 == 0)
                        {
                           this.i0 = this.i0 & 65535;
                           if(this.i0 == 0)
                           {
                              this.i0 = 22;
                              si32(this.i0,FSM_luaL_loadfile);
                              this.i0 = 0;
                              addr2331:
                              si32(this.i0,this.i5);
                              if(this.i0 == 0)
                              {
                                 this.i0 = FSM_luaL_loadfile;
                                 addr486:
                                 mstate.esp = mstate.esp - 12;
                                 si32(this.i3,mstate.esp);
                                 si32(this.i0,mstate.esp + 4);
                                 si32(this.i6,mstate.esp + 8);
                                 state = 6;
                                 mstate.esp = mstate.esp - 4;
                                 FSM_luaL_loadfile.start();
                                 return;
                              }
                              break;
                           }
                           this.i0 = FSM_luaL_loadfile;
                           this.i11 = 4;
                           this.i1 = this.i11;
                           log(this.i1,mstate.gworker.stringFromPtr(this.i0));
                           mstate.esp = mstate.esp - 20;
                           this.i0 = FSM_luaL_loadfile;
                           this.i11 = FSM_luaL_loadfile;
                           this.i1 = 345;
                           this.i12 = 78;
                           this.i13 = mstate.ebp + -4096;
                           si32(this.i13,mstate.esp);
                           si32(this.i0,mstate.esp + 4);
                           si32(this.i12,mstate.esp + 8);
                           si32(this.i11,mstate.esp + 12);
                           si32(this.i1,mstate.esp + 16);
                           state = 9;
                           mstate.esp = mstate.esp - 4;
                           FSM_luaL_loadfile.start();
                           return;
                        }
                        this.i1 = this.i0 & 65535;
                        if(this.i1 == 0)
                        {
                           this.i0 = 32;
                           si16(this.i0,this.i11);
                           mstate.esp = mstate.esp - 12;
                           this.i0 = 438;
                           this.i1 = 0;
                           si32(this.i9,mstate.esp);
                           si32(this.i1,mstate.esp + 4);
                           si32(this.i0,mstate.esp + 8);
                           state = 11;
                           mstate.esp = mstate.esp - 4;
                           FSM_luaL_loadfile.start();
                           return;
                        }
                        this.i0 = this.i0 & 8;
                        if(this.i0 != 0)
                        {
                           mstate.esp = mstate.esp - 4;
                           si32(this.i10,mstate.esp);
                           state = 12;
                           mstate.esp = mstate.esp - 4;
                           FSM_luaL_loadfile.start();
                           return;
                        }
                        addr1399:
                        this.i0 = li32(this.i10 + 32);
                        this.i1 = li16(this.i10 + 14);
                        this.i12 = this.i0 != 0?1:0;
                        this.i1 = this.i1 << 16;
                        this.i12 = this.i12 & 1;
                        this.i1 = this.i1 >> 16;
                        this.i13 = this.i10 + 32;
                        if(this.i1 <= -1)
                        {
                           if(this.i0 != 0)
                           {
                              this.i12 = 0;
                              this.i14 = li32(this.i10 + 28);
                              mstate.esp = mstate.esp - 4;
                              si32(this.i14,mstate.esp);
                              state = 13;
                              mstate.esp = mstate.esp - 4;
                              mstate.funcs[this.i0]();
                              return;
                           }
                        }
                        addr1515:
                        this.i0 = this.i12;
                        this.i12 = 438;
                        mstate.esp = mstate.esp - 12;
                        this.i14 = 0;
                        si32(this.i9,mstate.esp);
                        si32(this.i14,mstate.esp + 4);
                        si32(this.i12,mstate.esp + 8);
                        state = 14;
                        mstate.esp = mstate.esp - 4;
                        FSM_luaL_loadfile.start();
                        return;
                     }
                  }
               }
               else
               {
                  addr634:
                  this.i0 = 1;
                  si32(this.i0,this.i2);
                  loop0:
                  while(true)
                  {
                     this.i0 = li32(this.i5);
                     this.i1 = li32(this.i0 + 4);
                     this.i1 = this.i1 + -1;
                     si32(this.i1,this.i0 + 4);
                     this.i0 = li32(this.i5);
                     if(this.i1 <= -1)
                     {
                        break;
                     }
                     this.i1 = li32(this.i0);
                     this.i10 = li8(this.i1);
                     this.i1 = this.i1 + 1;
                     si32(this.i1,this.i0);
                     if(this.i10 != 10)
                     {
                        if(this.i10 == -1)
                        {
                           this.i0 = this.i10;
                           §§goto(addr589);
                        }
                        else
                        {
                           addr643:
                           while(true)
                           {
                              continue loop0;
                           }
                        }
                     }
                     else
                     {
                        addr816:
                        this.i0 = li32(this.i5);
                        this.i1 = li32(this.i0 + 4);
                        this.i1 = this.i1 + -1;
                        si32(this.i1,this.i0 + 4);
                        this.i0 = li32(this.i5);
                        if(this.i1 <= -1)
                        {
                           mstate.esp = mstate.esp - 4;
                           si32(this.i0,mstate.esp);
                           state = 8;
                           mstate.esp = mstate.esp - 4;
                           FSM_luaL_loadfile.start();
                           return;
                        }
                        this.i1 = li32(this.i0);
                        this.i10 = li8(this.i1);
                        this.i1 = this.i1 + 1;
                        si32(this.i1,this.i0);
                        if(this.i10 == 27)
                        {
                           if(this.i9 != 0)
                           {
                              §§goto(addr990);
                           }
                        }
                        this.i0 = this.i10;
                     }
                  }
                  mstate.esp = mstate.esp - 4;
                  si32(this.i0,mstate.esp);
                  state = 7;
                  mstate.esp = mstate.esp - 4;
                  FSM_luaL_loadfile.start();
                  return;
               }
               addr2522:
               this.i1 = -1;
               this.i2 = li32(this.i5);
               mstate.esp = mstate.esp - 8;
               si32(this.i0,mstate.esp);
               si32(this.i2,mstate.esp + 4);
               state = 23;
               mstate.esp = mstate.esp - 4;
               FSM_luaL_loadfile.start();
               return;
            case 3:
               this.i1 = mstate.eax;
               mstate.esp = mstate.esp + 4;
               if(this.i1 != 0)
               {
                  this.i0 = -1;
               }
               else
               {
                  this.i1 = li32(this.i0 + 4);
                  this.i1 = this.i1 + -1;
                  si32(this.i1,this.i0 + 4);
                  this.i1 = li32(this.i0);
                  this.i10 = li8(this.i1);
                  this.i1 = this.i1 + 1;
                  si32(this.i1,this.i0);
                  this.i0 = this.i10;
               }
               if(this.i0 != 35)
               {
                  §§goto(addr589);
               }
               else
               {
                  §§goto(addr634);
               }
               §§goto(addr2522);
            case 4:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               this.i0 = li8(FSM_luaL_loadfile + 2);
               mstate.esp = mstate.esp - 16;
               this.i1 = 114;
               this.i10 = 0;
               si32(this.i9,mstate.esp);
               si32(this.i1,mstate.esp + 4);
               si32(this.i10,mstate.esp + 8);
               si32(this.i0,mstate.esp + 12);
               state = 5;
               mstate.esp = mstate.esp - 4;
               FSM_luaL_loadfile.start();
               return;
            case 5:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 16;
               si32(this.i0,this.i5);
               if(this.i0 != 0)
               {
                  §§goto(addr276);
               }
               else
               {
                  this.i0 = FSM_luaL_loadfile;
               }
               §§goto(addr486);
            case 6:
               mstate.esp = mstate.esp + 12;
               this.i0 = 6;
               mstate.eax = this.i0;
               addr3326:
               mstate.esp = mstate.ebp;
               mstate.ebp = li32(mstate.esp);
               mstate.esp = mstate.esp + 4;
               mstate.esp = mstate.esp + 4;
               mstate.gworker = caller;
               return;
            case 7:
               this.i1 = mstate.eax;
               mstate.esp = mstate.esp + 4;
               if(this.i1 != 0)
               {
                  this.i0 = -1;
               }
               else
               {
                  this.i1 = li32(this.i0 + 4);
                  this.i1 = this.i1 + -1;
                  si32(this.i1,this.i0 + 4);
                  this.i1 = li32(this.i0);
                  this.i10 = li8(this.i1);
                  this.i1 = this.i1 + 1;
                  si32(this.i1,this.i0);
                  this.i0 = this.i10;
               }
               if(this.i0 != 10)
               {
                  if(this.i0 == -1)
                  {
                     §§goto(addr589);
                  }
                  else
                  {
                     §§goto(addr643);
                  }
                  §§goto(addr2522);
               }
               §§goto(addr816);
            case 8:
               this.i1 = mstate.eax;
               mstate.esp = mstate.esp + 4;
               if(this.i1 != 0)
               {
                  this.i0 = -1;
               }
               else
               {
                  this.i1 = li32(this.i0 + 4);
                  this.i1 = this.i1 + -1;
                  si32(this.i1,this.i0 + 4);
                  this.i1 = li32(this.i0);
                  this.i10 = li8(this.i1);
                  this.i1 = this.i1 + 1;
                  si32(this.i1,this.i0);
                  this.i0 = this.i10;
               }
               if(this.i0 == 27)
               {
                  if(this.i9 != 0)
                  {
                     §§goto(addr990);
                  }
               }
               §§goto(addr2522);
            case 9:
               mstate.esp = mstate.esp + 20;
               this.i11 = 3;
               this.i0 = this.i13;
               this.i1 = this.i11;
               log(this.i1,mstate.gworker.stringFromPtr(this.i0));
               si32(this.i12,FSM_luaL_loadfile);
               mstate.esp = mstate.esp - 4;
               si32(this.i10,mstate.esp);
               state = 10;
               mstate.esp = mstate.esp - 4;
               FSM_luaL_loadfile.start();
               return;
            case 10:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 4;
               si32(this.i12,FSM_luaL_loadfile);
               this.i0 = 0;
               §§goto(addr2331);
            case 11:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               this.i12 = -1;
               addr1728:
               this.i13 = this.i0;
               this.i0 = li32(FSM_luaL_loadfile);
               if(this.i1 != 0)
               {
                  this.i1 = li32(this.i10 + 32);
                  this.i14 = li32(this.i10 + 28);
                  mstate.esp = mstate.esp - 4;
                  si32(this.i14,mstate.esp);
                  state = 17;
                  mstate.esp = mstate.esp - 4;
                  mstate.funcs[this.i1]();
                  return;
               }
               addr1795:
               this.i1 = li16(this.i11);
               this.i1 = this.i1 & 128;
               if(this.i1 != 0)
               {
                  this.i1 = 0;
                  this.i14 = li32(this.i10 + 16);
                  mstate.esp = mstate.esp - 8;
                  si32(this.i14,mstate.esp);
                  si32(this.i1,mstate.esp + 4);
                  state = 18;
                  mstate.esp = mstate.esp - 4;
                  FSM_luaL_loadfile.start();
                  return;
               }
               addr1862:
               this.i1 = 0;
               si32(this.i1,this.i10 + 8);
               si32(this.i1,this.i10 + 4);
               si32(this.i1,this.i10);
               si32(this.i1,this.i10 + 16);
               si32(this.i1,this.i10 + 20);
               si32(this.i1,this.i10 + 24);
               this.i1 = li32(this.i10 + 48);
               this.i14 = this.i10 + 48;
               if(this.i1 != 0)
               {
                  this.i15 = this.i10 + 64;
                  if(this.i1 != this.i15)
                  {
                     this.i15 = 0;
                     mstate.esp = mstate.esp - 8;
                     si32(this.i1,mstate.esp);
                     si32(this.i15,mstate.esp + 4);
                     state = 19;
                     mstate.esp = mstate.esp - 4;
                     FSM_luaL_loadfile.start();
                     return;
                  }
                  addr1979:
                  this.i1 = 0;
                  si32(this.i1,this.i14);
               }
               this.i1 = 0;
               si32(this.i1,this.i10 + 52);
               this.i1 = li32(this.i10 + 68);
               this.i14 = this.i10 + 68;
               if(this.i1 != 0)
               {
                  this.i15 = 0;
                  mstate.esp = mstate.esp - 8;
                  si32(this.i1,mstate.esp);
                  si32(this.i15,mstate.esp + 4);
                  state = 20;
                  mstate.esp = mstate.esp - 4;
                  FSM_luaL_loadfile.start();
                  return;
               }
               addr2064:
               this.i1 = 0;
               si32(this.i1,this.i10 + 72);
               this.i14 = li32(this.i10 + 56);
               si32(this.i1,this.i14 + 16);
               this.i14 = li32(this.i10 + 56);
               this.i14 = this.i14 + 20;
               this.i15 = 128;
               memset(this.i14,this.i1,this.i15);
               if(this.i13 <= -1)
               {
                  this.i10 = 0;
                  si16(this.i10,this.i11);
                  si32(this.i0,FSM_luaL_loadfile);
                  this.i0 = this.i10;
               }
               else
               {
                  if(this.i13 != this.i12)
                  {
                     if(this.i12 >= 0)
                     {
                        this.i0 = FSM_luaL_loadfile;
                        this.i1 = 4;
                        log(this.i1,mstate.gworker.stringFromPtr(this.i0));
                        mstate.esp = mstate.esp - 20;
                        this.i0 = FSM_luaL_loadfile;
                        this.i1 = FSM_luaL_loadfile;
                        this.i12 = 138;
                        this.i14 = 78;
                        this.i15 = mstate.ebp + -8192;
                        si32(this.i15,mstate.esp);
                        si32(this.i0,mstate.esp + 4);
                        si32(this.i14,mstate.esp + 8);
                        si32(this.i1,mstate.esp + 12);
                        si32(this.i12,mstate.esp + 16);
                        state = 21;
                        mstate.esp = mstate.esp - 4;
                        FSM_luaL_loadfile.start();
                        return;
                     }
                  }
                  addr2261:
                  this.i0 = 4;
                  si16(this.i0,this.i11);
                  si16(this.i13,this.i10 + 14);
                  si32(this.i10,this.i10 + 28);
                  this.i0 = FSM_luaL_loadfile;
                  si32(this.i0,this.i10 + 36);
                  this.i0 = FSM_luaL_loadfile;
                  si32(this.i0,this.i10 + 44);
                  this.i0 = FSM_luaL_loadfile;
                  si32(this.i0,this.i10 + 40);
                  this.i0 = FSM_luaL_loadfile;
                  si32(this.i0,this.i10 + 32);
                  this.i0 = this.i10;
               }
               §§goto(addr2331);
            case 12:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 4;
               §§goto(addr1399);
            case 13:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 4;
               this.i0 = this.i12;
               §§goto(addr1515);
            case 14:
               this.i14 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               if(this.i14 <= -1)
               {
                  if(this.i0 != 0)
                  {
                     this.i12 = li32(FSM_luaL_loadfile);
                     this.i12 = this.i12 + -23;
                     if(uint(this.i12) <= uint(1))
                     {
                        this.i0 = 438;
                        this.i12 = li32(this.i13);
                        this.i13 = li32(this.i10 + 28);
                        mstate.esp = mstate.esp - 4;
                        si32(this.i13,mstate.esp);
                        state = 15;
                        mstate.esp = mstate.esp - 4;
                        mstate.funcs[this.i12]();
                        return;
                     }
                  }
               }
               this.i12 = this.i1;
               this.i1 = this.i0;
               this.i0 = this.i14;
               §§goto(addr1728);
            case 15:
               this.i12 = mstate.eax;
               mstate.esp = mstate.esp + 4;
               mstate.esp = mstate.esp - 12;
               this.i13 = 0;
               si32(this.i9,mstate.esp);
               si32(this.i13,mstate.esp + 4);
               si32(this.i0,mstate.esp + 8);
               state = 16;
               mstate.esp = mstate.esp - 4;
               FSM_luaL_loadfile.start();
               return;
            case 16:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               this.i12 = this.i1;
               this.i1 = this.i13;
               §§goto(addr1728);
            case 17:
               this.i1 = mstate.eax;
               mstate.esp = mstate.esp + 4;
               §§goto(addr1795);
            case 18:
               this.i1 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               §§goto(addr1862);
            case 19:
               this.i1 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               §§goto(addr1979);
            case 20:
               this.i1 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               si32(this.i15,this.i14);
               §§goto(addr2064);
            case 21:
               mstate.esp = mstate.esp + 20;
               this.i1 = 3;
               this.i0 = this.i15;
               log(this.i1,mstate.gworker.stringFromPtr(this.i0));
               si32(this.i14,FSM_luaL_loadfile);
               §§goto(addr2261);
            case 22:
               this.i1 = mstate.eax;
               mstate.esp = mstate.esp + 4;
               if(this.i1 != 0)
               {
                  this.i0 = -1;
               }
               else
               {
                  this.i1 = li32(this.i0 + 4);
                  this.i1 = this.i1 + -1;
                  si32(this.i1,this.i0 + 4);
                  this.i1 = li32(this.i0);
                  this.i10 = li8(this.i1);
                  this.i1 = this.i1 + 1;
                  si32(this.i1,this.i0);
                  this.i0 = this.i10;
               }
               if(this.i0 != -1)
               {
                  if(this.i0 != 27)
                  {
                     addr2347:
                     while(true)
                     {
                        break loop7;
                     }
                  }
               }
               addr2514:
               this.i1 = 0;
               si32(this.i1,this.i2);
               §§goto(addr2522);
            case 23:
               mstate.esp = mstate.esp + 8;
               mstate.esp = mstate.esp - 12;
               this.i0 = 0;
               si32(this.i3,mstate.esp);
               si32(this.i1,mstate.esp + 4);
               si32(this.i0,mstate.esp + 8);
               state = 24;
               mstate.esp = mstate.esp - 4;
               FSM_luaL_loadfile.start();
               return;
            case 24:
               this.i1 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i3,mstate.ebp + -8240);
               this.i2 = FSM_luaL_loadfile;
               si32(this.i2,mstate.ebp + -8248);
               this.i2 = mstate.ebp + -9296;
               si32(this.i2,mstate.ebp + -8244);
               si32(this.i0,mstate.ebp + -8256);
               this.i2 = FSM_luaL_loadfile;
               si32(this.i0,mstate.ebp + -8252);
               this.i10 = mstate.ebp + -8256;
               si32(this.i10,mstate.ebp + -8224);
               this.i1 = this.i1 == 0?int(this.i2):int(this.i1);
               si32(this.i1,mstate.ebp + -8208);
               si32(this.i0,mstate.ebp + -8220);
               si32(this.i0,mstate.ebp + -8212);
               this.i1 = li32(this.i3 + 108);
               this.i2 = li32(this.i8);
               this.i10 = li32(this.i3 + 32);
               mstate.esp = mstate.esp - 20;
               this.i11 = FSM_luaL_loadfile;
               this.i2 = this.i2 - this.i10;
               this.i10 = mstate.ebp + -8224;
               si32(this.i3,mstate.esp);
               si32(this.i11,mstate.esp + 4);
               si32(this.i10,mstate.esp + 8);
               si32(this.i2,mstate.esp + 12);
               si32(this.i1,mstate.esp + 16);
               state = 25;
               mstate.esp = mstate.esp - 4;
               FSM_luaL_loadfile.start();
               return;
            case 25:
               this.i1 = mstate.eax;
               mstate.esp = mstate.esp + 20;
               this.i2 = li32(this.i3 + 16);
               this.i10 = li32(mstate.ebp + -8212);
               this.i11 = li32(mstate.ebp + -8220);
               this.i12 = li32(this.i2 + 12);
               this.i13 = li32(this.i2 + 16);
               mstate.esp = mstate.esp - 16;
               si32(this.i13,mstate.esp);
               si32(this.i11,mstate.esp + 4);
               si32(this.i10,mstate.esp + 8);
               si32(this.i0,mstate.esp + 12);
               state = 26;
               mstate.esp = mstate.esp - 4;
               mstate.funcs[this.i12]();
               return;
            case 26:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 16;
               this.i0 = li32(this.i2 + 68);
               this.i0 = this.i0 - this.i10;
               si32(this.i0,this.i2 + 68);
               this.i0 = li32(this.i5);
               this.i2 = li16(this.i0 + 12);
               this.i2 = this.i2 & 64;
               if(this.i9 != 0)
               {
                  mstate.esp = mstate.esp - 4;
                  si32(this.i0,mstate.esp);
                  state = 27;
                  mstate.esp = mstate.esp - 4;
                  FSM_luaL_loadfile.start();
                  return;
               }
               addr2985:
               if(this.i2 != 0)
               {
                  this.i1 = li32(this.i8);
                  if(this.i6 >= 0)
                  {
                     this.i4 = li32(this.i7);
                     this.i0 = this.i6 * 12;
                     this.i0 = this.i4 + this.i0;
                     if(uint(this.i1) >= uint(this.i0))
                     {
                        this.i1 = this.i4;
                     }
                     else
                     {
                        do
                        {
                           this.i4 = 0;
                           si32(this.i4,this.i1 + 8);
                           this.i1 = this.i1 + 12;
                           si32(this.i1,this.i8);
                           this.i4 = li32(this.i7);
                           this.i0 = this.i6 * 12;
                           this.i0 = this.i4 + this.i0;
                        }
                        while(uint(this.i1) < uint(this.i0));
                        
                        this.i1 = this.i4;
                     }
                     this.i4 = this.i6 * 12;
                     this.i1 = this.i1 + this.i4;
                  }
                  else
                  {
                     this.i0 = this.i4 * 12;
                     this.i1 = this.i0 + this.i1;
                     this.i1 = this.i1 + 24;
                  }
                  this.i0 = FSM_luaL_loadfile;
                  si32(this.i1,this.i8);
                  mstate.esp = mstate.esp - 12;
                  si32(this.i3,mstate.esp);
                  si32(this.i0,mstate.esp + 4);
                  si32(this.i6,mstate.esp + 8);
                  state = 28;
                  mstate.esp = mstate.esp - 4;
                  FSM_luaL_loadfile.start();
                  return;
               }
               mstate.esp = mstate.esp - 8;
               si32(this.i3,mstate.esp);
               si32(this.i6,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_luaL_loadfile.start();
            case 27:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 4;
               §§goto(addr2985);
            case 28:
               mstate.esp = mstate.esp + 12;
               this.i1 = 6;
               addr3322:
               mstate.eax = this.i1;
               §§goto(addr3326);
            case 29:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i2 = li32(this.i8);
               this.i3 = this.i0;
               this.i4 = this.i0 + 12;
               if(uint(this.i4) >= uint(this.i2))
               {
                  this.i0 = this.i2;
               }
               else
               {
                  this.i0 = this.i0 + 12;
                  this.i2 = this.i3;
                  while(true)
                  {
                     this.f0 = lf64(this.i2 + 12);
                     sf64(this.f0,this.i2);
                     this.i3 = li32(this.i2 + 20);
                     si32(this.i3,this.i2 + 8);
                     this.i2 = li32(this.i8);
                     this.i3 = this.i0 + 12;
                     this.i4 = this.i0;
                     if(uint(this.i3) >= uint(this.i2))
                     {
                        break;
                     }
                     this.i0 = this.i3;
                     this.i2 = this.i4;
                  }
                  this.i0 = this.i2;
               }
               this.i0 = this.i0 + -12;
               si32(this.i0,this.i8);
               §§goto(addr3322);
         }
         while(true)
         {
            this.i0 = li32(this.i5);
            this.i1 = li32(this.i0 + 4);
            this.i1 = this.i1 + -1;
            si32(this.i1,this.i0 + 4);
            this.i0 = li32(this.i5);
            if(this.i1 <= -1)
            {
               break;
            }
            this.i1 = li32(this.i0);
            this.i10 = li8(this.i1);
            this.i1 = this.i1 + 1;
            si32(this.i1,this.i0);
            if(this.i10 == 27)
            {
               this.i0 = this.i10;
               §§goto(addr2514);
            }
            else
            {
               §§goto(addr2347);
            }
         }
         mstate.esp = mstate.esp - 4;
         si32(this.i0,mstate.esp);
         state = 22;
         mstate.esp = mstate.esp - 4;
         FSM_luaL_loadfile.start();
      }
   }
}
