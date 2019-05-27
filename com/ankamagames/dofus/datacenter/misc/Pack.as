package com.ankamagames.dofus.datacenter.misc
{
   import com.ankamagames.jerakine.data.GameData;
   import com.ankamagames.jerakine.interfaces.IDataCenter;
   
   public class Pack implements IDataCenter
   {
      
      public static const MODULE:String = "Pack";
       
      
      public var id:int;
      
      public var name:String;
      
      public var hasSubAreas:Boolean;
      
      public function Pack()
      {
         super();
      }
      
      public static function getPackById(id:int) : Pack
      {
         return GameData.getObject(MODULE,id) as Pack;
      }
      
      public static function getPackByName(name:String) : Pack
      {
         var pack:Pack = null;
         var packs:Array = getAllPacks();
         for each(pack in packs)
         {
            if(name == pack.name)
            {
               return pack;
            }
         }
         return null;
      }
      
      public static function getAllPacks() : Array
      {
         return GameData.getObjects(MODULE);
      }
   }
}
