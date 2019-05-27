package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.li8;
   import avm2.intrinsics.memory.sf64;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_os_time extends Machine
   {
      
      public static const intRegCount:int = 6;
      
      public static const NumberRegCount:int = 1;
       
      
      public var i0:int;
      
      public var i1:int;
      
      public var i2:int;
      
      public var i3:int;
      
      public var i4:int;
      
      public var i5:int;
      
      public var f0:Number;
      
      public function FSM_os_time()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM_os_time = null;
         _loc1_ = new FSM_os_time();
         FSM_os_time.gworker = _loc1_;
      }
      
      override public final function work() : void
      {
         switch(state)
         {
            case 0:
               mstate.esp = mstate.esp - 4;
               si32(mstate.ebp,mstate.esp);
               mstate.ebp = mstate.esp;
               mstate.esp = mstate.esp - 160;
               this.i0 = 1;
               mstate.esp = mstate.esp - 8;
               this.i1 = li32(mstate.ebp + 8);
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_os_time.start();
            case 1:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i2 = FSM_os_time;
               if(this.i0 != this.i2)
               {
                  this.i0 = li32(this.i0 + 8);
                  if(this.i0 > 0)
                  {
                     this.i0 = 1;
                     mstate.esp = mstate.esp - 8;
                     si32(this.i1,mstate.esp);
                     si32(this.i0,mstate.esp + 4);
                     mstate.esp = mstate.esp - 4;
                     FSM_os_time.start();
                  }
               }
               mstate.esp = mstate.esp - 4;
               FSM_os_time.start();
            case 2:
               this.i0 = mstate.eax;
               if(this.i0 != -1)
               {
                  addr115:
                  this.i2 = 3;
                  this.i3 = li32(this.i1 + 8);
                  this.f0 = Number(this.i0);
                  sf64(this.f0,this.i3);
                  addr3079:
                  si32(this.i2,this.i3 + 8);
                  this.i0 = li32(this.i1 + 8);
                  this.i0 = this.i0 + 12;
                  si32(this.i0,this.i1 + 8);
                  this.i0 = 1;
                  mstate.eax = this.i0;
                  mstate.esp = mstate.ebp;
                  mstate.ebp = li32(mstate.esp);
                  mstate.esp = mstate.esp + 4;
                  mstate.esp = mstate.esp + 4;
                  mstate.gworker = caller;
                  return;
               }
               break;
            case 3:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i2 = FSM_os_time;
               if(this.i0 != this.i2)
               {
                  this.i0 = li32(this.i0 + 8);
                  if(this.i0 == 5)
                  {
                     addr256:
                     this.i0 = li32(this.i1 + 12);
                     this.i2 = li32(this.i1 + 8);
                     this.i3 = this.i1 + 12;
                     this.i4 = this.i1 + 8;
                     this.i5 = this.i0 + 12;
                     if(uint(this.i2) < uint(this.i5))
                     {
                        this.i0 = this.i2;
                        while(true)
                        {
                           this.i2 = 0;
                           si32(this.i2,this.i0 + 8);
                           this.i2 = this.i0 + 12;
                           si32(this.i2,this.i4);
                           this.i5 = li32(this.i3);
                           if(this.i0 >= this.i5)
                           {
                              break;
                           }
                           this.i0 = this.i2;
                        }
                        this.i0 = this.i5;
                     }
                     this.i2 = -1;
                     this.i0 = this.i0 + 12;
                     si32(this.i0,this.i4);
                     mstate.esp = mstate.esp - 8;
                     si32(this.i1,mstate.esp);
                     si32(this.i2,mstate.esp + 4);
                     mstate.esp = mstate.esp - 4;
                     FSM_os_time.start();
                  }
               }
               this.i0 = 5;
               mstate.esp = mstate.esp - 12;
               this.i2 = 1;
               si32(this.i1,mstate.esp);
               si32(this.i2,mstate.esp + 4);
               si32(this.i0,mstate.esp + 8);
               state = 4;
               mstate.esp = mstate.esp - 4;
               FSM_os_time.start();
               return;
            case 4:
               mstate.esp = mstate.esp + 12;
               §§goto(addr256);
            case 5:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i2 = FSM_os_time;
               while(true)
               {
                  this.i3 = li8(this.i2 + 1);
                  this.i2 = this.i2 + 1;
                  this.i5 = this.i2;
                  if(this.i3 != 0)
                  {
                     this.i2 = this.i5;
                     continue;
                  }
                  break;
               }
               this.i3 = FSM_os_time;
               mstate.esp = mstate.esp - 12;
               this.i2 = this.i2 - this.i3;
               si32(this.i1,mstate.esp);
               si32(this.i3,mstate.esp + 4);
               si32(this.i2,mstate.esp + 8);
               state = 6;
               mstate.esp = mstate.esp - 4;
               FSM_os_time.start();
               return;
            case 6:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i2,mstate.ebp + -16);
               this.i2 = 4;
               si32(this.i2,mstate.ebp + -8);
               this.i2 = li32(this.i4);
               mstate.esp = mstate.esp - 16;
               this.i3 = mstate.ebp + -16;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               si32(this.i3,mstate.esp + 8);
               si32(this.i2,mstate.esp + 12);
               state = 7;
               mstate.esp = mstate.esp - 4;
               FSM_os_time.start();
               return;
            case 7:
               mstate.esp = mstate.esp + 16;
               this.i0 = li32(this.i4);
               this.i0 = this.i0 + 12;
               si32(this.i0,this.i4);
               mstate.esp = mstate.esp - 8;
               this.i0 = -1;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               state = 8;
               mstate.esp = mstate.esp - 4;
               FSM_os_time.start();
               return;
            case 8:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               if(this.i0 == 0)
               {
                  this.i0 = 0;
                  addr677:
                  this.i2 = -1;
                  this.i3 = li32(this.i4);
                  this.i3 = this.i3 + -12;
                  si32(this.i3,this.i4);
                  si32(this.i0,mstate.ebp + -160);
                  mstate.esp = mstate.esp - 8;
                  si32(this.i1,mstate.esp);
                  si32(this.i2,mstate.esp + 4);
                  mstate.esp = mstate.esp - 4;
                  FSM_os_time.start();
               }
               else
               {
                  this.i0 = -1;
                  mstate.esp = mstate.esp - 8;
                  si32(this.i1,mstate.esp);
                  si32(this.i0,mstate.esp + 4);
                  state = 9;
                  mstate.esp = mstate.esp - 4;
                  FSM_os_time.start();
                  return;
               }
            case 9:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               §§goto(addr677);
            case 10:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i2 = FSM_os_time;
               while(true)
               {
                  this.i3 = li8(this.i2 + 1);
                  this.i2 = this.i2 + 1;
                  this.i5 = this.i2;
                  if(this.i3 != 0)
                  {
                     this.i2 = this.i5;
                     continue;
                  }
                  break;
               }
               this.i3 = FSM_os_time;
               mstate.esp = mstate.esp - 12;
               this.i2 = this.i2 - this.i3;
               si32(this.i1,mstate.esp);
               si32(this.i3,mstate.esp + 4);
               si32(this.i2,mstate.esp + 8);
               state = 11;
               mstate.esp = mstate.esp - 4;
               FSM_os_time.start();
               return;
            case 11:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i2,mstate.ebp + -32);
               this.i2 = 4;
               si32(this.i2,mstate.ebp + -24);
               this.i2 = li32(this.i4);
               mstate.esp = mstate.esp - 16;
               this.i3 = mstate.ebp + -32;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               si32(this.i3,mstate.esp + 8);
               si32(this.i2,mstate.esp + 12);
               state = 12;
               mstate.esp = mstate.esp - 4;
               FSM_os_time.start();
               return;
            case 12:
               mstate.esp = mstate.esp + 16;
               this.i0 = li32(this.i4);
               this.i0 = this.i0 + 12;
               si32(this.i0,this.i4);
               mstate.esp = mstate.esp - 8;
               this.i0 = -1;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               state = 13;
               mstate.esp = mstate.esp - 4;
               FSM_os_time.start();
               return;
            case 13:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               if(this.i0 == 0)
               {
                  this.i0 = 0;
                  addr1025:
                  this.i2 = -1;
                  this.i3 = li32(this.i4);
                  this.i3 = this.i3 + -12;
                  si32(this.i3,this.i4);
                  si32(this.i0,mstate.ebp + -156);
                  mstate.esp = mstate.esp - 8;
                  si32(this.i1,mstate.esp);
                  si32(this.i2,mstate.esp + 4);
                  mstate.esp = mstate.esp - 4;
                  FSM_os_time.start();
               }
               else
               {
                  this.i0 = -1;
                  mstate.esp = mstate.esp - 8;
                  si32(this.i1,mstate.esp);
                  si32(this.i0,mstate.esp + 4);
                  state = 14;
                  mstate.esp = mstate.esp - 4;
                  FSM_os_time.start();
                  return;
               }
            case 14:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               §§goto(addr1025);
            case 15:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i2 = FSM_os_time;
               while(true)
               {
                  this.i3 = li8(this.i2 + 1);
                  this.i2 = this.i2 + 1;
                  this.i5 = this.i2;
                  if(this.i3 != 0)
                  {
                     this.i2 = this.i5;
                     continue;
                  }
                  break;
               }
               this.i3 = FSM_os_time;
               mstate.esp = mstate.esp - 12;
               this.i2 = this.i2 - this.i3;
               si32(this.i1,mstate.esp);
               si32(this.i3,mstate.esp + 4);
               si32(this.i2,mstate.esp + 8);
               state = 16;
               mstate.esp = mstate.esp - 4;
               FSM_os_time.start();
               return;
            case 16:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i2,mstate.ebp + -48);
               this.i2 = 4;
               si32(this.i2,mstate.ebp + -40);
               this.i2 = li32(this.i4);
               mstate.esp = mstate.esp - 16;
               this.i3 = mstate.ebp + -48;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               si32(this.i3,mstate.esp + 8);
               si32(this.i2,mstate.esp + 12);
               state = 17;
               mstate.esp = mstate.esp - 4;
               FSM_os_time.start();
               return;
            case 17:
               mstate.esp = mstate.esp + 16;
               this.i0 = li32(this.i4);
               this.i0 = this.i0 + 12;
               si32(this.i0,this.i4);
               mstate.esp = mstate.esp - 8;
               this.i0 = -1;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               state = 18;
               mstate.esp = mstate.esp - 4;
               FSM_os_time.start();
               return;
            case 18:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               if(this.i0 == 0)
               {
                  this.i0 = 12;
                  addr1373:
                  this.i2 = -1;
                  this.i3 = li32(this.i4);
                  this.i3 = this.i3 + -12;
                  si32(this.i3,this.i4);
                  si32(this.i0,mstate.ebp + -152);
                  mstate.esp = mstate.esp - 8;
                  si32(this.i1,mstate.esp);
                  si32(this.i2,mstate.esp + 4);
                  mstate.esp = mstate.esp - 4;
                  FSM_os_time.start();
               }
               else
               {
                  this.i0 = -1;
                  mstate.esp = mstate.esp - 8;
                  si32(this.i1,mstate.esp);
                  si32(this.i0,mstate.esp + 4);
                  state = 19;
                  mstate.esp = mstate.esp - 4;
                  FSM_os_time.start();
                  return;
               }
            case 19:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               §§goto(addr1373);
            case 20:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i2 = FSM_os_time;
               while(true)
               {
                  this.i3 = li8(this.i2 + 1);
                  this.i2 = this.i2 + 1;
                  this.i5 = this.i2;
                  if(this.i3 != 0)
                  {
                     this.i2 = this.i5;
                     continue;
                  }
                  break;
               }
               this.i3 = FSM_os_time;
               mstate.esp = mstate.esp - 12;
               this.i2 = this.i2 - this.i3;
               si32(this.i1,mstate.esp);
               si32(this.i3,mstate.esp + 4);
               si32(this.i2,mstate.esp + 8);
               state = 21;
               mstate.esp = mstate.esp - 4;
               FSM_os_time.start();
               return;
            case 21:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i2,mstate.ebp + -64);
               this.i2 = 4;
               si32(this.i2,mstate.ebp + -56);
               this.i2 = li32(this.i4);
               mstate.esp = mstate.esp - 16;
               this.i3 = mstate.ebp + -64;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               si32(this.i3,mstate.esp + 8);
               si32(this.i2,mstate.esp + 12);
               state = 22;
               mstate.esp = mstate.esp - 4;
               FSM_os_time.start();
               return;
            case 22:
               mstate.esp = mstate.esp + 16;
               this.i0 = li32(this.i4);
               this.i0 = this.i0 + 12;
               si32(this.i0,this.i4);
               mstate.esp = mstate.esp - 8;
               this.i0 = -1;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               state = 23;
               mstate.esp = mstate.esp - 4;
               FSM_os_time.start();
               return;
            case 23:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               if(this.i0 != 0)
               {
                  this.i0 = -1;
                  mstate.esp = mstate.esp - 8;
                  si32(this.i1,mstate.esp);
                  si32(this.i0,mstate.esp + 4);
                  state = 24;
                  mstate.esp = mstate.esp - 4;
                  FSM_os_time.start();
                  return;
               }
               this.i0 = FSM_os_time;
               mstate.esp = mstate.esp - 12;
               this.i2 = FSM_os_time;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               si32(this.i2,mstate.esp + 8);
               state = 25;
               mstate.esp = mstate.esp - 4;
               FSM_os_time.start();
               return;
            case 24:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i2 = li32(this.i4);
               this.i2 = this.i2 + -12;
               si32(this.i2,this.i4);
               addr1788:
               this.i2 = -1;
               si32(this.i0,mstate.ebp + -148);
               mstate.esp = mstate.esp - 8;
               si32(this.i1,mstate.esp);
               si32(this.i2,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_os_time.start();
            case 25:
               mstate.esp = mstate.esp + 12;
               this.i0 = 0;
               §§goto(addr1788);
            case 26:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i2 = FSM_os_time;
               while(true)
               {
                  this.i3 = li8(this.i2 + 1);
                  this.i2 = this.i2 + 1;
                  this.i5 = this.i2;
                  if(this.i3 != 0)
                  {
                     this.i2 = this.i5;
                     continue;
                  }
                  break;
               }
               this.i3 = FSM_os_time;
               mstate.esp = mstate.esp - 12;
               this.i2 = this.i2 - this.i3;
               si32(this.i1,mstate.esp);
               si32(this.i3,mstate.esp + 4);
               si32(this.i2,mstate.esp + 8);
               state = 27;
               mstate.esp = mstate.esp - 4;
               FSM_os_time.start();
               return;
            case 27:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i2,mstate.ebp + -80);
               this.i2 = 4;
               si32(this.i2,mstate.ebp + -72);
               this.i2 = li32(this.i4);
               mstate.esp = mstate.esp - 16;
               this.i3 = mstate.ebp + -80;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               si32(this.i3,mstate.esp + 8);
               si32(this.i2,mstate.esp + 12);
               state = 28;
               mstate.esp = mstate.esp - 4;
               FSM_os_time.start();
               return;
            case 28:
               mstate.esp = mstate.esp + 16;
               this.i0 = li32(this.i4);
               this.i0 = this.i0 + 12;
               si32(this.i0,this.i4);
               mstate.esp = mstate.esp - 8;
               this.i0 = -1;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               state = 29;
               mstate.esp = mstate.esp - 4;
               FSM_os_time.start();
               return;
            case 29:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               if(this.i0 != 0)
               {
                  this.i0 = -1;
                  mstate.esp = mstate.esp - 8;
                  si32(this.i1,mstate.esp);
                  si32(this.i0,mstate.esp + 4);
                  state = 30;
                  mstate.esp = mstate.esp - 4;
                  FSM_os_time.start();
                  return;
               }
               this.i0 = FSM_os_time;
               mstate.esp = mstate.esp - 12;
               this.i2 = FSM_os_time;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               si32(this.i2,mstate.esp + 8);
               state = 31;
               mstate.esp = mstate.esp - 4;
               FSM_os_time.start();
               return;
            case 30:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i2 = li32(this.i4);
               this.i2 = this.i2 + -12;
               si32(this.i2,this.i4);
               this.i0 = this.i0 + -1;
               addr2193:
               this.i2 = -1;
               si32(this.i0,mstate.ebp + -144);
               mstate.esp = mstate.esp - 8;
               si32(this.i1,mstate.esp);
               si32(this.i2,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_os_time.start();
            case 31:
               mstate.esp = mstate.esp + 12;
               this.i0 = -1;
               §§goto(addr2193);
            case 32:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i2 = FSM_os_time;
               while(true)
               {
                  this.i3 = li8(this.i2 + 1);
                  this.i2 = this.i2 + 1;
                  this.i5 = this.i2;
                  if(this.i3 != 0)
                  {
                     this.i2 = this.i5;
                     continue;
                  }
                  break;
               }
               this.i3 = FSM_os_time;
               mstate.esp = mstate.esp - 12;
               this.i2 = this.i2 - this.i3;
               si32(this.i1,mstate.esp);
               si32(this.i3,mstate.esp + 4);
               si32(this.i2,mstate.esp + 8);
               state = 33;
               mstate.esp = mstate.esp - 4;
               FSM_os_time.start();
               return;
            case 33:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i2,mstate.ebp + -96);
               this.i2 = 4;
               si32(this.i2,mstate.ebp + -88);
               this.i2 = li32(this.i4);
               mstate.esp = mstate.esp - 16;
               this.i3 = mstate.ebp + -96;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               si32(this.i3,mstate.esp + 8);
               si32(this.i2,mstate.esp + 12);
               state = 34;
               mstate.esp = mstate.esp - 4;
               FSM_os_time.start();
               return;
            case 34:
               mstate.esp = mstate.esp + 16;
               this.i0 = li32(this.i4);
               this.i0 = this.i0 + 12;
               si32(this.i0,this.i4);
               mstate.esp = mstate.esp - 8;
               this.i0 = -1;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               state = 35;
               mstate.esp = mstate.esp - 4;
               FSM_os_time.start();
               return;
            case 35:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               if(this.i0 != 0)
               {
                  this.i0 = -1;
                  mstate.esp = mstate.esp - 8;
                  si32(this.i1,mstate.esp);
                  si32(this.i0,mstate.esp + 4);
                  state = 36;
                  mstate.esp = mstate.esp - 4;
                  FSM_os_time.start();
                  return;
               }
               this.i0 = FSM_os_time;
               mstate.esp = mstate.esp - 12;
               this.i2 = FSM_os_time;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               si32(this.i2,mstate.esp + 8);
               state = 37;
               mstate.esp = mstate.esp - 4;
               FSM_os_time.start();
               return;
            case 36:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i2 = li32(this.i4);
               this.i2 = this.i2 + -12;
               si32(this.i2,this.i4);
               this.i0 = this.i0 + -1900;
               addr2598:
               this.i2 = -1;
               si32(this.i0,mstate.ebp + -140);
               mstate.esp = mstate.esp - 8;
               si32(this.i1,mstate.esp);
               si32(this.i2,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_os_time.start();
            case 37:
               mstate.esp = mstate.esp + 12;
               this.i0 = -1900;
               §§goto(addr2598);
            case 38:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i2 = FSM_os_time;
               while(true)
               {
                  this.i3 = li8(this.i2 + 1);
                  this.i2 = this.i2 + 1;
                  this.i5 = this.i2;
                  if(this.i3 != 0)
                  {
                     this.i2 = this.i5;
                     continue;
                  }
                  break;
               }
               this.i3 = FSM_os_time;
               mstate.esp = mstate.esp - 12;
               this.i2 = this.i2 - this.i3;
               si32(this.i1,mstate.esp);
               si32(this.i3,mstate.esp + 4);
               si32(this.i2,mstate.esp + 8);
               state = 39;
               mstate.esp = mstate.esp - 4;
               FSM_os_time.start();
               return;
            case 39:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i2,mstate.ebp + -112);
               this.i2 = 4;
               si32(this.i2,mstate.ebp + -104);
               this.i2 = li32(this.i4);
               mstate.esp = mstate.esp - 16;
               this.i3 = mstate.ebp + -112;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               si32(this.i3,mstate.esp + 8);
               si32(this.i2,mstate.esp + 12);
               state = 40;
               mstate.esp = mstate.esp - 4;
               FSM_os_time.start();
               return;
            case 40:
               mstate.esp = mstate.esp + 16;
               this.i0 = li32(this.i4);
               this.i0 = this.i0 + 12;
               si32(this.i0,this.i4);
               mstate.esp = mstate.esp - 8;
               this.i0 = -1;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_os_time.start();
            case 41:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i2 = FSM_os_time;
               if(this.i0 != this.i2)
               {
                  this.i0 = li32(this.i0 + 8);
                  if(this.i0 == 0)
                  {
                     this.i0 = -1;
                  }
                  addr2984:
                  this.i2 = mstate.ebp + -160;
                  this.i3 = li32(this.i4);
                  this.i3 = this.i3 + -12;
                  si32(this.i3,this.i4);
                  si32(this.i0,mstate.ebp + -128);
                  state = 43;
                  mstate.esp = mstate.esp - 4;
                  FSM_os_time.start();
                  return;
               }
               this.i0 = -1;
               mstate.esp = mstate.esp - 8;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_os_time.start();
            case 42:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i2 = li32(this.i0 + 8);
               if(this.i2 != 0)
               {
                  if(this.i2 != 1)
                  {
                     this.i0 = 1;
                  }
                  else
                  {
                     this.i0 = li32(this.i0);
                     this.i0 = this.i0 != 0?1:0;
                     this.i0 = this.i0 & 1;
                  }
               }
               else
               {
                  this.i0 = 0;
               }
               §§goto(addr2984);
            case 43:
               mstate.esp = mstate.esp - 4;
               si32(this.i2,mstate.esp);
               mstate.esp = mstate.esp - 4;
               FSM_os_time.start();
            case 44:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 4;
               if(this.i0 != -1)
               {
                  §§goto(addr115);
               }
               else
               {
                  break;
               }
         }
         this.i0 = 0;
         this.i2 = li32(this.i1 + 8);
         si32(this.i0,this.i2 + 8);
         §§goto(addr3079);
      }
   }
}
