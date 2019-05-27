package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.lf64;
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.li8;
   import avm2.intrinsics.memory.sf64;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_findfile extends Machine
   {
      
      public static const intRegCount:int = 11;
      
      public static const NumberRegCount:int = 1;
       
      
      public var i10:int;
      
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
      
      public function FSM_findfile()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM_findfile = null;
         _loc1_ = new FSM_findfile();
         FSM_findfile.gworker = _loc1_;
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
               this.i0 = FSM_findfile;
               mstate.esp = mstate.esp - 16;
               this.i1 = li32(mstate.ebp + 8);
               this.i2 = li32(mstate.ebp + 12);
               this.i3 = FSM_findfile;
               si32(this.i1,mstate.esp);
               si32(this.i2,mstate.esp + 4);
               si32(this.i0,mstate.esp + 8);
               si32(this.i3,mstate.esp + 12);
               state = 1;
               mstate.esp = mstate.esp - 4;
               FSM_findfile.start();
               return;
            case 1:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 16;
               mstate.esp = mstate.esp - 8;
               this.i2 = -10001;
               si32(this.i1,mstate.esp);
               si32(this.i2,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_findfile.start();
            case 2:
               this.i2 = mstate.eax;
               this.i3 = li32(mstate.ebp + 16);
               mstate.esp = mstate.esp + 8;
               this.i4 = li8(this.i3);
               this.i5 = this.i3;
               if(this.i4 != 0)
               {
                  this.i4 = this.i5;
                  while(true)
                  {
                     this.i6 = li8(this.i4 + 1);
                     this.i4 = this.i4 + 1;
                     this.i7 = this.i4;
                     if(this.i6 != 0)
                     {
                        this.i4 = this.i7;
                        continue;
                     }
                     break;
                  }
               }
               else
               {
                  this.i4 = this.i3;
               }
               this.i6 = 4;
               mstate.esp = mstate.esp - 12;
               this.i4 = this.i4 - this.i5;
               si32(this.i1,mstate.esp);
               si32(this.i3,mstate.esp + 4);
               si32(this.i4,mstate.esp + 8);
               state = 14;
               mstate.esp = mstate.esp - 4;
               FSM_findfile.start();
               return;
            case 3:
               mstate.esp = mstate.esp + 4;
               addr259:
               this.i3 = FSM_findfile;
               this.i5 = li32(this.i4);
               mstate.esp = mstate.esp - 12;
               this.i6 = 0;
               si32(this.i1,mstate.esp);
               si32(this.i3,mstate.esp + 4);
               si32(this.i6,mstate.esp + 8);
               state = 4;
               mstate.esp = mstate.esp - 4;
               FSM_findfile.start();
               return;
            case 4:
               this.i3 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i3,this.i5);
               this.i3 = 4;
               si32(this.i3,this.i5 + 8);
               this.i3 = li32(this.i4);
               this.i3 = this.i3 + 12;
               si32(this.i3,this.i4);
               this.i3 = li8(this.i2);
               if(this.i3 == 59)
               {
                  addr364:
                  loop1:
                  while(true)
                  {
                     this.i3 = li8(this.i2 + 1);
                     this.i2 = this.i2 + 1;
                     this.i5 = this.i2;
                     if(this.i3 != 59)
                     {
                        break;
                     }
                     addr363:
                     this.i2 = this.i5;
                     while(true)
                     {
                        continue loop1;
                     }
                  }
               }
               addr1727:
               this.i3 = this.i1 + 12;
               this.i5 = this.i1 + 16;
               addr1124:
               this.i6 = li8(this.i2);
               this.i7 = this.i2;
               if(this.i6 == 0)
               {
                  this.i2 = 0;
                  addr1144:
                  if(this.i2 == 0)
                  {
                     this.i0 = 0;
                     mstate.eax = this.i0;
                     break;
                  }
                  this.i6 = 0;
                  mstate.esp = mstate.esp - 12;
                  this.i7 = -1;
                  si32(this.i1,mstate.esp);
                  si32(this.i7,mstate.esp + 4);
                  si32(this.i6,mstate.esp + 8);
                  state = 5;
                  mstate.esp = mstate.esp - 4;
                  FSM_findfile.start();
                  return;
               }
               this.i8 = this.i6 & 255;
               if(this.i8 != 59)
               {
                  this.i8 = this.i7;
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
                     if(this.i9 != 59)
                     {
                        this.i8 = this.i10;
                        continue;
                     }
                     break;
                  }
               }
               else
               {
                  this.i8 = this.i2;
               }
               if(this.i8 != 0)
               {
                  this.i6 = this.i8;
               }
               else
               {
                  this.i6 = this.i6 & 255;
                  if(this.i6 != 0)
                  {
                     this.i6 = this.i7;
                     while(true)
                     {
                        this.i8 = li8(this.i6 + 1);
                        this.i6 = this.i6 + 1;
                        this.i9 = this.i6;
                        if(this.i8 != 0)
                        {
                           this.i6 = this.i9;
                           continue;
                        }
                        break;
                     }
                  }
                  else
                  {
                     this.i6 = this.i2;
                  }
               }
               this.i8 = li32(this.i5);
               this.i9 = li32(this.i8 + 68);
               this.i8 = li32(this.i8 + 64);
               this.i7 = this.i6 - this.i7;
               if(uint(this.i9) >= uint(this.i8))
               {
                  mstate.esp = mstate.esp - 4;
                  si32(this.i1,mstate.esp);
                  state = 20;
                  mstate.esp = mstate.esp - 4;
                  FSM_findfile.start();
                  return;
               }
               addr1839:
               this.i8 = 4;
               this.i9 = li32(this.i4);
               mstate.esp = mstate.esp - 12;
               si32(this.i1,mstate.esp);
               si32(this.i2,mstate.esp + 4);
               si32(this.i7,mstate.esp + 8);
               state = 21;
               mstate.esp = mstate.esp - 4;
               FSM_findfile.start();
               return;
            case 5:
               this.i6 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               mstate.esp = mstate.esp - 16;
               this.i7 = FSM_findfile;
               si32(this.i1,mstate.esp);
               si32(this.i6,mstate.esp + 4);
               si32(this.i7,mstate.esp + 8);
               si32(this.i0,mstate.esp + 12);
               state = 6;
               mstate.esp = mstate.esp - 4;
               FSM_findfile.start();
               return;
            case 6:
               this.i6 = mstate.eax;
               mstate.esp = mstate.esp + 16;
               mstate.esp = mstate.esp - 8;
               this.i7 = -2;
               si32(this.i1,mstate.esp);
               si32(this.i7,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_findfile.start();
            case 7:
               this.i7 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i8 = li32(this.i4);
               this.i9 = this.i7;
               this.i10 = this.i7 + 12;
               if(uint(this.i10) >= uint(this.i8))
               {
                  this.i7 = this.i8;
               }
               else
               {
                  this.i7 = this.i7 + 12;
                  this.i8 = this.i9;
                  while(true)
                  {
                     this.f0 = lf64(this.i8 + 12);
                     sf64(this.f0,this.i8);
                     this.i9 = li32(this.i8 + 20);
                     si32(this.i9,this.i8 + 8);
                     this.i8 = li32(this.i4);
                     this.i9 = this.i7 + 12;
                     this.i10 = this.i7;
                     if(uint(this.i9) >= uint(this.i8))
                     {
                        break;
                     }
                     this.i7 = this.i9;
                     this.i8 = this.i10;
                  }
                  this.i7 = this.i8;
               }
               this.i8 = 114;
               this.i7 = this.i7 + -12;
               si32(this.i7,this.i4);
               this.i7 = li8(FSM_findfile + 2);
               mstate.esp = mstate.esp - 16;
               this.i9 = 0;
               si32(this.i6,mstate.esp);
               si32(this.i8,mstate.esp + 4);
               si32(this.i9,mstate.esp + 8);
               si32(this.i7,mstate.esp + 12);
               state = 8;
               mstate.esp = mstate.esp - 4;
               FSM_findfile.start();
               return;
            case 8:
               this.i7 = mstate.eax;
               mstate.esp = mstate.esp + 16;
               if(this.i7 != 0)
               {
                  mstate.esp = mstate.esp - 4;
                  si32(this.i7,mstate.esp);
                  state = 9;
                  mstate.esp = mstate.esp - 4;
                  FSM_findfile.start();
                  return;
               }
               this.i7 = FSM_findfile;
               mstate.esp = mstate.esp - 12;
               si32(this.i1,mstate.esp);
               si32(this.i7,mstate.esp + 4);
               si32(this.i6,mstate.esp + 8);
               state = 10;
               mstate.esp = mstate.esp - 4;
               FSM_findfile.start();
               return;
            case 9:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 4;
               mstate.eax = this.i6;
               break;
            case 10:
               this.i6 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               mstate.esp = mstate.esp - 8;
               this.i6 = -2;
               si32(this.i1,mstate.esp);
               si32(this.i6,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_findfile.start();
            case 11:
               this.i6 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i7 = li32(this.i4);
               this.i8 = this.i6;
               this.i9 = this.i6 + 12;
               if(uint(this.i9) >= uint(this.i7))
               {
                  this.i6 = this.i7;
               }
               else
               {
                  this.i6 = this.i6 + 12;
                  this.i7 = this.i8;
                  while(true)
                  {
                     this.f0 = lf64(this.i7 + 12);
                     sf64(this.f0,this.i7);
                     this.i8 = li32(this.i7 + 20);
                     si32(this.i8,this.i7 + 8);
                     this.i7 = li32(this.i4);
                     this.i8 = this.i6 + 12;
                     this.i9 = this.i6;
                     if(uint(this.i8) >= uint(this.i7))
                     {
                        break;
                     }
                     this.i6 = this.i8;
                     this.i7 = this.i9;
                  }
                  this.i6 = this.i7;
               }
               this.i6 = this.i6 + -12;
               si32(this.i6,this.i4);
               this.i6 = li32(this.i5);
               this.i7 = li32(this.i6 + 68);
               this.i6 = li32(this.i6 + 64);
               if(uint(this.i7) >= uint(this.i6))
               {
                  mstate.esp = mstate.esp - 4;
                  si32(this.i1,mstate.esp);
                  state = 12;
                  mstate.esp = mstate.esp - 4;
                  FSM_findfile.start();
                  return;
               }
               addr1020:
               this.i6 = 2;
               this.i7 = li32(this.i4);
               this.i8 = li32(this.i3);
               this.i7 = this.i7 - this.i8;
               this.i7 = this.i7 / 12;
               mstate.esp = mstate.esp - 12;
               this.i7 = this.i7 + -1;
               si32(this.i1,mstate.esp);
               si32(this.i6,mstate.esp + 4);
               si32(this.i7,mstate.esp + 8);
               state = 13;
               mstate.esp = mstate.esp - 4;
               FSM_findfile.start();
               return;
            case 12:
               mstate.esp = mstate.esp + 4;
               §§goto(addr1020);
            case 13:
               mstate.esp = mstate.esp + 12;
               this.i6 = li32(this.i4);
               this.i6 = this.i6 + -12;
               si32(this.i6,this.i4);
               this.i6 = li8(this.i2);
               if(this.i6 == 59)
               {
                  §§goto(addr363);
               }
               §§goto(addr1124);
            case 14:
               this.i4 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i4,mstate.ebp + -16);
               si32(this.i6,mstate.ebp + -8);
               this.i4 = li32(this.i1 + 8);
               mstate.esp = mstate.esp - 16;
               this.i5 = mstate.ebp + -16;
               si32(this.i1,mstate.esp);
               si32(this.i2,mstate.esp + 4);
               si32(this.i5,mstate.esp + 8);
               si32(this.i4,mstate.esp + 12);
               state = 15;
               mstate.esp = mstate.esp - 4;
               FSM_findfile.start();
               return;
            case 15:
               mstate.esp = mstate.esp + 16;
               this.i2 = li32(this.i1 + 8);
               this.i2 = this.i2 + 12;
               si32(this.i2,this.i1 + 8);
               mstate.esp = mstate.esp - 12;
               this.i2 = -1;
               this.i4 = 0;
               si32(this.i1,mstate.esp);
               si32(this.i2,mstate.esp + 4);
               si32(this.i4,mstate.esp + 8);
               state = 16;
               mstate.esp = mstate.esp - 4;
               FSM_findfile.start();
               return;
            case 16:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               this.i4 = this.i1 + 8;
               if(this.i2 == 0)
               {
                  this.i5 = FSM_findfile;
                  mstate.esp = mstate.esp - 12;
                  si32(this.i1,mstate.esp);
                  si32(this.i5,mstate.esp + 4);
                  si32(this.i3,mstate.esp + 8);
                  state = 17;
                  mstate.esp = mstate.esp - 4;
                  FSM_findfile.start();
                  return;
               }
               this.i3 = li32(this.i1 + 16);
               this.i5 = li32(this.i3 + 68);
               this.i3 = li32(this.i3 + 64);
               if(uint(this.i5) >= uint(this.i3))
               {
                  mstate.esp = mstate.esp - 4;
                  si32(this.i1,mstate.esp);
                  state = 3;
                  mstate.esp = mstate.esp - 4;
                  FSM_findfile.start();
                  return;
               }
               §§goto(addr259);
            case 17:
               mstate.esp = mstate.esp + 12;
               this.i3 = li32(this.i1 + 16);
               this.i5 = li32(this.i3 + 68);
               this.i3 = li32(this.i3 + 64);
               if(uint(this.i5) >= uint(this.i3))
               {
                  mstate.esp = mstate.esp - 4;
                  si32(this.i1,mstate.esp);
                  state = 18;
                  mstate.esp = mstate.esp - 4;
                  FSM_findfile.start();
                  return;
               }
               addr1626:
               this.i3 = FSM_findfile;
               this.i5 = li32(this.i4);
               mstate.esp = mstate.esp - 12;
               this.i6 = 0;
               si32(this.i1,mstate.esp);
               si32(this.i3,mstate.esp + 4);
               si32(this.i6,mstate.esp + 8);
               state = 19;
               mstate.esp = mstate.esp - 4;
               FSM_findfile.start();
               return;
            case 18:
               mstate.esp = mstate.esp + 4;
               §§goto(addr1626);
            case 19:
               this.i3 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i3,this.i5);
               this.i3 = 4;
               si32(this.i3,this.i5 + 8);
               this.i3 = li32(this.i4);
               this.i3 = this.i3 + 12;
               si32(this.i3,this.i4);
               this.i3 = li8(this.i2);
               if(this.i3 == 59)
               {
                  §§goto(addr364);
               }
               §§goto(addr1727);
            case 20:
               mstate.esp = mstate.esp + 4;
               §§goto(addr1839);
            case 21:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i2,this.i9);
               si32(this.i8,this.i9 + 8);
               this.i2 = li32(this.i4);
               this.i2 = this.i2 + 12;
               si32(this.i2,this.i4);
               this.i2 = this.i6;
               §§goto(addr1144);
         }
         mstate.esp = mstate.ebp;
         mstate.ebp = li32(mstate.esp);
         mstate.esp = mstate.esp + 4;
         mstate.esp = mstate.esp + 4;
         mstate.gworker = caller;
      }
   }
}
