package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.lf64;
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.sf64;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_getfunc extends Machine
   {
      
      public static const intRegCount:int = 5;
      
      public static const NumberRegCount:int = 1;
       
      
      public var i0:int;
      
      public var i1:int;
      
      public var i2:int;
      
      public var f0:Number;
      
      public var i4:int;
      
      public var i3:int;
      
      public function FSM_getfunc()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM_getfunc = null;
         _loc1_ = new FSM_getfunc();
         FSM_getfunc.gworker = _loc1_;
      }
      
      override public final function work() : void
      {
         switch(state)
         {
            case 0:
               mstate.esp = mstate.esp - 4;
               si32(mstate.ebp,mstate.esp);
               mstate.ebp = mstate.esp;
               mstate.esp = mstate.esp - 112;
               this.i0 = 1;
               mstate.esp = mstate.esp - 8;
               this.i1 = li32(mstate.ebp + 8);
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_getfunc.start();
            case 1:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i2 = li32(mstate.ebp + 12);
               this.i3 = FSM_getfunc;
               if(this.i0 != this.i3)
               {
                  this.i0 = li32(this.i0 + 8);
                  if(this.i0 == 6)
                  {
                     this.i2 = 1;
                     mstate.esp = mstate.esp - 8;
                     si32(this.i1,mstate.esp);
                     si32(this.i2,mstate.esp + 4);
                     mstate.esp = mstate.esp - 4;
                     FSM_getfunc.start();
                  }
               }
               if(this.i2 != 0)
               {
                  this.i0 = 1;
                  mstate.esp = mstate.esp - 8;
                  si32(this.i1,mstate.esp);
                  si32(this.i0,mstate.esp + 4);
                  mstate.esp = mstate.esp - 4;
                  FSM_getfunc.start();
               }
               else
               {
                  this.i0 = 1;
                  mstate.esp = mstate.esp - 8;
                  si32(this.i1,mstate.esp);
                  si32(this.i0,mstate.esp + 4);
                  state = 5;
                  mstate.esp = mstate.esp - 4;
                  FSM_getfunc.start();
                  return;
               }
            case 2:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i0 = li32(this.i1 + 8);
               this.f0 = lf64(this.i2);
               sf64(this.f0,this.i0);
               this.i2 = li32(this.i2 + 8);
               si32(this.i2,this.i0 + 8);
               this.i2 = li32(this.i1 + 8);
               this.i2 = this.i2 + 12;
               si32(this.i2,this.i1 + 8);
               break;
            case 3:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i2 = FSM_getfunc;
               if(this.i0 != this.i2)
               {
                  this.i0 = li32(this.i0 + 8);
                  if(this.i0 >= 1)
                  {
                     this.i0 = 1;
                     mstate.esp = mstate.esp - 8;
                     si32(this.i1,mstate.esp);
                     si32(this.i0,mstate.esp + 4);
                     state = 4;
                     mstate.esp = mstate.esp - 4;
                     FSM_getfunc.start();
                     return;
                  }
               }
               this.i0 = 1;
               addr313:
               if(this.i0 <= -1)
               {
                  addr368:
                  this.i2 = FSM_getfunc;
                  mstate.esp = mstate.esp - 12;
                  this.i3 = 1;
                  si32(this.i1,mstate.esp);
                  si32(this.i3,mstate.esp + 4);
                  si32(this.i2,mstate.esp + 8);
                  state = 6;
                  mstate.esp = mstate.esp - 4;
                  FSM_getfunc.start();
                  return;
               }
               addr421:
               this.i2 = mstate.ebp + -112;
               this.i3 = li32(this.i1 + 20);
               this.i4 = li32(this.i1 + 40);
               mstate.esp = mstate.esp - 16;
               si32(this.i3,mstate.esp);
               si32(this.i4,mstate.esp + 4);
               si32(this.i0,mstate.esp + 8);
               si32(this.i2,mstate.esp + 12);
               mstate.esp = mstate.esp - 4;
               FSM_getfunc.start();
            case 4:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               §§goto(addr313);
            case 5:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               if(this.i0 <= -1)
               {
                  §§goto(addr368);
               }
               else
               {
                  §§goto(addr421);
               }
            case 6:
               mstate.esp = mstate.esp + 12;
               §§goto(addr421);
            case 7:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 16;
               if(this.i2 == 0)
               {
                  this.i2 = FSM_getfunc;
                  mstate.esp = mstate.esp - 12;
                  this.i3 = 1;
                  si32(this.i1,mstate.esp);
                  si32(this.i3,mstate.esp + 4);
                  si32(this.i2,mstate.esp + 8);
                  state = 8;
                  mstate.esp = mstate.esp - 4;
                  FSM_getfunc.start();
                  return;
               }
               addr549:
               this.i2 = FSM_getfunc;
               mstate.esp = mstate.esp - 12;
               this.i3 = mstate.ebp + -112;
               si32(this.i1,mstate.esp);
               si32(this.i2,mstate.esp + 4);
               si32(this.i3,mstate.esp + 8);
               state = 9;
               mstate.esp = mstate.esp - 4;
               FSM_getfunc.start();
               return;
            case 8:
               mstate.esp = mstate.esp + 12;
               §§goto(addr549);
            case 9:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               mstate.esp = mstate.esp - 8;
               this.i2 = -1;
               si32(this.i1,mstate.esp);
               si32(this.i2,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_getfunc.start();
            case 10:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i3 = FSM_getfunc;
               if(this.i2 != this.i3)
               {
                  this.i2 = li32(this.i2 + 8);
                  if(this.i2 == 0)
                  {
                     this.i2 = FSM_getfunc;
                     mstate.esp = mstate.esp - 12;
                     si32(this.i1,mstate.esp);
                     si32(this.i2,mstate.esp + 4);
                     si32(this.i0,mstate.esp + 8);
                     state = 11;
                     mstate.esp = mstate.esp - 4;
                     FSM_getfunc.start();
                     return;
                  }
                  break;
               }
               break;
            case 11:
               mstate.esp = mstate.esp + 12;
         }
         mstate.esp = mstate.ebp;
         mstate.ebp = li32(mstate.esp);
         mstate.esp = mstate.esp + 4;
         mstate.esp = mstate.esp + 4;
         mstate.gworker = caller;
      }
   }
}
