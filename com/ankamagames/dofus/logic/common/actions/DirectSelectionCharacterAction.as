package com.ankamagames.dofus.logic.common.actions
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class DirectSelectionCharacterAction implements Action
   {
       
      
      public var serverId:uint;
      
      public var characterId:Number;
      
      public function DirectSelectionCharacterAction()
      {
         super();
      }
      
      public static function create(serverId:uint, characterId:Number) : DirectSelectionCharacterAction
      {
         var a:DirectSelectionCharacterAction = new DirectSelectionCharacterAction();
         a.serverId = serverId;
         a.characterId = characterId;
         return a;
      }
   }
}
