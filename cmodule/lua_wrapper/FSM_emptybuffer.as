package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_emptybuffer extends Machine
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
      
      public function FSM_emptybuffer()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM_emptybuffer = null;
         _loc1_ = new FSM_emptybuffer();
         FSM_emptybuffer.gworker = _loc1_;
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
               this.i1 = li32(this.i0);
               this.i2 = this.i0 + 12;
               this.i3 = this.i0;
               if(this.i1 != this.i2)
               {
                  this.i4 = li32(this.i0 + 8);
                  this.i5 = li32(this.i4 + 16);
                  this.i6 = li32(this.i5 + 68);
                  this.i5 = li32(this.i5 + 64);
                  this.i7 = this.i0 + 12;
                  this.i1 = this.i1 - this.i7;
                  if(uint(this.i6) >= uint(this.i5))
                  {
                     mstate.esp = mstate.esp - 4;
                     si32(this.i4,mstate.esp);
                     state = 1;
                     mstate.esp = mstate.esp - 4;
                     FSM_emptybuffer.start();
                     return;
                  }
                  break;
               }
               this.i0 = 0;
               addr257:
               mstate.eax = this.i0;
               mstate.esp = mstate.ebp;
               mstate.ebp = li32(mstate.esp);
               mstate.esp = mstate.esp + 4;
               mstate.esp = mstate.esp + 4;
               mstate.gworker = caller;
               return;
            case 1:
               mstate.esp = mstate.esp + 4;
               break;
            case 2:
               this.i1 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i1,this.i6);
               si32(this.i5,this.i6 + 8);
               this.i1 = li32(this.i4 + 8);
               this.i1 = this.i1 + 12;
               si32(this.i1,this.i4 + 8);
               si32(this.i2,this.i3);
               this.i1 = li32(this.i0 + 4);
               this.i1 = this.i1 + 1;
               si32(this.i1,this.i0 + 4);
               this.i0 = 1;
               §§goto(addr257);
         }
         this.i5 = 4;
         this.i6 = li32(this.i4 + 8);
         mstate.esp = mstate.esp - 12;
         si32(this.i4,mstate.esp);
         si32(this.i2,mstate.esp + 4);
         si32(this.i1,mstate.esp + 8);
         state = 2;
         mstate.esp = mstate.esp - 4;
         FSM_emptybuffer.start();
      }
   }
}
