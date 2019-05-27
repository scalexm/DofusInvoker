package com.ankamagames.dofus.logic.game.approach.actions
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class GiftAssignAllRequestAction implements Action
   {
       
      
      public var characterId:Number;
      
      public function GiftAssignAllRequestAction()
      {
         super();
      }
      
      public static function create(characterId:Number) : GiftAssignAllRequestAction
      {
         var a:GiftAssignAllRequestAction = new GiftAssignAllRequestAction();
         a.characterId = characterId;
         return a;
      }
   }
}
