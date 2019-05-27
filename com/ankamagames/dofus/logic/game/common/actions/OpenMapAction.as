package com.ankamagames.dofus.logic.game.common.actions
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class OpenMapAction implements Action
   {
       
      
      public var ignoreSetting:Boolean;
      
      public var fromShortcut:Boolean;
      
      public var conquest:Boolean;
      
      public function OpenMapAction()
      {
         super();
      }
      
      public static function create(ignoreSetting:Boolean = false, fromShortcut:Boolean = false, conquest:Boolean = false) : OpenMapAction
      {
         var a:OpenMapAction = new OpenMapAction();
         a.ignoreSetting = ignoreSetting;
         a.fromShortcut = fromShortcut;
         a.conquest = conquest;
         return a;
      }
   }
}
