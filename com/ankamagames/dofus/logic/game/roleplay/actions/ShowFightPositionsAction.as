package com.ankamagames.dofus.logic.game.roleplay.actions
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class ShowFightPositionsAction implements Action
   {
       
      
      public var fromShortcut:Boolean;
      
      public function ShowFightPositionsAction()
      {
         super();
      }
      
      public static function create(pFromShortcut:Boolean = true) : ShowFightPositionsAction
      {
         var a:ShowFightPositionsAction = new ShowFightPositionsAction();
         a.fromShortcut = pFromShortcut;
         return a;
      }
   }
}
