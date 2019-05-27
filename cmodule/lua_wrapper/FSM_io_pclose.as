package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.sf64;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_io_pclose extends Machine
   {
      
      public static const intRegCount:int = 8;
      
      public static const NumberRegCount:int = 1;
       
      
      public var i0:int;
      
      public var i1:int;
      
      public var i2:int;
      
      public var i3:int;
      
      public var i4:int;
      
      public var i5:int;
      
      public var i6:int;
      
      public var f0:Number;
      
      public var i7:int;
      
      public function FSM_io_pclose()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM_io_pclose = null;
         _loc1_ = new FSM_io_pclose();
         FSM_io_pclose.gworker = _loc1_;
      }
      
      override public final function work() : void
      {
         switch(state)
         {
            case 0:
               mstate.esp = mstate.esp - 4;
               si32(mstate.ebp,mstate.esp);
               mstate.ebp = mstate.esp;
               mstate.esp = mstate.esp - 4096;
               this.i0 = FSM_io_pclose;
               mstate.esp = mstate.esp - 8;
               this.i2 = li32(mstate.ebp + 8);
               si32(this.i2,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               state = 1;
               mstate.esp = mstate.esp - 4;
               FSM_io_pclose.start();
               return;
            case 1:
               this.i3 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i0 = li32(this.i3);
               this.i1 = FSM_io_pclose;
               this.i4 = 0;
               while(true)
               {
                  this.i5 = this.i4;
                  this.i4 = this.i1;
                  this.i4 = li32(this.i4);
                  if(this.i4 != 0)
                  {
                     this.i1 = li32(this.i4 + 4);
                     if(this.i1 != this.i0)
                     {
                        this.i1 = this.i4;
                        continue;
                     }
                     if(this.i4 != 0)
                     {
                        this.i1 = li32(this.i4);
                        if(this.i5 == 0)
                        {
                           si32(this.i1,FSM_io_pclose);
                        }
                        else
                        {
                           si32(this.i1,this.i5);
                        }
                        this.i1 = FSM_io_pclose;
                        mstate.esp = mstate.esp - 4;
                        si32(this.i0,mstate.esp);
                        state = 2;
                        mstate.esp = mstate.esp - 4;
                        FSM_io_pclose.start();
                        return;
                     }
                     break;
                  }
                  break;
               }
               this.i0 = 0;
               si32(this.i0,this.i3);
               this.i1 = li32(FSM_io_pclose);
               this.i3 = li32(this.i2 + 8);
               si32(this.i0,this.i3 + 8);
               this.i0 = li32(this.i2 + 8);
               this.i0 = this.i0 + 12;
               si32(this.i0,this.i2 + 8);
               mstate.esp = mstate.esp - 12;
               this.i0 = FSM_io_pclose;
               this.i3 = 2048;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               si32(this.i3,mstate.esp + 8);
               mstate.esp = mstate.esp - 4;
               FSM_io_pclose.start();
            case 2:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 4;
               this.i5 = 4;
               this.i0 = this.i1;
               this.i1 = this.i5;
               log(this.i1,mstate.gworker.stringFromPtr(this.i0));
               mstate.esp = mstate.esp - 20;
               this.i0 = FSM_io_pclose;
               this.i1 = FSM_io_pclose;
               this.i5 = 24;
               this.i6 = 78;
               this.i7 = mstate.ebp + -4096;
               si32(this.i7,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               si32(this.i6,mstate.esp + 8);
               si32(this.i1,mstate.esp + 12);
               si32(this.i5,mstate.esp + 16);
               state = 3;
               mstate.esp = mstate.esp - 4;
               FSM_io_pclose.start();
               return;
            case 3:
               mstate.esp = mstate.esp + 20;
               this.i1 = 3;
               this.i0 = this.i7;
               log(this.i1,mstate.gworker.stringFromPtr(this.i0));
               si32(this.i6,FSM_io_pclose);
               mstate.esp = mstate.esp - 8;
               this.i0 = 0;
               si32(this.i4,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               state = 4;
               mstate.esp = mstate.esp - 4;
               FSM_io_pclose.start();
               return;
            case 4:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               §§goto(addr356);
            case 5:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               this.i3 = this.i2 + 8;
               if(this.i0 != 0)
               {
                  this.i0 = 22;
                  si32(this.i0,FSM_io_pclose);
               }
               this.i0 = FSM_io_pclose;
               mstate.esp = mstate.esp - 12;
               this.i4 = FSM_io_pclose;
               si32(this.i2,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               si32(this.i4,mstate.esp + 8);
               state = 6;
               mstate.esp = mstate.esp - 4;
               FSM_io_pclose.start();
               return;
            case 6:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               this.i0 = li32(this.i3);
               this.f0 = Number(this.i1);
               sf64(this.f0,this.i0);
               this.i1 = 3;
               si32(this.i1,this.i0 + 8);
               this.i0 = li32(this.i3);
               this.i0 = this.i0 + 12;
               si32(this.i0,this.i3);
               mstate.eax = this.i1;
               mstate.esp = mstate.ebp;
               mstate.ebp = li32(mstate.esp);
               mstate.esp = mstate.esp + 4;
               mstate.esp = mstate.esp + 4;
               mstate.gworker = caller;
               return;
         }
      }
   }
}
