package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.lf64;
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.li8;
   import avm2.intrinsics.memory.sf64;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_mkfuncname extends Machine
   {
      
      public static const intRegCount:int = 5;
      
      public static const NumberRegCount:int = 1;
       
      
      public var i0:int;
      
      public var i1:int;
      
      public var i2:int;
      
      public var f0:Number;
      
      public var i4:int;
      
      public var i3:int;
      
      public function FSM_mkfuncname()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM_mkfuncname = null;
         _loc1_ = new FSM_mkfuncname();
         FSM_mkfuncname.gworker = _loc1_;
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
               this.i0 = li32(mstate.ebp + 12);
               this.i1 = li8(this.i0);
               this.i2 = li32(mstate.ebp + 8);
               this.i3 = this.i0;
               if(this.i1 != 45)
               {
                  this.i1 = this.i3;
                  while(true)
                  {
                     this.i3 = li8(this.i1);
                     if(this.i3 == 0)
                     {
                        this.i1 = 0;
                        break;
                     }
                     this.i3 = li8(this.i1 + 1);
                     this.i1 = this.i1 + 1;
                     this.i4 = this.i1;
                     if(this.i3 != 45)
                     {
                        this.i1 = this.i4;
                        continue;
                     }
                     break;
                  }
               }
               else
               {
                  this.i1 = this.i0;
               }
               if(this.i1 != 0)
               {
                  this.i0 = FSM_mkfuncname;
                  mstate.esp = mstate.esp - 16;
                  this.i3 = FSM_mkfuncname;
                  this.i1 = this.i1 + 1;
                  si32(this.i2,mstate.esp);
                  si32(this.i1,mstate.esp + 4);
                  si32(this.i0,mstate.esp + 8);
                  si32(this.i3,mstate.esp + 12);
                  state = 4;
                  mstate.esp = mstate.esp - 4;
                  FSM_mkfuncname.start();
                  return;
               }
               this.i1 = FSM_mkfuncname;
               mstate.esp = mstate.esp - 16;
               this.i3 = FSM_mkfuncname;
               si32(this.i2,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               si32(this.i1,mstate.esp + 8);
               si32(this.i3,mstate.esp + 12);
               state = 1;
               mstate.esp = mstate.esp - 4;
               FSM_mkfuncname.start();
               return;
            case 1:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 16;
               mstate.esp = mstate.esp - 12;
               this.i1 = FSM_mkfuncname;
               si32(this.i2,mstate.esp);
               si32(this.i1,mstate.esp + 4);
               si32(this.i0,mstate.esp + 8);
               state = 2;
               mstate.esp = mstate.esp - 4;
               FSM_mkfuncname.start();
               return;
            case 2:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               mstate.esp = mstate.esp - 8;
               this.i0 = -2;
               si32(this.i2,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_mkfuncname.start();
            case 3:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i1 = li32(this.i2 + 8);
               this.i2 = this.i2 + 8;
               this.i3 = this.i0;
               this.i4 = this.i0 + 12;
               if(uint(this.i4) >= uint(this.i1))
               {
                  this.i0 = this.i1;
                  break;
               }
               this.i0 = this.i0 + 12;
               this.i1 = this.i3;
               while(true)
               {
                  this.f0 = lf64(this.i1 + 12);
                  sf64(this.f0,this.i1);
                  this.i3 = li32(this.i1 + 20);
                  si32(this.i3,this.i1 + 8);
                  this.i1 = li32(this.i2);
                  this.i3 = this.i0 + 12;
                  this.i4 = this.i0;
                  if(uint(this.i3) >= uint(this.i1))
                  {
                     break;
                  }
                  this.i0 = this.i3;
                  this.i1 = this.i4;
               }
               this.i0 = this.i1;
               break;
            case 4:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 16;
               mstate.esp = mstate.esp - 12;
               this.i1 = FSM_mkfuncname;
               si32(this.i2,mstate.esp);
               si32(this.i1,mstate.esp + 4);
               si32(this.i0,mstate.esp + 8);
               state = 5;
               mstate.esp = mstate.esp - 4;
               FSM_mkfuncname.start();
               return;
            case 5:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               mstate.esp = mstate.esp - 8;
               this.i0 = -2;
               si32(this.i2,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_mkfuncname.start();
            case 6:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i1 = li32(this.i2 + 8);
               this.i2 = this.i2 + 8;
               this.i3 = this.i0;
               this.i4 = this.i0 + 12;
               if(uint(this.i4) >= uint(this.i1))
               {
                  this.i0 = this.i1;
                  break;
               }
               this.i0 = this.i0 + 12;
               this.i1 = this.i3;
               while(true)
               {
                  this.f0 = lf64(this.i1 + 12);
                  sf64(this.f0,this.i1);
                  this.i3 = li32(this.i1 + 20);
                  si32(this.i3,this.i1 + 8);
                  this.i1 = li32(this.i2);
                  this.i3 = this.i0 + 12;
                  this.i4 = this.i0;
                  if(uint(this.i3) >= uint(this.i1))
                  {
                     break;
                  }
                  this.i0 = this.i3;
                  this.i1 = this.i4;
               }
               this.i0 = this.i1;
               this.i0 = this.i0 + -12;
               si32(this.i0,this.i2);
               mstate.esp = mstate.ebp;
               mstate.ebp = li32(mstate.esp);
               mstate.esp = mstate.esp + 4;
               mstate.esp = mstate.esp + 4;
               mstate.gworker = caller;
               return;
         }
         §§goto(addr172);
      }
   }
}
