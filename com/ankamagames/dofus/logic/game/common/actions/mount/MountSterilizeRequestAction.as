package com.ankamagames.dofus.logic.game.common.actions.mount
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class MountSterilizeRequestAction implements Action
   {
       
      
      public function MountSterilizeRequestAction()
      {
         super();
      }
      
      public static function create() : MountSterilizeRequestAction
      {
         return new MountSterilizeRequestAction();
      }
   }
}
