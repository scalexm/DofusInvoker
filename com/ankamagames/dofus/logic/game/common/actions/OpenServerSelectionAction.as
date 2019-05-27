package com.ankamagames.dofus.logic.game.common.actions
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class OpenServerSelectionAction implements Action
   {
       
      
      private var _name:String;
      
      public var value:String;
      
      public function OpenServerSelectionAction()
      {
         super();
      }
      
      public static function create() : OpenServerSelectionAction
      {
         return new OpenServerSelectionAction();
      }
   }
}
