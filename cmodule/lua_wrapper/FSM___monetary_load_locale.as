package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.si32;
   import avm2.intrinsics.memory.si8;
   
   public final class FSM___monetary_load_locale extends Machine
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
      
      public function FSM___monetary_load_locale()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM___monetary_load_locale = null;
         _loc1_ = new FSM___monetary_load_locale();
         FSM___monetary_load_locale.gworker = _loc1_;
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
               this.i0 = FSM___monetary_load_locale;
               mstate.esp = mstate.esp - 28;
               this.i1 = li32(mstate.ebp + 8);
               this.i2 = FSM___monetary_load_locale;
               this.i3 = FSM___monetary_load_locale;
               this.i4 = FSM___monetary_load_locale;
               this.i5 = 15;
               this.i6 = 21;
               si32(this.i1,mstate.esp);
               si32(this.i0,mstate.esp + 4);
               si32(this.i2,mstate.esp + 8);
               si32(this.i3,mstate.esp + 12);
               si32(this.i6,mstate.esp + 16);
               si32(this.i5,mstate.esp + 20);
               si32(this.i4,mstate.esp + 24);
               state = 1;
               mstate.esp = mstate.esp - 4;
               FSM___monetary_load_locale.start();
               return;
            case 1:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 28;
               if(this.i0 != -1)
               {
                  this.i1 = 0;
                  si8(this.i1,FSM___monetary_load_locale);
                  if(this.i0 == 0)
                  {
                     this.i1 = li32(FSM___monetary_load_locale + 16);
                     mstate.esp = mstate.esp - 4;
                     si32(this.i1,mstate.esp);
                     mstate.esp = mstate.esp - 4;
                     FSM___monetary_load_locale.start();
                  }
               }
               addr1106:
               mstate.eax = this.i0;
               mstate.esp = mstate.ebp;
               mstate.ebp = li32(mstate.esp);
               mstate.esp = mstate.esp + 4;
               mstate.esp = mstate.esp + 4;
               mstate.gworker = caller;
               return;
            case 2:
               this.i1 = mstate.eax;
               mstate.esp = mstate.esp + 4;
               si32(this.i1,FSM___monetary_load_locale + 16);
               this.i1 = li32(FSM___monetary_load_locale + 28);
               mstate.esp = mstate.esp - 4;
               si32(this.i1,mstate.esp);
               mstate.esp = mstate.esp - 4;
               FSM___monetary_load_locale.start();
            case 3:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 4;
               this.i2 = this.i2 == -1?127:int(this.i2);
               si8(this.i2,this.i1);
               this.i1 = li32(FSM___monetary_load_locale + 32);
               mstate.esp = mstate.esp - 4;
               si32(this.i1,mstate.esp);
               mstate.esp = mstate.esp - 4;
               FSM___monetary_load_locale.start();
            case 4:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 4;
               this.i2 = this.i2 == -1?127:int(this.i2);
               si8(this.i2,this.i1);
               this.i1 = li32(FSM___monetary_load_locale + 36);
               mstate.esp = mstate.esp - 4;
               si32(this.i1,mstate.esp);
               mstate.esp = mstate.esp - 4;
               FSM___monetary_load_locale.start();
            case 5:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 4;
               this.i2 = this.i2 == -1?127:int(this.i2);
               si8(this.i2,this.i1);
               this.i1 = li32(FSM___monetary_load_locale + 40);
               mstate.esp = mstate.esp - 4;
               si32(this.i1,mstate.esp);
               mstate.esp = mstate.esp - 4;
               FSM___monetary_load_locale.start();
            case 6:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 4;
               this.i2 = this.i2 == -1?127:int(this.i2);
               si8(this.i2,this.i1);
               this.i1 = li32(FSM___monetary_load_locale + 44);
               mstate.esp = mstate.esp - 4;
               si32(this.i1,mstate.esp);
               mstate.esp = mstate.esp - 4;
               FSM___monetary_load_locale.start();
            case 7:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 4;
               this.i2 = this.i2 == -1?127:int(this.i2);
               si8(this.i2,this.i1);
               this.i1 = li32(FSM___monetary_load_locale + 48);
               mstate.esp = mstate.esp - 4;
               si32(this.i1,mstate.esp);
               mstate.esp = mstate.esp - 4;
               FSM___monetary_load_locale.start();
            case 8:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 4;
               this.i2 = this.i2 == -1?127:int(this.i2);
               si8(this.i2,this.i1);
               this.i1 = li32(FSM___monetary_load_locale + 52);
               mstate.esp = mstate.esp - 4;
               si32(this.i1,mstate.esp);
               mstate.esp = mstate.esp - 4;
               FSM___monetary_load_locale.start();
            case 9:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 4;
               this.i2 = this.i2 == -1?127:int(this.i2);
               si8(this.i2,this.i1);
               this.i1 = li32(FSM___monetary_load_locale + 56);
               mstate.esp = mstate.esp - 4;
               si32(this.i1,mstate.esp);
               mstate.esp = mstate.esp - 4;
               FSM___monetary_load_locale.start();
            case 10:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 4;
               this.i2 = this.i2 == -1?127:int(this.i2);
               si8(this.i2,this.i1);
               this.i1 = li32(FSM___monetary_load_locale + 60);
               if(this.i1 == 0)
               {
                  this.i1 = li32(FSM___monetary_load_locale + 36);
                  si32(this.i1,FSM___monetary_load_locale + 60);
                  this.i1 = li32(FSM___monetary_load_locale + 64);
                  if(this.i1 != 0)
                  {
                     addr659:
                     mstate.esp = mstate.esp - 4;
                     si32(this.i1,mstate.esp);
                     mstate.esp = mstate.esp - 4;
                     FSM___monetary_load_locale.start();
                  }
                  addr862:
                  this.i1 = li32(FSM___monetary_load_locale + 40);
                  si32(this.i1,FSM___monetary_load_locale + 68);
                  this.i1 = li32(FSM___monetary_load_locale + 72);
                  addr1032:
                  if(this.i1 != 0)
                  {
                     addr888:
                     mstate.esp = mstate.esp - 4;
                     si32(this.i1,mstate.esp);
                     mstate.esp = mstate.esp - 4;
                     FSM___monetary_load_locale.start();
                  }
                  else
                  {
                     addr947:
                     this.i1 = li32(FSM___monetary_load_locale + 48);
                     si32(this.i1,FSM___monetary_load_locale + 72);
                     this.i1 = li32(FSM___monetary_load_locale + 76);
                     addr1135:
                     if(this.i1 != 0)
                     {
                        addr973:
                        mstate.esp = mstate.esp - 4;
                        si32(this.i1,mstate.esp);
                        mstate.esp = mstate.esp - 4;
                        FSM___monetary_load_locale.start();
                     }
                     addr1135:
                     this.i1 = li32(FSM___monetary_load_locale + 56);
                     si32(this.i1,FSM___monetary_load_locale + 80);
                     §§goto(addr1106);
                  }
                  this.i1 = li32(FSM___monetary_load_locale + 52);
                  si32(this.i1,FSM___monetary_load_locale + 76);
                  this.i1 = li32(FSM___monetary_load_locale + 80);
                  if(this.i1 != 0)
                  {
                     addr1058:
                     mstate.esp = mstate.esp - 4;
                     si32(this.i1,mstate.esp);
                     mstate.esp = mstate.esp - 4;
                     FSM___monetary_load_locale.start();
                  }
                  else
                  {
                     §§goto(addr1135);
                  }
                  §§goto(addr1106);
               }
               else
               {
                  mstate.esp = mstate.esp - 4;
                  si32(this.i1,mstate.esp);
                  mstate.esp = mstate.esp - 4;
                  FSM___monetary_load_locale.start();
               }
               addr777:
               this.i1 = li32(FSM___monetary_load_locale + 44);
               si32(this.i1,FSM___monetary_load_locale + 64);
               this.i1 = li32(FSM___monetary_load_locale + 68);
               if(this.i1 != 0)
               {
                  addr803:
                  mstate.esp = mstate.esp - 4;
                  si32(this.i1,mstate.esp);
                  mstate.esp = mstate.esp - 4;
                  FSM___monetary_load_locale.start();
               }
               else
               {
                  §§goto(addr862);
               }
               §§goto(addr947);
            case 11:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 4;
               this.i2 = this.i2 == -1?127:int(this.i2);
               si8(this.i2,this.i1);
               this.i1 = li32(FSM___monetary_load_locale + 68);
               if(this.i1 != 0)
               {
                  §§goto(addr803);
               }
               else
               {
                  §§goto(addr862);
               }
               §§goto(addr947);
            case 12:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 4;
               this.i2 = this.i2 == -1?127:int(this.i2);
               si8(this.i2,this.i1);
               this.i1 = li32(FSM___monetary_load_locale + 64);
               if(this.i1 != 0)
               {
                  §§goto(addr659);
               }
               else
               {
                  §§goto(addr777);
               }
               §§goto(addr862);
            case 13:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 4;
               this.i2 = this.i2 == -1?127:int(this.i2);
               si8(this.i2,this.i1);
               this.i1 = li32(FSM___monetary_load_locale + 72);
               if(this.i1 != 0)
               {
                  §§goto(addr888);
               }
               else
               {
                  §§goto(addr947);
               }
               §§goto(addr1032);
            case 14:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 4;
               this.i2 = this.i2 == -1?127:int(this.i2);
               si8(this.i2,this.i1);
               this.i1 = li32(FSM___monetary_load_locale + 76);
               if(this.i1 != 0)
               {
                  §§goto(addr973);
               }
               else
               {
                  §§goto(addr1032);
               }
               §§goto(addr1135);
            case 15:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 4;
               this.i2 = this.i2 == -1?127:int(this.i2);
               si8(this.i2,this.i1);
               this.i1 = li32(FSM___monetary_load_locale + 80);
               if(this.i1 != 0)
               {
                  §§goto(addr1058);
               }
               else
               {
                  §§goto(addr1135);
               }
               §§goto(addr1106);
            case 16:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 4;
               this.i2 = this.i2 == -1?127:int(this.i2);
               si8(this.i2,this.i1);
               §§goto(addr1106);
         }
      }
   }
}
