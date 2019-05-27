package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_push_captures extends Machine
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
      
      public function FSM_push_captures()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM_push_captures = null;
         _loc1_ = new FSM_push_captures();
         FSM_push_captures.gworker = _loc1_;
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
               this.i0 = li32(mstate.ebp + 8);
               this.i1 = li32(this.i0 + 12);
               this.i2 = li32(this.i0 + 8);
               this.i3 = li32(mstate.ebp + 12);
               this.i4 = li32(mstate.ebp + 16);
               if(this.i1 == 0)
               {
                  if(this.i3 != 0)
                  {
                     this.i1 = 1;
                     mstate.esp = mstate.esp - 8;
                     si32(this.i2,mstate.esp);
                     si32(this.i1,mstate.esp + 4);
                     state = 3;
                     mstate.esp = mstate.esp - 4;
                     FSM_push_captures.start();
                     return;
                  }
               }
               mstate.esp = mstate.esp - 8;
               si32(this.i2,mstate.esp);
               si32(this.i1,mstate.esp + 4);
               state = 1;
               mstate.esp = mstate.esp - 4;
               FSM_push_captures.start();
               return;
            case 1:
               this.i5 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               if(this.i5 == 0)
               {
                  this.i5 = FSM_push_captures;
                  mstate.esp = mstate.esp - 12;
                  this.i6 = FSM_push_captures;
                  si32(this.i2,mstate.esp);
                  si32(this.i5,mstate.esp + 4);
                  si32(this.i6,mstate.esp + 8);
                  state = 2;
                  mstate.esp = mstate.esp - 4;
                  FSM_push_captures.start();
                  return;
               }
               addr172:
               if(this.i1 <= 0)
               {
                  this.i0 = this.i1;
                  addr371:
                  mstate.eax = this.i0;
                  mstate.esp = mstate.ebp;
                  mstate.ebp = li32(mstate.esp);
                  mstate.esp = mstate.esp + 4;
                  mstate.esp = mstate.esp + 4;
                  mstate.gworker = caller;
                  return;
               }
               this.i2 = this.i1;
               addr295:
               this.i1 = this.i2;
               this.i2 = 0;
               break;
            case 2:
               mstate.esp = mstate.esp + 12;
               §§goto(addr172);
            case 3:
               this.i1 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               if(this.i1 != 0)
               {
                  this.i2 = 1;
                  §§goto(addr295);
               }
               else
               {
                  this.i1 = FSM_push_captures;
                  mstate.esp = mstate.esp - 12;
                  this.i5 = FSM_push_captures;
                  si32(this.i2,mstate.esp);
                  si32(this.i1,mstate.esp + 4);
                  si32(this.i5,mstate.esp + 8);
                  state = 4;
                  mstate.esp = mstate.esp - 4;
                  FSM_push_captures.start();
                  return;
               }
            case 4:
               mstate.esp = mstate.esp + 12;
               this.i2 = 1;
               §§goto(addr295);
            case 5:
               mstate.esp = mstate.esp + 16;
               this.i2 = this.i2 + 1;
               if(this.i2 >= this.i1)
               {
                  this.i0 = this.i1;
                  §§goto(addr371);
               }
               else
               {
                  break;
               }
         }
         mstate.esp = mstate.esp - 16;
         si32(this.i0,mstate.esp);
         si32(this.i2,mstate.esp + 4);
         si32(this.i3,mstate.esp + 8);
         si32(this.i4,mstate.esp + 12);
         state = 5;
         mstate.esp = mstate.esp - 4;
         FSM_push_captures.start();
      }
   }
}
