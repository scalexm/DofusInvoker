package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.li8;
   import avm2.intrinsics.memory.si32;
   import avm2.intrinsics.memory.si8;
   import avm2.intrinsics.memory.sxi8;
   
   public final class FSM__fmt extends Machine
   {
      
      public static const intRegCount:int = 32;
      
      public static const NumberRegCount:int = 0;
       
      
      public var i21:int;
      
      public var i30:int;
      
      public var i31:int;
      
      public var i10:int;
      
      public var i11:int;
      
      public var i12:int;
      
      public var i13:int;
      
      public var i14:int;
      
      public var i15:int;
      
      public var i17:int;
      
      public var i19:int;
      
      public var i16:int;
      
      public var i18:int;
      
      public var i0:int;
      
      public var i1:int;
      
      public var i22:int;
      
      public var i3:int;
      
      public var i4:int;
      
      public var i5:int;
      
      public var i6:int;
      
      public var i7:int;
      
      public var i8:int;
      
      public var i2:int;
      
      public var i23:int;
      
      public var i24:int;
      
      public var i25:int;
      
      public var i26:int;
      
      public var i27:int;
      
      public var i20:int;
      
      public var i9:int;
      
      public var i28:int;
      
      public var i29:int;
      
      public function FSM__fmt()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM__fmt = null;
         _loc1_ = new FSM__fmt();
         FSM__fmt.gworker = _loc1_;
      }
      
      override public final function work() : void
      {
         switch(state)
         {
            case 0:
               mstate.esp = mstate.esp - 4;
               si32(mstate.ebp,mstate.esp);
               mstate.ebp = mstate.esp;
               mstate.esp = mstate.esp - 848;
               this.i0 = FSM__fmt;
               this.i1 = li32(mstate.ebp + 8);
               this.i2 = li32(FSM__fmt);
               this.i3 = li8(this.i1);
               this.i4 = FSM__fmt;
               this.i5 = li32(mstate.ebp + 12);
               this.i6 = li32(mstate.ebp + 16);
               this.i7 = li32(mstate.ebp + 20);
               this.i0 = this.i2 == 0?int(this.i0):int(this.i4);
               si32(this.i0,mstate.ebp + -774);
               this.i0 = mstate.ebp + -416;
               si32(this.i0,mstate.ebp + -783);
               this.i0 = mstate.ebp + -400;
               si32(this.i0,mstate.ebp + -792);
               this.i0 = mstate.ebp + -384;
               si32(this.i0,mstate.ebp + -801);
               this.i0 = mstate.ebp + -368;
               si32(this.i0,mstate.ebp + -810);
               this.i0 = mstate.ebp + -352;
               si32(this.i0,mstate.ebp + -819);
               this.i0 = mstate.ebp + -336;
               si32(this.i0,mstate.ebp + -828);
               this.i0 = mstate.ebp + -320;
               si32(this.i0,mstate.ebp + -837);
               this.i0 = mstate.ebp + -304;
               si32(this.i0,mstate.ebp + -846);
               this.i0 = mstate.ebp + -288;
               this.i2 = mstate.ebp + -272;
               this.i4 = mstate.ebp + -256;
               this.i8 = mstate.ebp + -240;
               this.i9 = mstate.ebp + -224;
               this.i10 = mstate.ebp + -208;
               this.i11 = mstate.ebp + -192;
               this.i12 = mstate.ebp + -176;
               this.i13 = mstate.ebp + -160;
               this.i14 = mstate.ebp + -144;
               this.i15 = mstate.ebp + -128;
               this.i16 = mstate.ebp + -112;
               this.i17 = mstate.ebp + -96;
               this.i18 = mstate.ebp + -80;
               this.i19 = mstate.ebp + -64;
               this.i20 = mstate.ebp + -48;
               this.i21 = mstate.ebp + -32;
               this.i22 = mstate.ebp + -16;
               if(this.i3 == 0)
               {
                  this.i0 = this.i5;
                  mstate.eax = this.i0;
                  mstate.esp = mstate.ebp;
                  mstate.ebp = li32(mstate.esp);
                  mstate.esp = mstate.esp + 4;
                  mstate.esp = mstate.esp + 4;
                  mstate.gworker = caller;
                  return;
               }
               this.i3 = mstate.ebp + -32;
               si32(this.i3,mstate.ebp + -468);
               this.i3 = mstate.ebp + -224;
               si32(this.i3,mstate.ebp + -477);
               this.i3 = mstate.ebp + -256;
               si32(this.i3,mstate.ebp + -486);
               this.i3 = mstate.ebp + -368;
               si32(this.i3,mstate.ebp + -495);
               this.i3 = mstate.ebp + -400;
               si32(this.i3,mstate.ebp + -504);
               this.i3 = mstate.ebp + -384;
               si32(this.i3,mstate.ebp + -513);
               this.i3 = mstate.ebp + -352;
               si32(this.i3,mstate.ebp + -522);
               this.i3 = mstate.ebp + -336;
               si32(this.i3,mstate.ebp + -531);
               this.i3 = mstate.ebp + -320;
               si32(this.i3,mstate.ebp + -540);
               this.i3 = mstate.ebp + -304;
               si32(this.i3,mstate.ebp + -549);
               this.i3 = mstate.ebp + -288;
               si32(this.i3,mstate.ebp + -558);
               this.i3 = mstate.ebp + -272;
               si32(this.i3,mstate.ebp + -567);
               this.i3 = mstate.ebp + -240;
               si32(this.i3,mstate.ebp + -576);
               this.i3 = mstate.ebp + -208;
               si32(this.i3,mstate.ebp + -585);
               this.i3 = mstate.ebp + -192;
               si32(this.i3,mstate.ebp + -594);
               this.i3 = mstate.ebp + -176;
               si32(this.i3,mstate.ebp + -603);
               this.i3 = mstate.ebp + -160;
               si32(this.i3,mstate.ebp + -612);
               this.i3 = mstate.ebp + -144;
               si32(this.i3,mstate.ebp + -621);
               this.i3 = mstate.ebp + -128;
               si32(this.i3,mstate.ebp + -630);
               this.i3 = mstate.ebp + -112;
               si32(this.i3,mstate.ebp + -639);
               this.i3 = mstate.ebp + -96;
               si32(this.i3,mstate.ebp + -648);
               this.i3 = mstate.ebp + -80;
               si32(this.i3,mstate.ebp + -657);
               this.i3 = mstate.ebp + -64;
               si32(this.i3,mstate.ebp + -666);
               this.i3 = mstate.ebp + -48;
               si32(this.i3,mstate.ebp + -675);
               this.i3 = mstate.ebp + -16;
               si32(this.i3,mstate.ebp + -684);
               this.i3 = li32(mstate.ebp + -774);
               this.i3 = this.i3 + 156;
               si32(this.i3,mstate.ebp + -693);
               this.i3 = mstate.ebp + -416;
               si32(this.i3,mstate.ebp + -702);
               this.i3 = mstate.ebp + -464;
               si32(this.i3,mstate.ebp + -711);
               this.i3 = li32(mstate.ebp + -774);
               this.i3 = this.i3 + 228;
               si32(this.i3,mstate.ebp + -720);
               this.i3 = li32(mstate.ebp + -774);
               this.i3 = this.i3 + 164;
               si32(this.i3,mstate.ebp + -729);
               this.i3 = li32(mstate.ebp + -774);
               this.i3 = this.i3 + 168;
               si32(this.i3,mstate.ebp + -738);
               this.i3 = li32(mstate.ebp + -774);
               this.i3 = this.i3 + 160;
               si32(this.i3,mstate.ebp + -747);
               this.i3 = li32(mstate.ebp + -774);
               this.i3 = this.i3 + 152;
               si32(this.i3,mstate.ebp + -756);
               this.i3 = li32(mstate.ebp + -774);
               this.i3 = this.i3 + 172;
               si32(this.i3,mstate.ebp + -765);
               this.i3 = this.i5;
               continue loop0;
            case 1:
               this.i5 = mstate.eax;
               mstate.esp = mstate.esp + 16;
               this.i1 = this.i1 + 2;
               break;
            case 2:
               this.i5 = mstate.eax;
               mstate.esp = mstate.esp + 16;
               this.i1 = this.i1 + 2;
               break;
            case 3:
               mstate.esp = mstate.esp + 12;
               if(uint(this.i3) >= uint(this.i6))
               {
                  this.i5 = this.i3;
               }
               else
               {
                  this.i5 = 0;
                  while(true)
                  {
                     this.i27 = this.i11 + this.i5;
                     this.i27 = li8(this.i27);
                     this.i3 = this.i23 + this.i5;
                     si8(this.i27,this.i3);
                     if(this.i27 == 0)
                     {
                        this.i5 = this.i23 + this.i5;
                        break;
                     }
                     this.i5 = this.i5 + 1;
                     this.i27 = this.i23 + this.i5;
                     if(uint(this.i27) < uint(this.i6))
                     {
                        continue;
                     }
                     this.i5 = this.i23 + this.i5;
                     break;
                  }
               }
               this.i1 = this.i1 + 2;
               break;
            case 4:
               mstate.esp = mstate.esp + 12;
               if(uint(this.i3) >= uint(this.i6))
               {
                  this.i5 = this.i3;
               }
               else
               {
                  this.i5 = 0;
                  while(true)
                  {
                     this.i25 = this.i20 + this.i5;
                     this.i25 = li8(this.i25);
                     this.i27 = this.i23 + this.i5;
                     si8(this.i25,this.i27);
                     if(this.i25 == 0)
                     {
                        this.i5 = this.i23 + this.i5;
                        break;
                     }
                     this.i5 = this.i5 + 1;
                     this.i25 = this.i23 + this.i5;
                     if(uint(this.i25) < uint(this.i6))
                     {
                        continue;
                     }
                     this.i5 = this.i23 + this.i5;
                     break;
                  }
               }
               this.i1 = this.i1 + 2;
               break;
            case 5:
               mstate.esp = mstate.esp + 12;
               if(uint(this.i3) >= uint(this.i6))
               {
                  this.i5 = this.i3;
               }
               else
               {
                  this.i5 = 0;
                  while(true)
                  {
                     this.i27 = this.i13 + this.i5;
                     this.i27 = li8(this.i27);
                     this.i3 = this.i23 + this.i5;
                     si8(this.i27,this.i3);
                     if(this.i27 == 0)
                     {
                        this.i5 = this.i23 + this.i5;
                        break;
                     }
                     this.i5 = this.i5 + 1;
                     this.i27 = this.i23 + this.i5;
                     if(uint(this.i27) < uint(this.i6))
                     {
                        continue;
                     }
                     this.i5 = this.i23 + this.i5;
                     break;
                  }
               }
               this.i1 = this.i1 + 2;
               break;
            case 6:
               mstate.esp = mstate.esp + 12;
               if(uint(this.i3) >= uint(this.i6))
               {
                  this.i5 = this.i3;
               }
               else
               {
                  this.i5 = 0;
                  while(true)
                  {
                     this.i27 = li32(mstate.ebp + -810);
                     this.i27 = this.i27 + this.i5;
                     this.i27 = li8(this.i27);
                     this.i3 = this.i23 + this.i5;
                     si8(this.i27,this.i3);
                     if(this.i27 == 0)
                     {
                        this.i5 = this.i23 + this.i5;
                        break;
                     }
                     this.i5 = this.i5 + 1;
                     this.i27 = this.i23 + this.i5;
                     if(uint(this.i27) < uint(this.i6))
                     {
                        continue;
                     }
                     this.i5 = this.i23 + this.i5;
                     break;
                  }
               }
               this.i1 = this.i1 + 2;
               break;
            case 7:
               mstate.esp = mstate.esp + 12;
               if(uint(this.i3) >= uint(this.i6))
               {
                  this.i5 = this.i3;
               }
               else
               {
                  this.i5 = 0;
                  while(true)
                  {
                     this.i25 = this.i22 + this.i5;
                     this.i25 = li8(this.i25);
                     this.i27 = this.i23 + this.i5;
                     si8(this.i25,this.i27);
                     if(this.i25 == 0)
                     {
                        this.i5 = this.i23 + this.i5;
                        break;
                     }
                     this.i5 = this.i5 + 1;
                     this.i25 = this.i23 + this.i5;
                     if(uint(this.i25) < uint(this.i6))
                     {
                        continue;
                     }
                     this.i5 = this.i23 + this.i5;
                     break;
                  }
               }
               this.i1 = this.i1 + 2;
               break;
            case 8:
               this.i25 = mstate.eax;
               mstate.esp = mstate.esp + 16;
               this.i27 = li32(this.i7);
               if(this.i27 >= 1)
               {
                  this.i1 = this.i25;
                  break loop3;
               }
               this.i5 = 1;
               si32(this.i5,this.i7);
               this.i1 = this.i1 + 2;
               this.i5 = this.i25;
               break;
            case 9:
               mstate.esp = mstate.esp + 12;
               if(uint(this.i3) >= uint(this.i6))
               {
                  this.i5 = this.i3;
               }
               else
               {
                  this.i5 = 0;
                  while(true)
                  {
                     this.i27 = this.i19 + this.i5;
                     this.i27 = li8(this.i27);
                     this.i3 = this.i23 + this.i5;
                     si8(this.i27,this.i3);
                     if(this.i27 == 0)
                     {
                        this.i5 = this.i23 + this.i5;
                        break;
                     }
                     this.i5 = this.i5 + 1;
                     this.i27 = this.i23 + this.i5;
                     if(uint(this.i27) < uint(this.i6))
                     {
                        continue;
                     }
                     this.i5 = this.i23 + this.i5;
                     break;
                  }
               }
               this.i1 = this.i1 + 2;
               break;
            case 10:
               this.i5 = mstate.eax;
               mstate.esp = mstate.esp + 16;
               this.i1 = this.i1 + 2;
               break;
            case 11:
               mstate.esp = mstate.esp + 12;
               if(uint(this.i3) >= uint(this.i6))
               {
                  this.i5 = this.i3;
               }
               else
               {
                  this.i5 = 0;
                  while(true)
                  {
                     this.i27 = this.i18 + this.i5;
                     this.i27 = li8(this.i27);
                     this.i3 = this.i23 + this.i5;
                     si8(this.i27,this.i3);
                     if(this.i27 == 0)
                     {
                        this.i5 = this.i23 + this.i5;
                        break;
                     }
                     this.i5 = this.i5 + 1;
                     this.i27 = this.i23 + this.i5;
                     if(uint(this.i27) < uint(this.i6))
                     {
                        continue;
                     }
                     this.i5 = this.i23 + this.i5;
                     break;
                  }
               }
               this.i1 = this.i1 + 2;
               break;
            case 12:
               mstate.esp = mstate.esp + 12;
               if(uint(this.i3) >= uint(this.i6))
               {
                  this.i5 = this.i3;
               }
               else
               {
                  this.i5 = 0;
                  while(true)
                  {
                     this.i27 = this.i17 + this.i5;
                     this.i27 = li8(this.i27);
                     this.i3 = this.i23 + this.i5;
                     si8(this.i27,this.i3);
                     if(this.i27 == 0)
                     {
                        this.i5 = this.i23 + this.i5;
                        break;
                     }
                     this.i5 = this.i5 + 1;
                     this.i27 = this.i23 + this.i5;
                     if(uint(this.i27) < uint(this.i6))
                     {
                        continue;
                     }
                     this.i5 = this.i23 + this.i5;
                     break;
                  }
               }
               this.i1 = this.i1 + 2;
               break;
            case 13:
               mstate.esp = mstate.esp + 12;
               if(uint(this.i3) >= uint(this.i6))
               {
                  this.i5 = this.i3;
               }
               else
               {
                  this.i5 = 0;
                  while(true)
                  {
                     this.i27 = this.i16 + this.i5;
                     this.i27 = li8(this.i27);
                     this.i3 = this.i23 + this.i5;
                     si8(this.i27,this.i3);
                     if(this.i27 == 0)
                     {
                        this.i5 = this.i23 + this.i5;
                        break;
                     }
                     this.i5 = this.i5 + 1;
                     this.i27 = this.i23 + this.i5;
                     if(uint(this.i27) < uint(this.i6))
                     {
                        continue;
                     }
                     this.i5 = this.i23 + this.i5;
                     break;
                  }
               }
               this.i1 = this.i1 + 2;
               break;
            case 14:
               mstate.esp = mstate.esp + 12;
               if(uint(this.i3) >= uint(this.i6))
               {
                  this.i5 = this.i3;
               }
               else
               {
                  this.i5 = 0;
                  while(true)
                  {
                     this.i27 = this.i15 + this.i5;
                     this.i27 = li8(this.i27);
                     this.i3 = this.i23 + this.i5;
                     si8(this.i27,this.i3);
                     if(this.i27 == 0)
                     {
                        this.i5 = this.i23 + this.i5;
                        break;
                     }
                     this.i5 = this.i5 + 1;
                     this.i27 = this.i23 + this.i5;
                     if(uint(this.i27) < uint(this.i6))
                     {
                        continue;
                     }
                     this.i5 = this.i23 + this.i5;
                     break;
                  }
               }
               this.i1 = this.i1 + 2;
               break;
            case 15:
               mstate.esp = mstate.esp + 12;
               if(uint(this.i3) >= uint(this.i6))
               {
                  this.i5 = this.i3;
               }
               else
               {
                  this.i5 = 0;
                  while(true)
                  {
                     this.i27 = this.i14 + this.i5;
                     this.i27 = li8(this.i27);
                     this.i3 = this.i23 + this.i5;
                     si8(this.i27,this.i3);
                     if(this.i27 == 0)
                     {
                        this.i5 = this.i23 + this.i5;
                        break;
                     }
                     this.i5 = this.i5 + 1;
                     this.i27 = this.i23 + this.i5;
                     if(uint(this.i27) < uint(this.i6))
                     {
                        continue;
                     }
                     this.i5 = this.i23 + this.i5;
                     break;
                  }
               }
               this.i1 = this.i1 + 2;
               break;
            case 16:
               mstate.esp = mstate.esp + 12;
               if(uint(this.i3) >= uint(this.i6))
               {
                  this.i5 = this.i3;
               }
               else
               {
                  this.i5 = 0;
                  while(true)
                  {
                     this.i27 = this.i12 + this.i5;
                     this.i27 = li8(this.i27);
                     this.i3 = this.i23 + this.i5;
                     si8(this.i27,this.i3);
                     if(this.i27 == 0)
                     {
                        this.i5 = this.i23 + this.i5;
                        break;
                     }
                     this.i5 = this.i5 + 1;
                     this.i27 = this.i23 + this.i5;
                     if(uint(this.i27) < uint(this.i6))
                     {
                        continue;
                     }
                     this.i5 = this.i23 + this.i5;
                     break;
                  }
               }
               this.i1 = this.i1 + 2;
               break;
            case 17:
               mstate.esp = mstate.esp + 12;
               if(uint(this.i3) >= uint(this.i6))
               {
                  this.i5 = this.i3;
               }
               else
               {
                  this.i5 = 0;
                  while(true)
                  {
                     this.i27 = this.i10 + this.i5;
                     this.i27 = li8(this.i27);
                     this.i3 = this.i23 + this.i5;
                     si8(this.i27,this.i3);
                     if(this.i27 == 0)
                     {
                        this.i5 = this.i23 + this.i5;
                        break;
                     }
                     this.i5 = this.i5 + 1;
                     this.i27 = this.i23 + this.i5;
                     if(uint(this.i27) < uint(this.i6))
                     {
                        continue;
                     }
                     this.i5 = this.i23 + this.i5;
                     break;
                  }
               }
               this.i1 = this.i1 + 2;
               break;
            case 18:
               this.i5 = mstate.eax;
               mstate.esp = mstate.esp + 16;
               this.i1 = this.i1 + 2;
               break;
            case 19:
               this.i5 = mstate.eax;
               mstate.esp = mstate.esp + 16;
               this.i1 = this.i1 + 2;
               break;
            case 20:
               mstate.esp = mstate.esp + 12;
               if(uint(this.i3) >= uint(this.i6))
               {
                  this.i5 = this.i3;
               }
               else
               {
                  this.i5 = 0;
                  while(true)
                  {
                     this.i27 = this.i8 + this.i5;
                     this.i27 = li8(this.i27);
                     this.i3 = this.i23 + this.i5;
                     si8(this.i27,this.i3);
                     if(this.i27 == 0)
                     {
                        this.i5 = this.i23 + this.i5;
                        break;
                     }
                     this.i5 = this.i5 + 1;
                     this.i27 = this.i23 + this.i5;
                     if(uint(this.i27) < uint(this.i6))
                     {
                        continue;
                     }
                     this.i5 = this.i23 + this.i5;
                     break;
                  }
               }
               this.i1 = this.i1 + 2;
               break;
            case 21:
               mstate.esp = mstate.esp - 4;
               this.i5 = mstate.ebp + -464;
               si32(this.i5,mstate.esp);
               mstate.esp = mstate.esp - 4;
               FSM__fmt.start();
            case 22:
               this.i5 = mstate.eax;
               mstate.esp = mstate.esp + 4;
               mstate.esp = mstate.esp - 12;
               this.i27 = FSM__fmt;
               this.i26 = li32(mstate.ebp + -702);
               si32(this.i26,mstate.esp);
               si32(this.i27,mstate.esp + 4);
               si32(this.i5,mstate.esp + 8);
               state = 23;
               mstate.esp = mstate.esp - 4;
               FSM__fmt.start();
               return;
            case 23:
               mstate.esp = mstate.esp + 12;
               if(uint(this.i3) >= uint(this.i6))
               {
                  this.i5 = this.i3;
               }
               else
               {
                  this.i5 = 0;
                  while(true)
                  {
                     this.i27 = li32(mstate.ebp + -783);
                     this.i27 = this.i27 + this.i5;
                     this.i27 = li8(this.i27);
                     this.i3 = this.i23 + this.i5;
                     si8(this.i27,this.i3);
                     if(this.i27 == 0)
                     {
                        this.i5 = this.i23 + this.i5;
                        break;
                     }
                     this.i5 = this.i5 + 1;
                     this.i27 = this.i23 + this.i5;
                     if(uint(this.i27) < uint(this.i6))
                     {
                        continue;
                     }
                     this.i5 = this.i23 + this.i5;
                     break;
                  }
               }
               this.i1 = this.i1 + 2;
               break;
            case 24:
               this.i5 = mstate.eax;
               mstate.esp = mstate.esp + 16;
               this.i1 = this.i1 + 2;
               break;
            case 25:
               mstate.esp = mstate.esp + 12;
               if(uint(this.i3) >= uint(this.i6))
               {
                  this.i5 = this.i3;
               }
               else
               {
                  this.i5 = 0;
                  while(true)
                  {
                     this.i27 = this.i2 + this.i5;
                     this.i27 = li8(this.i27);
                     this.i3 = this.i23 + this.i5;
                     si8(this.i27,this.i3);
                     if(this.i27 == 0)
                     {
                        this.i5 = this.i23 + this.i5;
                        break;
                     }
                     this.i5 = this.i5 + 1;
                     this.i27 = this.i23 + this.i5;
                     if(uint(this.i27) < uint(this.i6))
                     {
                        continue;
                     }
                     this.i5 = this.i23 + this.i5;
                     break;
                  }
               }
               this.i1 = this.i1 + 2;
               break;
            case 26:
               mstate.esp = mstate.esp + 12;
               if(uint(this.i3) >= uint(this.i6))
               {
                  this.i5 = this.i3;
               }
               else
               {
                  this.i5 = 0;
                  while(true)
                  {
                     this.i27 = this.i0 + this.i5;
                     this.i27 = li8(this.i27);
                     this.i3 = this.i23 + this.i5;
                     si8(this.i27,this.i3);
                     if(this.i27 == 0)
                     {
                        this.i5 = this.i23 + this.i5;
                        break;
                     }
                     this.i5 = this.i5 + 1;
                     this.i27 = this.i23 + this.i5;
                     if(uint(this.i27) < uint(this.i6))
                     {
                        continue;
                     }
                     this.i5 = this.i23 + this.i5;
                     break;
                  }
               }
               this.i1 = this.i1 + 2;
               break;
            case 27:
               mstate.esp = mstate.esp + 12;
               if(uint(this.i3) >= uint(this.i6))
               {
                  this.i5 = this.i3;
               }
               else
               {
                  this.i5 = 0;
                  while(true)
                  {
                     this.i27 = li32(mstate.ebp + -846);
                     this.i27 = this.i27 + this.i5;
                     this.i27 = li8(this.i27);
                     this.i3 = this.i23 + this.i5;
                     si8(this.i27,this.i3);
                     if(this.i27 == 0)
                     {
                        this.i5 = this.i23 + this.i5;
                        break;
                     }
                     this.i5 = this.i5 + 1;
                     this.i27 = this.i23 + this.i5;
                     if(uint(this.i27) < uint(this.i6))
                     {
                        continue;
                     }
                     this.i5 = this.i23 + this.i5;
                     break;
                  }
               }
               this.i1 = this.i1 + 2;
               break;
            case 28:
               mstate.esp = mstate.esp + 12;
               if(uint(this.i3) >= uint(this.i6))
               {
                  this.i5 = this.i3;
               }
               else
               {
                  this.i5 = 0;
                  while(true)
                  {
                     this.i26 = li32(mstate.ebp + -828);
                     this.i26 = this.i26 + this.i5;
                     this.i26 = li8(this.i26);
                     this.i27 = this.i23 + this.i5;
                     si8(this.i26,this.i27);
                     if(this.i26 == 0)
                     {
                        this.i5 = this.i23 + this.i5;
                        break;
                     }
                     this.i5 = this.i5 + 1;
                     this.i26 = this.i23 + this.i5;
                     if(uint(this.i26) < uint(this.i6))
                     {
                        continue;
                     }
                     this.i5 = this.i23 + this.i5;
                     break;
                  }
               }
               this.i1 = this.i1 + 2;
               break;
            case 29:
               mstate.esp = mstate.esp + 12;
               if(uint(this.i3) >= uint(this.i6))
               {
                  this.i5 = this.i3;
               }
               else
               {
                  this.i5 = 0;
                  while(true)
                  {
                     this.i26 = li32(mstate.ebp + -837);
                     this.i26 = this.i26 + this.i5;
                     this.i26 = li8(this.i26);
                     this.i27 = this.i23 + this.i5;
                     si8(this.i26,this.i27);
                     if(this.i26 == 0)
                     {
                        this.i5 = this.i23 + this.i5;
                        break;
                     }
                     this.i5 = this.i5 + 1;
                     this.i26 = this.i23 + this.i5;
                     if(uint(this.i26) < uint(this.i6))
                     {
                        continue;
                     }
                     this.i5 = this.i23 + this.i5;
                     break;
                  }
               }
               this.i1 = this.i1 + 2;
               break;
            case 30:
               mstate.esp = mstate.esp + 12;
               if(uint(this.i3) >= uint(this.i6))
               {
                  this.i5 = this.i3;
               }
               else
               {
                  this.i5 = 0;
                  while(true)
                  {
                     this.i27 = li32(mstate.ebp + -819);
                     this.i27 = this.i27 + this.i5;
                     this.i27 = li8(this.i27);
                     this.i3 = this.i23 + this.i5;
                     si8(this.i27,this.i3);
                     if(this.i27 == 0)
                     {
                        this.i5 = this.i23 + this.i5;
                        break;
                     }
                     this.i5 = this.i5 + 1;
                     this.i27 = this.i23 + this.i5;
                     if(uint(this.i27) < uint(this.i6))
                     {
                        continue;
                     }
                     this.i5 = this.i23 + this.i5;
                     break;
                  }
               }
               this.i1 = this.i1 + 2;
               break;
            case 31:
               this.i5 = mstate.eax;
               mstate.esp = mstate.esp + 16;
               this.i1 = this.i1 + 2;
               break;
            case 32:
               mstate.esp = mstate.esp + 12;
               if(uint(this.i3) >= uint(this.i6))
               {
                  this.i5 = this.i3;
               }
               else
               {
                  this.i5 = 0;
                  while(true)
                  {
                     this.i27 = li32(mstate.ebp + -801);
                     this.i27 = this.i27 + this.i5;
                     this.i27 = li8(this.i27);
                     this.i3 = this.i23 + this.i5;
                     si8(this.i27,this.i3);
                     if(this.i27 == 0)
                     {
                        this.i5 = this.i23 + this.i5;
                        break;
                     }
                     this.i5 = this.i5 + 1;
                     this.i27 = this.i23 + this.i5;
                     if(uint(this.i27) < uint(this.i6))
                     {
                        continue;
                     }
                     this.i5 = this.i23 + this.i5;
                     break;
                  }
               }
               this.i1 = this.i1 + 2;
               break;
            case 33:
               mstate.esp = mstate.esp + 12;
               if(uint(this.i3) >= uint(this.i6))
               {
                  this.i5 = this.i3;
               }
               else
               {
                  this.i5 = 0;
                  while(true)
                  {
                     this.i27 = li32(mstate.ebp + -792);
                     this.i27 = this.i27 + this.i5;
                     this.i27 = li8(this.i27);
                     this.i3 = this.i23 + this.i5;
                     si8(this.i27,this.i3);
                     if(this.i27 == 0)
                     {
                        this.i5 = this.i23 + this.i5;
                        break;
                     }
                     this.i5 = this.i5 + 1;
                     this.i27 = this.i23 + this.i5;
                     if(uint(this.i27) < uint(this.i6))
                     {
                        continue;
                     }
                     this.i5 = this.i23 + this.i5;
                     break;
                  }
               }
               this.i1 = this.i1 + 2;
               break;
            case 34:
               this.i5 = mstate.eax;
               mstate.esp = mstate.esp + 16;
               this.i1 = this.i1 + 2;
               break;
            case 35:
               this.i27 = mstate.eax;
               mstate.esp = mstate.esp + 16;
               this.i3 = li32(mstate.ebp + -404);
               if(this.i3 == 3)
               {
                  this.i3 = 2;
                  si32(this.i3,mstate.ebp + -404);
               }
               this.i26 = li32(this.i7);
               if(this.i26 >= this.i3)
               {
                  this.i1 = this.i27;
                  break loop3;
               }
               si32(this.i3,this.i7);
               this.i1 = this.i1 + 2;
               this.i5 = this.i27;
               break;
            case 36:
               mstate.esp = mstate.esp + 12;
               if(uint(this.i3) >= uint(this.i6))
               {
                  this.i5 = this.i3;
               }
               else
               {
                  this.i5 = 0;
                  while(true)
                  {
                     this.i27 = this.i4 + this.i5;
                     this.i27 = li8(this.i27);
                     this.i3 = this.i23 + this.i5;
                     si8(this.i27,this.i3);
                     if(this.i27 == 0)
                     {
                        this.i5 = this.i23 + this.i5;
                        break;
                     }
                     this.i5 = this.i5 + 1;
                     this.i27 = this.i23 + this.i5;
                     if(uint(this.i27) < uint(this.i6))
                     {
                        continue;
                     }
                     this.i5 = this.i23 + this.i5;
                     break;
                  }
               }
               this.i1 = this.i1 + 2;
               break;
            case 37:
               mstate.esp = mstate.esp + 12;
               if(uint(this.i3) >= uint(this.i6))
               {
                  this.i5 = this.i3;
               }
               else
               {
                  this.i5 = 0;
                  while(true)
                  {
                     this.i27 = this.i9 + this.i5;
                     this.i27 = li8(this.i27);
                     this.i3 = this.i23 + this.i5;
                     si8(this.i27,this.i3);
                     if(this.i27 == 0)
                     {
                        this.i5 = this.i23 + this.i5;
                        break;
                     }
                     this.i5 = this.i5 + 1;
                     this.i27 = this.i23 + this.i5;
                     if(uint(this.i27) < uint(this.i6))
                     {
                        continue;
                     }
                     this.i5 = this.i23 + this.i5;
                     break;
                  }
               }
               this.i1 = this.i1 + 2;
               break;
            case 38:
               mstate.esp = mstate.esp + 12;
               this.i5 = this.i27;
               if(uint(this.i27) >= uint(this.i6))
               {
                  this.i5 = this.i27;
               }
               else
               {
                  this.i27 = 0;
                  while(true)
                  {
                     this.i3 = this.i21 + this.i27;
                     this.i3 = li8(this.i3);
                     this.i26 = this.i5 + this.i27;
                     si8(this.i3,this.i26);
                     if(this.i3 == 0)
                     {
                        this.i5 = this.i5 + this.i27;
                        break;
                     }
                     this.i27 = this.i27 + 1;
                     this.i3 = this.i5 + this.i27;
                     if(uint(this.i3) < uint(this.i6))
                     {
                        continue;
                     }
                     this.i5 = this.i5 + this.i27;
                     break;
                  }
               }
               this.i1 = this.i1 + 2;
         }
         while(true)
         {
            this.i3 = this.i5;
            this.i5 = li8(this.i1);
            if(this.i5 != 0)
            {
               continue loop0;
            }
            break loop0;
         }
      }
   }
}
