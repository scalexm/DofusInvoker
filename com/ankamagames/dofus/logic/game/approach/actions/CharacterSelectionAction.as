package com.ankamagames.dofus.logic.game.approach.actions
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class CharacterSelectionAction implements Action
   {
       
      
      public var characterId:Number;
      
      public var btutoriel:Boolean;
      
      public function CharacterSelectionAction()
      {
         super();
      }
      
      public static function create(characterId:Number, btutoriel:Boolean) : CharacterSelectionAction
      {
         var a:CharacterSelectionAction = new CharacterSelectionAction();
         a.characterId = characterId;
         a.btutoriel = btutoriel;
         return a;
      }
   }
}
