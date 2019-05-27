package damageCalculation.damageManagement
{
   import damageCalculation.DamageCalculator;
   import damageCalculation.FightContext;
   import damageCalculation.fighterManagement.HaxeBuff;
   import damageCalculation.fighterManagement.HaxeFighter;
   import damageCalculation.fighterManagement.PlayerTypeEnum;
   import damageCalculation.spellManagement.HaxeSpellEffect;
   import damageCalculation.spellManagement.Mark;
   import damageCalculation.spellManagement.RunningEffect;
   import damageCalculation.tools.LinkedListNode;
   import mapTools.MapDirection;
   import mapTools.MapTools;
   import mapTools.SpellZone;
   
   public class PushUtils
   {
      
      public static var ALLOW_MARK_PREVIEW:Boolean = true;
      
      public static var MAX_WALL_LENGTH:int = 7;
      
      public static var WALL_ZONE:SpellZone = SpellZone.fromRawZone("X" + 7);
       
      
      public function PushUtils()
      {
      }
      
      public static function getPullDirection(param1:int, param2:int, param3:int, param4:Boolean = true) : int
      {
         var _loc5_:int = PushUtils.getPushDirection(param1,param2,param3,param4);
         if(_loc5_ == -1)
         {
            return _loc5_;
         }
         return int(MapDirection.getOppositeDirection(_loc5_));
      }
      
      public static function getPushDirection(param1:int, param2:int, param3:int, param4:Boolean = true) : int
      {
         var _loc6_:int = 0;
         if(param3 == param2 && (param3 == param1 || !param4))
         {
            return -1;
         }
         var _loc5_:int = param2 == param3?param1:param2;
         if(MapTools.isInDiag(_loc5_,param3))
         {
            _loc6_ = MapTools.getLookDirection4DiagExact(_loc5_,param3);
         }
         else
         {
            _loc6_ = MapTools.getLookDirection4(_loc5_,param3);
         }
         return _loc6_;
      }
      
      public static function getCollisionDamages(param1:FightContext, param2:HaxeFighter, param3:HaxeFighter, param4:int, param5:int) : DamageRange
      {
         var _loc6_:int = 0;
         if(!!param2.data.isSummon() && Number(param2.data.getSummonerId()) != 0)
         {
            _loc6_ = param2.getSummoner(param1).level;
         }
         else
         {
            _loc6_ = param2.level;
         }
         var _loc7_:* = int(param2.getCharacteristicValue("pushDamageBonus"));
         var _loc8_:int = param3.getCharacteristicValue("pushDamageFixedResist");
         _loc7_ = _loc7_ - _loc8_;
         var _loc9_:int = param4 * (int(Math.floor(_loc6_ / 2)) + 32 + _loc7_) / (4 * Math.pow(2,param5));
         var _loc10_:DamageRange = new DamageRange(_loc9_,_loc9_);
         _loc10_.minimizeBy(0);
         _loc10_.isCollision = true;
         return _loc10_;
      }
      
      public static function pull(param1:FightContext, param2:RunningEffect, param3:HaxeFighter, param4:int, param5:Boolean, param6:Boolean) : Array
      {
         var _loc8_:* = null as HaxeFighter;
         var _loc7_:HaxeFighter = param2.getCaster();
         if(param2.getSpellEffect().actionId == 1042)
         {
            _loc8_ = _loc7_;
            _loc7_ = param3;
            param3 = _loc8_;
         }
         var _loc9_:int = _loc7_.getCurrentPositionCell();
         if(param1.usingPortal())
         {
            _loc9_ = param1.map.getOutputPortalCell(param1.inputPortalCellId);
         }
         var _loc10_:int = !!param1.inMovement?int(param3.getCurrentPositionCell()):int(param3.getBeforeLastSpellPosition());
         var _loc11_:int = PushUtils.getPullDirection(_loc9_,param1.targetedCell,_loc10_,!param1.inMovement);
         return PushUtils.drag(param1,param2,param3,param4,_loc11_,param5,false,param6,true);
      }
      
      public static function push(param1:FightContext, param2:RunningEffect, param3:HaxeFighter, param4:int, param5:Boolean, param6:Boolean, param7:Boolean) : Array
      {
         var _loc10_:* = null as HaxeFighter;
         var _loc8_:HaxeFighter = param2.getCaster();
         var _loc9_:int = _loc8_.getBeforeLastSpellPosition();
         if(param1.usingPortal())
         {
            _loc9_ = param1.map.getOutputPortalCell(param1.inputPortalCellId);
         }
         if(param2.getSpellEffect().actionId == 1041)
         {
            _loc10_ = _loc8_;
            _loc8_ = param3;
            param3 = _loc10_;
         }
         var _loc11_:int = !!param1.inMovement?int(param3.getCurrentPositionCell()):int(param3.getBeforeLastSpellPosition());
         var _loc12_:int = PushUtils.getPushDirection(_loc9_,param1.targetedCell,_loc11_,!param1.inMovement);
         return PushUtils.drag(param1,param2,param3,param4,_loc12_,param5,param6,param7,false);
      }
      
      public static function pullTo(param1:FightContext, param2:RunningEffect, param3:HaxeFighter, param4:Boolean, param5:Boolean) : Array
      {
         var _loc6_:int = MapTools.getDistance(param1.targetedCell,int(param3.getBeforeLastSpellPosition()));
         var _loc7_:FightContext = param1.copy();
         _loc7_.targetedCell = int(param2.getCaster().getBeforeLastSpellPosition());
         return PushUtils.pull(_loc7_,param2,param3,_loc6_,param4,param5);
      }
      
      public static function pushTo(param1:FightContext, param2:RunningEffect, param3:HaxeFighter, param4:Boolean, param5:Boolean, param6:Boolean) : Array
      {
         var _loc7_:int = MapTools.getDistance(param1.targetedCell,int(param3.getBeforeLastSpellPosition()));
         var _loc8_:FightContext = param1.copy();
         _loc8_.targetedCell = int(param2.getCaster().getBeforeLastSpellPosition());
         return PushUtils.push(_loc8_,param2,param3,_loc7_,param4,param5,param6);
      }
      
      public static function drag(param1:FightContext, param2:RunningEffect, param3:HaxeFighter, param4:int, param5:int, param6:Boolean, param7:Boolean, param8:Boolean, param9:Boolean) : Array
      {
         var _loc10_:* = null;
         var _loc11_:Boolean = false;
         var _loc15_:* = null as HaxeFighter;
         var _loc16_:* = null as FightContext;
         var _loc17_:* = null as EffectOutput;
         if(!param6 && !(!param3.hasStateEffect(3) && param3.data.canBreedBePushed() && !param3.hasStateEffect(0)) || param5 == -1)
         {
            return [];
         }
         if(MapDirection.isCardinal(param5))
         {
            param4 = Math.ceil(param4 / 2);
         }
         var _loc12_:Boolean = false;
         var _loc13_:* = false;
         var _loc14_:Array = [];
         do
         {
            _loc10_ = PushUtils.getDragCellDest(param1,param3,param5,param4);
            if(int(_loc10_.cell) != int(param3.getCurrentPositionCell()))
            {
               _loc12_ = true;
               _loc13_ = _loc10_.stopReason == DragResultEnum.PORTAL;
               _loc15_ = param3.getCarried(param1);
               if(_loc15_ != null)
               {
                  _loc16_ = param1.copy();
                  _loc16_.targetedCell = int(param3.getCurrentPositionCell());
                  _loc14_ = _loc14_.concat(Teleport.throwFighter(param1,param3));
               }
            }
            _loc11_ = PushUtils.applyDrag(param1,param2,param3,int(_loc10_.cell),param8);
            param4 = _loc10_.remainingForce;
         }
         while(!!_loc11_ && _loc10_.stopReason == DragResultEnum.PORTAL && param4 > 0);
         
         if(_loc12_)
         {
            _loc17_ = new EffectOutput(param3.id);
            _loc17_.movement = new MovementInfos(int(_loc10_.cell),-1);
            _loc17_.throughPortal = _loc13_;
            if(param9)
            {
               _loc17_.isPulled = true;
            }
            else
            {
               _loc17_.isPushed = true;
            }
            _loc14_.push(_loc17_);
         }
         if(param7)
         {
            PushUtils.applyCollisionDamages(param1,param2,param3,_loc10_,param5,param8);
         }
         if(_loc12_)
         {
            PushUtils.executeMarks(param1,param2,param3,int(_loc10_.cell),param8);
         }
         return _loc14_;
      }
      
      public static function getDragCellDest(param1:FightContext, param2:HaxeFighter, param3:int, param4:int) : Object
      {
         var _loc6_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:* = null as Array;
         var _loc11_:Boolean = false;
         var _loc12_:Boolean = false;
         var _loc13_:int = 0;
         var _loc14_:* = null as Mark;
         var _loc15_:* = null as DragResultEnum;
         var _loc5_:int = param2.getCurrentPositionCell();
         var _loc7_:int = 0;
         var _loc8_:int = param4;
         while(_loc7_ < _loc8_)
         {
            _loc7_++;
            _loc9_ = _loc7_;
            _loc6_ = _loc5_;
            _loc5_ = MapTools.getNextCellByDirection(_loc5_,param3);
            if(PushUtils.isPathBlocked(param1,_loc6_,_loc5_,param3))
            {
               return {
                  "remainingForce":param4 - _loc9_,
                  "cell":_loc6_,
                  "stopReason":DragResultEnum.COLLISION
               };
            }
            _loc10_ = param1.map.getMarkInteractingWithCell(_loc5_);
            _loc11_ = false;
            _loc12_ = false;
            if(_loc10_ != null)
            {
               _loc13_ = 0;
               while(_loc13_ < int(_loc10_.length))
               {
                  _loc14_ = _loc10_[_loc13_];
                  _loc13_++;
                  if(_loc14_.markType != 0)
                  {
                     if(!_loc11_ && (_loc14_.stopDrag() || _loc14_.markType == 4))
                     {
                        _loc11_ = true;
                     }
                     if(!_loc12_ && _loc14_.markType != 4 && _loc14_.stopDrag())
                     {
                        _loc12_ = true;
                     }
                     if(!!_loc11_ && _loc12_)
                     {
                        break;
                     }
                  }
               }
            }
            if(_loc11_)
            {
               _loc15_ = !!_loc12_?DragResultEnum.ACTIVE_OBJECT:DragResultEnum.PORTAL;
               return {
                  "remainingForce":param4 - _loc9_ - 1,
                  "cell":_loc5_,
                  "stopReason":_loc15_
               };
            }
         }
         return {
            "remainingForce":0,
            "cell":_loc5_,
            "stopReason":DragResultEnum.COMPLETE
         };
      }
      
      public static function applyDrag(param1:FightContext, param2:RunningEffect, param3:HaxeFighter, param4:int, param5:Boolean) : Boolean
      {
         var _loc6_:* = null as Array;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         if(param4 == int(param3.getCurrentPositionCell()))
         {
            return false;
         }
         if(!param5)
         {
            _loc6_ = MapTools.getCellsIdOnLargeWay(int(param3.getCurrentPositionCell()),param4);
            if(_loc6_ != null)
            {
               _loc7_ = 0;
               while(_loc7_ < int(_loc6_.length))
               {
                  _loc8_ = _loc6_[_loc7_];
                  _loc7_++;
                  param1.map.dispellIllusionOnCell(_loc8_);
               }
            }
         }
         param3.setCurrentPositionCell(param4);
         if(!!param3.data.canBreedUsePortals() && !param3.hasStateEffect(17))
         {
            _loc6_ = param1.map.getMarkInteractingWithCell(param4,4);
            if(int(_loc6_.length) > 0 && (_loc6_[0].teamId == param3.teamId || param1.gameTurn != 1))
            {
               _loc7_ = param1.map.getOutputPortalCell(param4);
               if(MapTools.isValidCellId(_loc7_))
               {
                  param3.setCurrentPositionCell(_loc7_);
               }
            }
         }
         return true;
      }
      
      public static function executeMarks(param1:FightContext, param2:RunningEffect, param3:HaxeFighter, param4:int, param5:Boolean) : void
      {
         var _loc7_:int = 0;
         var _loc8_:* = null as Mark;
         var _loc6_:Array = param1.map.getMarkInteractingWithCell(param4);
         if(_loc6_ != null)
         {
            _loc7_ = 0;
            while(_loc7_ < int(_loc6_.length))
            {
               _loc8_ = _loc6_[_loc7_];
               _loc7_++;
               if(int(param1.triggeredMarks.indexOf(_loc8_.markId)) == -1)
               {
                  switch(_loc8_.markType)
                  {
                     default:
                     default:
                        continue;
                     case 2:
                        PushUtils.executeMarkSpell(param3,_loc8_,param2,param1,param5);
                        continue;
                     case 3:
                        PushUtils.executeWallDamage(param3,_loc8_,param2,param1,param5);
                        continue;
                  }
               }
               else
               {
                  continue;
               }
            }
         }
      }
      
      public static function executeMarkSpell(param1:HaxeFighter, param2:Mark, param3:RunningEffect, param4:FightContext, param5:Boolean) : void
      {
         param4.triggeredMarks.push(param2.markId);
         var _loc6_:FightContext = param4.copy();
         _loc6_.targetedCell = param2.mainCell;
         _loc6_.inMovement = true;
         var _loc7_:HaxeFighter = param2.casterId != 0?param4.getFighterById(param2.casterId):param3.getCaster();
         param1.savePositionBeforeSpellExecution();
         var _loc8_:Boolean = _loc7_.id != param4.originalCaster.id && _loc7_.playerType == PlayerTypeEnum.HUMAN;
         DamageCalculator.executeSpell(_loc6_,_loc7_,param2.associatedSpell,param3.forceCritical,param3,param5,_loc8_);
      }
      
      public static function executeWallDamage(param1:HaxeFighter, param2:Mark, param3:RunningEffect, param4:FightContext, param5:Boolean) : void
      {
         var _loc8_:* = null as HaxeFighter;
         var _loc9_:* = null as LinkedListNode;
         var _loc10_:* = null as LinkedListNode;
         var _loc11_:* = null as LinkedListNode;
         var _loc6_:int = 0;
         var _loc7_:Array = PushUtils.getBombsLinkedToWall(param1,param4);
         while(_loc6_ < int(_loc7_.length))
         {
            _loc8_ = _loc7_[_loc6_];
            _loc6_++;
            _loc9_ = _loc8_._buffs.head;
            while(_loc9_ != null)
            {
               _loc10_ = _loc9_;
               _loc9_ = _loc9_.next;
               _loc11_ = _loc10_;
               if(_loc11_.item.effect.actionId == 1027)
               {
                  _loc8_.getSummoner(param4).storePendingBuff(_loc11_.item);
               }
            }
            _loc8_.removeBuffByActionId(1027);
         }
         PushUtils.executeMarkSpell(param1,param2,param3,param4,param5);
      }
      
      public static function getBombsLinkedToWall(param1:HaxeFighter, param2:FightContext) : Array
      {
         var _loc6_:int = 0;
         var _loc7_:* = null as HaxeFighter;
         var _loc8_:int = 0;
         var _loc9_:* = null as HaxeFighter;
         var _loc3_:Array = [];
         var _loc4_:Array = [];
         var mainMark:Mark = param2.map.getMarkInteractingWithCell(int(param1.getCurrentPositionCell()),3)[0];
         var _loc5_:Array = param2.getFightersFromZone(PushUtils.WALL_ZONE,mainMark.mainCell,mainMark.mainCell);
         _loc5_.sort(function(param1:HaxeFighter, param2:HaxeFighter):int
         {
            return int(TargetManagement.comparePositions(mainMark.mainCell,false,int(param1.getCurrentPositionCell()),int(param2.getCurrentPositionCell())));
         });
         _loc6_ = 0;
         while(_loc6_ < int(_loc5_.length))
         {
            _loc7_ = _loc5_[_loc6_];
            _loc6_++;
            if(_loc7_.playerType == PlayerTypeEnum.MONSTER && _loc7_.data.isSummon() && int(HaxeFighter.BOMB_BREED_ID.indexOf(_loc7_.breed)) != -1 && Number(_loc7_.data.getSummonerId()) == mainMark.casterId)
            {
               if(int(_loc3_.length) == 0)
               {
                  _loc3_.push(_loc7_);
               }
               else
               {
                  _loc8_ = 0;
                  while(_loc8_ < int(_loc3_.length))
                  {
                     _loc9_ = _loc3_[_loc8_];
                     _loc8_++;
                     if(int(_loc3_.indexOf(_loc7_)) == -1)
                     {
                        _loc3_.push(_loc7_);
                     }
                     if(_loc9_ != _loc7_ && _loc7_.breed == _loc9_.breed && int(MapTools.getLookDirection4(int(_loc7_.getCurrentPositionCell()),int(_loc9_.getCurrentPositionCell()))) != -1 && int(MapTools.getDistance(int(_loc7_.getCurrentPositionCell()),int(_loc9_.getCurrentPositionCell()))) <= 7)
                     {
                        if(int(_loc4_.indexOf(_loc7_)) == -1)
                        {
                           _loc4_.push(_loc7_);
                        }
                        if(int(_loc4_.indexOf(_loc9_)) == -1)
                        {
                           _loc4_.push(_loc9_);
                        }
                        if(int(_loc4_.length) == 3)
                        {
                           return _loc4_;
                        }
                     }
                  }
               }
               continue;
            }
         }
         if(int(_loc4_.length) < 3 && int(_loc3_.length) < 3)
         {
            _loc6_ = 0;
            while(_loc6_ < int(_loc4_.length))
            {
               _loc7_ = _loc4_[_loc6_];
               _loc6_++;
               if(int(_loc4_.length) == 3)
               {
                  break;
               }
               _loc5_ = param2.getFightersFromZone(PushUtils.WALL_ZONE,int(_loc7_.getCurrentPositionCell()),int(_loc7_.getCurrentPositionCell()));
               _loc8_ = 0;
               while(_loc8_ < int(_loc5_.length))
               {
                  _loc9_ = _loc5_[_loc8_];
                  _loc8_++;
                  if(Number(_loc9_.data.getSummonerId()) == mainMark.casterId && (_loc9_.playerType == PlayerTypeEnum.MONSTER && _loc9_.data.isSummon() && int(HaxeFighter.BOMB_BREED_ID.indexOf(_loc9_.breed)) != -1) && int(_loc4_.indexOf(_loc9_)) == -1 && _loc9_.breed == _loc7_.breed)
                  {
                     _loc4_.push(_loc9_);
                     break;
                  }
               }
            }
         }
         return _loc4_;
      }
      
      public static function applyCollisionDamages(param1:FightContext, param2:RunningEffect, param3:HaxeFighter, param4:Object, param5:int, param6:Boolean) : void
      {
         var _loc11_:* = null as HaxeFighter;
         if(!param3.isAlive() || int(param4.remainingForce) <= 0 || param2.getCaster() == null || param4.stopReason == DragResultEnum.ACTIVE_OBJECT)
         {
            return;
         }
         if(MapDirection.isCardinal(param5))
         {
            param4.remainingForce = int(param4.remainingForce) * 2;
         }
         var _loc7_:HaxeFighter = param2.getCaster();
         if(_loc7_.playerType == PlayerTypeEnum.MONSTER && _loc7_.data.isSummon() && int(HaxeFighter.BOMB_BREED_ID.indexOf(_loc7_.breed)) != -1 || _loc7_.playerType == PlayerTypeEnum.MONSTER && _loc7_.data.isSummon() && int(HaxeFighter.STEAMER_TURRET_BREED_ID.indexOf(_loc7_.breed)) != -1)
         {
            _loc7_ = _loc7_.getSummoner(param1);
         }
         PushUtils.applyCollisionDamagesOnTarget(param1,param2,param3,int(param4.remainingForce),0,param6);
         var _loc8_:Array = PushUtils.getCollateralTargets(param1,int(param4.cell),param5,int(param4.remainingForce));
         var _loc9_:int = 1;
         var _loc10_:int = 0;
         while(_loc10_ < int(_loc8_.length))
         {
            _loc11_ = _loc8_[_loc10_];
            _loc10_++;
            PushUtils.applyCollisionDamagesOnTarget(param1,param2,_loc11_,int(param4.remainingForce),_loc9_,param6);
            _loc9_++;
         }
      }
      
      public static function applyCollisionDamagesOnTarget(param1:FightContext, param2:RunningEffect, param3:HaxeFighter, param4:int, param5:int, param6:Boolean) : void
      {
         var _loc7_:HaxeSpellEffect = new HaxeSpellEffect(param2.getSpellEffect().id,1,0,80,param4,param5,0,0,param2.getSpellEffect().isCritical,"I","P","a,A",0,0,true,0,2);
         var _loc8_:RunningEffect = param2.copy();
         _loc8_.overrideSpellEffect(_loc7_);
         DamageCalculator.computeEffect(param1,_loc8_,param6,[param3],null);
      }
      
      public static function getCollateralTargets(param1:FightContext, param2:int, param3:int, param4:int) : Array
      {
         var _loc5_:Array = [];
         param2 = MapTools.getNextCellByDirection(param2,param3);
         var _loc6_:HaxeFighter = param1.getFighterFromCell(param2,true);
         while(param4 > 0 && _loc6_ != null && _loc6_.isAlive())
         {
            _loc5_.push(_loc6_);
            param2 = MapTools.getNextCellByDirection(param2,param3);
            _loc6_ = param1.getFighterFromCell(param2);
            param4--;
         }
         return _loc5_;
      }
      
      public static function isPathBlocked(param1:FightContext, param2:int, param3:int, param4:int) : Boolean
      {
         if(!!param1.isCellEmptyForMovement(param3) && MapTools.adjacentCellsAllowAccess(param1,param2,param4))
         {
            return false;
         }
         return true;
      }
   }
}
