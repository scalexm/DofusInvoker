package com.ankamagames.dofus.logic.game.common.actions
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class CaptureScreenWithoutUIAction implements Action
   {
       
      
      public function CaptureScreenWithoutUIAction()
      {
         super();
      }
      
      public static function create() : CaptureScreenWithoutUIAction
      {
         return new CaptureScreenWithoutUIAction();
      }
   }
}
