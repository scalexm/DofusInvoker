package com.ankamagames.dofus.logic.common.actions
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class AgreementAgreedAction implements Action
   {
       
      
      public var fileName:String;
      
      public function AgreementAgreedAction()
      {
         super();
      }
      
      public static function create(fileName:String) : AgreementAgreedAction
      {
         var a:AgreementAgreedAction = new AgreementAgreedAction();
         a.fileName = fileName;
         return a;
      }
   }
}
