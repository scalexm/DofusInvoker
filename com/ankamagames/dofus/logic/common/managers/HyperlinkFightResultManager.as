package com.ankamagames.dofus.logic.common.managers
{
   import com.ankamagames.berilia.managers.KernelEventsManager;
   import com.ankamagames.dofus.logic.game.common.managers.PlayedCharacterManager;
   import com.ankamagames.dofus.misc.lists.FightHookList;
   
   public class HyperlinkFightResultManager
   {
       
      
      public function HyperlinkFightResultManager()
      {
         super();
      }
      
      public static function open() : void
      {
         if(PlayedCharacterManager.getInstance().isFighting)
         {
            return;
         }
         KernelEventsManager.getInstance().processCallback(FightHookList.OpenFightResults,null);
      }
   }
}
