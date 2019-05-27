package com.ankamagames.dofus.logic.game.approach.actions
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class GiftAssignRequestAction implements Action
   {
       
      
      public var giftId:uint;
      
      public var characterId:Number;
      
      public function GiftAssignRequestAction()
      {
         super();
      }
      
      public static function create(giftId:uint, characterId:Number) : GiftAssignRequestAction
      {
         var action:GiftAssignRequestAction = new GiftAssignRequestAction();
         action.giftId = giftId;
         action.characterId = characterId;
         return action;
      }
   }
}
