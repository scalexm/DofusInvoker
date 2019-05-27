package com.ankamagames.dofus.logic.game.common.actions.dare
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class DareRewardRequestAction implements Action
   {
       
      
      public var dareId:Number;
      
      public var dareRewardType:int;
      
      public function DareRewardRequestAction()
      {
         super();
      }
      
      public static function create(dareId:Number, dareRewardType:int = 0) : DareRewardRequestAction
      {
         var action:DareRewardRequestAction = new DareRewardRequestAction();
         action.dareId = dareId;
         action.dareRewardType = dareRewardType;
         return action;
      }
   }
}
