package com.ankamagames.dofus.themes.utils.actions
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class ThemeInstallRequestAction implements Action
   {
       
      
      public var url:String;
      
      public function ThemeInstallRequestAction()
      {
         super();
      }
      
      public static function create(url:String) : ThemeInstallRequestAction
      {
         var action:ThemeInstallRequestAction = new ThemeInstallRequestAction();
         action.url = url;
         return action;
      }
   }
}
