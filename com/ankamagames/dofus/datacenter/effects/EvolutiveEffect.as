package com.ankamagames.dofus.datacenter.effects
{
   import com.ankamagames.dofus.datacenter.effects.instances.EffectInstanceInteger;
   import com.ankamagames.jerakine.data.GameData;
   import com.ankamagames.jerakine.interfaces.IDataCenter;
   import com.ankamagames.jerakine.logger.Log;
   import com.ankamagames.jerakine.logger.Logger;
   import flash.utils.getQualifiedClassName;
   
   public class EvolutiveEffect implements IDataCenter
   {
      
      private static const _log:Logger = Log.getLogger(getQualifiedClassName(EvolutiveEffect));
      
      public static const MODULE:String = "EvolutiveEffects";
       
      
      public var id:int;
      
      public var actionId:int;
      
      public var targetId:int;
      
      public var progressionPerLevelRange:Vector.<Vector.<Number>>;
      
      public function EvolutiveEffect()
      {
         super();
      }
      
      public static function getEvolutiveEffectById(id:uint) : EvolutiveEffect
      {
         return GameData.getObject(MODULE,id) as EvolutiveEffect;
      }
      
      public static function getEvolutiveEffects() : Array
      {
         return GameData.getObjects(MODULE);
      }
      
      public static function getEvolutiveEffectInstanceByLevelRange(evolutiveEffectId:int, minLevel:int, maxLevel:int) : EffectInstance
      {
         var evolutiveEffect:EvolutiveEffect = getEvolutiveEffectById(evolutiveEffectId);
         var currentValue:int = getEffectValueByLevel(evolutiveEffect,minLevel);
         var finalValue:int = getEffectValueByLevel(evolutiveEffect,maxLevel);
         var value:int = finalValue - currentValue;
         var evolutiveEffectInstance:EffectInstanceInteger = new EffectInstanceInteger();
         evolutiveEffectInstance.value = value;
         evolutiveEffectInstance.effectId = evolutiveEffect.actionId;
         return evolutiveEffectInstance;
      }
      
      private static function getEffectValueByLevel(effect:EvolutiveEffect, maxLevel:int) : int
      {
         var maxLoopLevel:int = 0;
         var currentFloorLevelRangeCount:int = 0;
         var value:Number = 0;
         var floorsCount:int = effect.progressionPerLevelRange.length;
         var i:int = 0;
         for(var firstLevel:int = effect.progressionPerLevelRange[i][0] != 1?1:0; i < floorsCount; )
         {
            maxLoopLevel = Math.min(maxLevel,effect.progressionPerLevelRange[i][0]);
            currentFloorLevelRangeCount = maxLoopLevel - firstLevel;
            value = value + effect.progressionPerLevelRange[i][1] * currentFloorLevelRangeCount;
            firstLevel = effect.progressionPerLevelRange[i][0];
            i++;
         }
         return Math.floor(value);
      }
   }
}
