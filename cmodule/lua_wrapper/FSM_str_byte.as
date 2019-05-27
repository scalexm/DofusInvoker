package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.li8;
   import avm2.intrinsics.memory.sf64;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_str_byte extends Machine
   {
      
      public static const intRegCount:int = 7;
      
      public static const NumberRegCount:int = 1;
       
      
      public var i0:int;
      
      public var i1:int;
      
      public var i2:int;
      
      public var i3:int;
      
      public var i4:int;
      
      public var i5:int;
      
      public var i6:int;
      
      public var f0:Number;
      
      public function FSM_str_byte()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM_str_byte = null;
         _loc1_ = new FSM_str_byte();
         FSM_str_byte.gworker = _loc1_;
      }
      
      override public final function work() : void
      {
         switch(state)
         {
            case 0:
               mstate.esp = mstate.esp - 4;
               si32(mstate.ebp,mstate.esp);
               mstate.ebp = mstate.esp;
               mstate.esp = mstate.esp - 4;
               this.i0 = mstate.ebp + -4;
               mstate.esp = mstate.esp - 12;
               this.i1 = li32(mstate.ebp + 8);
               this.i2 = 1;
               si32(this.i1,mstate.esp);
               si32(this.i2,mstate.esp + 4);
               si32(this.i0,mstate.esp + 8);
               state = 1;
               mstate.esp = mstate.esp - 4;
               FSM_str_byte.start();
               return;
            case 1:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               this.i2 = li32(mstate.ebp + -4);
               mstate.esp = mstate.esp - 8;
               this.i3 = 2;
               si32(this.i1,mstate.esp);
               si32(this.i3,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_str_byte.start();
            case 2:
               this.i3 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i4 = FSM_str_byte;
               if(this.i3 != this.i4)
               {
                  this.i3 = li32(this.i3 + 8);
                  if(this.i3 >= 1)
                  {
                     this.i3 = 2;
                     mstate.esp = mstate.esp - 8;
                     si32(this.i1,mstate.esp);
                     si32(this.i3,mstate.esp + 4);
                     state = 3;
                     mstate.esp = mstate.esp - 4;
                     FSM_str_byte.start();
                     return;
                  }
               }
               this.i3 = 1;
               addr210:
               if(this.i3 <= -1)
               {
                  this.i3 = this.i3 + this.i2;
                  this.i3 = this.i3 + 1;
                  this.i3 = this.i3 > -1?int(this.i3):0;
               }
               else
               {
                  this.i3 = this.i3 > -1?int(this.i3):0;
               }
               this.i2 = this.i3;
               this.i3 = 3;
               this.i4 = li32(mstate.ebp + -4);
               mstate.esp = mstate.esp - 8;
               si32(this.i1,mstate.esp);
               si32(this.i3,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_str_byte.start();
            case 3:
               this.i3 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               §§goto(addr210);
            case 4:
               this.i3 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i5 = FSM_str_byte;
               if(this.i3 != this.i5)
               {
                  this.i3 = li32(this.i3 + 8);
                  if(this.i3 >= 1)
                  {
                     this.i3 = 3;
                     mstate.esp = mstate.esp - 8;
                     si32(this.i1,mstate.esp);
                     si32(this.i3,mstate.esp + 4);
                     state = 5;
                     mstate.esp = mstate.esp - 4;
                     FSM_str_byte.start();
                     return;
                  }
               }
               this.i3 = this.i2;
               addr376:
               if(this.i3 <= -1)
               {
                  this.i3 = this.i3 + this.i4;
                  this.i3 = this.i3 + 1;
                  this.i3 = this.i3 > -1?int(this.i3):0;
               }
               else
               {
                  this.i3 = this.i3 > -1?int(this.i3):0;
               }
               this.i4 = li32(mstate.ebp + -4);
               this.i2 = this.i2 < 1?1:int(this.i2);
               this.i3 = uint(this.i3) > uint(this.i4)?int(this.i4):int(this.i3);
               if(this.i2 > this.i3)
               {
                  this.i0 = 0;
                  break;
               }
               this.i4 = this.i3 - this.i2;
               this.i4 = this.i4 + 1;
               this.i5 = this.i4 + this.i2;
               if(this.i5 <= this.i3)
               {
                  this.i3 = FSM_str_byte;
                  mstate.esp = mstate.esp - 8;
                  si32(this.i1,mstate.esp);
                  si32(this.i3,mstate.esp + 4);
                  state = 6;
                  mstate.esp = mstate.esp - 4;
                  FSM_str_byte.start();
                  return;
               }
               mstate.esp = mstate.esp - 8;
               si32(this.i1,mstate.esp);
               si32(this.i4,mstate.esp + 4);
               state = 9;
               mstate.esp = mstate.esp - 4;
               FSM_str_byte.start();
               return;
            case 5:
               this.i3 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               §§goto(addr376);
            case 6:
               mstate.esp = mstate.esp + 8;
               mstate.esp = mstate.esp - 8;
               si32(this.i1,mstate.esp);
               si32(this.i4,mstate.esp + 4);
               state = 7;
               mstate.esp = mstate.esp - 4;
               FSM_str_byte.start();
               return;
            case 7:
               this.i3 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               if(this.i3 == 0)
               {
                  this.i3 = FSM_str_byte;
                  mstate.esp = mstate.esp - 12;
                  this.i5 = FSM_str_byte;
                  si32(this.i1,mstate.esp);
                  si32(this.i3,mstate.esp + 4);
                  si32(this.i5,mstate.esp + 8);
                  state = 8;
                  mstate.esp = mstate.esp - 4;
                  FSM_str_byte.start();
                  return;
               }
               addr659:
               if(this.i4 > 0)
               {
                  addr775:
                  this.i3 = 0;
                  this.i0 = this.i2 + this.i0;
                  this.i1 = this.i1 + 8;
                  this.i2 = this.i3;
                  while(true)
                  {
                     this.i3 = 3;
                     this.i5 = this.i0 + this.i2;
                     this.i5 = li8(this.i5 + -1);
                     this.i6 = li32(this.i1);
                     this.f0 = Number(this.i5);
                     sf64(this.f0,this.i6);
                     si32(this.i3,this.i6 + 8);
                     this.i3 = li32(this.i1);
                     this.i3 = this.i3 + 12;
                     si32(this.i3,this.i1);
                     this.i2 = this.i2 + 1;
                     if(this.i2 < this.i4)
                     {
                        continue;
                     }
                     break;
                  }
               }
               this.i0 = this.i4;
               break;
            case 8:
               mstate.esp = mstate.esp + 12;
               §§goto(addr659);
            case 9:
               this.i3 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               if(this.i3 == 0)
               {
                  this.i3 = FSM_str_byte;
                  mstate.esp = mstate.esp - 12;
                  this.i5 = FSM_str_byte;
                  si32(this.i1,mstate.esp);
                  si32(this.i3,mstate.esp + 4);
                  si32(this.i5,mstate.esp + 8);
                  state = 10;
                  mstate.esp = mstate.esp - 4;
                  FSM_str_byte.start();
                  return;
               }
               addr770:
               if(this.i4 >= 1)
               {
                  §§goto(addr775);
               }
               §§goto(addr665);
            case 10:
               mstate.esp = mstate.esp + 12;
               §§goto(addr770);
         }
         mstate.eax = this.i0;
         mstate.esp = mstate.ebp;
         mstate.ebp = li32(mstate.esp);
         mstate.esp = mstate.esp + 4;
         mstate.esp = mstate.esp + 4;
         mstate.gworker = caller;
      }
   }
}
