package com.ankamagames.dofus.logic.game.approach.actions
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class CharacterDeletionAction implements Action
   {
       
      
      public var id:Number;
      
      public var answer:String;
      
      public function CharacterDeletionAction()
      {
         super();
      }
      
      public static function create(id:Number, answer:String) : CharacterDeletionAction
      {
         var a:CharacterDeletionAction = new CharacterDeletionAction();
         a.id = id;
         a.answer = answer;
         return a;
      }
   }
}
