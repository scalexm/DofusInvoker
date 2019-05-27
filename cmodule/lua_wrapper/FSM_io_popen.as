package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.li8;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_io_popen extends Machine
   {
      
      public static const intRegCount:int = 9;
      
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
      
      public function FSM_io_popen()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM_io_popen = null;
         _loc1_ = new FSM_io_popen();
         FSM_io_popen.gworker = _loc1_;
      }
      
      override public final function work() : void
      {
         switch(state)
         {
            case 0:
               mstate.esp = mstate.esp - 4;
               si32(mstate.ebp,mstate.esp);
               mstate.ebp = mstate.esp;
               mstate.esp = mstate.esp - 4112;
               this.i0 = 0;
               mstate.esp = mstate.esp - 12;
               this.i2 = li32(mstate.ebp + 8);
               this.i1 = 1;
               si32(this.i2,mstate.esp);
               si32(this.i1,mstate.esp + 4);
               si32(this.i0,mstate.esp + 8);
               state = 1;
               mstate.esp = mstate.esp - 4;
               FSM_io_popen.start();
               return;
            case 1:
               this.i3 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               mstate.esp = mstate.esp - 8;
               this.i0 = 2;
               si32(this.i2,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_io_popen.start();
            case 2:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i1 = FSM_io_popen;
               if(this.i0 != this.i1)
               {
                  this.i0 = li32(this.i0 + 8);
                  if(this.i0 >= 1)
                  {
                     this.i0 = 0;
                     mstate.esp = mstate.esp - 12;
                     this.i1 = 2;
                     si32(this.i2,mstate.esp);
                     si32(this.i1,mstate.esp + 4);
                     si32(this.i0,mstate.esp + 8);
                     state = 3;
                     mstate.esp = mstate.esp - 4;
                     FSM_io_popen.start();
                     return;
                  }
               }
               this.i0 = FSM_io_popen;
               addr211:
               this.i1 = 4;
               mstate.esp = mstate.esp - 8;
               si32(this.i2,mstate.esp);
               si32(this.i1,mstate.esp + 4);
               state = 4;
               mstate.esp = mstate.esp - 4;
               FSM_io_popen.start();
               return;
            case 3:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               §§goto(addr211);
            case 4:
               this.i4 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i1 = 0;
               si32(this.i1,this.i4);
               mstate.esp = mstate.esp - 8;
               this.i1 = -10000;
               si32(this.i2,mstate.esp);
               si32(this.i1,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_io_popen.start();
            case 5:
               this.i1 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i5 = FSM_io_popen;
               this.i6 = this.i0;
               while(true)
               {
                  this.i7 = li8(this.i5 + 1);
                  this.i5 = this.i5 + 1;
                  this.i8 = this.i5;
                  if(this.i7 != 0)
                  {
                     this.i5 = this.i8;
                     continue;
                  }
                  break;
               }
               this.i7 = FSM_io_popen;
               mstate.esp = mstate.esp - 12;
               this.i5 = this.i5 - this.i7;
               si32(this.i2,mstate.esp);
               si32(this.i7,mstate.esp + 4);
               si32(this.i5,mstate.esp + 8);
               state = 6;
               mstate.esp = mstate.esp - 4;
               FSM_io_popen.start();
               return;
            case 6:
               this.i5 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i5,mstate.ebp + -4112);
               this.i5 = 4;
               si32(this.i5,mstate.ebp + -4104);
               this.i5 = li32(this.i2 + 8);
               mstate.esp = mstate.esp - 16;
               this.i7 = mstate.ebp + -4112;
               si32(this.i2,mstate.esp);
               si32(this.i1,mstate.esp + 4);
               si32(this.i7,mstate.esp + 8);
               si32(this.i5,mstate.esp + 12);
               state = 7;
               mstate.esp = mstate.esp - 4;
               FSM_io_popen.start();
               return;
            case 7:
               mstate.esp = mstate.esp + 16;
               this.i1 = li32(this.i2 + 8);
               this.i1 = this.i1 + 12;
               si32(this.i1,this.i2 + 8);
               mstate.esp = mstate.esp - 8;
               this.i1 = -2;
               si32(this.i2,mstate.esp);
               si32(this.i1,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_io_popen.start();
            case 8:
               mstate.esp = mstate.esp + 8;
               mstate.esp = mstate.esp - 4;
               this.i1 = 0;
               si32(this.i1,mstate.esp);
               state = 9;
               mstate.esp = mstate.esp - 4;
               FSM_io_popen.start();
               return;
            case 9:
               this.i1 = mstate.eax;
               mstate.esp = mstate.esp + 4;
               this.i1 = li8(this.i0);
               if(this.i1 != 43)
               {
                  this.i5 = this.i6;
                  while(true)
                  {
                     this.i6 = li8(this.i5);
                     if(this.i6 == 0)
                     {
                        this.i5 = 0;
                        break;
                     }
                     this.i6 = li8(this.i5 + 1);
                     this.i5 = this.i5 + 1;
                     this.i7 = this.i5;
                     if(this.i6 != 43)
                     {
                        this.i5 = this.i7;
                        continue;
                     }
                     break;
                  }
               }
               else
               {
                  this.i5 = this.i0;
               }
               if(this.i5 == 0)
               {
                  this.i5 = this.i1 & 255;
                  if(this.i5 != 114)
                  {
                     this.i1 = this.i1 & 255;
                     if(this.i1 == 119)
                     {
                     }
                     break;
                  }
                  this.i0 = li8(this.i0 + 1);
                  if(this.i0 != 0)
                  {
                     break;
                  }
               }
               this.i0 = FSM_io_popen;
               this.i1 = 4;
               log(this.i1,mstate.gworker.stringFromPtr(this.i0));
               mstate.esp = mstate.esp - 20;
               this.i0 = FSM_io_popen;
               this.i1 = FSM_io_popen;
               this.i5 = 353;
               this.i6 = 78;
               this.i7 = mstate.ebp + -4096;
               si32(this.i7,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               si32(this.i6,mstate.esp + 8);
               si32(this.i1,mstate.esp + 12);
               si32(this.i5,mstate.esp + 16);
               state = 10;
               mstate.esp = mstate.esp - 4;
               FSM_io_popen.start();
               return;
            case 10:
               mstate.esp = mstate.esp + 20;
               this.i1 = 3;
               this.i0 = this.i7;
               log(this.i1,mstate.gworker.stringFromPtr(this.i0));
               si32(this.i6,FSM_io_popen);
               break;
            case 11:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               mstate.eax = this.i0;
               mstate.esp = mstate.ebp;
               mstate.ebp = li32(mstate.esp);
               mstate.esp = mstate.esp + 4;
               mstate.esp = mstate.esp + 4;
               mstate.gworker = caller;
               return;
         }
         this.i0 = 0;
         si32(this.i0,this.i4);
         mstate.esp = mstate.esp - 12;
         si32(this.i2,mstate.esp);
         si32(this.i0,mstate.esp + 4);
         si32(this.i3,mstate.esp + 8);
         state = 11;
         mstate.esp = mstate.esp - 4;
         FSM_io_popen.start();
      }
   }
}
