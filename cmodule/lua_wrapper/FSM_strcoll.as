package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.li8;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_strcoll extends Machine
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
      
      public function FSM_strcoll()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM_strcoll = null;
         _loc1_ = new FSM_strcoll();
         FSM_strcoll.gworker = _loc1_;
      }
      
      override public final function work() : void
      {
         switch(state)
         {
            case 0:
               mstate.esp = mstate.esp - 4;
               si32(mstate.ebp,mstate.esp);
               mstate.ebp = mstate.esp;
               mstate.esp = mstate.esp - 24;
               this.i0 = li32(mstate.ebp + 8);
               this.i1 = li8(FSM_strcoll);
               this.i2 = li32(mstate.ebp + 12);
               this.i3 = this.i0;
               this.i4 = this.i2;
               if(this.i1 == 0)
               {
                  this.i0 = li8(this.i0);
                  this.i1 = li8(this.i2);
                  if(this.i0 != this.i1)
                  {
                     addr145:
                     this.i2 = li8(this.i2);
                     this.i0 = this.i0 & 255;
                     this.i0 = this.i0 - this.i2;
                  }
                  else
                  {
                     this.i2 = 0;
                     while(true)
                     {
                        this.i1 = this.i4 + this.i2;
                        this.i1 = this.i1 + 1;
                        this.i0 = this.i0 & 255;
                        if(this.i0 != 0)
                        {
                           this.i0 = this.i3 + this.i2;
                           this.i0 = li8(this.i0 + 1);
                           this.i1 = li8(this.i1);
                           this.i2 = this.i2 + 1;
                           if(this.i0 == this.i1)
                           {
                              continue;
                           }
                           this.i2 = this.i4 + this.i2;
                           §§goto(addr145);
                        }
                        else
                        {
                           this.i0 = 0;
                           break;
                        }
                     }
                  }
                  addr1297:
                  mstate.eax = this.i0;
                  break;
               }
               this.i1 = 1;
               si32(this.i1,mstate.ebp + -20);
               si32(this.i1,mstate.ebp + -24);
               this.i1 = li8(FSM_strcoll);
               if(this.i1 == 0)
               {
                  this.i1 = 0;
                  this.i3 = this.i1;
                  this.i4 = this.i1;
                  loop0:
                  while(true)
                  {
                     this.i5 = this.i2;
                     this.i2 = this.i4;
                     this.i6 = this.i3;
                     this.i3 = li8(this.i0);
                     if(this.i3 != 0)
                     {
                        this.i3 = this.i0;
                        this.i4 = this.i5;
                        this.i0 = this.i2;
                        this.i2 = this.i6;
                        addr810:
                        while(true)
                        {
                           this.i6 = this.i3;
                           this.i7 = this.i4;
                           this.i3 = this.i0;
                           this.i5 = this.i2;
                           this.i0 = li8(this.i7);
                           if(this.i0 == 0)
                           {
                              this.i4 = this.i1;
                              this.i2 = this.i5;
                              this.i0 = this.i6;
                              this.i1 = this.i7;
                              break loop0;
                           }
                           addr469:
                           this.i0 = 0;
                           si32(this.i0,mstate.ebp + -12);
                           si32(this.i0,mstate.ebp + -16);
                           this.i0 = li8(this.i6);
                           if(this.i0 != 0)
                           {
                              this.i0 = 0;
                              addr444:
                              while(true)
                              {
                                 this.i2 = this.i0;
                                 this.i4 = li32(mstate.ebp + -16);
                                 this.i0 = this.i6 + this.i2;
                                 if(this.i4 != 0)
                                 {
                                    break;
                                 }
                                 this.i4 = mstate.ebp + -8;
                                 mstate.esp = mstate.esp - 16;
                                 this.i8 = mstate.ebp + -16;
                                 this.i9 = mstate.ebp + -24;
                                 si32(this.i0,mstate.esp);
                                 si32(this.i9,mstate.esp + 4);
                                 si32(this.i8,mstate.esp + 8);
                                 si32(this.i4,mstate.esp + 12);
                                 mstate.esp = mstate.esp - 4;
                                 FSM_strcoll.start();
                              }
                           }
                           else
                           {
                              this.i0 = this.i6;
                           }
                           while(true)
                           {
                              this.i2 = 0;
                              addr553:
                              while(true)
                              {
                                 this.i6 = this.i7 + this.i2;
                                 this.i4 = li8(this.i6);
                                 if(this.i4 != 0)
                                 {
                                    this.i4 = li32(mstate.ebp + -12);
                                    if(this.i4 != 0)
                                    {
                                       break;
                                    }
                                    this.i4 = mstate.ebp + -4;
                                    mstate.esp = mstate.esp - 16;
                                    this.i8 = mstate.ebp + -12;
                                    this.i9 = mstate.ebp + -20;
                                    si32(this.i6,mstate.esp);
                                    si32(this.i9,mstate.esp + 4);
                                    si32(this.i8,mstate.esp + 8);
                                    si32(this.i4,mstate.esp + 12);
                                    mstate.esp = mstate.esp - 4;
                                    FSM_strcoll.start();
                                 }
                                 break;
                              }
                              this.i2 = li32(mstate.ebp + -16);
                              if(this.i2 != 0)
                              {
                                 this.i4 = li32(mstate.ebp + -12);
                                 if(this.i4 != 0)
                                 {
                                    if(this.i2 != this.i4)
                                    {
                                       this.i0 = 0;
                                       mstate.esp = mstate.esp - 8;
                                       si32(this.i3,mstate.esp);
                                       si32(this.i0,mstate.esp + 4);
                                       state = 5;
                                       mstate.esp = mstate.esp - 4;
                                       FSM_strcoll.start();
                                       return;
                                    }
                                    if(this.i5 != 0)
                                    {
                                       this.i2 = this.i6;
                                       this.i4 = this.i3;
                                       this.i3 = this.i5;
                                    }
                                    else
                                    {
                                       this.i2 = li32(mstate.ebp + -8);
                                       this.i4 = li32(mstate.ebp + -4);
                                       this.i5 = this.i2 - this.i4;
                                       this.i2 = this.i6;
                                       this.i4 = this.i3;
                                       this.i3 = this.i5;
                                    }
                                    continue loop0;
                                 }
                              }
                              this.i4 = this.i1;
                              this.i2 = this.i5;
                              this.i1 = this.i6;
                              break loop0;
                           }
                        }
                     }
                     else
                     {
                        this.i3 = this.i2;
                        this.i4 = this.i1;
                        this.i2 = this.i6;
                        this.i1 = this.i5;
                        break;
                     }
                  }
                  this.i0 = li8(this.i0);
                  if(this.i0 == 0)
                  {
                     this.i5 = li8(this.i1);
                     if(this.i5 != 0)
                     {
                        this.i0 = 0;
                        mstate.esp = mstate.esp - 8;
                        si32(this.i3,mstate.esp);
                        si32(this.i0,mstate.esp + 4);
                        state = 7;
                        mstate.esp = mstate.esp - 4;
                        FSM_strcoll.start();
                        return;
                     }
                     this.i6 = this.i0 & 255;
                     if(this.i6 == 0)
                     {
                        this.i0 = this.i5;
                        addr1110:
                        this.i0 = this.i0 & 255;
                        if(this.i0 == 0)
                        {
                           this.i0 = 0;
                           mstate.esp = mstate.esp - 8;
                           si32(this.i3,mstate.esp);
                           si32(this.i0,mstate.esp + 4);
                           state = 11;
                           mstate.esp = mstate.esp - 4;
                           FSM_strcoll.start();
                           return;
                        }
                     }
                     addr1212:
                     this.i0 = 0;
                     mstate.esp = mstate.esp - 8;
                     si32(this.i3,mstate.esp);
                     si32(this.i0,mstate.esp + 4);
                     state = 13;
                     mstate.esp = mstate.esp - 4;
                     FSM_strcoll.start();
                     return;
                  }
                  this.i1 = li8(this.i1);
                  if(this.i1 == 0)
                  {
                     this.i1 = 0;
                     mstate.esp = mstate.esp - 8;
                     si32(this.i3,mstate.esp);
                     si32(this.i1,mstate.esp + 4);
                     state = 9;
                     mstate.esp = mstate.esp - 4;
                     FSM_strcoll.start();
                     return;
                  }
                  this.i0 = this.i0 & 255;
                  if(this.i0 == 0)
                  {
                     this.i0 = this.i1;
                     §§goto(addr1110);
                  }
                  §§goto(addr1212);
               }
               else
               {
                  mstate.esp = mstate.esp - 4;
                  si32(this.i0,mstate.esp);
                  state = 1;
                  mstate.esp = mstate.esp - 4;
                  FSM_strcoll.start();
                  return;
               }
            case 1:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 4;
               mstate.esp = mstate.esp - 4;
               si32(this.i2,mstate.esp);
               state = 2;
               mstate.esp = mstate.esp - 4;
               FSM_strcoll.start();
               return;
            case 2:
               this.i1 = mstate.eax;
               mstate.esp = mstate.esp + 4;
               this.i2 = li8(this.i0);
               if(this.i2 != 0)
               {
                  this.i2 = 0;
                  this.i3 = this.i0;
                  this.i4 = this.i1;
                  §§goto(addr810);
               }
               else
               {
                  this.i2 = 0;
                  this.i3 = this.i0;
                  this.i4 = this.i1;
               }
               §§goto(addr855);
            case 3:
               while(true)
               {
                  mstate.esp = mstate.esp + 16;
                  this.i0 = li32(mstate.ebp + -24);
                  this.i0 = this.i2 + this.i0;
                  this.i2 = this.i6 + this.i0;
                  this.i4 = li8(this.i2);
                  if(this.i4 == 0)
                  {
                     this.i0 = this.i2;
                     §§goto(addr469);
                  }
                  §§goto(addr444);
               }
            case 4:
               while(true)
               {
                  mstate.esp = mstate.esp + 16;
                  this.i4 = li32(mstate.ebp + -20);
                  this.i2 = this.i2 + this.i4;
                  §§goto(addr553);
               }
            case 5:
               this.i3 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               mstate.esp = mstate.esp - 8;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               state = 6;
               mstate.esp = mstate.esp - 4;
               FSM_strcoll.start();
               return;
            case 6:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i0 = this.i2 - this.i4;
               §§goto(addr1297);
            case 7:
               this.i1 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               mstate.esp = mstate.esp - 8;
               si32(this.i4,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               this.i0 = this.i5 & 255;
               state = 8;
               mstate.esp = mstate.esp - 4;
               FSM_strcoll.start();
               return;
            case 8:
               this.i1 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i0 = 0 - this.i0;
               §§goto(addr1297);
            case 9:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               mstate.esp = mstate.esp - 8;
               si32(this.i4,mstate.esp);
               si32(this.i1,mstate.esp + 4);
               state = 10;
               mstate.esp = mstate.esp - 4;
               FSM_strcoll.start();
               return;
            case 10:
               this.i1 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i0 = this.i0 & 255;
               §§goto(addr1297);
            case 11:
               this.i3 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               mstate.esp = mstate.esp - 8;
               si32(this.i4,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               state = 12;
               mstate.esp = mstate.esp - 4;
               FSM_strcoll.start();
               return;
            case 12:
               this.i3 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               mstate.eax = this.i2;
               break;
            case 13:
               this.i1 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               mstate.esp = mstate.esp - 8;
               si32(this.i4,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               state = 14;
               mstate.esp = mstate.esp - 4;
               FSM_strcoll.start();
               return;
            case 14:
               this.i1 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               §§goto(addr1297);
         }
         mstate.esp = mstate.ebp;
         mstate.ebp = li32(mstate.esp);
         mstate.esp = mstate.esp + 4;
         mstate.esp = mstate.esp + 4;
         mstate.gworker = caller;
      }
   }
}
