package com.ankamagames.dofus.logic.game.common.actions
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class HouseBuyAction implements Action
   {
       
      
      public var proposedPrice:Number = 0;
      
      public function HouseBuyAction()
      {
         super();
      }
      
      public static function create(proposedPrice:Number) : HouseBuyAction
      {
         var action:HouseBuyAction = new HouseBuyAction();
         action.proposedPrice = proposedPrice;
         return action;
      }
   }
}
