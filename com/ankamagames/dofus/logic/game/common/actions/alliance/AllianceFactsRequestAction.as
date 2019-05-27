package com.ankamagames.dofus.logic.game.common.actions.alliance
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class AllianceFactsRequestAction implements Action
   {
       
      
      public var allianceId:uint;
      
      public function AllianceFactsRequestAction()
      {
         super();
      }
      
      public static function create(allianceId:uint) : AllianceFactsRequestAction
      {
         var action:AllianceFactsRequestAction = new AllianceFactsRequestAction();
         action.allianceId = allianceId;
         return action;
      }
   }
}
