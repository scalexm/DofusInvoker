package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_sort extends Machine
   {
      
      public static const intRegCount:int = 7;
      
      public static const NumberRegCount:int = 0;
       
      
      public var i0:int;
      
      public var i1:int;
      
      public var i2:int;
      
      public var i3:int;
      
      public var i4:int;
      
      public var i5:int;
      
      public var i6:int;
      
      public function FSM_sort()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM_sort = null;
         _loc1_ = new FSM_sort();
         FSM_sort.gworker = _loc1_;
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
               FSM_sort.start();
            case 1:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i2 = FSM_sort;
               if(this.i0 != this.i2)
               {
                  this.i0 = li32(this.i0 + 8);
                  if(this.i0 == 5)
                  {
                     break;
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
               FSM_sort.start();
               return;
            case 2:
               mstate.esp = mstate.esp + 12;
               break;
            case 3:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               mstate.esp = mstate.esp - 8;
               this.i2 = 40;
               si32(this.i1,mstate.esp);
               si32(this.i2,mstate.esp + 4);
               state = 4;
               mstate.esp = mstate.esp - 4;
               FSM_sort.start();
               return;
            case 4:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               if(this.i2 == 0)
               {
                  this.i2 = FSM_sort;
                  mstate.esp = mstate.esp - 12;
                  this.i3 = FSM_sort;
                  si32(this.i1,mstate.esp);
                  si32(this.i2,mstate.esp + 4);
                  si32(this.i3,mstate.esp + 8);
                  state = 5;
                  mstate.esp = mstate.esp - 4;
                  FSM_sort.start();
                  return;
               }
               addr291:
               this.i2 = 2;
               mstate.esp = mstate.esp - 8;
               si32(this.i1,mstate.esp);
               si32(this.i2,mstate.esp + 4);
               mstate.esp = mstate.esp - 4;
               FSM_sort.start();
            case 5:
               mstate.esp = mstate.esp + 12;
               §§goto(addr291);
            case 6:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i3 = FSM_sort;
               if(this.i2 != this.i3)
               {
                  this.i2 = li32(this.i2 + 8);
                  if(this.i2 >= 1)
                  {
                     this.i2 = 2;
                     mstate.esp = mstate.esp - 8;
                     si32(this.i1,mstate.esp);
                     si32(this.i2,mstate.esp + 4);
                     mstate.esp = mstate.esp - 4;
                     FSM_sort.start();
                  }
                  addr561:
                  this.i2 = this.i3;
                  this.i3 = 1;
                  this.i2 = this.i2 + 24;
                  si32(this.i2,this.i5);
                  mstate.esp = mstate.esp - 12;
                  si32(this.i1,mstate.esp);
                  si32(this.i3,mstate.esp + 4);
                  si32(this.i0,mstate.esp + 8);
                  state = 9;
                  mstate.esp = mstate.esp - 4;
                  FSM_sort.start();
                  return;
               }
               this.i2 = li32(this.i1 + 12);
               this.i3 = li32(this.i1 + 8);
               this.i4 = this.i1 + 12;
               this.i5 = this.i1 + 8;
               this.i6 = this.i2 + 24;
               if(uint(this.i3) >= uint(this.i6))
               {
                  this.i3 = this.i2;
               }
               else
               {
                  do
                  {
                     this.i2 = 0;
                     si32(this.i2,this.i3 + 8);
                     this.i3 = this.i3 + 12;
                     si32(this.i3,this.i5);
                     this.i2 = li32(this.i4);
                     this.i6 = this.i2 + 24;
                  }
                  while(uint(this.i3) < uint(this.i6));
                  
                  this.i3 = this.i2;
               }
               §§goto(addr561);
            case 7:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i3 = FSM_sort;
               if(this.i2 != this.i3)
               {
                  this.i2 = li32(this.i2 + 8);
                  if(this.i2 == 6)
                  {
                     addr465:
                     this.i2 = li32(this.i1 + 12);
                     this.i3 = li32(this.i1 + 8);
                     this.i4 = this.i1 + 12;
                     this.i5 = this.i1 + 8;
                     this.i6 = this.i2 + 24;
                     if(uint(this.i3) >= uint(this.i6))
                     {
                        this.i3 = this.i2;
                     }
                     else
                     {
                        do
                        {
                           this.i2 = 0;
                           si32(this.i2,this.i3 + 8);
                           this.i3 = this.i3 + 12;
                           si32(this.i3,this.i5);
                           this.i2 = li32(this.i4);
                           this.i6 = this.i2 + 24;
                        }
                        while(uint(this.i3) < uint(this.i6));
                        
                        this.i3 = this.i2;
                     }
                     §§goto(addr561);
                  }
               }
               this.i2 = 6;
               mstate.esp = mstate.esp - 12;
               this.i3 = 2;
               si32(this.i1,mstate.esp);
               si32(this.i3,mstate.esp + 4);
               si32(this.i2,mstate.esp + 8);
               state = 8;
               mstate.esp = mstate.esp - 4;
               FSM_sort.start();
               return;
            case 8:
               mstate.esp = mstate.esp + 12;
               §§goto(addr465);
            case 9:
               mstate.esp = mstate.esp + 12;
               this.i0 = 0;
               mstate.eax = this.i0;
               mstate.esp = mstate.ebp;
               mstate.ebp = li32(mstate.esp);
               mstate.esp = mstate.esp + 4;
               mstate.esp = mstate.esp + 4;
               mstate.gworker = caller;
               return;
         }
         this.i0 = 1;
         mstate.esp = mstate.esp - 8;
         si32(this.i1,mstate.esp);
         si32(this.i0,mstate.esp + 4);
         state = 3;
         mstate.esp = mstate.esp - 4;
         FSM_sort.start();
      }
   }
}
