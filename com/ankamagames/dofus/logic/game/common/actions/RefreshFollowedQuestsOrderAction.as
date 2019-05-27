package com.ankamagames.dofus.logic.game.common.actions
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class RefreshFollowedQuestsOrderAction implements Action
   {
       
      
      public var questsIds:Vector.<uint>;
      
      public function RefreshFollowedQuestsOrderAction()
      {
         super();
      }
      
      public static function create(questsIds:Vector.<uint>) : RefreshFollowedQuestsOrderAction
      {
         var action:RefreshFollowedQuestsOrderAction = new RefreshFollowedQuestsOrderAction();
         action.questsIds = questsIds;
         return action;
      }
   }
}
