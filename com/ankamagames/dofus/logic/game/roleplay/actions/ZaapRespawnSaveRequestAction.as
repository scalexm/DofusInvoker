package com.ankamagames.dofus.logic.game.roleplay.actions
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class ZaapRespawnSaveRequestAction implements Action
   {
       
      
      public function ZaapRespawnSaveRequestAction()
      {
         super();
      }
      
      public static function create() : ZaapRespawnSaveRequestAction
      {
         var action:ZaapRespawnSaveRequestAction = new ZaapRespawnSaveRequestAction();
         return action;
      }
   }
}
