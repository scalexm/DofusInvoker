package com.ankamagames.dofus.logic.game.common.actions.party
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class ArenaRegisterAction implements Action
   {
       
      
      public var fightTypeId:uint;
      
      public var shortcut:Boolean;
      
      public function ArenaRegisterAction()
      {
         super();
      }
      
      public static function create(fightTypeId:uint, shortcut:Boolean) : ArenaRegisterAction
      {
         var a:ArenaRegisterAction = new ArenaRegisterAction();
         a.fightTypeId = fightTypeId;
         a.shortcut = shortcut;
         return a;
      }
   }
}
