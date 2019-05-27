package com.ankamagames.dofus.logic.game.approach.actions
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class GiftAssignCancelAction implements Action
   {
       
      
      public function GiftAssignCancelAction()
      {
         super();
      }
      
      public static function create() : GiftAssignCancelAction
      {
         var action:GiftAssignCancelAction = new GiftAssignCancelAction();
         return action;
      }
   }
}
