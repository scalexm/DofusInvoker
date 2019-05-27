package com.ankamagames.dofus.logic.game.common.actions
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class ChangeScreenshotsDirectoryAction implements Action
   {
       
      
      public function ChangeScreenshotsDirectoryAction()
      {
         super();
      }
      
      public static function create() : ChangeScreenshotsDirectoryAction
      {
         return new ChangeScreenshotsDirectoryAction();
      }
   }
}
