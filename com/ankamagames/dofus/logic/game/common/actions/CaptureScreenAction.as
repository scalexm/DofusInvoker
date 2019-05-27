package com.ankamagames.dofus.logic.game.common.actions
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class CaptureScreenAction implements Action
   {
       
      
      public function CaptureScreenAction()
      {
         super();
      }
      
      public static function create() : CaptureScreenAction
      {
         return new CaptureScreenAction();
      }
   }
}
