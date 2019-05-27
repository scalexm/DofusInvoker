package com.ankamagames.dofus.logic.game.fight.frames.Preview
{
   import com.ankamagames.dofus.datacenter.effects.EffectInstance;
   import com.ankamagames.dofus.datacenter.spells.Spell;
   import com.ankamagames.dofus.datacenter.spells.SpellLevel;
   import com.ankamagames.dofus.internalDatacenter.items.WeaponWrapper;
   import com.ankamagames.dofus.internalDatacenter.spells.SpellWrapper;
   import com.ankamagames.dofus.logic.game.common.managers.PlayedCharacterManager;
   import com.ankamagames.dofus.logic.game.fight.frames.FightContextFrame;
   import com.ankamagames.dofus.logic.game.fight.managers.CurrentPlayedFighterManager;
   import com.ankamagames.dofus.logic.game.fight.managers.MarkedCellsManager;
   import com.ankamagames.dofus.logic.game.fight.types.BasicBuff;
   import com.ankamagames.dofus.misc.utils.GameDebugManager;
   import com.ankamagames.dofus.network.types.game.character.characteristic.CharacterBaseCharacteristic;
   import com.ankamagames.dofus.network.types.game.context.fight.GameFightFighterInformations;
   import com.ankamagames.jerakine.types.positions.MapPoint;
   import damageCalculation.DamageCalculator;
   import damageCalculation.FightContext;
   import damageCalculation.IMapInfo;
   import damageCalculation.debug.Debug;
   import damageCalculation.fighterManagement.HaxeBuff;
   import damageCalculation.fighterManagement.HaxeFighter;
   import damageCalculation.spellManagement.HaxeSpell;
   import damageCalculation.spellManagement.HaxeSpellEffect;
   import flash.utils.Dictionary;
   import mapTools.MapTools;
   import mapTools.MapToolsConfig;
   import tools.enumeration.GameActionMarkTypeEnum;
   
   public class DamagePreview
   {
      
      private static var _isInit:Boolean = false;
      
      private static var haxeSpellCache:Dictionary = new Dictionary();
      
      private static const FIST_SPELL_ID:int = 0;
       
      
      public function DamagePreview()
      {
         super();
      }
      
      public static function init() : void
      {
         if(!_isInit)
         {
            DamageCalculator.dataInterface = new DamageCalculationTranslator();
            DamageCalculator.logger = new HaxeLoggerTranslator();
            _isInit = true;
         }
      }
      
      public static function computePreview(context:FightContextFrame, rawSpell:Object, casterId:Number, targetedCell:int) : Array
      {
         if(rawSpell == null)
         {
            return [];
         }
         if(!MapTools.isInit)
         {
            MapTools.init(MapToolsConfig.DOFUS2_CONFIG);
         }
         var infos:GameFightFighterInformations = context.entitiesFrame.getEntityInfos(casterId) as GameFightFighterInformations;
         var caster:HaxeFighter = new FighterTranslator(infos,casterId);
         var spell:HaxeSpell = createHaxeSpell(rawSpell);
         var map:IMapInfo = new MapTranslator(context);
         var critical:Boolean = false;
         var criticalHit:CharacterBaseCharacteristic = CurrentPlayedFighterManager.getInstance().getCharacteristicsInformations(casterId).criticalHit;
         if(FighterDataTranslator.totalPoint(criticalHit) + criticalHit.contextModif >= 100)
         {
            critical = true;
         }
         var gameTurn:int = 1 + CurrentPlayedFighterManager.getInstance().getSpellCastManager().currentTurn;
         if(GameDebugManager.getInstance().haxeGenerateTestFromNextSpellCast)
         {
            Debug.traceTestEnvironment(new FightContext(gameTurn,map,targetedCell,caster),spell,GameDebugManager.getInstance().haxeGenerateTestFromNextSpellCast_stats,GameDebugManager.getInstance().haxeGenerateTestFromNextSpellCast_infos);
            GameDebugManager.getInstance().haxeGenerateTestFromNextSpellCast = false;
            GameDebugManager.getInstance().haxeGenerateTestFromNextSpellCast_infos = false;
            GameDebugManager.getInstance().haxeGenerateTestFromNextSpellCast_stats = false;
         }
         return DamageCalculator.damageComputation(caster,spell,gameTurn,map,targetedCell,getInputPortal(),true,critical);
      }
      
      private static function getInputPortal() : int
      {
         var mapPoint:MapPoint = null;
         var inputPortalCell:int = MapTools.INVALID_CELL_ID;
         var PortalMapPoints:Vector.<MapPoint> = MarkedCellsManager.getInstance().getMarksMapPoint(GameActionMarkTypeEnum.PORTAL);
         for each(mapPoint in PortalMapPoints)
         {
            if(mapPoint.cellId == FightContextFrame.currentCell)
            {
               inputPortalCell = FightContextFrame.currentCell;
               break;
            }
         }
         return inputPortalCell;
      }
      
      public static function createHaxeBuff(buff:BasicBuff) : HaxeBuff
      {
         var casterId:Number = buff.castingSpell.casterId;
         var grade:int = buff.castingSpell.spellRank != null?int(buff.castingSpell.spellRank.grade):1;
         var spellLevel:SpellLevel = Spell.getSpellById(buff.castingSpell.spell.id).getSpellLevel(grade);
         var newSpell:HaxeSpell = createHaxeSpell(spellLevel);
         var effect:HaxeSpellEffect = SpellEffectTranslator.fromBuff(buff,spellLevel.grade);
         var isCritical:* = newSpell.getCriticalEffectById(effect.id) != null;
         effect.isCritical = isCritical;
         return new HaxeBuff(casterId,newSpell,effect);
      }
      
      public static function createHaxeSpell(spell:Object) : HaxeSpell
      {
         var cacheKey:int = 0;
         if(spell is SpellWrapper)
         {
            spell = (spell as SpellWrapper).spellLevelInfos;
         }
         var spellLevel:int = spell is WeaponWrapper?1:int(spell.grade);
         var spellId:int = spell.spellId;
         var isFist:* = spell.spellId == FIST_SPELL_ID;
         var isWeapon:Boolean = !(spell is SpellLevel) || isFist;
         if(isWeapon && !isFist)
         {
            spell = PlayedCharacterManager.getInstance().currentWeapon;
            spellId = 0;
         }
         if(!isWeapon)
         {
            cacheKey = DamageCalculator.create32BitHashSpellLevel(spellId,spellLevel);
            if(haxeSpellCache[cacheKey] != null)
            {
               return haxeSpellCache[cacheKey];
            }
         }
         var spellEffects:Vector.<EffectInstance> = isWeapon && !isFist?spell.effects:Vector.<EffectInstance>(spell.effects);
         var spellCriticalEffects:Vector.<EffectInstance> = isWeapon && !isFist?spellEffects:Vector.<EffectInstance>(spell.criticalEffect);
         var translatedEffects:Array = loadEffectArray(spell,spellEffects,isWeapon,false);
         var translatedCriticalEffects:Array = loadEffectArray(spell,spellCriticalEffects,isWeapon,true);
         var canAlwaysTriggerSpells:Boolean = isWeapon || (spell as SpellLevel).spell.canAlwaysTriggerSpells;
         if(isWeapon && !(spell is SpellLevel))
         {
            spell = PlayedCharacterManager.getInstance().currentWeapon;
         }
         var haxeSpell:HaxeSpell = new HaxeSpell(!!isWeapon?0:int(spell.spellId),translatedEffects,translatedCriticalEffects,spellLevel,canAlwaysTriggerSpells,isWeapon,spell.minRange,spell.range,spell.criticalHitProbability,spell is SpellLevel?Boolean((spell as SpellLevel).needFreeCell):false,spell is SpellLevel?Boolean((spell as SpellLevel).needTakenCell):false,spell is SpellLevel?int((spell as SpellLevel).maxStack):-1);
         return haxeSpell;
      }
      
      private static function loadEffectArray(spell:Object, sourceEffects:Vector.<EffectInstance>, isWeapon:Boolean, isCritical:Boolean) : Array
      {
         var effect:EffectInstance = null;
         var targetEffects:Array = [];
         for each(effect in sourceEffects)
         {
            if(!effect.forClientOnly && effect.delay == 0)
            {
               if(isWeapon)
               {
                  targetEffects.push(SpellEffectTranslator.fromWeapon(effect,PlayedCharacterManager.getInstance().currentWeapon,isCritical));
               }
               else if(spell is SpellLevel)
               {
                  targetEffects.push(SpellEffectTranslator.fromSpell(effect,(spell as SpellLevel).grade,isCritical));
               }
            }
         }
         return targetEffects;
      }
   }
}
