package com.ankamagames.dofus.logic.game.common.actions.guild
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class GuildKickRequestAction implements Action
   {
       
      
      public var targetId:Number;
      
      public function GuildKickRequestAction()
      {
         super();
      }
      
      public static function create(pTargetId:Number) : GuildKickRequestAction
      {
         var action:GuildKickRequestAction = new GuildKickRequestAction();
         action.targetId = pTargetId;
         return action;
      }
   }
}
