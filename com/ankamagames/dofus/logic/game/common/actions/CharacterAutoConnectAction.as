package com.ankamagames.dofus.logic.game.common.actions
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class CharacterAutoConnectAction implements Action
   {
       
      
      public function CharacterAutoConnectAction()
      {
         super();
      }
      
      public static function create() : CharacterAutoConnectAction
      {
         var a:CharacterAutoConnectAction = new CharacterAutoConnectAction();
         return a;
      }
   }
}
