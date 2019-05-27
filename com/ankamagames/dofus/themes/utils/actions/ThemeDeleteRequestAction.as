package com.ankamagames.dofus.themes.utils.actions
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class ThemeDeleteRequestAction implements Action
   {
       
      
      public var themeDirectory:String;
      
      public function ThemeDeleteRequestAction()
      {
         super();
      }
      
      public static function create(directoryName:String) : ThemeDeleteRequestAction
      {
         var action:ThemeDeleteRequestAction = new ThemeDeleteRequestAction();
         action.themeDirectory = directoryName;
         return action;
      }
   }
}
