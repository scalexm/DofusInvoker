package com.ankamagames.dofus.logic.game.fight.actions
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class GameFightPlacementSwapPositionsRequestAction implements Action
   {
       
      
      public var cellId:uint;
      
      public var requestedId:Number;
      
      public function GameFightPlacementSwapPositionsRequestAction()
      {
         super();
      }
      
      public static function create(pCellId:uint, pRequestedId:Number) : GameFightPlacementSwapPositionsRequestAction
      {
         var action:GameFightPlacementSwapPositionsRequestAction = new GameFightPlacementSwapPositionsRequestAction();
         action.cellId = pCellId;
         action.requestedId = pRequestedId;
         return action;
      }
   }
}
