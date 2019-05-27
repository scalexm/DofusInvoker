package com.ankamagames.dofus.logic.game.common.actions
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class GoToUrlAction implements Action
   {
       
      
      public var url:String;
      
      public function GoToUrlAction()
      {
         super();
      }
      
      public static function create(pUrl:String) : GoToUrlAction
      {
         var action:GoToUrlAction = new GoToUrlAction();
         action.url = pUrl;
         return action;
      }
   }
}
