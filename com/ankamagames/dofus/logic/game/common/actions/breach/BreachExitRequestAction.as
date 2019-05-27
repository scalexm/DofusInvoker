package com.ankamagames.dofus.logic.game.common.actions.breach
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class BreachExitRequestAction implements Action
   {
       
      
      public function BreachExitRequestAction()
      {
         super();
      }
      
      public static function create() : BreachExitRequestAction
      {
         return new BreachExitRequestAction();
      }
   }
}
