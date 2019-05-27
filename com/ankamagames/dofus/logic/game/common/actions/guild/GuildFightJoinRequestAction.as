package com.ankamagames.dofus.logic.game.common.actions.guild
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class GuildFightJoinRequestAction implements Action
   {
       
      
      public var taxCollectorId:Number;
      
      public function GuildFightJoinRequestAction()
      {
         super();
      }
      
      public static function create(pTaxCollectorId:Number) : GuildFightJoinRequestAction
      {
         var action:GuildFightJoinRequestAction = new GuildFightJoinRequestAction();
         action.taxCollectorId = pTaxCollectorId;
         return action;
      }
   }
}
