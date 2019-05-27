package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.li8;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_max_expand extends Machine
   {
      
      public static const intRegCount:int = 12;
      
      public static const NumberRegCount:int = 0;
       
      
      public var i10:int;
      
      public var i11:int;
      
      public var i0:int;
      
      public var i1:int;
      
      public var i2:int;
      
      public var i3:int;
      
      public var i4:int;
      
      public var i5:int;
      
      public var i6:int;
      
      public var i7:int;
      
      public var i8:int;
      
      public var i9:int;
      
      public function FSM_max_expand()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM_max_expand = null;
         _loc1_ = new FSM_max_expand();
         FSM_max_expand.gworker = _loc1_;
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
               this.i1 = li32(this.i0 + 4);
               this.i2 = li32(mstate.ebp + 12);
               this.i3 = li32(mstate.ebp + 16);
               this.i4 = li32(mstate.ebp + 20);
               if(uint(this.i1) <= uint(this.i2))
               {
                  this.i1 = 0;
               }
               else
               {
                  this.i5 = 0;
                  this.i6 = li8(this.i3);
                  this.i7 = this.i6 << 24;
                  this.i7 = this.i7 >> 24;
                  this.i8 = this.i4 + -1;
                  this.i9 = this.i3 + 1;
                  loop0:
                  while(true)
                  {
                     this.i10 = this.i2 + this.i5;
                     this.i10 = li8(this.i10);
                     this.i11 = this.i10;
                     if(this.i7 != 37)
                     {
                        if(this.i7 != 91)
                        {
                           if(this.i7 == 46)
                           {
                              this.i10 = 1;
                           }
                           else
                           {
                              this.i10 = this.i10 & 255;
                              this.i11 = this.i6 & 255;
                              this.i10 = this.i11 == this.i10?1:0;
                              this.i10 = this.i10 & 1;
                           }
                        }
                        else
                        {
                           mstate.esp = mstate.esp - 12;
                           si32(this.i11,mstate.esp);
                           si32(this.i3,mstate.esp + 4);
                           si32(this.i8,mstate.esp + 8);
                           mstate.esp = mstate.esp - 4;
                           FSM_max_expand.start();
                        }
                     }
                     else
                     {
                        this.i10 = li8(this.i9);
                        mstate.esp = mstate.esp - 8;
                        si32(this.i11,mstate.esp);
                        si32(this.i10,mstate.esp + 4);
                        mstate.esp = mstate.esp - 4;
                        FSM_max_expand.start();
                     }
                     addr298:
                     while(true)
                     {
                        if(this.i10 == 0)
                        {
                           addr304:
                           this.i1 = this.i5;
                           break loop0;
                        }
                        this.i5 = this.i5 + 1;
                        this.i10 = this.i2 + this.i5;
                        if(uint(this.i10) >= uint(this.i1))
                        {
                           this.i1 = this.i5;
                           break loop0;
                        }
                        continue loop0;
                     }
                  }
               }
               this.i4 = this.i4 + 1;
               break;
            case 1:
               while(true)
               {
                  this.i10 = mstate.eax;
                  mstate.esp = mstate.esp + 8;
                  §§goto(addr298);
               }
               §§goto(addr304);
            case 2:
               while(true)
               {
                  this.i10 = mstate.eax;
                  mstate.esp = mstate.esp + 12;
                  §§goto(addr298);
               }
            case 3:
               this.i3 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               if(this.i3 != 0)
               {
                  this.i1 = this.i3;
                  addr389:
                  this.i0 = this.i1;
                  mstate.eax = this.i0;
                  mstate.esp = mstate.ebp;
                  mstate.ebp = li32(mstate.esp);
                  mstate.esp = mstate.esp + 4;
                  mstate.esp = mstate.esp + 4;
                  mstate.gworker = caller;
                  return;
               }
               this.i1 = this.i1 + -1;
               break;
         }
         if(this.i1 <= -1)
         {
            this.i1 = 0;
            §§goto(addr389);
         }
         else
         {
            mstate.esp = mstate.esp - 12;
            this.i3 = this.i2 + this.i1;
            si32(this.i0,mstate.esp);
            si32(this.i3,mstate.esp + 4);
            si32(this.i4,mstate.esp + 8);
            state = 3;
            mstate.esp = mstate.esp - 4;
            FSM_max_expand.start();
            return;
         }
      }
   }
}
