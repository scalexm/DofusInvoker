package com.ankamagames.dofus.logic.game.roleplay.actions
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class LeaveDialogRequestAction implements Action
   {
       
      
      public function LeaveDialogRequestAction()
      {
         super();
      }
      
      public static function create() : LeaveDialogRequestAction
      {
         return new LeaveDialogRequestAction();
      }
   }
}
