package com.ankamagames.dofus.logic.game.common.frames
{
   import com.ankamagames.berilia.managers.KernelEventsManager;
   import com.ankamagames.berilia.managers.UiModuleManager;
   import com.ankamagames.dofus.kernel.net.ConnectionsHandler;
   import com.ankamagames.dofus.logic.common.managers.PlayerManager;
   import com.ankamagames.dofus.logic.game.common.actions.externalGame.GetComicRequestAction;
   import com.ankamagames.dofus.logic.game.common.actions.externalGame.GetComicsLibraryRequestAction;
   import com.ankamagames.dofus.logic.game.common.actions.externalGame.OpenWebServiceAction;
   import com.ankamagames.dofus.logic.game.common.actions.externalGame.ShopArticlesListRequestAction;
   import com.ankamagames.dofus.logic.game.common.actions.externalGame.ShopAuthentificationRequestAction;
   import com.ankamagames.dofus.logic.game.common.actions.externalGame.ShopBuyRequestAction;
   import com.ankamagames.dofus.logic.game.common.actions.externalGame.ShopFrontPageRequestAction;
   import com.ankamagames.dofus.logic.game.common.actions.externalGame.ShopSearchRequestAction;
   import com.ankamagames.dofus.logic.game.common.managers.ComicsManager;
   import com.ankamagames.dofus.logic.game.common.managers.DofusShopManager;
   import com.ankamagames.dofus.misc.lists.ExternalGameHookList;
   import com.ankamagames.dofus.misc.lists.HookList;
   import com.ankamagames.dofus.network.enums.HaapiAuthTypeEnum;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.havenbag.HavenBagPackListMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.havenbag.RoomAvailableUpdateMessage;
   import com.ankamagames.dofus.network.messages.web.haapi.HaapiAuthErrorMessage;
   import com.ankamagames.dofus.network.messages.web.haapi.HaapiTokenMessage;
   import com.ankamagames.dofus.network.messages.web.haapi.HaapiTokenRequestMessage;
   import com.ankamagames.dofus.types.enums.DofusShopEnum;
   import com.ankamagames.jerakine.data.XmlConfig;
   import com.ankamagames.jerakine.logger.Log;
   import com.ankamagames.jerakine.logger.Logger;
   import com.ankamagames.jerakine.messages.Frame;
   import com.ankamagames.jerakine.messages.Message;
   import com.ankamagames.jerakine.types.enums.Priority;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import flash.utils.getQualifiedClassName;
   
   public class ExternalGameFrame implements Frame
   {
      
      protected static const _log:Logger = Log.getLogger(getQualifiedClassName(ExternalGameFrame));
       
      
      private var _tokenRequestCallback:Array;
      
      private var _tokenRequestTimeoutTimer:Timer;
      
      private var _tokenRequestHasTimedOut:Boolean = false;
      
      public function ExternalGameFrame()
      {
         this._tokenRequestCallback = [];
         super();
      }
      
      public function get priority() : int
      {
         return Priority.NORMAL;
      }
      
      public function pushed() : Boolean
      {
         return true;
      }
      
      public function pulled() : Boolean
      {
         this.clearTokenRequestTimer();
         this._tokenRequestCallback.length = 0;
         return true;
      }
      
      public function process(msg:Message) : Boolean
      {
         var owsa:OpenWebServiceAction = null;
         var haem:HaapiAuthErrorMessage = null;
         var htm:HaapiTokenMessage = null;
         var salra:ShopArticlesListRequestAction = null;
         var sbra:ShopBuyRequestAction = null;
         var ssra:ShopSearchRequestAction = null;
         var gcra:GetComicRequestAction = null;
         var gclra:GetComicsLibraryRequestAction = null;
         var raumsg:RoomAvailableUpdateMessage = null;
         var hbplmsg:HavenBagPackListMessage = null;
         var validThemes:Vector.<int> = null;
         var commonThemeIndex:int = 0;
         var commonMod:Object = null;
         switch(true)
         {
            case msg is OpenWebServiceAction:
               owsa = msg as OpenWebServiceAction;
               KernelEventsManager.getInstance().processCallback(ExternalGameHookList.OpenWebService,owsa.uiName,owsa.uiParams);
               return true;
            case msg is HaapiAuthErrorMessage:
               if(this._tokenRequestHasTimedOut)
               {
                  return true;
               }
               haem = msg as HaapiAuthErrorMessage;
               if(haem.type == HaapiAuthTypeEnum.HAAPI_TOKEN)
               {
                  if(this._tokenRequestCallback.length)
                  {
                     this.clearTokenRequestTimer();
                     this.callOnTokenFunctions("");
                  }
                  else
                  {
                     KernelEventsManager.getInstance().processCallback(ExternalGameHookList.HaapiAuthError);
                  }
               }
               return true;
            case msg is HaapiTokenMessage:
               if(this._tokenRequestHasTimedOut)
               {
                  return true;
               }
               htm = msg as HaapiTokenMessage;
               if(this._tokenRequestCallback.length)
               {
                  this.clearTokenRequestTimer();
                  this.callOnTokenFunctions(htm.token);
               }
               else
               {
                  KernelEventsManager.getInstance().processCallback(ExternalGameHookList.HaapiAuthToken,htm.token);
               }
               return true;
            case msg is ShopAuthentificationRequestAction:
               if(XmlConfig.getInstance().getEntry("config.dev.shopIceToken") == "true")
               {
                  commonMod = UiModuleManager.getInstance().getModule("Ankama_Common").mainClass;
                  commonMod.openInputPopup("ICE Authentication","To access the Release shop, please enter a valid ICE Token.\nClose this message to access the Local shop.",this.onTokenInput,this.onCancel);
               }
               else
               {
                  this.getIceToken(this.openShop);
               }
               return true;
            case msg is ShopArticlesListRequestAction:
               salra = msg as ShopArticlesListRequestAction;
               DofusShopManager.getInstance().getArticlesList(salra.categoryId,salra.pageId);
               return true;
            case msg is ShopBuyRequestAction:
               sbra = msg as ShopBuyRequestAction;
               DofusShopManager.getInstance().buyArticle(sbra.articleId,sbra.currencyId,sbra.quantity);
               return true;
            case msg is ShopFrontPageRequestAction:
               DofusShopManager.getInstance().getHome();
               return true;
            case msg is ShopSearchRequestAction:
               ssra = msg as ShopSearchRequestAction;
               DofusShopManager.getInstance().searchForArticles(ssra.text,ssra.pageId);
               return true;
            case msg is GetComicRequestAction:
               gcra = msg as GetComicRequestAction;
               ComicsManager.getInstance().getComic(gcra.remoteId,gcra.language,gcra.previewOnly);
               return true;
            case msg is GetComicsLibraryRequestAction:
               gclra = msg as GetComicsLibraryRequestAction;
               ComicsManager.getInstance().getLibrary(gclra.accountId);
               return true;
            case msg is RoomAvailableUpdateMessage:
               raumsg = msg as RoomAvailableUpdateMessage;
               PlayerManager.getInstance().havenbagAvailableRooms = raumsg.nbRoom;
               KernelEventsManager.getInstance().processCallback(HookList.HavenbagAvailableRoomsUpdate,raumsg.nbRoom);
               return true;
            case msg is HavenBagPackListMessage:
               hbplmsg = msg as HavenBagPackListMessage;
               validThemes = hbplmsg.packIds;
               commonThemeIndex = validThemes.indexOf(-1);
               if(commonThemeIndex != -1)
               {
                  validThemes.splice(commonThemeIndex,1);
               }
               PlayerManager.getInstance().havenbagAvailableThemes = validThemes;
               KernelEventsManager.getInstance().processCallback(HookList.HavenbagAvailableThemesUpdate,hbplmsg.packIds);
               return true;
            default:
               return false;
         }
      }
      
      public function getIceToken(callback:Function = null) : void
      {
         this._tokenRequestHasTimedOut = false;
         if(callback != null)
         {
            this._tokenRequestCallback.push(callback);
         }
         var htrm:HaapiTokenRequestMessage = new HaapiTokenRequestMessage();
         ConnectionsHandler.getConnection().send(htrm);
         this._tokenRequestTimeoutTimer = new Timer(10000,1);
         this._tokenRequestTimeoutTimer.addEventListener(TimerEvent.TIMER_COMPLETE,this.onTokenRequestTimeout);
         this._tokenRequestTimeoutTimer.start();
      }
      
      private function openShop(token:String) : void
      {
         if(!token)
         {
            KernelEventsManager.getInstance().processCallback(ExternalGameHookList.DofusShopError,DofusShopEnum.ERROR_AUTHENTICATION_FAILED);
            return;
         }
         DofusShopManager.getInstance().init(token);
      }
      
      private function onTokenRequestTimeout(event:TimerEvent) : void
      {
         this._tokenRequestHasTimedOut = true;
         this.clearTokenRequestTimer();
         this.callOnTokenFunctions("");
      }
      
      private function callOnTokenFunctions(token:String) : void
      {
         var fct:Function = null;
         if(this._tokenRequestCallback.length)
         {
            for each(fct in this._tokenRequestCallback)
            {
               fct(token);
            }
            this._tokenRequestCallback.length = 0;
         }
      }
      
      private function clearTokenRequestTimer() : void
      {
         if(this._tokenRequestTimeoutTimer)
         {
            this._tokenRequestTimeoutTimer.stop();
            this._tokenRequestTimeoutTimer.removeEventListener(TimerEvent.TIMER_COMPLETE,this.onTokenRequestTimeout);
            this._tokenRequestTimeoutTimer = null;
         }
      }
      
      private function onTokenInput(value:String) : void
      {
         DofusShopManager.getInstance().init(value,true);
      }
      
      private function onCancel() : void
      {
         this.getIceToken(this.openShop);
      }
   }
}
