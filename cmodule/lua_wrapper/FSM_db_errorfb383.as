package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.li8;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_db_errorfb383 extends Machine
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
      
      public function FSM_db_errorfb383()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM_db_errorfb383 = null;
         _loc1_ = new FSM_db_errorfb383();
         FSM_db_errorfb383.gworker = _loc1_;
      }
      
      override public final function work() : void
      {
         switch(state)
         {
            case 0:
               mstate.esp = mstate.esp - 4;
               si32(mstate.ebp,mstate.esp);
               mstate.ebp = mstate.esp;
               mstate.esp = mstate.esp - 112;
               this.i0 = mstate.ebp + -4;
               mstate.esp = mstate.esp - 8;
               this.i1 = li32(mstate.ebp + 8);
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_db_errorfb383.start();
            case 1:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i2 = li32(mstate.ebp + -4);
               mstate.esp = mstate.esp - 8;
               this.i2 = this.i2 + 2;
               si32(this.i1,mstate.esp);
               si32(this.i2,mstate.esp + 4);
               state = 2;
               mstate.esp = mstate.esp - 4;
               FSM_db_errorfb383.start();
               return;
            case 2:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               if(this.i2 != 0)
               {
                  this.i2 = li32(mstate.ebp + -4);
                  mstate.esp = mstate.esp - 8;
                  this.i2 = this.i2 + 2;
                  si32(this.i1,mstate.esp);
                  si32(this.i2,mstate.esp + 4);
                  state = 3;
                  mstate.esp = mstate.esp - 4;
                  FSM_db_errorfb383.start();
                  return;
               }
               this.i2 = this.i0 == this.i1?1:0;
               this.i3 = li32(this.i1 + 8);
               this.i4 = li32(this.i1 + 12);
               this.i5 = li32(mstate.ebp + -4);
               this.i2 = this.i2 & 1;
               this.i3 = this.i3 - this.i4;
               this.i3 = this.i3 / 12;
               if(this.i3 != this.i5)
               {
                  this.i3 = this.i5;
                  addr832:
                  this.i4 = FSM_db_errorfb383;
                  mstate.esp = mstate.esp - 8;
                  this.i3 = this.i3 + 1;
                  si32(this.i1,mstate.esp);
                  si32(this.i3,mstate.esp + 4);
                  mstate.esp = mstate.esp - 4;
                  FSM_db_errorfb383.start();
               }
               else
               {
                  addr248:
                  this.i3 = li32(this.i1 + 16);
                  this.i4 = li32(this.i3 + 68);
                  this.i3 = li32(this.i3 + 64);
                  this.i5 = this.i1 + 16;
                  if(uint(this.i4) >= uint(this.i3))
                  {
                     mstate.esp = mstate.esp - 4;
                     si32(this.i1,mstate.esp);
                     state = 4;
                     mstate.esp = mstate.esp - 4;
                     FSM_db_errorfb383.start();
                     return;
                  }
                  addr315:
                  this.i3 = FSM_db_errorfb383;
                  this.i4 = li32(this.i1 + 8);
                  mstate.esp = mstate.esp - 12;
                  this.i6 = 0;
                  si32(this.i1,mstate.esp);
                  si32(this.i3,mstate.esp + 4);
                  si32(this.i6,mstate.esp + 8);
                  state = 5;
                  mstate.esp = mstate.esp - 4;
                  FSM_db_errorfb383.start();
                  return;
               }
            case 3:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i3 = li32(this.i1 + 8);
               this.i3 = this.i3 + -12;
               si32(this.i3,this.i1 + 8);
               this.i4 = li32(this.i1 + 12);
               this.i5 = li32(mstate.ebp + -4);
               this.i3 = this.i3 - this.i4;
               this.i3 = this.i3 / 12;
               if(this.i3 != this.i5)
               {
                  this.i3 = this.i5;
                  §§goto(addr832);
               }
               else
               {
                  §§goto(addr248);
               }
            case 4:
               mstate.esp = mstate.esp + 4;
               §§goto(addr315);
            case 5:
               this.i3 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i3,this.i4);
               this.i3 = 4;
               si32(this.i3,this.i4 + 8);
               this.i3 = li32(this.i1 + 8);
               this.i3 = this.i3 + 12;
               si32(this.i3,this.i1 + 8);
               this.i3 = li32(this.i5);
               this.i4 = li32(this.i3 + 68);
               this.i3 = li32(this.i3 + 64);
               this.i5 = this.i1 + 8;
               if(uint(this.i4) >= uint(this.i3))
               {
                  mstate.esp = mstate.esp - 4;
                  si32(this.i1,mstate.esp);
                  state = 6;
                  mstate.esp = mstate.esp - 4;
                  FSM_db_errorfb383.start();
                  return;
               }
               addr477:
               this.i3 = FSM_db_errorfb383;
               this.i4 = li32(this.i5);
               mstate.esp = mstate.esp - 12;
               this.i6 = 16;
               si32(this.i1,mstate.esp);
               si32(this.i3,mstate.esp + 4);
               si32(this.i6,mstate.esp + 8);
               state = 7;
               mstate.esp = mstate.esp - 4;
               FSM_db_errorfb383.start();
               return;
            case 6:
               mstate.esp = mstate.esp + 4;
               §§goto(addr477);
            case 7:
               this.i3 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i3,this.i4);
               this.i3 = 4;
               si32(this.i3,this.i4 + 8);
               this.i3 = li32(this.i5);
               this.i3 = this.i3 + 12;
               si32(this.i3,this.i5);
               this.i3 = li32(this.i0 + 20);
               this.i4 = li32(this.i0 + 40);
               mstate.esp = mstate.esp - 16;
               this.i5 = mstate.ebp + -112;
               si32(this.i3,mstate.esp);
               si32(this.i4,mstate.esp + 4);
               si32(this.i2,mstate.esp + 8);
               si32(this.i5,mstate.esp + 12);
               mstate.esp = mstate.esp - 4;
               FSM_db_errorfb383.start();
            case 8:
               this.i3 = mstate.eax;
               mstate.esp = mstate.esp + 16;
               if(this.i3 != 0)
               {
                  this.i3 = 1;
                  this.i4 = this.i2;
                  addr653:
                  while(true)
                  {
                     this.i5 = this.i2 + 1;
                     if(this.i5 >= 13)
                     {
                        if(this.i3 != 0)
                        {
                           this.i3 = mstate.ebp + -112;
                           this.i6 = li32(this.i0 + 20);
                           this.i7 = li32(this.i0 + 40);
                           mstate.esp = mstate.esp - 16;
                           this.i8 = this.i4 + 11;
                           si32(this.i6,mstate.esp);
                           si32(this.i7,mstate.esp + 4);
                           si32(this.i8,mstate.esp + 8);
                           si32(this.i3,mstate.esp + 12);
                           mstate.esp = mstate.esp - 4;
                           FSM_db_errorfb383.start();
                        }
                        else
                        {
                           break;
                        }
                     }
                     break;
                  }
                  this.i2 = li32(this.i1 + 16);
                  this.i4 = li32(this.i2 + 68);
                  this.i2 = li32(this.i2 + 64);
                  this.i6 = this.i1 + 16;
                  if(uint(this.i4) >= uint(this.i2))
                  {
                     mstate.esp = mstate.esp - 4;
                     si32(this.i1,mstate.esp);
                     state = 19;
                     mstate.esp = mstate.esp - 4;
                     FSM_db_errorfb383.start();
                     return;
                  }
                  addr1625:
                  this.i2 = FSM_db_errorfb383;
                  this.i4 = li32(this.i1 + 8);
                  mstate.esp = mstate.esp - 12;
                  this.i7 = 2;
                  si32(this.i1,mstate.esp);
                  si32(this.i2,mstate.esp + 4);
                  si32(this.i7,mstate.esp + 8);
                  state = 20;
                  mstate.esp = mstate.esp - 4;
                  FSM_db_errorfb383.start();
                  return;
               }
               addr2465:
               this.i0 = 1;
               this.i2 = li32(this.i1 + 8);
               this.i3 = li32(this.i1 + 12);
               this.i4 = li32(mstate.ebp + -4);
               this.i2 = this.i2 - this.i3;
               this.i2 = this.i2 / 12;
               mstate.esp = mstate.esp - 8;
               this.i2 = this.i2 - this.i4;
               si32(this.i1,mstate.esp);
               si32(this.i2,mstate.esp + 4);
               state = 31;
               mstate.esp = mstate.esp - 4;
               FSM_db_errorfb383.start();
               return;
            case 9:
               while(true)
               {
                  this.i3 = mstate.eax;
                  mstate.esp = mstate.esp + 16;
                  this.i6 = this.i0 + 40;
                  this.i7 = this.i0 + 20;
                  if(this.i3 == 0)
                  {
                     this.i3 = 0;
                     this.i2 = this.i4;
                     addr2384:
                     while(true)
                     {
                        this.i4 = mstate.ebp + -112;
                        this.i5 = li32(this.i0 + 20);
                        this.i6 = li32(this.i0 + 40);
                        mstate.esp = mstate.esp - 16;
                        si32(this.i5,mstate.esp);
                        si32(this.i6,mstate.esp + 4);
                        si32(this.i2,mstate.esp + 8);
                        si32(this.i4,mstate.esp + 12);
                        mstate.esp = mstate.esp - 4;
                        FSM_db_errorfb383.start();
                     }
                  }
                  else
                  {
                     break;
                  }
               }
               this.i3 = li32(this.i1 + 16);
               this.i4 = li32(this.i3 + 68);
               this.i3 = li32(this.i3 + 64);
               if(uint(this.i4) >= uint(this.i3))
               {
                  mstate.esp = mstate.esp - 4;
                  si32(this.i1,mstate.esp);
                  state = 15;
                  mstate.esp = mstate.esp - 4;
                  FSM_db_errorfb383.start();
                  return;
               }
               addr1292:
               this.i3 = FSM_db_errorfb383;
               this.i4 = li32(this.i1 + 8);
               mstate.esp = mstate.esp - 12;
               this.i8 = 5;
               si32(this.i1,mstate.esp);
               si32(this.i3,mstate.esp + 4);
               si32(this.i8,mstate.esp + 8);
               state = 16;
               mstate.esp = mstate.esp - 4;
               FSM_db_errorfb383.start();
               return;
            case 10:
               this.i3 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               if(this.i3 != this.i4)
               {
                  this.i3 = li32(this.i3 + 8);
                  this.i3 = this.i3 + -3;
                  if(uint(this.i3) <= uint(1))
                  {
                     this.i3 = li32(this.i1 + 16);
                     this.i4 = li32(this.i3 + 68);
                     this.i3 = li32(this.i3 + 64);
                     this.i5 = this.i1 + 16;
                     if(uint(this.i4) >= uint(this.i3))
                     {
                        mstate.esp = mstate.esp - 4;
                        si32(this.i1,mstate.esp);
                        state = 11;
                        mstate.esp = mstate.esp - 4;
                        FSM_db_errorfb383.start();
                        return;
                     }
                     addr974:
                     this.i3 = FSM_db_errorfb383;
                     this.i4 = li32(this.i1 + 8);
                     mstate.esp = mstate.esp - 12;
                     this.i6 = 1;
                     si32(this.i1,mstate.esp);
                     si32(this.i3,mstate.esp + 4);
                     si32(this.i6,mstate.esp + 8);
                     state = 12;
                     mstate.esp = mstate.esp - 4;
                     FSM_db_errorfb383.start();
                     return;
                  }
               }
               this.i0 = 1;
               addr2550:
               mstate.eax = this.i0;
               mstate.esp = mstate.ebp;
               mstate.ebp = li32(mstate.esp);
               mstate.esp = mstate.esp + 4;
               mstate.esp = mstate.esp + 4;
               mstate.gworker = caller;
               return;
            case 11:
               mstate.esp = mstate.esp + 4;
               §§goto(addr974);
            case 12:
               this.i3 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i3,this.i4);
               this.i3 = 4;
               si32(this.i3,this.i4 + 8);
               this.i3 = li32(this.i1 + 8);
               this.i3 = this.i3 + 12;
               si32(this.i3,this.i1 + 8);
               this.i3 = li32(this.i5);
               this.i4 = li32(this.i3 + 68);
               this.i3 = li32(this.i3 + 64);
               this.i5 = this.i1 + 8;
               if(uint(this.i4) >= uint(this.i3))
               {
                  mstate.esp = mstate.esp - 4;
                  si32(this.i1,mstate.esp);
                  state = 13;
                  mstate.esp = mstate.esp - 4;
                  FSM_db_errorfb383.start();
                  return;
               }
               addr1136:
               this.i3 = FSM_db_errorfb383;
               this.i4 = li32(this.i5);
               mstate.esp = mstate.esp - 12;
               this.i6 = 16;
               si32(this.i1,mstate.esp);
               si32(this.i3,mstate.esp + 4);
               si32(this.i6,mstate.esp + 8);
               state = 14;
               mstate.esp = mstate.esp - 4;
               FSM_db_errorfb383.start();
               return;
            case 13:
               mstate.esp = mstate.esp + 4;
               §§goto(addr1136);
            case 14:
               this.i3 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i3,this.i4);
               this.i3 = 4;
               si32(this.i3,this.i4 + 8);
               this.i3 = li32(this.i5);
               this.i3 = this.i3 + 12;
               si32(this.i3,this.i5);
               this.i3 = 1;
               §§goto(addr2384);
            case 15:
               mstate.esp = mstate.esp + 4;
               §§goto(addr1292);
            case 16:
               this.i3 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i3,this.i4);
               this.i3 = 4;
               si32(this.i3,this.i4 + 8);
               this.i3 = li32(this.i1 + 8);
               this.i3 = this.i3 + 12;
               si32(this.i3,this.i1 + 8);
               this.i3 = li32(this.i7);
               this.i4 = li32(this.i6);
               mstate.esp = mstate.esp - 16;
               this.i8 = mstate.ebp + -112;
               this.i9 = this.i2 + 11;
               si32(this.i3,mstate.esp);
               si32(this.i4,mstate.esp + 4);
               si32(this.i9,mstate.esp + 8);
               si32(this.i8,mstate.esp + 12);
               mstate.esp = mstate.esp - 4;
               FSM_db_errorfb383.start();
            case 17:
               this.i3 = mstate.eax;
               mstate.esp = mstate.esp + 16;
               if(this.i3 != 0)
               {
                  this.i3 = this.i2;
                  addr1473:
                  while(true)
                  {
                     this.i2 = mstate.ebp + -112;
                     this.i4 = li32(this.i7);
                     this.i5 = li32(this.i6);
                     mstate.esp = mstate.esp - 16;
                     this.i8 = this.i3 + 12;
                     si32(this.i4,mstate.esp);
                     si32(this.i5,mstate.esp + 4);
                     si32(this.i8,mstate.esp + 8);
                     si32(this.i2,mstate.esp + 12);
                     mstate.esp = mstate.esp - 4;
                     FSM_db_errorfb383.start();
                  }
               }
               else
               {
                  this.i3 = 0;
                  this.i2 = this.i5;
               }
               §§goto(addr2384);
            case 18:
               while(true)
               {
                  this.i2 = mstate.eax;
                  mstate.esp = mstate.esp + 16;
                  this.i3 = this.i3 + 1;
                  if(this.i2 != 0)
                  {
                     §§goto(addr1473);
                  }
                  else
                  {
                     break;
                  }
               }
               this.i4 = 0;
               this.i2 = this.i3 + 1;
               this.i3 = this.i4;
               §§goto(addr2384);
            case 19:
               mstate.esp = mstate.esp + 4;
               §§goto(addr1625);
            case 20:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i2,this.i4);
               this.i2 = 4;
               si32(this.i2,this.i4 + 8);
               this.i2 = li32(this.i1 + 8);
               this.i2 = this.i2 + 12;
               si32(this.i2,this.i1 + 8);
               this.i2 = mstate.ebp + -112;
               mstate.esp = mstate.esp - 12;
               this.i4 = FSM_db_errorfb383;
               si32(this.i0,mstate.esp);
               si32(this.i4,mstate.esp + 4);
               si32(this.i2,mstate.esp + 8);
               state = 21;
               mstate.esp = mstate.esp - 4;
               FSM_db_errorfb383.start();
               return;
            case 21:
               this.i4 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               mstate.esp = mstate.esp - 12;
               this.i4 = FSM_db_errorfb383;
               this.i2 = this.i2 + 36;
               si32(this.i1,mstate.esp);
               si32(this.i4,mstate.esp + 4);
               si32(this.i2,mstate.esp + 8);
               state = 22;
               mstate.esp = mstate.esp - 4;
               FSM_db_errorfb383.start();
               return;
            case 22:
               this.i4 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               this.i4 = li32(mstate.ebp + -92);
               this.i7 = this.i1 + 8;
               if(this.i4 >= 1)
               {
                  this.i8 = FSM_db_errorfb383;
                  mstate.esp = mstate.esp - 12;
                  si32(this.i1,mstate.esp);
                  si32(this.i8,mstate.esp + 4);
                  si32(this.i4,mstate.esp + 8);
                  state = 23;
                  mstate.esp = mstate.esp - 4;
                  FSM_db_errorfb383.start();
                  return;
               }
               addr1908:
               this.i4 = li32(mstate.ebp + -104);
               this.i4 = li8(this.i4);
               if(this.i4 != 0)
               {
                  this.i2 = FSM_db_errorfb383;
                  this.i4 = li32(mstate.ebp + -108);
                  mstate.esp = mstate.esp - 12;
                  si32(this.i1,mstate.esp);
                  si32(this.i2,mstate.esp + 4);
                  si32(this.i4,mstate.esp + 8);
                  state = 24;
                  mstate.esp = mstate.esp - 4;
                  FSM_db_errorfb383.start();
                  return;
               }
               this.i4 = li32(mstate.ebp + -100);
               this.i4 = li8(this.i4);
               if(this.i4 != 67)
               {
                  this.i8 = this.i4 & 255;
                  if(this.i8 != 116)
                  {
                     this.i4 = this.i4 & 255;
                     if(this.i4 == 109)
                     {
                        this.i2 = FSM_db_errorfb383;
                        mstate.esp = mstate.esp - 8;
                        si32(this.i1,mstate.esp);
                        si32(this.i2,mstate.esp + 4);
                        state = 25;
                        mstate.esp = mstate.esp - 4;
                        FSM_db_errorfb383.start();
                        return;
                     }
                     this.i4 = FSM_db_errorfb383;
                     this.i6 = li32(mstate.ebp + -84);
                     mstate.esp = mstate.esp - 16;
                     si32(this.i1,mstate.esp);
                     si32(this.i4,mstate.esp + 4);
                     si32(this.i2,mstate.esp + 8);
                     si32(this.i6,mstate.esp + 12);
                     state = 28;
                     mstate.esp = mstate.esp - 4;
                     FSM_db_errorfb383.start();
                     return;
                  }
               }
               this.i2 = li32(this.i6);
               this.i4 = li32(this.i2 + 68);
               this.i2 = li32(this.i2 + 64);
               if(uint(this.i4) >= uint(this.i2))
               {
                  mstate.esp = mstate.esp - 4;
                  si32(this.i1,mstate.esp);
                  state = 26;
                  mstate.esp = mstate.esp - 4;
                  FSM_db_errorfb383.start();
                  return;
               }
               addr2130:
               this.i2 = FSM_db_errorfb383;
               this.i4 = li32(this.i7);
               mstate.esp = mstate.esp - 12;
               this.i6 = 2;
               si32(this.i1,mstate.esp);
               si32(this.i2,mstate.esp + 4);
               si32(this.i6,mstate.esp + 8);
               state = 27;
               mstate.esp = mstate.esp - 4;
               FSM_db_errorfb383.start();
               return;
            case 23:
               this.i4 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               §§goto(addr1908);
            case 24:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               break;
            case 25:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               break;
            case 26:
               mstate.esp = mstate.esp + 4;
               §§goto(addr2130);
            case 27:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i2,this.i4);
               this.i2 = 4;
               si32(this.i2,this.i4 + 8);
               this.i2 = li32(this.i7);
               this.i2 = this.i2 + 12;
               si32(this.i2,this.i7);
               break;
            case 28:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 16;
               break;
            case 29:
               mstate.esp = mstate.esp + 8;
               this.i2 = this.i5;
               §§goto(addr2384);
            case 30:
               while(true)
               {
                  this.i4 = mstate.eax;
                  mstate.esp = mstate.esp + 16;
                  if(this.i4 != 0)
                  {
                     this.i4 = this.i2;
                     §§goto(addr653);
                  }
                  else
                  {
                     break;
                  }
               }
               §§goto(addr2465);
            case 31:
               mstate.esp = mstate.esp + 8;
               §§goto(addr2550);
         }
         this.i2 = li32(this.i7);
         this.i4 = li32(this.i1 + 12);
         this.i6 = li32(mstate.ebp + -4);
         this.i2 = this.i2 - this.i4;
         this.i2 = this.i2 / 12;
         mstate.esp = mstate.esp - 8;
         this.i2 = this.i2 - this.i6;
         si32(this.i1,mstate.esp);
         si32(this.i2,mstate.esp + 4);
         state = 29;
         mstate.esp = mstate.esp - 4;
         FSM_db_errorfb383.start();
      }
   }
}
