package com.ankamagames.dofus.logic.game.common.actions
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class SurveyNotificationAnswerAction implements Action
   {
       
      
      public var surveyId:uint;
      
      public var accept:Boolean;
      
      public function SurveyNotificationAnswerAction()
      {
         super();
      }
      
      public static function create(surveyId:uint, accept:Boolean) : SurveyNotificationAnswerAction
      {
         var a:SurveyNotificationAnswerAction = new SurveyNotificationAnswerAction();
         a.surveyId = surveyId;
         a.accept = accept;
         return a;
      }
   }
}
