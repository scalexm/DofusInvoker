package com.ankamagames.dofus.logic.game.approach.actions
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class CharacterReplayRequestAction implements Action
   {
       
      
      public var characterId:Number;
      
      public function CharacterReplayRequestAction()
      {
         super();
      }
      
      public static function create(characterId:Number) : CharacterReplayRequestAction
      {
         var a:CharacterReplayRequestAction = new CharacterReplayRequestAction();
         a.characterId = characterId;
         return a;
      }
   }
}
