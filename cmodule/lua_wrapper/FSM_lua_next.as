package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.lf64;
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.li8;
   import avm2.intrinsics.memory.sf64;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_lua_next extends Machine
   {
      
      public static const intRegCount:int = 11;
      
      public static const NumberRegCount:int = 2;
       
      
      public var i10:int;
      
      public var f0:Number;
      
      public var f1:Number;
      
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
      
      public function FSM_lua_next()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM_lua_next = null;
         _loc1_ = new FSM_lua_next();
         FSM_lua_next.gworker = _loc1_;
      }
      
      override public final function work() : void
      {
         loop5:
         switch(state)
         {
            case 0:
               mstate.esp = mstate.esp - 4;
               si32(mstate.ebp,mstate.esp);
               mstate.ebp = mstate.esp;
               mstate.esp = mstate.esp - 0;
               this.i0 = FSM_lua_next;
               this.i1 = li32(mstate.ebp + 8);
               this.i2 = li32(this.i1 + 8);
               this.i3 = li32(this.i1 + 12);
               this.i0 = uint(this.i2) > uint(this.i3)?int(this.i3):int(this.i0);
               this.i0 = li32(this.i0);
               this.i3 = li32(this.i2 + -4);
               this.i4 = this.i2 + -4;
               this.i5 = this.i2 + -12;
               this.i6 = this.i1 + 8;
               if(this.i3 != 3)
               {
                  if(this.i3 == 0)
                  {
                     this.i1 = -1;
                     break;
                  }
                  this.i7 = -1;
               }
               else
               {
                  this.f0 = lf64(this.i2 + -12);
                  this.i7 = int(this.f0);
                  this.f1 = Number(this.i7);
                  this.i7 = this.f1 == this.f0?int(this.i7):-1;
               }
               if(this.i7 >= 1)
               {
                  this.i8 = li32(this.i0 + 28);
                  if(this.i8 >= this.i7)
                  {
                     this.i1 = this.i7 + -1;
                     if(this.i8 <= this.i7)
                     {
                        this.i1 = this.i7;
                        addr476:
                        this.i3 = 1;
                        this.i5 = li8(this.i0 + 7);
                        this.i7 = li32(this.i0 + 28);
                        this.i3 = this.i3 << this.i5;
                        this.i5 = this.i1 - this.i7;
                        if(this.i3 > this.i5)
                        {
                           this.i1 = this.i1 - this.i7;
                           this.i5 = li32(this.i0 + 16);
                           this.i7 = this.i1 * 28;
                           this.i7 = this.i5 + this.i7;
                           this.i7 = this.i7 + 8;
                           this.i0 = this.i0 + 16;
                           while(true)
                           {
                              this.i8 = li32(this.i7);
                              if(this.i8 != 0)
                              {
                                 this.i7 = 1;
                                 this.i1 = this.i1 * 28;
                                 this.i3 = this.i5 + this.i1;
                                 this.f0 = lf64(this.i3 + 12);
                                 sf64(this.f0,this.i2 + -12);
                                 this.i3 = li32(this.i3 + 20);
                                 si32(this.i3,this.i4);
                                 this.i0 = li32(this.i0);
                                 this.i1 = this.i0 + this.i1;
                                 this.f0 = lf64(this.i1);
                                 sf64(this.f0,this.i2);
                                 this.i1 = li32(this.i1 + 8);
                                 si32(this.i1,this.i2 + 8);
                                 this.i1 = this.i7;
                              }
                              else
                              {
                                 this.i7 = this.i7 + 28;
                                 this.i1 = this.i1 + 1;
                                 if(this.i3 > this.i1)
                                 {
                                    continue;
                                 }
                              }
                           }
                        }
                        this.i1 = 0;
                     }
                     else
                     {
                        this.i3 = this.i7;
                        addr365:
                        while(true)
                        {
                           this.i5 = li32(this.i0 + 12);
                           this.i7 = this.i3 * 12;
                           this.i5 = this.i5 + this.i7;
                           this.i5 = li32(this.i5 + 8);
                           this.i7 = this.i0 + 12;
                           if(this.i5 == 0)
                           {
                              this.i1 = this.i3;
                              break loop5;
                           }
                           this.i0 = 3;
                           this.i1 = this.i1 + 2;
                           this.f0 = Number(this.i1);
                           sf64(this.f0,this.i2 + -12);
                           si32(this.i0,this.i4);
                           this.i1 = li32(this.i7);
                           this.i0 = this.i3 * 12;
                           this.i1 = this.i1 + this.i0;
                           this.f0 = lf64(this.i1);
                           sf64(this.f0,this.i2);
                           this.i1 = li32(this.i1 + 8);
                           si32(this.i1,this.i2 + 8);
                           this.i1 = 1;
                        }
                     }
                     addr744:
                     this.i0 = this.i1;
                     this.i1 = li32(this.i6);
                     if(this.i0 != 0)
                     {
                        this.i1 = this.i1 + 12;
                     }
                     else
                     {
                        this.i1 = this.i1 + -12;
                     }
                     si32(this.i1,this.i6);
                     mstate.eax = this.i0;
                     mstate.esp = mstate.ebp;
                     mstate.ebp = li32(mstate.esp);
                     mstate.esp = mstate.esp + 4;
                     mstate.esp = mstate.esp + 4;
                     mstate.gworker = caller;
                     return;
                  }
               }
               mstate.esp = mstate.esp - 8;
               si32(this.i0,mstate.esp);
               si32(this.i5,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_lua_next.start();
            case 1:
               this.i7 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i8 = this.i5;
               addr227:
               while(true)
               {
                  mstate.esp = mstate.esp - 8;
                  this.i9 = this.i7 + 12;
                  si32(this.i9,mstate.esp);
                  si32(this.i5,mstate.esp + 4);
                  mstate.esp = mstate.esp - 4;
                  FSM_lua_next.start();
               }
            case 2:
               while(true)
               {
                  this.i10 = mstate.eax;
                  mstate.esp = mstate.esp + 8;
                  if(this.i10 == 0)
                  {
                     this.i10 = li32(this.i7 + 20);
                     if(this.i3 >= 4)
                     {
                        if(this.i10 == 11)
                        {
                           this.i9 = li32(this.i9);
                           this.i10 = li32(this.i8);
                           if(this.i9 == this.i10)
                           {
                              break;
                           }
                        }
                     }
                     this.i7 = li32(this.i7 + 24);
                     if(this.i7 != 0)
                     {
                        §§goto(addr227);
                     }
                     else
                     {
                        this.i3 = FSM_lua_next;
                        mstate.esp = mstate.esp - 8;
                        si32(this.i1,mstate.esp);
                        si32(this.i3,mstate.esp + 4);
                        state = 3;
                        mstate.esp = mstate.esp - 4;
                        FSM_lua_next.start();
                        return;
                     }
                  }
                  break;
               }
               this.i1 = li32(this.i0 + 16);
               this.i1 = this.i7 - this.i1;
               this.i3 = li32(this.i0 + 28);
               this.i1 = this.i1 / 28;
               this.i1 = this.i3 + this.i1;
               break;
            case 3:
               mstate.esp = mstate.esp + 8;
               this.i1 = 0;
         }
         while(true)
         {
            this.i3 = li32(this.i0 + 28);
            this.i5 = this.i1 + 1;
            if(this.i3 <= this.i5)
            {
               this.i1 = this.i5;
               §§goto(addr476);
            }
            else
            {
               this.i3 = this.i5;
               §§goto(addr365);
            }
         }
         §§goto(addr744);
      }
   }
}
