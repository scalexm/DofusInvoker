package damageCalculation
{
   import damageCalculation.damageManagement.DamageRange;
   import damageCalculation.damageManagement.DamageReceiver;
   import damageCalculation.damageManagement.DamageSender;
   import damageCalculation.damageManagement.EffectOutput;
   import damageCalculation.damageManagement.PushUtils;
   import damageCalculation.damageManagement.TargetManagement;
   import damageCalculation.damageManagement.Teleport;
   import damageCalculation.fighterManagement.HaxeBuff;
   import damageCalculation.fighterManagement.HaxeFighter;
   import damageCalculation.fighterManagement.PlayerTypeEnum;
   import damageCalculation.spellManagement.HaxeSpell;
   import damageCalculation.spellManagement.HaxeSpellEffect;
   import damageCalculation.spellManagement.Mark;
   import damageCalculation.spellManagement.RandomGroup;
   import damageCalculation.spellManagement.RunningEffect;
   import damageCalculation.spellManagement.SpellManager;
   import damageCalculation.tools.Interval;
   import damageCalculation.tools.LinkedList;
   import damageCalculation.tools.LinkedListNode;
   import haxe.IMap;
   import haxe.ds.ArraySort;
   import haxe.ds.IntMap;
   import haxe.ds.List;
   import haxe.ds.ObjectMap;
   import haxe.ds._IntMap.IntMapValuesIterator;
   import mapTools.MapTools;
   import mapTools.SpellZone;
   import tools.ActionIdHelper;
   import tools.FpUtils;
   import tools.HaxeLogger;
   import tools.LoggerInterface;
   
   public class DamageCalculator
   {
      
      public static var ALLOW_SPLASH_DEGRESSION:Boolean = true;
      
      public static var dataInterface:DamageCalculationInterface;
      
      public static var logger:LoggerInterface;
      
      public static var loopCountIterations:int = 0;
      
      public static var MAX_LOOP_ITERATIONS:int = 500;
       
      
      public function DamageCalculator()
      {
      }
      
      public static function damageComputation(param1:HaxeFighter, param2:HaxeSpell, param3:int, param4:IMapInfo, param5:int, param6:int, param7:Boolean = false, param8:Boolean = false) : Array
      {
         var _loc10_:int = 0;
         var _loc11_:* = null as Array;
         var _loc12_:* = null as HaxeFighter;
         DamageCalculator.loopCountIterations = 0;
         var _loc9_:FightContext = new FightContext(param3,param4,param5,param1,null,param6);
         if(!!param2.needsFreeCell && _loc9_.getFighterFromCell(_loc9_.targetedCell) != null || !!param2.needsTakenCell && _loc9_.getFighterFromCell(_loc9_.targetedCell) == null)
         {
            return [];
         }
         if(!param8 || param1.isUnlucky() || int(param2.getCriticalEffects().length) == 0)
         {
            DamageCalculator.executeSpell(_loc9_,param1,param2,false,null,param7);
            _loc10_ = 0;
            _loc11_ = _loc9_.fighters;
            while(_loc10_ < int(_loc11_.length))
            {
               _loc12_ = _loc11_[_loc10_];
               _loc10_++;
               _loc12_.savePendingEffects();
            }
         }
         if(!param1.isUnlucky() && ((!!param7 && param2.criticalHitProbability > 0 || param8) && int(param2.getCriticalEffects().length) != 0))
         {
            if(param7)
            {
               _loc10_ = 0;
               _loc11_ = _loc9_.fighters;
               while(_loc10_ < int(_loc11_.length))
               {
                  _loc12_ = _loc11_[_loc10_];
                  _loc10_++;
                  _loc12_.resetToInitialState();
               }
               _loc9_.inMovement = false;
               _loc9_.triggeredMarks = [];
            }
            DamageCalculator.loopCountIterations = 0;
            DamageCalculator.executeSpell(_loc9_,param1,param2,true,null,param7);
            _loc10_ = 0;
            _loc11_ = _loc9_.fighters;
            while(_loc10_ < int(_loc11_.length))
            {
               _loc12_ = _loc11_[_loc10_];
               _loc10_++;
               _loc12_.savePendingEffects();
            }
         }
         return _loc9_.getAffectedFighters();
      }
      
      public static function executeSpell(param1:FightContext, param2:HaxeFighter, param3:HaxeSpell, param4:Boolean, param5:RunningEffect, param6:Boolean = false, param7:Boolean = false) : void
      {
         var _loc8_:* = null as RunningEffect;
         var _loc9_:* = null as Array;
         var _loc12_:int = 0;
         var _loc13_:* = null as HaxeSpellEffect;
         var _loc14_:* = null as HaxeFighter;
         var _loc15_:* = null as Array;
         var _loc16_:* = null as Array;
         var _loc17_:* = null as IMap;
         var _loc18_:int = 0;
         var _loc19_:* = null;
         var _loc20_:* = null as RandomGroup;
         var _loc21_:* = null as List;
         if(!param2.isAlive())
         {
            return;
         }
         if(param5 == null && (param3.criticalHitProbability == 0 || int(param3.getCriticalEffects().length) == 0))
         {
            param4 = false;
         }
         if(!param4 || param5 != null || int(param3.getCriticalEffects().length) == 0)
         {
            _loc9_ = param3.getEffects();
         }
         else
         {
            _loc9_ = param3.getCriticalEffects();
         }
         var _loc10_:IMap = new IntMap();
         var _loc11_:IMap = new IntMap();
         _loc12_ = 0;
         while(_loc12_ < int(_loc9_.length))
         {
            _loc13_ = _loc9_[_loc12_];
            _loc12_++;
            _loc14_ = param5 != null?param5.triggeringFighter:null;
            _loc15_ = TargetManagement.getEffectTargets(param1,param2,param3,_loc13_,_loc14_);
            _loc16_ = TargetManagement.getAdditionalTargets(param1,param2,_loc13_,_loc14_,_loc15_);
            _loc15_ = _loc15_.concat(_loc16_);
            _loc10_.h[int(_loc13_.id)] = _loc15_;
            _loc11_.h[int(_loc13_.id)] = _loc16_;
         }
         _loc12_ = 0;
         while(_loc12_ < int(_loc9_.length))
         {
            _loc13_ = _loc9_[_loc12_];
            _loc12_++;
            if(_loc13_.randomWeight <= 0)
            {
               _loc8_ = new RunningEffect(param2,param3,_loc13_);
               _loc8_.setParentEffect(param5);
               _loc8_.forceCritical = param4 || _loc13_.isCritical;
               DamageCalculator.computeEffect(param1,_loc8_,param6,_loc10_.h[int(_loc13_.id)],_loc11_.h[int(_loc13_.id)],param7);
            }
         }
         if(!!param3.hasAtLeastOneRandomEffect() && _loc9_ != null)
         {
            _loc17_ = RandomGroup.createGroups(_loc9_);
            _loc12_ = RandomGroup.totalWeight(_loc17_);
            _loc18_ = 0;
            _loc15_ = param1.fighters;
            while(_loc18_ < int(_loc15_.length))
            {
               _loc14_ = _loc15_[_loc18_];
               _loc18_++;
               _loc14_.save();
            }
            _loc19_ = new IntMapValuesIterator(_loc17_.h);
            while(_loc19_.hasNext())
            {
               _loc20_ = _loc19_.next();
               _loc18_ = 0;
               _loc15_ = _loc20_.effects;
               while(_loc18_ < int(_loc15_.length))
               {
                  _loc13_ = _loc15_[_loc18_];
                  _loc18_++;
                  if(SpellManager.isInstantaneousSpellEffect(_loc13_))
                  {
                     _loc8_ = new RunningEffect(param2,param3,_loc13_);
                     _loc8_.setParentEffect(param5);
                     _loc8_.forceCritical = param4 || _loc13_.isCritical;
                     _loc8_.probability = int(_loc20_.weight / _loc12_ * 100);
                     DamageCalculator.computeEffect(param1,_loc8_,param6,_loc10_.h[int(_loc13_.id)],_loc11_.h[int(_loc13_.id)]);
                  }
               }
               _loc18_ = 0;
               _loc15_ = param1.fighters;
               while(_loc18_ < int(_loc15_.length))
               {
                  _loc14_ = _loc15_[_loc18_];
                  _loc18_++;
                  _loc21_ = _loc14_.getEffectsDeltaFromSave();
                  if(_loc21_ != null)
                  {
                     if(_loc14_.totalEffects != null)
                     {
                        _loc14_.totalEffects = FpUtils.listConcat_damageCalculation_damageManagement_EffectOutput(_loc14_.totalEffects,_loc21_);
                     }
                     else
                     {
                        _loc14_.totalEffects = _loc21_;
                     }
                  }
                  if(!_loc14_.load())
                  {
                     _loc14_.savePendingEffects();
                     _loc14_.resetToInitialState();
                  }
               }
            }
         }
      }
      
      public static function computeEffect(param1:FightContext, param2:RunningEffect, param3:Boolean, param4:Array, param5:Array, param6:Boolean = false) : void
      {
         var _loc10_:* = null as String;
         var _loc11_:Boolean = false;
         var _loc13_:* = null as HaxeFighter;
         var _loc14_:* = null as DamageRange;
         var _loc15_:Boolean = false;
         var _loc17_:int = 0;
         var _loc18_:Boolean = false;
         var _loc19_:Boolean = false;
         var _loc20_:* = null as HaxeBuff;
         var _loc21_:int = 0;
         var _loc22_:* = null as Array;
         var _loc23_:* = null as HaxeSpell;
         var _loc24_:* = null as FightContext;
         var _loc25_:int = 0;
         var _loc26_:* = null as HaxeFighter;
         var _loc27_:Number = NaN;
         var _loc28_:* = null as DamageRange;
         var _loc29_:* = null as Mark;
         var _loc30_:Boolean = false;
         var _loc31_:Boolean = false;
         var _loc32_:* = null as SpellZone;
         var _loc33_:Boolean = false;
         var _loc34_:Boolean = false;
         var _loc35_:Boolean = false;
         var _loc36_:Boolean = false;
         var _loc37_:Boolean = false;
         var _loc38_:int = 0;
         var _loc39_:int = 0;
         var _loc40_:Boolean = false;
         var _loc41_:Boolean = false;
         var _loc42_:* = null as EffectOutput;
         var _loc43_:* = null as DamageRange;
         var _loc44_:* = null as RunningEffect;
         var _loc45_:* = null as Interval;
         var _loc46_:* = null as Array;
         var _loc47_:* = null as Array;
         var fightContext:FightContext = param1;
         var _loc7_:HaxeSpell = param2.getSpell();
         var effect:HaxeSpellEffect = param2.getSpellEffect();
         var _loc8_:HaxeFighter = param2.getCaster();
         var _loc9_:int = 0;
         param2.forceCritical = param2.forceCritical || effect.isCritical;
         DamageCalculator.loopCountIterations = DamageCalculator.loopCountIterations + 1;
         if(DamageCalculator.loopCountIterations > DamageCalculator.MAX_LOOP_ITERATIONS)
         {
            _loc10_ = "[Damage Preview] Infinite loop detected after " + DamageCalculator.MAX_LOOP_ITERATIONS + " iterations";
            HaxeLogger.logInfiniteLoop(_loc10_,param2);
            throw _loc10_;
         }
         var _loc12_:HaxeFighter = param2.getCaster();
         if(!(_loc12_.playerType == PlayerTypeEnum.MONSTER && _loc12_.data.isSummon() && int(HaxeFighter.BOMB_BREED_ID.indexOf(_loc12_.breed)) != -1))
         {
            _loc13_ = param2.getCaster();
            _loc11_ = _loc13_.playerType == PlayerTypeEnum.MONSTER && _loc13_.data.isSummon() && int(HaxeFighter.STEAMER_TURRET_BREED_ID.indexOf(_loc13_.breed)) != -1;
         }
         else
         {
            _loc11_ = true;
         }
         if(_loc11_)
         {
            param2.overrideCaster(param2.getCaster().getSummoner(fightContext));
         }
         if((ActionIdHelper.isDamage(effect.category) || ActionIdHelper.isHeal(effect.actionId)) == true)
         {
            _loc14_ = DamageSender.getTotalDamage(fightContext,param2,param3);
         }
         else
         {
            _loc15_ = ActionIdHelper.isShield(effect.actionId);
            _loc14_ = _loc15_ == true?DamageSender.getTotalShield(param2,param3):DamageRange.ZERO;
         }
         _loc14_.probability = param2.probability;
         if(_loc8_ != param2.getCaster())
         {
            param2.overrideCaster(_loc8_);
         }
         ArraySort.sort(param4,function(param1:HaxeFighter, param2:HaxeFighter):int
         {
            return int(TargetManagement.comparePositions(fightContext.targetedCell,Boolean(ActionIdHelper.isPush(effect.actionId)),int(param1.getCurrentPositionCell()),int(param2.getCurrentPositionCell())));
         });
         var _loc16_:int = 0;
         while(_loc16_ < int(param4.length))
         {
            _loc13_ = param4[_loc16_];
            _loc16_++;
            if(!(!_loc13_.isAlive() && param2.getSpellEffect().rawZone.charAt(0) != "A"))
            {
               if(!SpellManager.isInstantaneousSpellEffect(effect) && !param2.isTriggered)
               {
                  _loc13_.storePendingBuff(HaxeBuff.fromRunningEffect(param2));
               }
               else
               {
                  _loc17_ = effect.actionId;
                  if(Boolean(ActionIdHelper.isBuff(_loc17_)) == true)
                  {
                     _loc20_ = HaxeBuff.fromRunningEffect(param2);
                     if(param2.isTriggered)
                     {
                        _loc20_.effect.triggers = ["I"];
                     }
                     _loc13_.storePendingBuff(_loc20_);
                     if(_loc20_.effect.actionId == 169 || _loc20_.effect.actionId == 168)
                     {
                        if(_loc20_.effect.actionId == 169)
                        {
                           effect.actionId = 1080;
                        }
                        else if(_loc20_.effect.actionId == 168)
                        {
                           effect.actionId = 1079;
                        }
                        DamageCalculator.computeEffect(fightContext,param2,param3,[_loc13_],null,param6);
                     }
                  }
                  else
                  {
                     _loc18_ = ActionIdHelper.isStatBoost(_loc17_);
                     if(_loc18_ == true)
                     {
                        _loc8_.storeSpellEffectStatBoost(_loc7_,effect);
                     }
                     else
                     {
                        _loc21_ = _loc17_;
                        if(_loc21_ == 406)
                        {
                           _loc19_ = ActionIdHelper.isSpellExecution(_loc17_);
                           if(_loc19_ == true)
                           {
                              if(ActionIdHelper.spellExecutionHasGlobalLimitation(effect.actionId))
                              {
                                 _loc9_++;
                                 if(_loc9_ > effect.param3)
                                 {
                                    return;
                                 }
                              }
                              DamageCalculator.solveSpellExecution(fightContext,param2,_loc13_,param3);
                           }
                           else
                           {
                              _loc8_.removeBuffBySpellId(effect.param3);
                           }
                        }
                        else if(_loc21_ == 952)
                        {
                           _loc19_ = ActionIdHelper.isSpellExecution(_loc17_);
                           if(_loc19_ == true)
                           {
                              if(ActionIdHelper.spellExecutionHasGlobalLimitation(effect.actionId))
                              {
                                 _loc9_++;
                                 if(_loc9_ > effect.param3)
                                 {
                                    return;
                                 }
                              }
                              DamageCalculator.solveSpellExecution(fightContext,param2,_loc13_,param3);
                           }
                           else
                           {
                              _loc13_.removeState(effect.param3);
                           }
                        }
                        else if(_loc21_ == 1008)
                        {
                           if(ActionIdHelper.spellExecutionHasGlobalLimitation(effect.actionId))
                           {
                              _loc9_++;
                              if(_loc9_ > effect.param3)
                              {
                                 return;
                              }
                           }
                           DamageCalculator.solveSpellExecution(fightContext,param2,_loc13_,param3);
                        }
                        else if(_loc21_ == 1009)
                        {
                           _loc19_ = ActionIdHelper.isSpellExecution(_loc17_);
                           if(_loc19_ == true)
                           {
                              if(ActionIdHelper.spellExecutionHasGlobalLimitation(effect.actionId))
                              {
                                 _loc9_++;
                                 if(_loc9_ > effect.param3)
                                 {
                                    return;
                                 }
                              }
                              DamageCalculator.solveSpellExecution(fightContext,param2,_loc13_,param3);
                           }
                           else
                           {
                              _loc22_ = TargetManagement.getBombsAboutToExplode(_loc13_,fightContext,param2);
                              _loc25_ = 0;
                              while(_loc25_ < int(_loc22_.length))
                              {
                                 _loc26_ = _loc22_[_loc25_];
                                 _loc25_++;
                                 _loc23_ = DamageCalculator.dataInterface.getBombExplosionSpellFromFighter(_loc26_);
                                 if(_loc23_ != null)
                                 {
                                    _loc24_ = fightContext.copy();
                                    _loc24_.targetedCell = int(_loc26_.getCurrentPositionCell());
                                    DamageCalculator.executeSpell(_loc24_,_loc26_,_loc23_,param2.forceCritical,param2,param3);
                                 }
                              }
                           }
                        }
                        else if(_loc21_ == 1159)
                        {
                           _loc19_ = ActionIdHelper.isSpellExecution(_loc17_);
                           if(_loc19_ == true)
                           {
                              if(ActionIdHelper.spellExecutionHasGlobalLimitation(effect.actionId))
                              {
                                 _loc9_++;
                                 if(_loc9_ > effect.param3)
                                 {
                                    return;
                                 }
                              }
                              DamageCalculator.solveSpellExecution(fightContext,param2,_loc13_,param3);
                           }
                           else
                           {
                              _loc27_ = effect.param1 * 0.01;
                              _loc28_ = param2.triggeringOutput.damageRange;
                              if(_loc28_ != null && !_loc28_.isInvulnerable && !_loc28_.isCollision && _loc28_.isHeal)
                              {
                                 _loc28_.multiply(_loc27_);
                              }
                           }
                        }
                        else if(_loc21_ == 2023)
                        {
                           _loc19_ = ActionIdHelper.isSpellExecution(_loc17_);
                           if(_loc19_ == true)
                           {
                              if(ActionIdHelper.spellExecutionHasGlobalLimitation(effect.actionId))
                              {
                                 _loc9_++;
                                 if(_loc9_ > effect.param3)
                                 {
                                    return;
                                 }
                              }
                              DamageCalculator.solveSpellExecution(fightContext,param2,_loc13_,param3);
                           }
                           else
                           {
                              _loc22_ = fightContext.map.getMarkInteractingWithCell(int(_loc13_.getCurrentPositionCell()),5);
                              if(_loc22_ != null)
                              {
                                 _loc25_ = 0;
                                 while(_loc25_ < int(_loc22_.length))
                                 {
                                    _loc29_ = _loc22_[_loc25_];
                                    _loc25_++;
                                    PushUtils.executeMarkSpell(_loc13_,_loc29_,param2,fightContext,param3);
                                 }
                              }
                           }
                        }
                        else
                        {
                           _loc19_ = ActionIdHelper.isSpellExecution(_loc17_);
                           if(_loc19_ == true)
                           {
                              if(ActionIdHelper.spellExecutionHasGlobalLimitation(effect.actionId))
                              {
                                 _loc9_++;
                                 if(_loc9_ > effect.param3)
                                 {
                                    return;
                                 }
                              }
                              DamageCalculator.solveSpellExecution(fightContext,param2,_loc13_,param3);
                           }
                           else
                           {
                              _loc30_ = MapTools.areCellsAdjacent(int(param2.getCaster().getCurrentPositionCell()),int(_loc13_.getCurrentPositionCell()));
                              _loc21_ = effect.actionId;
                              if(_loc21_ == 80)
                              {
                                 _loc28_ = PushUtils.getCollisionDamages(fightContext,_loc8_,_loc13_,effect.param1,effect.param2);
                              }
                              else
                              {
                                 _loc31_ = ActionIdHelper.isBasedOnTargetLife(_loc21_);
                                 _loc28_ = _loc31_ == true?DamageReceiver.getDamageBasedOnTargetLife(param2.getSpellEffect(),_loc13_,_loc14_.copy()):_loc14_.copy();
                              }
                              if(param2.getCaster() == _loc13_)
                              {
                                 _loc30_ = false;
                                 if(effect.actionId == 90)
                                 {
                                    _loc28_.isHeal = false;
                                 }
                              }
                              if(!ActionIdHelper.isFakeDamage(effect.actionId) && effect.actionId != 80 && !_loc28_.isZero())
                              {
                                 _loc27_ = 1;
                                 if(param5 != null && int(param5.indexOf(_loc13_)) == -1 && ActionIdHelper.allowAOEMalus(effect.actionId))
                                 {
                                    _loc25_ = 0;
                                    if(effect.zone.radius >= 1)
                                    {
                                       _loc32_ = effect.zone;
                                       _loc25_ = _loc32_.getAOEMalus(fightContext.targetedCell,int(_loc8_.getCurrentPositionCell()),int(_loc13_.getBeforeLastSpellPosition()));
                                    }
                                    _loc27_ = _loc27_ * ((100 - _loc25_) / 100);
                                 }
                                 if(fightContext.usingPortal())
                                 {
                                    _loc27_ = _loc27_ * (1 + int(fightContext.getPortalBonus()) * 0.01);
                                 }
                                 _loc28_.multiply(_loc27_);
                              }
                              _loc25_ = effect.actionId;
                              if(Boolean(ActionIdHelper.isTeleport(_loc25_)) == true)
                              {
                                 _loc22_ = Teleport.teleportFighter(fightContext,param2,_loc13_,param3);
                              }
                              else
                              {
                                 _loc38_ = _loc25_;
                                 if(_loc38_ == 50)
                                 {
                                    _loc22_ = Teleport.carryFighter(fightContext,param2,_loc13_);
                                 }
                                 else if(_loc38_ == 51)
                                 {
                                    _loc26_ = param2.getCaster();
                                    _loc22_ = Teleport.throwFighter(fightContext,_loc26_);
                                 }
                                 else if(_loc38_ == 106)
                                 {
                                    _loc33_ = ActionIdHelper.isPush(_loc25_);
                                    if(_loc33_ == true)
                                    {
                                       _loc39_ = effect.param1;
                                       _loc40_ = ActionIdHelper.isForcedDrag(effect.actionId);
                                       _loc41_ = ActionIdHelper.allowCollisionDamages(effect.actionId);
                                       _loc22_ = PushUtils.push(fightContext,param2,_loc13_,_loc39_,_loc40_,_loc41_,param3);
                                    }
                                    else
                                    {
                                       _loc34_ = ActionIdHelper.isPull(_loc25_);
                                       if(_loc34_ == true)
                                       {
                                          _loc39_ = effect.param1;
                                          _loc40_ = ActionIdHelper.isForcedDrag(effect.actionId);
                                          _loc22_ = PushUtils.pull(fightContext,param2,_loc13_,_loc39_,_loc40_,param3);
                                       }
                                       else
                                       {
                                          _loc35_ = ActionIdHelper.isShield(_loc25_);
                                          if(_loc35_ == true)
                                          {
                                             _loc22_ = [EffectOutput.fromDamageRange(_loc13_.id,_loc28_)];
                                          }
                                          else
                                          {
                                             _loc42_ = param2.triggeringOutput;
                                             _loc43_ = param2.triggeringOutput.damageRange;
                                             _loc44_ = param2.getParentEffect() != null?param2.getParentEffect():null;
                                             _loc26_ = _loc44_ != null?_loc44_.getCaster():null;
                                             _loc39_ = _loc44_ != null?_loc44_.getSpell().level:1;
                                             _loc40_ = param2.getParentEffect() != null && param2.getParentEffect().getSpell().isWeapon;
                                             if(_loc26_ != null && _loc44_ != null && _loc43_ != null && !_loc42_.damageRange.isCollision && !_loc40_ && _loc39_ <= effect.param2)
                                             {
                                                _loc13_.pendingEffects.remove(_loc42_);
                                                _loc22_ = DamageReceiver.receiveDamageOrHeal(fightContext,_loc44_,_loc42_.damageRange,_loc26_,_loc30_,param3);
                                             }
                                             else
                                             {
                                                _loc22_ = [];
                                             }
                                          }
                                       }
                                    }
                                 }
                                 else if(_loc38_ == 141)
                                 {
                                    _loc33_ = ActionIdHelper.isPush(_loc25_);
                                    if(_loc33_ == true)
                                    {
                                       _loc39_ = effect.param1;
                                       _loc40_ = ActionIdHelper.isForcedDrag(effect.actionId);
                                       _loc41_ = ActionIdHelper.allowCollisionDamages(effect.actionId);
                                       _loc22_ = PushUtils.push(fightContext,param2,_loc13_,_loc39_,_loc40_,_loc41_,param3);
                                    }
                                    else
                                    {
                                       _loc34_ = ActionIdHelper.isPull(_loc25_);
                                       if(_loc34_ == true)
                                       {
                                          _loc39_ = effect.param1;
                                          _loc40_ = ActionIdHelper.isForcedDrag(effect.actionId);
                                          _loc22_ = PushUtils.pull(fightContext,param2,_loc13_,_loc39_,_loc40_,param3);
                                       }
                                       else
                                       {
                                          _loc35_ = ActionIdHelper.isShield(_loc25_);
                                          _loc22_ = _loc35_ == true?[EffectOutput.fromDamageRange(_loc13_.id,_loc28_)]:[EffectOutput.deathOf(_loc13_.id)];
                                       }
                                    }
                                 }
                                 else if(_loc38_ == 320)
                                 {
                                    _loc33_ = ActionIdHelper.isPush(_loc25_);
                                    if(_loc33_ == true)
                                    {
                                       _loc39_ = effect.param1;
                                       _loc40_ = ActionIdHelper.isForcedDrag(effect.actionId);
                                       _loc41_ = ActionIdHelper.allowCollisionDamages(effect.actionId);
                                       _loc22_ = PushUtils.push(fightContext,param2,_loc13_,_loc39_,_loc40_,_loc41_,param3);
                                    }
                                    else
                                    {
                                       _loc34_ = ActionIdHelper.isPull(_loc25_);
                                       if(_loc34_ == true)
                                       {
                                          _loc39_ = effect.param1;
                                          _loc40_ = ActionIdHelper.isForcedDrag(effect.actionId);
                                          _loc22_ = PushUtils.pull(fightContext,param2,_loc13_,_loc39_,_loc40_,param3);
                                       }
                                       else
                                       {
                                          _loc35_ = ActionIdHelper.isShield(_loc25_);
                                          if(_loc35_ == true)
                                          {
                                             _loc22_ = [EffectOutput.fromDamageRange(_loc13_.id,_loc28_)];
                                          }
                                          else
                                          {
                                             _loc42_ = new EffectOutput(_loc13_.id);
                                             _loc42_.rangeStolen = effect.getDamageInterval().min;
                                             _loc22_ = [_loc42_];
                                          }
                                       }
                                    }
                                 }
                                 else if(_loc38_ == 783)
                                 {
                                    _loc22_ = PushUtils.pushTo(fightContext,param2,_loc13_,false,false,param3);
                                 }
                                 else if(_loc38_ == 786)
                                 {
                                    _loc33_ = ActionIdHelper.isPush(_loc25_);
                                    if(_loc33_ == true)
                                    {
                                       _loc39_ = effect.param1;
                                       _loc40_ = ActionIdHelper.isForcedDrag(effect.actionId);
                                       _loc41_ = ActionIdHelper.allowCollisionDamages(effect.actionId);
                                       _loc22_ = PushUtils.push(fightContext,param2,_loc13_,_loc39_,_loc40_,_loc41_,param3);
                                    }
                                    else
                                    {
                                       _loc34_ = ActionIdHelper.isPull(_loc25_);
                                       if(_loc34_ == true)
                                       {
                                          _loc39_ = effect.param1;
                                          _loc40_ = ActionIdHelper.isForcedDrag(effect.actionId);
                                          _loc22_ = PushUtils.pull(fightContext,param2,_loc13_,_loc39_,_loc40_,param3);
                                       }
                                       else
                                       {
                                          _loc35_ = ActionIdHelper.isShield(_loc25_);
                                          if(_loc35_ == true)
                                          {
                                             _loc22_ = [EffectOutput.fromDamageRange(_loc13_.id,_loc28_)];
                                          }
                                          else
                                          {
                                             _loc45_ = effect.getDamageInterval();
                                             _loc43_ = param2.triggeringOutput.damageRange.copy();
                                             _loc26_ = param2.getParentEffect() != null?param2.getParentEffect().getCaster():null;
                                             if(_loc43_ != null && _loc26_ != null && !_loc43_.isHeal && !_loc43_.isInvulnerable)
                                             {
                                                _loc43_.multiplyInterval(_loc45_);
                                                _loc43_.multiply(0.01);
                                                _loc43_.isHeal = true;
                                                _loc43_.isShieldDamage = false;
                                                _loc22_ = [EffectOutput.fromDamageRange(_loc26_.id,_loc43_)];
                                             }
                                             else
                                             {
                                                _loc22_ = [];
                                             }
                                          }
                                       }
                                    }
                                 }
                                 else if(_loc38_ == 950)
                                 {
                                    _loc33_ = ActionIdHelper.isPush(_loc25_);
                                    if(_loc33_ == true)
                                    {
                                       _loc39_ = effect.param1;
                                       _loc40_ = ActionIdHelper.isForcedDrag(effect.actionId);
                                       _loc41_ = ActionIdHelper.allowCollisionDamages(effect.actionId);
                                       _loc22_ = PushUtils.push(fightContext,param2,_loc13_,_loc39_,_loc40_,_loc41_,param3);
                                    }
                                    else
                                    {
                                       _loc34_ = ActionIdHelper.isPull(_loc25_);
                                       if(_loc34_ == true)
                                       {
                                          _loc39_ = effect.param1;
                                          _loc40_ = ActionIdHelper.isForcedDrag(effect.actionId);
                                          _loc22_ = PushUtils.pull(fightContext,param2,_loc13_,_loc39_,_loc40_,param3);
                                       }
                                       else
                                       {
                                          _loc35_ = ActionIdHelper.isShield(_loc25_);
                                          if(_loc35_ == true)
                                          {
                                             _loc22_ = [EffectOutput.fromDamageRange(_loc13_.id,_loc28_)];
                                          }
                                          else
                                          {
                                             _loc20_ = HaxeBuff.fromRunningEffect(param2);
                                             if(param2.isTriggered)
                                             {
                                                _loc20_.effect.triggers = ["I"];
                                             }
                                             _loc13_.storePendingBuff(_loc20_);
                                             _loc22_ = [EffectOutput.fromStateChange(_loc13_.id,effect.param3,true)];
                                          }
                                       }
                                    }
                                 }
                                 else if(_loc38_ == 951)
                                 {
                                    _loc33_ = ActionIdHelper.isPush(_loc25_);
                                    if(_loc33_ == true)
                                    {
                                       _loc39_ = effect.param1;
                                       _loc40_ = ActionIdHelper.isForcedDrag(effect.actionId);
                                       _loc41_ = ActionIdHelper.allowCollisionDamages(effect.actionId);
                                       _loc22_ = PushUtils.push(fightContext,param2,_loc13_,_loc39_,_loc40_,_loc41_,param3);
                                    }
                                    else
                                    {
                                       _loc34_ = ActionIdHelper.isPull(_loc25_);
                                       if(_loc34_ == true)
                                       {
                                          _loc39_ = effect.param1;
                                          _loc40_ = ActionIdHelper.isForcedDrag(effect.actionId);
                                          _loc22_ = PushUtils.pull(fightContext,param2,_loc13_,_loc39_,_loc40_,param3);
                                       }
                                       else
                                       {
                                          _loc35_ = ActionIdHelper.isShield(_loc25_);
                                          _loc22_ = _loc35_ == true?[EffectOutput.fromDamageRange(_loc13_.id,_loc28_)]:!!_loc13_.removeState(int(effect.getMinRoll()))?[EffectOutput.fromStateChange(_loc13_.id,effect.param3,false)]:[];
                                       }
                                    }
                                 }
                                 else if(_loc38_ == 1043)
                                 {
                                    _loc22_ = PushUtils.pullTo(fightContext,param2,_loc13_,false,param3);
                                 }
                                 else if(_loc38_ == 1075)
                                 {
                                    _loc33_ = ActionIdHelper.isPush(_loc25_);
                                    if(_loc33_ == true)
                                    {
                                       _loc39_ = effect.param1;
                                       _loc40_ = ActionIdHelper.isForcedDrag(effect.actionId);
                                       _loc41_ = ActionIdHelper.allowCollisionDamages(effect.actionId);
                                       _loc22_ = PushUtils.push(fightContext,param2,_loc13_,_loc39_,_loc40_,_loc41_,param3);
                                    }
                                    else
                                    {
                                       _loc34_ = ActionIdHelper.isPull(_loc25_);
                                       if(_loc34_ == true)
                                       {
                                          _loc39_ = effect.param1;
                                          _loc40_ = ActionIdHelper.isForcedDrag(effect.actionId);
                                          _loc22_ = PushUtils.pull(fightContext,param2,_loc13_,_loc39_,_loc40_,param3);
                                       }
                                       else
                                       {
                                          _loc35_ = ActionIdHelper.isShield(_loc25_);
                                          if(_loc35_ == true)
                                          {
                                             _loc22_ = [EffectOutput.fromDamageRange(_loc13_.id,_loc28_)];
                                          }
                                          else
                                          {
                                             _loc46_ = _loc13_.reduceBuffDurations(int(effect.getMinRoll()));
                                             if(_loc46_ != null && int(_loc46_.length) > 0)
                                             {
                                                _loc47_ = [EffectOutput.fromDispell(_loc13_.id)];
                                                _loc39_ = 0;
                                                while(_loc39_ < int(_loc46_.length))
                                                {
                                                   _loc20_ = _loc46_[_loc39_];
                                                   _loc39_++;
                                                   if(_loc20_.effect.actionId == 950)
                                                   {
                                                      _loc47_.push(EffectOutput.fromStateChange(_loc13_.id,_loc20_.effect.param3,false));
                                                   }
                                                }
                                                _loc22_ = _loc47_;
                                             }
                                             else
                                             {
                                                _loc22_ = [];
                                             }
                                          }
                                       }
                                    }
                                 }
                                 else
                                 {
                                    if(_loc38_ != 84)
                                    {
                                       if(_loc38_ != 1079)
                                       {
                                          if(_loc38_ != 77)
                                          {
                                             if(_loc38_ != 1080)
                                             {
                                                _loc33_ = ActionIdHelper.isPush(_loc25_);
                                                if(_loc33_ == true)
                                                {
                                                   _loc38_ = effect.param1;
                                                   _loc40_ = ActionIdHelper.isForcedDrag(effect.actionId);
                                                   _loc41_ = ActionIdHelper.allowCollisionDamages(effect.actionId);
                                                   _loc22_ = PushUtils.push(fightContext,param2,_loc13_,_loc38_,_loc40_,_loc41_,param3);
                                                }
                                                else
                                                {
                                                   _loc34_ = ActionIdHelper.isPull(_loc25_);
                                                   if(_loc34_ == true)
                                                   {
                                                      _loc38_ = effect.param1;
                                                      _loc40_ = ActionIdHelper.isForcedDrag(effect.actionId);
                                                      _loc22_ = PushUtils.pull(fightContext,param2,_loc13_,_loc38_,_loc40_,param3);
                                                   }
                                                   else
                                                   {
                                                      _loc35_ = ActionIdHelper.isShield(_loc25_);
                                                      if(_loc35_ == true)
                                                      {
                                                         _loc22_ = [EffectOutput.fromDamageRange(_loc13_.id,_loc28_)];
                                                      }
                                                      else
                                                      {
                                                         _loc36_ = ActionIdHelper.isHeal(_loc25_);
                                                         if(_loc36_ == true)
                                                         {
                                                            _loc22_ = DamageReceiver.receiveDamageOrHeal(fightContext,param2,_loc28_,_loc13_,_loc30_,param3);
                                                         }
                                                         else
                                                         {
                                                            _loc37_ = ActionIdHelper.isDamage(effect.category);
                                                            _loc22_ = _loc37_ == true?DamageReceiver.receiveDamageOrHeal(fightContext,param2,_loc28_,_loc13_,_loc30_,param3):[];
                                                         }
                                                      }
                                                   }
                                                }
                                             }
                                          }
                                          _loc33_ = ActionIdHelper.isPush(_loc25_);
                                          if(_loc33_ == true)
                                          {
                                             _loc39_ = effect.param1;
                                             _loc40_ = ActionIdHelper.isForcedDrag(effect.actionId);
                                             _loc41_ = ActionIdHelper.allowCollisionDamages(effect.actionId);
                                             _loc22_ = PushUtils.push(fightContext,param2,_loc13_,_loc39_,_loc40_,_loc41_,param3);
                                          }
                                          else
                                          {
                                             _loc34_ = ActionIdHelper.isPull(_loc25_);
                                             if(_loc34_ == true)
                                             {
                                                _loc39_ = effect.param1;
                                                _loc40_ = ActionIdHelper.isForcedDrag(effect.actionId);
                                                _loc22_ = PushUtils.pull(fightContext,param2,_loc13_,_loc39_,_loc40_,param3);
                                             }
                                             else
                                             {
                                                _loc35_ = ActionIdHelper.isShield(_loc25_);
                                                _loc22_ = _loc35_ == true?[EffectOutput.fromDamageRange(_loc13_.id,_loc28_)]:[EffectOutput.fromAmTheft(_loc13_.id,effect.getDamageInterval().min)];
                                             }
                                          }
                                       }
                                    }
                                    _loc33_ = ActionIdHelper.isPush(_loc25_);
                                    if(_loc33_ == true)
                                    {
                                       _loc39_ = effect.param1;
                                       _loc40_ = ActionIdHelper.isForcedDrag(effect.actionId);
                                       _loc41_ = ActionIdHelper.allowCollisionDamages(effect.actionId);
                                       _loc22_ = PushUtils.push(fightContext,param2,_loc13_,_loc39_,_loc40_,_loc41_,param3);
                                    }
                                    else
                                    {
                                       _loc34_ = ActionIdHelper.isPull(_loc25_);
                                       if(_loc34_ == true)
                                       {
                                          _loc39_ = effect.param1;
                                          _loc40_ = ActionIdHelper.isForcedDrag(effect.actionId);
                                          _loc22_ = PushUtils.pull(fightContext,param2,_loc13_,_loc39_,_loc40_,param3);
                                       }
                                       else
                                       {
                                          _loc35_ = ActionIdHelper.isShield(_loc25_);
                                          _loc22_ = _loc35_ == true?[EffectOutput.fromDamageRange(_loc13_.id,_loc28_)]:[EffectOutput.fromApTheft(_loc13_.id,effect.getDamageInterval().min)];
                                       }
                                    }
                                 }
                              }
                              _loc38_ = 0;
                              while(_loc38_ < int(_loc22_.length))
                              {
                                 _loc42_ = _loc22_[_loc38_];
                                 _loc38_++;
                                 if(_loc42_.damageRange != null && param6 == true)
                                 {
                                    _loc42_.unknown = true;
                                 }
                                 fightContext.getFighterById(_loc42_.fighterId).pendingEffects.add(_loc42_);
                              }
                              _loc38_ = 0;
                              while(_loc38_ < int(_loc22_.length))
                              {
                                 _loc42_ = _loc22_[_loc38_];
                                 _loc38_++;
                                 if(_loc42_.damageRange != null && param2.forceCritical)
                                 {
                                    _loc42_.damageRange.isCritical = true;
                                 }
                                 if(param2.canAlwaysTriggerSpells())
                                 {
                                    _loc26_ = fightContext.getFighterById(_loc42_.fighterId);
                                    _loc40_ = MapTools.areCellsAdjacent(int(_loc8_.getCurrentPositionCell()),int(_loc26_.getCurrentPositionCell()));
                                    DamageCalculator.triggerEffects(fightContext,param2,_loc26_,_loc40_,_loc42_,param3);
                                 }
                              }
                           }
                        }
                     }
                  }
               }
            }
         }
      }
      
      public static function getAOEMalus(param1:HaxeSpellEffect, param2:int, param3:HaxeFighter, param4:HaxeFighter) : Number
      {
         var _loc6_:* = null as SpellZone;
         var _loc5_:int = 0;
         if(param1.zone.radius >= 1)
         {
            _loc6_ = param1.zone;
            _loc5_ = _loc6_.getAOEMalus(param2,int(param3.getCurrentPositionCell()),int(param4.getBeforeLastSpellPosition()));
         }
         return (100 - _loc5_) / 100;
      }
      
      public static function triggerEffects(param1:FightContext, param2:RunningEffect, param3:HaxeFighter, param4:Boolean, param5:EffectOutput, param6:Boolean) : Boolean
      {
         var fightContext:FightContext = param1;
         var triggeringRunningEffect:RunningEffect = param2;
         var target:HaxeFighter = param3;
         var melee:Boolean = param4;
         var triggeringOutput:EffectOutput = param5;
         var isPreview:Boolean = param6;
         var hasTriggerEffect:Boolean = false;
         var _loc7_:Function = function(param1:LinkedList, param2:Boolean, param3:Function):void
         {
            var _loc5_:* = null as LinkedListNode;
            var _loc6_:* = null as LinkedListNode;
            var _loc7_:* = null as HaxeBuff;
            var _loc8_:* = null as HaxeSpellEffect;
            var _loc9_:* = null as RunningEffect;
            var _loc10_:* = null as FightContext;
            var _loc4_:LinkedListNode = param1.head;
            while(_loc4_ != null)
            {
               _loc5_ = _loc4_;
               _loc4_ = _loc4_.next;
               _loc6_ = _loc5_;
               _loc7_ = _loc6_.item;
               if(!(_loc7_.effect.triggers == null || int(_loc7_.effect.triggers.length) == 0 || int(_loc7_.effect.triggers.length) == 1 && _loc7_.effect.triggers[0] == "I" || !_loc7_.canBeTriggeredBy(triggeringRunningEffect) || !!param2 && int(_loc7_.hasBeenTriggeredOn.indexOf(target.id)) != -1))
               {
                  if(param3(_loc7_))
                  {
                     if(_loc7_.effect.isCritical)
                     {
                        _loc8_ = _loc7_.effect.clone();
                        _loc8_.isCritical = false;
                     }
                     else
                     {
                        _loc8_ = _loc7_.effect;
                     }
                     _loc9_ = new RunningEffect(fightContext.getFighterById(_loc7_.casterId),_loc7_.spell,_loc8_);
                     _loc9_.triggeredByEffectSetting(triggeringRunningEffect);
                     _loc9_.triggeringOutput = triggeringOutput;
                     _loc9_.isTriggered = true;
                     _loc9_.forceCritical = triggeringRunningEffect.forceCritical;
                     _loc10_ = fightContext.copy();
                     _loc10_.targetedCell = int(target.getBeforeLastSpellPosition());
                     if(param2)
                     {
                        _loc7_.hasBeenTriggeredOn.push(target.id);
                     }
                     DamageCalculator.computeEffect(_loc10_,_loc9_,isPreview,[target],null);
                     hasTriggerEffect = true;
                  }
               }
            }
         };
         var _loc8_:HaxeFighter = triggeringRunningEffect.getCaster();
         _loc7_(target._buffs.copy(),false,function(param1:HaxeBuff):Boolean
         {
            return Boolean(param1.shouldBeTriggeredOnTarget(triggeringOutput,triggeringRunningEffect,target,melee,fightContext));
         });
         _loc7_(_loc8_._buffs.copy(),true,function(param1:HaxeBuff):Boolean
         {
            return Boolean(param1.shouldBeTriggeredOnCaster(triggeringOutput,triggeringRunningEffect,target,melee,fightContext));
         });
         return hasTriggerEffect;
      }
      
      public static function solveSpellExecution(param1:FightContext, param2:RunningEffect, param3:HaxeFighter, param4:Boolean) : void
      {
         var _loc10_:int = 0;
         var _loc14_:* = null as HaxeFighter;
         var _loc5_:HaxeFighter = param2.getCaster();
         var _loc6_:HaxeFighter = !!param2.isTriggered?param2.triggeringFighter:_loc5_;
         var _loc7_:HaxeFighter = null;
         var _loc8_:HaxeFighter = null;
         var _loc9_:Boolean = false;
         _loc10_ = param2.getSpellEffect().actionId;
         if(_loc10_ != 792)
         {
            if(_loc10_ != 793)
            {
               if(_loc10_ != 2792)
               {
                  if(_loc10_ != 2793)
                  {
                     if(_loc10_ == 1018)
                     {
                        _loc7_ = _loc6_;
                        _loc8_ = param3;
                     }
                     else if(_loc10_ == 1019)
                     {
                        _loc7_ = _loc6_;
                        _loc8_ = _loc6_;
                     }
                     else
                     {
                        if(_loc10_ != 1017)
                        {
                           if(_loc10_ != 2017)
                           {
                              if(_loc10_ != 1008)
                              {
                                 if(_loc10_ != 1160)
                                 {
                                    if(_loc10_ != 2160)
                                    {
                                       if(_loc10_ != 2794)
                                       {
                                          if(_loc10_ != 2795)
                                          {
                                             throw "ActionId " + param2.getSpellEffect().actionId + " is not a spell execution";
                                          }
                                       }
                                       _loc7_ = param3;
                                       _loc8_ = param3;
                                       _loc9_ = true;
                                    }
                                 }
                              }
                              _loc7_ = _loc5_;
                              _loc8_ = param3;
                           }
                        }
                        _loc7_ = param3;
                        _loc8_ = _loc6_;
                     }
                  }
                  addr126:
                  var _loc11_:HaxeSpellEffect = param2.getSpellEffect();
                  var _loc12_:IMap = new ObjectMap();
                  _loc10_ = 0;
                  var _loc13_:Array = param1.fighters;
                  while(_loc10_ < int(_loc13_.length))
                  {
                     _loc14_ = _loc13_[_loc10_];
                     _loc10_++;
                     _loc12_[_loc14_] = int(_loc14_.getBeforeLastSpellPosition());
                     _loc14_.savePositionBeforeSpellExecution();
                  }
                  var _loc15_:Boolean = _loc9_;
                  if(_loc15_ == false)
                  {
                     _loc10_ = _loc8_.getBeforeLastSpellPosition();
                  }
                  else if(_loc15_ == true)
                  {
                     _loc10_ = param1.targetedCell;
                  }
                  var _loc16_:FightContext = param1.copy();
                  _loc16_.targetedCell = _loc10_;
                  _loc15_ = param2.getFirstParentEffect().getSpellEffect().isCritical;
                  var _loc17_:HaxeSpell = _loc11_.actionId == 1008?DamageCalculator.dataInterface.getBombCastOnFighterSpell(_loc11_.param1,_loc11_.param2):DamageCalculator.dataInterface.createSpellFromId(_loc11_.param1,_loc11_.param2);
                  if(_loc17_ != null)
                  {
                     DamageCalculator.executeSpell(_loc16_,_loc7_,_loc17_,_loc15_,param2,param4);
                  }
                  var _loc18_:* = _loc12_.keys();
                  while(_loc18_.hasNext())
                  {
                     _loc14_ = _loc18_.next();
                     _loc14_.setBeforeLastSpellPosition(_loc12_[_loc14_]);
                  }
                  return;
               }
            }
         }
         _loc7_ = param3;
         _loc8_ = param3;
         §§goto(addr126);
      }
      
      public static function create32BitHashSpellLevel(param1:int, param2:int) : int
      {
         return param2 << 24 | param1;
      }
   }
}
