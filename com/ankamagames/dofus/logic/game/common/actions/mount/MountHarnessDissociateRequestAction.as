package com.ankamagames.dofus.logic.game.common.actions.mount
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class MountHarnessDissociateRequestAction implements Action
   {
       
      
      public function MountHarnessDissociateRequestAction()
      {
         super();
      }
      
      public static function create() : MountHarnessDissociateRequestAction
      {
         var a:MountHarnessDissociateRequestAction = new MountHarnessDissociateRequestAction();
         return a;
      }
   }
}
