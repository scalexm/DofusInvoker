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
   
   public final class FSM_auxresume extends Machine
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
      
      public function FSM_auxresume()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM_auxresume = null;
         _loc1_ = new FSM_auxresume();
         FSM_auxresume.gworker = _loc1_;
      }
      
      override public final function work() : void
      {
         switch(state)
         {
            case 0:
               mstate.esp = mstate.esp - 4;
               si32(mstate.ebp,mstate.esp);
               mstate.ebp = mstate.esp;
               mstate.esp = mstate.esp - 176;
               this.i0 = li32(mstate.ebp + 8);
               this.i1 = li32(mstate.ebp + 12);
               this.i2 = li32(mstate.ebp + 16);
               if(this.i0 == this.i1)
               {
                  this.i3 = 0;
               }
               else
               {
                  this.i3 = li8(this.i1 + 6);
                  if(this.i3 != 0)
                  {
                     if(this.i3 == 1)
                     {
                        this.i3 = 1;
                     }
                     else
                     {
                        this.i3 = 3;
                     }
                  }
                  else
                  {
                     this.i3 = mstate.ebp + -176;
                     this.i4 = li32(this.i1 + 20);
                     this.i5 = li32(this.i1 + 40);
                     mstate.esp = mstate.esp - 16;
                     this.i6 = 0;
                     si32(this.i4,mstate.esp);
                     si32(this.i5,mstate.esp + 4);
                     si32(this.i6,mstate.esp + 8);
                     si32(this.i3,mstate.esp + 12);
                     mstate.esp = mstate.esp - 4;
                     FSM_auxresume.start();
                  }
               }
               addr207:
               mstate.esp = mstate.esp - 8;
               si32(this.i1,mstate.esp);
               si32(this.i2,mstate.esp + 4);
               state = 2;
               mstate.esp = mstate.esp - 4;
               FSM_auxresume.start();
               return;
            case 1:
               this.i3 = mstate.eax;
               mstate.esp = mstate.esp + 16;
               if(this.i3 >= 1)
               {
                  this.i3 = 2;
               }
               else
               {
                  this.i3 = li32(this.i1 + 8);
                  this.i4 = li32(this.i1 + 12);
                  this.i3 = this.i3 - this.i4;
                  this.i3 = this.i3 + 11;
                  this.i3 = uint(this.i3) < uint(23)?3:1;
               }
               §§goto(addr207);
            case 2:
               this.i4 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               if(this.i4 == 0)
               {
                  this.i4 = FSM_auxresume;
                  mstate.esp = mstate.esp - 8;
                  si32(this.i0,mstate.esp);
                  si32(this.i4,mstate.esp + 4);
                  state = 3;
                  mstate.esp = mstate.esp - 4;
                  FSM_auxresume.start();
                  return;
               }
               addr295:
               if(this.i3 != 1)
               {
                  this.i1 = FSM_auxresume;
                  this.i2 = this.i3 << 2;
                  this.i1 = this.i1 + this.i2;
                  this.i1 = li32(this.i1);
                  mstate.esp = mstate.esp - 12;
                  this.i2 = FSM_auxresume;
                  si32(this.i0,mstate.esp);
                  si32(this.i2,mstate.esp + 4);
                  si32(this.i1,mstate.esp + 8);
                  state = 4;
                  mstate.esp = mstate.esp - 4;
                  FSM_auxresume.start();
                  return;
               }
               if(this.i0 != this.i1)
               {
                  this.i3 = 0 - this.i2;
                  this.i4 = li32(this.i0 + 8);
                  this.i3 = this.i3 * 12;
                  this.i3 = this.i4 + this.i3;
                  si32(this.i3,this.i0 + 8);
                  this.i3 = this.i0 + 8;
                  if(this.i2 >= 1)
                  {
                     this.i4 = 0;
                     this.i5 = this.i1 + 8;
                     this.i6 = this.i4;
                     while(true)
                     {
                        this.i7 = li32(this.i5);
                        this.i8 = li32(this.i3);
                        this.i9 = this.i7 + 12;
                        si32(this.i9,this.i5);
                        this.i8 = this.i8 + this.i6;
                        this.f0 = lf64(this.i8);
                        sf64(this.f0,this.i7);
                        this.i8 = li32(this.i8 + 8);
                        si32(this.i8,this.i7 + 8);
                        this.i6 = this.i6 + 12;
                        this.i4 = this.i4 + 1;
                        if(this.i4 != this.i2)
                        {
                           continue;
                        }
                        break;
                     }
                  }
               }
               this.i3 = li16(this.i0 + 52);
               si16(this.i3,this.i1 + 52);
               this.i4 = li8(this.i1 + 6);
               this.i5 = this.i1 + 6;
               this.i6 = this.i1 + 52;
               if(this.i4 != 1)
               {
                  this.i4 = this.i4 & 255;
                  if(this.i4 == 0)
                  {
                     this.i4 = li32(this.i1 + 20);
                     this.i7 = li32(this.i1 + 40);
                     if(this.i4 != this.i7)
                     {
                     }
                  }
                  this.i2 = FSM_auxresume;
                  mstate.esp = mstate.esp - 8;
                  si32(this.i1,mstate.esp);
                  si32(this.i2,mstate.esp + 4);
                  state = 5;
                  mstate.esp = mstate.esp - 4;
                  FSM_auxresume.start();
                  return;
               }
               this.i4 = this.i3 & 65535;
               if(uint(this.i4) >= uint(200))
               {
                  this.i2 = FSM_auxresume;
                  mstate.esp = mstate.esp - 8;
                  si32(this.i1,mstate.esp);
                  si32(this.i2,mstate.esp + 4);
                  state = 6;
                  mstate.esp = mstate.esp - 4;
                  FSM_auxresume.start();
                  return;
               }
               this.i4 = 0;
               this.i3 = this.i3 + 1;
               si16(this.i3,this.i6);
               si16(this.i3,this.i1 + 54);
               this.i3 = li32(this.i1 + 8);
               si32(this.i4,mstate.ebp + -12);
               this.i4 = li32(this.i1 + 104);
               this.i7 = mstate.ebp + -64;
               si32(this.i4,mstate.ebp + -64);
               si32(this.i7,this.i1 + 104);
               mstate.esp = mstate.esp - 4;
               this.i4 = this.i7 + 4;
               si32(this.i4,mstate.esp);
               state = 7;
               mstate.esp = mstate.esp - 4;
               mstate.funcs[FSM_auxresume]();
               return;
            case 3:
               mstate.esp = mstate.esp + 8;
               §§goto(addr295);
            case 4:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               addr376:
               this.i0 = -1;
               mstate.eax = this.i0;
               break;
            case 5:
               mstate.esp = mstate.esp + 8;
               this.i2 = 2;
               addr1207:
               if(uint(this.i2) <= uint(1))
               {
                  this.i2 = li32(this.i1 + 8);
                  this.i3 = li32(this.i1 + 12);
                  this.i2 = this.i2 - this.i3;
                  this.i3 = this.i2 / 12;
                  mstate.esp = mstate.esp - 8;
                  this.i4 = this.i3 + 1;
                  si32(this.i0,mstate.esp);
                  si32(this.i4,mstate.esp + 4);
                  state = 11;
                  mstate.esp = mstate.esp - 4;
                  FSM_auxresume.start();
                  return;
               }
               if(this.i1 != this.i0)
               {
                  this.i2 = 0;
                  this.i3 = li32(this.i1 + 8);
                  this.i3 = this.i3 + -12;
                  si32(this.i3,this.i1 + 8);
                  this.i0 = this.i0 + 8;
                  this.i1 = this.i1 + 8;
                  this.i3 = this.i2;
                  while(true)
                  {
                     this.i4 = li32(this.i0);
                     this.i5 = li32(this.i1);
                     this.i6 = this.i4 + 12;
                     si32(this.i6,this.i0);
                     this.i5 = this.i5 + this.i3;
                     this.f0 = lf64(this.i5);
                     sf64(this.f0,this.i4);
                     this.i5 = li32(this.i5 + 8);
                     si32(this.i5,this.i4 + 8);
                     this.i3 = this.i3 + 12;
                     this.i4 = this.i2 + 1;
                     if(this.i2 != 0)
                     {
                        this.i2 = this.i4;
                        continue;
                     }
                     break;
                  }
               }
               §§goto(addr376);
            case 6:
               mstate.esp = mstate.esp + 8;
               this.i2 = 2;
               §§goto(addr1207);
            case 7:
               this.i4 = mstate.eax;
               mstate.esp = mstate.esp + 4;
               this.i8 = this.i1 + 104;
               this.i9 = this.i7 + 52;
               this.i10 = this.i1 + 8;
               if(this.i4 == 0)
               {
                  this.i2 = 0 - this.i2;
                  this.i2 = this.i2 * 12;
                  mstate.esp = mstate.esp - 8;
                  this.i2 = this.i3 + this.i2;
                  si32(this.i1,mstate.esp);
                  si32(this.i2,mstate.esp + 4);
                  state = 8;
                  mstate.esp = mstate.esp - 4;
                  FSM_auxresume.start();
                  return;
               }
               addr882:
               this.i2 = li32(this.i7);
               si32(this.i2,this.i8);
               this.i2 = li32(this.i9);
               if(this.i2 != 0)
               {
                  si8(this.i2,this.i5);
                  this.i5 = li32(this.i10);
                  this.i3 = this.i2 + -2;
                  if(uint(this.i3) >= uint(2))
                  {
                     if(this.i2 != 5)
                     {
                        if(this.i2 == 4)
                        {
                           this.i3 = FSM_auxresume;
                           mstate.esp = mstate.esp - 12;
                           this.i4 = 17;
                           si32(this.i1,mstate.esp);
                           si32(this.i3,mstate.esp + 4);
                           si32(this.i4,mstate.esp + 8);
                           state = 9;
                           mstate.esp = mstate.esp - 4;
                           FSM_auxresume.start();
                           return;
                        }
                        this.i5 = this.i5 + 12;
                        si32(this.i5,this.i10);
                     }
                     else
                     {
                        this.i3 = FSM_auxresume;
                        mstate.esp = mstate.esp - 12;
                        this.i4 = 23;
                        si32(this.i1,mstate.esp);
                        si32(this.i3,mstate.esp + 4);
                        si32(this.i4,mstate.esp + 8);
                        state = 10;
                        mstate.esp = mstate.esp - 4;
                        FSM_auxresume.start();
                        return;
                     }
                  }
                  else
                  {
                     this.f0 = lf64(this.i5 + -12);
                     sf64(this.f0,this.i5);
                     this.i3 = li32(this.i5 + -4);
                     si32(this.i3,this.i5 + 8);
                     this.i5 = this.i5 + 12;
                     si32(this.i5,this.i10);
                  }
                  addr1151:
                  this.i3 = li32(this.i1 + 20);
                  si32(this.i5,this.i3 + 8);
                  this.i5 = li16(this.i6);
                  this.i5 = this.i5 + -1;
                  si16(this.i5,this.i6);
               }
               else
               {
                  this.i2 = li16(this.i6);
                  this.i3 = li8(this.i5);
                  this.i2 = this.i2 + -1;
                  si16(this.i2,this.i6);
                  this.i2 = this.i3;
               }
               §§goto(addr1207);
            case 8:
               mstate.esp = mstate.esp + 8;
               §§goto(addr882);
            case 9:
               this.i3 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i3,this.i5);
               this.i3 = 4;
               si32(this.i3,this.i5 + 8);
               this.i5 = this.i5 + 12;
               si32(this.i5,this.i10);
               §§goto(addr1151);
            case 10:
               this.i3 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i3,this.i5);
               this.i3 = 4;
               si32(this.i3,this.i5 + 8);
               this.i5 = this.i5 + 12;
               si32(this.i5,this.i10);
               §§goto(addr1151);
            case 11:
               this.i4 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i5 = this.i1 + 8;
               if(this.i4 == 0)
               {
                  this.i4 = FSM_auxresume;
                  mstate.esp = mstate.esp - 8;
                  si32(this.i0,mstate.esp);
                  si32(this.i4,mstate.esp + 4);
                  state = 12;
                  mstate.esp = mstate.esp - 4;
                  FSM_auxresume.start();
                  return;
               }
               if(this.i1 != this.i0)
               {
                  this.i1 = 0 - this.i3;
                  this.i4 = li32(this.i5);
                  this.i1 = this.i1 * 12;
                  this.i1 = this.i4 + this.i1;
                  si32(this.i1,this.i5);
                  if(this.i2 >= 12)
                  {
                     this.i1 = 0;
                     this.i0 = this.i0 + 8;
                     this.i2 = this.i1;
                     while(true)
                     {
                        this.i4 = li32(this.i0);
                        this.i6 = li32(this.i5);
                        this.i7 = this.i4 + 12;
                        si32(this.i7,this.i0);
                        this.i6 = this.i6 + this.i2;
                        this.f0 = lf64(this.i6);
                        sf64(this.f0,this.i4);
                        this.i6 = li32(this.i6 + 8);
                        si32(this.i6,this.i4 + 8);
                        this.i2 = this.i2 + 12;
                        this.i1 = this.i1 + 1;
                        if(this.i1 != this.i3)
                        {
                           continue;
                        }
                        break;
                     }
                  }
               }
               addr1595:
               mstate.eax = this.i3;
               break;
            case 12:
               mstate.esp = mstate.esp + 8;
               if(this.i1 != this.i0)
               {
                  this.i1 = 0 - this.i3;
                  this.i4 = li32(this.i5);
                  this.i1 = this.i1 * 12;
                  this.i1 = this.i4 + this.i1;
                  si32(this.i1,this.i5);
                  if(this.i2 >= 12)
                  {
                     this.i1 = 0;
                     this.i0 = this.i0 + 8;
                     this.i2 = this.i1;
                     while(true)
                     {
                        this.i4 = li32(this.i0);
                        this.i6 = li32(this.i5);
                        this.i7 = this.i4 + 12;
                        si32(this.i7,this.i0);
                        this.i6 = this.i6 + this.i2;
                        this.f0 = lf64(this.i6);
                        sf64(this.f0,this.i4);
                        this.i6 = li32(this.i6 + 8);
                        si32(this.i6,this.i4 + 8);
                        this.i2 = this.i2 + 12;
                        this.i1 = this.i1 + 1;
                        if(this.i1 != this.i3)
                        {
                           continue;
                        }
                     }
                  }
               }
               §§goto(addr1595);
         }
         mstate.esp = mstate.ebp;
         mstate.ebp = li32(mstate.esp);
         mstate.esp = mstate.esp + 4;
         mstate.esp = mstate.esp + 4;
         mstate.gworker = caller;
      }
   }
}
