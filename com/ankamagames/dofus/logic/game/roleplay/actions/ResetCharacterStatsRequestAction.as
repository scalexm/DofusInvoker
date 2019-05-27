package com.ankamagames.dofus.logic.game.roleplay.actions
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class ResetCharacterStatsRequestAction implements Action
   {
       
      
      public function ResetCharacterStatsRequestAction()
      {
         super();
      }
      
      public static function create() : ResetCharacterStatsRequestAction
      {
         var a:ResetCharacterStatsRequestAction = new ResetCharacterStatsRequestAction();
         return a;
      }
   }
}
