package damageCalculation.debug
{
   import damageCalculation.FightContext;
   import damageCalculation.fighterManagement.HaxeBuff;
   import damageCalculation.fighterManagement.HaxeFighter;
   import damageCalculation.fighterManagement.PlayerTypeEnum;
   import damageCalculation.spellManagement.HaxeSpell;
   import damageCalculation.spellManagement.HaxeSpellEffect;
   import damageCalculation.spellManagement.Mark;
   import damageCalculation.tools.LinkedListNode;
   import haxe.Log;
   
   public class Debug
   {
      
      public static var INDENTATION:String = "    ";
      
      public static var NBR_INDENTATION:int = 1;
      
      public static var chars:Array = ["maxLifePoints","lifePoints","actionPoints","maxMouvementPoints","movementPoints","strength","vitality","chance","agility","intelligence","wisdom","reflect","maxSummonableCreatures","dodgePALostProbability","dodgePMLostProbability","earthElementResistPercent","fireElementResistPercent","waterElementResistPercent","airElementResistPercent","neutralElementResistPercent","earthElementReduction","fireElementReduction","waterElementReduction","airElementReduction","neutralElementReduction","pvpEarthElementPercentResist","pvpFireElementResistPercent","pvpWaterElementPercentResist","pvpAirElementPercentResist","pvpNeutralElementPercentResist","pvpEarthElementReduction","pvpFireElementReduction","pvpWaterElementReduction","pvpAirElementReduction","pvpNeutralElementReduction","trapBonusPercent","trapBonus","glyphPower","runePower","PAAttack","PMAttack","pushDamageBonus","pushDamageFixedResist","healBonus","criticalHit","invisibilityState","energyPoints","weaponDamagesBonusPercent","damagesBonusPercent","criticalMiss","criticalDamageBonus","criticalDamageReduction","allDamagesBonus","earthDamageBonus","fireDamageBonus","waterDamageBonus","airDamageBonus","neutralDamageBonus","maxBomb","bombCombo","shieldPoints","curPermanentDamages","weaponPower","spellPercentDamages","meleeDamageDonePercent","meleeDamageReceivedPercent","rangedDamageDonePercent","rangedDamageReceivedPercent","spellDamageDonePercent","spellDamageReceivedPercent","permanentDamagePercent","percentResist","incomingPercentDamageMultiplicator","incomingPercentHealMultiplicator","dealtDamagesMultiplicator","weaponDamageDonePercent","weaponDamageReceivedPercent","unlucky","maximizeRoll","confusion"];
       
      
      public function Debug()
      {
      }
      
      public static function traceCasterChars(param1:HaxeFighter) : void
      {
         var _loc4_:* = null as String;
         Log.trace("[",{
            "fileName":"src/main/haxe/damageCalculation/debug/Debug.hx",
            "lineNumber":14,
            "className":"damageCalculation.debug.Debug",
            "methodName":"traceCasterChars"
         });
         var _loc2_:int = 0;
         var _loc3_:Array = Debug.chars;
         while(_loc2_ < int(_loc3_.length))
         {
            _loc4_ = _loc3_[_loc2_];
            _loc2_++;
            if(int(param1.getCharacteristicValue(_loc4_)) != 0)
            {
               Log.trace("    " + "\"" + _loc4_ + "\" => " + int(param1.getCharacteristicValue(_loc4_)) + ",",{
                  "fileName":"src/main/haxe/damageCalculation/debug/Debug.hx",
                  "lineNumber":17,
                  "className":"damageCalculation.debug.Debug",
                  "methodName":"traceCasterChars"
               });
            }
         }
         Log.trace("]",{
            "fileName":"src/main/haxe/damageCalculation/debug/Debug.hx",
            "lineNumber":20,
            "className":"damageCalculation.debug.Debug",
            "methodName":"traceCasterChars"
         });
      }
      
      public static function traceSpell(param1:HaxeSpell) : void
      {
         var _loc5_:int = 0;
         var _loc6_:* = null as HaxeSpellEffect;
         var _loc2_:String = "";
         _loc2_ = _loc2_ + "new MockSpell(\n";
         var _loc3_:Array = param1.getEffects();
         var _loc4_:Array = param1.getCriticalEffects();
         _loc2_ = _loc2_ + ("    " + "    [\n");
         if(_loc3_ != null && int(_loc3_.length) > 0)
         {
            _loc5_ = 0;
            while(_loc5_ < int(_loc3_.length))
            {
               _loc6_ = _loc3_[_loc5_];
               _loc5_++;
               _loc2_ = _loc2_ + Debug.printEffects(_loc6_);
            }
         }
         _loc2_ = _loc2_ + ("    " + "    ],\n");
         _loc2_ = _loc2_ + ("    " + "    [\n");
         if(_loc4_ != null && int(_loc4_.length) > 0)
         {
            _loc5_ = 0;
            while(_loc5_ < int(_loc4_.length))
            {
               _loc6_ = _loc4_[_loc5_];
               _loc5_++;
               _loc2_ = _loc2_ + Debug.printEffects(_loc6_);
            }
         }
         _loc2_ = _loc2_ + ("    " + "    ],\n");
         _loc2_ = _loc2_ + ("    " + "    " + param1.id + "\n    );");
         Log.trace(_loc2_,{
            "fileName":"src/main/haxe/damageCalculation/debug/Debug.hx",
            "lineNumber":44,
            "className":"damageCalculation.debug.Debug",
            "methodName":"traceSpell"
         });
      }
      
      public static function traceTestEnvironment(param1:FightContext, param2:HaxeSpell, param3:Boolean = false, param4:Boolean = false) : String
      {
         var _loc9_:int = 0;
         var _loc11_:* = null as HaxeFighter;
         var _loc12_:* = null as String;
         var _loc13_:* = null as LinkedListNode;
         var _loc14_:* = null as LinkedListNode;
         var _loc15_:* = null as LinkedListNode;
         var _loc16_:int = 0;
         var _loc17_:int = 0;
         var _loc18_:* = null as Mark;
         var _loc5_:String = "public function testAutoTraced()\n";
         _loc5_ = Debug.indent(_loc5_);
         _loc5_ = _loc5_ + "{\n";
         Debug.NBR_INDENTATION = Debug.NBR_INDENTATION + 1;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:Boolean = true;
         _loc9_ = 0;
         var _loc10_:Array = param1.getEveryFighter();
         while(_loc9_ < int(_loc10_.length))
         {
            _loc11_ = _loc10_[_loc9_];
            _loc9_++;
            if(_loc11_.id == param1.originalCaster.id)
            {
               _loc12_ = "caster";
               _loc8_ = false;
            }
            else
            {
               _loc8_ = true;
               if(_loc11_.teamId != param1.originalCaster.teamId)
               {
                  _loc7_++;
                  _loc12_ = "target" + _loc7_;
               }
               else
               {
                  _loc6_++;
                  _loc12_ = "ally" + _loc6_;
               }
            }
            _loc5_ = Debug.indent(_loc5_);
            if(_loc8_)
            {
               _loc5_ = _loc5_ + "var ";
            }
            _loc5_ = _loc5_ + (_loc12_ + " = new MockFighter(");
            Debug.NBR_INDENTATION = Debug.NBR_INDENTATION + 1;
            if(param3)
            {
               _loc5_ = _loc5_ + (Debug.indent("\n") + Debug.printBaseCasterChars(_loc11_));
               _loc5_ = _loc5_ + ",";
            }
            _loc5_ = _loc5_ + (Debug.indent("\n") + Debug.printInfos(_loc11_,param4));
            _loc5_ = _loc5_ + ");\n";
            Debug.NBR_INDENTATION = Debug.NBR_INDENTATION - 1;
            if(_loc11_._buffs.head != null)
            {
               _loc5_ = Debug.indent(_loc5_);
               _loc5_ = _loc5_ + (_loc12_ + ".addBuffs([\n");
               Debug.NBR_INDENTATION = Debug.NBR_INDENTATION + 1;
               _loc13_ = _loc11_._buffs.head;
               while(_loc13_ != null)
               {
                  _loc14_ = _loc13_;
                  _loc13_ = _loc13_.next;
                  _loc15_ = _loc14_;
                  _loc5_ = _loc5_ + Debug.printBuff(_loc15_.item);
                  _loc5_ = _loc5_ + ",\n";
               }
               _loc5_ = Debug.indent(_loc5_);
               Debug.NBR_INDENTATION = Debug.NBR_INDENTATION - 1;
               _loc5_ = _loc5_ + "]); \n";
            }
            _loc5_ = Debug.indent(_loc5_);
            _loc5_ = _loc5_ + (_loc12_ + ".setStartedPositionCell(" + int(_loc11_.getCurrentPositionCell()) + "); \n");
            _loc5_ = Debug.indent(_loc5_);
            _loc5_ = _loc5_ + ("map.addFighter(" + _loc12_ + ");\n" + "\n");
         }
         _loc10_ = param1.map.getMarks();
         if(_loc10_ != null && int(_loc10_.length) > 0)
         {
            _loc9_ = 0;
            _loc16_ = _loc10_.length;
            while(_loc9_ < _loc16_)
            {
               _loc9_++;
               _loc17_ = _loc9_;
               _loc18_ = _loc10_[_loc17_];
               _loc5_ = Debug.indent(_loc5_) + "var mark" + _loc17_ + " = new Mark();\n";
               _loc5_ = Debug.indent(_loc5_) + "mark" + _loc17_ + ".markId = " + _loc18_.markId + ";\n";
               _loc5_ = Debug.indent(_loc5_) + "mark" + _loc17_ + ".setMarkType(" + _loc18_.markType + ");\n";
               _loc5_ = Debug.indent(_loc5_) + "mark" + _loc17_ + ".mainCell = " + _loc18_.mainCell + ";\n";
               _loc5_ = Debug.indent(_loc5_) + "mark" + _loc17_ + ".cells = " + Std.string(_loc18_.cells) + ";\n";
               _loc5_ = Debug.indent(_loc5_) + "mark" + _loc17_ + ".casterId = " + _loc18_.casterId + ";\n";
               _loc5_ = Debug.indent(_loc5_) + "mark" + _loc17_ + ".teamId = " + ("" + _loc18_.teamId) + ";\n";
               _loc5_ = Debug.indent(_loc5_) + "mark" + _loc17_ + ".active = " + ("" + _loc18_.active) + ";\n";
               _loc5_ = Debug.indent(_loc5_) + "mark" + _loc17_ + ".setAssociatedSpell(\n";
               _loc5_ = _loc5_ + Debug.printSpell(_loc18_.associatedSpell);
               _loc5_ = _loc5_ + ");\n";
               _loc5_ = Debug.indent(_loc5_) + "map.addMark(mark" + _loc17_ + ");\n";
            }
         }
         _loc5_ = Debug.indent(_loc5_);
         _loc5_ = _loc5_ + "spell = \n";
         _loc5_ = _loc5_ + Debug.printSpell(param2);
         _loc5_ = _loc5_ + ";\n";
         _loc5_ = Debug.indent(_loc5_);
         _loc5_ = _loc5_ + ("targetedCell = " + param1.targetedCell + ";\n" + "\n");
         _loc5_ = Debug.indent(_loc5_);
         _loc5_ = _loc5_ + "var base = spell.getBaseDamages();\n";
         _loc5_ = Debug.indent(_loc5_);
         _loc5_ = _loc5_ + ("var crit = spell.getCriticalBaseDamages();\n" + "\n");
         _loc5_ = Debug.indent(_loc5_);
         _loc5_ = _loc5_ + ("createExpectedSimpleDamage(target" + _loc7_ + ", base.toArray(), crit.toArray(),false,false,0,null);\n");
         _loc5_ = Debug.indent(_loc5_);
         _loc5_ = _loc5_ + "run();\n";
         Debug.NBR_INDENTATION = Debug.NBR_INDENTATION - 1;
         _loc5_ = Debug.indent(_loc5_);
         _loc5_ = _loc5_ + "}";
         Log.trace(_loc5_,{
            "fileName":"src/main/haxe/damageCalculation/debug/Debug.hx",
            "lineNumber":239,
            "className":"damageCalculation.debug.Debug",
            "methodName":"traceTestEnvironment"
         });
         return _loc5_;
      }
      
      public static function printInfos(param1:HaxeFighter, param2:Boolean = false) : String
      {
         var _loc3_:String = "[";
         _loc3_ = _loc3_ + ("\"TeamId\" => " + Std.string(param1.teamId == 1));
         if(param2)
         {
            _loc3_ = _loc3_ + ",";
            _loc3_ = _loc3_ + ("\"Human\" => " + Std.string(param1.playerType == PlayerTypeEnum.HUMAN) + ", ");
            _loc3_ = _loc3_ + ("\"Carried\" => " + Std.string(Boolean(param1.hasState(8))) + ", ");
            _loc3_ = _loc3_ + ("\"Sidekick\" => " + Std.string(param1.playerType == PlayerTypeEnum.SIDEKICK) + ", ");
            _loc3_ = _loc3_ + ("\"isSummoned\" => " + Std.string(Boolean(param1.data.isSummon())) + ", ");
            _loc3_ = _loc3_ + ("\"isStatic\" => " + ("" + param1.isStaticElement) + ", ");
            _loc3_ = _loc3_ + ("\"breedSwitchPos\" => " + Std.string(Boolean(param1.data.canBreedSwitchPos())) + ", ");
            _loc3_ = _loc3_ + ("\"breedUsePortals\" => " + Std.string(Boolean(param1.data.canBreedUsePortals())) + ", ");
            _loc3_ = _loc3_ + ("\"breedBePushed\" => " + Std.string(Boolean(param1.data.canBreedBePushed())) + ", ");
            _loc3_ = _loc3_ + ("\"breedBeCarried\" => " + Std.string(Boolean(param1.data.canBreedBeCarried())));
         }
         _loc3_ = _loc3_ + "]";
         return _loc3_;
      }
      
      public static function printBaseCasterChars(param1:HaxeFighter) : String
      {
         var _loc5_:* = null as String;
         var _loc2_:String = "[";
         var _loc3_:int = 0;
         var _loc4_:Array = Debug.chars;
         while(_loc3_ < int(_loc4_.length))
         {
            _loc5_ = _loc4_[_loc3_];
            _loc3_++;
            if(int(param1.getCharacteristicValue(_loc5_)) != 0)
            {
               _loc2_ = _loc2_ + ("\"" + _loc5_ + "\" => " + int(param1.data.getBaseCharacteristicValue(_loc5_)) + ", ");
            }
         }
         _loc2_ = _loc2_ + "]";
         return _loc2_;
      }
      
      public static function printBuff(param1:HaxeBuff) : String
      {
         var _loc2_:String = "";
         _loc2_ = Debug.indent(_loc2_);
         _loc2_ = _loc2_ + ("new MockBuff(" + param1.casterId + ",\n");
         Debug.NBR_INDENTATION = Debug.NBR_INDENTATION + 1;
         _loc2_ = Debug.indent(_loc2_);
         _loc2_ = _loc2_ + ("new MockSpell(null,null," + param1.spell.id + "),\n");
         _loc2_ = Debug.indent(_loc2_);
         _loc2_ = _loc2_ + Debug.printEffects(param1.effect);
         _loc2_ = _loc2_ + ")";
         Debug.NBR_INDENTATION = Debug.NBR_INDENTATION - 1;
         return _loc2_;
      }
      
      public static function printEffects(param1:HaxeSpellEffect) : String
      {
         var _loc2_:String = "MockSpellEffect.fromAGT(" + ("" + param1.id) + ", " + param1.level + ", " + param1.order + ", " + param1.actionId + ", " + param1.param1 + ", " + param1.param2 + ", " + param1.param3 + ", " + param1.duration + ", " + ("" + param1.isCritical) + ", " + "\"" + param1.triggers.join("|") + "\", " + "\"" + param1.rawZone + "\", " + "\"" + param1.mask + "\", " + param1.randomWeight + ", " + param1.randomGroup + ", " + ("" + param1.isDispellable) + ", " + param1.delay + ", " + param1.category + ") ";
         return _loc2_;
      }
      
      public static function printSpell(param1:HaxeSpell) : String
      {
         var _loc5_:int = 0;
         var _loc6_:* = null as HaxeSpellEffect;
         var _loc2_:String = "";
         _loc2_ = Debug.indent(_loc2_);
         _loc2_ = _loc2_ + "new MockSpell(\n";
         var _loc3_:Array = param1.getEffects();
         var _loc4_:Array = param1.getCriticalEffects();
         Debug.NBR_INDENTATION = Debug.NBR_INDENTATION + 1;
         _loc2_ = Debug.indent(_loc2_);
         _loc2_ = _loc2_ + "[\n";
         Debug.NBR_INDENTATION = Debug.NBR_INDENTATION + 1;
         if(_loc3_ != null && int(_loc3_.length) > 0)
         {
            _loc5_ = 0;
            while(_loc5_ < int(_loc3_.length))
            {
               _loc6_ = _loc3_[_loc5_];
               _loc5_++;
               _loc2_ = Debug.indent(_loc2_);
               _loc2_ = _loc2_ + (Debug.printEffects(_loc6_) + ",\n");
            }
            _loc2_.substr(0,_loc2_.length - 2);
         }
         Debug.NBR_INDENTATION = Debug.NBR_INDENTATION - 1;
         _loc2_ = Debug.indent(_loc2_);
         _loc2_ = _loc2_ + "],\n";
         _loc2_ = Debug.indent(_loc2_);
         _loc2_ = _loc2_ + "[\n";
         Debug.NBR_INDENTATION = Debug.NBR_INDENTATION + 1;
         if(_loc4_ != null && int(_loc4_.length) > 0)
         {
            _loc5_ = 0;
            while(_loc5_ < int(_loc4_.length))
            {
               _loc6_ = _loc4_[_loc5_];
               _loc5_++;
               _loc2_ = Debug.indent(_loc2_);
               _loc2_ = _loc2_ + (Debug.printEffects(_loc6_) + ",\n");
            }
            _loc2_.substr(0,_loc2_.length - 2);
         }
         Debug.NBR_INDENTATION = Debug.NBR_INDENTATION - 1;
         _loc2_ = Debug.indent(_loc2_);
         _loc2_ = _loc2_ + "],\n";
         _loc2_ = Debug.indent(_loc2_);
         _loc2_ = _loc2_ + (param1.id + ")");
         Debug.NBR_INDENTATION = Debug.NBR_INDENTATION - 1;
         return _loc2_;
      }
      
      public static function indent(param1:String) : String
      {
         var _loc4_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = Debug.NBR_INDENTATION;
         while(_loc2_ < _loc3_)
         {
            _loc2_++;
            _loc4_ = _loc2_;
            param1 = param1 + "    ";
         }
         return param1;
      }
   }
}
