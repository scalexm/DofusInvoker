package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.lf64;
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.li8;
   import avm2.intrinsics.memory.sf64;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_db_getinfo extends Machine
   {
      
      public static const intRegCount:int = 10;
      
      public static const NumberRegCount:int = 1;
       
      
      public var i0:int;
      
      public var i1:int;
      
      public var i2:int;
      
      public var i3:int;
      
      public var i4:int;
      
      public var i5:int;
      
      public var i6:int;
      
      public var i8:int;
      
      public var f0:Number;
      
      public var i7:int;
      
      public var i9:int;
      
      public function FSM_db_getinfo()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM_db_getinfo = null;
         _loc1_ = new FSM_db_getinfo();
         FSM_db_getinfo.gworker = _loc1_;
      }
      
      override public final function work() : void
      {
         switch(state)
         {
            case 0:
               mstate.esp = mstate.esp - 4;
               si32(mstate.ebp,mstate.esp);
               mstate.ebp = mstate.esp;
               mstate.esp = mstate.esp - 260;
               this.i0 = mstate.ebp + -260;
               mstate.esp = mstate.esp - 8;
               this.i1 = li32(mstate.ebp + 8);
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_db_getinfo.start();
            case 1:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i2 = li32(mstate.ebp + -260);
               mstate.esp = mstate.esp - 8;
               this.i2 = this.i2 + 2;
               si32(this.i1,mstate.esp);
               si32(this.i2,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_db_getinfo.start();
            case 2:
               this.i3 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i4 = FSM_db_getinfo;
               if(this.i3 != this.i4)
               {
                  this.i3 = li32(this.i3 + 8);
                  if(this.i3 >= 1)
                  {
                     this.i3 = 0;
                     mstate.esp = mstate.esp - 12;
                     si32(this.i1,mstate.esp);
                     si32(this.i2,mstate.esp + 4);
                     si32(this.i3,mstate.esp + 8);
                     state = 3;
                     mstate.esp = mstate.esp - 4;
                     FSM_db_getinfo.start();
                     return;
                  }
               }
               this.i2 = FSM_db_getinfo;
               addr207:
               this.i3 = li32(mstate.ebp + -260);
               mstate.esp = mstate.esp - 8;
               this.i3 = this.i3 + 1;
               si32(this.i1,mstate.esp);
               si32(this.i3,mstate.esp + 4);
               state = 4;
               mstate.esp = mstate.esp - 4;
               FSM_db_getinfo.start();
               return;
            case 3:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               §§goto(addr207);
            case 4:
               this.i3 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i4 = li32(mstate.ebp + -260);
               this.i4 = this.i4 + 1;
               if(this.i3 != 0)
               {
                  this.i3 = mstate.ebp + -256;
                  mstate.esp = mstate.esp - 8;
                  si32(this.i1,mstate.esp);
                  si32(this.i4,mstate.esp + 4);
                  state = 5;
                  mstate.esp = mstate.esp - 4;
                  FSM_db_getinfo.start();
                  return;
               }
               this.i3 = FSM_db_getinfo;
               mstate.esp = mstate.esp - 8;
               si32(this.i1,mstate.esp);
               si32(this.i4,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_db_getinfo.start();
            case 5:
               this.i4 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i5 = li32(this.i0 + 20);
               this.i6 = li32(this.i0 + 40);
               mstate.esp = mstate.esp - 16;
               si32(this.i5,mstate.esp);
               si32(this.i6,mstate.esp + 4);
               si32(this.i4,mstate.esp + 8);
               si32(this.i3,mstate.esp + 12);
               mstate.esp = mstate.esp - 4;
               FSM_db_getinfo.start();
            case 6:
               this.i4 = mstate.eax;
               mstate.esp = mstate.esp + 16;
               if(this.i4 == 0)
               {
                  this.i0 = 0;
                  this.i2 = li32(this.i1 + 8);
                  si32(this.i0,this.i2 + 8);
                  this.i0 = li32(this.i1 + 8);
                  this.i0 = this.i0 + 12;
                  si32(this.i0,this.i1 + 8);
                  addr3456:
                  addr3461:
                  this.i0 = 1;
                  mstate.eax = this.i0;
                  break;
               }
               this.i3 = mstate.ebp + -256;
               mstate.esp = mstate.esp - 12;
               si32(this.i0,mstate.esp);
               si32(this.i2,mstate.esp + 4);
               si32(this.i3,mstate.esp + 8);
               state = 13;
               mstate.esp = mstate.esp - 4;
               FSM_db_getinfo.start();
               return;
            case 7:
               this.i4 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               if(this.i4 != this.i3)
               {
                  this.i3 = li32(this.i4 + 8);
                  if(this.i3 == 6)
                  {
                     this.i3 = FSM_db_getinfo;
                     mstate.esp = mstate.esp - 12;
                     si32(this.i1,mstate.esp);
                     si32(this.i3,mstate.esp + 4);
                     si32(this.i2,mstate.esp + 8);
                     state = 8;
                     mstate.esp = mstate.esp - 4;
                     FSM_db_getinfo.start();
                     return;
                  }
               }
               this.i2 = FSM_db_getinfo;
               this.i0 = li32(mstate.ebp + -260);
               mstate.esp = mstate.esp - 12;
               this.i0 = this.i0 + 1;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               si32(this.i2,mstate.esp + 8);
               state = 12;
               mstate.esp = mstate.esp - 4;
               FSM_db_getinfo.start();
               return;
            case 8:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               mstate.esp = mstate.esp - 12;
               this.i2 = -1;
               this.i3 = 0;
               si32(this.i1,mstate.esp);
               si32(this.i2,mstate.esp + 4);
               si32(this.i3,mstate.esp + 8);
               state = 9;
               mstate.esp = mstate.esp - 4;
               FSM_db_getinfo.start();
               return;
            case 9:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               this.i3 = li32(mstate.ebp + -260);
               mstate.esp = mstate.esp - 8;
               this.i3 = this.i3 + 1;
               si32(this.i1,mstate.esp);
               si32(this.i3,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_db_getinfo.start();
            case 10:
               this.i3 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i4 = li32(this.i1 + 8);
               this.f0 = lf64(this.i3);
               sf64(this.f0,this.i4);
               this.i3 = li32(this.i3 + 8);
               si32(this.i3,this.i4 + 8);
               this.i3 = li32(this.i1 + 8);
               this.i4 = this.i3 + 12;
               si32(this.i4,this.i1 + 8);
               this.i4 = this.i1 + 8;
               if(this.i0 != this.i1)
               {
                  this.i5 = 0;
                  si32(this.i3,this.i4);
                  this.i3 = this.i0 + 8;
                  this.i6 = this.i5;
                  while(true)
                  {
                     this.i7 = li32(this.i3);
                     this.i8 = li32(this.i4);
                     this.i9 = this.i7 + 12;
                     si32(this.i9,this.i3);
                     this.i8 = this.i8 + this.i6;
                     this.f0 = lf64(this.i8);
                     sf64(this.f0,this.i7);
                     this.i8 = li32(this.i8 + 8);
                     si32(this.i8,this.i7 + 8);
                     this.i6 = this.i6 + 12;
                     this.i7 = this.i5 + 1;
                     if(this.i5 != 0)
                     {
                        this.i5 = this.i7;
                        continue;
                     }
                     break;
                  }
               }
               this.i3 = mstate.ebp + -256;
               mstate.esp = mstate.esp - 12;
               si32(this.i0,mstate.esp);
               si32(this.i2,mstate.esp + 4);
               si32(this.i3,mstate.esp + 8);
               state = 11;
               mstate.esp = mstate.esp - 4;
               FSM_db_getinfo.start();
               return;
            case 11:
               this.i3 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               if(this.i3 != 0)
               {
                  addr996:
                  this.i3 = 2;
                  mstate.esp = mstate.esp - 8;
                  si32(this.i1,mstate.esp);
                  si32(this.i3,mstate.esp + 4);
                  state = 14;
                  mstate.esp = mstate.esp - 4;
                  FSM_db_getinfo.start();
                  return;
               }
               addr3518:
               this.i0 = FSM_db_getinfo;
               this.i2 = li32(mstate.ebp + -260);
               mstate.esp = mstate.esp - 12;
               this.i2 = this.i2 + 2;
               si32(this.i1,mstate.esp);
               si32(this.i2,mstate.esp + 4);
               si32(this.i0,mstate.esp + 8);
               state = 42;
               mstate.esp = mstate.esp - 4;
               FSM_db_getinfo.start();
               return;
            case 12:
               mstate.esp = mstate.esp + 12;
               this.i2 = 0;
               mstate.eax = this.i2;
               break;
            case 13:
               this.i3 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               if(this.i3 != 0)
               {
                  §§goto(addr996);
               }
               else
               {
                  §§goto(addr3518);
               }
            case 14:
               mstate.esp = mstate.esp + 8;
               this.i3 = li8(this.i2);
               this.i4 = this.i2;
               if(this.i3 != 83)
               {
                  this.i3 = this.i4;
                  while(true)
                  {
                     this.i5 = li8(this.i3);
                     if(this.i5 == 0)
                     {
                        this.i3 = 0;
                        break;
                     }
                     this.i5 = li8(this.i3 + 1);
                     this.i3 = this.i3 + 1;
                     this.i6 = this.i3;
                     if(this.i5 != 83)
                     {
                        this.i3 = this.i6;
                        continue;
                     }
                     break;
                  }
               }
               else
               {
                  this.i3 = this.i2;
               }
               if(this.i3 != 0)
               {
                  this.i3 = -2;
                  this.i5 = li32(mstate.ebp + -240);
                  mstate.esp = mstate.esp - 8;
                  si32(this.i1,mstate.esp);
                  si32(this.i5,mstate.esp + 4);
                  state = 43;
                  mstate.esp = mstate.esp - 4;
                  FSM_db_getinfo.start();
                  return;
               }
               addr2390:
               this.i3 = li8(this.i2);
               if(this.i3 != 108)
               {
                  this.i3 = this.i4;
                  while(true)
                  {
                     this.i5 = li8(this.i3);
                     if(this.i5 == 0)
                     {
                        this.i3 = 0;
                        break;
                     }
                     this.i5 = li8(this.i3 + 1);
                     this.i3 = this.i3 + 1;
                     this.i6 = this.i3;
                     if(this.i5 != 108)
                     {
                        this.i3 = this.i6;
                        continue;
                     }
                     break;
                  }
               }
               else
               {
                  this.i3 = this.i2;
               }
               if(this.i3 != 0)
               {
                  this.i3 = 3;
                  this.i5 = li32(mstate.ebp + -236);
                  this.i6 = li32(this.i1 + 8);
                  this.f0 = Number(this.i5);
                  sf64(this.f0,this.i6);
                  si32(this.i3,this.i6 + 8);
                  this.i3 = li32(this.i1 + 8);
                  this.i3 = this.i3 + 12;
                  si32(this.i3,this.i1 + 8);
                  mstate.esp = mstate.esp - 8;
                  this.i3 = -2;
                  si32(this.i1,mstate.esp);
                  si32(this.i3,mstate.esp + 4);
                  mstate.esp = mstate.esp - 4;
                  FSM_db_getinfo.start();
               }
               else
               {
                  addr2611:
                  this.i3 = li8(this.i2);
                  if(this.i3 != 117)
                  {
                     this.i3 = this.i4;
                     while(true)
                     {
                        this.i5 = li8(this.i3);
                        if(this.i5 == 0)
                        {
                           this.i3 = 0;
                           break;
                        }
                        this.i5 = li8(this.i3 + 1);
                        this.i3 = this.i3 + 1;
                        this.i6 = this.i3;
                        if(this.i5 != 117)
                        {
                           this.i3 = this.i6;
                           continue;
                        }
                        break;
                     }
                  }
                  else
                  {
                     this.i3 = this.i2;
                  }
                  if(this.i3 != 0)
                  {
                     this.i3 = 3;
                     this.i5 = li32(mstate.ebp + -232);
                     this.i6 = li32(this.i1 + 8);
                     this.f0 = Number(this.i5);
                     sf64(this.f0,this.i6);
                     si32(this.i3,this.i6 + 8);
                     this.i3 = li32(this.i1 + 8);
                     this.i3 = this.i3 + 12;
                     si32(this.i3,this.i1 + 8);
                     mstate.esp = mstate.esp - 8;
                     this.i3 = -2;
                     si32(this.i1,mstate.esp);
                     si32(this.i3,mstate.esp + 4);
                     mstate.esp = mstate.esp - 4;
                     FSM_db_getinfo.start();
                  }
                  else
                  {
                     addr2832:
                     this.i3 = li8(this.i2);
                     if(this.i3 != 110)
                     {
                        this.i3 = this.i4;
                        while(true)
                        {
                           this.i5 = li8(this.i3);
                           if(this.i5 == 0)
                           {
                              this.i3 = 0;
                              break;
                           }
                           this.i5 = li8(this.i3 + 1);
                           this.i3 = this.i3 + 1;
                           this.i6 = this.i3;
                           if(this.i5 != 110)
                           {
                              this.i3 = this.i6;
                              continue;
                           }
                           break;
                        }
                     }
                     else
                     {
                        this.i3 = this.i2;
                     }
                     if(this.i3 != 0)
                     {
                        this.i3 = -2;
                        this.i5 = li32(mstate.ebp + -252);
                        mstate.esp = mstate.esp - 8;
                        si32(this.i1,mstate.esp);
                        si32(this.i5,mstate.esp + 4);
                        state = 47;
                        mstate.esp = mstate.esp - 4;
                        FSM_db_getinfo.start();
                        return;
                     }
                     addr3342:
                     this.i3 = li8(this.i2);
                     if(this.i3 != 76)
                     {
                        this.i3 = this.i4;
                        while(true)
                        {
                           this.i5 = li8(this.i3);
                           if(this.i5 == 0)
                           {
                              this.i3 = 0;
                              break;
                           }
                           this.i5 = li8(this.i3 + 1);
                           this.i3 = this.i3 + 1;
                           this.i6 = this.i3;
                           if(this.i5 != 76)
                           {
                              this.i3 = this.i6;
                              continue;
                           }
                           break;
                        }
                     }
                     else
                     {
                        this.i3 = this.i2;
                     }
                     if(this.i3 != 0)
                     {
                        this.i3 = FSM_db_getinfo;
                        mstate.esp = mstate.esp - 12;
                        si32(this.i1,mstate.esp);
                        si32(this.i0,mstate.esp + 4);
                        si32(this.i3,mstate.esp + 8);
                        state = 49;
                        mstate.esp = mstate.esp - 4;
                        FSM_db_getinfo.start();
                        return;
                     }
                     addr4178:
                     this.i3 = li8(this.i2);
                     if(this.i3 != 102)
                     {
                        this.i2 = this.i4;
                        while(true)
                        {
                           this.i3 = li8(this.i2);
                           if(this.i3 == 0)
                           {
                              this.i2 = 0;
                              break;
                           }
                           this.i3 = li8(this.i2 + 1);
                           this.i2 = this.i2 + 1;
                           this.i4 = this.i2;
                           if(this.i3 != 102)
                           {
                              this.i2 = this.i4;
                              continue;
                           }
                           break;
                        }
                     }
                     if(this.i2 != 0)
                     {
                        this.i2 = FSM_db_getinfo;
                        mstate.esp = mstate.esp - 12;
                        si32(this.i1,mstate.esp);
                        si32(this.i0,mstate.esp + 4);
                        si32(this.i2,mstate.esp + 8);
                        state = 41;
                        mstate.esp = mstate.esp - 4;
                        FSM_db_getinfo.start();
                        return;
                     }
                     §§goto(addr3456);
                  }
               }
            case 15:
               this.i5 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i5,mstate.ebp + -16);
               this.i5 = 4;
               si32(this.i5,mstate.ebp + -8);
               this.i5 = li32(this.i1 + 8);
               mstate.esp = mstate.esp - 16;
               this.i5 = this.i5 + -12;
               this.i6 = mstate.ebp + -16;
               si32(this.i1,mstate.esp);
               si32(this.i3,mstate.esp + 4);
               si32(this.i6,mstate.esp + 8);
               si32(this.i5,mstate.esp + 12);
               state = 16;
               mstate.esp = mstate.esp - 4;
               FSM_db_getinfo.start();
               return;
            case 16:
               mstate.esp = mstate.esp + 16;
               this.i3 = li32(this.i1 + 8);
               this.i3 = this.i3 + -12;
               si32(this.i3,this.i1 + 8);
               this.i3 = mstate.ebp + -256;
               mstate.esp = mstate.esp - 8;
               this.i3 = this.i3 + 36;
               si32(this.i1,mstate.esp);
               si32(this.i3,mstate.esp + 4);
               state = 17;
               mstate.esp = mstate.esp - 4;
               FSM_db_getinfo.start();
               return;
            case 17:
               mstate.esp = mstate.esp + 8;
               mstate.esp = mstate.esp - 8;
               this.i3 = -2;
               si32(this.i1,mstate.esp);
               si32(this.i3,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_db_getinfo.start();
            case 18:
               this.i3 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i5 = FSM_db_getinfo;
               this.i6 = this.i1 + 8;
               while(true)
               {
                  this.i7 = li8(this.i5 + 1);
                  this.i5 = this.i5 + 1;
                  this.i8 = this.i5;
                  if(this.i7 != 0)
                  {
                     this.i5 = this.i8;
                     continue;
                  }
                  break;
               }
               this.i7 = FSM_db_getinfo;
               mstate.esp = mstate.esp - 12;
               this.i5 = this.i5 - this.i7;
               si32(this.i1,mstate.esp);
               si32(this.i7,mstate.esp + 4);
               si32(this.i5,mstate.esp + 8);
               state = 19;
               mstate.esp = mstate.esp - 4;
               FSM_db_getinfo.start();
               return;
            case 19:
               this.i5 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i5,mstate.ebp + -32);
               this.i5 = 4;
               si32(this.i5,mstate.ebp + -24);
               this.i5 = li32(this.i6);
               mstate.esp = mstate.esp - 16;
               this.i5 = this.i5 + -12;
               this.i7 = mstate.ebp + -32;
               si32(this.i1,mstate.esp);
               si32(this.i3,mstate.esp + 4);
               si32(this.i7,mstate.esp + 8);
               si32(this.i5,mstate.esp + 12);
               state = 20;
               mstate.esp = mstate.esp - 4;
               FSM_db_getinfo.start();
               return;
            case 20:
               mstate.esp = mstate.esp + 16;
               this.i3 = li32(this.i6);
               this.i5 = this.i3 + -12;
               si32(this.i5,this.i6);
               this.i5 = li32(mstate.ebp + -228);
               this.f0 = Number(this.i5);
               sf64(this.f0,this.i3 + -12);
               this.i5 = 3;
               si32(this.i5,this.i3 + -4);
               this.i3 = li32(this.i6);
               this.i3 = this.i3 + 12;
               si32(this.i3,this.i6);
               mstate.esp = mstate.esp - 8;
               this.i3 = -2;
               si32(this.i1,mstate.esp);
               si32(this.i3,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_db_getinfo.start();
            case 21:
               this.i3 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i5 = FSM_db_getinfo;
               while(true)
               {
                  this.i7 = li8(this.i5 + 1);
                  this.i5 = this.i5 + 1;
                  this.i8 = this.i5;
                  if(this.i7 != 0)
                  {
                     this.i5 = this.i8;
                     continue;
                  }
                  break;
               }
               this.i7 = FSM_db_getinfo;
               mstate.esp = mstate.esp - 12;
               this.i5 = this.i5 - this.i7;
               si32(this.i1,mstate.esp);
               si32(this.i7,mstate.esp + 4);
               si32(this.i5,mstate.esp + 8);
               state = 22;
               mstate.esp = mstate.esp - 4;
               FSM_db_getinfo.start();
               return;
            case 22:
               this.i5 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i5,mstate.ebp + -48);
               this.i5 = 4;
               si32(this.i5,mstate.ebp + -40);
               this.i5 = li32(this.i6);
               mstate.esp = mstate.esp - 16;
               this.i5 = this.i5 + -12;
               this.i7 = mstate.ebp + -48;
               si32(this.i1,mstate.esp);
               si32(this.i3,mstate.esp + 4);
               si32(this.i7,mstate.esp + 8);
               si32(this.i5,mstate.esp + 12);
               state = 23;
               mstate.esp = mstate.esp - 4;
               FSM_db_getinfo.start();
               return;
            case 23:
               mstate.esp = mstate.esp + 16;
               this.i3 = li32(this.i6);
               this.i5 = this.i3 + -12;
               si32(this.i5,this.i6);
               this.i5 = li32(mstate.ebp + -224);
               this.f0 = Number(this.i5);
               sf64(this.f0,this.i3 + -12);
               this.i5 = 3;
               si32(this.i5,this.i3 + -4);
               this.i3 = li32(this.i6);
               this.i3 = this.i3 + 12;
               si32(this.i3,this.i6);
               mstate.esp = mstate.esp - 8;
               this.i3 = -2;
               si32(this.i1,mstate.esp);
               si32(this.i3,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_db_getinfo.start();
            case 24:
               this.i3 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i5 = FSM_db_getinfo;
               while(true)
               {
                  this.i7 = li8(this.i5 + 1);
                  this.i5 = this.i5 + 1;
                  this.i8 = this.i5;
                  if(this.i7 != 0)
                  {
                     this.i5 = this.i8;
                     continue;
                  }
                  break;
               }
               this.i7 = FSM_db_getinfo;
               mstate.esp = mstate.esp - 12;
               this.i5 = this.i5 - this.i7;
               si32(this.i1,mstate.esp);
               si32(this.i7,mstate.esp + 4);
               si32(this.i5,mstate.esp + 8);
               state = 25;
               mstate.esp = mstate.esp - 4;
               FSM_db_getinfo.start();
               return;
            case 25:
               this.i5 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i5,mstate.ebp + -64);
               this.i5 = 4;
               si32(this.i5,mstate.ebp + -56);
               this.i5 = li32(this.i6);
               mstate.esp = mstate.esp - 16;
               this.i5 = this.i5 + -12;
               this.i7 = mstate.ebp + -64;
               si32(this.i1,mstate.esp);
               si32(this.i3,mstate.esp + 4);
               si32(this.i7,mstate.esp + 8);
               si32(this.i5,mstate.esp + 12);
               state = 26;
               mstate.esp = mstate.esp - 4;
               FSM_db_getinfo.start();
               return;
            case 26:
               mstate.esp = mstate.esp + 16;
               this.i3 = li32(this.i6);
               this.i3 = this.i3 + -12;
               si32(this.i3,this.i6);
               this.i3 = li32(mstate.ebp + -244);
               mstate.esp = mstate.esp - 8;
               si32(this.i1,mstate.esp);
               si32(this.i3,mstate.esp + 4);
               state = 27;
               mstate.esp = mstate.esp - 4;
               FSM_db_getinfo.start();
               return;
            case 27:
               mstate.esp = mstate.esp + 8;
               mstate.esp = mstate.esp - 8;
               this.i3 = -2;
               si32(this.i1,mstate.esp);
               si32(this.i3,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_db_getinfo.start();
            case 28:
               this.i3 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i5 = FSM_db_getinfo;
               while(true)
               {
                  this.i7 = li8(this.i5 + 1);
                  this.i5 = this.i5 + 1;
                  this.i8 = this.i5;
                  if(this.i7 != 0)
                  {
                     this.i5 = this.i8;
                     continue;
                  }
                  break;
               }
               this.i7 = FSM_db_getinfo;
               mstate.esp = mstate.esp - 12;
               this.i5 = this.i5 - this.i7;
               si32(this.i1,mstate.esp);
               si32(this.i7,mstate.esp + 4);
               si32(this.i5,mstate.esp + 8);
               state = 29;
               mstate.esp = mstate.esp - 4;
               FSM_db_getinfo.start();
               return;
            case 29:
               this.i5 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i5,mstate.ebp + -80);
               this.i5 = 4;
               si32(this.i5,mstate.ebp + -72);
               this.i5 = li32(this.i6);
               mstate.esp = mstate.esp - 16;
               this.i5 = this.i5 + -12;
               this.i7 = mstate.ebp + -80;
               si32(this.i1,mstate.esp);
               si32(this.i3,mstate.esp + 4);
               si32(this.i7,mstate.esp + 8);
               si32(this.i5,mstate.esp + 12);
               state = 30;
               mstate.esp = mstate.esp - 4;
               FSM_db_getinfo.start();
               return;
            case 30:
               mstate.esp = mstate.esp + 16;
               this.i3 = li32(this.i6);
               this.i3 = this.i3 + -12;
               si32(this.i3,this.i6);
               §§goto(addr2390);
            case 31:
               this.i5 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i5,mstate.ebp + -96);
               this.i5 = 4;
               si32(this.i5,mstate.ebp + -88);
               this.i5 = li32(this.i6);
               mstate.esp = mstate.esp - 16;
               this.i5 = this.i5 + -12;
               this.i7 = mstate.ebp + -96;
               si32(this.i1,mstate.esp);
               si32(this.i3,mstate.esp + 4);
               si32(this.i7,mstate.esp + 8);
               si32(this.i5,mstate.esp + 12);
               state = 32;
               mstate.esp = mstate.esp - 4;
               FSM_db_getinfo.start();
               return;
            case 32:
               mstate.esp = mstate.esp + 16;
               this.i3 = li32(this.i6);
               this.i3 = this.i3 + -12;
               si32(this.i3,this.i6);
               §§goto(addr2611);
            case 33:
               this.i5 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i5,mstate.ebp + -112);
               this.i5 = 4;
               si32(this.i5,mstate.ebp + -104);
               this.i5 = li32(this.i6);
               mstate.esp = mstate.esp - 16;
               this.i5 = this.i5 + -12;
               this.i7 = mstate.ebp + -112;
               si32(this.i1,mstate.esp);
               si32(this.i3,mstate.esp + 4);
               si32(this.i7,mstate.esp + 8);
               si32(this.i5,mstate.esp + 12);
               state = 34;
               mstate.esp = mstate.esp - 4;
               FSM_db_getinfo.start();
               return;
            case 34:
               mstate.esp = mstate.esp + 16;
               this.i3 = li32(this.i6);
               this.i3 = this.i3 + -12;
               si32(this.i3,this.i6);
               §§goto(addr2832);
            case 35:
               this.i5 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i5,mstate.ebp + -128);
               this.i5 = 4;
               si32(this.i5,mstate.ebp + -120);
               this.i5 = li32(this.i1 + 8);
               mstate.esp = mstate.esp - 16;
               this.i5 = this.i5 + -12;
               this.i6 = mstate.ebp + -128;
               si32(this.i1,mstate.esp);
               si32(this.i3,mstate.esp + 4);
               si32(this.i6,mstate.esp + 8);
               si32(this.i5,mstate.esp + 12);
               state = 36;
               mstate.esp = mstate.esp - 4;
               FSM_db_getinfo.start();
               return;
            case 36:
               mstate.esp = mstate.esp + 16;
               this.i3 = li32(this.i1 + 8);
               this.i3 = this.i3 + -12;
               si32(this.i3,this.i1 + 8);
               this.i3 = li32(mstate.ebp + -248);
               mstate.esp = mstate.esp - 8;
               si32(this.i1,mstate.esp);
               si32(this.i3,mstate.esp + 4);
               state = 37;
               mstate.esp = mstate.esp - 4;
               FSM_db_getinfo.start();
               return;
            case 37:
               mstate.esp = mstate.esp + 8;
               mstate.esp = mstate.esp - 8;
               this.i3 = -2;
               si32(this.i1,mstate.esp);
               si32(this.i3,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_db_getinfo.start();
            case 38:
               this.i3 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i5 = FSM_db_getinfo;
               this.i6 = this.i1 + 8;
               while(true)
               {
                  this.i7 = li8(this.i5 + 1);
                  this.i5 = this.i5 + 1;
                  this.i8 = this.i5;
                  if(this.i7 != 0)
                  {
                     this.i5 = this.i8;
                     continue;
                  }
                  break;
               }
               this.i7 = FSM_db_getinfo;
               mstate.esp = mstate.esp - 12;
               this.i5 = this.i5 - this.i7;
               si32(this.i1,mstate.esp);
               si32(this.i7,mstate.esp + 4);
               si32(this.i5,mstate.esp + 8);
               state = 39;
               mstate.esp = mstate.esp - 4;
               FSM_db_getinfo.start();
               return;
            case 39:
               this.i5 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i5,mstate.ebp + -144);
               this.i5 = 4;
               si32(this.i5,mstate.ebp + -136);
               this.i5 = li32(this.i6);
               mstate.esp = mstate.esp - 16;
               this.i5 = this.i5 + -12;
               this.i7 = mstate.ebp + -144;
               si32(this.i1,mstate.esp);
               si32(this.i3,mstate.esp + 4);
               si32(this.i7,mstate.esp + 8);
               si32(this.i5,mstate.esp + 12);
               state = 40;
               mstate.esp = mstate.esp - 4;
               FSM_db_getinfo.start();
               return;
            case 40:
               mstate.esp = mstate.esp + 16;
               this.i3 = li32(this.i6);
               this.i3 = this.i3 + -12;
               si32(this.i3,this.i6);
               §§goto(addr3342);
            case 41:
               mstate.esp = mstate.esp + 12;
               §§goto(addr3456);
            case 42:
               mstate.esp = mstate.esp + 12;
               this.i0 = 0;
               §§goto(addr3461);
            case 43:
               mstate.esp = mstate.esp + 8;
               mstate.esp = mstate.esp - 8;
               si32(this.i1,mstate.esp);
               si32(this.i3,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_db_getinfo.start();
            case 44:
               this.i3 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i5 = FSM_db_getinfo;
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
               this.i6 = FSM_db_getinfo;
               mstate.esp = mstate.esp - 12;
               this.i5 = this.i5 - this.i6;
               si32(this.i1,mstate.esp);
               si32(this.i6,mstate.esp + 4);
               si32(this.i5,mstate.esp + 8);
               state = 15;
               mstate.esp = mstate.esp - 4;
               FSM_db_getinfo.start();
               return;
            case 45:
               this.i3 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i5 = FSM_db_getinfo;
               this.i6 = this.i1 + 8;
               while(true)
               {
                  this.i7 = li8(this.i5 + 1);
                  this.i5 = this.i5 + 1;
                  this.i8 = this.i5;
                  if(this.i7 != 0)
                  {
                     this.i5 = this.i8;
                     continue;
                  }
                  break;
               }
               this.i7 = FSM_db_getinfo;
               mstate.esp = mstate.esp - 12;
               this.i5 = this.i5 - this.i7;
               si32(this.i1,mstate.esp);
               si32(this.i7,mstate.esp + 4);
               si32(this.i5,mstate.esp + 8);
               state = 31;
               mstate.esp = mstate.esp - 4;
               FSM_db_getinfo.start();
               return;
            case 46:
               this.i3 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i5 = FSM_db_getinfo;
               this.i6 = this.i1 + 8;
               while(true)
               {
                  this.i7 = li8(this.i5 + 1);
                  this.i5 = this.i5 + 1;
                  this.i8 = this.i5;
                  if(this.i7 != 0)
                  {
                     this.i5 = this.i8;
                     continue;
                  }
                  break;
               }
               this.i7 = FSM_db_getinfo;
               mstate.esp = mstate.esp - 12;
               this.i5 = this.i5 - this.i7;
               si32(this.i1,mstate.esp);
               si32(this.i7,mstate.esp + 4);
               si32(this.i5,mstate.esp + 8);
               state = 33;
               mstate.esp = mstate.esp - 4;
               FSM_db_getinfo.start();
               return;
            case 47:
               mstate.esp = mstate.esp + 8;
               mstate.esp = mstate.esp - 8;
               si32(this.i1,mstate.esp);
               si32(this.i3,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_db_getinfo.start();
            case 48:
               this.i3 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i5 = FSM_db_getinfo;
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
               this.i6 = FSM_db_getinfo;
               mstate.esp = mstate.esp - 12;
               this.i5 = this.i5 - this.i6;
               si32(this.i1,mstate.esp);
               si32(this.i6,mstate.esp + 4);
               si32(this.i5,mstate.esp + 8);
               state = 35;
               mstate.esp = mstate.esp - 4;
               FSM_db_getinfo.start();
               return;
            case 49:
               mstate.esp = mstate.esp + 12;
               §§goto(addr4178);
         }
         mstate.esp = mstate.ebp;
         mstate.ebp = li32(mstate.esp);
         mstate.esp = mstate.esp + 4;
         mstate.esp = mstate.esp + 4;
         mstate.gworker = caller;
      }
   }
}
