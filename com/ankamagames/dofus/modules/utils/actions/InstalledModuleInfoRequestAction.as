package com.ankamagames.dofus.modules.utils.actions
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class InstalledModuleInfoRequestAction implements Action
   {
       
      
      public var moduleId:String;
      
      public function InstalledModuleInfoRequestAction()
      {
         super();
      }
      
      public static function create(moduleId:String) : InstalledModuleInfoRequestAction
      {
         var action:InstalledModuleInfoRequestAction = new InstalledModuleInfoRequestAction();
         action.moduleId = moduleId;
         return action;
      }
   }
}
