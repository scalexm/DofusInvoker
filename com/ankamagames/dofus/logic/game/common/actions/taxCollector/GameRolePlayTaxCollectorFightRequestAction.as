package com.ankamagames.dofus.logic.game.common.actions.taxCollector
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class GameRolePlayTaxCollectorFightRequestAction implements Action
   {
       
      
      public function GameRolePlayTaxCollectorFightRequestAction()
      {
         super();
      }
      
      public static function create() : GameRolePlayTaxCollectorFightRequestAction
      {
         var action:GameRolePlayTaxCollectorFightRequestAction = new GameRolePlayTaxCollectorFightRequestAction();
         return action;
      }
   }
}
