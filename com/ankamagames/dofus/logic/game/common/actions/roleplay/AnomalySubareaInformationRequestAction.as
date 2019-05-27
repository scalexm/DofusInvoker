package com.ankamagames.dofus.logic.game.common.actions.roleplay
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class AnomalySubareaInformationRequestAction implements Action
   {
       
      
      public var uiName:String;
      
      public function AnomalySubareaInformationRequestAction()
      {
         super();
      }
      
      public static function create(uiName:String) : AnomalySubareaInformationRequestAction
      {
         var action:AnomalySubareaInformationRequestAction = new AnomalySubareaInformationRequestAction();
         action.uiName = uiName;
         return action;
      }
   }
}
