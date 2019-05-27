package com.ankamagames.dofus.logic.game.fight.actions
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class GameFightSpellCastAction implements Action
   {
       
      
      public var spellId:uint;
      
      public var slot:int;
      
      public function GameFightSpellCastAction()
      {
         super();
      }
      
      public static function create(spellId:uint, slot:int) : GameFightSpellCastAction
      {
         var a:GameFightSpellCastAction = new GameFightSpellCastAction();
         a.spellId = spellId;
         a.slot = slot;
         return a;
      }
   }
}
