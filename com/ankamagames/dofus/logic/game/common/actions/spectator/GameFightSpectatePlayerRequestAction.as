package com.ankamagames.dofus.logic.game.common.actions.spectator
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class GameFightSpectatePlayerRequestAction implements Action
   {
       
      
      public var playerId:Number;
      
      public function GameFightSpectatePlayerRequestAction()
      {
         super();
      }
      
      public static function create(playerId:Number) : GameFightSpectatePlayerRequestAction
      {
         var a:GameFightSpectatePlayerRequestAction = new GameFightSpectatePlayerRequestAction();
         a.playerId = playerId;
         return a;
      }
   }
}
