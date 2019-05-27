package com.ankamagames.dofus.logic.game.fight.frames.Preview
{
   import com.ankamagames.atouin.managers.EntitiesManager;
   import com.ankamagames.atouin.utils.DataMapProvider;
   import com.ankamagames.dofus.datacenter.spells.Spell;
   import com.ankamagames.dofus.kernel.Kernel;
   import com.ankamagames.dofus.logic.game.fight.frames.FightContextFrame;
   import com.ankamagames.dofus.logic.game.fight.frames.FightEntitiesFrame;
   import com.ankamagames.dofus.logic.game.fight.managers.LinkedCellsManager;
   import com.ankamagames.dofus.logic.game.fight.managers.MarkedCellsManager;
   import com.ankamagames.dofus.logic.game.fight.types.MarkInstance;
   import com.ankamagames.dofus.network.types.game.context.GameContextActorInformations;
   import com.ankamagames.dofus.network.types.game.context.fight.GameFightFighterInformations;
   import com.ankamagames.dofus.types.entities.AnimatedCharacter;
   import com.ankamagames.jerakine.types.positions.MapPoint;
   import damageCalculation.IMapInfo;
   import damageCalculation.fighterManagement.HaxeFighter;
   import damageCalculation.spellManagement.HaxeSpell;
   import damageCalculation.spellManagement.Mark;
   import flash.utils.Dictionary;
   import haxe.ds.List;
   import mapTools.MapTools;
   import mapTools.Point;
   import tools.enumeration.GameActionMarkTypeEnum;
   
   public class MapTranslator implements IMapInfo
   {
       
      
      private var _context:FightContextFrame;
      
      public function MapTranslator(context:FightContextFrame)
      {
         super();
         this._context = context;
      }
      
      private static function vectorToArray(vector:Vector.<uint>) : Array
      {
         var value:uint = 0;
         var array:Array = [];
         for each(value in vector)
         {
            array.push(value);
         }
         return array;
      }
      
      public function getEveryFighterId() : Array
      {
         var entityId:Number = NaN;
         var fightEntities:Vector.<Number> = (Kernel.getWorker().getFrame(FightEntitiesFrame) as FightEntitiesFrame).getEntitiesIdsList();
         var fighters:Array = [];
         for each(entityId in fightEntities)
         {
            fighters.push(entityId);
         }
         return fighters;
      }
      
      public function getFightersInitialPositions() : List
      {
         var infos:GameContextActorInformations = null;
         var positions:List = new List();
         var fightEntities:Dictionary = (Kernel.getWorker().getFrame(FightEntitiesFrame) as FightEntitiesFrame).getEntitiesDictionnary();
         for each(infos in fightEntities)
         {
            positions.add({
               "id":infos.contextualId,
               "cell":infos.disposition.cellId
            });
         }
         return positions;
      }
      
      public function getCarriedFighterIdBy(carrier:HaxeFighter) : Number
      {
         var entity:AnimatedCharacter = null;
         var carriedEntity:AnimatedCharacter = null;
         var entities:Array = EntitiesManager.getInstance().getEntitiesOnCell(carrier.getCurrentPositionCell(),AnimatedCharacter);
         for(var i:int = 0; i < entities.length; )
         {
            entity = entities[i] as AnimatedCharacter;
            if(entity.id == carrier.id)
            {
               if(entity.carriedEntity != null)
               {
                  carriedEntity = entity.carriedEntity as AnimatedCharacter;
                  if(carriedEntity != null)
                  {
                     return carriedEntity.id;
                  }
                  break;
               }
               break;
            }
            i++;
         }
         return HaxeFighter.INVALID_ID;
      }
      
      public function getFighterById(id:Number) : HaxeFighter
      {
         var infos:GameFightFighterInformations = this._context.entitiesFrame.getEntityInfos(id) as GameFightFighterInformations;
         if(infos != null)
         {
            return new FighterTranslator(infos,id);
         }
         return null;
      }
      
      public function isCellWalkable(cell:int) : Boolean
      {
         if(!MapTools.isValidCellId(cell))
         {
            return false;
         }
         var cellCoord:Point = MapTools.getCellCoordById(cell);
         return DataMapProvider.getInstance().pointMov(cellCoord.x,cellCoord.y);
      }
      
      public function getMarkInteractingWithCell(cell:int, markType:int = 0) : Array
      {
         var mark:Mark = null;
         var returnMarks:Array = [];
         for each(mark in this.getMarks(markType))
         {
            if(mark.cells.indexOf(cell) != -1)
            {
               returnMarks.push(mark);
            }
         }
         return returnMarks;
      }
      
      public function getMarks(markType:int = 0, teamId:int = 2) : Array
      {
         var mark:MarkInstance = null;
         var spell:HaxeSpell = null;
         var haxeMark:Mark = null;
         var marks:Vector.<MarkInstance> = MarkedCellsManager.getInstance().getMarks(markType,teamId,true);
         if(marks == null)
         {
            return [];
         }
         var returnMarks:Array = [];
         for each(mark in marks)
         {
            if(markType == GameActionMarkTypeEnum.NONE || markType == mark.markType)
            {
               switch(mark.markType)
               {
                  case GameActionMarkTypeEnum.WALL:
                     spell = DamagePreview.createHaxeSpell(Spell.getSpellById(mark.associatedSpell.id).getSpellLevel(mark.associatedSpellLevel.grade));
                     break;
                  case GameActionMarkTypeEnum.PORTAL:
                     spell = DamagePreview.createHaxeSpell(mark.associatedSpellLevel);
                     break;
                  default:
                     spell = DamagePreview.createHaxeSpell(Spell.getSpellById(mark.associatedSpellLevel.effects[0].parameter0 as int).getSpellLevel(mark.associatedSpellLevel.effects[0].parameter1 as int));
               }
               haxeMark = new Mark();
               haxeMark.markId = mark.markId;
               haxeMark.setMarkType(mark.markType);
               haxeMark.setAssociatedSpell(spell);
               haxeMark.mainCell = mark.markImpactCellId;
               haxeMark.cells = vectorToArray(mark.cells);
               haxeMark.teamId = mark.teamId;
               haxeMark.active = mark.active;
               haxeMark.casterId = mark.markCasterId;
               returnMarks.push(haxeMark);
            }
         }
         return returnMarks;
      }
      
      public function getOutputPortalCell(cell:int) : int
      {
         var entryMarkPortal:MarkInstance = MarkedCellsManager.getInstance().getMarkAtCellId(cell,GameActionMarkTypeEnum.PORTAL);
         if(entryMarkPortal == null)
         {
            return MapTools.INVALID_CELL_ID;
         }
         var teamPortals:Vector.<MapPoint> = MarkedCellsManager.getInstance().getMarksMapPoint(GameActionMarkTypeEnum.PORTAL,entryMarkPortal.teamId);
         var portalsCellIds:Vector.<uint> = LinkedCellsManager.getInstance().getLinks(MapPoint.fromCellId(cell),teamPortals);
         var tmp:int = portalsCellIds.pop();
         return tmp;
      }
      
      public function dispellIllusionOnCell(cell:int) : void
      {
      }
   }
}
