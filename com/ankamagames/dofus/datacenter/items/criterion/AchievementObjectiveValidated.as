package com.ankamagames.dofus.datacenter.items.criterion
{
   import com.ankamagames.dofus.datacenter.quest.Achievement;
   import com.ankamagames.dofus.datacenter.quest.AchievementObjective;
   import com.ankamagames.jerakine.data.I18n;
   import com.ankamagames.jerakine.interfaces.IDataCenter;
   
   public class AchievementObjectiveValidated extends ItemCriterion implements IDataCenter
   {
       
      
      public function AchievementObjectiveValidated(pCriterion:String)
      {
         super(pCriterion);
      }
      
      override public function get text() : String
      {
         var achievementObjective:AchievementObjective = AchievementObjective.getAchievementObjectiveById(_criterionValue);
         var readableCriterionRef:String = I18n.getUiText("ui.achievement.objectiveValidated",[achievementObjective.name,Achievement.getAchievementById(achievementObjective.achievementId).name]);
         return readableCriterionRef;
      }
      
      override public function clone() : IItemCriterion
      {
         var clonedCriterion:AchievementObjectiveValidated = new AchievementObjectiveValidated(this.basicText);
         return clonedCriterion;
      }
   }
}
