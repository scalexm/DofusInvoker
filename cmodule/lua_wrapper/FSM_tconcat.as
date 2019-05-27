package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_tconcat extends Machine
   {
      
      public static const intRegCount:int = 6;
      
      public static const NumberRegCount:int = 0;
       
      
      public var i0:int;
      
      public var i1:int;
      
      public var i2:int;
      
      public var i3:int;
      
      public var i4:int;
      
      public var i5:int;
      
      public function FSM_tconcat()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM_tconcat = null;
         _loc1_ = new FSM_tconcat();
         FSM_tconcat.gworker = _loc1_;
      }
      
      override public final function work() : void
      {
         switch(state)
         {
            case 0:
               mstate.esp = mstate.esp - 4;
               si32(mstate.ebp,mstate.esp);
               mstate.ebp = mstate.esp;
               mstate.esp = mstate.esp - 1044;
               this.i0 = 2;
               mstate.esp = mstate.esp - 8;
               this.i1 = li32(mstate.ebp + 8);
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_tconcat.start();
            case 1:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i2 = FSM_tconcat;
               if(this.i0 != this.i2)
               {
                  this.i0 = li32(this.i0 + 8);
                  if(this.i0 > 0)
                  {
                     this.i0 = mstate.ebp + -1044;
                     mstate.esp = mstate.esp - 12;
                     this.i2 = 2;
                     si32(this.i1,mstate.esp);
                     si32(this.i2,mstate.esp + 4);
                     si32(this.i0,mstate.esp + 8);
                     state = 2;
                     mstate.esp = mstate.esp - 4;
                     FSM_tconcat.start();
                     return;
                  }
               }
               this.i0 = 0;
               si32(this.i0,mstate.ebp + -1044);
               this.i0 = FSM_tconcat;
               addr167:
               this.i2 = 1;
               mstate.esp = mstate.esp - 8;
               si32(this.i1,mstate.esp);
               si32(this.i2,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_tconcat.start();
            case 2:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               §§goto(addr167);
            case 3:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i3 = FSM_tconcat;
               if(this.i2 != this.i3)
               {
                  this.i2 = li32(this.i2 + 8);
                  if(this.i2 == 5)
                  {
                     addr279:
                     this.i2 = 3;
                     mstate.esp = mstate.esp - 8;
                     si32(this.i1,mstate.esp);
                     si32(this.i2,mstate.esp + 4);
                     mstate.esp = mstate.esp - 4;
                     FSM_tconcat.start();
                  }
               }
               this.i2 = 5;
               mstate.esp = mstate.esp - 12;
               this.i3 = 1;
               si32(this.i1,mstate.esp);
               si32(this.i3,mstate.esp + 4);
               si32(this.i2,mstate.esp + 8);
               state = 4;
               mstate.esp = mstate.esp - 4;
               FSM_tconcat.start();
               return;
            case 4:
               mstate.esp = mstate.esp + 12;
               §§goto(addr279);
            case 5:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i3 = FSM_tconcat;
               if(this.i2 != this.i3)
               {
                  this.i2 = li32(this.i2 + 8);
                  if(this.i2 >= 1)
                  {
                     this.i2 = 3;
                     mstate.esp = mstate.esp - 8;
                     si32(this.i1,mstate.esp);
                     si32(this.i2,mstate.esp + 4);
                     state = 6;
                     mstate.esp = mstate.esp - 4;
                     FSM_tconcat.start();
                     return;
                  }
               }
               this.i2 = 1;
               addr392:
               this.i3 = 4;
               mstate.esp = mstate.esp - 8;
               si32(this.i1,mstate.esp);
               si32(this.i3,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_tconcat.start();
            case 6:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               §§goto(addr392);
            case 7:
               this.i3 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i4 = FSM_tconcat;
               if(this.i3 != this.i4)
               {
                  this.i3 = li32(this.i3 + 8);
                  if(this.i3 > 0)
                  {
                     this.i3 = 4;
                     mstate.esp = mstate.esp - 8;
                     si32(this.i1,mstate.esp);
                     si32(this.i3,mstate.esp + 4);
                     state = 11;
                     mstate.esp = mstate.esp - 4;
                     FSM_tconcat.start();
                     return;
                  }
               }
               this.i3 = 1;
               mstate.esp = mstate.esp - 8;
               si32(this.i1,mstate.esp);
               si32(this.i3,mstate.esp + 4);
               state = 8;
               mstate.esp = mstate.esp - 4;
               FSM_tconcat.start();
               return;
            case 8:
               this.i3 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i4 = mstate.ebp + -1040;
               si32(this.i1,mstate.ebp + -1032);
               this.i4 = this.i4 + 12;
               si32(this.i4,mstate.ebp + -1040);
               this.i4 = 0;
               si32(this.i4,mstate.ebp + -1036);
               if(this.i2 >= this.i3)
               {
                  this.i0 = this.i3;
                  addr754:
                  if(this.i2 == this.i0)
                  {
                     this.i0 = mstate.ebp + -1040;
                     mstate.esp = mstate.esp - 12;
                     si32(this.i1,mstate.esp);
                     si32(this.i0,mstate.esp + 4);
                     si32(this.i2,mstate.esp + 8);
                     state = 12;
                     mstate.esp = mstate.esp - 4;
                     FSM_tconcat.start();
                     return;
                  }
                  this.i0 = mstate.ebp + -1040;
                  break;
               }
               addr546:
               this.i4 = mstate.ebp + -1040;
               mstate.esp = mstate.esp - 12;
               si32(this.i1,mstate.esp);
               si32(this.i4,mstate.esp + 4);
               si32(this.i2,mstate.esp + 8);
               state = 9;
               mstate.esp = mstate.esp - 4;
               FSM_tconcat.start();
               return;
            case 9:
               mstate.esp = mstate.esp + 12;
               this.i5 = li32(mstate.ebp + -1044);
               mstate.esp = mstate.esp - 12;
               si32(this.i4,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               si32(this.i5,mstate.esp + 8);
               state = 10;
               mstate.esp = mstate.esp - 4;
               FSM_tconcat.start();
               return;
            case 10:
               mstate.esp = mstate.esp + 12;
               this.i2 = this.i2 + 1;
               if(this.i2 >= this.i3)
               {
                  this.i0 = this.i3;
                  §§goto(addr754);
               }
               else
               {
                  addr545:
                  §§goto(addr546);
               }
            case 11:
               this.i3 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i4 = mstate.ebp + -1040;
               si32(this.i1,mstate.ebp + -1032);
               this.i4 = this.i4 + 12;
               si32(this.i4,mstate.ebp + -1040);
               this.i4 = 0;
               si32(this.i4,mstate.ebp + -1036);
               if(this.i2 >= this.i3)
               {
                  this.i0 = this.i3;
                  §§goto(addr754);
               }
               else
               {
                  §§goto(addr545);
               }
            case 12:
               mstate.esp = mstate.esp + 12;
               break;
            case 13:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 4;
               this.i0 = li32(mstate.ebp + -1036);
               this.i1 = li32(mstate.ebp + -1032);
               mstate.esp = mstate.esp - 8;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               state = 14;
               mstate.esp = mstate.esp - 4;
               FSM_tconcat.start();
               return;
            case 14:
               mstate.esp = mstate.esp + 8;
               this.i0 = 1;
               mstate.eax = this.i0;
               mstate.esp = mstate.ebp;
               mstate.ebp = li32(mstate.esp);
               mstate.esp = mstate.esp + 4;
               mstate.esp = mstate.esp + 4;
               mstate.gworker = caller;
               return;
         }
         mstate.esp = mstate.esp - 4;
         si32(this.i0,mstate.esp);
         state = 13;
         mstate.esp = mstate.esp - 4;
         FSM_tconcat.start();
      }
   }
}
