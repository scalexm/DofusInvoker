package com.ankamagames.dofus.logic.game.common.actions.mount
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class MountHarnessColorsUpdateRequestAction implements Action
   {
       
      
      public var useHarnessColors:Boolean;
      
      public function MountHarnessColorsUpdateRequestAction()
      {
         super();
      }
      
      public static function create(useHarnessColors:Boolean) : MountHarnessColorsUpdateRequestAction
      {
         var a:MountHarnessColorsUpdateRequestAction = new MountHarnessColorsUpdateRequestAction();
         a.useHarnessColors = useHarnessColors;
         return a;
      }
   }
}
