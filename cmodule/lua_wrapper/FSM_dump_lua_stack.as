package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.lf64;
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.li8;
   import avm2.intrinsics.memory.sf64;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_dump_lua_stack extends Machine
   {
      
      public static const intRegCount:int = 14;
      
      public static const NumberRegCount:int = 1;
       
      
      public var i10:int;
      
      public var i11:int;
      
      public var i12:int;
      
      public var i13:int;
      
      public var f0:Number;
      
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
      
      public function FSM_dump_lua_stack()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM_dump_lua_stack = null;
         _loc1_ = new FSM_dump_lua_stack();
         FSM_dump_lua_stack.gworker = _loc1_;
      }
      
      override public final function work() : void
      {
         switch(state)
         {
            case 0:
               mstate.esp = mstate.esp - 4;
               si32(mstate.ebp,mstate.esp);
               mstate.ebp = mstate.esp;
               mstate.esp = mstate.esp - 1040;
               this.i0 = li32(mstate.ebp + 8);
               this.i1 = li32(this.i0 + 8);
               this.i2 = li32(this.i0 + 12);
               this.i3 = this.i1 - this.i2;
               this.i4 = this.i3 / 12;
               this.i5 = this.i0 + 12;
               this.i6 = this.i0 + 8;
               this.i7 = li32(mstate.ebp + 12);
               this.i8 = this.i3 + 11;
               if(uint(this.i8) <= uint(22))
               {
                  this.i1 = li32(this.i0 + 16);
                  this.i2 = li32(this.i1 + 68);
                  this.i1 = li32(this.i1 + 64);
                  if(uint(this.i2) >= uint(this.i1))
                  {
                     mstate.esp = mstate.esp - 4;
                     si32(this.i0,mstate.esp);
                     state = 1;
                     mstate.esp = mstate.esp - 4;
                     FSM_dump_lua_stack.start();
                     return;
                  }
                  addr155:
                  this.i1 = FSM_dump_lua_stack;
                  this.i2 = li32(this.i6);
                  mstate.esp = mstate.esp - 12;
                  this.i3 = 20;
                  si32(this.i0,mstate.esp);
                  si32(this.i1,mstate.esp + 4);
                  si32(this.i3,mstate.esp + 8);
                  state = 2;
                  mstate.esp = mstate.esp - 4;
                  FSM_dump_lua_stack.start();
                  return;
               }
               this.i8 = FSM_dump_lua_stack;
               mstate.esp = mstate.esp - 12;
               this.i9 = 0;
               si32(this.i0,mstate.esp);
               si32(this.i8,mstate.esp + 4);
               si32(this.i9,mstate.esp + 8);
               state = 3;
               mstate.esp = mstate.esp - 4;
               FSM_dump_lua_stack.start();
               return;
            case 1:
               mstate.esp = mstate.esp + 4;
               §§goto(addr155);
            case 2:
               this.i1 = mstate.eax;
               mstate.esp = mstate.esp + 12;
               si32(this.i1,this.i2);
               this.i1 = 4;
               si32(this.i1,this.i2 + 8);
               this.i1 = li32(this.i6);
               this.i1 = this.i1 + 12;
               si32(this.i1,this.i6);
               this.i2 = li32(this.i5);
               this.i1 = this.i1 - this.i2;
               this.i2 = this.i4 + 1;
               this.i1 = this.i1 / 12;
               if(this.i1 != this.i2)
               {
                  this.i1 = FSM_dump_lua_stack;
                  addr1367:
                  mstate.esp = mstate.esp - 8;
                  si32(this.i0,mstate.esp);
                  si32(this.i1,mstate.esp + 4);
                  state = 15;
                  mstate.esp = mstate.esp - 4;
                  FSM_dump_lua_stack.start();
                  return;
               }
               break;
            case 3:
               this.i8 = mstate.ebp + -1040;
               mstate.esp = mstate.esp + 12;
               si32(this.i0,mstate.ebp + -1032);
               this.i10 = this.i8 + 12;
               si32(this.i10,mstate.ebp + -1040);
               si32(this.i9,mstate.ebp + -1036);
               this.i9 = this.i8 + 4;
               this.i8 = this.i8 + 8;
               if(this.i3 >= 12)
               {
                  this.i1 = this.i1 - this.i2;
                  this.i1 = this.i1 / 12;
                  this.i2 = this.i4 + 1;
                  addr403:
                  this.i3 = FSM_dump_lua_stack;
                  this.i10 = FSM_dump_lua_stack;
                  this.i3 = this.i1 == this.i7?int(this.i3):int(this.i10);
                  this.i10 = li8(this.i3);
                  this.i11 = this.i3;
                  if(this.i10 != 0)
                  {
                     this.i10 = this.i3;
                     while(true)
                     {
                        this.i12 = li8(this.i10 + 1);
                        this.i10 = this.i10 + 1;
                        this.i13 = this.i10;
                        if(this.i12 != 0)
                        {
                           this.i10 = this.i13;
                           continue;
                        }
                        break;
                     }
                  }
                  else
                  {
                     this.i10 = this.i11;
                  }
                  this.i12 = mstate.ebp + -1040;
                  mstate.esp = mstate.esp - 12;
                  this.i3 = this.i10 - this.i3;
                  si32(this.i12,mstate.esp);
                  si32(this.i11,mstate.esp + 4);
                  si32(this.i3,mstate.esp + 8);
                  state = 16;
                  mstate.esp = mstate.esp - 4;
                  FSM_dump_lua_stack.start();
                  return;
               }
               addr1090:
               this.i1 = mstate.ebp + -1040;
               mstate.esp = mstate.esp - 4;
               si32(this.i1,mstate.esp);
               state = 12;
               mstate.esp = mstate.esp - 4;
               FSM_dump_lua_stack.start();
               return;
            case 4:
               mstate.esp = mstate.esp + 12;
               mstate.esp = mstate.esp - 8;
               si32(this.i0,mstate.esp);
               si32(this.i1,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_dump_lua_stack.start();
            case 5:
               this.i3 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i10 = FSM_dump_lua_stack;
               if(this.i3 == this.i10)
               {
                  this.i3 = -1;
               }
               else
               {
                  this.i3 = li32(this.i3 + 8);
               }
               if(this.i3 == -1)
               {
                  this.i3 = FSM_dump_lua_stack;
               }
               else
               {
                  this.i10 = FSM_dump_lua_stack;
                  this.i3 = this.i3 << 2;
                  this.i3 = this.i10 + this.i3;
                  this.i3 = li32(this.i3);
               }
               this.i10 = li8(this.i3);
               this.i11 = this.i3;
               if(this.i10 != 0)
               {
                  this.i10 = this.i11;
                  while(true)
                  {
                     this.i12 = li8(this.i10 + 1);
                     this.i10 = this.i10 + 1;
                     this.i13 = this.i10;
                     if(this.i12 != 0)
                     {
                        this.i10 = this.i13;
                        continue;
                     }
                     break;
                  }
               }
               else
               {
                  this.i10 = this.i3;
               }
               this.i12 = mstate.ebp + -1040;
               mstate.esp = mstate.esp - 12;
               this.i10 = this.i10 - this.i11;
               si32(this.i12,mstate.esp);
               si32(this.i3,mstate.esp + 4);
               si32(this.i10,mstate.esp + 8);
               state = 18;
               mstate.esp = mstate.esp - 4;
               FSM_dump_lua_stack.start();
               return;
            case 6:
               mstate.esp = mstate.esp + 12;
               mstate.esp = mstate.esp - 8;
               si32(this.i0,mstate.esp);
               si32(this.i2,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_dump_lua_stack.start();
            case 7:
               this.i3 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i10 = li32(this.i6);
               this.f0 = lf64(this.i3);
               sf64(this.f0,this.i10);
               this.i3 = li32(this.i3 + 8);
               si32(this.i3,this.i10 + 8);
               this.i3 = li32(this.i6);
               this.i3 = this.i3 + 12;
               si32(this.i3,this.i6);
               mstate.esp = mstate.esp - 8;
               si32(this.i0,mstate.esp);
               si32(this.i1,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_dump_lua_stack.start();
            case 8:
               this.i3 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i10 = li32(this.i6);
               this.f0 = lf64(this.i3);
               sf64(this.f0,this.i10);
               this.i3 = li32(this.i3 + 8);
               si32(this.i3,this.i10 + 8);
               this.i3 = li32(this.i6);
               this.i10 = this.i3 + 12;
               si32(this.i10,this.i6);
               mstate.esp = mstate.esp - 12;
               this.i10 = 1;
               this.i3 = this.i3 + -12;
               si32(this.i0,mstate.esp);
               si32(this.i3,mstate.esp + 4);
               si32(this.i10,mstate.esp + 8);
               state = 9;
               mstate.esp = mstate.esp - 4;
               FSM_dump_lua_stack.start();
               return;
            case 9:
               mstate.esp = mstate.esp + 12;
               mstate.esp = mstate.esp - 4;
               si32(this.i11,mstate.esp);
               state = 10;
               mstate.esp = mstate.esp - 4;
               FSM_dump_lua_stack.start();
               return;
            case 10:
               mstate.esp = mstate.esp + 4;
               this.i3 = FSM_dump_lua_stack;
               while(true)
               {
                  this.i10 = li8(this.i3 + 1);
                  this.i3 = this.i3 + 1;
                  this.i11 = this.i3;
                  if(this.i10 != 0)
                  {
                     this.i3 = this.i11;
                     continue;
                  }
                  break;
               }
               this.i10 = FSM_dump_lua_stack;
               mstate.esp = mstate.esp - 12;
               this.i11 = mstate.ebp + -1040;
               this.i3 = this.i3 - this.i10;
               si32(this.i11,mstate.esp);
               si32(this.i10,mstate.esp + 4);
               si32(this.i3,mstate.esp + 8);
               state = 11;
               mstate.esp = mstate.esp - 4;
               FSM_dump_lua_stack.start();
               return;
            case 11:
               mstate.esp = mstate.esp + 12;
               this.i1 = this.i1 + -1;
               if(this.i1 >= 1)
               {
                  §§goto(addr403);
               }
               else
               {
                  §§goto(addr1090);
               }
            case 12:
               this.i1 = mstate.eax;
               mstate.esp = mstate.esp + 4;
               this.i1 = li32(this.i9);
               this.i2 = li32(this.i8);
               mstate.esp = mstate.esp - 8;
               si32(this.i2,mstate.esp);
               si32(this.i1,mstate.esp + 4);
               state = 13;
               mstate.esp = mstate.esp - 4;
               FSM_dump_lua_stack.start();
               return;
            case 13:
               mstate.esp = mstate.esp + 8;
               this.i1 = 1;
               si32(this.i1,this.i9);
               mstate.esp = mstate.esp - 8;
               this.i1 = -2;
               si32(this.i0,mstate.esp);
               si32(this.i1,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_dump_lua_stack.start();
            case 14:
               this.i1 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i2 = li32(this.i6);
               this.i3 = this.i1;
               this.i7 = this.i1 + 12;
               if(uint(this.i7) >= uint(this.i2))
               {
                  this.i1 = this.i2;
               }
               else
               {
                  this.i1 = this.i1 + 12;
                  this.i2 = this.i3;
                  while(true)
                  {
                     this.f0 = lf64(this.i2 + 12);
                     sf64(this.f0,this.i2);
                     this.i3 = li32(this.i2 + 20);
                     si32(this.i3,this.i2 + 8);
                     this.i2 = li32(this.i6);
                     this.i3 = this.i1 + 12;
                     this.i7 = this.i1;
                     if(uint(this.i3) >= uint(this.i2))
                     {
                        break;
                     }
                     this.i1 = this.i3;
                     this.i2 = this.i7;
                  }
                  this.i1 = this.i2;
               }
               this.i1 = this.i1 + -12;
               si32(this.i1,this.i6);
               this.i2 = li32(this.i5);
               this.i1 = this.i1 - this.i2;
               this.i2 = this.i4 + 1;
               this.i1 = this.i1 / 12;
               if(this.i1 != this.i2)
               {
                  this.i1 = FSM_dump_lua_stack;
                  §§goto(addr1367);
               }
               else
               {
                  break;
               }
            case 15:
               mstate.esp = mstate.esp + 8;
               break;
            case 16:
               mstate.esp = mstate.esp + 12;
               this.i3 = li32(this.i6);
               this.f0 = Number(this.i1);
               sf64(this.f0,this.i3);
               this.i10 = 3;
               si32(this.i10,this.i3 + 8);
               this.i3 = li32(this.i6);
               this.i3 = this.i3 + 12;
               si32(this.i3,this.i6);
               mstate.esp = mstate.esp - 4;
               si32(this.i12,mstate.esp);
               state = 17;
               mstate.esp = mstate.esp - 4;
               FSM_dump_lua_stack.start();
               return;
            case 17:
               this.i3 = FSM_dump_lua_stack;
               this.i10 = FSM_dump_lua_stack;
               mstate.esp = mstate.esp + 4;
               this.i3 = this.i1 == this.i7?int(this.i3):int(this.i10);
               this.i10 = li8(this.i3);
               this.i11 = this.i3;
               if(this.i10 != 0)
               {
                  this.i10 = this.i3;
                  while(true)
                  {
                     this.i12 = li8(this.i10 + 1);
                     this.i10 = this.i10 + 1;
                     this.i13 = this.i10;
                     if(this.i12 != 0)
                     {
                        this.i10 = this.i13;
                        continue;
                     }
                     break;
                  }
               }
               else
               {
                  this.i10 = this.i11;
               }
               this.i12 = mstate.ebp + -1040;
               mstate.esp = mstate.esp - 12;
               this.i3 = this.i10 - this.i3;
               si32(this.i12,mstate.esp);
               si32(this.i11,mstate.esp + 4);
               si32(this.i3,mstate.esp + 8);
               state = 4;
               mstate.esp = mstate.esp - 4;
               FSM_dump_lua_stack.start();
               return;
            case 18:
               mstate.esp = mstate.esp + 12;
               this.i3 = FSM_dump_lua_stack;
               while(true)
               {
                  this.i10 = li8(this.i3 + 1);
                  this.i3 = this.i3 + 1;
                  this.i11 = this.i3;
                  if(this.i10 != 0)
                  {
                     this.i3 = this.i11;
                     continue;
                  }
                  break;
               }
               this.i10 = FSM_dump_lua_stack;
               mstate.esp = mstate.esp - 12;
               this.i11 = mstate.ebp + -1040;
               this.i3 = this.i3 - this.i10;
               si32(this.i11,mstate.esp);
               si32(this.i10,mstate.esp + 4);
               si32(this.i3,mstate.esp + 8);
               state = 6;
               mstate.esp = mstate.esp - 4;
               FSM_dump_lua_stack.start();
               return;
         }
         mstate.esp = mstate.ebp;
         mstate.ebp = li32(mstate.esp);
         mstate.esp = mstate.esp + 4;
         mstate.esp = mstate.esp + 4;
         mstate.gworker = caller;
      }
   }
}
