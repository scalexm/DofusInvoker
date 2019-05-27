package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.li8;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_loader_preload extends Machine
   {
      
      public static const intRegCount:int = 8;
      
      public static const NumberRegCount:int = 0;
       
      
      public var i0:int;
      
      public var i1:int;
      
      public var i2:int;
      
      public var i3:int;
      
      public var i4:int;
      
      public var i5:int;
      
      public var i6:int;
      
      public var i7:int;
      
      public function FSM_loader_preload()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM_loader_preload = null;
         _loc1_ = new FSM_loader_preload();
         FSM_loader_preload.gworker = _loc1_;
      }
      
      override public final function work() : void
      {
         switch(state)
         {
            case 0:
               mstate.esp = mstate.esp - 4;
               si32(mstate.ebp,mstate.esp);
               mstate.ebp = mstate.esp;
               mstate.esp = mstate.esp - 32;
               this.i0 = 0;
               mstate.esp = mstate.esp - 12;
               this.i1 = li32(mstate.ebp + 8);
               this.i2 = 1;
               si32(this.i1,mstate.esp);
               si32(this.i2,mstate.esp + 4);
               si32(this.i0,mstate.esp + 8);
               state = 1;
               mstate.esp = mstate.esp - 4;
               FSM_loader_preload.start();
               return;
            case 1:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               mstate.esp = mstate.esp - 8;
               this.i2 = -10001;
               si32(this.i1,mstate.esp);
               si32(this.i2,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_loader_preload.start();
            case 2:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i3 = FSM_loader_preload;
               this.i4 = this.i0;
               while(true)
               {
                  this.i5 = li8(this.i3 + 1);
                  this.i3 = this.i3 + 1;
                  this.i6 = this.i3;
                  if(this.i5 != 0)
                  {
                     this.i3 = this.i6;
                     continue;
                  }
                  break;
               }
               this.i5 = FSM_loader_preload;
               mstate.esp = mstate.esp - 12;
               this.i3 = this.i3 - this.i5;
               si32(this.i1,mstate.esp);
               si32(this.i5,mstate.esp + 4);
               si32(this.i3,mstate.esp + 8);
               state = 3;
               mstate.esp = mstate.esp - 4;
               FSM_loader_preload.start();
               return;
            case 3:
               this.i3 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i3,mstate.ebp + -32);
               this.i3 = 4;
               si32(this.i3,mstate.ebp + -24);
               this.i3 = li32(this.i1 + 8);
               mstate.esp = mstate.esp - 16;
               this.i5 = mstate.ebp + -32;
               si32(this.i1,mstate.esp);
               si32(this.i2,mstate.esp + 4);
               si32(this.i5,mstate.esp + 8);
               si32(this.i3,mstate.esp + 12);
               state = 4;
               mstate.esp = mstate.esp - 4;
               FSM_loader_preload.start();
               return;
            case 4:
               mstate.esp = mstate.esp + 16;
               this.i2 = li32(this.i1 + 8);
               this.i2 = this.i2 + 12;
               si32(this.i2,this.i1 + 8);
               mstate.esp = mstate.esp - 8;
               this.i2 = -1;
               si32(this.i1,mstate.esp);
               si32(this.i2,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_loader_preload.start();
            case 5:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i3 = this.i1 + 8;
               this.i5 = FSM_loader_preload;
               if(this.i2 != this.i5)
               {
                  this.i2 = li32(this.i2 + 8);
                  if(this.i2 == 5)
                  {
                     addr433:
                     this.i2 = -1;
                     mstate.esp = mstate.esp - 8;
                     si32(this.i1,mstate.esp);
                     si32(this.i2,mstate.esp + 4);
                     mstate.esp = mstate.esp - 4;
                     FSM_loader_preload.start();
                  }
               }
               this.i2 = FSM_loader_preload;
               mstate.esp = mstate.esp - 8;
               si32(this.i1,mstate.esp);
               si32(this.i2,mstate.esp + 4);
               state = 6;
               mstate.esp = mstate.esp - 4;
               FSM_loader_preload.start();
               return;
            case 6:
               mstate.esp = mstate.esp + 8;
               §§goto(addr433);
            case 7:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i5 = li8(this.i0);
               if(this.i5 != 0)
               {
                  this.i5 = this.i4;
                  while(true)
                  {
                     this.i6 = li8(this.i5 + 1);
                     this.i5 = this.i5 + 1;
                     this.i7 = this.i5;
                     if(this.i6 != 0)
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
               this.i6 = 4;
               mstate.esp = mstate.esp - 12;
               this.i4 = this.i5 - this.i4;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               si32(this.i4,mstate.esp + 8);
               state = 8;
               mstate.esp = mstate.esp - 4;
               FSM_loader_preload.start();
               return;
            case 8:
               this.i4 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i4,mstate.ebp + -16);
               si32(this.i6,mstate.ebp + -8);
               this.i4 = li32(this.i3);
               mstate.esp = mstate.esp - 16;
               this.i5 = mstate.ebp + -16;
               si32(this.i1,mstate.esp);
               si32(this.i2,mstate.esp + 4);
               si32(this.i5,mstate.esp + 8);
               si32(this.i4,mstate.esp + 12);
               state = 9;
               mstate.esp = mstate.esp - 4;
               FSM_loader_preload.start();
               return;
            case 9:
               mstate.esp = mstate.esp + 16;
               this.i2 = li32(this.i3);
               this.i2 = this.i2 + 12;
               si32(this.i2,this.i3);
               mstate.esp = mstate.esp - 8;
               this.i2 = -1;
               si32(this.i1,mstate.esp);
               si32(this.i2,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_loader_preload.start();
            case 10:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i3 = FSM_loader_preload;
               if(this.i2 != this.i3)
               {
                  this.i2 = li32(this.i2 + 8);
                  if(this.i2 == 0)
                  {
                     this.i2 = FSM_loader_preload;
                     mstate.esp = mstate.esp - 12;
                     si32(this.i1,mstate.esp);
                     si32(this.i2,mstate.esp + 4);
                     si32(this.i0,mstate.esp + 8);
                     state = 11;
                     mstate.esp = mstate.esp - 4;
                     FSM_loader_preload.start();
                     return;
                  }
                  break;
               }
               break;
            case 11:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 12;
         }
         this.i0 = 1;
         mstate.eax = this.i0;
         mstate.esp = mstate.ebp;
         mstate.ebp = li32(mstate.esp);
         mstate.esp = mstate.esp + 4;
         mstate.esp = mstate.esp + 4;
         mstate.gworker = caller;
      }
   }
}
