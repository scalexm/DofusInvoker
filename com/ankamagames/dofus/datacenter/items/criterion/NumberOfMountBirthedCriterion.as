package com.ankamagames.dofus.datacenter.items.criterion
{
   import com.ankamagames.jerakine.data.I18n;
   import com.ankamagames.jerakine.interfaces.IDataCenter;
   
   public class NumberOfMountBirthedCriterion extends ItemCriterion implements IDataCenter
   {
       
      
      public function NumberOfMountBirthedCriterion(pCriterion:String)
      {
         super(pCriterion);
      }
      
      override public function get text() : String
      {
         var readableCriterionValue:String = _criterionValueText;
         var mountsBirthedCount:int = parseInt(readableCriterionValue.split(",")[1]) + 1;
         var readableCriterionRef:String = I18n.getUiText("ui.mount.mountsBirthedCount",[mountsBirthedCount]);
         return readableCriterionRef;
      }
      
      override public function clone() : IItemCriterion
      {
         var clonedCriterion:NumberOfMountBirthedCriterion = new NumberOfMountBirthedCriterion(this.basicText);
         return clonedCriterion;
      }
      
      override protected function getCriterion() : int
      {
         return 0;
      }
   }
}
