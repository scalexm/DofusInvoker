package com.ankamagames.dofus.logic.game.common.actions.quest.treasureHunt
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class TreasureHuntFlagRemoveRequestAction implements Action
   {
       
      
      public var questType:int;
      
      public var index:int;
      
      public function TreasureHuntFlagRemoveRequestAction()
      {
         super();
      }
      
      public static function create(questType:int, index:int) : TreasureHuntFlagRemoveRequestAction
      {
         var action:TreasureHuntFlagRemoveRequestAction = new TreasureHuntFlagRemoveRequestAction();
         action.questType = questType;
         action.index = index;
         return action;
      }
   }
}
