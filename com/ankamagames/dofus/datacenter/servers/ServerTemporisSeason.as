package com.ankamagames.dofus.datacenter.servers
{
   import com.ankamagames.jerakine.data.GameData;
   import com.ankamagames.jerakine.interfaces.IDataCenter;
   
   public class ServerTemporisSeason implements IDataCenter
   {
      
      public static const MODULE:String = "ServerTemporisSeasons";
       
      
      public var uid:int;
      
      public var seasonNumber:uint;
      
      public var information:String;
      
      public var beginning:Number;
      
      public var closure:Number;
      
      public function ServerTemporisSeason()
      {
         super();
      }
      
      public static function getSeasonById(id:int) : ServerTemporisSeason
      {
         return GameData.getObject(MODULE,id) as ServerTemporisSeason;
      }
      
      public static function getAllSeason() : Array
      {
         return GameData.getObjects(MODULE);
      }
   }
}
