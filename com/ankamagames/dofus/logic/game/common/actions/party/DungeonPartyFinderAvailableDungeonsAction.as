package com.ankamagames.dofus.logic.game.common.actions.party
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class DungeonPartyFinderAvailableDungeonsAction implements Action
   {
       
      
      public function DungeonPartyFinderAvailableDungeonsAction()
      {
         super();
      }
      
      public static function create() : DungeonPartyFinderAvailableDungeonsAction
      {
         var a:DungeonPartyFinderAvailableDungeonsAction = new DungeonPartyFinderAvailableDungeonsAction();
         return a;
      }
   }
}
