package com.ankamagames.dofus.logic.game.common.actions.quest.treasureHunt
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class TreasureHuntDigRequestAction implements Action
   {
       
      
      public var questType:int;
      
      public function TreasureHuntDigRequestAction()
      {
         super();
      }
      
      public static function create(questType:int) : TreasureHuntDigRequestAction
      {
         var action:TreasureHuntDigRequestAction = new TreasureHuntDigRequestAction();
         action.questType = questType;
         return action;
      }
   }
}
