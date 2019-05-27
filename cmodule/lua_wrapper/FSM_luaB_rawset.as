package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_luaB_rawset extends Machine
   {
      
      public static const intRegCount:int = 6;
      
      public static const NumberRegCount:int = 0;
       
      
      public var i0:int;
      
      public var i1:int;
      
      public var i2:int;
      
      public var i3:int;
      
      public var i4:int;
      
      public var i5:int;
      
      public function FSM_luaB_rawset()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM_luaB_rawset = null;
         _loc1_ = new FSM_luaB_rawset();
         FSM_luaB_rawset.gworker = _loc1_;
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
               FSM_luaB_rawset.start();
            case 1:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i2 = FSM_luaB_rawset;
               if(this.i0 != this.i2)
               {
                  this.i0 = li32(this.i0 + 8);
                  if(this.i0 == 5)
                  {
                     addr145:
                     this.i0 = 2;
                     mstate.esp = mstate.esp - 8;
                     si32(this.i1,mstate.esp);
                     si32(this.i0,mstate.esp + 4);
                     mstate.esp = mstate.esp - 4;
                     FSM_luaB_rawset.start();
                  }
               }
               this.i0 = 5;
               mstate.esp = mstate.esp - 12;
               this.i2 = 1;
               si32(this.i1,mstate.esp);
               si32(this.i2,mstate.esp + 4);
               si32(this.i0,mstate.esp + 8);
               state = 2;
               mstate.esp = mstate.esp - 4;
               FSM_luaB_rawset.start();
               return;
            case 2:
               mstate.esp = mstate.esp + 12;
               §§goto(addr145);
            case 3:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i2 = FSM_luaB_rawset;
               if(this.i0 != this.i2)
               {
                  this.i0 = li32(this.i0 + 8);
                  if(this.i0 != -1)
                  {
                     addr259:
                     this.i0 = 3;
                     mstate.esp = mstate.esp - 8;
                     si32(this.i1,mstate.esp);
                     si32(this.i0,mstate.esp + 4);
                     mstate.esp = mstate.esp - 4;
                     FSM_luaB_rawset.start();
                  }
               }
               this.i0 = FSM_luaB_rawset;
               mstate.esp = mstate.esp - 12;
               this.i2 = 2;
               si32(this.i1,mstate.esp);
               si32(this.i2,mstate.esp + 4);
               si32(this.i0,mstate.esp + 8);
               state = 4;
               mstate.esp = mstate.esp - 4;
               FSM_luaB_rawset.start();
               return;
            case 4:
               mstate.esp = mstate.esp + 12;
               §§goto(addr259);
            case 5:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i2 = FSM_luaB_rawset;
               if(this.i0 != this.i2)
               {
                  this.i0 = li32(this.i0 + 8);
                  if(this.i0 != -1)
                  {
                     break;
                  }
               }
               this.i0 = FSM_luaB_rawset;
               mstate.esp = mstate.esp - 12;
               this.i2 = 3;
               si32(this.i1,mstate.esp);
               si32(this.i2,mstate.esp + 4);
               si32(this.i0,mstate.esp + 8);
               state = 6;
               mstate.esp = mstate.esp - 4;
               FSM_luaB_rawset.start();
               return;
            case 6:
               mstate.esp = mstate.esp + 12;
               break;
            case 7:
               mstate.esp = mstate.esp + 8;
               mstate.eax = this.i2;
               mstate.esp = mstate.ebp;
               mstate.ebp = li32(mstate.esp);
               mstate.esp = mstate.esp + 4;
               mstate.esp = mstate.esp + 4;
               mstate.gworker = caller;
               return;
         }
         this.i0 = li32(this.i1 + 12);
         this.i2 = li32(this.i1 + 8);
         this.i3 = this.i1 + 12;
         this.i4 = this.i1 + 8;
         this.i5 = this.i0 + 36;
         if(uint(this.i2) >= uint(this.i5))
         {
            this.i2 = this.i0;
         }
         else
         {
            do
            {
               this.i0 = 0;
               si32(this.i0,this.i2 + 8);
               this.i2 = this.i2 + 12;
               si32(this.i2,this.i4);
               this.i0 = li32(this.i3);
               this.i5 = this.i0 + 36;
            }
            while(uint(this.i2) < uint(this.i5));
            
            this.i2 = this.i0;
         }
         this.i0 = this.i2;
         this.i2 = 1;
         this.i0 = this.i0 + 36;
         si32(this.i0,this.i4);
         mstate.esp = mstate.esp - 8;
         si32(this.i1,mstate.esp);
         si32(this.i2,mstate.esp + 4);
         state = 7;
         mstate.esp = mstate.esp - 4;
         FSM_luaB_rawset.start();
      }
   }
}
