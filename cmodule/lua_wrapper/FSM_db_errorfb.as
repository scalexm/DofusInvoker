package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.li8;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_db_errorfb extends Machine
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
      
      public function FSM_db_errorfb()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM_db_errorfb = null;
         _loc1_ = new FSM_db_errorfb();
         FSM_db_errorfb.gworker = _loc1_;
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
               this.i0 = 1;
               mstate.esp = mstate.esp - 8;
               this.i1 = li32(mstate.ebp + 8);
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_db_errorfb.start();
            case 1:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i2 = FSM_db_errorfb;
               if(this.i0 != this.i2)
               {
                  this.i0 = li32(this.i0 + 8);
                  if(this.i0 == 8)
                  {
                     this.i0 = 1;
                     mstate.esp = mstate.esp - 8;
                     si32(this.i1,mstate.esp);
                     si32(this.i0,mstate.esp + 4);
                     mstate.esp = mstate.esp - 4;
                     FSM_db_errorfb.start();
                  }
                  addr182:
                  mstate.esp = mstate.esp - 8;
                  this.i3 = this.i0 + 2;
                  si32(this.i1,mstate.esp);
                  si32(this.i3,mstate.esp + 4);
                  state = 3;
                  mstate.esp = mstate.esp - 4;
                  FSM_db_errorfb.start();
                  return;
               }
               this.i0 = 0;
               this.i2 = this.i1;
               §§goto(addr182);
            case 2:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i2 = li32(this.i0 + 8);
               if(this.i2 != 8)
               {
                  this.i2 = 0;
                  this.i0 = 1;
               }
               else
               {
                  this.i2 = 1;
                  this.i3 = li32(this.i0);
                  this.i0 = this.i2;
                  this.i2 = this.i3;
               }
               §§goto(addr182);
            case 3:
               this.i4 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               if(this.i4 != 0)
               {
                  mstate.esp = mstate.esp - 8;
                  si32(this.i1,mstate.esp);
                  si32(this.i3,mstate.esp + 4);
                  state = 4;
                  mstate.esp = mstate.esp - 4;
                  FSM_db_errorfb.start();
                  return;
               }
               this.i3 = this.i2 == this.i1?1:0;
               this.i4 = li32(this.i1 + 8);
               this.i5 = li32(this.i1 + 12);
               this.i4 = this.i4 - this.i5;
               this.i3 = this.i3 & 1;
               this.i4 = this.i4 / 12;
               if(this.i4 != this.i0)
               {
                  addr900:
                  this.i4 = FSM_db_errorfb;
                  mstate.esp = mstate.esp - 8;
                  this.i5 = this.i0 + 1;
                  si32(this.i1,mstate.esp);
                  si32(this.i5,mstate.esp + 4);
                  mstate.esp = mstate.esp - 4;
                  FSM_db_errorfb.start();
               }
               else
               {
                  addr323:
                  this.i4 = li32(this.i1 + 16);
                  this.i5 = li32(this.i4 + 68);
                  this.i4 = li32(this.i4 + 64);
                  this.i6 = this.i1 + 16;
                  if(uint(this.i5) >= uint(this.i4))
                  {
                     mstate.esp = mstate.esp - 4;
                     si32(this.i1,mstate.esp);
                     state = 5;
                     mstate.esp = mstate.esp - 4;
                     FSM_db_errorfb.start();
                     return;
                  }
                  addr390:
                  this.i4 = FSM_db_errorfb;
                  this.i5 = li32(this.i1 + 8);
                  mstate.esp = mstate.esp - 12;
                  this.i7 = 0;
                  si32(this.i1,mstate.esp);
                  si32(this.i4,mstate.esp + 4);
                  si32(this.i7,mstate.esp + 8);
                  state = 6;
                  mstate.esp = mstate.esp - 4;
                  FSM_db_errorfb.start();
                  return;
               }
            case 4:
               this.i3 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i4 = li32(this.i1 + 8);
               this.i4 = this.i4 + -12;
               si32(this.i4,this.i1 + 8);
               this.i5 = li32(this.i1 + 12);
               this.i4 = this.i4 - this.i5;
               this.i4 = this.i4 / 12;
               if(this.i4 != this.i0)
               {
                  §§goto(addr900);
               }
               else
               {
                  §§goto(addr323);
               }
            case 5:
               mstate.esp = mstate.esp + 4;
               §§goto(addr390);
            case 6:
               this.i4 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i4,this.i5);
               this.i4 = 4;
               si32(this.i4,this.i5 + 8);
               this.i4 = li32(this.i1 + 8);
               this.i4 = this.i4 + 12;
               si32(this.i4,this.i1 + 8);
               this.i4 = li32(this.i6);
               this.i5 = li32(this.i4 + 68);
               this.i4 = li32(this.i4 + 64);
               this.i6 = this.i1 + 8;
               if(uint(this.i5) >= uint(this.i4))
               {
                  mstate.esp = mstate.esp - 4;
                  si32(this.i1,mstate.esp);
                  state = 7;
                  mstate.esp = mstate.esp - 4;
                  FSM_db_errorfb.start();
                  return;
               }
               addr552:
               this.i4 = FSM_db_errorfb;
               this.i5 = li32(this.i6);
               mstate.esp = mstate.esp - 12;
               this.i7 = 16;
               si32(this.i1,mstate.esp);
               si32(this.i4,mstate.esp + 4);
               si32(this.i7,mstate.esp + 8);
               state = 8;
               mstate.esp = mstate.esp - 4;
               FSM_db_errorfb.start();
               return;
            case 7:
               mstate.esp = mstate.esp + 4;
               §§goto(addr552);
            case 8:
               this.i4 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i4,this.i5);
               this.i4 = 4;
               si32(this.i4,this.i5 + 8);
               this.i4 = li32(this.i6);
               this.i4 = this.i4 + 12;
               si32(this.i4,this.i6);
               this.i4 = li32(this.i2 + 20);
               this.i5 = li32(this.i2 + 40);
               mstate.esp = mstate.esp - 16;
               this.i6 = mstate.ebp + -112;
               si32(this.i4,mstate.esp);
               si32(this.i5,mstate.esp + 4);
               si32(this.i3,mstate.esp + 8);
               si32(this.i6,mstate.esp + 12);
               mstate.esp = mstate.esp - 4;
               FSM_db_errorfb.start();
            case 9:
               this.i4 = mstate.eax;
               mstate.esp = mstate.esp + 16;
               if(this.i4 != 0)
               {
                  this.i4 = 1;
                  this.i5 = this.i3;
                  addr728:
                  while(true)
                  {
                     this.i6 = this.i3 + 1;
                     if(this.i6 >= 13)
                     {
                        if(this.i4 != 0)
                        {
                           this.i4 = mstate.ebp + -112;
                           this.i7 = li32(this.i2 + 20);
                           this.i8 = li32(this.i2 + 40);
                           mstate.esp = mstate.esp - 16;
                           this.i9 = this.i5 + 11;
                           si32(this.i7,mstate.esp);
                           si32(this.i8,mstate.esp + 4);
                           si32(this.i9,mstate.esp + 8);
                           si32(this.i4,mstate.esp + 12);
                           mstate.esp = mstate.esp - 4;
                           FSM_db_errorfb.start();
                        }
                        else
                        {
                           break;
                        }
                     }
                     break;
                  }
                  this.i3 = li32(this.i1 + 16);
                  this.i5 = li32(this.i3 + 68);
                  this.i3 = li32(this.i3 + 64);
                  this.i7 = this.i1 + 16;
                  if(uint(this.i5) >= uint(this.i3))
                  {
                     mstate.esp = mstate.esp - 4;
                     si32(this.i1,mstate.esp);
                     state = 20;
                     mstate.esp = mstate.esp - 4;
                     FSM_db_errorfb.start();
                     return;
                  }
                  addr1693:
                  this.i3 = FSM_db_errorfb;
                  this.i5 = li32(this.i1 + 8);
                  mstate.esp = mstate.esp - 12;
                  this.i8 = 2;
                  si32(this.i1,mstate.esp);
                  si32(this.i3,mstate.esp + 4);
                  si32(this.i8,mstate.esp + 8);
                  state = 21;
                  mstate.esp = mstate.esp - 4;
                  FSM_db_errorfb.start();
                  return;
               }
               addr2744:
               this.i2 = 1;
               this.i3 = li32(this.i1 + 8);
               this.i4 = li32(this.i1 + 12);
               this.i3 = this.i3 - this.i4;
               this.i3 = this.i3 / 12;
               mstate.esp = mstate.esp - 8;
               this.i0 = this.i3 - this.i0;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               state = 35;
               mstate.esp = mstate.esp - 4;
               FSM_db_errorfb.start();
               return;
            case 10:
               while(true)
               {
                  this.i4 = mstate.eax;
                  mstate.esp = mstate.esp + 16;
                  this.i7 = this.i2 + 40;
                  this.i8 = this.i2 + 20;
                  if(this.i4 == 0)
                  {
                     this.i3 = 0;
                     this.i4 = this.i3;
                     this.i3 = this.i5;
                     addr2663:
                     while(true)
                     {
                        this.i5 = mstate.ebp + -112;
                        this.i6 = li32(this.i2 + 20);
                        this.i7 = li32(this.i2 + 40);
                        mstate.esp = mstate.esp - 16;
                        si32(this.i6,mstate.esp);
                        si32(this.i7,mstate.esp + 4);
                        si32(this.i3,mstate.esp + 8);
                        si32(this.i5,mstate.esp + 12);
                        mstate.esp = mstate.esp - 4;
                        FSM_db_errorfb.start();
                     }
                  }
                  else
                  {
                     break;
                  }
               }
               this.i4 = li32(this.i1 + 16);
               this.i5 = li32(this.i4 + 68);
               this.i4 = li32(this.i4 + 64);
               if(uint(this.i5) >= uint(this.i4))
               {
                  mstate.esp = mstate.esp - 4;
                  si32(this.i1,mstate.esp);
                  state = 16;
                  mstate.esp = mstate.esp - 4;
                  FSM_db_errorfb.start();
                  return;
               }
               addr1360:
               this.i4 = FSM_db_errorfb;
               this.i5 = li32(this.i1 + 8);
               mstate.esp = mstate.esp - 12;
               this.i9 = 5;
               si32(this.i1,mstate.esp);
               si32(this.i4,mstate.esp + 4);
               si32(this.i9,mstate.esp + 8);
               state = 17;
               mstate.esp = mstate.esp - 4;
               FSM_db_errorfb.start();
               return;
            case 11:
               this.i5 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               if(this.i5 != this.i4)
               {
                  this.i4 = li32(this.i5 + 8);
                  this.i4 = this.i4 + -3;
                  if(uint(this.i4) <= uint(1))
                  {
                     this.i4 = li32(this.i1 + 16);
                     this.i5 = li32(this.i4 + 68);
                     this.i4 = li32(this.i4 + 64);
                     this.i6 = this.i1 + 16;
                     if(uint(this.i5) >= uint(this.i4))
                     {
                        mstate.esp = mstate.esp - 4;
                        si32(this.i1,mstate.esp);
                        state = 12;
                        mstate.esp = mstate.esp - 4;
                        FSM_db_errorfb.start();
                        return;
                     }
                     addr1042:
                     this.i4 = FSM_db_errorfb;
                     this.i5 = li32(this.i1 + 8);
                     mstate.esp = mstate.esp - 12;
                     this.i7 = 1;
                     si32(this.i1,mstate.esp);
                     si32(this.i4,mstate.esp + 4);
                     si32(this.i7,mstate.esp + 8);
                     state = 13;
                     mstate.esp = mstate.esp - 4;
                     FSM_db_errorfb.start();
                     return;
                  }
               }
               this.i0 = 1;
               mstate.eax = this.i0;
               addr2830:
               mstate.esp = mstate.ebp;
               mstate.ebp = li32(mstate.esp);
               mstate.esp = mstate.esp + 4;
               mstate.esp = mstate.esp + 4;
               mstate.gworker = caller;
               return;
            case 12:
               mstate.esp = mstate.esp + 4;
               §§goto(addr1042);
            case 13:
               this.i4 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i4,this.i5);
               this.i4 = 4;
               si32(this.i4,this.i5 + 8);
               this.i4 = li32(this.i1 + 8);
               this.i4 = this.i4 + 12;
               si32(this.i4,this.i1 + 8);
               this.i4 = li32(this.i6);
               this.i5 = li32(this.i4 + 68);
               this.i4 = li32(this.i4 + 64);
               this.i6 = this.i1 + 8;
               if(uint(this.i5) >= uint(this.i4))
               {
                  mstate.esp = mstate.esp - 4;
                  si32(this.i1,mstate.esp);
                  state = 14;
                  mstate.esp = mstate.esp - 4;
                  FSM_db_errorfb.start();
                  return;
               }
               addr1204:
               this.i4 = FSM_db_errorfb;
               this.i5 = li32(this.i6);
               mstate.esp = mstate.esp - 12;
               this.i7 = 16;
               si32(this.i1,mstate.esp);
               si32(this.i4,mstate.esp + 4);
               si32(this.i7,mstate.esp + 8);
               state = 15;
               mstate.esp = mstate.esp - 4;
               FSM_db_errorfb.start();
               return;
            case 14:
               mstate.esp = mstate.esp + 4;
               §§goto(addr1204);
            case 15:
               this.i4 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i4,this.i5);
               this.i4 = 4;
               si32(this.i4,this.i5 + 8);
               this.i4 = li32(this.i6);
               this.i4 = this.i4 + 12;
               si32(this.i4,this.i6);
               this.i4 = 1;
               §§goto(addr2663);
            case 16:
               mstate.esp = mstate.esp + 4;
               §§goto(addr1360);
            case 17:
               this.i4 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i4,this.i5);
               this.i4 = 4;
               si32(this.i4,this.i5 + 8);
               this.i4 = li32(this.i1 + 8);
               this.i4 = this.i4 + 12;
               si32(this.i4,this.i1 + 8);
               this.i4 = li32(this.i8);
               this.i5 = li32(this.i7);
               mstate.esp = mstate.esp - 16;
               this.i9 = mstate.ebp + -112;
               this.i10 = this.i3 + 11;
               si32(this.i4,mstate.esp);
               si32(this.i5,mstate.esp + 4);
               si32(this.i10,mstate.esp + 8);
               si32(this.i9,mstate.esp + 12);
               mstate.esp = mstate.esp - 4;
               FSM_db_errorfb.start();
            case 18:
               this.i4 = mstate.eax;
               mstate.esp = mstate.esp + 16;
               if(this.i4 != 0)
               {
                  this.i4 = this.i3;
                  addr1541:
                  while(true)
                  {
                     this.i3 = mstate.ebp + -112;
                     this.i5 = li32(this.i8);
                     this.i6 = li32(this.i7);
                     mstate.esp = mstate.esp - 16;
                     this.i9 = this.i4 + 12;
                     si32(this.i5,mstate.esp);
                     si32(this.i6,mstate.esp + 4);
                     si32(this.i9,mstate.esp + 8);
                     si32(this.i3,mstate.esp + 12);
                     mstate.esp = mstate.esp - 4;
                     FSM_db_errorfb.start();
                  }
               }
               else
               {
                  this.i4 = 0;
                  this.i3 = this.i6;
               }
               §§goto(addr2663);
            case 19:
               while(true)
               {
                  this.i3 = mstate.eax;
                  mstate.esp = mstate.esp + 16;
                  this.i4 = this.i4 + 1;
                  if(this.i3 != 0)
                  {
                     §§goto(addr1541);
                  }
                  else
                  {
                     break;
                  }
               }
               this.i3 = 0;
               this.i5 = this.i4 + 1;
               this.i4 = this.i3;
               this.i3 = this.i5;
               §§goto(addr2663);
            case 20:
               mstate.esp = mstate.esp + 4;
               §§goto(addr1693);
            case 21:
               this.i3 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i3,this.i5);
               this.i3 = 4;
               si32(this.i3,this.i5 + 8);
               this.i3 = li32(this.i1 + 8);
               this.i3 = this.i3 + 12;
               si32(this.i3,this.i1 + 8);
               this.i3 = mstate.ebp + -112;
               mstate.esp = mstate.esp - 12;
               this.i5 = FSM_db_errorfb;
               si32(this.i2,mstate.esp);
               si32(this.i5,mstate.esp + 4);
               si32(this.i3,mstate.esp + 8);
               state = 22;
               mstate.esp = mstate.esp - 4;
               FSM_db_errorfb.start();
               return;
            case 22:
               this.i5 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               mstate.esp = mstate.esp - 12;
               this.i5 = FSM_db_errorfb;
               this.i3 = this.i3 + 36;
               si32(this.i1,mstate.esp);
               si32(this.i5,mstate.esp + 4);
               si32(this.i3,mstate.esp + 8);
               state = 23;
               mstate.esp = mstate.esp - 4;
               FSM_db_errorfb.start();
               return;
            case 23:
               this.i5 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               this.i5 = li32(mstate.ebp + -92);
               this.i8 = this.i1 + 8;
               if(this.i5 >= 1)
               {
                  this.i9 = FSM_db_errorfb;
                  mstate.esp = mstate.esp - 12;
                  si32(this.i1,mstate.esp);
                  si32(this.i9,mstate.esp + 4);
                  si32(this.i5,mstate.esp + 8);
                  state = 24;
                  mstate.esp = mstate.esp - 4;
                  FSM_db_errorfb.start();
                  return;
               }
               addr1976:
               this.i5 = li32(mstate.ebp + -104);
               this.i5 = li8(this.i5);
               if(this.i5 != 0)
               {
                  this.i3 = FSM_db_errorfb;
                  this.i5 = li32(mstate.ebp + -108);
                  mstate.esp = mstate.esp - 12;
                  si32(this.i1,mstate.esp);
                  si32(this.i3,mstate.esp + 4);
                  si32(this.i5,mstate.esp + 8);
                  state = 25;
                  mstate.esp = mstate.esp - 4;
                  FSM_db_errorfb.start();
                  return;
               }
               this.i5 = li32(mstate.ebp + -100);
               this.i5 = li8(this.i5);
               if(this.i5 != 67)
               {
                  this.i9 = this.i5 & 255;
                  if(this.i9 != 116)
                  {
                     this.i5 = this.i5 & 255;
                     if(this.i5 == 109)
                     {
                        this.i3 = FSM_db_errorfb;
                        mstate.esp = mstate.esp - 8;
                        si32(this.i1,mstate.esp);
                        si32(this.i3,mstate.esp + 4);
                        state = 27;
                        mstate.esp = mstate.esp - 4;
                        FSM_db_errorfb.start();
                        return;
                     }
                     this.i5 = FSM_db_errorfb;
                     this.i7 = li32(mstate.ebp + -84);
                     mstate.esp = mstate.esp - 16;
                     si32(this.i1,mstate.esp);
                     si32(this.i5,mstate.esp + 4);
                     si32(this.i3,mstate.esp + 8);
                     si32(this.i7,mstate.esp + 12);
                     state = 32;
                     mstate.esp = mstate.esp - 4;
                     FSM_db_errorfb.start();
                     return;
                  }
               }
               this.i3 = li32(this.i7);
               this.i5 = li32(this.i3 + 68);
               this.i3 = li32(this.i3 + 64);
               if(uint(this.i5) >= uint(this.i3))
               {
                  mstate.esp = mstate.esp - 4;
                  si32(this.i1,mstate.esp);
                  state = 29;
                  mstate.esp = mstate.esp - 4;
                  FSM_db_errorfb.start();
                  return;
               }
               break;
            case 24:
               this.i5 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               §§goto(addr1976);
            case 25:
               this.i3 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               this.i3 = li32(this.i8);
               this.i5 = li32(this.i1 + 12);
               this.i3 = this.i3 - this.i5;
               this.i3 = this.i3 / 12;
               mstate.esp = mstate.esp - 8;
               this.i3 = this.i3 - this.i0;
               si32(this.i1,mstate.esp);
               si32(this.i3,mstate.esp + 4);
               state = 26;
               mstate.esp = mstate.esp - 4;
               FSM_db_errorfb.start();
               return;
            case 26:
               mstate.esp = mstate.esp + 8;
               this.i3 = this.i6;
               §§goto(addr2663);
            case 27:
               this.i3 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i3 = li32(this.i8);
               this.i5 = li32(this.i1 + 12);
               this.i3 = this.i3 - this.i5;
               this.i3 = this.i3 / 12;
               mstate.esp = mstate.esp - 8;
               this.i3 = this.i3 - this.i0;
               si32(this.i1,mstate.esp);
               si32(this.i3,mstate.esp + 4);
               state = 28;
               mstate.esp = mstate.esp - 4;
               FSM_db_errorfb.start();
               return;
            case 28:
               mstate.esp = mstate.esp + 8;
               this.i3 = this.i6;
               §§goto(addr2663);
            case 29:
               mstate.esp = mstate.esp + 4;
               break;
            case 30:
               this.i3 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i3,this.i5);
               this.i3 = 4;
               si32(this.i3,this.i5 + 8);
               this.i3 = li32(this.i8);
               this.i3 = this.i3 + 12;
               si32(this.i3,this.i8);
               this.i5 = li32(this.i1 + 12);
               this.i3 = this.i3 - this.i5;
               this.i3 = this.i3 / 12;
               mstate.esp = mstate.esp - 8;
               this.i3 = this.i3 - this.i0;
               si32(this.i1,mstate.esp);
               si32(this.i3,mstate.esp + 4);
               state = 31;
               mstate.esp = mstate.esp - 4;
               FSM_db_errorfb.start();
               return;
            case 31:
               mstate.esp = mstate.esp + 8;
               this.i3 = this.i6;
               §§goto(addr2663);
            case 32:
               this.i3 = mstate.eax;
               mstate.esp = mstate.esp + 16;
               this.i3 = li32(this.i8);
               this.i5 = li32(this.i1 + 12);
               this.i3 = this.i3 - this.i5;
               this.i3 = this.i3 / 12;
               mstate.esp = mstate.esp - 8;
               this.i3 = this.i3 - this.i0;
               si32(this.i1,mstate.esp);
               si32(this.i3,mstate.esp + 4);
               state = 33;
               mstate.esp = mstate.esp - 4;
               FSM_db_errorfb.start();
               return;
            case 33:
               mstate.esp = mstate.esp + 8;
               this.i3 = this.i6;
               §§goto(addr2663);
            case 34:
               while(true)
               {
                  this.i5 = mstate.eax;
                  mstate.esp = mstate.esp + 16;
                  if(this.i5 != 0)
                  {
                     this.i5 = this.i3;
                     §§goto(addr728);
                  }
                  else
                  {
                     break;
                  }
               }
               §§goto(addr2744);
            case 35:
               mstate.esp = mstate.esp + 8;
               mstate.eax = this.i2;
               §§goto(addr2830);
         }
         this.i3 = FSM_db_errorfb;
         this.i5 = li32(this.i8);
         mstate.esp = mstate.esp - 12;
         this.i7 = 2;
         si32(this.i1,mstate.esp);
         si32(this.i3,mstate.esp + 4);
         si32(this.i7,mstate.esp + 8);
         state = 30;
         mstate.esp = mstate.esp - 4;
         FSM_db_errorfb.start();
      }
   }
}
