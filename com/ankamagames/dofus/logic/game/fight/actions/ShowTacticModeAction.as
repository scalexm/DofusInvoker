package com.ankamagames.dofus.logic.game.fight.actions
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class ShowTacticModeAction implements Action
   {
       
      
      public var force:Boolean;
      
      public function ShowTacticModeAction()
      {
         super();
      }
      
      public static function create(pForce:Boolean = false) : ShowTacticModeAction
      {
         var a:ShowTacticModeAction = new ShowTacticModeAction();
         a.force = pForce;
         return a;
      }
   }
}
