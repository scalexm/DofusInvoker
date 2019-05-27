package com.ankamagames.dofus.logic.game.common.actions.jobs
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class JobCrafterDirectoryEntryRequestAction implements Action
   {
       
      
      public var playerId:Number;
      
      public function JobCrafterDirectoryEntryRequestAction()
      {
         super();
      }
      
      public static function create(playerId:Number) : JobCrafterDirectoryEntryRequestAction
      {
         var act:JobCrafterDirectoryEntryRequestAction = new JobCrafterDirectoryEntryRequestAction();
         act.playerId = playerId;
         return act;
      }
   }
}
