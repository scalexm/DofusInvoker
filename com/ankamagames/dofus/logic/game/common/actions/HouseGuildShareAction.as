package com.ankamagames.dofus.logic.game.common.actions
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class HouseGuildShareAction implements Action
   {
       
      
      public var houseId:int;
      
      public var instanceId:int;
      
      public var enabled:Boolean;
      
      public var rights:int;
      
      public function HouseGuildShareAction()
      {
         super();
      }
      
      public static function create(houseId:int, instanceId:int, enabled:Boolean, rights:int = 0) : HouseGuildShareAction
      {
         var action:HouseGuildShareAction = new HouseGuildShareAction();
         action.houseId = houseId;
         action.instanceId = instanceId;
         action.enabled = enabled;
         action.rights = rights;
         return action;
      }
   }
}
