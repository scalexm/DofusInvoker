package com.ankamagames.dofus.logic.game.common.actions
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class HouseTeleportRequestAction implements Action
   {
       
      
      public var houseId:uint;
      
      public var houseInstanceId:int;
      
      public function HouseTeleportRequestAction()
      {
         super();
      }
      
      public static function create(pHouseId:uint, houseInstanceId:int) : HouseTeleportRequestAction
      {
         var action:HouseTeleportRequestAction = new HouseTeleportRequestAction();
         action.houseId = pHouseId;
         action.houseInstanceId = houseInstanceId;
         return action;
      }
   }
}
