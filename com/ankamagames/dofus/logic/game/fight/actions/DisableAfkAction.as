package com.ankamagames.dofus.logic.game.fight.actions
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class DisableAfkAction implements Action
   {
       
      
      public function DisableAfkAction()
      {
         super();
      }
      
      public static function create() : DisableAfkAction
      {
         var a:DisableAfkAction = new DisableAfkAction();
         return a;
      }
   }
}
