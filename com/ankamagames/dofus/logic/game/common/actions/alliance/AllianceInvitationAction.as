package com.ankamagames.dofus.logic.game.common.actions.alliance
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class AllianceInvitationAction implements Action
   {
       
      
      public var targetId:Number;
      
      public function AllianceInvitationAction()
      {
         super();
      }
      
      public static function create(pTargetId:Number) : AllianceInvitationAction
      {
         var action:AllianceInvitationAction = new AllianceInvitationAction();
         action.targetId = pTargetId;
         return action;
      }
   }
}
