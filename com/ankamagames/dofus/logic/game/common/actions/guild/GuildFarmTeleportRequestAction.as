package com.ankamagames.dofus.logic.game.common.actions.guild
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class GuildFarmTeleportRequestAction implements Action
   {
       
      
      public var farmId:Number;
      
      public function GuildFarmTeleportRequestAction()
      {
         super();
      }
      
      public static function create(pFarmId:Number) : GuildFarmTeleportRequestAction
      {
         var action:GuildFarmTeleportRequestAction = new GuildFarmTeleportRequestAction();
         action.farmId = pFarmId;
         return action;
      }
   }
}
