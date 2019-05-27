package mapTools
{
   import damageCalculation.FightContext;
   import tools.FpUtils;
   
   public class MapTools
   {
      
      public static var MAP_GRID_WIDTH:int;
      
      public static var MAP_GRID_HEIGHT:int;
      
      public static var MIN_X_COORD:int;
      
      public static var MAX_X_COORD:int;
      
      public static var MIN_Y_COORD:int;
      
      public static var MAX_Y_COORD:int;
      
      public static var EVERY_CELL_ID:Array;
      
      public static var mapCountCell:int;
      
      public static var isInit:Boolean = false;
      
      public static var INVALID_CELL_ID:int = -1;
      
      public static var COEFF_FOR_REBASE_ON_CLOSEST_8_DIRECTION:Number = Number(Math.tan(Math.PI / 8));
      
      public static var COORDINATES_DIRECTION:Array = _loc1_;
       
      
      public function MapTools()
      {
      }
      
      public static function init(param1:MapToolsConfig) : void
      {
         var _loc5_:int = 0;
         MapTools.MAP_GRID_WIDTH = param1.mapGridWidth;
         MapTools.MAP_GRID_HEIGHT = param1.mapGridHeight;
         MapTools.MIN_X_COORD = param1.minXCoord;
         MapTools.MAX_X_COORD = param1.maxXCoord;
         MapTools.MIN_Y_COORD = param1.minYCoord;
         MapTools.MAX_Y_COORD = param1.maxYCoord;
         MapTools.mapCountCell = MapTools.MAP_GRID_WIDTH * MapTools.MAP_GRID_HEIGHT * 2;
         var _loc2_:Array = [];
         var _loc3_:int = 0;
         var _loc4_:int = MapTools.mapCountCell;
         while(_loc3_ < _loc4_)
         {
            _loc3_++;
            _loc5_ = _loc3_;
            _loc2_.push(_loc5_);
         }
         MapTools.EVERY_CELL_ID = _loc2_;
         MapTools.isInit = true;
      }
      
      public static function getCellCoordById(param1:int) : mapTools.Point
      {
         if(!MapTools.isValidCellId(param1))
         {
            return null;
         }
         var _loc2_:int = Math.floor(param1 / MapTools.MAP_GRID_WIDTH);
         var _loc3_:int = Math.floor((_loc2_ + 1) / 2);
         var _loc4_:* = _loc2_ - _loc3_;
         var _loc5_:* = param1 - _loc2_ * MapTools.MAP_GRID_WIDTH;
         return new mapTools.Point(_loc3_ + _loc5_,_loc5_ - _loc4_);
      }
      
      public static function getCellIdXCoord(param1:int) : int
      {
         var _loc2_:int = Math.floor(param1 / MapTools.MAP_GRID_WIDTH);
         var _loc3_:int = Math.floor((_loc2_ + 1) / 2);
         var _loc4_:* = param1 - _loc2_ * MapTools.MAP_GRID_WIDTH;
         return _loc3_ + _loc4_;
      }
      
      public static function getCellIdYCoord(param1:int) : int
      {
         var _loc2_:int = Math.floor(param1 / MapTools.MAP_GRID_WIDTH);
         var _loc3_:int = Math.floor((_loc2_ + 1) / 2);
         var _loc4_:* = _loc2_ - _loc3_;
         var _loc5_:* = param1 - _loc2_ * MapTools.MAP_GRID_WIDTH;
         return _loc5_ - _loc4_;
      }
      
      public static function getCellIdByCoord(param1:int, param2:int) : int
      {
         if(!MapTools.isValidCoord(param1,param2))
         {
            return -1;
         }
         return int(Math.floor(Number((param1 - param2) * MapTools.MAP_GRID_WIDTH + param2 + (param1 - param2) / 2)));
      }
      
      public static function floatAlmostEquals(param1:Number, param2:Number) : Boolean
      {
         if(param1 != param2)
         {
            return Number(Math.abs(param1 - param2)) < 0.0001;
         }
         return true;
      }
      
      public static function getCellsIdBetween(param1:int, param2:int) : Array
      {
         if(param1 == param2)
         {
            return [];
         }
         var _loc3_:mapTools.Point = MapTools.getCellCoordById(param1);
         var _loc4_:mapTools.Point = MapTools.getCellCoordById(param2);
         if(_loc3_ == null || _loc4_ == null)
         {
            return [];
         }
         var _loc5_:* = _loc4_.x - _loc3_.x;
         var _loc6_:* = _loc4_.y - _loc3_.y;
         var _loc7_:Number = Number(Math.sqrt(_loc5_ * _loc5_ + _loc6_ * _loc6_));
         var _loc8_:Number = _loc5_ / _loc7_;
         var _loc9_:Number = _loc6_ / _loc7_;
         var _loc10_:Number = Number(Math.abs(1 / _loc8_));
         var _loc11_:Number = Number(Math.abs(1 / _loc9_));
         var _loc12_:int = _loc8_ < 0?-1:1;
         var _loc13_:int = _loc9_ < 0?-1:1;
         var _loc14_:Number = 0.5 * _loc10_;
         var _loc15_:Number = 0.5 * _loc11_;
         var _loc16_:Array = [];
         while(_loc3_.x != _loc4_.x || _loc3_.y != _loc4_.y)
         {
            if(MapTools.floatAlmostEquals(_loc14_,_loc15_))
            {
               _loc14_ = Number(_loc14_ + _loc10_);
               _loc15_ = Number(_loc15_ + _loc11_);
               _loc3_.x = _loc3_.x + _loc12_;
               _loc3_.y = _loc3_.y + _loc13_;
            }
            else if(_loc14_ < _loc15_)
            {
               _loc14_ = Number(_loc14_ + _loc10_);
               _loc3_.x = _loc3_.x + _loc12_;
            }
            else
            {
               _loc15_ = Number(_loc15_ + _loc11_);
               _loc3_.y = _loc3_.y + _loc13_;
            }
            _loc16_.push(int(MapTools.getCellIdByCoord(_loc3_.x,_loc3_.y)));
         }
         return _loc16_;
      }
      
      public static function getCellsIdOnLargeWay(param1:int, param2:int) : Array
      {
         var _loc7_:int = 0;
         var _loc3_:int = MapTools.getLookDirection8ExactByCoord(MapTools.getCellCoordById(param1),MapTools.getCellCoordById(param2));
         if(!MapDirection.isValidDirection(_loc3_))
         {
            return [];
         }
         var _loc4_:Array = [param1];
         var _loc5_:int = param1;
         while(_loc5_ != param2)
         {
            if(MapDirection.isCardinal(_loc3_))
            {
               _loc7_ = MapTools.getNextCellByDirection(_loc5_,int((_loc3_ + 1) % 8));
               if(MapTools.isValidCellId(_loc7_))
               {
                  _loc4_.push(_loc7_);
               }
               _loc7_ = MapTools.getNextCellByDirection(_loc5_,int((_loc3_ + 8 - 1) % 8));
               if(MapTools.isValidCellId(_loc7_))
               {
                  _loc4_.push(_loc7_);
               }
            }
            _loc5_ = MapTools.getNextCellByDirection(_loc5_,_loc3_);
            _loc4_.push(_loc5_);
         }
         return _loc4_;
      }
      
      public static function isValidCellId(param1:int) : Boolean
      {
         if(!MapTools.isInit)
         {
            throw "MapTools must be initiliazed with method .initForDofus2 or .initForDofus3";
         }
         if(param1 >= 0)
         {
            return param1 < MapTools.mapCountCell;
         }
         return false;
      }
      
      public static function isValidCoord(param1:int, param2:int) : Boolean
      {
         if(!MapTools.isInit)
         {
            throw "MapTools must be initiliazed with method .initForDofus2 or .initForDofus3";
         }
         if(param2 >= -param1 && param2 <= param1 && param2 <= MapTools.MAP_GRID_WIDTH + MapTools.MAX_Y_COORD - param1)
         {
            return param2 >= param1 - (MapTools.MAP_GRID_HEIGHT - MapTools.MIN_Y_COORD);
         }
         return false;
      }
      
      public static function isInDiag(param1:int, param2:int) : Boolean
      {
         return Boolean(MapTools.isInDiagByCoord(MapTools.getCellCoordById(param1),MapTools.getCellCoordById(param2)));
      }
      
      public static function isInDiagByCoord(param1:mapTools.Point, param2:mapTools.Point) : Boolean
      {
         if(param1 == null || param2 == null)
         {
            return false;
         }
         return int(Math.floor(Number(Math.abs(param1.x - param2.x)))) == int(Math.floor(Number(Math.abs(param1.y - param2.y))));
      }
      
      public static function getLookDirection4(param1:int, param2:int) : int
      {
         return int(MapTools.getLookDirection4ByCoord(MapTools.getCellCoordById(param1),MapTools.getCellCoordById(param2)));
      }
      
      public static function getLookDirection4ByCoord(param1:mapTools.Point, param2:mapTools.Point) : int
      {
         if(param1 == null || param2 == null || !MapTools.isValidCoord(param1.x,param1.y) || !MapTools.isValidCoord(param2.x,param2.y))
         {
            return -1;
         }
         var _loc3_:* = param1.x - param2.x;
         var _loc4_:* = param1.y - param2.y;
         if(int(Math.floor(Number(Math.abs(_loc3_)))) > int(Math.floor(Number(Math.abs(_loc4_)))))
         {
            if(_loc3_ < 0)
            {
               return 1;
            }
            return 5;
         }
         if(_loc4_ < 0)
         {
            return 7;
         }
         return 3;
      }
      
      public static function getLookDirection4Exact(param1:int, param2:int) : int
      {
         return int(MapTools.getLookDirection4ExactByCoord(MapTools.getCellCoordById(param1),MapTools.getCellCoordById(param2)));
      }
      
      public static function getLookDirection4ExactByCoord(param1:mapTools.Point, param2:mapTools.Point) : int
      {
         if(param1 == null || param2 == null || !MapTools.isValidCoord(param1.x,param1.y) || !MapTools.isValidCoord(param2.x,param2.y))
         {
            return -1;
         }
         var _loc3_:* = param2.x - param1.x;
         var _loc4_:* = param2.y - param1.y;
         if(_loc4_ == 0)
         {
            if(_loc3_ < 0)
            {
               return 5;
            }
            return 1;
         }
         if(_loc3_ == 0)
         {
            if(_loc4_ < 0)
            {
               return 3;
            }
            return 7;
         }
         return -1;
      }
      
      public static function getLookDirection4Diag(param1:int, param2:int) : int
      {
         return int(MapTools.getLookDirection4DiagByCoord(MapTools.getCellCoordById(param1),MapTools.getCellCoordById(param2)));
      }
      
      public static function getLookDirection4DiagByCoord(param1:mapTools.Point, param2:mapTools.Point) : int
      {
         if(param1 == null || param2 == null || !MapTools.isValidCoord(param1.x,param1.y) || !MapTools.isValidCoord(param2.x,param2.y))
         {
            return -1;
         }
         var _loc3_:* = param2.x - param1.x;
         var _loc4_:* = param2.y - param1.y;
         if(_loc3_ >= 0 && _loc4_ <= 0 || _loc3_ <= 0 && _loc4_ >= 0)
         {
            if(_loc3_ < 0)
            {
               return 6;
            }
            return 2;
         }
         if(_loc3_ < 0)
         {
            return 4;
         }
         return 0;
      }
      
      public static function getLookDirection4DiagExact(param1:int, param2:int) : int
      {
         return int(MapTools.getLookDirection4DiagExactByCoord(MapTools.getCellCoordById(param1),MapTools.getCellCoordById(param2)));
      }
      
      public static function getLookDirection4DiagExactByCoord(param1:mapTools.Point, param2:mapTools.Point) : int
      {
         if(param1 == null || param2 == null || !MapTools.isValidCoord(param1.x,param1.y) || !MapTools.isValidCoord(param2.x,param2.y))
         {
            return -1;
         }
         var _loc3_:* = param2.x - param1.x;
         var _loc4_:* = param2.y - param1.y;
         if(_loc3_ == -_loc4_)
         {
            if(_loc3_ < 0)
            {
               return 6;
            }
            return 2;
         }
         if(_loc3_ == _loc4_)
         {
            if(_loc3_ < 0)
            {
               return 4;
            }
            return 0;
         }
         return -1;
      }
      
      public static function getLookDirection8(param1:int, param2:int) : int
      {
         return int(MapTools.getLookDirection8ByCoord(MapTools.getCellCoordById(param1),MapTools.getCellCoordById(param2)));
      }
      
      public static function getLookDirection8ByCoord(param1:mapTools.Point, param2:mapTools.Point) : int
      {
         var _loc4_:* = 0;
         var _loc5_:* = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc3_:int = MapTools.getLookDirection8ExactByCoord(param1,param2);
         if(!MapDirection.isValidDirection(_loc3_) && param1 != null && param2 != null)
         {
            _loc4_ = param2.x - param1.x;
            _loc5_ = param2.y - param1.y;
            _loc6_ = Math.floor(Number(Math.abs(_loc4_)));
            _loc7_ = Math.floor(Number(Math.abs(_loc5_)));
            if(_loc6_ < _loc7_ * MapTools.COEFF_FOR_REBASE_ON_CLOSEST_8_DIRECTION)
            {
               if(_loc5_ > 0)
               {
                  _loc3_ = 7;
               }
               else
               {
                  _loc3_ = 3;
               }
            }
            else if(_loc7_ < _loc6_ * MapTools.COEFF_FOR_REBASE_ON_CLOSEST_8_DIRECTION)
            {
               if(_loc4_ > 0)
               {
                  _loc3_ = 1;
               }
               else
               {
                  _loc3_ = 5;
               }
            }
            else
            {
               _loc3_ = MapTools.getLookDirection4DiagByCoord(param1,param2);
            }
         }
         return _loc3_;
      }
      
      public static function getLookDirection8Exact(param1:int, param2:int) : int
      {
         return int(MapTools.getLookDirection8ExactByCoord(MapTools.getCellCoordById(param1),MapTools.getCellCoordById(param2)));
      }
      
      public static function getLookDirection8ExactByCoord(param1:mapTools.Point, param2:mapTools.Point) : int
      {
         var _loc3_:int = MapTools.getLookDirection4ExactByCoord(param1,param2);
         if(!MapDirection.isValidDirection(_loc3_))
         {
            _loc3_ = MapTools.getLookDirection4DiagExactByCoord(param1,param2);
         }
         return _loc3_;
      }
      
      public static function getNextCellByDirection(param1:int, param2:int) : int
      {
         return int(MapTools.getNextCellByDirectionAndCoord(MapTools.getCellCoordById(param1),param2));
      }
      
      public static function getNextCellByDirectionAndCoord(param1:mapTools.Point, param2:int) : int
      {
         if(param1 == null || !MapTools.isValidCoord(param1.x,param1.y) || !MapDirection.isValidDirection(param2))
         {
            return -1;
         }
         return int(MapTools.getCellIdByCoord(param1.x + MapTools.COORDINATES_DIRECTION[param2].x,param1.y + MapTools.COORDINATES_DIRECTION[param2].y));
      }
      
      public static function adjacentCellsAllowAccess(param1:FightContext, param2:int, param3:int) : Boolean
      {
         var _loc5_:int = MapTools.getNextCellByDirection(param2,int((param3 + 1) % 8));
         var _loc6_:int = MapTools.getNextCellByDirection(param2,int((param3 + 8 - 1) % 8));
         if(MapDirection.isOrthogonal(param3) || !!param1.isCellEmptyForMovement(_loc5_) && param1.isCellEmptyForMovement(_loc6_))
         {
            return true;
         }
         return false;
      }
      
      public static function getDistance(param1:int, param2:int) : int
      {
         if(!MapTools.isValidCellId(param1) || !MapTools.isValidCellId(param2))
         {
            return -1;
         }
         var _loc3_:int = Math.floor(param1 / MapTools.MAP_GRID_WIDTH);
         var _loc4_:int = Math.floor((_loc3_ + 1) / 2);
         var _loc5_:* = param1 - _loc3_ * MapTools.MAP_GRID_WIDTH;
         var _loc6_:* = _loc4_ + _loc5_;
         var _loc7_:int = Math.floor(param1 / MapTools.MAP_GRID_WIDTH);
         var _loc8_:int = Math.floor((_loc7_ + 1) / 2);
         var _loc9_:* = _loc7_ - _loc8_;
         var _loc10_:* = param1 - _loc7_ * MapTools.MAP_GRID_WIDTH;
         var _loc11_:* = _loc10_ - _loc9_;
         var _loc12_:int = Math.floor(param2 / MapTools.MAP_GRID_WIDTH);
         var _loc13_:int = Math.floor((_loc12_ + 1) / 2);
         var _loc14_:* = param2 - _loc12_ * MapTools.MAP_GRID_WIDTH;
         var _loc15_:* = _loc13_ + _loc14_;
         var _loc16_:int = Math.floor(param2 / MapTools.MAP_GRID_WIDTH);
         var _loc17_:int = Math.floor((_loc16_ + 1) / 2);
         var _loc18_:* = _loc16_ - _loc17_;
         var _loc19_:* = param2 - _loc16_ * MapTools.MAP_GRID_WIDTH;
         var _loc20_:* = _loc19_ - _loc18_;
         return int(Math.floor(Number(Number(Math.abs(_loc15_ - _loc6_)) + Number(Math.abs(_loc20_ - _loc11_)))));
      }
      
      public static function areCellsAdjacent(param1:int, param2:int) : Boolean
      {
         var _loc3_:int = MapTools.getDistance(param1,param2);
         if(_loc3_ >= 0)
         {
            return _loc3_ <= 1;
         }
         return false;
      }
      
      public static function getCellsCoordBetween(param1:int, param2:int) : Array
      {
         return FpUtils.arrayMap_Int_flash_geom_Point(MapTools.getCellsIdBetween(param1,param2),function(param1:int):Point
         {
            return MapTools.getCellCoordById(param1).toFlashPoint();
         });
      }
   }
}
