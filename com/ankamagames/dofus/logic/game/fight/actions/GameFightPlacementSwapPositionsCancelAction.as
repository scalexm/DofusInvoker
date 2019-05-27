package com.ankamagames.dofus.logic.game.fight.actions
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class GameFightPlacementSwapPositionsCancelAction implements Action
   {
       
      
      public var requestId:uint;
      
      public function GameFightPlacementSwapPositionsCancelAction()
      {
         super();
      }
      
      public static function create(pRequestId:uint) : GameFightPlacementSwapPositionsCancelAction
      {
         var action:GameFightPlacementSwapPositionsCancelAction = new GameFightPlacementSwapPositionsCancelAction();
         action.requestId = pRequestId;
         return action;
      }
   }
}
