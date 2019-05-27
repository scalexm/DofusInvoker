package com.ankamagames.dofus.logic.game.roleplay.actions
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class FinishMoveListRequestAction implements Action
   {
       
      
      public function FinishMoveListRequestAction()
      {
         super();
      }
      
      public static function create() : FinishMoveListRequestAction
      {
         return new FinishMoveListRequestAction();
      }
   }
}
