package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.lf64;
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.li8;
   import avm2.intrinsics.memory.sf64;
   import avm2.intrinsics.memory.si32;
   import avm2.intrinsics.memory.si8;
   
   public final class FSM_addk extends Machine
   {
      
      public static const intRegCount:int = 10;
      
      public static const NumberRegCount:int = 2;
       
      
      public var f0:Number;
      
      public var f1:Number;
      
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
      
      public function FSM_addk()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM_addk = null;
         _loc1_ = new FSM_addk();
         FSM_addk.gworker = _loc1_;
      }
      
      override public final function work() : void
      {
         switch(state)
         {
            case 0:
               mstate.esp = mstate.esp - 4;
               si32(mstate.ebp,mstate.esp);
               mstate.ebp = mstate.esp;
               mstate.esp = mstate.esp - 0;
               this.i0 = 0;
               this.i1 = li32(mstate.ebp + 8);
               this.i2 = li32(this.i1 + 16);
               this.i3 = li32(this.i1 + 4);
               mstate.esp = mstate.esp - 8;
               this.i4 = li32(mstate.ebp + 12);
               si32(this.i3,mstate.esp);
               si32(this.i4,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_addk.start();
            case 1:
               this.i5 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               si8(this.i0,this.i3 + 6);
               this.i0 = li32(mstate.ebp + 16);
               this.i6 = FSM_addk;
               if(this.i5 != this.i6)
               {
                  this.i3 = this.i5;
                  addr393:
                  this.i4 = li32(this.i1);
                  this.i5 = li32(this.i4 + 40);
                  this.i6 = li32(this.i3 + 8);
                  this.i7 = this.i3 + 8;
                  this.i8 = this.i4 + 40;
                  if(this.i6 == 3)
                  {
                     this.f0 = lf64(this.i3);
                     this.i0 = int(this.f0);
                  }
                  else
                  {
                     this.i6 = 3;
                     this.i9 = li32(this.i1 + 40);
                     this.f0 = Number(this.i9);
                     sf64(this.f0,this.i3);
                     si32(this.i6,this.i7);
                     this.i3 = li32(this.i1 + 40);
                     this.i6 = li32(this.i8);
                     this.i1 = this.i1 + 40;
                     this.i3 = this.i3 + 1;
                     if(this.i3 <= this.i6)
                     {
                        loop0:
                        while(true)
                        {
                           this.i3 = li32(this.i8);
                           this.i6 = li32(this.i4 + 8);
                           if(this.i3 <= this.i5)
                           {
                              break;
                           }
                           addr643:
                           this.i3 = this.i6;
                           while(true)
                           {
                              this.i6 = 0;
                              this.i7 = this.i5 * 12;
                              this.i3 = this.i3 + this.i7;
                              si32(this.i6,this.i3 + 8);
                              this.i5 = this.i5 + 1;
                              continue loop0;
                           }
                        }
                        this.i5 = this.i6;
                        this.i3 = this.i5;
                        this.i5 = li32(this.i1);
                        this.f0 = lf64(this.i0);
                        this.i5 = this.i5 * 12;
                        this.i3 = this.i3 + this.i5;
                        sf64(this.f0,this.i3);
                        this.i5 = li32(this.i0 + 8);
                        si32(this.i5,this.i3 + 8);
                        this.i3 = li32(this.i0 + 8);
                        if(this.i3 >= 4)
                        {
                           this.i0 = li32(this.i0);
                           this.i3 = li8(this.i0 + 5);
                           this.i3 = this.i3 & 3;
                           if(this.i3 != 0)
                           {
                              this.i3 = li8(this.i4 + 5);
                              this.i4 = this.i4 + 5;
                              this.i5 = this.i3 & 4;
                              if(this.i5 != 0)
                              {
                                 this.i2 = li32(this.i2 + 16);
                                 this.i5 = li8(this.i2 + 21);
                                 if(this.i5 == 1)
                                 {
                                    mstate.esp = mstate.esp - 8;
                                    si32(this.i2,mstate.esp);
                                    si32(this.i0,mstate.esp + 4);
                                    mstate.esp = mstate.esp - 4;
                                    FSM_addk.start();
                                 }
                                 else
                                 {
                                    this.i0 = li8(this.i2 + 20);
                                    this.i2 = this.i3 & -8;
                                    this.i0 = this.i0 & 3;
                                    this.i0 = this.i0 | this.i2;
                                    si8(this.i0,this.i4);
                                 }
                              }
                              addr886:
                              this.i0 = li32(this.i1);
                              this.i2 = this.i0 + 1;
                              si32(this.i2,this.i1);
                           }
                        }
                        §§goto(addr886);
                     }
                     else
                     {
                        this.i3 = FSM_addk;
                        this.i6 = li32(this.i4 + 8);
                        mstate.esp = mstate.esp - 24;
                        this.i7 = 262143;
                        this.i9 = 12;
                        si32(this.i2,mstate.esp);
                        si32(this.i6,mstate.esp + 4);
                        si32(this.i8,mstate.esp + 8);
                        si32(this.i9,mstate.esp + 12);
                        si32(this.i7,mstate.esp + 16);
                        si32(this.i3,mstate.esp + 20);
                        state = 7;
                        mstate.esp = mstate.esp - 4;
                        FSM_addk.start();
                        return;
                     }
                  }
                  mstate.eax = this.i0;
                  mstate.esp = mstate.ebp;
                  mstate.ebp = li32(mstate.esp);
                  mstate.esp = mstate.esp + 4;
                  mstate.esp = mstate.esp + 4;
                  mstate.gworker = caller;
                  return;
               }
               this.i5 = li32(this.i4 + 8);
               if(this.i5 != 3)
               {
                  if(this.i5 == 0)
                  {
                     this.i5 = FSM_addk;
                     mstate.esp = mstate.esp - 8;
                     si32(this.i2,mstate.esp);
                     si32(this.i5,mstate.esp + 4);
                     state = 2;
                     mstate.esp = mstate.esp - 4;
                     FSM_addk.start();
                     return;
                  }
               }
               else
               {
                  this.f0 = 0;
                  this.f1 = lf64(this.i4);
                  if(!(this.f1 != Number.NaN && this.f0 != Number.NaN))
                  {
                     this.i5 = FSM_addk;
                     mstate.esp = mstate.esp - 8;
                     si32(this.i2,mstate.esp);
                     si32(this.i5,mstate.esp + 4);
                     state = 4;
                     mstate.esp = mstate.esp - 4;
                     FSM_addk.start();
                     return;
                  }
               }
               mstate.esp = mstate.esp - 12;
               si32(this.i2,mstate.esp);
               si32(this.i3,mstate.esp + 4);
               si32(this.i4,mstate.esp + 8);
               state = 6;
               mstate.esp = mstate.esp - 4;
               FSM_addk.start();
               return;
            case 2:
               mstate.esp = mstate.esp + 8;
               mstate.esp = mstate.esp - 12;
               si32(this.i2,mstate.esp);
               si32(this.i3,mstate.esp + 4);
               si32(this.i4,mstate.esp + 8);
               state = 3;
               mstate.esp = mstate.esp - 4;
               FSM_addk.start();
               return;
            case 3:
               this.i3 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               §§goto(addr393);
            case 4:
               mstate.esp = mstate.esp + 8;
               mstate.esp = mstate.esp - 12;
               si32(this.i2,mstate.esp);
               si32(this.i3,mstate.esp + 4);
               si32(this.i4,mstate.esp + 8);
               state = 5;
               mstate.esp = mstate.esp - 4;
               FSM_addk.start();
               return;
            case 5:
               this.i3 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               §§goto(addr393);
            case 6:
               this.i3 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               §§goto(addr393);
            case 7:
               this.i3 = mstate.eax;
               mstate.esp = mstate.esp + 24;
               si32(this.i3,this.i4 + 8);
               this.i6 = li32(this.i8);
               if(this.i6 <= this.i5)
               {
                  this.i5 = this.i3;
               }
               else
               {
                  §§goto(addr643);
               }
               §§goto(addr694);
            case 8:
               mstate.esp = mstate.esp + 8;
               §§goto(addr886);
         }
      }
   }
}
