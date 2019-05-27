package com.ankamagames.dofus.logic.game.roleplay.actions.havenbag
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class HavenbagInvitePlayerAnswerAction implements Action
   {
       
      
      public var hostId:Number;
      
      public var accept:Boolean;
      
      public function HavenbagInvitePlayerAnswerAction()
      {
         super();
      }
      
      public static function create(hostId:Number, accept:Boolean) : HavenbagInvitePlayerAnswerAction
      {
         var a:HavenbagInvitePlayerAnswerAction = new HavenbagInvitePlayerAnswerAction();
         a.hostId = hostId;
         a.accept = accept;
         return a;
      }
   }
}
