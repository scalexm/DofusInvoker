package com.ankamagames.dofus.modules.utils.actions
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class ModuleListRequestAction implements Action
   {
       
      
      public var moduleListUrl:String;
      
      public function ModuleListRequestAction()
      {
         super();
      }
      
      public static function create(url:String) : ModuleListRequestAction
      {
         var action:ModuleListRequestAction = new ModuleListRequestAction();
         action.moduleListUrl = url;
         return action;
      }
   }
}
