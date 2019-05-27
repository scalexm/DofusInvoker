package com.ankamagames.dofus.misc.stats.ui
{
   import com.ankamagames.berilia.types.data.Hook;
   import com.ankamagames.berilia.utils.BeriliaHookList;
   import com.ankamagames.dofus.logic.common.managers.PlayerManager;
   import com.ankamagames.dofus.logic.game.common.managers.PlayedCharacterManager;
   import com.ankamagames.dofus.logic.game.common.types.DofusShopArticle;
   import com.ankamagames.dofus.misc.lists.ExternalGameHookList;
   import com.ankamagames.dofus.misc.stats.IHookStats;
   import com.ankamagames.dofus.misc.stats.StatisticsManager;
   import com.ankamagames.dofus.misc.stats.StatsAction;
   import com.ankamagames.dofus.misc.utils.HaapiKeyManager;
   import com.ankamagames.jerakine.messages.Message;
   
   public class ShopNavigationStats implements IUiStats, IHookStats
   {
      
      private static const EVENT_ID:uint = 700;
       
      
      private var _actionsStack:Vector.<StatsAction>;
      
      private var action_count:int;
      
      public function ShopNavigationStats(args:Array)
      {
         super();
         this.action_count = 0;
         this._actionsStack = new Vector.<StatsAction>(0);
         this.CreateNewStatShop(ShopTypeStat.OPEN_UI,0);
      }
      
      private function CreateNewStatShop(action_type:int, action_id:int) : void
      {
         var _statsAction:StatsAction = new StatsAction(EVENT_ID);
         _statsAction.user = StatsAction.getUserId();
         _statsAction.gameSessionId = HaapiKeyManager.getInstance().getGameSessionId();
         _statsAction.setParam("account_id",PlayerManager.getInstance().accountId);
         _statsAction.setParam("server_id",PlayerManager.getInstance().server.id);
         _statsAction.setParam("character_id",PlayedCharacterManager.getInstance().extractedServerCharacterIdFromInterserverCharacterId);
         _statsAction.setParam("map_id",PlayedCharacterManager.getInstance().currentMap.mapId);
         _statsAction.setParam("character_level",PlayedCharacterManager.getInstance().infos.level);
         _statsAction.setParam("action_type",action_type);
         _statsAction.setParam("action_count",this.action_count);
         _statsAction.setParam("action_id",action_id);
         this._actionsStack.push(_statsAction);
      }
      
      public function process(pMessage:Message, pArgs:Array = null) : void
      {
      }
      
      public function remove() : void
      {
      }
      
      public function onHook(pHook:Hook, pArgs:Array) : void
      {
         var selectedArticle:DofusShopArticle = null;
         var wantToBuyArticle:DofusShopArticle = null;
         var isInstantBuy:Boolean = false;
         var boughtArticleId:int = 0;
         if(pArgs == null || pArgs.length == 0)
         {
            return;
         }
         switch(pHook.name)
         {
            case BeriliaHookList.UiUnloaded.name:
               if(pArgs[0] == "webShop")
               {
                  this.CreateNewStatShop(ShopTypeStat.CLOSE_UI,0);
                  StatisticsManager.getInstance().sendActions(this._actionsStack);
                  break;
               }
               break;
            case ExternalGameHookList.DofusShopArticlesList.name:
               this.action_count++;
               this.CreateNewStatShop(ShopTypeStat.NAVIGATE,pArgs[pArgs.length - 1]);
               break;
            case ExternalGameHookList.DofusShopCurrentSelectedArticle.name:
               selectedArticle = pArgs[0] as DofusShopArticle;
               this.action_count++;
               this.CreateNewStatShop(ShopTypeStat.CLICK,selectedArticle.id);
               break;
            case ExternalGameHookList.DofusShopBuySelectedArticleAction.name:
               wantToBuyArticle = pArgs[0] as DofusShopArticle;
               isInstantBuy = pArgs[1] as Boolean;
               this.action_count++;
               this.CreateNewStatShop(!!isInstantBuy?int(ShopTypeStat.BUY_INSTANT):int(ShopTypeStat.BUY_FROM_DETAILS),wantToBuyArticle.id);
               break;
            case ExternalGameHookList.DofusShopSuccessfulPurchase.name:
               boughtArticleId = pArgs[0] as int;
               this.action_count++;
               this.CreateNewStatShop(ShopTypeStat.BUY_CONFIRM,boughtArticleId);
         }
      }
   }
}
