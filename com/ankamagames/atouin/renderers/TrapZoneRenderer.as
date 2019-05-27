package com.ankamagames.atouin.renderers
{
   import com.ankamagames.atouin.types.DataMapContainer;
   import com.ankamagames.atouin.types.TrapZoneTile;
   import com.ankamagames.atouin.utils.IZoneRenderer;
   import com.ankamagames.jerakine.types.Color;
   import com.ankamagames.jerakine.types.positions.MapPoint;
   import flash.filters.ColorMatrixFilter;
   import flash.utils.Dictionary;
   
   public class TrapZoneRenderer implements IZoneRenderer
   {
       
      
      private var _aZoneTile:Array;
      
      private var _aCellTile:Array;
      
      private var _visible:Boolean;
      
      private var _bigLine:Boolean;
      
      public var strata:uint;
      
      public function TrapZoneRenderer(nStrata:uint = 10, visible:Boolean = true, bigLine:Boolean = false)
      {
         super();
         this._aZoneTile = new Array();
         this._aCellTile = new Array();
         this._visible = visible;
         this._bigLine = bigLine;
         this.strata = nStrata;
      }
      
      public function render(cells:Vector.<uint>, oColor:Color, mapContainer:DataMapContainer, alpha:Boolean = false, updateStrata:Boolean = false) : void
      {
         var tzt:TrapZoneTile = null;
         var daPoint:MapPoint = null;
         var daCellId:uint = 0;
         var mp:MapPoint = null;
         var hasATopNeighbor:Boolean = false;
         var hasABottomNeighbor:Boolean = false;
         var hasARightNeighbor:Boolean = false;
         var hasALeftNeighbor:Boolean = false;
         var colorMatrix:ColorMatrixFilter = new ColorMatrixFilter([0,0,0,0,oColor.red,0,0,0,0,oColor.green,0,0,0,0,oColor.blue,0,0,0,0.7,0]);
         var j:int = 0;
         var cellsCount:int = cells.length;
         var i:int = 0;
         for(var mapPointsByCellId:Dictionary = new Dictionary(); j < cellsCount; )
         {
            mapPointsByCellId[cells[j]] = MapPoint.fromCellId(cells[j]);
            j++;
         }
         for(j = 0; j < cellsCount; j++)
         {
            if(!this._aZoneTile[j])
            {
               this._aZoneTile[j] = tzt = new TrapZoneTile();
               tzt.mouseChildren = false;
               tzt.mouseEnabled = false;
               tzt.strata = this.strata;
               tzt.visible = this._visible;
               tzt.filters = [colorMatrix];
            }
            this._aCellTile[j] = cells[j];
            daCellId = cells[j];
            daPoint = mapPointsByCellId[daCellId];
            TrapZoneTile(this._aZoneTile[j]).cellId = daCellId;
            hasATopNeighbor = false;
            hasABottomNeighbor = false;
            hasARightNeighbor = false;
            hasALeftNeighbor = false;
            for(i = 0; i < cellsCount; i++)
            {
               if(cells[i] != daCellId)
               {
                  mp = mapPointsByCellId[cells[i]];
                  if(mp.x == daPoint.x)
                  {
                     if(mp.y == daPoint.y - 1)
                     {
                        hasATopNeighbor = true;
                     }
                     else if(mp.y == daPoint.y + 1)
                     {
                        hasABottomNeighbor = true;
                     }
                  }
                  else if(mp.y == daPoint.y)
                  {
                     if(mp.x == daPoint.x - 1)
                     {
                        hasARightNeighbor = true;
                     }
                     else if(mp.x == daPoint.x + 1)
                     {
                        hasALeftNeighbor = true;
                     }
                  }
               }
            }
            if(!hasATopNeighbor || !hasARightNeighbor || !hasABottomNeighbor || !hasALeftNeighbor)
            {
               TrapZoneTile(this._aZoneTile[j]).drawStroke(hasATopNeighbor,hasARightNeighbor,hasABottomNeighbor,hasALeftNeighbor,this._bigLine);
            }
            TrapZoneTile(this._aZoneTile[j]).display(this.strata);
         }
         for(var tilesCount:int = this._aZoneTile.length; j < tilesCount; )
         {
            if(this._aZoneTile[j])
            {
               (this._aZoneTile[j] as TrapZoneTile).remove();
            }
            j++;
         }
      }
      
      public function updateDisplay() : void
      {
         for(var j:int = 0; j < this._aZoneTile.length; j++)
         {
            if(this._aZoneTile[j])
            {
               TrapZoneTile(this._aZoneTile[j]).display(this.strata);
            }
         }
      }
      
      public function remove(cells:Vector.<uint>, mapContainer:DataMapContainer) : void
      {
         if(!cells)
         {
            return;
         }
         var mapping:Array = new Array();
         for(var j:int = 0; j < cells.length; j++)
         {
            mapping[cells[j]] = true;
         }
         for(j = 0; j < this._aCellTile.length; j++)
         {
            if(mapping[this._aCellTile[j]])
            {
               if(this._aZoneTile[j])
               {
                  TrapZoneTile(this._aZoneTile[j]).remove();
               }
               delete this._aZoneTile[j];
               delete this._aCellTile[j];
            }
         }
      }
   }
}
