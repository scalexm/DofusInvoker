package com.ankamagames.dofus.logic.game.common.actions.social
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class EnemiesListRequestAction implements Action
   {
       
      
      public function EnemiesListRequestAction()
      {
         super();
      }
      
      public static function create() : EnemiesListRequestAction
      {
         var a:EnemiesListRequestAction = new EnemiesListRequestAction();
         return a;
      }
   }
}
