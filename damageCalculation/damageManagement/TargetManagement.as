package damageCalculation.damageManagement
{
   import damageCalculation.DamageCalculator;
   import damageCalculation.FightContext;
   import damageCalculation.fighterManagement.HaxeBuff;
   import damageCalculation.fighterManagement.HaxeFighter;
   import damageCalculation.fighterManagement.PlayerTypeEnum;
   import damageCalculation.spellManagement.HaxeSpell;
   import damageCalculation.spellManagement.HaxeSpellEffect;
   import damageCalculation.spellManagement.RunningEffect;
   import damageCalculation.spellManagement.SpellManager;
   import damageCalculation.tools.LinkedListNode;
   import mapTools.MapTools;
   import mapTools.Point;
   import mapTools.SpellZone;
   import tools.FpUtils;
   
   public class TargetManagement
   {
      
      public static var DEFAULT_SORT_DIRECTION:int = 7;
       
      
      public function TargetManagement()
      {
      }
      
      public static function getEffectTargets(param1:FightContext, param2:HaxeFighter, param3:HaxeSpell, param4:HaxeSpellEffect, param5:HaxeFighter) : Array
      {
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:* = null as SpellZone;
         var fightContext:FightContext = param1;
         var caster:HaxeFighter = param2;
         var effect:HaxeSpellEffect = param4;
         var triggeringFighter:HaxeFighter = param5;
         var _loc6_:Array = [];
         if(effect.actionId == 783)
         {
            _loc7_ = caster.getCurrentPositionCell();
            _loc8_ = fightContext.targetedCell;
            _loc9_ = MapTools.getLookDirection8ExactByCoord(MapTools.getCellCoordById(_loc7_),MapTools.getCellCoordById(_loc8_));
            _loc10_ = caster.getCurrentPositionCell();
            _loc6_ = fightContext.getFightersUpTo(_loc10_,_loc9_,1,1,1);
         }
         else if(effect.actionId == 1043)
         {
            _loc7_ = caster.getCurrentPositionCell();
            _loc8_ = fightContext.targetedCell;
            _loc9_ = MapTools.getLookDirection8ExactByCoord(MapTools.getCellCoordById(_loc7_),MapTools.getCellCoordById(_loc8_));
            _loc10_ = caster.getCurrentPositionCell();
            _loc6_ = fightContext.getFightersUpTo(_loc10_,_loc9_,param3.minimaleRange,param3.maximaleRange,1);
         }
         else
         {
            _loc11_ = effect.zone;
            _loc7_ = fightContext.targetedCell;
            _loc8_ = caster.getCurrentPositionCell();
            _loc6_ = fightContext.getFightersFromZone(_loc11_,_loc7_,_loc8_);
         }
         return FpUtils.arrayFilter_damageCalculation_fighterManagement_HaxeFighter(_loc6_,function(param1:HaxeFighter):Boolean
         {
            if(!(caster == param1 && effect.actionId == 90))
            {
               return Boolean(SpellManager.isSelectedByMask(caster,effect,param1,triggeringFighter,fightContext));
            }
            return true;
         });
      }
      
      public static function getAdditionalTargets(param1:FightContext, param2:HaxeFighter, param3:HaxeSpellEffect, param4:HaxeFighter, param5:Array) : Array
      {
         var fightContext:FightContext = param1;
         var caster:HaxeFighter = param2;
         var effect:HaxeSpellEffect = param3;
         var triggeringFighter:HaxeFighter = param4;
         return FpUtils.arrayFilter_damageCalculation_fighterManagement_HaxeFighter(TargetManagement.getOutOfAreaTarget(fightContext,caster,effect,triggeringFighter,param5),function(param1:HaxeFighter):Boolean
         {
            if(!(caster == param1 && effect.actionId == 90))
            {
               return Boolean(SpellManager.isSelectedByMask(caster,effect,param1,triggeringFighter,fightContext));
            }
            return true;
         });
      }
      
      public static function forceSelection(param1:HaxeFighter, param2:HaxeSpellEffect, param3:HaxeFighter) : Boolean
      {
         if(param1 == param3)
         {
            return param2.actionId == 90;
         }
         return false;
      }
      
      public static function applyComboBonusToCaster(param1:HaxeFighter, param2:FightContext) : void
      {
         var _loc4_:* = null as LinkedListNode;
         var _loc5_:* = null as LinkedListNode;
         var _loc3_:LinkedListNode = param1._buffs.head;
         while(_loc3_ != null)
         {
            _loc4_ = _loc3_;
            _loc3_ = _loc3_.next;
            _loc5_ = _loc4_;
            if(_loc5_.item.effect.actionId == 1027)
            {
               param1.getSummoner(param2).storePendingBuff(_loc5_.item);
            }
         }
         param1.removeBuffByActionId(1027);
      }
      
      public static function getOutOfAreaTarget(param1:FightContext, param2:HaxeFighter, param3:HaxeSpellEffect, param4:HaxeFighter, param5:Array) : Array
      {
         var _loc6_:String = param3.mask;
         var _loc7_:Array = [];
         if(int(param5.indexOf(param2)) == -1 && (int(_loc6_.indexOf("C")) != -1 || param3.actionId == 90 || param3.actionId == 4))
         {
            _loc7_.push(param2);
         }
         if(int(_loc6_.indexOf("O")) != -1 && param4 != null && int(param5.indexOf(param4)) == -1)
         {
            _loc7_.push(param4);
         }
         var _loc8_:HaxeFighter = param2.getCarried(param1);
         if(_loc8_ != null)
         {
            if((int(_loc6_.indexOf("K")) != -1 || param3.actionId == 51) && int(param5.indexOf(_loc8_)) == -1 && int(_loc7_.indexOf(_loc8_)) == -1)
            {
               _loc7_.push(_loc8_);
            }
         }
         else
         {
            _loc8_ = param1.getFighterFromCell(param1.targetedCell,true);
            if(int(_loc6_.indexOf("K")) != -1 && _loc8_ != null)
            {
               _loc7_.push(_loc8_);
            }
         }
         return _loc7_;
      }
      
      public static function comparePositions(param1:int, param2:Boolean, param3:int, param4:int) : int
      {
         var _loc7_:int = 0;
         var _loc5_:int = MapTools.getDistance(param3,param1);
         var _loc6_:int = MapTools.getDistance(param4,param1);
         if(_loc5_ == _loc6_)
         {
            _loc5_ = MapTools.getLookDirection8ByCoord(MapTools.getCellCoordById(param1),MapTools.getCellCoordById(param3));
            _loc6_ = MapTools.getLookDirection8ByCoord(MapTools.getCellCoordById(param1),MapTools.getCellCoordById(param4));
            if(_loc5_ == _loc6_)
            {
               _loc6_ = 0;
               if(_loc5_ == 0 || _loc5_ == 1 || _loc5_ == 6)
               {
                  _loc5_ = param3 < param4?-1:1;
               }
               else
               {
                  _loc5_ = param3 < param4?1:-1;
               }
            }
            else
            {
               _loc7_ = 1;
               _loc5_ = (_loc5_ + _loc7_) % 8;
               _loc6_ = (_loc6_ + _loc7_) % 8;
            }
         }
         return (_loc6_ - _loc5_) * (!!param2?1:-1);
      }
      
      public static function getBombsAboutToExplode(param1:HaxeFighter, param2:FightContext, param3:RunningEffect, param4:Array = undefined) : Array
      {
         var _loc7_:* = null as RunningEffect;
         var _loc10_:* = null as LinkedListNode;
         var _loc11_:* = null as LinkedListNode;
         var _loc14_:* = null as HaxeSpellEffect;
         var _loc15_:int = 0;
         var _loc16_:* = null as Array;
         var _loc17_:* = null as HaxeFighter;
         if(!(param1.playerType == PlayerTypeEnum.MONSTER && param1.data.isSummon() && int(HaxeFighter.BOMB_BREED_ID.indexOf(param1.breed)) != -1))
         {
            return null;
         }
         var _loc5_:Array = param4 == null?[]:param4;
         if(int(_loc5_.indexOf(param1)) != -1)
         {
            return _loc5_;
         }
         var _loc6_:HaxeSpell = DamageCalculator.dataInterface.getLinkedExplosionSpellFromFighter(param1);
         if(_loc6_ == null)
         {
            return _loc5_;
         }
         var _loc8_:int = param2.targetedCell;
         var _loc9_:LinkedListNode = param1._buffs.head;
         while(_loc9_ != null)
         {
            _loc10_ = _loc9_;
            _loc9_ = _loc9_.next;
            _loc11_ = _loc10_;
            if(_loc11_.item.effect.actionId == 1027)
            {
               param1.getSummoner(param2).storePendingBuff(_loc11_.item);
            }
         }
         param1.removeBuffByActionId(1027);
         _loc5_.push(param1);
         var _loc12_:int = 0;
         var _loc13_:Array = _loc6_.getEffects();
         while(_loc12_ < int(_loc13_.length))
         {
            _loc14_ = _loc13_[_loc12_];
            _loc12_++;
            if(_loc14_.actionId == 1009)
            {
               _loc7_ = new RunningEffect(param1,_loc6_,_loc14_);
               _loc7_.setParentEffect(param3);
               _loc7_.forceCritical = param3.forceCritical;
               _loc15_ = 0;
               _loc16_ = TargetManagement.getEffectTargets(param2,param1,_loc6_,_loc14_,null);
               while(_loc15_ < int(_loc16_.length))
               {
                  _loc17_ = _loc16_[_loc15_];
                  _loc15_++;
                  if(!(_loc17_ == param1 || param3.isTargetingAnAncestor(_loc17_) || !_loc17_.isLinkedBomb(param1)))
                  {
                     param2.targetedCell = int(_loc17_.getCurrentPositionCell());
                     _loc5_ = TargetManagement.getBombsAboutToExplode(_loc17_,param2,_loc7_,_loc5_);
                  }
               }
               param2.targetedCell = _loc8_;
            }
         }
         return _loc5_;
      }
   }
}
