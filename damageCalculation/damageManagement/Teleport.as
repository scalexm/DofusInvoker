package damageCalculation.damageManagement
{
   import damageCalculation.FightContext;
   import damageCalculation.fighterManagement.HaxeBuff;
   import damageCalculation.fighterManagement.HaxeFighter;
   import damageCalculation.spellManagement.HaxeSpell;
   import damageCalculation.spellManagement.HaxeSpellEffect;
   import damageCalculation.spellManagement.RunningEffect;
   import haxe.ds.ArraySort;
   import mapTools.MapTools;
   import mapTools.Point;
   import mapTools.SpellZone;
   import tools.ActionIdHelper;
   
   public class Teleport
   {
      
      public static var SAME_DIRECTION:int = -1;
      
      public static var OPPOSITE_DIRECTION:int = -2;
       
      
      public function Teleport()
      {
      }
      
      public static function teleportFighter(param1:FightContext, param2:RunningEffect, param3:HaxeFighter, param4:Boolean) : Array
      {
         var _loc6_:* = null as HaxeFighter;
         var _loc7_:int = 0;
         var _loc9_:Boolean = false;
         var _loc11_:* = null as HaxeFighter;
         var _loc5_:Array = [];
         var _loc8_:int = param2.getSpellEffect().actionId;
         var _loc10_:int = _loc8_;
         if(_loc10_ != 4)
         {
            if(_loc10_ != 1104)
            {
               _loc9_ = ActionIdHelper.isExchange(_loc8_);
               if(_loc9_ == true)
               {
                  _loc6_ = param2.getCaster();
               }
               else
               {
                  _loc6_ = param3;
               }
            }
            addr49:
            _loc10_ = _loc8_;
            if(_loc10_ != 1099)
            {
               if(_loc10_ != 1100)
               {
                  if(_loc10_ != 4)
                  {
                     if(_loc10_ != 1104)
                     {
                        _loc9_ = ActionIdHelper.isExchange(_loc8_);
                        _loc7_ = _loc9_ == true?-1:-2;
                     }
                  }
                  _loc7_ = MapTools.getLookDirection4(int(param2.getCaster().getCurrentPositionCell()),param1.targetedCell);
               }
               addr92:
               _loc10_ = Teleport.getTeleportedPosition(param1,param2,_loc6_,param1.targetedCell);
               if(_loc10_ == int(_loc6_.getCurrentPositionCell()) && ActionIdHelper.isExchange(_loc8_))
               {
                  _loc10_ = param3.getCurrentPositionCell();
               }
               if(_loc10_ != int(_loc6_.getCurrentPositionCell()))
               {
                  _loc11_ = null;
                  if(param1.map.isCellWalkable(_loc10_))
                  {
                     _loc11_ = param1.getFighterFromCell(_loc10_,true);
                     if(_loc11_ != null && _loc11_.isAlive())
                     {
                        if(_loc8_ == 1023 || !_loc11_.hasStateEffect(3) && !_loc11_.hasStateEffect(18) && !_loc11_.hasState(3) && !_loc11_.hasState(8) && (_loc11_.data.canBreedSwitchPos() || ActionIdHelper.canTeleportOverBreedSwitchPos(-1)) && (!_loc6_.hasStateEffect(3) && !_loc6_.hasStateEffect(18) && !_loc6_.hasState(3) && !_loc6_.hasState(8) && (_loc6_.data.canBreedSwitchPos() || ActionIdHelper.canTeleportOverBreedSwitchPos(_loc8_))))
                        {
                           _loc5_.push(EffectOutput.fromMovement(_loc11_.id,int(_loc6_.getCurrentPositionCell()),-1,_loc6_));
                           _loc11_.setCurrentPositionCell(int(_loc6_.getCurrentPositionCell()));
                        }
                        else
                        {
                           return [];
                        }
                     }
                     else
                     {
                        _loc11_ = null;
                     }
                     _loc6_.setCurrentPositionCell(_loc10_);
                  }
                  else
                  {
                     _loc10_ = -1;
                  }
                  _loc5_.push(EffectOutput.fromMovement(_loc6_.id,_loc10_,_loc7_,_loc11_));
               }
               return _loc5_;
            }
            _loc7_ = -1;
            §§goto(addr92);
         }
         _loc6_ = param2.getCaster();
         §§goto(addr49);
      }
      
      public static function getTeleportedPosition(param1:FightContext, param2:RunningEffect, param3:HaxeFighter, param4:int) : int
      {
         var _loc5_:Boolean = false;
         var _loc6_:int = 0;
         var _loc7_:* = null as Point;
         var _loc8_:Boolean = false;
         var _loc9_:int = 0;
         var _loc10_:* = null as SpellZone;
         var _loc11_:* = null as Array;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:* = null as Point;
         var _loc15_:* = null as Point;
         var fightContext:FightContext = param1;
         var runningEffect:RunningEffect = param2;
         if(param3.isAlive())
         {
            _loc6_ = runningEffect.getSpellEffect().actionId;
            _loc5_ = !param3.hasStateEffect(3) && !param3.hasStateEffect(18) && !param3.hasState(3) && !param3.hasState(8) && (param3.data.canBreedSwitchPos() || ActionIdHelper.canTeleportOverBreedSwitchPos(_loc6_));
         }
         else
         {
            _loc5_ = false;
         }
         if(_loc5_)
         {
            _loc6_ = runningEffect.getSpellEffect().actionId;
            _loc9_ = _loc6_;
            if(_loc9_ == 4)
            {
               _loc8_ = ActionIdHelper.isExchange(_loc6_);
               if(_loc8_ == true)
               {
                  return param4;
               }
               if(fightContext.isCellEmptyForMovement(param4))
               {
                  return param4;
               }
               if(runningEffect.getSpellEffect().rawZone.charAt(0) != "P")
               {
                  _loc10_ = SpellZone.fromRawZone(runningEffect.getSpellEffect().rawZone);
                  _loc11_ = _loc10_.getCells(param4,int(param3.getCurrentPositionCell()));
                  ArraySort.sort(_loc11_,function(param1:int, param2:int):int
                  {
                     return int(TargetManagement.comparePositions(fightContext.targetedCell,Boolean(ActionIdHelper.isPush(runningEffect.getSpellEffect().actionId)),param1,param2));
                  });
                  _loc12_ = 0;
                  while(_loc12_ < int(_loc11_.length))
                  {
                     _loc13_ = _loc11_[_loc12_];
                     _loc12_++;
                     if(fightContext.isCellEmptyForMovement(_loc13_))
                     {
                        return _loc13_;
                     }
                  }
               }
               return int(param3.getCurrentPositionCell());
            }
            if(_loc9_ == 1099)
            {
               return int(param3.data.getTurnBeginPosition());
            }
            if(_loc9_ == 1100)
            {
               return int(param3.getPendingPreviousPosition());
            }
            if(_loc9_ != 1104)
            {
               if(_loc9_ != 1106)
               {
                  if(_loc9_ == 1105)
                  {
                     _loc7_ = MapTools.getCellCoordById(int(runningEffect.getCaster().getCurrentPositionCell()));
                  }
                  else
                  {
                     _loc8_ = ActionIdHelper.isExchange(_loc6_);
                     if(_loc8_ == true)
                     {
                        return param4;
                     }
                     _loc7_ = null;
                  }
               }
               addr236:
               if(_loc7_ != null)
               {
                  _loc14_ = new Point(0,0);
                  _loc15_ = new Point(0,0);
                  _loc14_.x = _loc7_.x - MapTools.getCellCoordById(int(param3.getCurrentPositionCell())).x;
                  _loc14_.y = _loc7_.y - MapTools.getCellCoordById(int(param3.getCurrentPositionCell())).y;
                  _loc15_.x = _loc7_.x + _loc14_.x;
                  _loc15_.y = _loc7_.y + _loc14_.y;
                  return int(MapTools.getCellIdByCoord(_loc15_.x,_loc15_.y));
               }
            }
            _loc7_ = MapTools.getCellCoordById(param4);
            §§goto(addr236);
         }
         return int(param3.getCurrentPositionCell());
      }
      
      public static function throwFighter(param1:FightContext, param2:HaxeFighter) : Array
      {
         var _loc3_:HaxeFighter = param2.getCarried(param1);
         if(_loc3_ == null)
         {
            return [];
         }
         param2.removeState(3);
         param2.carryFighter(null);
         _loc3_.removeState(8);
         _loc3_.setCurrentPositionCell(param1.targetedCell);
         var _loc4_:int = MapTools.getLookDirection4(int(param2.getCurrentPositionCell()),param1.targetedCell);
         var _loc5_:EffectOutput = EffectOutput.fromMovement(_loc3_.id,param1.targetedCell,_loc4_);
         _loc5_.throwedBy = param2.id;
         return [EffectOutput.fromStateChange(param2.id,3,false),EffectOutput.fromStateChange(_loc3_.id,8,false),_loc5_];
      }
      
      public static function carryFighter(param1:FightContext, param2:RunningEffect, param3:HaxeFighter) : Array
      {
         if(!(!param3.hasStateEffect(3) && param3.data.canBreedBeCarried() && !param3.hasStateEffect(4)))
         {
            return [];
         }
         var _loc4_:HaxeSpellEffect = param2.getSpellEffect().clone();
         _loc4_.actionId = 950;
         _loc4_.param3 = 3;
         _loc4_.param1 = 0;
         param2.getCaster().storePendingBuff(new HaxeBuff(param2.getCaster().id,param2.getSpell(),_loc4_));
         param2.getCaster().carryFighter(param3);
         var _loc5_:HaxeSpellEffect = param2.getSpellEffect().clone();
         _loc5_.actionId = 950;
         _loc5_.param3 = 8;
         _loc5_.param1 = 0;
         param3.storePendingBuff(new HaxeBuff(param2.getCaster().id,param2.getSpell(),_loc5_));
         param3.setCurrentPositionCell(int(param2.getCaster().getCurrentPositionCell()));
         var _loc6_:int = MapTools.getLookDirection4(int(param2.getCaster().getCurrentPositionCell()),param1.targetedCell);
         var _loc7_:EffectOutput = EffectOutput.fromMovement(param3.id,int(param2.getCaster().getCurrentPositionCell()),_loc6_);
         _loc7_.carriedBy = param2.getCaster().id;
         return [EffectOutput.fromStateChange(param2.getCaster().id,3,true),EffectOutput.fromStateChange(param3.id,8,true),_loc7_];
      }
   }
}
