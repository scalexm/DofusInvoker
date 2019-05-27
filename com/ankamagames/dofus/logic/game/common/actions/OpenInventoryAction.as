package com.ankamagames.dofus.logic.game.common.actions
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class OpenInventoryAction implements Action
   {
       
      
      public var behavior:String;
      
      public function OpenInventoryAction()
      {
         super();
      }
      
      public static function create(behavior:String = "bag") : OpenInventoryAction
      {
         var a:OpenInventoryAction = new OpenInventoryAction();
         a.behavior = behavior;
         return a;
      }
   }
}
