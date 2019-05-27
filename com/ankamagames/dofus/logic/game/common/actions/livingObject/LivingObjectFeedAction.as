package com.ankamagames.dofus.logic.game.common.actions.livingObject
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class LivingObjectFeedAction implements Action
   {
       
      
      public var objectUID:uint;
      
      public var meal:Vector.<Object>;
      
      public function LivingObjectFeedAction()
      {
         super();
      }
      
      public static function create(objectUID:uint, meal:Vector.<Object>) : LivingObjectFeedAction
      {
         var action:LivingObjectFeedAction = new LivingObjectFeedAction();
         action.objectUID = objectUID;
         action.meal = meal;
         return action;
      }
   }
}
