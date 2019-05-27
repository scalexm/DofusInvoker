package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.li8;
   import avm2.intrinsics.memory.si32;
   import avm2.intrinsics.memory.si8;
   
   public final class FSM_tzset_basic extends Machine
   {
      
      public static const intRegCount:int = 7;
      
      public static const NumberRegCount:int = 0;
       
      
      public var i0:int;
      
      public var i1:int;
      
      public var i2:int;
      
      public var i3:int;
      
      public var i4:int;
      
      public var i5:int;
      
      public var i6:int;
      
      public function FSM_tzset_basic()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM_tzset_basic = null;
         _loc1_ = new FSM_tzset_basic();
         FSM_tzset_basic.gworker = _loc1_;
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
               this.i0 = FSM_tzset_basic;
               mstate.esp = mstate.esp - 4;
               si32(this.i0,mstate.esp);
               mstate.esp = mstate.esp - 4;
               FSM_tzset_basic.start();
            case 1:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 4;
               this.i1 = li32(FSM_tzset_basic);
               this.i2 = this.i0;
               if(this.i0 == 0)
               {
                  if(this.i1 >= 0)
                  {
                     this.i0 = -1;
                     si32(this.i0,FSM_tzset_basic);
                     mstate.esp = mstate.esp - 8;
                     this.i0 = FSM_tzset_basic;
                     this.i1 = 0;
                     si32(this.i1,mstate.esp);
                     si32(this.i0,mstate.esp + 4);
                     state = 2;
                     mstate.esp = mstate.esp - 4;
                     FSM_tzset_basic.start();
                     return;
                  }
               }
               else
               {
                  if(this.i1 >= 1)
                  {
                     this.i1 = li8(FSM_tzset_basic);
                     this.i3 = li8(this.i0);
                     if(this.i1 != this.i3)
                     {
                        this.i3 = this.i0;
                     }
                     else
                     {
                        this.i3 = FSM_tzset_basic;
                        this.i4 = 0;
                        while(true)
                        {
                           this.i5 = this.i2 + this.i4;
                           this.i5 = this.i5 + 1;
                           this.i1 = this.i1 & 255;
                           if(this.i1 != 0)
                           {
                              this.i1 = this.i3 + this.i4;
                              this.i1 = li8(this.i1 + 1);
                              this.i5 = li8(this.i5);
                              this.i4 = this.i4 + 1;
                              if(this.i1 == this.i5)
                              {
                                 continue;
                              }
                              this.i3 = this.i2 + this.i4;
                           }
                           break;
                        }
                     }
                     this.i3 = li8(this.i3);
                     this.i1 = this.i1 & 255;
                     if(this.i1 == this.i3)
                     {
                        §§goto(addr266);
                     }
                  }
                  this.i1 = li8(this.i0);
                  if(this.i1 != 0)
                  {
                     this.i3 = this.i2;
                     while(true)
                     {
                        this.i4 = li8(this.i3 + 1);
                        this.i3 = this.i3 + 1;
                        this.i5 = this.i3;
                        if(this.i4 != 0)
                        {
                           this.i3 = this.i5;
                           continue;
                        }
                        break;
                     }
                  }
                  else
                  {
                     this.i3 = this.i0;
                  }
                  this.i3 = this.i3 - this.i2;
                  this.i4 = uint(this.i3) < uint(256)?1:0;
                  this.i4 = this.i4 & 1;
                  si32(this.i4,FSM_tzset_basic);
                  if(uint(this.i3) <= uint(255))
                  {
                     si8(this.i1,FSM_tzset_basic);
                     this.i3 = this.i1 & 255;
                     if(this.i3 != 0)
                     {
                        this.i3 = FSM_tzset_basic;
                        this.i4 = 1;
                        while(true)
                        {
                           this.i5 = this.i2 + this.i4;
                           this.i5 = li8(this.i5);
                           this.i6 = this.i3 + this.i4;
                           si8(this.i5,this.i6);
                           this.i4 = this.i4 + 1;
                           if(this.i5 != 0)
                           {
                              continue;
                           }
                           break;
                        }
                     }
                     addr466:
                     this.i0 = 0;
                     si32(this.i0,FSM_tzset_basic);
                     si32(this.i0,FSM_tzset_basic + 4);
                     si32(this.i0,FSM_tzset_basic + 8);
                     si32(this.i0,FSM_tzset_basic + 1872);
                     si32(this.i0,FSM_tzset_basic + 1868);
                     si32(this.i0,FSM_tzset_basic + 1876);
                     this.i1 = 85;
                     this.i2 = 84;
                     this.i3 = 67;
                     si8(this.i1,FSM_tzset_basic + 6988);
                     si8(this.i2,FSM_tzset_basic + 6989);
                     si8(this.i3,FSM_tzset_basic + 6990);
                     addr255:
                     si8(this.i0,FSM_tzset_basic + 6991);
                     mstate.esp = mstate.esp - 4;
                     FSM_tzset_basic.start();
                  }
                  this.i1 = this.i1 & 255;
                  if(this.i1 == 0)
                  {
                     §§goto(addr466);
                  }
                  else
                  {
                     this.i1 = FSM_tzset_basic;
                     mstate.esp = mstate.esp - 8;
                     si32(this.i0,mstate.esp);
                     si32(this.i1,mstate.esp + 4);
                     state = 6;
                     mstate.esp = mstate.esp - 4;
                     FSM_tzset_basic.start();
                     return;
                  }
               }
               addr267:
               mstate.esp = mstate.ebp;
               mstate.ebp = li32(mstate.esp);
               mstate.esp = mstate.esp + 4;
               mstate.esp = mstate.esp + 4;
               mstate.gworker = caller;
               return;
            case 2:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               if(this.i0 != 0)
               {
                  this.i0 = FSM_tzset_basic;
                  mstate.esp = mstate.esp - 8;
                  this.i1 = FSM_tzset_basic;
                  si32(this.i0,mstate.esp);
                  si32(this.i1,mstate.esp + 4);
                  state = 3;
                  mstate.esp = mstate.esp - 4;
                  FSM_tzset_basic.start();
                  return;
               }
               §§goto(addr255);
            case 3:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               if(this.i0 != 0)
               {
                  this.i0 = FSM_tzset_basic;
                  mstate.esp = mstate.esp - 12;
                  this.i1 = FSM_tzset_basic;
                  this.i2 = 1;
                  si32(this.i0,mstate.esp);
                  si32(this.i1,mstate.esp + 4);
                  si32(this.i2,mstate.esp + 8);
                  state = 4;
                  mstate.esp = mstate.esp - 4;
                  FSM_tzset_basic.start();
                  return;
               }
               §§goto(addr255);
            case 4:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               §§goto(addr255);
            case 5:
               §§goto(addr267);
            case 6:
               this.i1 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               if(this.i1 != 0)
               {
                  this.i1 = li8(this.i0);
                  if(this.i1 != 58)
                  {
                     this.i1 = FSM_tzset_basic;
                     mstate.esp = mstate.esp - 12;
                     this.i2 = 0;
                     si32(this.i0,mstate.esp);
                     si32(this.i1,mstate.esp + 4);
                     si32(this.i2,mstate.esp + 8);
                     state = 7;
                     mstate.esp = mstate.esp - 4;
                     FSM_tzset_basic.start();
                     return;
                  }
                  addr667:
                  this.i0 = FSM_tzset_basic;
                  mstate.esp = mstate.esp - 8;
                  this.i1 = FSM_tzset_basic;
                  si32(this.i0,mstate.esp);
                  si32(this.i1,mstate.esp + 4);
                  state = 8;
                  mstate.esp = mstate.esp - 4;
                  FSM_tzset_basic.start();
                  return;
               }
               addr781:
               §§goto(addr255);
            case 7:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               if(this.i0 != 0)
               {
                  §§goto(addr667);
               }
               else
               {
                  §§goto(addr781);
               }
            case 8:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               if(this.i0 != 0)
               {
                  this.i0 = FSM_tzset_basic;
                  mstate.esp = mstate.esp - 12;
                  this.i1 = FSM_tzset_basic;
                  this.i2 = 1;
                  si32(this.i0,mstate.esp);
                  si32(this.i1,mstate.esp + 4);
                  si32(this.i2,mstate.esp + 8);
                  state = 9;
                  mstate.esp = mstate.esp - 4;
                  FSM_tzset_basic.start();
                  return;
               }
               §§goto(addr255);
            case 9:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               §§goto(addr255);
         }
      }
   }
}
