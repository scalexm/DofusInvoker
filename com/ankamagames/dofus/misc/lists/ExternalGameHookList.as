package com.ankamagames.dofus.misc.lists
{
   import com.ankamagames.berilia.types.data.Hook;
   
   public class ExternalGameHookList
   {
      
      public static const HaapiAuthError:Hook = new Hook("HaapiAuthError",false);
      
      public static const HaapiAuthToken:Hook = new Hook("HaapiAuthToken",false);
      
      public static const DofusShopMoney:Hook = new Hook("DofusShopMoney",false);
      
      public static const DofusShopHome:Hook = new Hook("DofusShopHome",false);
      
      public static const DofusShopArticlesList:Hook = new Hook("DofusShopArticlesList",false);
      
      public static const DofusShopCurrentSelectedArticle:Hook = new Hook("DofusShopCurrentSelectedArticle",false);
      
      public static const DofusShopBuySelectedArticleAction:Hook = new Hook("DofusShopBuySelectedArticleAction",false);
      
      public static const DofusShopSuccessfulPurchase:Hook = new Hook("DofusShopSuccessfulPurchase",false);
      
      public static const DofusShopError:Hook = new Hook("DofusShopError",false);
      
      public static const OpenWebService:Hook = new Hook("OpenWebService",false);
      
      public static const OpenSharePopup:Hook = new Hook("OpenSharePopup",false);
      
      public static const ComicsLibraryLoaded:Hook = new Hook("ComicsLibraryLoaded",false);
      
      public static const ComicLoaded:Hook = new Hook("ComicLoaded",false);
      
      public static const OpenComic:Hook = new Hook("OpenComic",false);
       
      
      public function ExternalGameHookList()
      {
         super();
      }
   }
}
