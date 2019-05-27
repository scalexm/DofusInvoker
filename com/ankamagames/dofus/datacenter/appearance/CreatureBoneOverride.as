package com.ankamagames.dofus.datacenter.appearance
{
   import com.ankamagames.jerakine.data.GameData;
   import com.ankamagames.jerakine.interfaces.IDataCenter;
   
   public class CreatureBoneOverride implements IDataCenter
   {
      
      public static const MODULE:String = "CreatureBonesOverrides";
       
      
      public var boneId:int;
      
      public var creatureBoneId:int;
      
      public function CreatureBoneOverride()
      {
         super();
      }
      
      public static function getCreatureBones(pBoneId:int) : int
      {
         var bonesOverride:CreatureBoneOverride = GameData.getObject(MODULE,pBoneId) as CreatureBoneOverride;
         return !!bonesOverride?int(bonesOverride.creatureBoneId):-1;
      }
      
      public static function getAllCreatureBonesOverrides() : Array
      {
         return GameData.getObjects(MODULE);
      }
   }
}
