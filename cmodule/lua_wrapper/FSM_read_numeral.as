package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.li8;
   import avm2.intrinsics.memory.si32;
   import avm2.intrinsics.memory.si8;
   
   public final class FSM_read_numeral extends Machine
   {
      
      public static const intRegCount:int = 12;
      
      public static const NumberRegCount:int = 0;
       
      
      public var i10:int;
      
      public var i11:int;
      
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
      
      public function FSM_read_numeral()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM_read_numeral = null;
         _loc1_ = new FSM_read_numeral();
         FSM_read_numeral.gworker = _loc1_;
      }
      
      override public final function work() : void
      {
         switch(state)
         {
            case 0:
               mstate.esp = mstate.esp - 4;
               si32(mstate.ebp,mstate.esp);
               mstate.ebp = mstate.esp;
               mstate.esp = mstate.esp - 100;
               this.i0 = li32(mstate.ebp + 8);
               this.i1 = li32(mstate.ebp + 12);
               this.i2 = this.i0 + 44;
               this.i3 = this.i0;
               break;
            case 1:
               mstate.esp = mstate.esp + 8;
               this.i4 = li32(this.i2);
               this.i5 = li32(this.i4);
               this.i6 = this.i5 + -1;
               si32(this.i6,this.i4);
               this.i4 = li32(this.i2);
               if(this.i5 != 0)
               {
                  this.i5 = li32(this.i4 + 4);
                  this.i6 = li8(this.i5);
                  this.i5 = this.i5 + 1;
                  si32(this.i5,this.i4 + 4);
                  si32(this.i6,this.i3);
                  this.i4 = this.i6;
                  this.i5 = this.i6;
                  addr330:
                  this.i6 = FSM_read_numeral;
                  this.i5 = this.i5 << 2;
                  this.i5 = this.i6 + this.i5;
                  this.i5 = li32(this.i5 + 52);
                  this.i5 = this.i5 & 1024;
                  if(this.i5 == 0)
                  {
                     addr368:
                     if(this.i4 != 46)
                     {
                        this.i4 = FSM_read_numeral;
                        mstate.esp = mstate.esp - 8;
                        si32(this.i0,mstate.esp);
                        si32(this.i4,mstate.esp + 4);
                        state = 3;
                        mstate.esp = mstate.esp - 4;
                        FSM_read_numeral.start();
                        return;
                     }
                  }
                  break;
               }
               this.i5 = mstate.ebp + -100;
               this.i6 = li32(this.i4 + 16);
               this.i7 = li32(this.i4 + 8);
               this.i8 = li32(this.i4 + 12);
               mstate.esp = mstate.esp - 12;
               si32(this.i6,mstate.esp);
               si32(this.i8,mstate.esp + 4);
               si32(this.i5,mstate.esp + 8);
               state = 2;
               mstate.esp = mstate.esp - 4;
               mstate.funcs[this.i7]();
               return;
            case 2:
               this.i5 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               if(this.i5 != 0)
               {
                  this.i6 = li32(mstate.ebp + -100);
                  if(this.i6 != 0)
                  {
                     this.i6 = this.i6 + -1;
                     si32(this.i6,this.i4);
                     si32(this.i5,this.i4 + 4);
                     this.i6 = li8(this.i5);
                     this.i5 = this.i5 + 1;
                     si32(this.i5,this.i4 + 4);
                     this.i4 = this.i6;
                  }
                  addr308:
                  this.i5 = this.i4;
                  si32(this.i5,this.i3);
                  if(uint(this.i5) <= uint(255))
                  {
                     this.i4 = this.i5;
                     §§goto(addr330);
                  }
                  else
                  {
                     this.i4 = this.i5;
                  }
                  §§goto(addr368);
               }
               this.i4 = -1;
               §§goto(addr308);
            case 3:
               this.i4 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               if(this.i4 != 0)
               {
                  this.i4 = FSM_read_numeral;
                  mstate.esp = mstate.esp - 8;
                  si32(this.i0,mstate.esp);
                  si32(this.i4,mstate.esp + 4);
                  state = 4;
                  mstate.esp = mstate.esp - 4;
                  FSM_read_numeral.start();
                  return;
               }
               addr786:
               this.i4 = li32(this.i3);
               addr866:
               if(uint(this.i4) <= uint(255))
               {
                  this.i5 = this.i4;
                  addr488:
                  this.i6 = li32(FSM_read_numeral);
                  this.i4 = this.i4 << 2;
                  this.i4 = this.i6 + this.i4;
                  this.i4 = li32(this.i4 + 52);
                  this.i4 = this.i4 & 1280;
                  if(this.i4 != 0)
                  {
                     this.i4 = this.i5;
                  }
                  else
                  {
                     this.i4 = this.i5;
                  }
                  addr530:
                  mstate.esp = mstate.esp - 8;
                  si32(this.i0,mstate.esp);
                  si32(this.i4,mstate.esp + 4);
                  state = 5;
                  mstate.esp = mstate.esp - 4;
                  FSM_read_numeral.start();
                  return;
               }
               this.i5 = this.i4;
               addr811:
               mstate.esp = mstate.esp - 4;
               si32(this.i4,mstate.esp);
               mstate.esp = mstate.esp - 4;
               FSM_read_numeral.start();
               addr866:
               if(this.i4 == 95)
               {
                  addr529:
                  §§goto(addr530);
               }
               else
               {
                  this.i2 = 0;
                  mstate.esp = mstate.esp - 8;
                  si32(this.i0,mstate.esp);
                  si32(this.i2,mstate.esp + 4);
                  state = 8;
                  mstate.esp = mstate.esp - 4;
                  FSM_read_numeral.start();
                  return;
               }
            case 4:
               this.i4 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i4 = li32(this.i3);
               if(uint(this.i4) <= uint(255))
               {
                  this.i5 = this.i4;
                  §§goto(addr488);
               }
               else
               {
                  this.i5 = this.i4;
                  §§goto(addr811);
               }
               §§goto(addr866);
            case 5:
               mstate.esp = mstate.esp + 8;
               this.i4 = li32(this.i2);
               this.i5 = li32(this.i4);
               this.i6 = this.i5 + -1;
               si32(this.i6,this.i4);
               this.i4 = li32(this.i2);
               if(this.i5 != 0)
               {
                  this.i5 = li32(this.i4 + 4);
                  this.i6 = li8(this.i5);
                  this.i5 = this.i5 + 1;
                  si32(this.i5,this.i4 + 4);
                  si32(this.i6,this.i3);
                  this.i5 = this.i6;
                  this.i4 = this.i6;
                  §§goto(addr488);
               }
               else
               {
                  this.i5 = mstate.ebp + -4;
                  this.i6 = li32(this.i4 + 16);
                  this.i7 = li32(this.i4 + 8);
                  this.i8 = li32(this.i4 + 12);
                  mstate.esp = mstate.esp - 12;
                  si32(this.i6,mstate.esp);
                  si32(this.i8,mstate.esp + 4);
                  si32(this.i5,mstate.esp + 8);
                  state = 6;
                  mstate.esp = mstate.esp - 4;
                  mstate.funcs[this.i7]();
                  return;
               }
            case 6:
               this.i5 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               if(this.i5 != 0)
               {
                  this.i6 = li32(mstate.ebp + -4);
                  if(this.i6 != 0)
                  {
                     this.i6 = this.i6 + -1;
                     si32(this.i6,this.i4);
                     si32(this.i5,this.i4 + 4);
                     this.i6 = li8(this.i5);
                     this.i5 = this.i5 + 1;
                     si32(this.i5,this.i4 + 4);
                     this.i4 = this.i6;
                  }
                  addr781:
                  si32(this.i4,this.i3);
                  §§goto(addr786);
               }
               this.i4 = -1;
               §§goto(addr781);
            case 7:
               this.i4 = mstate.eax;
               mstate.esp = mstate.esp + 4;
               this.i4 = this.i4 & 1280;
               if(this.i4 != 0)
               {
                  this.i4 = this.i5;
               }
               else
               {
                  this.i4 = this.i5;
                  §§goto(addr866);
               }
               §§goto(addr529);
            case 8:
               mstate.esp = mstate.esp + 8;
               this.i2 = li32(this.i0 + 48);
               this.i3 = li8(this.i0 + 56);
               this.i4 = li32(this.i2 + 4);
               this.i2 = li32(this.i2);
               this.i5 = this.i0 + 48;
               this.i6 = this.i0 + 56;
               if(this.i4 != 0)
               {
                  this.i7 = 0;
                  this.i2 = this.i2 + this.i4;
                  this.i2 = this.i2 + -1;
                  while(true)
                  {
                     this.i8 = li8(this.i2);
                     this.i9 = this.i2;
                     if(this.i8 == 46)
                     {
                        si8(this.i3,this.i9);
                     }
                     this.i2 = this.i2 + -1;
                     this.i7 = this.i7 + 1;
                     if(this.i7 != this.i4)
                     {
                        continue;
                     }
                     break;
                  }
               }
               this.i2 = li32(this.i5);
               this.i2 = li32(this.i2);
               mstate.esp = mstate.esp - 8;
               si32(this.i2,mstate.esp);
               si32(this.i1,mstate.esp + 4);
               state = 9;
               mstate.esp = mstate.esp - 4;
               FSM_read_numeral.start();
               return;
            case 9:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               if(this.i2 == 0)
               {
                  this.i2 = li8(FSM_read_numeral);
                  if(this.i2 == 0)
                  {
                     this.i2 = 1;
                     si8(this.i2,FSM_read_numeral);
                  }
                  this.i2 = li8(FSM_read_numeral);
                  if(this.i2 == 0)
                  {
                     this.i2 = FSM_read_numeral;
                     this.i3 = li32(FSM_read_numeral);
                     this.i4 = FSM_read_numeral;
                     this.i2 = this.i3 == 0?int(this.i2):int(this.i4);
                     this.i3 = li32(this.i2);
                     si32(this.i3,FSM_read_numeral);
                     this.i3 = li32(this.i2 + 4);
                     si32(this.i3,FSM_read_numeral);
                     this.i2 = li32(this.i2 + 8);
                     si32(this.i2,FSM_read_numeral);
                     this.i2 = 1;
                     si8(this.i2,FSM_read_numeral);
                  }
                  this.i2 = li32(FSM_read_numeral);
                  this.i3 = li8(this.i6);
                  this.i2 = li8(this.i2);
                  si8(this.i2,this.i6);
                  this.i4 = li32(this.i5);
                  this.i7 = li32(this.i4 + 4);
                  this.i4 = li32(this.i4);
                  if(this.i7 != 0)
                  {
                     this.i8 = 0;
                     this.i4 = this.i4 + this.i7;
                     this.i4 = this.i4 + -1;
                     while(true)
                     {
                        this.i9 = li8(this.i4);
                        this.i10 = this.i3 & 255;
                        this.i11 = this.i4;
                        if(this.i9 == this.i10)
                        {
                           si8(this.i2,this.i11);
                        }
                        this.i4 = this.i4 + -1;
                        this.i8 = this.i8 + 1;
                        if(this.i8 != this.i7)
                        {
                           continue;
                        }
                        break;
                     }
                  }
                  this.i2 = li32(this.i5);
                  this.i2 = li32(this.i2);
                  mstate.esp = mstate.esp - 8;
                  si32(this.i2,mstate.esp);
                  si32(this.i1,mstate.esp + 4);
                  state = 10;
                  mstate.esp = mstate.esp - 4;
                  FSM_read_numeral.start();
                  return;
               }
               addr1734:
               mstate.esp = mstate.ebp;
               mstate.ebp = li32(mstate.esp);
               mstate.esp = mstate.esp + 4;
               mstate.esp = mstate.esp + 4;
               mstate.gworker = caller;
               return;
            case 10:
               this.i1 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               if(this.i1 == 0)
               {
                  this.i1 = li32(this.i5);
                  this.i2 = li8(this.i6);
                  this.i3 = li32(this.i1 + 4);
                  this.i1 = li32(this.i1);
                  if(this.i3 != 0)
                  {
                     this.i4 = 0;
                     this.i1 = this.i1 + this.i3;
                     this.i1 = this.i1 + -1;
                     while(true)
                     {
                        this.i6 = li8(this.i1);
                        this.i7 = this.i2 & 255;
                        this.i8 = this.i1;
                        if(this.i6 == this.i7)
                        {
                           this.i6 = 46;
                           si8(this.i6,this.i8);
                        }
                        this.i1 = this.i1 + -1;
                        this.i4 = this.i4 + 1;
                        if(this.i4 != this.i3)
                        {
                           continue;
                        }
                        break;
                     }
                  }
                  this.i1 = 80;
                  this.i2 = li32(this.i0 + 52);
                  mstate.esp = mstate.esp - 12;
                  this.i3 = mstate.ebp + -96;
                  this.i2 = this.i2 + 16;
                  si32(this.i3,mstate.esp);
                  si32(this.i2,mstate.esp + 4);
                  si32(this.i1,mstate.esp + 8);
                  mstate.esp = mstate.esp - 4;
                  FSM_read_numeral.start();
               }
               else
               {
                  §§goto(addr1734);
               }
            case 11:
               mstate.esp = mstate.esp + 12;
               this.i1 = li32(this.i0 + 4);
               this.i2 = li32(this.i0 + 40);
               mstate.esp = mstate.esp - 20;
               this.i4 = FSM_read_numeral;
               this.i6 = FSM_read_numeral;
               si32(this.i2,mstate.esp);
               si32(this.i4,mstate.esp + 4);
               si32(this.i3,mstate.esp + 8);
               si32(this.i1,mstate.esp + 12);
               si32(this.i6,mstate.esp + 16);
               state = 12;
               mstate.esp = mstate.esp - 4;
               FSM_read_numeral.start();
               return;
            case 12:
               this.i1 = mstate.eax;
               mstate.esp = mstate.esp + 20;
               mstate.esp = mstate.esp - 8;
               this.i2 = 0;
               si32(this.i0,mstate.esp);
               si32(this.i2,mstate.esp + 4);
               state = 13;
               mstate.esp = mstate.esp - 4;
               FSM_read_numeral.start();
               return;
            case 13:
               mstate.esp = mstate.esp + 8;
               this.i2 = li32(this.i5);
               this.i2 = li32(this.i2);
               this.i3 = li32(this.i0 + 40);
               mstate.esp = mstate.esp - 16;
               this.i4 = FSM_read_numeral;
               si32(this.i3,mstate.esp);
               si32(this.i4,mstate.esp + 4);
               si32(this.i1,mstate.esp + 8);
               si32(this.i2,mstate.esp + 12);
               state = 14;
               mstate.esp = mstate.esp - 4;
               FSM_read_numeral.start();
               return;
            case 14:
               this.i1 = mstate.eax;
               mstate.esp = mstate.esp + 16;
               this.i0 = li32(this.i0 + 40);
               mstate.esp = mstate.esp - 8;
               this.i1 = 3;
               si32(this.i0,mstate.esp);
               si32(this.i1,mstate.esp + 4);
               state = 15;
               mstate.esp = mstate.esp - 4;
               FSM_read_numeral.start();
               return;
            case 15:
               mstate.esp = mstate.esp + 8;
               §§goto(addr1734);
         }
         this.i4 = li32(this.i3);
         mstate.esp = mstate.esp - 8;
         si32(this.i0,mstate.esp);
         si32(this.i4,mstate.esp + 4);
         state = 1;
         mstate.esp = mstate.esp - 4;
         FSM_read_numeral.start();
      }
   }
}
