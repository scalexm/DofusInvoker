package damageCalculation.spellManagement
{
   import damageCalculation.FightContext;
   import damageCalculation.damageManagement.EffectOutput;
   import damageCalculation.fighterManagement.HaxeFighter;
   import damageCalculation.fighterManagement.PlayerTypeEnum;
   import damageCalculation.tools.Interval;
   import haxe.ds.List;
   import tools.FpUtils;
   
   public class SpellManager
   {
      
      public static var EXCLUSIVE_MASKS_LIST:String = "*bBeEfFzZKoOPpTWUvVrRQq";
      
      public static var TELEFRAG_STATE:int = 251;
       
      
      public function SpellManager()
      {
      }
      
      public static function isSelectedByMask(param1:HaxeFighter, param2:HaxeSpellEffect, param3:HaxeFighter, param4:HaxeFighter, param5:FightContext) : Boolean
      {
         if(param2.mask == null || param2.mask == "")
         {
            return true;
         }
         if(param3 == null)
         {
            return false;
         }
         if(SpellManager.isIncludedByMask(param1,param2,param3,param5))
         {
            return Boolean(SpellManager.passMaskExclusion(param1,param2,param3,param4,param5));
         }
         return false;
      }
      
      public static function isIncludedByMask(param1:HaxeFighter, param2:HaxeSpellEffect, param3:HaxeFighter, param4:FightContext) : Boolean
      {
         var _loc10_:int = 0;
         var _loc5_:* = param3 == param1;
         var _loc6_:* = param1.teamId == param3.teamId;
         var _loc7_:String = "";
         if(_loc5_)
         {
            _loc7_ = "cCa";
         }
         else
         {
            if(_loc6_)
            {
               _loc7_ = _loc7_ + "g";
            }
            _loc7_ = _loc7_ + (!!_loc6_?"a":"A");
            if(param3.playerType == PlayerTypeEnum.SIDEKICK)
            {
               _loc7_ = _loc7_ + (!!_loc6_?"dl":"DL");
            }
            else if(param3.data.isSummon())
            {
               _loc7_ = _loc7_ + (!!_loc6_?"j":"J");
               if(param3.isStaticElement)
               {
                  _loc7_ = _loc7_ + (!!_loc6_?"s":"S");
               }
               else
               {
                  _loc7_ = _loc7_ + (!!_loc6_?"i":"I");
               }
            }
            if(param3.playerType == PlayerTypeEnum.HUMAN && !param3.data.isSummon())
            {
               _loc7_ = _loc7_ + (!!_loc6_?"hl":"HL");
            }
            else if(!param3.data.isSummon() && !param3.isStaticElement)
            {
               _loc7_ = _loc7_ + (!!_loc6_?"m":"M");
            }
         }
         var _loc8_:int = 0;
         var _loc9_:int = _loc7_.length;
         while(_loc8_ < _loc9_)
         {
            _loc8_++;
            _loc10_ = _loc8_;
            if(int(param2.mask.indexOf(_loc7_.charAt(_loc10_))) != -1)
            {
               return true;
            }
         }
         return false;
      }
      
      public static function splitMasks(param1:String) : Array
      {
         var _loc4_:int = 0;
         var _loc2_:Array = [];
         var _loc3_:int = 0;
         while(_loc3_ < param1.length)
         {
            while(param1.charAt(_loc3_) == " " || param1.charAt(_loc3_) == ",")
            {
               _loc3_++;
            }
            _loc4_ = _loc3_;
            while(_loc4_ < param1.length && param1.charAt(_loc4_) != ",")
            {
               _loc4_++;
            }
            if(_loc4_ != _loc3_)
            {
               _loc2_.push(param1.substring(_loc3_,_loc4_));
            }
            _loc3_ = _loc4_;
         }
         return _loc2_;
      }
      
      public static function splitTriggers(param1:String) : Array
      {
         var _loc4_:int = 0;
         var _loc2_:Array = [];
         var _loc3_:int = 0;
         if(param1 != null)
         {
            while(_loc3_ < param1.length)
            {
               while(param1.charAt(_loc3_) == " " || param1.charAt(_loc3_) == "|")
               {
                  _loc3_++;
               }
               _loc4_ = _loc3_;
               while(_loc4_ < param1.length && param1.charAt(_loc4_) != "|")
               {
                  _loc4_++;
               }
               if(_loc4_ != _loc3_)
               {
                  _loc2_.push(param1.substring(_loc3_,_loc4_));
               }
               _loc3_ = _loc4_;
            }
         }
         return _loc2_;
      }
      
      public static function maskIsOneOfCondition(param1:String) : Boolean
      {
         var _loc2_:String = param1.charAt(0) == "*"?param1.charAt(1):param1.charAt(0);
         if(_loc2_ != "B")
         {
            if(_loc2_ != "F")
            {
               if(_loc2_ != "Z")
               {
                  return false;
               }
            }
         }
         return true;
      }
      
      public static function passMaskExclusion(param1:HaxeFighter, param2:HaxeSpellEffect, param3:HaxeFighter, param4:HaxeFighter, param5:FightContext) : Boolean
      {
         var _loc7_:Boolean = false;
         var _loc8_:* = null as HaxeFighter;
         var _loc9_:* = null as Object;
         var _loc10_:int = 0;
         var _loc11_:* = null as String;
         var _loc12_:* = false;
         var _loc13_:* = null as String;
         var _loc14_:Number = NaN;
         var _loc15_:* = null as Function;
         var _loc16_:int = 0;
         var _loc17_:int = 0;
         var caster:HaxeFighter = param1;
         var masks:Array = SpellManager.splitMasks(param2.mask);
         var _loc6_:int = 0;
         while(_loc6_ < int(masks.length))
         {
            var mask:Array = [masks[_loc6_]];
            _loc6_++;
            if(int(SpellManager.EXCLUSIVE_MASKS_LIST.indexOf(mask[0].charAt(0))) != -1)
            {
               _loc7_ = param5.usingPortal();
               _loc8_ = mask[0].charAt(0) == "*"?caster:param3;
               switch(mask[0].length)
               {
                  case 0:
                  case 1:
                     _loc9_ = 0;
               }
               _loc11_ = mask[0].charAt(0) == "*"?mask[0].charAt(1):mask[0].charAt(0);
               _loc13_ = _loc11_;
               if(_loc13_ == "B")
               {
                  _loc12_ = Boolean(_loc8_.playerType == PlayerTypeEnum.HUMAN && _loc8_.breed == _loc9_);
               }
               else if(_loc13_ == "E")
               {
                  _loc12_ = Boolean(_loc8_.hasState(_loc9_));
               }
               else if(_loc13_ == "F")
               {
                  _loc12_ = Boolean(_loc8_.playerType != PlayerTypeEnum.HUMAN && _loc8_.breed == _loc9_);
               }
               else if(_loc13_ == "K")
               {
                  _loc12_ = Boolean(!!_loc8_.hasState(8) && caster.getCarried(param5) == _loc8_ || _loc8_.pendingEffects.filter(function():Function
                  {
                     return function(param1:EffectOutput):Boolean
                     {
                        return param1.throwedBy == caster.id;
                     };
                  }()).length > 0);
               }
               else if(_loc13_ == "P")
               {
                  _loc12_ = Boolean(_loc8_.id == caster.id || !!_loc8_.data.isSummon() && Number(_loc8_.data.getSummonerId()) == caster.id || !!_loc8_.data.isSummon() && Number(caster.data.getSummonerId()) == Number(_loc8_.data.getSummonerId()) || !!caster.data.isSummon() && Number(caster.data.getSummonerId()) == _loc8_.id);
               }
               else if(_loc13_ == "Q")
               {
                  _loc12_ = int(param5.getFighterCurrentSummonCount(_loc8_)) >= int(_loc8_.data.getBaseCharacteristicValue("maxSummonableCreatures"));
               }
               else if(_loc13_ == "R")
               {
                  _loc12_ = Boolean(_loc7_);
               }
               else if(_loc13_ == "T")
               {
                  _loc12_ = Boolean(param3.wasTelefraggedThisTurn());
               }
               else if(_loc13_ == "U")
               {
                  _loc12_ = Boolean(_loc8_.isAppearing);
               }
               else if(_loc13_ == "V")
               {
                  _loc14_ = _loc8_.getPendingLifePoints().min / int(_loc8_.getCharacteristicValue("maxLifePoints")) * 100;
                  _loc12_ = _loc14_ <= _loc9_;
               }
               else if(_loc13_ == "W")
               {
                  _loc12_ = Boolean(param3.wasTeleportedInInvalidCellThisTurn(param5));
               }
               else if(_loc13_ == "Z")
               {
                  _loc12_ = Boolean(_loc8_.playerType == PlayerTypeEnum.SIDEKICK && _loc8_.breed == _loc9_);
               }
               else if(_loc13_ == "b")
               {
                  _loc12_ = Boolean(_loc8_.playerType != PlayerTypeEnum.HUMAN || _loc8_.breed != _loc9_);
               }
               else if(_loc13_ == "e")
               {
                  _loc12_ = !_loc8_.hasState(_loc9_);
               }
               else if(_loc13_ == "f")
               {
                  _loc12_ = Boolean(_loc8_.playerType == PlayerTypeEnum.HUMAN || _loc8_.breed != _loc9_);
               }
               else
               {
                  if(_loc13_ != "O")
                  {
                     if(_loc13_ != "o")
                     {
                        if(_loc13_ == "p")
                        {
                           _loc12_ = !(_loc8_.id == caster.id || !!_loc8_.data.isSummon() && Number(_loc8_.data.getSummonerId()) == caster.id || !!_loc8_.data.isSummon() && Number(caster.data.getSummonerId()) == Number(_loc8_.data.getSummonerId()) || !!caster.data.isSummon() && Number(caster.data.getSummonerId()) == _loc8_.id);
                        }
                        else if(_loc13_ == "q")
                        {
                           _loc12_ = int(param5.getFighterCurrentSummonCount(_loc8_)) < int(_loc8_.data.getBaseCharacteristicValue("maxSummonableCreatures"));
                        }
                        else if(_loc13_ == "r")
                        {
                           _loc12_ = !_loc7_;
                        }
                        else if(_loc13_ == "v")
                        {
                           _loc14_ = _loc8_.getPendingLifePoints().min / int(_loc8_.getCharacteristicValue("maxLifePoints")) * 100;
                           _loc12_ = _loc14_ > _loc9_;
                        }
                        else if(_loc13_ == "z")
                        {
                           _loc12_ = Boolean(_loc8_.playerType != PlayerTypeEnum.SIDEKICK || _loc8_.breed != _loc9_);
                        }
                     }
                  }
                  _loc12_ = Boolean(param4 != null && _loc8_.id == param4.id);
               }
               if(SpellManager.maskIsOneOfCondition(mask[0]))
               {
                  var indexOfNextMask:Array = [int(masks.indexOf(mask[0])) + 1];
                  if(_loc12_)
                  {
                     _loc15_ = function(param1:Array, param2:Array):Function
                     {
                        var indexOfNextMask1:Array = param1;
                        var mask1:Array = param2;
                        return function(param1:String):Boolean
                        {
                           if(int(masks.indexOf(param1)) <= int(indexOfNextMask1[0]) - 1)
                           {
                              return true;
                           }
                           if(param1.charAt(0) == "*" && mask1[0].charAt(0) == "*")
                           {
                              return param1.charAt(1) != mask1[0].charAt(1);
                           }
                           return param1.charAt(0) != mask1[0].charAt(0);
                        };
                     }(indexOfNextMask,mask);
                     masks = FpUtils.arrayFilter_String(masks,_loc15_);
                  }
                  else
                  {
                     _loc10_ = indexOfNextMask[0];
                     _loc16_ = masks.length;
                     while(_loc10_ < _loc16_)
                     {
                        _loc10_++;
                        _loc17_ = _loc10_;
                        if(masks[_loc17_].charAt(0) == "*" && mask[0].charAt(0) == "*")
                        {
                           if(masks[_loc17_].charAt(1) == mask[0].charAt(1))
                           {
                              _loc12_ = true;
                              break;
                           }
                        }
                        else if(masks[_loc17_].charAt(0) == mask[0].charAt(0))
                        {
                           _loc12_ = true;
                           break;
                        }
                     }
                  }
               }
               if(_loc12_ == false)
               {
                  return false;
               }
            }
         }
         return true;
      }
      
      public static function isInstantaneousSpellEffect(param1:HaxeSpellEffect) : Boolean
      {
         if(param1.triggers == null || int(param1.triggers.indexOf("I")) != -1)
         {
            return true;
         }
         return false;
      }
   }
}
