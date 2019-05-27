package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.li16;
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.si16;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM__ftello extends Machine
   {
      
      public static const intRegCount:int = 9;
      
      public static const NumberRegCount:int = 0;
       
      
      public var i0:int;
      
      public var i1:int;
      
      public var i2:int;
      
      public var i3:int;
      
      public var i4:int;
      
      public var i5:int;
      
      public var i6:int;
      
      public var i8:int;
      
      public var i7:int;
      
      public function FSM__ftello()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM__ftello = null;
         _loc1_ = new FSM__ftello();
         FSM__ftello.gworker = _loc1_;
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
               this.i1 = li32(mstate.ebp + 12);
               this.i2 = li32(this.i0 + 40);
               if(this.i2 == 0)
               {
                  this.i0 = 29;
                  si32(this.i0,FSM__ftello);
                  addr63:
                  addr588:
                  this.i0 = 1;
                  mstate.eax = this.i0;
               }
               else
               {
                  this.i2 = li16(this.i0 + 12);
                  this.i3 = this.i0 + 12;
                  this.i4 = this.i2;
                  this.i5 = this.i2 & 4096;
                  if(this.i5 != 0)
                  {
                     this.i5 = li32(this.i0 + 80);
                     this.i6 = li32(this.i0 + 84);
                     this.i4 = this.i4 & 4;
                     if(this.i4 != 0)
                     {
                        addr214:
                        this.i4 = this.i6;
                        this.i6 = li32(this.i0 + 48);
                        if(this.i6 != 0)
                        {
                           this.i7 = li32(this.i0 + 60);
                           this.i8 = this.i7 >> 31;
                           this.i5 = __subc(this.i5,this.i7);
                           this.i4 = __sube(this.i4,this.i8);
                           if(this.i4 >= 0)
                           {
                              this.i2 = this.i5;
                              this.i3 = this.i4;
                              addr315:
                              if(this.i6 == 0)
                              {
                                 addr323:
                                 this.i0 = this.i2;
                                 this.i2 = this.i3;
                                 this.i3 = 0;
                                 si32(this.i0,this.i1);
                                 si32(this.i2,this.i1 + 4);
                                 mstate.eax = this.i3;
                              }
                              else
                              {
                                 this.i5 = 0;
                                 this.i0 = li32(this.i0 + 4);
                                 this.i4 = this.i0 >> 31;
                                 this.i2 = __subc(this.i2,this.i0);
                                 this.i3 = __sube(this.i3,this.i4);
                                 si32(this.i2,this.i1);
                                 si32(this.i3,this.i1 + 4);
                                 mstate.eax = this.i5;
                              }
                           }
                        }
                        else
                        {
                           this.i7 = li32(this.i0 + 4);
                           this.i8 = this.i7 >> 31;
                           this.i5 = __subc(this.i5,this.i7);
                           this.i4 = __sube(this.i4,this.i8);
                           if(this.i4 >= 0)
                           {
                              this.i2 = this.i5;
                              this.i3 = this.i4;
                              §§goto(addr315);
                           }
                        }
                        this.i0 = 5;
                        this.i2 = this.i2 | 64;
                        si16(this.i2,this.i3);
                        addr549:
                        si32(this.i0,FSM__ftello);
                        this.i2 = 1;
                        mstate.eax = this.i2;
                     }
                     else
                     {
                        this.i3 = this.i5;
                        this.i5 = this.i6;
                        break;
                     }
                  }
                  else
                  {
                     this.i2 = 0;
                     mstate.esp = mstate.esp - 16;
                     this.i5 = 1;
                     si32(this.i0,mstate.esp);
                     si32(this.i2,mstate.esp + 4);
                     si32(this.i2,mstate.esp + 8);
                     si32(this.i5,mstate.esp + 12);
                     state = 1;
                     mstate.esp = mstate.esp - 4;
                     FSM__ftello.start();
                     return;
                  }
               }
               addr592:
               mstate.esp = mstate.ebp;
               mstate.ebp = li32(mstate.esp);
               mstate.esp = mstate.esp + 4;
               mstate.esp = mstate.esp + 4;
               mstate.gworker = caller;
               return;
            case 1:
               this.i5 = mstate.eax;
               this.i6 = mstate.edx;
               mstate.esp = mstate.esp + 16;
               this.i2 = this.i5 & this.i6;
               if(this.i2 != -1)
               {
                  this.i2 = li16(this.i3);
                  this.i4 = this.i2 & 4;
                  if(this.i4 != 0)
                  {
                     §§goto(addr214);
                  }
                  else
                  {
                     this.i3 = this.i5;
                     this.i5 = this.i6;
                     break;
                  }
               }
               else
               {
                  §§goto(addr63);
               }
               §§goto(addr592);
         }
         this.i4 = this.i5;
         this.i2 = this.i2 & 8;
         if(this.i2 != 0)
         {
            this.i2 = li32(this.i0);
            if(this.i2 != 0)
            {
               this.i5 = 2147483647;
               this.i0 = li32(this.i0 + 16);
               this.i6 = 0;
               this.i2 = this.i2 - this.i0;
               this.i0 = -1;
               this.i0 = __subc(this.i0,this.i2);
               this.i5 = __sube(this.i5,this.i6);
               this.i7 = this.i5 >= this.i4?1:0;
               this.i0 = uint(this.i0) >= uint(this.i3)?1:0;
               this.i5 = this.i5 == this.i4?1:0;
               this.i0 = this.i5 != 0?int(this.i0):int(this.i7);
               if(this.i0 == 0)
               {
                  this.i2 = 84;
                  si32(this.i2,FSM__ftello);
                  §§goto(addr549);
               }
               else
               {
                  this.i0 = 0;
                  this.i2 = __addc(this.i2,this.i3);
                  this.i3 = __adde(this.i6,this.i4);
                  si32(this.i2,this.i1);
                  si32(this.i3,this.i1 + 4);
                  §§goto(addr588);
               }
            }
            §§goto(addr592);
         }
         this.i2 = this.i3;
         this.i3 = this.i4;
         §§goto(addr323);
      }
   }
}
