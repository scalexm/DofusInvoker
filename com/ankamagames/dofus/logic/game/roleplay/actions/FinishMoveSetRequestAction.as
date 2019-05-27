package com.ankamagames.dofus.logic.game.roleplay.actions
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class FinishMoveSetRequestAction implements Action
   {
       
      
      public var enabledFinishedMoves:Vector.<int>;
      
      public var disabledFinishedMoves:Vector.<int>;
      
      public function FinishMoveSetRequestAction()
      {
         super();
      }
      
      public static function create(enabledFinishedMoves:Vector.<int>, disabledFinishedMoves:Vector.<int>) : FinishMoveSetRequestAction
      {
         var action:FinishMoveSetRequestAction = new FinishMoveSetRequestAction();
         action.enabledFinishedMoves = enabledFinishedMoves;
         action.disabledFinishedMoves = disabledFinishedMoves;
         return action;
      }
   }
}
