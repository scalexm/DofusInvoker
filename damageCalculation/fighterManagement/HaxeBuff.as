package damageCalculation.fighterManagement
{
   import damageCalculation.DamageCalculator;
   import damageCalculation.FightContext;
   import damageCalculation.damageManagement.DamageRange;
   import damageCalculation.damageManagement.EffectOutput;
   import damageCalculation.damageManagement.MovementInfos;
   import damageCalculation.spellManagement.HaxeSpell;
   import damageCalculation.spellManagement.HaxeSpellEffect;
   import damageCalculation.spellManagement.HaxeSpellState;
   import damageCalculation.spellManagement.RunningEffect;
   import tools.ActionIdHelper;
   import tools.enumeration.ElementEnum;
   
   public class HaxeBuff
   {
       
      
      public var spellState:HaxeSpellState;
      
      public var spell:HaxeSpell;
      
      public var hasBeenTriggeredOn:Array;
      
      public var effect:HaxeSpellEffect;
      
      public var casterId:Number;
      
      public function HaxeBuff(param1:Number, param2:HaxeSpell, param3:HaxeSpellEffect)
      {
         spellState = null;
         hasBeenTriggeredOn = [];
         spell = param2;
         casterId = param1;
         effect = param3;
         if(effect.actionId == 950)
         {
            spellState = DamageCalculator.dataInterface.createStateFromId(param3.param3);
         }
      }
      
      public static function fromRunningEffect(param1:RunningEffect) : HaxeBuff
      {
         return new HaxeBuff(param1.getCaster().id,param1.getSpell(),param1.getSpellEffect());
      }
      
      public function shouldBeTriggeredOnTargetDamage(param1:RunningEffect, param2:HaxeFighter, param3:Boolean) : Boolean
      {
         var _loc4_:HaxeSpellEffect = param1.getSpellEffect();
         var _loc5_:HaxeSpell = param1.getSpell();
         var _loc6_:HaxeFighter = param1.getCaster();
         if(int(effect.triggers.indexOf("D")) != -1)
         {
            return true;
         }
         switch(int(ElementEnum.getElementFromActionId(_loc4_.actionId)))
         {
            case 0:
               if(int(effect.triggers.indexOf("DN")) != -1)
               {
                  return true;
               }
               break;
            case 1:
               if(int(effect.triggers.indexOf("DE")) != -1)
               {
                  return true;
               }
               break;
            case 2:
               if(int(effect.triggers.indexOf("DF")) != -1)
               {
                  return true;
               }
               break;
            case 3:
               if(int(effect.triggers.indexOf("DW")) != -1)
               {
                  return true;
               }
               break;
            case 4:
               if(int(effect.triggers.indexOf("DA")) != -1)
               {
                  return true;
               }
               break;
         }
         if(!!_loc5_.isGlyph && int(effect.triggers.indexOf("DG")) != -1)
         {
            return true;
         }
         if(!!_loc5_.isTrap && int(effect.triggers.indexOf("DT")) != -1)
         {
            return true;
         }
         if(!!_loc6_.data.isSummon() && int(effect.triggers.indexOf("DI")) != -1)
         {
            return true;
         }
         if(_loc6_.teamId == param2.teamId)
         {
            if(int(effect.triggers.indexOf("DBA")) != -1)
            {
               return true;
            }
            if(!!_loc4_.isCritical && int(effect.triggers.indexOf("CCBA")) != -1)
            {
               return true;
            }
         }
         else
         {
            if(int(effect.triggers.indexOf("DBE")) != -1)
            {
               return true;
            }
            if(!!_loc4_.isCritical && int(effect.triggers.indexOf("CCBE")) != -1)
            {
               return true;
            }
         }
         if(param3)
         {
            if(int(effect.triggers.indexOf("DM")) != -1)
            {
               return true;
            }
         }
         else if(int(effect.triggers.indexOf("DR")) != -1)
         {
            return true;
         }
         if(_loc5_.isWeapon)
         {
            if(int(effect.triggers.indexOf("DCAC")) != -1)
            {
               return true;
            }
         }
         else if(int(effect.triggers.indexOf("DS")) != -1 && (param1.getParentEffect() == null || !param1.getParentEffect().isTriggered))
         {
            return true;
         }
         return false;
      }
      
      public function shouldBeTriggeredOnTarget(param1:EffectOutput, param2:RunningEffect, param3:HaxeFighter, param4:Boolean, param5:FightContext = undefined) : Boolean
      {
         if(!param3.isAlive())
         {
            if(!!param1.death && int(effect.triggers.indexOf("X")) != -1)
            {
               return true;
            }
            return false;
         }
         if(!!param1.isPushed && int(effect.triggers.indexOf("P")) != -1)
         {
            return true;
         }
         if(!!param1.isPulled && int(effect.triggers.indexOf("MA")) != -1)
         {
            return true;
         }
         if(!!param1.throughPortal && int(effect.triggers.indexOf("PT")) != -1)
         {
            return true;
         }
         if(param1.movement != null && param5.map.isCellWalkable(param1.movement.newPosition) && int(effect.triggers.indexOf("M")) != -1)
         {
            return true;
         }
         if(param1.movement != null && param1.movement.swappedWith != null && int(effect.triggers.indexOf("MS")) != -1)
         {
            return true;
         }
         if(param1.apStolen > 0 && int(effect.triggers.indexOf("APA")) != -1)
         {
            return true;
         }
         if(param1.amStolen > 0 && int(effect.triggers.indexOf("MPA")) != -1)
         {
            return true;
         }
         if(param1.rangeStolen > 0 && int(effect.triggers.indexOf("R")) != -1)
         {
            return true;
         }
         if(!!param1.dispell && int(effect.triggers.indexOf("DIS")) != -1)
         {
            return true;
         }
         if(param1.newStateId != -1 && hasTriggerState(param1.newStateId,true))
         {
            return true;
         }
         if(param1.lostStateId != -1 && hasTriggerState(param1.lostStateId,false))
         {
            return true;
         }
         if(param1.damageRange != null)
         {
            if(param1.damageRange.isCollision)
            {
               if(int(effect.triggers.indexOf("PD")) != -1)
               {
                  return true;
               }
               if(param2.getSpellEffect().param2 == 0 && int(effect.triggers.indexOf("PMD")) != -1)
               {
                  return true;
               }
               if(int(effect.triggers.indexOf("PPD")) != -1)
               {
                  return true;
               }
            }
            else
            {
               if(!!param1.damageRange.isHeal && param1.damageRange.isShieldDamage)
               {
                  return false;
               }
               if(param1.damageRange.isHeal)
               {
                  if(int(effect.triggers.indexOf("H")) != -1)
                  {
                     return true;
                  }
                  return false;
               }
               return Boolean(shouldBeTriggeredOnTargetDamage(param2,param3,param4));
            }
         }
         return false;
      }
      
      public function shouldBeTriggeredOnCaster(param1:EffectOutput, param2:RunningEffect, param3:HaxeFighter, param4:Boolean, param5:FightContext = undefined) : Boolean
      {
         if(!param3.isAlive())
         {
            return false;
         }
         var _loc6_:HaxeSpell = param2.getSpell();
         var _loc7_:HaxeSpellEffect = param2.getSpellEffect();
         var _loc8_:HaxeFighter = param2.getCaster();
         if(!!param1.attemptedApTheft && int(effect.triggers.indexOf("CAPA")) != -1)
         {
            return true;
         }
         if(!!param1.attemptedAmTheft && int(effect.triggers.indexOf("CMPA")) != -1)
         {
            return true;
         }
         if(param1.damageRange != null && param1.damageRange.isCritical && int(effect.triggers.indexOf("CC")) != -1)
         {
            return true;
         }
         if(param1.damageRange != null && !param1.damageRange.isZero())
         {
            if(!!param1.damageRange.isHeal && !param1.damageRange.isShieldDamage && int(effect.triggers.indexOf("CH")) != -1)
            {
               return true;
            }
            if(!!param1.damageRange.isHeal && param1.damageRange.isShieldDamage && int(effect.triggers.indexOf("CS")) != -1)
            {
               return true;
            }
            switch(int(ElementEnum.getElementFromActionId(_loc7_.actionId)))
            {
               case 0:
                  if(int(effect.triggers.indexOf("CDN")) != -1)
                  {
                     return true;
                  }
                  break;
               case 1:
                  if(int(effect.triggers.indexOf("CDE")) != -1)
                  {
                     return true;
                  }
                  break;
               case 2:
                  if(int(effect.triggers.indexOf("CDF")) != -1)
                  {
                     return true;
                  }
                  break;
               case 3:
                  if(int(effect.triggers.indexOf("CDW")) != -1)
                  {
                     return true;
                  }
                  break;
               case 4:
                  if(int(effect.triggers.indexOf("CDA")) != -1)
                  {
                     return true;
                  }
                  break;
            }
            if(_loc8_.teamId == param3.teamId)
            {
               if(int(effect.triggers.indexOf("CAA")) != -1)
               {
                  return true;
               }
            }
            else if(int(effect.triggers.indexOf("CAE")) != -1)
            {
               return true;
            }
            if(param4)
            {
               if(int(effect.triggers.indexOf("CDM")) != -1)
               {
                  return true;
               }
            }
            else if(int(effect.triggers.indexOf("CDR")) != -1)
            {
               return true;
            }
            if(_loc6_.isWeapon)
            {
               if(int(effect.triggers.indexOf("CDCAC")) != -1)
               {
                  return true;
               }
            }
            else if(int(effect.triggers.indexOf("CDS")) != -1)
            {
               return true;
            }
         }
         return false;
      }
      
      public function isTriggeredByParent(param1:RunningEffect) : Boolean
      {
         var _loc2_:RunningEffect = param1;
         while(_loc2_ != null)
         {
            if(_loc2_.getSpellEffect().id == effect.id)
            {
               return true;
            }
            _loc2_ = _loc2_.getParentEffect();
         }
         return false;
      }
      
      public function isState() : Boolean
      {
         return effect.actionId == 950;
      }
      
      public function hasTriggerState(param1:int, param2:Boolean) : Boolean
      {
         var _loc5_:* = null as String;
         var _loc3_:int = 0;
         var _loc4_:Array = effect.triggers;
         while(_loc3_ < int(_loc4_.length))
         {
            _loc5_ = _loc4_[_loc3_];
            _loc3_++;
            if(param2)
            {
               if(int(_loc5_.indexOf("EON")) == 0 && Std.parseInt(_loc5_.substr("EON".length)) == param1)
               {
                  return true;
               }
            }
            else if(int(_loc5_.indexOf("EOFF")) == 0 && Std.parseInt(_loc5_.substr("EOFF".length)) == param1)
            {
               return true;
            }
         }
         return false;
      }
      
      public function hasTrigger(param1:String) : Boolean
      {
         return int(effect.triggers.indexOf(param1)) != -1;
      }
      
      public function getActionId() : int
      {
         return effect.actionId;
      }
      
      public function createBasicRunningEffect(param1:FightContext) : RunningEffect
      {
         var _loc2_:* = null as HaxeSpellEffect;
         if(effect.isCritical)
         {
            _loc2_ = effect.clone();
            _loc2_.isCritical = false;
         }
         else
         {
            _loc2_ = effect;
         }
         return new RunningEffect(param1.getFighterById(casterId),spell,_loc2_);
      }
      
      public function canBeTriggeredBy(param1:RunningEffect) : Boolean
      {
         if(param1.getSpell().canAlwaysTriggerSpells)
         {
            return true;
         }
         if(!ActionIdHelper.canTriggerDamageMultiplier(param1.getSpellEffect().actionId))
         {
            if(effect.actionId == 1163)
            {
               return false;
            }
            if(effect.actionId == 265)
            {
               return false;
            }
         }
         if(effect.actionId == 1159)
         {
            if(!ActionIdHelper.canTriggerHealMultiplier(param1.getSpellEffect().actionId))
            {
               return false;
            }
         }
         else if(!!ActionIdHelper.isSplash(param1.getSpellEffect().actionId) && effect.actionId != 1163)
         {
            return false;
         }
         if(!!ActionIdHelper.isHeal(param1.getSpellEffect().actionId) && !ActionIdHelper.canTriggerOnHeal(param1.getSpellEffect().actionId))
         {
            return false;
         }
         if(!!ActionIdHelper.isDamage(param1.getSpellEffect().category) && !ActionIdHelper.canTriggerOnDamage(param1.getSpellEffect().actionId))
         {
            return false;
         }
         if(isTriggeredByParent(param1))
         {
            return false;
         }
         if(param1.isTriggered)
         {
            return false;
         }
         return true;
      }
   }
}
