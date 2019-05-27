package com.ankamagames.dofus.logic.game.common.actions.social
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class CharacterReportAction implements Action
   {
       
      
      public var reportedId:Number;
      
      public var reason:uint;
      
      public function CharacterReportAction()
      {
         super();
      }
      
      public static function create(reportedId:Number, reason:uint) : CharacterReportAction
      {
         var a:CharacterReportAction = new CharacterReportAction();
         a.reportedId = reportedId;
         a.reason = reason;
         return a;
      }
   }
}
