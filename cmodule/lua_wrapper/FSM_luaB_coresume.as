package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.lf64;
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.sf64;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_luaB_coresume extends Machine
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
      
      public function FSM_luaB_coresume()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM_luaB_coresume = null;
         _loc1_ = new FSM_luaB_coresume();
         FSM_luaB_coresume.gworker = _loc1_;
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
               this.i0 = 1;
               mstate.esp = mstate.esp - 8;
               this.i1 = li32(mstate.ebp + 8);
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_luaB_coresume.start();
            case 1:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i2 = li32(this.i0 + 8);
               if(this.i2 != 8)
               {
                  this.i0 = 0;
               }
               else
               {
                  this.i0 = li32(this.i0);
               }
               if(this.i0 == 0)
               {
                  this.i2 = FSM_luaB_coresume;
                  mstate.esp = mstate.esp - 12;
                  this.i3 = 1;
                  si32(this.i1,mstate.esp);
                  si32(this.i3,mstate.esp + 4);
                  si32(this.i2,mstate.esp + 8);
                  state = 2;
                  mstate.esp = mstate.esp - 4;
                  FSM_luaB_coresume.start();
                  return;
               }
               break;
            case 2:
               mstate.esp = mstate.esp + 12;
               break;
            case 3:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               this.i2 = li32(this.i1 + 8);
               this.i3 = this.i1 + 8;
               this.i4 = this.i2;
               if(this.i0 <= -1)
               {
                  this.i0 = 0;
                  si32(this.i0,this.i2);
                  this.i0 = 1;
                  si32(this.i0,this.i4 + 8);
                  this.i0 = li32(this.i3);
                  this.i0 = this.i0 + 12;
                  si32(this.i0,this.i3);
                  mstate.esp = mstate.esp - 8;
                  this.i0 = -2;
                  si32(this.i1,mstate.esp);
                  si32(this.i0,mstate.esp + 4);
                  mstate.esp = mstate.esp - 4;
                  FSM_luaB_coresume.start();
               }
               else
               {
                  this.i5 = 1;
                  si32(this.i5,this.i2);
                  si32(this.i5,this.i4 + 8);
                  this.i2 = li32(this.i3);
                  this.i2 = this.i2 + 12;
                  si32(this.i2,this.i3);
                  mstate.esp = mstate.esp - 8;
                  this.i2 = this.i0 ^ -1;
                  si32(this.i1,mstate.esp);
                  si32(this.i2,mstate.esp + 4);
                  mstate.esp = mstate.esp - 4;
                  FSM_luaB_coresume.start();
               }
               addr456:
               mstate.esp = mstate.ebp;
               mstate.ebp = li32(mstate.esp);
               mstate.esp = mstate.esp + 4;
               mstate.esp = mstate.esp + 4;
               mstate.gworker = caller;
               return;
            case 4:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i1 = li32(this.i3);
               this.i2 = this.i1;
               if(uint(this.i1) > uint(this.i0))
               {
                  this.i4 = 0;
                  while(true)
                  {
                     this.i5 = this.i4 ^ -1;
                     this.i5 = this.i5 * 12;
                     this.i5 = this.i2 + this.i5;
                     this.f0 = lf64(this.i5);
                     sf64(this.f0,this.i1);
                     this.i6 = li32(this.i5 + 8);
                     si32(this.i6,this.i1 + 8);
                     this.i1 = this.i1 + -12;
                     this.i4 = this.i4 + 1;
                     if(uint(this.i5) > uint(this.i0))
                     {
                        continue;
                     }
                     break;
                  }
               }
               this.i1 = 2;
               this.i2 = li32(this.i3);
               this.f0 = lf64(this.i2);
               sf64(this.f0,this.i0);
               this.i2 = li32(this.i2 + 8);
               si32(this.i2,this.i0 + 8);
               mstate.eax = this.i1;
               §§goto(addr456);
            case 5:
               this.i1 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i2 = li32(this.i3);
               this.i4 = this.i2;
               if(uint(this.i2) > uint(this.i1))
               {
                  this.i5 = 0;
                  while(true)
                  {
                     this.i6 = this.i5 ^ -1;
                     this.i6 = this.i6 * 12;
                     this.i6 = this.i4 + this.i6;
                     this.f0 = lf64(this.i6);
                     sf64(this.f0,this.i2);
                     this.i7 = li32(this.i6 + 8);
                     si32(this.i7,this.i2 + 8);
                     this.i2 = this.i2 + -12;
                     this.i5 = this.i5 + 1;
                     if(uint(this.i6) > uint(this.i1))
                     {
                        continue;
                     }
                     break;
                  }
               }
               this.i2 = li32(this.i3);
               this.f0 = lf64(this.i2);
               sf64(this.f0,this.i1);
               this.i2 = li32(this.i2 + 8);
               si32(this.i2,this.i1 + 8);
               this.i0 = this.i0 + 1;
               mstate.eax = this.i0;
               §§goto(addr456);
         }
         this.i2 = li32(this.i1 + 8);
         this.i3 = li32(this.i1 + 12);
         this.i2 = this.i2 - this.i3;
         this.i2 = this.i2 / 12;
         mstate.esp = mstate.esp - 12;
         this.i2 = this.i2 + -1;
         si32(this.i1,mstate.esp);
         si32(this.i0,mstate.esp + 4);
         si32(this.i2,mstate.esp + 8);
         state = 3;
         mstate.esp = mstate.esp - 4;
         FSM_luaB_coresume.start();
      }
   }
}
