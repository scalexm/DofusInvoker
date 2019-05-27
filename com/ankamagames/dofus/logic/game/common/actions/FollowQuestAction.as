package com.ankamagames.dofus.logic.game.common.actions
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class FollowQuestAction implements Action
   {
       
      
      public var questId:uint;
      
      public var objectiveId:int;
      
      public var follow:Boolean;
      
      public function FollowQuestAction()
      {
         super();
      }
      
      public static function create(questId:uint, objectiveId:int, follow:Boolean) : FollowQuestAction
      {
         var action:FollowQuestAction = new FollowQuestAction();
         action.questId = questId;
         action.objectiveId = objectiveId;
         action.follow = follow;
         return action;
      }
   }
}
