package com.ankamagames.dofus.datacenter.items.criterion
{
   import com.ankamagames.dofus.datacenter.items.Item;
   import com.ankamagames.dofus.internalDatacenter.items.ItemWrapper;
   import com.ankamagames.dofus.logic.game.common.managers.InventoryManager;
   import com.ankamagames.jerakine.data.I18n;
   import com.ankamagames.jerakine.interfaces.IDataCenter;
   
   public class ObjectItemCriterion extends ItemCriterion implements IDataCenter
   {
       
      
      private var _criterionValueQuantity:int = -1;
      
      public function ObjectItemCriterion(pCriterion:String)
      {
         var itemIdAndQuantity:Array = null;
         super(pCriterion);
         if(_criterionValue == 0 && _criterionValueText.indexOf(",") != -1)
         {
            itemIdAndQuantity = _criterionValueText.split(",");
            _criterionValue = int(itemIdAndQuantity[0]);
            this._criterionValueQuantity = int(itemIdAndQuantity[1]);
            if(this._criterionValueQuantity == 0 && String(itemIdAndQuantity[1]).indexOf("0") == -1)
            {
               this._criterionValueQuantity = -1;
            }
         }
      }
      
      override public function get isRespected() : Boolean
      {
         var iw:ItemWrapper = null;
         var itemQuantity:uint = 0;
         for each(iw in InventoryManager.getInstance().realInventory)
         {
            if(iw.objectGID == _criterionValue)
            {
               itemQuantity = iw.quantity;
               break;
            }
         }
         if(_operator.text == ItemCriterionOperator.EQUAL)
         {
            return this._criterionValueQuantity == -1?itemQuantity > 0:itemQuantity == this._criterionValueQuantity;
         }
         if(_operator.text == ItemCriterionOperator.DIFFERENT)
         {
            return this._criterionValueQuantity == -1?itemQuantity == 0:itemQuantity != this._criterionValueQuantity;
         }
         if(_operator.text == ItemCriterionOperator.SUPERIOR)
         {
            return itemQuantity > Math.max(this._criterionValueQuantity,0);
         }
         if(_operator.text == ItemCriterionOperator.INFERIOR)
         {
            return itemQuantity < Math.max(this._criterionValueQuantity,1);
         }
         return false;
      }
      
      override public function get text() : String
      {
         var objectName:String = Item.getItemById(_criterionValue).name;
         var readableCriterion:String = "";
         switch(_operator.text)
         {
            case ItemCriterionOperator.DIFFERENT:
               if(this._criterionValueQuantity == 1 || this._criterionValueQuantity == -1)
               {
                  readableCriterion = I18n.getUiText("ui.common.doNotPossess",[objectName]);
                  break;
               }
               readableCriterion = I18n.getUiText("ui.common.doNotPossessQuantity",[this._criterionValueQuantity,objectName]);
               break;
            case ItemCriterionOperator.EQUAL:
               if(this._criterionValueQuantity == 1 || this._criterionValueQuantity == -1)
               {
                  readableCriterion = I18n.getUiText("ui.common.doPossess",[objectName]);
                  break;
               }
               readableCriterion = I18n.getUiText("ui.common.doPossessQuantity",[this._criterionValueQuantity,objectName]);
               break;
         }
         return readableCriterion;
      }
      
      override public function clone() : IItemCriterion
      {
         var clonedCriterion:ObjectItemCriterion = new ObjectItemCriterion(this.basicText);
         return clonedCriterion;
      }
   }
}
