package cmodule.lua_wrapper
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.li8;
   import avm2.intrinsics.memory.si32;
   import avm2.intrinsics.memory.si8;
   
   public final class FSM___collate_load_tables extends Machine
   {
      
      public static const intRegCount:int = 10;
      
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
      
      public var i9:int;
      
      public function FSM___collate_load_tables()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:FSM___collate_load_tables = null;
         _loc1_ = new FSM___collate_load_tables();
         FSM___collate_load_tables.gworker = _loc1_;
      }
      
      override public final function work() : void
      {
         switch(state)
         {
            case 0:
               mstate.esp = mstate.esp - 4;
               si32(mstate.ebp,mstate.esp);
               mstate.ebp = mstate.esp;
               mstate.esp = mstate.esp - 1044;
               this.i0 = mstate.ebp + -1040;
               this.i1 = li32(mstate.ebp + 8);
               this.i2 = li8(this.i1);
               this.i3 = mstate.ebp + -1024;
               this.i4 = this.i1;
               if(this.i2 != 67)
               {
                  this.i5 = FSM___collate_load_tables;
                  this.i6 = this.i2;
               }
               else
               {
                  this.i5 = FSM___collate_load_tables;
                  this.i6 = 0;
                  this.i7 = this.i2;
                  while(true)
                  {
                     this.i8 = this.i5 + this.i6;
                     this.i8 = this.i8 + 1;
                     this.i7 = this.i7 & 255;
                     if(this.i7 != 0)
                     {
                        this.i7 = this.i4 + this.i6;
                        this.i7 = li8(this.i7 + 1);
                        this.i8 = li8(this.i8);
                        this.i6 = this.i6 + 1;
                        if(this.i7 == this.i8)
                        {
                           continue;
                        }
                        this.i5 = FSM___collate_load_tables;
                        this.i5 = this.i5 + this.i6;
                        this.i6 = this.i7;
                     }
                     break;
                  }
                  this.i0 = 0;
                  si8(this.i0,FSM___collate_load_tables);
                  this.i0 = 1;
                  mstate.eax = this.i0;
                  break;
               }
               this.i5 = li8(this.i5);
               this.i6 = this.i6 & 255;
               if(this.i6 != this.i5)
               {
                  this.i5 = this.i2 & 255;
                  if(this.i5 != 80)
                  {
                     this.i5 = FSM___collate_load_tables;
                     this.i6 = this.i2;
                     addr275:
                     this.i5 = li8(this.i5);
                     this.i6 = this.i6 & 255;
                     if(this.i6 != this.i5)
                     {
                        this.i5 = li8(FSM___collate_load_tables);
                        this.i6 = this.i2 & 255;
                        if(this.i6 != this.i5)
                        {
                           this.i5 = FSM___collate_load_tables;
                        }
                        else
                        {
                           this.i5 = FSM___collate_load_tables;
                           this.i6 = 0;
                           while(true)
                           {
                              this.i7 = this.i5 + this.i6;
                              this.i7 = this.i7 + 1;
                              this.i2 = this.i2 & 255;
                              if(this.i2 != 0)
                              {
                                 this.i2 = this.i4 + this.i6;
                                 this.i2 = li8(this.i2 + 1);
                                 this.i7 = li8(this.i7);
                                 this.i6 = this.i6 + 1;
                                 if(this.i2 == this.i7)
                                 {
                                    continue;
                                 }
                                 this.i5 = FSM___collate_load_tables;
                                 this.i5 = this.i5 + this.i6;
                              }
                              break;
                           }
                           this.i0 = 1;
                           si8(this.i0,FSM___collate_load_tables);
                        }
                        this.i5 = li8(this.i5);
                        this.i2 = this.i2 & 255;
                        if(this.i2 == this.i5)
                        {
                           §§goto(addr422);
                        }
                        else
                        {
                           this.i2 = mstate.ebp + -1024;
                           this.i5 = li32(FSM___collate_load_tables);
                           this.i6 = li8(this.i5);
                           si8(this.i6,mstate.ebp + -1024);
                           if(this.i6 != 0)
                           {
                              this.i6 = 1;
                              while(true)
                              {
                                 this.i7 = this.i5 + this.i6;
                                 this.i7 = li8(this.i7);
                                 this.i8 = this.i3 + this.i6;
                                 si8(this.i7,this.i8);
                                 this.i6 = this.i6 + 1;
                                 if(this.i7 != 0)
                                 {
                                    continue;
                                 }
                                 break;
                              }
                           }
                           this.i5 = li8(this.i2);
                           if(this.i5 != 0)
                           {
                              this.i5 = this.i3;
                              while(true)
                              {
                                 this.i6 = li8(this.i5 + 1);
                                 this.i5 = this.i5 + 1;
                                 this.i7 = this.i5;
                                 if(this.i6 != 0)
                                 {
                                    this.i5 = this.i7;
                                    continue;
                                 }
                                 break;
                              }
                           }
                           else
                           {
                              this.i5 = this.i2;
                           }
                           this.i6 = mstate.ebp + -1024;
                           this.i5 = this.i5 - this.i3;
                           this.i7 = 47;
                           this.i8 = 0;
                           this.i5 = this.i6 + this.i5;
                           si8(this.i7,this.i5);
                           si8(this.i8,this.i5 + 1);
                           this.i5 = li8(this.i2);
                           if(this.i5 != 0)
                           {
                              this.i5 = this.i3;
                              while(true)
                              {
                                 this.i6 = li8(this.i5 + 1);
                                 this.i5 = this.i5 + 1;
                                 this.i7 = this.i5;
                                 if(this.i6 != 0)
                                 {
                                    this.i5 = this.i7;
                                    continue;
                                 }
                                 break;
                              }
                           }
                           else
                           {
                              this.i5 = this.i2;
                           }
                           this.i6 = 0;
                           while(true)
                           {
                              this.i7 = this.i4 + this.i6;
                              this.i7 = li8(this.i7);
                              this.i8 = this.i5 + this.i6;
                              si8(this.i7,this.i8);
                              this.i6 = this.i6 + 1;
                              if(this.i7 != 0)
                              {
                                 continue;
                              }
                              break;
                           }
                           this.i5 = li8(this.i2);
                           if(this.i5 != 0)
                           {
                              this.i5 = this.i3;
                              while(true)
                              {
                                 this.i6 = li8(this.i5 + 1);
                                 this.i5 = this.i5 + 1;
                                 this.i7 = this.i5;
                                 if(this.i6 != 0)
                                 {
                                    this.i5 = this.i7;
                                    continue;
                                 }
                                 break;
                              }
                           }
                           else
                           {
                              this.i5 = this.i2;
                           }
                           this.i6 = mstate.ebp + -1024;
                           this.i3 = this.i5 - this.i3;
                           this.i3 = this.i6 + this.i3;
                           this.i5 = FSM___collate_load_tables;
                           this.i6 = 12;
                           memcpy(this.i3,this.i5,this.i6);
                           this.i3 = li8(FSM___collate_load_tables + 2);
                           mstate.esp = mstate.esp - 16;
                           this.i5 = 114;
                           this.i6 = 0;
                           si32(this.i2,mstate.esp);
                           si32(this.i5,mstate.esp + 4);
                           si32(this.i6,mstate.esp + 8);
                           si32(this.i3,mstate.esp + 12);
                           state = 22;
                           mstate.esp = mstate.esp - 4;
                           FSM___collate_load_tables.start();
                           return;
                        }
                     }
                     §§goto(addr2453);
                  }
                  else
                  {
                     this.i5 = FSM___collate_load_tables;
                     this.i6 = 0;
                     this.i7 = this.i2;
                     while(true)
                     {
                        this.i8 = this.i5 + this.i6;
                        this.i8 = this.i8 + 1;
                        this.i7 = this.i7 & 255;
                        if(this.i7 != 0)
                        {
                           this.i7 = this.i4 + this.i6;
                           this.i7 = li8(this.i7 + 1);
                           this.i8 = li8(this.i8);
                           this.i6 = this.i6 + 1;
                           if(this.i7 == this.i8)
                           {
                              continue;
                           }
                           this.i5 = FSM___collate_load_tables;
                           this.i5 = this.i5 + this.i6;
                           this.i6 = this.i7;
                           §§goto(addr275);
                        }
                     }
                  }
               }
               §§goto(addr293);
            case 1:
               this.i1 = mstate.eax;
               mstate.esp = mstate.esp + 4;
               si32(this.i0,FSM___collate_load_tables);
               addr1346:
               this.i0 = -1;
               §§goto(addr2453);
            case 2:
               this.i1 = mstate.eax;
               mstate.esp = mstate.esp + 16;
               if(this.i1 != 1)
               {
                  this.i1 = -1;
                  this.i4 = li32(FSM___collate_load_tables);
                  mstate.esp = mstate.esp - 4;
                  si32(this.i2,mstate.esp);
                  state = 3;
                  mstate.esp = mstate.esp - 4;
                  FSM___collate_load_tables.start();
                  return;
               }
               this.i1 = FSM___collate_load_tables;
               this.i4 = 4;
               this.i0 = this.i1;
               this.i1 = this.i4;
               log(this.i1,mstate.gworker.stringFromPtr(this.i0));
               mstate.esp = mstate.esp - 4;
               si32(this.i2,mstate.esp);
               state = 4;
               mstate.esp = mstate.esp - 4;
               FSM___collate_load_tables.start();
               return;
            case 3:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 4;
               si32(this.i4,FSM___collate_load_tables);
               addr1070:
               mstate.eax = this.i1;
               break;
            case 4:
               this.i1 = mstate.eax;
               mstate.esp = mstate.esp + 4;
               this.i1 = 79;
               si32(this.i1,FSM___collate_load_tables);
               this.i1 = -1;
               §§goto(addr1070);
            case 5:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               if(this.i0 == 0)
               {
                  addr2751:
                  this.i0 = -1;
                  this.i1 = li32(FSM___collate_load_tables);
                  mstate.esp = mstate.esp - 4;
                  si32(this.i2,mstate.esp);
                  state = 24;
                  mstate.esp = mstate.esp - 4;
                  FSM___collate_load_tables.start();
                  return;
               }
               this.i3 = 2048;
               mstate.esp = mstate.esp - 8;
               this.i5 = 0;
               si32(this.i5,mstate.esp);
               si32(this.i3,mstate.esp + 4);
               state = 6;
               mstate.esp = mstate.esp - 4;
               FSM___collate_load_tables.start();
               return;
            case 6:
               this.i3 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i5 = this.i3;
               if(this.i3 == 0)
               {
                  this.i1 = 0;
                  this.i3 = li32(FSM___collate_load_tables);
                  mstate.esp = mstate.esp - 8;
                  si32(this.i0,mstate.esp);
                  si32(this.i1,mstate.esp + 4);
                  state = 7;
                  mstate.esp = mstate.esp - 4;
                  FSM___collate_load_tables.start();
                  return;
               }
               this.i6 = 2000;
               mstate.esp = mstate.esp - 8;
               this.i7 = 0;
               si32(this.i7,mstate.esp);
               si32(this.i6,mstate.esp + 4);
               state = 9;
               mstate.esp = mstate.esp - 4;
               FSM___collate_load_tables.start();
               return;
            case 7:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               mstate.esp = mstate.esp - 4;
               si32(this.i2,mstate.esp);
               state = 8;
               mstate.esp = mstate.esp - 4;
               FSM___collate_load_tables.start();
               return;
            case 8:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 4;
               si32(this.i3,FSM___collate_load_tables);
               §§goto(addr1346);
            case 9:
               this.i6 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               this.i7 = this.i6;
               if(this.i6 == 0)
               {
                  this.i1 = 0;
                  this.i4 = li32(FSM___collate_load_tables);
                  mstate.esp = mstate.esp - 8;
                  si32(this.i0,mstate.esp);
                  si32(this.i1,mstate.esp + 4);
                  state = 10;
                  mstate.esp = mstate.esp - 4;
                  FSM___collate_load_tables.start();
                  return;
               }
               this.i8 = 1;
               mstate.esp = mstate.esp - 16;
               this.i9 = 2560;
               si32(this.i0,mstate.esp);
               si32(this.i9,mstate.esp + 4);
               si32(this.i8,mstate.esp + 8);
               si32(this.i2,mstate.esp + 12);
               state = 13;
               mstate.esp = mstate.esp - 4;
               FSM___collate_load_tables.start();
               return;
            case 10:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               mstate.esp = mstate.esp - 8;
               si32(this.i3,mstate.esp);
               addr1469:
               si32(this.i1,mstate.esp + 4);
               state = 11;
               mstate.esp = mstate.esp - 4;
               FSM___collate_load_tables.start();
               return;
            case 11:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               mstate.esp = mstate.esp - 4;
               si32(this.i2,mstate.esp);
               state = 12;
               mstate.esp = mstate.esp - 4;
               FSM___collate_load_tables.start();
               return;
            case 12:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 4;
               si32(this.i4,FSM___collate_load_tables);
               addr1345:
               §§goto(addr1346);
            case 13:
               this.i8 = mstate.eax;
               mstate.esp = mstate.esp + 16;
               if(this.i8 != 1)
               {
                  addr1607:
                  this.i1 = 0;
                  this.i4 = li32(FSM___collate_load_tables);
                  mstate.esp = mstate.esp - 8;
                  si32(this.i0,mstate.esp);
                  si32(this.i1,mstate.esp + 4);
                  state = 14;
                  mstate.esp = mstate.esp - 4;
                  FSM___collate_load_tables.start();
                  return;
               }
               this.i8 = 1;
               mstate.esp = mstate.esp - 16;
               this.i9 = 2048;
               si32(this.i3,mstate.esp);
               si32(this.i9,mstate.esp + 4);
               si32(this.i8,mstate.esp + 8);
               si32(this.i2,mstate.esp + 12);
               state = 16;
               mstate.esp = mstate.esp - 4;
               FSM___collate_load_tables.start();
               return;
            case 14:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               mstate.esp = mstate.esp - 8;
               si32(this.i3,mstate.esp);
               si32(this.i1,mstate.esp + 4);
               state = 15;
               mstate.esp = mstate.esp - 4;
               FSM___collate_load_tables.start();
               return;
            case 15:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               mstate.esp = mstate.esp - 8;
               si32(this.i6,mstate.esp);
               §§goto(addr1469);
            case 16:
               this.i8 = mstate.eax;
               mstate.esp = mstate.esp + 16;
               if(this.i8 != 1)
               {
                  addr1606:
                  §§goto(addr1607);
               }
               else
               {
                  this.i8 = 100;
                  mstate.esp = mstate.esp - 16;
                  this.i9 = 20;
                  si32(this.i6,mstate.esp);
                  si32(this.i9,mstate.esp + 4);
                  si32(this.i8,mstate.esp + 8);
                  si32(this.i2,mstate.esp + 12);
                  state = 17;
                  mstate.esp = mstate.esp - 4;
                  FSM___collate_load_tables.start();
                  return;
               }
            case 17:
               this.i8 = mstate.eax;
               mstate.esp = mstate.esp + 16;
               if(this.i8 != 100)
               {
                  §§goto(addr1606);
               }
               else
               {
                  mstate.esp = mstate.esp - 4;
                  si32(this.i2,mstate.esp);
                  state = 18;
                  mstate.esp = mstate.esp - 4;
                  FSM___collate_load_tables.start();
                  return;
               }
            case 18:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 4;
               this.i1 = li8(this.i1);
               si8(this.i1,FSM___collate_load_tables);
               if(this.i1 != 0)
               {
                  this.i1 = FSM___collate_load_tables;
                  this.i2 = 1;
                  while(true)
                  {
                     this.i3 = this.i4 + this.i2;
                     this.i3 = li8(this.i3);
                     this.i6 = this.i1 + this.i2;
                     si8(this.i3,this.i6);
                     this.i2 = this.i2 + 1;
                     if(this.i3 != 0)
                     {
                        continue;
                     }
                     break;
                  }
               }
               this.i1 = li32(FSM___collate_load_tables);
               if(this.i1 != 0)
               {
                  this.i2 = 0;
                  mstate.esp = mstate.esp - 8;
                  si32(this.i1,mstate.esp);
                  si32(this.i2,mstate.esp + 4);
                  state = 19;
                  mstate.esp = mstate.esp - 4;
                  FSM___collate_load_tables.start();
                  return;
               }
               addr1993:
               si32(this.i0,FSM___collate_load_tables);
               this.i0 = li32(FSM___collate_load_tables);
               if(this.i0 != 0)
               {
                  this.i1 = 0;
                  mstate.esp = mstate.esp - 8;
                  si32(this.i0,mstate.esp);
                  si32(this.i1,mstate.esp + 4);
                  state = 20;
                  mstate.esp = mstate.esp - 4;
                  FSM___collate_load_tables.start();
                  return;
               }
               addr2052:
               this.i0 = 0;
               si32(this.i5,FSM___collate_load_tables);
               this.i1 = this.i0;
               while(true)
               {
                  this.i2 = this.i1;
                  this.i3 = this.i0;
                  this.i4 = FSM___collate_load_tables;
                  this.i5 = li32(FSM___collate_load_tables);
                  this.i6 = 4;
                  this.i8 = 0;
                  this.i0 = this.i4;
                  this.i1 = this.i6;
                  log(this.i1,mstate.gworker.stringFromPtr(this.i0));
                  this.i0 = this.i5 + this.i2;
                  si32(this.i8,this.i0);
                  this.i5 = li32(FSM___collate_load_tables);
                  this.i0 = this.i4;
                  this.i1 = this.i6;
                  log(this.i1,mstate.gworker.stringFromPtr(this.i0));
                  this.i0 = this.i5 + this.i2;
                  si32(this.i8,this.i0 + 4);
                  this.i0 = this.i2 + 8;
                  this.i2 = this.i3 + 1;
                  if(this.i2 != 256)
                  {
                     this.i1 = this.i0;
                     this.i0 = this.i2;
                     continue;
                  }
                  break;
               }
               this.i0 = li32(FSM___collate_load_tables);
               if(this.i0 != 0)
               {
                  this.i1 = 0;
                  mstate.esp = mstate.esp - 8;
                  si32(this.i0,mstate.esp);
                  si32(this.i1,mstate.esp + 4);
                  state = 21;
                  mstate.esp = mstate.esp - 4;
                  FSM___collate_load_tables.start();
                  return;
               }
               this.i0 = 0;
               si32(this.i7,FSM___collate_load_tables);
               this.i7 = this.i0;
               addr2262:
               while(true)
               {
                  this.i2 = this.i0;
                  this.i3 = FSM___collate_load_tables;
                  this.i4 = li32(FSM___collate_load_tables);
                  this.i5 = 4;
                  this.i6 = 0;
                  this.i0 = this.i3;
                  this.i1 = this.i5;
                  log(this.i1,mstate.gworker.stringFromPtr(this.i0));
                  this.i0 = this.i4 + this.i7;
                  si32(this.i6,this.i0 + 12);
                  this.i4 = li32(FSM___collate_load_tables);
                  this.i0 = this.i3;
                  this.i1 = this.i5;
                  log(this.i1,mstate.gworker.stringFromPtr(this.i0));
                  this.i0 = this.i4 + this.i7;
                  si32(this.i6,this.i0 + 16);
                  this.i0 = this.i7 + 20;
                  this.i1 = this.i2 + 1;
                  if(this.i1 <= 99)
                  {
                     this.i7 = this.i0;
                     this.i0 = this.i1;
                     continue;
                  }
                  break;
               }
               this.i0 = 0;
               si8(this.i0,FSM___collate_load_tables);
               this.i1 = li32(FSM___collate_load_tables);
               while(true)
               {
                  this.i2 = li8(this.i1);
                  if(this.i2 == this.i0)
                  {
                     this.i2 = li8(this.i1 + 1);
                     if(this.i2 != 0)
                     {
                        break;
                     }
                     this.i1 = this.i1 + 10;
                     this.i0 = this.i0 + 1;
                     if(this.i0 <= 255)
                     {
                        continue;
                     }
                     addr2443:
                     this.i0 = 1;
                     si8(this.i0,FSM___collate_load_tables);
                     this.i0 = 0;
                     §§goto(addr2453);
                  }
                  break;
               }
               this.i0 = 1;
               si8(this.i0,FSM___collate_load_tables);
               §§goto(addr2443);
            case 19:
               this.i1 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               §§goto(addr1993);
            case 20:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               §§goto(addr2052);
            case 21:
               this.i0 = mstate.eax;
               mstate.esp = mstate.esp + 8;
               si32(this.i7,FSM___collate_load_tables);
               this.i7 = this.i1;
               this.i0 = this.i1;
               §§goto(addr2262);
            case 22:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 16;
               if(this.i2 != 0)
               {
                  this.i3 = 1;
                  mstate.esp = mstate.esp - 16;
                  this.i5 = 10;
                  this.i6 = mstate.ebp + -1040;
                  si32(this.i6,mstate.esp);
                  si32(this.i5,mstate.esp + 4);
                  si32(this.i3,mstate.esp + 8);
                  si32(this.i2,mstate.esp + 12);
                  state = 23;
                  mstate.esp = mstate.esp - 4;
                  FSM___collate_load_tables.start();
                  return;
               }
               §§goto(addr1345);
            case 23:
               this.i3 = mstate.eax;
               mstate.esp = mstate.esp + 16;
               if(this.i3 != 1)
               {
                  §§goto(addr2751);
               }
               else
               {
                  this.i3 = li8(this.i6);
                  if(this.i3 != 49)
                  {
                     this.i5 = FSM___collate_load_tables;
                     this.i6 = this.i3;
                  }
                  else
                  {
                     this.i5 = FSM___collate_load_tables;
                     this.i6 = 0;
                     this.i7 = this.i3;
                     while(true)
                     {
                        this.i8 = this.i5 + this.i6;
                        this.i8 = this.i8 + 1;
                        this.i7 = this.i7 & 255;
                        if(this.i7 == 0)
                        {
                           break;
                        }
                        this.i7 = this.i0 + this.i6;
                        this.i7 = li8(this.i7 + 1);
                        this.i8 = li8(this.i8);
                        this.i6 = this.i6 + 1;
                        if(this.i7 == this.i8)
                        {
                           continue;
                        }
                        this.i5 = FSM___collate_load_tables;
                        this.i6 = this.i5 + this.i6;
                        this.i5 = this.i6;
                        this.i6 = this.i7;
                     }
                     this.i6 = 0;
                     this.i0 = this.i6;
                     if(this.i0 <= -1)
                     {
                        this.i0 = 79;
                        mstate.esp = mstate.esp - 4;
                        si32(this.i2,mstate.esp);
                        state = 1;
                        mstate.esp = mstate.esp - 4;
                        FSM___collate_load_tables.start();
                        return;
                     }
                     if(this.i0 != 0)
                     {
                        this.i1 = 1;
                        mstate.esp = mstate.esp - 16;
                        this.i4 = 4;
                        this.i0 = mstate.ebp + -1044;
                        si32(this.i0,mstate.esp);
                        si32(this.i4,mstate.esp + 4);
                        si32(this.i1,mstate.esp + 8);
                        si32(this.i2,mstate.esp + 12);
                        state = 2;
                        mstate.esp = mstate.esp - 4;
                        FSM___collate_load_tables.start();
                        return;
                     }
                     this.i0 = 2560;
                     mstate.esp = mstate.esp - 8;
                     this.i3 = 0;
                     si32(this.i3,mstate.esp);
                     si32(this.i0,mstate.esp + 4);
                     state = 5;
                     mstate.esp = mstate.esp - 4;
                     FSM___collate_load_tables.start();
                     return;
                  }
                  this.i5 = li8(this.i5);
                  this.i6 = this.i6 & 255;
                  if(this.i6 != this.i5)
                  {
                     this.i6 = this.i3 & 255;
                     if(this.i6 != 49)
                     {
                        this.i0 = FSM___collate_load_tables;
                     }
                     else
                     {
                        this.i6 = FSM___collate_load_tables;
                        this.i5 = 0;
                        while(true)
                        {
                           this.i7 = this.i6 + this.i5;
                           this.i7 = this.i7 + 1;
                           this.i3 = this.i3 & 255;
                           if(this.i3 != 0)
                           {
                              this.i3 = this.i0 + this.i5;
                              this.i3 = li8(this.i3 + 1);
                              this.i7 = li8(this.i7);
                              this.i5 = this.i5 + 1;
                              if(this.i3 == this.i7)
                              {
                                 continue;
                              }
                              this.i0 = FSM___collate_load_tables;
                              this.i0 = this.i0 + this.i5;
                           }
                           break;
                        }
                        this.i6 = 1;
                     }
                     this.i6 = this.i0;
                     this.i0 = this.i3;
                     this.i6 = li8(this.i6);
                     this.i0 = this.i0 & 255;
                     if(this.i0 != this.i6)
                     {
                        this.i6 = -1;
                     }
                     else
                     {
                        §§goto(addr889);
                     }
                  }
                  else
                  {
                     §§goto(addr694);
                  }
                  §§goto(addr892);
               }
            case 24:
               this.i2 = mstate.eax;
               mstate.esp = mstate.esp + 4;
               si32(this.i1,FSM___collate_load_tables);
               §§goto(addr2453);
         }
         mstate.esp = mstate.ebp;
         mstate.ebp = li32(mstate.esp);
         mstate.esp = mstate.esp + 4;
         mstate.esp = mstate.esp + 4;
         mstate.gworker = caller;
      }
   }
}
