package com.ankamagames.dofus.misc.lists
{
   import com.ankamagames.berilia.types.data.Hook;
   
   public class CraftHookList
   {
      
      public static const DoNothing:Hook = new Hook("DoNothing",false);
      
      public static const ExchangeStartOkMultiCraft:Hook = new Hook("ExchangeStartOkMultiCraft",false);
      
      public static const ExchangeStartOkCraft:Hook = new Hook("ExchangeStartOkCraft",false);
      
      public static const ExchangeCraftResult:Hook = new Hook("ExchangeCraftResult",false);
      
      public static const PlayerListUpdate:Hook = new Hook("PlayerListUpdate",false);
      
      public static const OtherPlayerListUpdate:Hook = new Hook("OtherPlayerListUpdate",false);
      
      public static const PaymentCraftList:Hook = new Hook("PaymentCraftList",false);
      
      public static const BagItemAdded:Hook = new Hook("BagItemAdded",false);
      
      public static const BagItemModified:Hook = new Hook("BagItemModified",false);
      
      public static const BagItemDeleted:Hook = new Hook("BagItemDeleted",false);
      
      public static const ExchangeItemAutoCraftStoped:Hook = new Hook("ExchangeItemAutoCraftStoped",false);
      
      public static const ExchangeMultiCraftCrafterCanUseHisRessources:Hook = new Hook("ExchangeMultiCraftCrafterCanUseHisRessources",false);
      
      public static const ExchangeMultiCraftRequest:Hook = new Hook("ExchangeMultiCraftRequest",false);
      
      public static const ExchangeReplayCountModified:Hook = new Hook("ExchangeReplayCountModified",false);
      
      public static const RecipeSelected:Hook = new Hook("RecipeSelected",false);
      
      public static const RecipesListRefreshed:Hook = new Hook("RecipesListRefreshed",false);
      
      public static const JobLevelUp:Hook = new Hook("JobLevelUp",false);
      
      public static const JobsExpUpdated:Hook = new Hook("JobsExpUpdated",false);
      
      public static const JobsExpOtherPlayerUpdated:Hook = new Hook("JobsExpOtherPlayerUpdated",false);
      
      public static const ExchangeStartOkJobIndex:Hook = new Hook("ExchangeStartOkJobIndex",false);
      
      public static const CrafterDirectoryListUpdate:Hook = new Hook("CrafterDirectoryListUpdate",false);
      
      public static const CrafterDirectorySettings:Hook = new Hook("CrafterDirectorySettings",false);
      
      public static const JobCrafterContactLook:Hook = new Hook("JobCrafterContactLook",false);
      
      public static const JobAllowMultiCraftRequest:Hook = new Hook("JobAllowMultiCraftRequest",false);
      
      public static const ExchangeStartOkRunesTrade:Hook = new Hook("ExchangeStartOkRunesTrade",false);
      
      public static const ExchangeStartOkRecycleTrade:Hook = new Hook("ExchangeStartOkRecycleTrade",false);
      
      public static const ItemMagedResult:Hook = new Hook("ItemMagedResult",false);
      
      public static const DecraftResult:Hook = new Hook("DecraftResult",false);
      
      public static const RecycleResult:Hook = new Hook("RecycleResult",false);
      
      public static const JobSelected:Hook = new Hook("JobSelected",false);
      
      public static const JobBookSubscription:Hook = new Hook("JobBookSubscription",false);
       
      
      public function CraftHookList()
      {
         super();
      }
   }
}
