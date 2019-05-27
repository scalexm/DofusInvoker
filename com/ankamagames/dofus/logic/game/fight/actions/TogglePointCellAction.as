package com.ankamagames.dofus.logic.game.fight.actions
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class TogglePointCellAction implements Action
   {
       
      
      public function TogglePointCellAction()
      {
         super();
      }
      
      public static function create() : TogglePointCellAction
      {
         var a:TogglePointCellAction = new TogglePointCellAction();
         return a;
      }
   }
}
