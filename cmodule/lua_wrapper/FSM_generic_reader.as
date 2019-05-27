package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.lf64;
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.sf64;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_generic_reader extends Machine
   {
      
      public static const intRegCount:int = 5;
      
      public static const NumberRegCount:int = 1;
       
      
      public var i0:int;
      
      public var i1:int;
      
      public var i2:int;
      
      public var f0:Number;
      
      public var i4:int;
      
      public var i3:int;
      
      public function FSM_generic_reader()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM_generic_reader = null;
         _loc1_ = new FSM_generic_reader();
         FSM_generic_reader.gworker = _loc1_;
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
               this.i0 = 2;
               mstate.esp = mstate.esp - 8;
               this.i1 = li32(mstate.ebp + 8);
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               state = 1;
               mstate.esp = mstate.esp - 4;
               FSM_generic_reader.start();
               return;
            case 1:
               this.i0 = mstate.eax;
               this.i2 = li32(mstate.ebp + 16);
               mstate.esp = mstate.esp + 8;
               if(this.i0 == 0)
               {
                  this.i0 = FSM_generic_reader;
                  mstate.esp = mstate.esp - 12;
                  this.i3 = FSM_generic_reader;
                  si32(this.i1,mstate.esp);
                  si32(this.i0,mstate.esp + 4);
                  si32(this.i3,mstate.esp + 8);
                  state = 2;
                  mstate.esp = mstate.esp - 4;
                  FSM_generic_reader.start();
                  return;
               }
               addr142:
               this.i0 = 1;
               mstate.esp = mstate.esp - 8;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_generic_reader.start();
            case 2:
               mstate.esp = mstate.esp + 12;
               §§goto(addr142);
            case 3:
               this.i3 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i4 = li32(this.i1 + 8);
               this.f0 = lf64(this.i3);
               sf64(this.f0,this.i4);
               this.i3 = li32(this.i3 + 8);
               si32(this.i3,this.i4 + 8);
               this.i3 = li32(this.i1 + 8);
               this.i4 = this.i3 + 12;
               si32(this.i4,this.i1 + 8);
               mstate.esp = mstate.esp - 12;
               si32(this.i1,mstate.esp);
               si32(this.i3,mstate.esp + 4);
               si32(this.i0,mstate.esp + 8);
               state = 4;
               mstate.esp = mstate.esp - 4;
               FSM_generic_reader.start();
               return;
            case 4:
               mstate.esp = mstate.esp + 12;
               mstate.esp = mstate.esp - 8;
               this.i0 = -1;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_generic_reader.start();
            case 5:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i3 = FSM_generic_reader;
               if(this.i0 != this.i3)
               {
                  this.i0 = li32(this.i0 + 8);
                  if(this.i0 == 0)
                  {
                     this.i1 = 0;
                     si32(this.i1,this.i2);
                     addr350:
                     mstate.eax = this.i1;
                     break;
                  }
               }
               this.i0 = -1;
               mstate.esp = mstate.esp - 8;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_generic_reader.start();
            case 6:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i3 = FSM_generic_reader;
               if(this.i0 != this.i3)
               {
                  this.i0 = li32(this.i0 + 8);
                  this.i0 = this.i0 + -3;
                  if(uint(this.i0) <= uint(1))
                  {
                     this.i0 = 3;
                     mstate.esp = mstate.esp - 8;
                     si32(this.i1,mstate.esp);
                     si32(this.i0,mstate.esp + 4);
                     state = 7;
                     mstate.esp = mstate.esp - 4;
                     FSM_generic_reader.start();
                     return;
                  }
               }
               this.i0 = FSM_generic_reader;
               mstate.esp = mstate.esp - 8;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               state = 9;
               mstate.esp = mstate.esp - 4;
               FSM_generic_reader.start();
               return;
            case 7:
               mstate.esp = mstate.esp + 8;
               mstate.esp = mstate.esp - 12;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               si32(this.i2,mstate.esp + 8);
               state = 8;
               mstate.esp = mstate.esp - 4;
               FSM_generic_reader.start();
               return;
            case 8:
               this.i1 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               §§goto(addr350);
            case 9:
               mstate.esp = mstate.esp + 8;
               this.i0 = 0;
               mstate.eax = this.i0;
         }
         mstate.esp = mstate.ebp;
         mstate.ebp = li32(mstate.esp);
         mstate.esp = mstate.esp + 4;
         mstate.esp = mstate.esp + 4;
         mstate.gworker = caller;
      }
   }
}
