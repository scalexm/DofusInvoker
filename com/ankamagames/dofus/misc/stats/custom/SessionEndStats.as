package com.ankamagames.dofus.misc.stats.custom
{
   import com.ankamagames.berilia.types.data.Hook;
   import com.ankamagames.dofus.logic.common.managers.PlayerManager;
   import com.ankamagames.dofus.misc.interClient.AppIdModifier;
   import com.ankamagames.dofus.misc.interClient.InterClientManager;
   import com.ankamagames.dofus.misc.stats.IHookStats;
   import com.ankamagames.dofus.misc.stats.IStatsClass;
   import com.ankamagames.dofus.misc.stats.StatsAction;
   import com.ankamagames.dofus.misc.utils.HaapiKeyManager;
   import com.ankamagames.jerakine.managers.OptionManager;
   import com.ankamagames.jerakine.messages.Message;
   
   public class SessionEndStats implements IHookStats, IStatsClass
   {
       
      
      public function SessionEndStats()
      {
         super();
         var action:StatsAction = new StatsAction(673);
         action.user = StatsAction.getUserId();
         action.gameSessionId = HaapiKeyManager.getInstance().getGameSessionId();
         action.setParam("account_id",PlayerManager.getInstance().accountId);
         var useSmallScreenFont:Boolean = OptionManager.getOptionManager("dofus")["smallScreenFont"];
         action.setParam("screen_size",!!useSmallScreenFont?15:17);
         var quality:int = OptionManager.getOptionManager("dofus")["dofusQuality"];
         if(quality == 3)
         {
            quality = 0;
         }
         else
         {
            quality = quality + 1;
         }
         action.setParam("quality",quality);
         action.setParam("force_cpu",AppIdModifier.getInstance().forceCPURenderMode);
         action.setParam("client_open",InterClientManager.getInstance().numClients);
         var showDamagesPreview:Boolean = OptionManager.getOptionManager("dofus")["showDamagesPreview"];
         action.setParam("damage_preview",showDamagesPreview);
         action.send();
      }
      
      public function onHook(pHook:Hook, pArgs:Array) : void
      {
      }
      
      public function process(pMessage:Message, pArgs:Array = null) : void
      {
      }
      
      public function remove() : void
      {
      }
   }
}
