package com.ankamagames.dofus.logic.game.common.actions
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class OpenHousesAction implements Action
   {
       
      
      public function OpenHousesAction()
      {
         super();
      }
      
      public static function create() : OpenHousesAction
      {
         var a:OpenHousesAction = new OpenHousesAction();
         return a;
      }
   }
}
