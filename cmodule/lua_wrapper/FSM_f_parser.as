package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.li8;
   import avm2.intrinsics.memory.si32;
   import avm2.intrinsics.memory.si8;
   
   public final class FSM_f_parser extends Machine
   {
      
      public static const intRegCount:int = 11;
      
      public static const NumberRegCount:int = 0;
       
      
      public var i10:int;
      
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
      
      public function FSM_f_parser()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM_f_parser = null;
         _loc1_ = new FSM_f_parser();
         FSM_f_parser.gworker = _loc1_;
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
               this.i0 = li32(mstate.ebp + 12);
               this.i1 = li32(this.i0);
               mstate.esp = mstate.esp - 4;
               si32(this.i1,mstate.esp);
               state = 1;
               mstate.esp = mstate.esp - 4;
               FSM_f_parser.start();
               return;
            case 1:
               this.i1 = mstate.eax;
               this.i2 = li32(mstate.ebp + 8);
               mstate.esp = mstate.esp + 4;
               this.i3 = li32(this.i2 + 16);
               this.i4 = li32(this.i3 + 68);
               this.i3 = li32(this.i3 + 64);
               this.i5 = this.i2 + 16;
               this.i6 = this.i0;
               if(uint(this.i4) >= uint(this.i3))
               {
                  mstate.esp = mstate.esp - 4;
                  si32(this.i2,mstate.esp);
                  state = 2;
                  mstate.esp = mstate.esp - 4;
                  FSM_f_parser.start();
                  return;
               }
               addr150:
               this.i3 = FSM_f_parser;
               this.i4 = li32(this.i6 + 16);
               this.i0 = li32(this.i0);
               mstate.esp = mstate.esp - 16;
               this.i6 = this.i6 + 4;
               si32(this.i2,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               si32(this.i6,mstate.esp + 8);
               si32(this.i4,mstate.esp + 12);
               this.i0 = FSM_f_parser;
               this.i0 = this.i1 == 27?int(this.i3):int(this.i0);
               state = 3;
               mstate.esp = mstate.esp - 4;
               mstate.funcs[this.i0]();
               return;
            case 2:
               mstate.esp = mstate.esp + 4;
               §§goto(addr150);
            case 3:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 16;
               this.i1 = li32(this.i2 + 72);
               this.i3 = li8(this.i0 + 72);
               mstate.esp = mstate.esp - 12;
               si32(this.i2,mstate.esp);
               si32(this.i3,mstate.esp + 4);
               si32(this.i1,mstate.esp + 8);
               state = 4;
               mstate.esp = mstate.esp - 4;
               FSM_f_parser.start();
               return;
            case 4:
               this.i1 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i0,this.i1 + 16);
               this.i3 = li8(this.i0 + 72);
               this.i0 = this.i0 + 72;
               this.i4 = this.i1;
               if(this.i3 >= 1)
               {
                  this.i3 = 0;
                  this.i4 = this.i4 + 20;
                  addr351:
                  this.i6 = 24;
                  this.i7 = li32(this.i5);
                  this.i8 = li32(this.i7 + 12);
                  this.i9 = li32(this.i7 + 16);
                  mstate.esp = mstate.esp - 16;
                  this.i10 = 0;
                  si32(this.i9,mstate.esp);
                  si32(this.i10,mstate.esp + 4);
                  si32(this.i10,mstate.esp + 8);
                  si32(this.i6,mstate.esp + 12);
                  state = 5;
                  mstate.esp = mstate.esp - 4;
                  mstate.funcs[this.i8]();
                  return;
               }
               addr612:
               this.i0 = 6;
               this.i3 = li32(this.i2 + 8);
               si32(this.i1,this.i3);
               si32(this.i0,this.i3 + 8);
               this.i0 = li32(this.i2 + 28);
               this.i1 = li32(this.i2 + 8);
               this.i3 = this.i2 + 8;
               this.i0 = this.i0 - this.i1;
               if(this.i0 <= 12)
               {
                  this.i1 = li32(this.i2 + 44);
                  if(this.i1 >= 1)
                  {
                     mstate.esp = mstate.esp - 8;
                     this.i1 = this.i1 << 1;
                     si32(this.i2,mstate.esp);
                     si32(this.i1,mstate.esp + 4);
                     state = 7;
                     mstate.esp = mstate.esp - 4;
                     FSM_f_parser.start();
                     return;
                  }
                  mstate.esp = mstate.esp - 8;
                  this.i1 = this.i1 + 1;
                  si32(this.i2,mstate.esp);
                  si32(this.i1,mstate.esp + 4);
                  state = 8;
                  mstate.esp = mstate.esp - 4;
                  FSM_f_parser.start();
                  return;
               }
               this.i0 = this.i1 + 12;
               si32(this.i0,this.i3);
               break;
            case 5:
               this.i6 = mstate.eax;
               mstate.esp = mstate.esp + 16;
               this.i8 = this.i4;
               if(this.i6 == 0)
               {
                  this.i9 = 4;
                  mstate.esp = mstate.esp - 8;
                  si32(this.i2,mstate.esp);
                  si32(this.i9,mstate.esp + 4);
                  state = 6;
                  mstate.esp = mstate.esp - 4;
                  FSM_f_parser.start();
                  return;
               }
               addr486:
               this.i9 = 10;
               this.i10 = li32(this.i7 + 68);
               this.i10 = this.i10 + 24;
               si32(this.i10,this.i7 + 68);
               this.i7 = li32(this.i5);
               this.i10 = li32(this.i7 + 28);
               si32(this.i10,this.i6);
               si32(this.i6,this.i7 + 28);
               this.i7 = li8(this.i7 + 20);
               this.i7 = this.i7 & 3;
               si8(this.i7,this.i6 + 5);
               si8(this.i9,this.i6 + 4);
               this.i7 = this.i6 + 12;
               si32(this.i7,this.i6 + 8);
               this.i7 = 0;
               si32(this.i7,this.i6 + 20);
               si32(this.i6,this.i8);
               this.i6 = li8(this.i0);
               this.i4 = this.i4 + 4;
               this.i3 = this.i3 + 1;
               if(this.i6 > this.i3)
               {
                  §§goto(addr351);
               }
               else
               {
                  §§goto(addr612);
               }
            case 6:
               mstate.esp = mstate.esp + 8;
               §§goto(addr486);
            case 7:
               mstate.esp = mstate.esp + 8;
               addr765:
               this.i1 = li32(this.i3);
               this.i1 = this.i1 + 12;
               si32(this.i1,this.i3);
               break;
            case 8:
               mstate.esp = mstate.esp + 8;
               §§goto(addr765);
         }
         mstate.esp = mstate.ebp;
         mstate.ebp = li32(mstate.esp);
         mstate.esp = mstate.esp + 4;
         mstate.esp = mstate.esp + 4;
         mstate.gworker = caller;
      }
   }
}
