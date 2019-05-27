package com.ankamagames.dofus.themes.utils.actions
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class ThemeListRequestAction implements Action
   {
       
      
      public var listUrl:String;
      
      public function ThemeListRequestAction()
      {
         super();
      }
      
      public static function create(url:String) : ThemeListRequestAction
      {
         var action:ThemeListRequestAction = new ThemeListRequestAction();
         action.listUrl = url;
         return action;
      }
   }
}
