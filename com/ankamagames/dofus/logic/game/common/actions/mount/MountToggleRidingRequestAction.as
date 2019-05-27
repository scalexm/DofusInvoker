package com.ankamagames.dofus.logic.game.common.actions.mount
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class MountToggleRidingRequestAction implements Action
   {
       
      
      public var isToggle:Boolean;
      
      public function MountToggleRidingRequestAction()
      {
         super();
      }
      
      public static function create(isToggle:Boolean = false) : MountToggleRidingRequestAction
      {
         var result:MountToggleRidingRequestAction = new MountToggleRidingRequestAction();
         result.isToggle = isToggle;
         return result;
      }
   }
}
