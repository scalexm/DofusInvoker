package com.ankamagames.dofus.logic.game.common.actions
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class HouseGuildRightsViewAction implements Action
   {
       
      
      public var houseId:int;
      
      public var instanceId:int;
      
      public function HouseGuildRightsViewAction()
      {
         super();
      }
      
      public static function create(houseId:int, instanceId:int) : HouseGuildRightsViewAction
      {
         var action:HouseGuildRightsViewAction = new HouseGuildRightsViewAction();
         action.houseId = houseId;
         action.instanceId = instanceId;
         return action;
      }
   }
}
