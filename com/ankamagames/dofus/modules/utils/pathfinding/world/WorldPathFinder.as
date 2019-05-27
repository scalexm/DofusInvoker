package com.ankamagames.dofus.modules.utils.pathfinding.world
{
   import com.ankamagames.atouin.data.map.CellData;
   import com.ankamagames.atouin.managers.MapDisplayManager;
   import com.ankamagames.dofus.datacenter.world.MapPosition;
   import com.ankamagames.dofus.internalDatacenter.world.WorldPointWrapper;
   import com.ankamagames.dofus.logic.game.common.managers.PlayedCharacterManager;
   import com.ankamagames.dofus.logic.game.common.misc.DofusEntities;
   import com.ankamagames.dofus.modules.utils.pathfinding.astar.AStar;
   import com.ankamagames.dofus.modules.utils.pathfinding.tools.FileLoader;
   import com.ankamagames.dofus.modules.utils.pathfinding.tools.TimeDebug;
   import com.ankamagames.jerakine.data.XmlConfig;
   import com.ankamagames.jerakine.entities.interfaces.IEntity;
   import com.ankamagames.jerakine.logger.Log;
   import com.ankamagames.jerakine.logger.Logger;
   import com.ankamagames.jerakine.resources.events.ResourceLoadedEvent;
   import flash.utils.getQualifiedClassName;
   
   public class WorldPathFinder
   {
      
      protected static const _log:Logger = Log.getLogger(getQualifiedClassName(WorldPathFinder));
      
      private static var playedCharacterManager:PlayedCharacterManager;
      
      private static var worldGraph:WorldGraph;
      
      private static var callback:Function;
      
      private static var from:Vertex;
      
      private static var to:Number;
      
      private static var linkedZone:int;
       
      
      public function WorldPathFinder()
      {
         super();
      }
      
      public static function init() : void
      {
         if(WorldPathFinder.isInitialized())
         {
            return;
         }
         playedCharacterManager = PlayedCharacterManager.getInstance();
         FileLoader.loadExternalFile(XmlConfig.getInstance().getEntry("config.data.pathFinding"),WorldPathFinder.setData);
      }
      
      public static function getWorldGraph() : WorldGraph
      {
         return worldGraph;
      }
      
      public static function isInitialized() : Boolean
      {
         return worldGraph != null;
      }
      
      private static function setData(e:ResourceLoadedEvent) : void
      {
         worldGraph = new WorldGraph(e.resource);
      }
      
      public static function findPath(destinationMapId:Number, callback:Function) : void
      {
         if(!WorldPathFinder.isInitialized())
         {
            callback(null);
            return;
         }
         playedCharacterManager = PlayedCharacterManager.getInstance();
         _log.info("Start searching path to " + destinationMapId.toString());
         TimeDebug.reset();
         var playedEntity:IEntity = DofusEntities.getEntity(playedCharacterManager.id);
         var playedEntityCellId:uint = playedEntity.position.cellId;
         var playerCell:CellData = MapDisplayManager.getInstance().getDataMapContainer().dataMap.cells[playedEntityCellId];
         from = worldGraph.getVertex(playedCharacterManager.currentMap.mapId,playerCell.linkedZoneRP);
         if(from == null)
         {
            callback(null);
            return;
         }
         linkedZone = 1;
         WorldPathFinder.callback = callback;
         to = destinationMapId;
         next();
      }
      
      public static function abortPathSearch() : void
      {
         AStar.stopSearch();
      }
      
      private static function onAStarComplete(path:Vector.<Edge#154>) : void
      {
         var cb:Function = null;
         if(path == null)
         {
            next();
         }
         else
         {
            _log.info("path to map " + to.toString() + " found in " + TimeDebug.getElapsedTimeInSeconds().toString() + "s");
            cb = callback;
            callback = null;
            cb(path);
         }
      }
      
      private static function next() : void
      {
         var cb:Function = null;
         var dest:Vertex = worldGraph.getVertex(to,linkedZone++);
         if(dest == null)
         {
            _log.info("no path found to go to map " + to.toString());
            cb = callback;
            callback = null;
            cb(null);
            return;
         }
         AStar.search(worldGraph,from,dest,onAStarComplete);
      }
      
      private static function useInDoorMap(path:Vector.<Edge#154>) : Boolean
      {
         var edge:Edge = null;
         if(!MapPosition.getMapPositionById(path[0].from.mapId).outdoor)
         {
            return true;
         }
         for each(edge in path)
         {
            if(!MapPosition.getMapPositionById(edge.to.mapId).outdoor)
            {
               return true;
            }
         }
         return false;
      }
      
      public static function isPassingThroughIndoorMap(destinationMapId:Number, callback:Function) : void
      {
         findPath(destinationMapId,function(path:Vector.<Edge#154>):void
         {
            callback(path == null?false:useInDoorMap(path));
         });
      }
      
      public static function getUndergroundEntryMap(destinationMapId:Number, callback:Function, excludeStartMap:Boolean = true, excludeEndMap:Boolean = true) : void
      {
         findPath(destinationMapId,function(path:Vector.<Edge#154>):void
         {
            var outDoor:* = false;
            var currentPlayerPoint:WorldPointWrapper = null;
            var i:int = 0;
            var mapId:Number = NaN;
            var mapPos:MapPosition = null;
            var entryMaps:Vector.<Edge> = new Vector.<Edge#154>();
            if(path != null && path.length > 0)
            {
               outDoor = Boolean(MapPosition.getMapPositionById(playedCharacterManager.currentMap.mapId).outdoor);
               currentPlayerPoint = playedCharacterManager.currentMap;
               for(i = -1; i < path.length; )
               {
                  mapId = i == -1?Number(path[0].from.mapId):Number(path[i].to.mapId);
                  mapPos = MapPosition.getMapPositionById(mapId);
                  if(mapPos && mapPos.outdoor != outDoor)
                  {
                     outDoor = !outDoor;
                     if(!(destinationMapId == mapId && excludeEndMap || currentPlayerPoint.mapId == mapId && excludeStartMap))
                     {
                        if(!(!outDoor && currentPlayerPoint.outdoorX == mapPos.posX && currentPlayerPoint.outdoorY == mapPos.posY))
                        {
                           entryMaps.push(mapPos);
                        }
                     }
                  }
                  i++;
               }
            }
            callback(entryMaps);
         });
      }
   }
}
