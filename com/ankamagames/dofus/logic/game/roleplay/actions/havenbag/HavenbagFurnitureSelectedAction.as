package com.ankamagames.dofus.logic.game.roleplay.actions.havenbag
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class HavenbagFurnitureSelectedAction implements Action
   {
       
      
      public var furnitureTypeId:uint;
      
      public function HavenbagFurnitureSelectedAction()
      {
         super();
      }
      
      public static function create(furnitureTypeId:uint) : HavenbagFurnitureSelectedAction
      {
         var a:HavenbagFurnitureSelectedAction = new HavenbagFurnitureSelectedAction();
         a.furnitureTypeId = furnitureTypeId;
         return a;
      }
   }
}
