package com.ankamagames.dofus.logic.game.fight.actions
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class GameContextKickAction implements Action
   {
       
      
      public var targetId:Number;
      
      public function GameContextKickAction()
      {
         super();
      }
      
      public static function create(targetId:Number) : GameContextKickAction
      {
         var a:GameContextKickAction = new GameContextKickAction();
         a.targetId = targetId;
         return a;
      }
   }
}
