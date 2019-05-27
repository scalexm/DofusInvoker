package com.ankamagames.dofus.logic.connection.actions
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class NicknameChoiceRequestAction implements Action
   {
       
      
      public var nickname:String;
      
      public function NicknameChoiceRequestAction()
      {
         super();
      }
      
      public static function create(nickname:String) : NicknameChoiceRequestAction
      {
         var a:NicknameChoiceRequestAction = new NicknameChoiceRequestAction();
         a.nickname = nickname;
         return a;
      }
   }
}
