package damageCalculation
{
   import damageCalculation.damageManagement.DamageRange;
   import damageCalculation.damageManagement.EffectOutput;
   import damageCalculation.damageManagement.MovementInfos;
   import damageCalculation.damageManagement.TargetManagement;
   import damageCalculation.fighterManagement.HaxeFighter;
   import damageCalculation.spellManagement.HaxeSpellEffect;
   import damageCalculation.spellManagement.Mark;
   import haxe.ds.ArraySort;
   import haxe.ds.List;
   import haxe.ds._List.ListNode;
   import mapTools.MapTools;
   import mapTools.SpellZone;
   import tools.FpUtils;
   
   public class FightContext
   {
       
      
      public var triggeredMarks:Array;
      
      public var targetedCell:int;
      
      public var originalCaster:HaxeFighter;
      
      public var map:IMapInfo;
      
      public var inputPortalCellId:int;
      
      public var inMovement:Boolean;
      
      public var gameTurn:int;
      
      public var fighters:Array;
      
      public var fighterInitialPositions:List;
      
      public function FightContext(param1:int, param2:IMapInfo, param3:int, param4:HaxeFighter, param5:Array = undefined, param6:int = -1)
      {
         var _loc9_:* = null as HaxeFighter;
         inMovement = false;
         gameTurn = param1;
         map = param2;
         targetedCell = param3;
         originalCaster = param4;
         triggeredMarks = [];
         inputPortalCellId = param6;
         if(param5 == null)
         {
            fighters = [];
         }
         else
         {
            fighters = param5;
         }
         if(int(fighters.indexOf(param4)) == -1)
         {
            fighters.push(param4);
         }
         fighterInitialPositions = param2.getFightersInitialPositions();
         var _loc7_:int = 0;
         var _loc8_:Array = fighters;
         while(_loc7_ < int(_loc8_.length))
         {
            _loc9_ = _loc8_[_loc7_];
            _loc7_++;
            removeFighterCells(_loc9_.id);
         }
      }
      
      public function usingPortal() : Boolean
      {
         return inputPortalCellId != -1;
      }
      
      public function removeFighterCells(param1:Number) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc2_:ListNode = fighterInitialPositions.h;
         while(_loc2_ != null)
         {
            _loc3_ = _loc2_.item;
            _loc2_ = _loc2_.next;
            _loc4_ = _loc3_;
            if(Number(_loc4_.id) == param1)
            {
               fighterInitialPositions.remove(_loc4_);
               break;
            }
         }
      }
      
      public function isCellEmptyForMovement(param1:int) : Boolean
      {
         var _loc4_:* = null as HaxeFighter;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc2_:int = 0;
         var _loc3_:Array = fighters;
         while(_loc2_ < int(_loc3_.length))
         {
            _loc4_ = _loc3_[_loc2_];
            _loc2_++;
            if(int(_loc4_.getCurrentPositionCell()) == param1)
            {
               return false;
            }
         }
         var _loc5_:ListNode = fighterInitialPositions.h;
         while(_loc5_ != null)
         {
            _loc6_ = _loc5_.item;
            _loc5_ = _loc5_.next;
            _loc7_ = _loc6_;
            if(int(_loc7_.cell) == param1)
            {
               return false;
            }
         }
         return Boolean(map.isCellWalkable(param1));
      }
      
      public function getPortalBonus() : int
      {
         var _loc5_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:* = null as Mark;
         var _loc10_:* = null as Array;
         var _loc11_:* = null as HaxeSpellEffect;
         var _gthis:FightContext = this;
         var _loc1_:Array = FpUtils.arrayFilter_damageCalculation_spellManagement_Mark(map.getMarks(4),function(param1:Mark):Boolean
         {
            return param1.active;
         });
         if(int(_loc1_.length) == 0)
         {
            return 0;
         }
         var _loc2_:* = 0;
         var _loc3_:int = 0;
         var _loc4_:Mark = FpUtils.arrayFind_damageCalculation_spellManagement_Mark(_loc1_,function(param1:Mark):Boolean
         {
            return param1.mainCell == _gthis.inputPortalCellId;
         });
         if(_loc4_ == null)
         {
            return 0;
         }
         var _loc6_:Mark = null;
         var _loc7_:int = 0;
         var currentPortal:Mark = _loc4_;
         _loc1_ = FpUtils.arrayFilter_damageCalculation_spellManagement_Mark(_loc1_,function(param1:Mark):Boolean
         {
            return param1.teamId == currentPortal.teamId;
         });
         FpUtils.arrayRemove_damageCalculation_spellManagement_Mark(_loc1_,currentPortal);
         while(true)
         {
            _loc5_ = -1;
            ArraySort.sort(_loc1_,function(param1:Mark, param2:Mark):int
            {
               return int(TargetManagement.comparePositions(currentPortal.mainCell,false,param1.mainCell,param2.mainCell));
            });
            _loc8_ = 0;
            while(_loc8_ < int(_loc1_.length))
            {
               _loc9_ = _loc1_[_loc8_];
               _loc8_++;
               _loc7_ = MapTools.getDistance(_loc9_.mainCell,currentPortal.mainCell);
               if(_loc7_ < _loc5_ || _loc5_ == -1)
               {
                  _loc5_ = _loc7_;
                  _loc6_ = _loc9_;
               }
            }
            if(_loc6_ != null)
            {
               _loc8_ = 0;
               _loc10_ = _loc6_.associatedSpell.getEffects();
               while(_loc8_ < int(_loc10_.length))
               {
                  _loc11_ = _loc10_[_loc8_];
                  _loc8_++;
                  if(_loc11_.actionId == 1181)
                  {
                     _loc3_ = Number(Math.max(_loc3_,int(_loc11_.getMinRoll())));
                  }
               }
               _loc2_ = _loc2_ + _loc5_;
               currentPortal = _loc6_;
               FpUtils.arrayRemove_damageCalculation_spellManagement_Mark(_loc1_,currentPortal);
               if(int(_loc1_.length) <= 0)
               {
                  return _loc3_ + (_loc2_ << 1);
               }
               continue;
            }
            break;
         }
         throw "There is no nearest Portal";
      }
      
      public function getFightersUpTo(param1:int, param2:int, param3:int, param4:int, param5:int) : Array
      {
         var _loc6_:Array = [];
         var _loc7_:HaxeFighter = null;
         do
         {
            param1 = MapTools.getNextCellByDirection(param1,param2);
            param3--;
            param4--;
            if(param3 <= 0)
            {
               _loc7_ = getFighterFromCell(param1);
               if(_loc7_ != null)
               {
                  _loc6_.push(_loc7_);
                  param5--;
               }
            }
         }
         while(_loc7_ == null && MapTools.isValidCellId(param1) && param4 > 0 && param5 > 0);
         
         return _loc6_;
      }
      
      public function getFightersFromZone(param1:SpellZone, param2:int, param3:int) : Array
      {
         var _loc8_:* = null as HaxeFighter;
         var _loc10_:* = null;
         var _loc11_:* = null;
         if(!MapTools.isValidCellId(param2) || !MapTools.isValidCellId(param3))
         {
            return [];
         }
         var _loc4_:Array = [];
         var _loc5_:Function = function(param1:HaxeFighter, param2:String):Boolean
         {
            if(param1.isAlive() || param2 == "A")
            {
               if(!(!param1.hasState(8) || param2 == "a"))
               {
                  return param2 == "A";
               }
               return true;
            }
            return false;
         };
         var _loc6_:int = 0;
         var _loc7_:Array = fighters;
         while(_loc6_ < int(_loc7_.length))
         {
            _loc8_ = _loc7_[_loc6_];
            _loc6_++;
            if(!!_loc5_(_loc8_,param1.shape) && param1.isCellInZone(int(_loc8_.getBeforeLastSpellPosition()),param2,param3))
            {
               _loc4_.push(_loc8_);
            }
         }
         var _loc9_:ListNode = fighterInitialPositions.h;
         while(_loc9_ != null)
         {
            _loc10_ = _loc9_.item;
            _loc9_ = _loc9_.next;
            _loc11_ = _loc10_;
            if(param1.isCellInZone(int(_loc11_.cell),param2,param3))
            {
               _loc8_ = createFighterById(Number(_loc11_.id));
               if(_loc8_ != null && _loc5_(_loc8_,param1.shape))
               {
                  _loc4_.push(_loc8_);
               }
            }
         }
         return _loc4_;
      }
      
      public function getFighterFromCell(param1:int, param2:Boolean = false) : HaxeFighter
      {
         var _loc5_:* = null as HaxeFighter;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc3_:int = 0;
         var _loc4_:Array = fighters;
         while(_loc3_ < int(_loc4_.length))
         {
            _loc5_ = _loc4_[_loc3_];
            _loc3_++;
            if(!!param2 && int(_loc5_.getCurrentPositionCell()) == param1 || !param2 && int(_loc5_.getBeforeLastSpellPosition()) == param1)
            {
               return _loc5_;
            }
         }
         var _loc6_:ListNode = fighterInitialPositions.h;
         while(_loc6_ != null)
         {
            _loc7_ = _loc6_.item;
            _loc6_ = _loc6_.next;
            _loc8_ = _loc7_;
            if(int(_loc8_.cell) == param1)
            {
               return createFighterById(Number(_loc8_.id));
            }
         }
         return null;
      }
      
      public function getFighterCurrentSummonCount(param1:HaxeFighter) : int
      {
         var _loc5_:* = null as HaxeFighter;
         var _loc2_:Array = getEveryFighter();
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         while(_loc4_ < int(_loc2_.length))
         {
            _loc5_ = _loc2_[_loc4_];
            _loc4_++;
            if(_loc5_.id != param1.id && _loc5_.data.isSummon() && Number(_loc5_.data.getSummonerId()) == param1.id && !_loc5_.isStaticElement)
            {
               _loc3_++;
            }
         }
         return _loc3_;
      }
      
      public function getFighterById(param1:Number) : HaxeFighter
      {
         var _loc4_:* = null as HaxeFighter;
         var _loc2_:int = 0;
         var _loc3_:Array = fighters;
         while(_loc2_ < int(_loc3_.length))
         {
            _loc4_ = _loc3_[_loc2_];
            _loc2_++;
            if(_loc4_.id == param1)
            {
               return _loc4_;
            }
         }
         return createFighterById(param1);
      }
      
      public function getEveryFighter() : Array
      {
         var _loc3_:Number = NaN;
         var _loc1_:int = 0;
         var _loc2_:Array = map.getEveryFighterId();
         while(_loc1_ < int(_loc2_.length))
         {
            _loc3_ = Number(_loc2_[_loc1_]);
            _loc1_++;
            getFighterById(_loc3_);
         }
         return fighters;
      }
      
      public function getCarriedFighterBy(param1:HaxeFighter) : HaxeFighter
      {
         var _loc2_:Number = Number(map.getCarriedFighterIdBy(param1));
         if(_loc2_ != 0)
         {
            return getFighterById(_loc2_);
         }
         return null;
      }
      
      public function getAffectedFighters() : Array
      {
         var _loc1_:Function = function(param1:HaxeFighter):Boolean
         {
            var _loc3_:* = null as EffectOutput;
            var _loc4_:* = null as EffectOutput;
            var _loc2_:ListNode = param1.totalEffects.h;
            while(_loc2_ != null)
            {
               _loc3_ = _loc2_.item;
               _loc2_ = _loc2_.next;
               _loc4_ = _loc3_;
               if(_loc4_.damageRange != null || _loc4_.movement != null || _loc4_.attemptedApTheft || _loc4_.attemptedAmTheft || _loc4_.apStolen != 0 || _loc4_.amStolen != 0 || _loc4_.rangeStolen != 0 || _loc4_.dispell || _loc4_.death)
               {
                  return true;
               }
            }
            return false;
         };
         return FpUtils.arrayFilter_damageCalculation_fighterManagement_HaxeFighter(fighters,_loc1_);
      }
      
      public function createFighterById(param1:Number) : HaxeFighter
      {
         var _loc2_:HaxeFighter = map.getFighterById(param1);
         if(_loc2_ != null)
         {
            fighters.push(_loc2_);
            removeFighterCells(_loc2_.id);
         }
         return _loc2_;
      }
      
      public function copy() : FightContext
      {
         var _loc1_:FightContext = new FightContext(gameTurn,map,targetedCell,originalCaster,fighters);
         _loc1_.triggeredMarks = triggeredMarks;
         return _loc1_;
      }
   }
}
