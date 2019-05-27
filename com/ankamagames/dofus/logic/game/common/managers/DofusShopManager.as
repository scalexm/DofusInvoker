package com.ankamagames.dofus.logic.game.common.managers
{
   import com.ankamagames.berilia.Berilia;
   import com.ankamagames.berilia.managers.KernelEventsManager;
   import com.ankamagames.berilia.types.event.UiUnloadEvent;
   import com.ankamagames.dofus.logic.common.managers.PlayerManager;
   import com.ankamagames.dofus.logic.game.common.frames.ChatFrame;
   import com.ankamagames.dofus.logic.game.common.types.DofusShopArticle;
   import com.ankamagames.dofus.logic.game.common.types.DofusShopCategory;
   import com.ankamagames.dofus.logic.game.common.types.DofusShopHighlight;
   import com.ankamagames.dofus.logic.game.common.types.DofusShopObject;
   import com.ankamagames.dofus.misc.lists.ChatHookList;
   import com.ankamagames.dofus.misc.lists.ExternalGameHookList;
   import com.ankamagames.dofus.misc.utils.CharacterIdConverter;
   import com.ankamagames.dofus.misc.utils.RpcServiceCenter;
   import com.ankamagames.dofus.types.enums.DofusShopEnum;
   import com.ankamagames.jerakine.data.I18n;
   import com.ankamagames.jerakine.logger.Log;
   import com.ankamagames.jerakine.logger.Logger;
   import com.ankamagames.jerakine.managers.LangManager;
   import flash.events.ErrorEvent;
   import flash.events.IOErrorEvent;
   
   public class DofusShopManager
   {
      
      private static const _log:Logger = Log.getLogger("DofusShopManager");
      
      private static const SHOP_KEY:String = "DOFUS_INGAME";
      
      private static const SHOP_STEAM_KEY:String = "STEAM_DOFUS";
      
      private static const ORDER_PROCESSED:String = "PROCESSED";
      
      private static var _self:DofusShopManager;
       
      
      private var _serviceBaseUrl:String;
      
      private var _serviceType:String;
      
      private var _serviceVersion:String;
      
      private var _currentLocale:String;
      
      private var _currentPurchaseId:int;
      
      private var _cacheHome:Object;
      
      private var _cacheArticles:Array;
      
      private var _objectPool:Array;
      
      private var _lastCategory:int;
      
      private var _lastPage:int;
      
      private var _isOnHomePage:Boolean;
      
      private var _currentShopKey:String;
      
      public function DofusShopManager()
      {
         super();
         this._currentShopKey = SHOP_KEY;
      }
      
      public static function getInstance() : DofusShopManager
      {
         if(!_self)
         {
            _self = new DofusShopManager();
         }
         return _self;
      }
      
      public function init(key:String, forceReleaseGameService:Boolean = false) : void
      {
         this._serviceType = "json";
         this._serviceVersion = "1.0";
         this._currentLocale = LangManager.getInstance().getEntry("config.lang.current");
         this._objectPool = new Array();
         if(!forceReleaseGameService)
         {
            this._serviceBaseUrl = RpcServiceCenter.getInstance().apiDomain + "/game/";
         }
         else
         {
            this._serviceBaseUrl = "https://api.ankama.com/game/";
         }
         var characterId:int = CharacterIdConverter.extractServerCharacterIdFromInterserverCharacterId(PlayedCharacterManager.getInstance().id);
         if(SteamManager.hasSteamApi() && SteamManager.getInstance().isSteamEmbed())
         {
            RpcServiceCenter.getInstance().makeRpcCall(this._serviceBaseUrl + "authentification." + this._serviceType,this._serviceType,this._serviceVersion,"SteamByAnkamaToken",[key,1,SteamManager.getInstance().steamUserId,this._currentLocale,SteamManager.getInstance().steamUserCountry,SteamManager.getInstance().steamUserCurrency,PlayerManager.getInstance().server.id,characterId],this.onAuthentification);
         }
         else
         {
            RpcServiceCenter.getInstance().makeRpcCall(this._serviceBaseUrl + "authentification." + this._serviceType,this._serviceType,this._serviceVersion,"AuthenticationByAnkamaToken",[key,1,PlayerManager.getInstance().server.id,characterId],this.onAuthentification);
         }
         this.open();
      }
      
      public function open() : void
      {
         Berilia.getInstance().addEventListener(UiUnloadEvent.UNLOAD_UI_COMPLETE,this.onClose);
         this._cacheArticles = [];
      }
      
      public function getMoney() : void
      {
         RpcServiceCenter.getInstance().makeRpcCall(this._serviceBaseUrl + "account." + this._serviceType,this._serviceType,this._serviceVersion,"Money",[],this.onMoney);
      }
      
      public function getHome() : void
      {
         this._isOnHomePage = true;
         if(this._cacheHome)
         {
            KernelEventsManager.getInstance().processCallback(ExternalGameHookList.DofusShopHome,this._cacheHome.categories,this._cacheHome.gondolaArticles,this._cacheHome.gondolaHeads,this._cacheHome.highlightCarousel,this._cacheHome.highlightImages);
            return;
         }
         RpcServiceCenter.getInstance().makeRpcCall(this._serviceBaseUrl + "shop." + this._serviceType,this._serviceType,this._serviceVersion,"Home",[this._currentShopKey,this._currentLocale],this.onHome);
      }
      
      public function buyArticle(articleId:int, currencyId:int, quantity:int = 1) : void
      {
         this._currentPurchaseId = articleId;
         RpcServiceCenter.getInstance().makeRpcCall(this._serviceBaseUrl + "shop." + this._serviceType,this._serviceType,this._serviceVersion,"QuickBuy",[this._currentShopKey,this._currentLocale,articleId,quantity,currencyId],this.onBuyArticle,true,false);
      }
      
      public function confirmSteamArticlePurchase(orderId:int, authorised:Boolean) : void
      {
         RpcServiceCenter.getInstance().makeRpcCall(this._serviceBaseUrl + "shop." + this._serviceType,this._serviceType,this._serviceVersion,"PartnerFinalizeTransaction",[this._currentShopKey,this._currentLocale,authorised,orderId],this.onSteamPurchaseConfirm);
      }
      
      public function getArticlesList(category:int, page:int = 1, size:int = 12) : void
      {
         this._isOnHomePage = false;
         this._lastCategory = category;
         this._lastPage = page;
         if(!this._cacheArticles[category])
         {
            this._cacheArticles[category] = new Array();
         }
         if(this._cacheArticles[category][page])
         {
            KernelEventsManager.getInstance().processCallback(ExternalGameHookList.DofusShopArticlesList,this._cacheArticles[category][page].articles,this._cacheArticles[category][page].totalPages);
            this.checkPreviousAndNextArticlePages(category,page,this._cacheArticles[category][page].totalPages);
            return;
         }
         RpcServiceCenter.getInstance().makeRpcCall(this._serviceBaseUrl + "shop." + this._serviceType,this._serviceType,this._serviceVersion,"ArticlesList",[this._currentShopKey,this._currentLocale,category,page,size],this.onArticlesList,false);
      }
      
      public function searchForArticles(criteria:String, page:int = 1, size:int = 12) : void
      {
         this._isOnHomePage = false;
         RpcServiceCenter.getInstance().makeRpcCall(this._serviceBaseUrl + "shop." + this._serviceType,this._serviceType,this._serviceVersion,"ArticlesSearch",[this._currentShopKey,this._currentLocale,criteria,[],page,size],this.onSearchArticles);
      }
      
      public function updateAfterExpiredArticle(articleId:int) : void
      {
         var l:int = 0;
         var data:DofusShopObject = null;
         var i:int = 0;
         var category:int = 0;
         var page:int = 0;
         var categoriesToPurge:Array = null;
         var categoryKey:* = null;
         var needUpdate:Boolean = false;
         var pageKey:* = null;
         var pageObj:Object = null;
         if(this._cacheHome && this._cacheHome.gondolaArticles)
         {
            l = this._cacheHome.gondolaArticles.length;
            for(i = 0; i < l; )
            {
               if(this._cacheHome.gondolaArticles[i].id == articleId)
               {
                  this._cacheHome.gondolaArticles.splice(i,1);
                  if(this._isOnHomePage)
                  {
                     KernelEventsManager.getInstance().processCallback(ExternalGameHookList.DofusShopHome,this._cacheHome.categories,this._cacheHome.gondolaArticles,this._cacheHome.gondolaHeads,this._cacheHome.highlightCarousel,this._cacheHome.highlightImages);
                     break;
                  }
                  break;
               }
               i++;
            }
         }
         if(this._cacheArticles)
         {
            categoriesToPurge = new Array();
            for(categoryKey in this._cacheArticles)
            {
               category = parseInt(categoryKey);
               loop2:
               for(pageKey in this._cacheArticles[category])
               {
                  page = parseInt(pageKey);
                  if(categoriesToPurge.indexOf(category) != -1)
                  {
                     break;
                  }
                  if(this._cacheArticles[category][page].articles)
                  {
                     l = this._cacheArticles[category][page].articles.length;
                     for(i = 0; i < l; )
                     {
                        if(this._cacheArticles[category][page].articles[i].id == articleId)
                        {
                           categoriesToPurge.push(category);
                           continue loop2;
                        }
                        i++;
                     }
                  }
               }
            }
            needUpdate = false;
            for each(category in categoriesToPurge)
            {
               if(category == this._lastCategory)
               {
                  needUpdate = true;
               }
               for each(pageObj in this._cacheArticles[category])
               {
                  for each(data in pageObj.articles)
                  {
                     data.free();
                  }
               }
               delete this._cacheArticles[category];
            }
            if(!this._isOnHomePage && needUpdate)
            {
               this.getArticlesList(this._lastCategory,this._lastPage);
            }
         }
      }
      
      private function onAuthentification(success:Boolean, params:*, request:*) : void
      {
         _log.debug("onAuthentification - " + success);
         if(success)
         {
            this.getMoney();
            this.getHome();
         }
         else
         {
            _log.error(params);
            KernelEventsManager.getInstance().processCallback(ExternalGameHookList.DofusShopError,DofusShopEnum.ERROR_AUTHENTICATION_FAILED);
         }
      }
      
      private function onMoney(success:Boolean, params:*, request:*) : void
      {
         _log.debug("onMoney - " + success);
         if(success)
         {
            KernelEventsManager.getInstance().processCallback(ExternalGameHookList.DofusShopMoney,params.ogrins,params.krozs);
         }
         else
         {
            this.processCallError(params);
         }
      }
      
      private function onHome(success:Boolean, params:*, request:*) : void
      {
         var data:Object = null;
         var article:DofusShopArticle = null;
         _log.debug("onHome - " + success);
         if(success)
         {
            if(!params.content)
            {
               this.processCallError("Error: Home requested data corrupted");
               return;
            }
            this._cacheHome = {
               "categories":[],
               "gondolaHead":[],
               "gondolaArticles":[],
               "highlightCarousel":[],
               "highlightImages":[]
            };
            if(params.content.categories)
            {
               for each(data in params.content.categories.categories)
               {
                  this._cacheHome.categories.push(new DofusShopCategory(data));
               }
            }
            if(params.content.gondolahead_article)
            {
               for each(data in params.content.gondolahead_article.articles)
               {
                  article = new DofusShopArticle(data);
                  if(!article.hasExpired)
                  {
                     this._cacheHome.gondolaArticles.push(article);
                  }
               }
            }
            if(params.content.hightlight_carousel)
            {
               for each(data in params.content.hightlight_carousel.hightlights)
               {
                  this._cacheHome.highlightCarousel.push(new DofusShopHighlight(data));
               }
            }
            if(params.content.hightlight_image)
            {
               for each(data in params.content.hightlight_image.hightlights)
               {
                  this._cacheHome.highlightImages.push(new DofusShopHighlight(data));
               }
            }
            KernelEventsManager.getInstance().processCallback(ExternalGameHookList.DofusShopHome,this._cacheHome.categories,this._cacheHome.gondolaArticles,this._cacheHome.gondolaHeads,this._cacheHome.highlightCarousel,this._cacheHome.highlightImages);
         }
         else
         {
            this.processCallError(params);
         }
      }
      
      private function onArticlesList(success:Boolean, params:*, request:*) : void
      {
         var articles:Array = null;
         var totalPages:int = 0;
         var articleData:Object = null;
         var article:DofusShopArticle = null;
         if(!this._cacheArticles)
         {
            return;
         }
         _log.debug("onArticlesList - " + success);
         if(success)
         {
            articles = new Array();
            totalPages = Math.ceil(params.count / DofusShopEnum.MAX_ARTICLES_PER_PAGE);
            for each(articleData in params.articles)
            {
               article = new DofusShopArticle(articleData);
               if(!article.hasExpired)
               {
                  articles.push(article);
               }
            }
            KernelEventsManager.getInstance().processCallback(ExternalGameHookList.DofusShopArticlesList,articles,totalPages);
            this._cacheArticles[request.params[2]][request.params[3]] = {
               "articles":articles,
               "totalPages":totalPages
            };
            this.checkPreviousAndNextArticlePages(request.params[2],request.params[3],totalPages);
         }
         else
         {
            this.processCallError(params);
         }
      }
      
      private function onPreloadArticlesList(success:Boolean, params:*, request:*) : void
      {
         var articles:Array = null;
         var totalPages:int = 0;
         var articleData:Object = null;
         var article:DofusShopArticle = null;
         if(!this._cacheArticles)
         {
            return;
         }
         _log.debug("onPreloadArticlesList - " + success);
         if(success)
         {
            if(!this._cacheArticles)
            {
               return;
            }
            articles = new Array();
            totalPages = Math.ceil(params.count / DofusShopEnum.MAX_ARTICLES_PER_PAGE);
            for each(articleData in params.articles)
            {
               article = new DofusShopArticle(articleData);
               if(!article.hasExpired)
               {
                  articles.push(article);
               }
            }
            this._cacheArticles[request.params[2]][request.params[3]] = {
               "articles":articles,
               "totalPages":totalPages
            };
         }
      }
      
      private function onSearchArticles(success:Boolean, params:*, request:*) : void
      {
         var articles:Array = null;
         var totalPages:int = 0;
         var articleData:Object = null;
         var article:DofusShopArticle = null;
         if(!this._cacheArticles)
         {
            return;
         }
         _log.debug("onSearchArticles - " + success);
         if(success)
         {
            articles = new Array();
            totalPages = Math.ceil(params.count / DofusShopEnum.MAX_ARTICLES_PER_PAGE);
            for each(articleData in params.articles)
            {
               article = new DofusShopArticle(articleData);
               if(!article.hasExpired)
               {
                  articles.push(article);
               }
            }
            KernelEventsManager.getInstance().processCallback(ExternalGameHookList.DofusShopArticlesList,articles,totalPages);
         }
         else
         {
            this.processCallError(params);
         }
      }
      
      private function onBuyArticle(success:Boolean, params:*, request:*) : void
      {
         _log.debug("onBuyArticle - " + success);
         if(success)
         {
            if(params.result)
            {
               if(params.orderstatus == ORDER_PROCESSED)
               {
                  KernelEventsManager.getInstance().processCallback(ExternalGameHookList.DofusShopSuccessfulPurchase,this._currentPurchaseId);
                  KernelEventsManager.getInstance().processCallback(ExternalGameHookList.DofusShopMoney,params.ogrins,params.krozs);
               }
            }
            else if(params.error == "STEAM_NOT_TRUSTED_USER")
            {
               KernelEventsManager.getInstance().processCallback(ExternalGameHookList.DofusShopError,DofusShopEnum.ERROR_STEAM_NOT_TRUSTED_USER);
            }
            else
            {
               KernelEventsManager.getInstance().processCallback(ExternalGameHookList.DofusShopError,params.error);
            }
         }
         else if(params is ErrorEvent && params.type == IOErrorEvent.NETWORK_ERROR)
         {
            KernelEventsManager.getInstance().processCallback(ExternalGameHookList.DofusShopError,DofusShopEnum.ERROR_PURCHASE_REQUEST_TIMED_OUT);
         }
         else
         {
            this.processCallError(params);
         }
         this._currentPurchaseId = 0;
      }
      
      private function onSteamPurchaseConfirm(success:Boolean, params:*, request:*) : void
      {
         if(success)
         {
            if(params.orderstatus == "CANCELED")
            {
               KernelEventsManager.getInstance().processCallback(ExternalGameHookList.DofusShopError,DofusShopEnum.ERROR_PURCHASE_CANCELED);
            }
            else
            {
               KernelEventsManager.getInstance().processCallback(ExternalGameHookList.DofusShopSuccessfulPurchase,this._currentPurchaseId);
               SteamManager.getInstance().sendRedShellEvent("item_purchased");
               this.getMoney();
            }
         }
      }
      
      private function onClose(event:UiUnloadEvent) : void
      {
         var list:Array = null;
         var data:DofusShopObject = null;
         var page:Object = null;
         if(event.name == "webBase" && this._cacheHome)
         {
            Berilia.getInstance().removeEventListener(UiUnloadEvent.UNLOAD_UI_COMPLETE,this.onClose);
            for each(list in this._cacheHome)
            {
               for each(data in list)
               {
                  data.free();
               }
               list = null;
            }
            this._cacheHome = null;
            for each(list in this._cacheArticles)
            {
               for each(page in list)
               {
                  for each(data in page.articles)
                  {
                     data.free();
                  }
                  page = null;
               }
               list = null;
            }
            this._cacheArticles = null;
         }
      }
      
      private function checkPreviousAndNextArticlePages(category:int, page:int, totalPages:int) : void
      {
         if(page > 1 && !this._cacheArticles[category][page - 1])
         {
            RpcServiceCenter.getInstance().makeRpcCall(this._serviceBaseUrl + "shop." + this._serviceType,this._serviceType,this._serviceVersion,"ArticlesList",[this._currentShopKey,this._currentLocale,category,page - 1,DofusShopEnum.MAX_ARTICLES_PER_PAGE],this.onPreloadArticlesList);
         }
         if(page < totalPages && !this._cacheArticles[category][page + 1])
         {
            RpcServiceCenter.getInstance().makeRpcCall(this._serviceBaseUrl + "shop." + this._serviceType,this._serviceType,this._serviceVersion,"ArticlesList",[this._currentShopKey,this._currentLocale,category,page + 1,DofusShopEnum.MAX_ARTICLES_PER_PAGE],this.onPreloadArticlesList);
         }
      }
      
      private function processCallError(error:*) : void
      {
         _log.error(error);
         if(error is ErrorEvent && error.type == IOErrorEvent.NETWORK_ERROR)
         {
            KernelEventsManager.getInstance().processCallback(ExternalGameHookList.DofusShopError,DofusShopEnum.ERROR_REQUEST_TIMED_OUT);
         }
         else
         {
            KernelEventsManager.getInstance().processCallback(ChatHookList.TextInformation,I18n.getUiText("ui.shop.errorApi"),ChatFrame.RED_CHANNEL_ID,TimeManager.getInstance().getTimestamp());
         }
      }
   }
}
