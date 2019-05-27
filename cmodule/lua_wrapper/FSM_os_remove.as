package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.sf64;
   import avm2.intrinsics.memory.si32;
   import avm2.intrinsics.memory.si8;
   
   public final class FSM_os_remove extends Machine
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
      
      public function FSM_os_remove()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM_os_remove = null;
         _loc1_ = new FSM_os_remove();
         FSM_os_remove.gworker = _loc1_;
      }
      
      override public final function work() : void
      {
         switch(state)
         {
            case 0:
               mstate.esp = mstate.esp - 4;
               si32(mstate.ebp,mstate.esp);
               mstate.ebp = mstate.esp;
               mstate.esp = mstate.esp - 13312;
               this.i0 = 0;
               mstate.esp = mstate.esp - 12;
               this.i2 = li32(mstate.ebp + 8);
               this.i1 = 1;
               si32(this.i2,mstate.esp);
               si32(this.i1,mstate.esp + 4);
               si32(this.i0,mstate.esp + 8);
               state = 1;
               mstate.esp = mstate.esp - 4;
               FSM_os_remove.start();
               return;
            case 1:
               this.i3 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               this.i0 = this.i3;
               state = 2;
            case 2:
               this.i0 = mstate.system.psize(this.i0);
               if(this.i0 >= 0)
               {
                  this.i0 = 0;
                  this.i1 = this.i0;
                  addr319:
                  this.i0 = this.i0 & 1;
                  if(this.i0 == 0)
                  {
                     this.i0 = this.i1 ^ 1;
                     this.i0 = this.i0 & 1;
                     if(this.i0 == 0)
                     {
                        this.i0 = FSM_os_remove;
                        this.i1 = 4;
                        log(this.i1,mstate.gworker.stringFromPtr(this.i0));
                        mstate.esp = mstate.esp - 20;
                        this.i0 = FSM_os_remove;
                        this.i1 = FSM_os_remove;
                        this.i4 = 446;
                        this.i5 = 78;
                        this.i6 = mstate.ebp + -4096;
                        si32(this.i6,mstate.esp);
                        si32(this.i0,mstate.esp + 4);
                        si32(this.i5,mstate.esp + 8);
                        si32(this.i1,mstate.esp + 12);
                        si32(this.i4,mstate.esp + 16);
                        state = 6;
                        mstate.esp = mstate.esp - 4;
                        FSM_os_remove.start();
                        return;
                     }
                     this.i0 = FSM_os_remove;
                     this.i1 = 4;
                     log(this.i1,mstate.gworker.stringFromPtr(this.i0));
                     mstate.esp = mstate.esp - 20;
                     this.i0 = FSM_os_remove;
                     this.i1 = FSM_os_remove;
                     this.i4 = 400;
                     this.i5 = 78;
                     this.i6 = mstate.ebp + -8192;
                     si32(this.i6,mstate.esp);
                     si32(this.i0,mstate.esp + 4);
                     si32(this.i5,mstate.esp + 8);
                     si32(this.i1,mstate.esp + 12);
                     si32(this.i4,mstate.esp + 16);
                     state = 7;
                     mstate.esp = mstate.esp - 4;
                     FSM_os_remove.start();
                     return;
                  }
                  addr580:
                  this.i0 = 0;
                  this.i1 = li32(FSM_os_remove);
                  this.i4 = li32(this.i2 + 8);
                  si32(this.i0,this.i4 + 8);
                  this.i0 = li32(this.i2 + 8);
                  this.i0 = this.i0 + 12;
                  si32(this.i0,this.i2 + 8);
                  mstate.esp = mstate.esp - 12;
                  this.i0 = FSM_os_remove;
                  this.i4 = 2048;
                  si32(this.i1,mstate.esp);
                  si32(this.i0,mstate.esp + 4);
                  si32(this.i4,mstate.esp + 8);
                  mstate.esp = mstate.esp - 4;
                  FSM_os_remove.start();
               }
               else
               {
                  this.i0 = FSM_os_remove;
                  mstate.esp = mstate.esp - 16;
                  this.i1 = 1024;
                  this.i4 = mstate.ebp + -13312;
                  si32(this.i4,mstate.esp);
                  si32(this.i1,mstate.esp + 4);
                  si32(this.i0,mstate.esp + 8);
                  si32(this.i3,mstate.esp + 12);
                  state = 3;
                  mstate.esp = mstate.esp - 4;
                  FSM_os_remove.start();
                  return;
               }
            case 3:
               mstate.esp = mstate.esp + 16;
               this.i0 = 0;
               si8(this.i0,mstate.ebp + -12289);
               this.i0 = this.i4;
               state = 4;
            case 4:
               this.i0 = mstate.system.psize(this.i0);
               if(this.i0 >= 0)
               {
                  this.i0 = 0;
                  this.i1 = 1;
                  §§goto(addr319);
               }
               else
               {
                  this.i0 = FSM_os_remove;
                  mstate.esp = mstate.esp - 20;
                  this.i1 = FSM_os_remove;
                  this.i4 = 28;
                  this.i5 = 2;
                  this.i6 = mstate.ebp + -12288;
                  si32(this.i6,mstate.esp);
                  si32(this.i0,mstate.esp + 4);
                  si32(this.i5,mstate.esp + 8);
                  si32(this.i1,mstate.esp + 12);
                  si32(this.i4,mstate.esp + 16);
                  state = 5;
                  mstate.esp = mstate.esp - 4;
                  FSM_os_remove.start();
                  return;
               }
            case 5:
               mstate.esp = mstate.esp + 20;
               this.i1 = 3;
               this.i0 = this.i6;
               log(this.i1,mstate.gworker.stringFromPtr(this.i0));
               si32(this.i5,FSM_os_remove);
               this.i0 = 1;
               this.i1 = 0;
               §§goto(addr319);
            case 6:
               mstate.esp = mstate.esp + 20;
               this.i1 = 3;
               this.i0 = this.i6;
               log(this.i1,mstate.gworker.stringFromPtr(this.i0));
               si32(this.i5,FSM_os_remove);
               §§goto(addr580);
            case 7:
               mstate.esp = mstate.esp + 20;
               this.i1 = 3;
               this.i0 = this.i6;
               log(this.i1,mstate.gworker.stringFromPtr(this.i0));
               si32(this.i5,FSM_os_remove);
               §§goto(addr580);
            case 8:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               this.i4 = this.i2 + 8;
               if(this.i0 != 0)
               {
                  this.i0 = 22;
                  si32(this.i0,FSM_os_remove);
               }
               this.i0 = FSM_os_remove;
               mstate.esp = mstate.esp - 16;
               this.i5 = FSM_os_remove;
               si32(this.i2,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               si32(this.i3,mstate.esp + 8);
               si32(this.i5,mstate.esp + 12);
               state = 9;
               mstate.esp = mstate.esp - 4;
               FSM_os_remove.start();
               return;
            case 9:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 16;
               this.i0 = li32(this.i4);
               this.f0 = Number(this.i1);
               sf64(this.f0,this.i0);
               this.i1 = 3;
               si32(this.i1,this.i0 + 8);
               this.i0 = li32(this.i4);
               this.i0 = this.i0 + 12;
               si32(this.i0,this.i4);
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
