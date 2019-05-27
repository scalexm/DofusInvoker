package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.lf64;
   import avm2.intrinsics.memory.li16;
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.sf64;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_io_readline extends Machine
   {
      
      public static const intRegCount:int = 5;
      
      public static const NumberRegCount:int = 1;
       
      
      public var i0:int;
      
      public var i1:int;
      
      public var i2:int;
      
      public var f0:Number;
      
      public var i4:int;
      
      public var i3:int;
      
      public function FSM_io_readline()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM_io_readline = null;
         _loc1_ = new FSM_io_readline();
         FSM_io_readline.gworker = _loc1_;
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
               this.i0 = -10003;
               mstate.esp = mstate.esp - 8;
               this.i1 = li32(mstate.ebp + 8);
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_io_readline.start();
            case 1:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i2 = li32(this.i0 + 8);
               if(this.i2 != 2)
               {
                  if(this.i2 != 7)
                  {
                     this.i0 = 0;
                  }
                  else
                  {
                     this.i0 = li32(this.i0);
                     this.i0 = this.i0 + 20;
                  }
               }
               else
               {
                  this.i0 = li32(this.i0);
               }
               this.i0 = li32(this.i0);
               if(this.i0 == 0)
               {
                  this.i2 = FSM_io_readline;
                  mstate.esp = mstate.esp - 8;
                  si32(this.i1,mstate.esp);
                  si32(this.i2,mstate.esp + 4);
                  state = 2;
                  mstate.esp = mstate.esp - 4;
                  FSM_io_readline.start();
                  return;
               }
               addr163:
               mstate.esp = mstate.esp - 8;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               state = 3;
               mstate.esp = mstate.esp - 4;
               FSM_io_readline.start();
               return;
            case 2:
               mstate.esp = mstate.esp + 8;
               §§goto(addr163);
            case 3:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i0 = li16(this.i0 + 12);
               this.i0 = this.i0 & 64;
               if(this.i0 != 0)
               {
                  this.i2 = FSM_io_readline;
                  this.i0 = li32(FSM_io_readline);
                  mstate.esp = mstate.esp - 12;
                  this.i3 = 2048;
                  si32(this.i0,mstate.esp);
                  si32(this.i2,mstate.esp + 4);
                  si32(this.i3,mstate.esp + 8);
                  mstate.esp = mstate.esp - 4;
                  FSM_io_readline.start();
               }
               else
               {
                  if(this.i2 != 0)
                  {
                     this.i1 = 1;
                  }
                  else
                  {
                     this.i0 = -10004;
                     mstate.esp = mstate.esp - 8;
                     si32(this.i1,mstate.esp);
                     si32(this.i0,mstate.esp + 4);
                     mstate.esp = mstate.esp - 4;
                     FSM_io_readline.start();
                  }
                  addr354:
                  this.i0 = this.i1;
                  addr649:
                  mstate.eax = this.i0;
                  mstate.esp = mstate.ebp;
                  mstate.ebp = li32(mstate.esp);
                  mstate.esp = mstate.esp + 4;
                  mstate.esp = mstate.esp + 4;
                  mstate.gworker = caller;
                  return;
               }
            case 4:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               if(this.i2 != 0)
               {
                  this.i2 = 22;
                  si32(this.i2,FSM_io_readline);
               }
               this.i2 = FSM_io_readline;
               mstate.esp = mstate.esp - 12;
               this.i0 = FSM_io_readline;
               si32(this.i1,mstate.esp);
               si32(this.i2,mstate.esp + 4);
               si32(this.i0,mstate.esp + 8);
               state = 5;
               mstate.esp = mstate.esp - 4;
               FSM_io_readline.start();
               return;
            case 5:
               mstate.esp = mstate.esp + 12;
               break;
            case 6:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i2 = li32(this.i0 + 8);
               if(this.i2 != 0)
               {
                  if(this.i2 == 1)
                  {
                     this.i0 = li32(this.i0);
                     if(this.i0 == 0)
                     {
                        this.i1 = 0;
                        §§goto(addr354);
                     }
                  }
                  this.i0 = li32(this.i1 + 8);
                  this.i2 = li32(this.i1 + 12);
                  this.i3 = this.i1 + 12;
                  this.i4 = this.i1 + 8;
                  if(uint(this.i0) >= uint(this.i2))
                  {
                     this.i0 = this.i2;
                  }
                  else
                  {
                     do
                     {
                        this.i2 = 0;
                        si32(this.i2,this.i0 + 8);
                        this.i0 = this.i0 + 12;
                        si32(this.i0,this.i4);
                        this.i2 = li32(this.i3);
                     }
                     while(uint(this.i0) < uint(this.i2));
                     
                     this.i0 = this.i2;
                  }
                  this.i2 = -10003;
                  si32(this.i0,this.i4);
                  mstate.esp = mstate.esp - 8;
                  si32(this.i1,mstate.esp);
                  si32(this.i2,mstate.esp + 4);
                  mstate.esp = mstate.esp - 4;
                  FSM_io_readline.start();
               }
               else
               {
                  break;
               }
            case 7:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i2 = li32(this.i4);
               this.f0 = lf64(this.i0);
               sf64(this.f0,this.i2);
               this.i0 = li32(this.i0 + 8);
               si32(this.i0,this.i2 + 8);
               this.i0 = li32(this.i4);
               this.i0 = this.i0 + 12;
               si32(this.i0,this.i4);
               mstate.esp = mstate.esp - 4;
               si32(this.i1,mstate.esp);
               state = 8;
               mstate.esp = mstate.esp - 4;
               FSM_io_readline.start();
               return;
            case 8:
               this.i1 = mstate.eax;
               mstate.esp = mstate.esp + 4;
         }
         this.i1 = 0;
         mstate.eax = this.i1;
         §§goto(addr649);
      }
   }
}
