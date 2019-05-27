package com.ankamagames.dofus.logic.game.common.actions
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class IncreaseSpellLevelAction implements Action
   {
       
      
      public var spellId:uint;
      
      public var spellLevel:uint;
      
      public function IncreaseSpellLevelAction()
      {
         super();
      }
      
      public static function create(pSpellId:uint, pSpellLevel:uint) : IncreaseSpellLevelAction
      {
         var a:IncreaseSpellLevelAction = new IncreaseSpellLevelAction();
         a.spellId = pSpellId;
         a.spellLevel = pSpellLevel;
         return a;
      }
   }
}
