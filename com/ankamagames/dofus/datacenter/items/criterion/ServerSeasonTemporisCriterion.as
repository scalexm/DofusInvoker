package com.ankamagames.dofus.datacenter.items.criterion
{
   import com.ankamagames.dofus.logic.common.managers.PlayerManager;
   import com.ankamagames.jerakine.interfaces.IDataCenter;
   
   public class ServerSeasonTemporisCriterion extends ItemCriterion implements IDataCenter
   {
       
      
      public function ServerSeasonTemporisCriterion(pCriterion:String)
      {
         super(pCriterion);
      }
      
      override public function get isRespected() : Boolean
      {
         if(PlayerManager.getInstance().serverSeason && PlayerManager.getInstance().serverSeason.seasonNumber == _criterionValue)
         {
            return true;
         }
         return false;
      }
      
      override public function get text() : String
      {
         return "";
      }
      
      override public function clone() : IItemCriterion
      {
         var clonedCriterion:ServerSeasonTemporisCriterion = new ServerSeasonTemporisCriterion(this.basicText);
         return clonedCriterion;
      }
   }
}
