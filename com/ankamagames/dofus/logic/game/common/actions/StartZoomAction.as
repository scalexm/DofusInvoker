package com.ankamagames.dofus.logic.game.common.actions
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class StartZoomAction implements Action
   {
       
      
      public var playerId:Number;
      
      public var value:Number;
      
      public function StartZoomAction()
      {
         super();
      }
      
      public static function create(playerId:Number, value:Number) : StartZoomAction
      {
         var action:StartZoomAction = new StartZoomAction();
         action.playerId = playerId;
         action.value = value;
         return action;
      }
   }
}
