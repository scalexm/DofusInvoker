package com.ankamagames.dofus.logic.game.common.actions.mount
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class MountReleaseRequestAction implements Action
   {
       
      
      public function MountReleaseRequestAction()
      {
         super();
      }
      
      public static function create() : MountReleaseRequestAction
      {
         return new MountReleaseRequestAction();
      }
   }
}
