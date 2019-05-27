package com.ankamagames.dofus.modules.utils.actions
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class ModuleInstallRequestAction implements Action
   {
       
      
      public var moduleUrl:String;
      
      public function ModuleInstallRequestAction()
      {
         super();
      }
      
      public static function create(url:String) : ModuleInstallRequestAction
      {
         var action:ModuleInstallRequestAction = new ModuleInstallRequestAction();
         action.moduleUrl = url;
         return action;
      }
   }
}
