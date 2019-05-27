package com.ankamagames.dofus.logic.game.common.actions.guild
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class GuildInvitationAction implements Action
   {
       
      
      public var targetId:Number;
      
      public function GuildInvitationAction()
      {
         super();
      }
      
      public static function create(pTargetId:Number) : GuildInvitationAction
      {
         var action:GuildInvitationAction = new GuildInvitationAction();
         action.targetId = pTargetId;
         return action;
      }
   }
}
