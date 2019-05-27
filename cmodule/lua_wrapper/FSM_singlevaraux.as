package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.li16;
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.li8;
   import avm2.intrinsics.memory.si32;
   import avm2.intrinsics.memory.si8;
   
   public final class FSM_singlevaraux extends Machine
   {
      
      public static const intRegCount:int = 15;
      
      public static const NumberRegCount:int = 0;
       
      
      public var i10:int;
      
      public var i11:int;
      
      public var i12:int;
      
      public var i13:int;
      
      public var i14:int;
      
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
      
      public function FSM_singlevaraux()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM_singlevaraux = null;
         _loc1_ = new FSM_singlevaraux();
         FSM_singlevaraux.gworker = _loc1_;
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
               this.i0 = li32(mstate.ebp + 8);
               this.i1 = li32(mstate.ebp + 12);
               this.i2 = li32(mstate.ebp + 16);
               this.i3 = li32(mstate.ebp + 20);
               this.i4 = this.i0;
               if(this.i0 == 0)
               {
                  this.i0 = -1;
                  si32(this.i0,this.i2 + 12);
                  si32(this.i0,this.i2 + 16);
                  this.i0 = 8;
                  si32(this.i0,this.i2);
                  this.i1 = 255;
                  si32(this.i1,this.i2 + 4);
               }
               else
               {
                  this.i5 = li8(this.i0 + 50);
                  this.i6 = this.i5 + -1;
                  if(this.i6 > -1)
                  {
                     this.i5 = this.i5 & 255;
                     this.i6 = li32(this.i0);
                     this.i7 = this.i5 << 1;
                     this.i6 = li32(this.i6 + 24);
                     this.i7 = this.i4 + this.i7;
                     this.i7 = this.i7 + 170;
                     this.i5 = this.i5 + -1;
                     while(true)
                     {
                        this.i8 = li16(this.i7);
                        this.i8 = this.i8 * 12;
                        this.i8 = this.i6 + this.i8;
                        this.i8 = li32(this.i8);
                        if(this.i8 == this.i1)
                        {
                           break;
                        }
                        this.i7 = this.i7 + -2;
                        this.i5 = this.i5 + -1;
                        if(this.i5 >= 0)
                        {
                           continue;
                        }
                     }
                     if(this.i5 >= 0)
                     {
                        this.i1 = -1;
                        si32(this.i1,this.i2 + 12);
                        si32(this.i1,this.i2 + 16);
                        this.i1 = 6;
                        si32(this.i1,this.i2);
                        si32(this.i5,this.i2 + 4);
                        if(this.i3 == 0)
                        {
                           this.i0 = li32(this.i0 + 20);
                           if(this.i0 != 0)
                           {
                              while(true)
                              {
                                 this.i1 = li8(this.i0 + 8);
                                 if(this.i1 <= this.i5)
                                 {
                                    break;
                                 }
                                 this.i0 = li32(this.i0);
                                 if(this.i0 != 0)
                                 {
                                    continue;
                                 }
                                 break;
                              }
                           }
                           if(this.i0 != 0)
                           {
                              this.i1 = 1;
                              si8(this.i1,this.i0 + 9);
                              this.i0 = 6;
                           }
                        }
                        this.i0 = 6;
                     }
                     else
                     {
                        this.i3 = 0;
                        this.i5 = li32(this.i0 + 8);
                        mstate.esp = mstate.esp - 16;
                        si32(this.i5,mstate.esp);
                        si32(this.i1,mstate.esp + 4);
                        si32(this.i2,mstate.esp + 8);
                        si32(this.i3,mstate.esp + 12);
                        state = 1;
                        mstate.esp = mstate.esp - 4;
                        FSM_singlevaraux.start();
                        return;
                     }
                  }
                  this.i5 = -1;
                  §§goto(addr125);
               }
               addr1541:
               mstate.eax = this.i0;
               break;
            case 1:
               this.i3 = mstate.eax;
               mstate.esp = mstate.esp + 16;
               if(this.i3 == 8)
               {
                  this.i0 = 8;
               }
               else
               {
                  this.i3 = li32(this.i0);
                  this.i5 = li32(this.i3 + 36);
                  this.i6 = li8(this.i3 + 72);
                  this.i7 = this.i3 + 72;
                  this.i8 = this.i3 + 36;
                  if(this.i6 >= 1)
                  {
                     this.i9 = 0;
                     this.i10 = li32(this.i2);
                     this.i11 = this.i2 + 4;
                     this.i12 = this.i2;
                     while(true)
                     {
                        this.i13 = li8(this.i4 + 51);
                        if(this.i13 == this.i10)
                        {
                           this.i13 = li8(this.i4 + 52);
                           this.i14 = li32(this.i11);
                           if(this.i13 == this.i14)
                           {
                              this.i0 = 7;
                              si32(this.i9,this.i11);
                              si32(this.i0,this.i12);
                           }
                        }
                        this.i4 = this.i4 + 2;
                        this.i9 = this.i9 + 1;
                        if(this.i6 > this.i9)
                        {
                           continue;
                        }
                        break;
                     }
                  }
                  this.i9 = this.i6 + 1;
                  if(this.i9 >= 61)
                  {
                     this.i9 = li32(this.i3 + 60);
                     this.i11 = li32(this.i0 + 16);
                     this.i12 = this.i0 + 12;
                     if(this.i9 == 0)
                     {
                        this.i9 = FSM_singlevaraux;
                        mstate.esp = mstate.esp - 16;
                        this.i4 = FSM_singlevaraux;
                        this.i6 = 60;
                        si32(this.i11,mstate.esp);
                        si32(this.i9,mstate.esp + 4);
                        si32(this.i6,mstate.esp + 8);
                        si32(this.i4,mstate.esp + 12);
                        state = 2;
                        mstate.esp = mstate.esp - 4;
                        FSM_singlevaraux.start();
                        return;
                     }
                     this.i4 = FSM_singlevaraux;
                     mstate.esp = mstate.esp - 20;
                     this.i6 = FSM_singlevaraux;
                     this.i10 = 60;
                     si32(this.i11,mstate.esp);
                     si32(this.i4,mstate.esp + 4);
                     si32(this.i9,mstate.esp + 8);
                     si32(this.i10,mstate.esp + 12);
                     si32(this.i6,mstate.esp + 16);
                     state = 6;
                     mstate.esp = mstate.esp - 4;
                     FSM_singlevaraux.start();
                     return;
                  }
                  addr1072:
                  this.i9 = li8(this.i7);
                  this.i11 = li32(this.i8);
                  this.i9 = this.i9 + 1;
                  if(this.i9 <= this.i11)
                  {
                     loop3:
                     while(true)
                     {
                        this.i9 = li32(this.i8);
                        this.i11 = li32(this.i3 + 28);
                        if(this.i9 <= this.i5)
                        {
                           break;
                        }
                        addr1216:
                        this.i9 = this.i11;
                        while(true)
                        {
                           this.i11 = 0;
                           this.i12 = this.i5 << 2;
                           this.i9 = this.i9 + this.i12;
                           si32(this.i11,this.i9);
                           this.i5 = this.i5 + 1;
                           continue loop3;
                        }
                     }
                     this.i5 = this.i11;
                     this.i9 = this.i5;
                     this.i11 = li8(this.i7);
                     this.i11 = this.i11 << 2;
                     this.i9 = this.i9 + this.i11;
                     si32(this.i1,this.i9);
                     this.i9 = li8(this.i1 + 5);
                     this.i9 = this.i9 & 3;
                     if(this.i9 != 0)
                     {
                        this.i9 = li8(this.i3 + 5);
                        this.i11 = this.i3 + 5;
                        this.i12 = this.i9 & 4;
                        if(this.i12 != 0)
                        {
                           this.i12 = li32(this.i0 + 16);
                           this.i12 = li32(this.i12 + 16);
                           this.i3 = li8(this.i12 + 21);
                           if(this.i3 == 1)
                           {
                              mstate.esp = mstate.esp - 8;
                              si32(this.i12,mstate.esp);
                              si32(this.i1,mstate.esp + 4);
                              mstate.esp = mstate.esp - 4;
                              FSM_singlevaraux.start();
                           }
                           else
                           {
                              this.i12 = li8(this.i12 + 20);
                              this.i9 = this.i9 & -8;
                              this.i12 = this.i12 & 3;
                              this.i9 = this.i12 | this.i9;
                              si8(this.i9,this.i11);
                           }
                        }
                     }
                     this.i9 = 7;
                     this.i11 = li8(this.i7);
                     this.i12 = li8(this.i2);
                     this.i11 = this.i11 << 1;
                     this.i0 = this.i0 + 51;
                     this.i11 = this.i0 + this.i11;
                     si8(this.i12,this.i11);
                     this.i11 = li8(this.i7);
                     this.i12 = li8(this.i2 + 4);
                     this.i11 = this.i11 << 1;
                     this.i0 = this.i0 + this.i11;
                     si8(this.i12,this.i0 + 1);
                     this.i0 = li8(this.i7);
                     this.i11 = this.i0 + 1;
                     si8(this.i11,this.i7);
                     si32(this.i0,this.i2 + 4);
                     si32(this.i9,this.i2);
                     mstate.eax = this.i9;
                     break;
                  }
                  this.i9 = FSM_singlevaraux;
                  this.i11 = li32(this.i3 + 28);
                  this.i12 = li32(this.i0 + 16);
                  mstate.esp = mstate.esp - 24;
                  this.i4 = 2147483645;
                  this.i6 = 4;
                  si32(this.i12,mstate.esp);
                  si32(this.i11,mstate.esp + 4);
                  si32(this.i8,mstate.esp + 8);
                  si32(this.i6,mstate.esp + 12);
                  si32(this.i4,mstate.esp + 16);
                  si32(this.i9,mstate.esp + 20);
                  state = 10;
                  mstate.esp = mstate.esp - 4;
                  FSM_singlevaraux.start();
                  return;
               }
               §§goto(addr1541);
            case 2:
               this.i9 = mstate.eax;
               mstate.esp = mstate.esp + 16;
               this.i11 = li32(this.i12);
               this.i12 = li32(this.i11 + 52);
               mstate.esp = mstate.esp - 12;
               this.i4 = 80;
               this.i6 = mstate.ebp + -160;
               this.i12 = this.i12 + 16;
               si32(this.i6,mstate.esp);
               si32(this.i12,mstate.esp + 4);
               si32(this.i4,mstate.esp + 8);
               mstate.esp = mstate.esp - 4;
               FSM_singlevaraux.start();
            case 3:
               mstate.esp = mstate.esp + 12;
               this.i12 = li32(this.i11 + 4);
               this.i4 = li32(this.i11 + 40);
               mstate.esp = mstate.esp - 20;
               this.i10 = FSM_singlevaraux;
               si32(this.i4,mstate.esp);
               si32(this.i10,mstate.esp + 4);
               si32(this.i6,mstate.esp + 8);
               si32(this.i12,mstate.esp + 12);
               si32(this.i9,mstate.esp + 16);
               state = 4;
               mstate.esp = mstate.esp - 4;
               FSM_singlevaraux.start();
               return;
            case 4:
               this.i9 = mstate.eax;
               mstate.esp = mstate.esp + 20;
               this.i9 = li32(this.i11 + 40);
               mstate.esp = mstate.esp - 8;
               this.i11 = 3;
               si32(this.i9,mstate.esp);
               si32(this.i11,mstate.esp + 4);
               state = 5;
               mstate.esp = mstate.esp - 4;
               FSM_singlevaraux.start();
               return;
            case 5:
               mstate.esp = mstate.esp + 8;
               §§goto(addr1072);
            case 6:
               this.i9 = mstate.eax;
               mstate.esp = mstate.esp + 20;
               this.i11 = li32(this.i12);
               this.i12 = li32(this.i11 + 52);
               mstate.esp = mstate.esp - 12;
               this.i4 = 80;
               this.i6 = mstate.ebp + -80;
               this.i12 = this.i12 + 16;
               si32(this.i6,mstate.esp);
               si32(this.i12,mstate.esp + 4);
               si32(this.i4,mstate.esp + 8);
               mstate.esp = mstate.esp - 4;
               FSM_singlevaraux.start();
            case 7:
               mstate.esp = mstate.esp + 12;
               this.i12 = li32(this.i11 + 4);
               this.i4 = li32(this.i11 + 40);
               mstate.esp = mstate.esp - 20;
               this.i10 = FSM_singlevaraux;
               si32(this.i4,mstate.esp);
               si32(this.i10,mstate.esp + 4);
               si32(this.i6,mstate.esp + 8);
               si32(this.i12,mstate.esp + 12);
               si32(this.i9,mstate.esp + 16);
               state = 8;
               mstate.esp = mstate.esp - 4;
               FSM_singlevaraux.start();
               return;
            case 8:
               this.i9 = mstate.eax;
               mstate.esp = mstate.esp + 20;
               this.i9 = li32(this.i11 + 40);
               mstate.esp = mstate.esp - 8;
               this.i11 = 3;
               si32(this.i9,mstate.esp);
               si32(this.i11,mstate.esp + 4);
               state = 9;
               mstate.esp = mstate.esp - 4;
               FSM_singlevaraux.start();
               return;
            case 9:
               mstate.esp = mstate.esp + 8;
               §§goto(addr1072);
            case 10:
               this.i9 = mstate.eax;
               mstate.esp = mstate.esp + 24;
               si32(this.i9,this.i3 + 28);
               this.i11 = li32(this.i8);
               if(this.i11 <= this.i5)
               {
                  this.i5 = this.i9;
               }
               else
               {
                  §§goto(addr1216);
               }
               §§goto(addr1265);
            case 11:
               mstate.esp = mstate.esp + 8;
               §§goto(addr1426);
         }
         mstate.esp = mstate.ebp;
         mstate.ebp = li32(mstate.esp);
         mstate.esp = mstate.esp + 4;
         mstate.esp = mstate.esp + 4;
         mstate.gworker = caller;
      }
   }
}
