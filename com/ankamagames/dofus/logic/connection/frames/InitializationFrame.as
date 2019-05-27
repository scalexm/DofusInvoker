package com.ankamagames.dofus.logic.connection.frames
{
   import com.ankama.zaap.ErrorCode;
   import com.ankamagames.berilia.Berilia;
   import com.ankamagames.berilia.api.ApiBinder;
   import com.ankamagames.berilia.api.UiApi;
   import com.ankamagames.berilia.components.Input;
   import com.ankamagames.berilia.factories.HyperlinkFactory;
   import com.ankamagames.berilia.factories.MenusFactory;
   import com.ankamagames.berilia.factories.TooltipsFactory;
   import com.ankamagames.berilia.managers.EmbedFontManager;
   import com.ankamagames.berilia.managers.KernelEventsManager;
   import com.ankamagames.berilia.managers.ThemeManager;
   import com.ankamagames.berilia.managers.UiModuleManager;
   import com.ankamagames.berilia.managers.UiRenderManager;
   import com.ankamagames.berilia.types.data.TextTooltipInfo;
   import com.ankamagames.berilia.types.event.UiRenderEvent;
   import com.ankamagames.berilia.types.messages.AllModulesLoadedMessage;
   import com.ankamagames.berilia.types.messages.AllUiXmlParsedMessage;
   import com.ankamagames.berilia.types.messages.ModuleExecErrorMessage;
   import com.ankamagames.berilia.types.messages.ModuleLoadedMessage;
   import com.ankamagames.berilia.types.messages.ModuleRessourceLoadFailedMessage;
   import com.ankamagames.berilia.types.messages.NoThemeErrorMessage;
   import com.ankamagames.berilia.types.messages.ThemeLoadErrorMessage;
   import com.ankamagames.berilia.types.messages.ThemeLoadedMessage;
   import com.ankamagames.berilia.utils.errors.BeriliaError;
   import com.ankamagames.dofus.BuildInfos;
   import com.ankamagames.dofus.Constants;
   import com.ankamagames.dofus.datacenter.appearance.SkinMapping;
   import com.ankamagames.dofus.datacenter.externalnotifications.ExternalNotification;
   import com.ankamagames.dofus.datacenter.misc.CensoredContent;
   import com.ankamagames.dofus.datacenter.spells.SpellPair;
   import com.ankamagames.dofus.externalnotification.ExternalNotificationRequest;
   import com.ankamagames.dofus.externalnotification.ExternalNotificationWindow;
   import com.ankamagames.dofus.externalnotification.enums.ExternalNotificationTypeEnum;
   import com.ankamagames.dofus.internalDatacenter.communication.ChatBubble;
   import com.ankamagames.dofus.internalDatacenter.communication.CraftSmileyItem;
   import com.ankamagames.dofus.internalDatacenter.communication.DelayedActionItem;
   import com.ankamagames.dofus.internalDatacenter.communication.SmileyWrapper;
   import com.ankamagames.dofus.internalDatacenter.communication.ThinkBubble;
   import com.ankamagames.dofus.internalDatacenter.fight.ChallengeWrapper;
   import com.ankamagames.dofus.internalDatacenter.guild.PaddockWrapper;
   import com.ankamagames.dofus.internalDatacenter.house.HouseWrapper;
   import com.ankamagames.dofus.internalDatacenter.items.ItemWrapper;
   import com.ankamagames.dofus.internalDatacenter.items.MountWrapper;
   import com.ankamagames.dofus.internalDatacenter.items.QuantifiedItemWrapper;
   import com.ankamagames.dofus.internalDatacenter.items.WeaponWrapper;
   import com.ankamagames.dofus.internalDatacenter.people.PartyCompanionWrapper;
   import com.ankamagames.dofus.internalDatacenter.spells.EffectsListWrapper;
   import com.ankamagames.dofus.internalDatacenter.spells.EffectsWrapper;
   import com.ankamagames.dofus.internalDatacenter.spells.SpellWrapper;
   import com.ankamagames.dofus.internalDatacenter.tutorial.SubhintWrapper;
   import com.ankamagames.dofus.kernel.Kernel;
   import com.ankamagames.dofus.kernel.PanicMessages;
   import com.ankamagames.dofus.kernel.sound.SoundManager;
   import com.ankamagames.dofus.kernel.updaterv2.IUpdaterMessageHandler;
   import com.ankamagames.dofus.kernel.updaterv2.UpdaterApi;
   import com.ankamagames.dofus.kernel.updaterv2.UpdaterConnexionHelper;
   import com.ankamagames.dofus.kernel.updaterv2.messages.IUpdaterInputMessage;
   import com.ankamagames.dofus.kernel.updaterv2.messages.impl.LanguageMessage;
   import com.ankamagames.dofus.kernel.updaterv2.messages.impl.ZaapSettingMessage;
   import com.ankamagames.dofus.logic.common.frames.QueueFrame;
   import com.ankamagames.dofus.logic.common.managers.DofusFpsManager;
   import com.ankamagames.dofus.logic.common.managers.HyperlinkBreachManager;
   import com.ankamagames.dofus.logic.common.managers.HyperlinkDisplayArrowManager;
   import com.ankamagames.dofus.logic.common.managers.HyperlinkFightResultManager;
   import com.ankamagames.dofus.logic.common.managers.HyperlinkItemManager;
   import com.ankamagames.dofus.logic.common.managers.HyperlinkMapPosition;
   import com.ankamagames.dofus.logic.common.managers.HyperlinkOpenBook;
   import com.ankamagames.dofus.logic.common.managers.HyperlinkOptionManager;
   import com.ankamagames.dofus.logic.common.managers.HyperlinkScreenshot;
   import com.ankamagames.dofus.logic.common.managers.HyperlinkShowAccountMenuManager;
   import com.ankamagames.dofus.logic.common.managers.HyperlinkShowAchievementManager;
   import com.ankamagames.dofus.logic.common.managers.HyperlinkShowAllianceManager;
   import com.ankamagames.dofus.logic.common.managers.HyperlinkShowCellManager;
   import com.ankamagames.dofus.logic.common.managers.HyperlinkShowDareChatManager;
   import com.ankamagames.dofus.logic.common.managers.HyperlinkShowEntityManager;
   import com.ankamagames.dofus.logic.common.managers.HyperlinkShowEstate;
   import com.ankamagames.dofus.logic.common.managers.HyperlinkShowGuildManager;
   import com.ankamagames.dofus.logic.common.managers.HyperlinkShowMonsterChatManager;
   import com.ankamagames.dofus.logic.common.managers.HyperlinkShowMonsterFightManager;
   import com.ankamagames.dofus.logic.common.managers.HyperlinkShowMonsterGroup;
   import com.ankamagames.dofus.logic.common.managers.HyperlinkShowMonsterManager;
   import com.ankamagames.dofus.logic.common.managers.HyperlinkShowNpcManager;
   import com.ankamagames.dofus.logic.common.managers.HyperlinkShowOfflineSales;
   import com.ankamagames.dofus.logic.common.managers.HyperlinkShowOrnamentManager;
   import com.ankamagames.dofus.logic.common.managers.HyperlinkShowPlayerMenuManager;
   import com.ankamagames.dofus.logic.common.managers.HyperlinkShowQuestManager;
   import com.ankamagames.dofus.logic.common.managers.HyperlinkShowRecipeManager;
   import com.ankamagames.dofus.logic.common.managers.HyperlinkShowSubArea;
   import com.ankamagames.dofus.logic.common.managers.HyperlinkShowTitleManager;
   import com.ankamagames.dofus.logic.common.managers.HyperlinkSocialManager;
   import com.ankamagames.dofus.logic.common.managers.HyperlinkSpellManager;
   import com.ankamagames.dofus.logic.common.managers.HyperlinkSubstitutionManager;
   import com.ankamagames.dofus.logic.common.managers.HyperlinkSwapPositionRequest;
   import com.ankamagames.dofus.logic.common.managers.HyperlinkSystem;
   import com.ankamagames.dofus.logic.common.managers.HyperlinkTaxCollectorCollected;
   import com.ankamagames.dofus.logic.common.managers.HyperlinkTaxCollectorPosition;
   import com.ankamagames.dofus.logic.common.managers.HyperlinkURLManager;
   import com.ankamagames.dofus.logic.connection.managers.StoreUserDataManager;
   import com.ankamagames.dofus.logic.game.fight.frames.FightBattleFrame;
   import com.ankamagames.dofus.logic.game.roleplay.types.CharacterTooltipInformation;
   import com.ankamagames.dofus.logic.game.roleplay.types.GameContextPaddockItemInformations;
   import com.ankamagames.dofus.logic.game.roleplay.types.GroundObject;
   import com.ankamagames.dofus.logic.game.roleplay.types.MutantTooltipInformation;
   import com.ankamagames.dofus.logic.game.roleplay.types.PortalTooltipInformation;
   import com.ankamagames.dofus.logic.game.roleplay.types.PrismTooltipInformation;
   import com.ankamagames.dofus.logic.game.roleplay.types.TaxCollectorTooltipInformation;
   import com.ankamagames.dofus.misc.lists.AlignmentHookList;
   import com.ankamagames.dofus.misc.lists.ApiActionList;
   import com.ankamagames.dofus.misc.lists.ApiBreachActionList;
   import com.ankamagames.dofus.misc.lists.ApiChatActionList;
   import com.ankamagames.dofus.misc.lists.ApiCraftActionList;
   import com.ankamagames.dofus.misc.lists.ApiExchangeActionList;
   import com.ankamagames.dofus.misc.lists.ApiLivingObjectActionList;
   import com.ankamagames.dofus.misc.lists.ApiMountActionList;
   import com.ankamagames.dofus.misc.lists.ApiRolePlayActionList;
   import com.ankamagames.dofus.misc.lists.ApiSocialActionList;
   import com.ankamagames.dofus.misc.lists.BreachHookList;
   import com.ankamagames.dofus.misc.lists.ChatHookList;
   import com.ankamagames.dofus.misc.lists.CraftHookList;
   import com.ankamagames.dofus.misc.lists.CustomUiHookList;
   import com.ankamagames.dofus.misc.lists.ExchangeHookList;
   import com.ankamagames.dofus.misc.lists.ExternalGameHookList;
   import com.ankamagames.dofus.misc.lists.FightHookList;
   import com.ankamagames.dofus.misc.lists.HookList;
   import com.ankamagames.dofus.misc.lists.InventoryHookList;
   import com.ankamagames.dofus.misc.lists.LivingObjectHookList;
   import com.ankamagames.dofus.misc.lists.MountHookList;
   import com.ankamagames.dofus.misc.lists.PrismHookList;
   import com.ankamagames.dofus.misc.lists.QuestHookList;
   import com.ankamagames.dofus.misc.lists.RoleplayHookList;
   import com.ankamagames.dofus.misc.lists.SocialHookList;
   import com.ankamagames.dofus.misc.lists.TriggerHookList;
   import com.ankamagames.dofus.misc.utils.CustomLoadingScreenManager;
   import com.ankamagames.dofus.misc.utils.LoadingScreen;
   import com.ankamagames.dofus.misc.utils.SubhintInspector;
   import com.ankamagames.dofus.network.enums.BuildTypeEnum;
   import com.ankamagames.dofus.network.types.game.context.GameRolePlayTaxCollectorInformations;
   import com.ankamagames.dofus.network.types.game.context.fight.GameFightCharacterInformations;
   import com.ankamagames.dofus.network.types.game.context.fight.GameFightEntityInformation;
   import com.ankamagames.dofus.network.types.game.context.fight.GameFightFighterInformations;
   import com.ankamagames.dofus.network.types.game.context.fight.GameFightMonsterInformations;
   import com.ankamagames.dofus.network.types.game.context.fight.GameFightTaxCollectorInformations;
   import com.ankamagames.dofus.network.types.game.context.roleplay.GameRolePlayCharacterInformations;
   import com.ankamagames.dofus.network.types.game.context.roleplay.GameRolePlayGroupMonsterInformations;
   import com.ankamagames.dofus.network.types.game.context.roleplay.GameRolePlayGroupMonsterWaveInformations;
   import com.ankamagames.dofus.network.types.game.context.roleplay.GameRolePlayMerchantInformations;
   import com.ankamagames.dofus.network.types.game.context.roleplay.GameRolePlayMountInformations;
   import com.ankamagames.dofus.network.types.game.context.roleplay.GameRolePlayMutantInformations;
   import com.ankamagames.dofus.network.types.game.context.roleplay.GameRolePlayNpcInformations;
   import com.ankamagames.dofus.network.types.game.context.roleplay.GameRolePlayNpcWithQuestInformations;
   import com.ankamagames.dofus.network.types.game.context.roleplay.GameRolePlayPortalInformations;
   import com.ankamagames.dofus.network.types.game.context.roleplay.GameRolePlayPrismInformations;
   import com.ankamagames.dofus.network.types.game.interactive.InteractiveElement;
   import com.ankamagames.dofus.types.data.SpellTooltipInfo;
   import com.ankamagames.dofus.types.data.WeaponTooltipInfo;
   import com.ankamagames.dofus.uiApi.AbstractItemFilterApi;
   import com.ankamagames.dofus.uiApi.AlignmentApi;
   import com.ankamagames.dofus.uiApi.AuctionHouseItemFilterApi;
   import com.ankamagames.dofus.uiApi.AveragePricesApi;
   import com.ankamagames.dofus.uiApi.BindsApi;
   import com.ankamagames.dofus.uiApi.BreachApi;
   import com.ankamagames.dofus.uiApi.CaptureApi;
   import com.ankamagames.dofus.uiApi.ChatApi;
   import com.ankamagames.dofus.uiApi.ColorApi;
   import com.ankamagames.dofus.uiApi.ConfigApi;
   import com.ankamagames.dofus.uiApi.ConnectionApi;
   import com.ankamagames.dofus.uiApi.ContextMenuApi;
   import com.ankamagames.dofus.uiApi.DataApi;
   import com.ankamagames.dofus.uiApi.DocumentApi;
   import com.ankamagames.dofus.uiApi.EncyclopediaItemFilterApi;
   import com.ankamagames.dofus.uiApi.ExchangeApi;
   import com.ankamagames.dofus.uiApi.ExternalNotificationApi;
   import com.ankamagames.dofus.uiApi.FightApi;
   import com.ankamagames.dofus.uiApi.FileApi;
   import com.ankamagames.dofus.uiApi.HighlightApi;
   import com.ankamagames.dofus.uiApi.InventoryApi;
   import com.ankamagames.dofus.uiApi.JobsApi;
   import com.ankamagames.dofus.uiApi.MapApi;
   import com.ankamagames.dofus.uiApi.MountApi;
   import com.ankamagames.dofus.uiApi.NotificationApi;
   import com.ankamagames.dofus.uiApi.PartyApi;
   import com.ankamagames.dofus.uiApi.PlayedCharacterApi;
   import com.ankamagames.dofus.uiApi.QuestApi;
   import com.ankamagames.dofus.uiApi.RoleplayApi;
   import com.ankamagames.dofus.uiApi.SecurityApi;
   import com.ankamagames.dofus.uiApi.SocialApi;
   import com.ankamagames.dofus.uiApi.SoundApi;
   import com.ankamagames.dofus.uiApi.StorageApi;
   import com.ankamagames.dofus.uiApi.SystemApi;
   import com.ankamagames.dofus.uiApi.TestApi;
   import com.ankamagames.dofus.uiApi.TimeApi;
   import com.ankamagames.dofus.uiApi.TooltipApi;
   import com.ankamagames.dofus.uiApi.UiTutoApi;
   import com.ankamagames.dofus.uiApi.UtilApi;
   import com.ankamagames.jerakine.data.CensoredContentManager;
   import com.ankamagames.jerakine.data.GameDataUpdater;
   import com.ankamagames.jerakine.data.I18n;
   import com.ankamagames.jerakine.data.I18nUpdater;
   import com.ankamagames.jerakine.data.XmlConfig;
   import com.ankamagames.jerakine.handlers.messages.mouse.MouseDoubleClickMessage;
   import com.ankamagames.jerakine.logger.Log;
   import com.ankamagames.jerakine.logger.LogLevel;
   import com.ankamagames.jerakine.logger.Logger;
   import com.ankamagames.jerakine.managers.FontManager;
   import com.ankamagames.jerakine.managers.LangManager;
   import com.ankamagames.jerakine.managers.OptionManager;
   import com.ankamagames.jerakine.managers.StoreDataManager;
   import com.ankamagames.jerakine.messages.Frame;
   import com.ankamagames.jerakine.messages.LangAllFilesLoadedMessage;
   import com.ankamagames.jerakine.messages.LangFileLoadedMessage;
   import com.ankamagames.jerakine.messages.Message;
   import com.ankamagames.jerakine.pools.GenericPool;
   import com.ankamagames.jerakine.types.CustomSharedObject;
   import com.ankamagames.jerakine.types.Uri;
   import com.ankamagames.jerakine.types.enums.Priority;
   import com.ankamagames.jerakine.types.events.FileEvent;
   import com.ankamagames.jerakine.types.events.LangFileEvent;
   import com.ankamagames.jerakine.types.events.PropertyChangeEvent;
   import com.ankamagames.jerakine.utils.crypto.FolderHashChecker;
   import com.ankamagames.jerakine.utils.display.FpsControler;
   import com.ankamagames.jerakine.utils.display.StageShareManager;
   import com.ankamagames.jerakine.utils.files.FileUtils;
   import com.ankamagames.jerakine.utils.misc.DescribeTypeCache;
   import com.ankamagames.jerakine.utils.system.CommandLineArguments;
   import com.ankamagames.jerakine.utils.system.SystemPopupUI;
   import com.ankamagames.performance.Benchmark;
   import com.ankamagames.tiphon.engine.SubstituteAnimationManager;
   import com.ankamagames.tiphon.engine.TiphonEventsManager;
   import com.ankamagames.tiphon.types.ScriptedAnimation;
   import com.ankamagames.tiphon.types.Skin;
   import com.ankamagames.tiphon.types.look.EntityLookObserver;
   import flash.display.BitmapData;
   import flash.display.LoaderInfo;
   import flash.display.NativeWindowInitOptions;
   import flash.display.NativeWindowSystemChrome;
   import flash.display.NativeWindowType;
   import flash.events.AsyncErrorEvent;
   import flash.events.ErrorEvent;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.events.NativeWindowDisplayStateEvent;
   import flash.events.TimerEvent;
   import flash.filesystem.File;
   import flash.geom.Transform;
   import flash.net.LocalConnection;
   import flash.system.Capabilities;
   import flash.utils.Dictionary;
   import flash.utils.Timer;
   import flash.utils.getQualifiedClassName;
   import flash.utils.getTimer;
   
   public class InitializationFrame implements Frame, IUpdaterMessageHandler
   {
      
      protected static const _log:Logger = Log.getLogger(getQualifiedClassName(InitializationFrame));
      
      private static var _fhct:FolderHashChecker;
       
      
      private var _aFiles:Array;
      
      private var _aLoadedFiles:Array;
      
      private var _aModuleInit:Array;
      
      private var _loadingScreen:LoadingScreen;
      
      private var _subConfigCount:uint;
      
      private var _percentPerModule:Number = 0;
      
      private var _modPercents:Array;
      
      private var _isSubLangConfig:Boolean;
      
      private var _isSubCustomConfig:Boolean;
      
      private var _isTemporaryCustomConfig:Boolean;
      
      private var _langRequested:Boolean = false;
      
      private var _langObtained:Boolean = false;
      
      private var _autoConnectTypeObtained:Boolean = false;
      
      private var _autoConnectTypeValue:int = -1;
      
      private var _skinChangePop:SystemPopupUI;
      
      private var _api:UpdaterApi;
      
      public function InitializationFrame()
      {
         this._modPercents = new Array();
         super();
      }
      
      public function get priority() : int
      {
         return Priority.NORMAL;
      }
      
      public function pushed() : Boolean
      {
         var foo:Boolean = false;
         this.initPerformancesWatcher();
         this.initStaticConstants();
         this.initModulesBindings();
         this.displayLoadingScreen();
         this._aModuleInit = new Array();
         this._aModuleInit["config"] = false;
         this._aModuleInit["colors"] = false;
         this._aModuleInit["langFiles"] = false;
         this._aModuleInit["font"] = false;
         this._aModuleInit["i18n"] = false;
         this._aModuleInit["gameData"] = false;
         this._aModuleInit["modules"] = false;
         this._aModuleInit["uiXmlParsing"] = false;
         this._aModuleInit["uiThemeCheck"] = false;
         for each(foo in this._aModuleInit)
         {
            this._percentPerModule++;
         }
         this._percentPerModule = 100 / this._percentPerModule;
         LangManager.getInstance().loadFile("config.xml");
         SubstituteAnimationManager.setDefaultAnimation("AnimStatique","AnimStatique");
         SubstituteAnimationManager.setDefaultAnimation("AnimTacle","AnimHit");
         SubstituteAnimationManager.setDefaultAnimation("AnimAttaque","AnimAttaque0");
         SubstituteAnimationManager.setDefaultAnimation("AnimArme","AnimArme0");
         SubstituteAnimationManager.setDefaultAnimation("AnimThrow","AnimStatique");
         this._api = new UpdaterApi(this);
         if(UpdaterConnexionHelper.hasZaapArguments())
         {
            this._api.getZaapSetting("autoConnectType");
         }
         else
         {
            this._autoConnectTypeObtained = true;
         }
         return true;
      }
      
      public function process(msg:Message) : Boolean
      {
         var langMsg:LangFileLoadedMessage = null;
         var langAllMsg:LangAllFilesLoadedMessage = null;
         var ankamaModule:Boolean = false;
         var mrlfm:ModuleRessourceLoadFailedMessage = null;
         var xmlPos:int = 0;
         var fileNamePos:int = 0;
         var catName:String = null;
         var newValues:Array = null;
         var key:String = null;
         var keyInfo:Array = null;
         var oldKey:String = null;
         var lastLang:String = null;
         var resetLang:Boolean = false;
         var overrideFile:Uri = null;
         var currentCommunity:String = null;
         switch(true)
         {
            case msg is LangFileLoadedMessage:
               langMsg = LangFileLoadedMessage(msg);
               if(!langMsg.success)
               {
                  if(langMsg.file.indexOf("i18n") > -1)
                  {
                     this._loadingScreen.log("Unabled to load i18n file " + langMsg.file,LoadingScreen.ERROR);
                     Kernel.panic(PanicMessages.I18N_LOADING_FAILED,[LangManager.getInstance().getEntry("config.lang.current")]);
                  }
                  else if(langMsg.file.indexOf("config.xml") > -1)
                  {
                     this._loadingScreen.log("Unabled to load main config file : " + langMsg.file,LoadingScreen.ERROR);
                     Kernel.panic(PanicMessages.CONFIG_LOADING_FAILED);
                  }
                  else if(langMsg.file.indexOf("config-") > -1)
                  {
                     this._loadingScreen.log("Unabled to load secondary config file : " + langMsg.file,LoadingScreen.INFO);
                     this._aModuleInit["config"] = true;
                     this.setModulePercent("config",100);
                  }
                  else
                  {
                     this._loadingScreen.log("Unabled to load  " + langMsg.file,LoadingScreen.ERROR);
                  }
               }
               if(this._loadingScreen)
               {
                  this._loadingScreen.log(langMsg.file + " loaded.",LoadingScreen.INFO);
               }
               return true;
            case msg is LangAllFilesLoadedMessage:
               langAllMsg = LangAllFilesLoadedMessage(msg);
               _log.debug("file : " + langAllMsg.file);
               switch(langAllMsg.file)
               {
                  case "file://config.xml":
                     if(!langAllMsg.success)
                     {
                        throw new BeriliaError("Impossible de charger " + langAllMsg.file);
                     }
                     if(Dofus.getInstance().forcedLang)
                     {
                        LangManager.getInstance().setEntry("config.lang.current",Dofus.getInstance().forcedLang);
                     }
                     if(UpdaterConnexionHelper.hasUpdaterArgument() || UpdaterConnexionHelper.hasZaapArguments() && !UpdaterApi.isDisconnected())
                     {
                        this._langRequested = true;
                        this._api.getLanguage();
                        break;
                     }
                     this._langObtained = true;
                     this.completeConfigInit();
                     break;
                  default:
                     if(langAllMsg.file.indexOf("colors.xml") != -1)
                     {
                        if(!langAllMsg.success)
                        {
                           throw new BeriliaError("Impossible de charger " + langAllMsg.file);
                        }
                        XmlConfig.getInstance().addCategory(LangManager.getInstance().getCategory("colors"));
                        this._aModuleInit["colors"] = true;
                        this.setModulePercent("colors",100);
                        this._loadingScreen.value = this._loadingScreen.value + this._percentPerModule;
                        break;
                     }
                     if(langAllMsg.file.indexOf("config-") != -1)
                     {
                        try
                        {
                           xmlPos = langAllMsg.file.lastIndexOf(".xml");
                           fileNamePos = langAllMsg.file.lastIndexOf("config-");
                           catName = langAllMsg.file.substring(fileNamePos,xmlPos);
                           newValues = LangManager.getInstance().getCategory(catName);
                           for(key in newValues)
                           {
                              keyInfo = key.split(".");
                              keyInfo[0] = "config";
                              oldKey = keyInfo.join(".");
                              XmlConfig.getInstance().setEntry(oldKey,newValues[key]);
                              LangManager.getInstance().setEntry(oldKey,newValues[key]);
                           }
                        }
                        catch(e:Error)
                        {
                           throw e;
                        }
                        this._subConfigCount--;
                        if(!this._subConfigCount)
                        {
                           this.setModulePercent("config",100);
                           this._aModuleInit["config"] = true;
                           this.initAfterLoadConfig();
                           this.checkInit();
                        }
                     }
                     else
                     {
                        this._aLoadedFiles.push(langAllMsg.file);
                     }
                     this._aModuleInit["langFiles"] = this._aLoadedFiles.length == this._aFiles.length && XmlConfig.getInstance().getEntry("config.data.path.i18n.list");
                     if(this._aModuleInit["langFiles"])
                     {
                        this.setModulePercent("langFiles",100);
                        this.initFonts();
                        I18nUpdater.getInstance().addEventListener(Event.COMPLETE,this.onI18nReady);
                        I18nUpdater.getInstance().addEventListener(FileEvent.ERROR,this.onDataFileError);
                        I18nUpdater.getInstance().addEventListener(LangFileEvent.COMPLETE,this.onI18nPartialDataReady);
                        GameDataUpdater.getInstance().addEventListener(Event.COMPLETE,this.onGameDataReady);
                        GameDataUpdater.getInstance().addEventListener(FileEvent.ERROR,this.onDataFileError);
                        GameDataUpdater.getInstance().addEventListener(LangFileEvent.COMPLETE,this.onGameDataPartialDataReady);
                        lastLang = StoreDataManager.getInstance().getData(Constants.DATASTORE_LANG_VERSION,"lastLang");
                        resetLang = lastLang != XmlConfig.getInstance().getEntry("config.lang.current");
                        if(resetLang)
                        {
                           UiRenderManager.getInstance().clearCache();
                        }
                        currentCommunity = XmlConfig.getInstance().getEntry("config.community.current");
                        if(currentCommunity && currentCommunity.charAt(0) != "!")
                        {
                           overrideFile = new Uri(XmlConfig.getInstance().getEntry("config.data.path.root") + "com/" + currentCommunity + ".xml");
                        }
                        I18nUpdater.getInstance().initI18n(XmlConfig.getInstance().getEntry("config.lang.current"),new Uri(XmlConfig.getInstance().getEntry("config.data.path.i18n.list")),resetLang,overrideFile);
                        GameDataUpdater.getInstance().init(new Uri(XmlConfig.getInstance().getEntry("config.data.path.common.list")));
                     }
                     this.checkInit();
                     break;
               }
               return true;
            case msg is AllModulesLoadedMessage:
               _log.warn("InitializationFrame AllModulesLoaded");
               this._aModuleInit["modules"] = true;
               this._loadingScreen.log("Launch main modules scripts",LoadingScreen.IMPORTANT);
               this.setModulePercent("modules",100);
               if(!_fhct && BuildInfos.BUILD_TYPE < BuildTypeEnum.INTERNAL)
               {
                  _fhct = new FolderHashChecker(new Uri(ThemeManager.getInstance().themesRoot.nativePath + "/" + ThemeManager.OFFICIAL_THEME_NAME + "/signature.xmls"),this.onFolderHashCheckInit);
                  _fhct.addEventListener(ErrorEvent.ERROR,function(err:ErrorEvent):void
                  {
                     _loadingScreen.log("Error with selected UI theme : " + err.text,LoadingScreen.ERROR);
                     _log.error("Error with selected UI theme : " + err.text);
                  });
               }
               else
               {
                  this._aModuleInit["uiThemeCheck"] = true;
                  this.setModulePercent("uiThemeCheck",100);
               }
               this.checkInit();
               return true;
            case msg is ModuleLoadedMessage:
               this.setModulePercent("modules",this._percentPerModule / UiModuleManager.getInstance().moduleCount,true);
               ankamaModule = UiModuleManager.getInstance().getModule(ModuleLoadedMessage(msg).moduleName).trusted;
               this._loadingScreen.log(ModuleLoadedMessage(msg).moduleName + " script loaded " + (!!ankamaModule?"":"UNTRUSTED module"),!!ankamaModule?uint(LoadingScreen.IMPORTANT):uint(LoadingScreen.WARNING));
               return true;
            case msg is AllUiXmlParsedMessage:
               this._aModuleInit["uiXmlParsing"] = true;
               this.setModulePercent("uiXmlParsing",100);
               this.checkInit();
               return true;
            case msg is ModuleExecErrorMessage:
               this._loadingScreen.log("Error while executing " + ModuleExecErrorMessage(msg).moduleName + "\'s main script :\n" + ModuleExecErrorMessage(msg).stackTrace,LoadingScreen.ERROR);
               return true;
            case msg is ModuleRessourceLoadFailedMessage:
               mrlfm = msg as ModuleRessourceLoadFailedMessage;
               this._loadingScreen.log("Module " + mrlfm.moduleName + " : Cannot load " + mrlfm.uri,!!mrlfm.isImportant?uint(LoadingScreen.ERROR):uint(LoadingScreen.WARNING));
               return true;
            case msg is ThemeLoadedMessage:
               this._loadingScreen.log("Theme \"" + ThemeLoadedMessage(msg).themeName + "\" loaded",LoadingScreen.IMPORTANT);
               return true;
            case msg is ThemeLoadErrorMessage:
               this._loadingScreen.log(ThemeLoadErrorMessage(msg).themeName + " theme load failed : " + ThemeLoadErrorMessage(msg).themeName + ".dt cannot be found. If this file exists, maybe it contains an error.",LoadingScreen.ERROR);
               return true;
            case msg is NoThemeErrorMessage:
               this._loadingScreen.log(I18n.getUiText("ui.popup.noTheme"),LoadingScreen.ERROR);
               return true;
            default:
               return false;
         }
      }
      
      public function handleMessage(msg:IUpdaterInputMessage) : void
      {
         var lm:LanguageMessage = null;
         var zsm:ZaapSettingMessage = null;
         switch(true)
         {
            case msg is LanguageMessage:
               lm = msg as LanguageMessage;
               if(ErrorCode.VALID_VALUES.contains(lm.error))
               {
                  _log.error("Error getting language : " + ErrorCode.VALUES_TO_NAMES[lm.error]);
               }
               else if(lm.getLanguage())
               {
                  LangManager.getInstance().setEntry("config.lang.current",lm.getLanguage());
               }
               this._langObtained = true;
               this.completeConfigInit();
               break;
            case msg is ZaapSettingMessage:
               zsm = msg as ZaapSettingMessage;
               if(zsm.name == "autoConnectType")
               {
                  if(ErrorCode.VALID_VALUES.contains(zsm.error))
                  {
                     _log.error("Error getting Zaap setting " + zsm.name + " : " + ErrorCode.VALUES_TO_NAMES[zsm.error]);
                  }
                  else if(zsm.value)
                  {
                     this._autoConnectTypeValue = int(zsm.value);
                  }
                  this._autoConnectTypeObtained = true;
                  this.completeConfigInit();
                  break;
               }
         }
      }
      
      private function completeConfigInit() : void
      {
         if(!this._autoConnectTypeObtained || !this._langObtained)
         {
            return;
         }
         this._aFiles = new Array();
         this._aLoadedFiles = new Array();
         this._langRequested = false;
         var subLangConfigFile:String = "config-" + LangManager.getInstance().getEntry("config.lang.current") + ".xml";
         var subCustomConfigFile:String = "config-custom.xml";
         var tempSubCustomConfigFile:String = "temp-config-custom.xml";
         this._isSubLangConfig = File.applicationDirectory.resolvePath(subLangConfigFile).exists;
         this._isSubCustomConfig = File.applicationDirectory.resolvePath(subCustomConfigFile).exists;
         this._isTemporaryCustomConfig = File.applicationDirectory.resolvePath(tempSubCustomConfigFile).exists;
         this._subConfigCount = 0;
         _log.debug("checking if their is any custom config file");
         if(this._isSubLangConfig || this._isSubCustomConfig || this._isTemporaryCustomConfig)
         {
            _log.debug("their is some custome config files");
            if(this._isSubLangConfig)
            {
               LangManager.getInstance().loadFile(subLangConfigFile);
               this._subConfigCount++;
            }
            if(this._isSubCustomConfig)
            {
               LangManager.getInstance().loadFile(subCustomConfigFile);
               this._subConfigCount++;
            }
            else if(this._isTemporaryCustomConfig)
            {
               _log.debug("using temporary custom config file");
               LangManager.getInstance().loadFile(tempSubCustomConfigFile);
               this._subConfigCount++;
            }
            this.setModulePercent("config",50);
         }
         else
         {
            this._aModuleInit["config"] = true;
            this.setModulePercent("config",100);
            this.initAfterLoadConfig();
         }
      }
      
      public function handleConnectionOpened() : void
      {
      }
      
      public function handleConnectionClosed() : void
      {
         this._autoConnectTypeObtained = true;
         this._langObtained = true;
         if(this._langRequested)
         {
            this.completeConfigInit();
         }
      }
      
      public function pulled() : Boolean
      {
         if(this._skinChangePop)
         {
            this._skinChangePop.destroy();
            this._skinChangePop = null;
         }
         this._loadingScreen.parent.removeChild(this._loadingScreen);
         this._loadingScreen = null;
         if(!StageShareManager.stage.nativeWindow.closed)
         {
            StageShareManager.stage.nativeWindow.visible = true;
         }
         if(this._api)
         {
            this._api.detach(this);
            this._api = null;
         }
         StageShareManager.testQuality();
         EmbedFontManager.getInstance().removeEventListener(Event.COMPLETE,this.onFontsManagerInit);
         I18nUpdater.getInstance().removeEventListener(Event.COMPLETE,this.onI18nReady);
         I18nUpdater.getInstance().removeEventListener(LangFileEvent.COMPLETE,this.onI18nPartialDataReady);
         GameDataUpdater.getInstance().removeEventListener(Event.COMPLETE,this.onGameDataReady);
         GameDataUpdater.getInstance().removeEventListener(LangFileEvent.COMPLETE,this.onGameDataPartialDataReady);
         Berilia.getInstance().removeEventListener(UiRenderEvent.UIRenderComplete,this.onUiLoaded);
         return true;
      }
      
      public function updateLoadingScreenSize() : void
      {
         this._loadingScreen.refreshSize();
      }
      
      private function onFolderHashCheckInit() : void
      {
         _log.debug("onFolderHashCheckInit");
         this._aModuleInit["uiThemeCheck"] = true;
         this.setModulePercent("uiThemeCheck",100);
         this.checkInit();
      }
      
      private function initAfterLoadConfig() : void
      {
         Kernel.getInstance().postInit();
         if(this._autoConnectTypeValue != -1)
         {
            Dofus.getInstance().options.autoConnectType = this._autoConnectTypeValue;
         }
         this._aFiles.push(LangManager.getInstance().getEntry("config.ui.asset.fontsList"));
         for(var i:uint = 0; i < this._aFiles.length; i++)
         {
            FontManager.getInstance().loadFile(this._aFiles[i]);
         }
         this._loadingScreen.value = this._loadingScreen.value + this._percentPerModule;
         KernelEventsManager.getInstance().processCallback(HookList.ConfigStart);
         this.initTubul();
         Berilia.getInstance().addUIListener(SoundManager.getInstance().manager);
         TiphonEventsManager.addListener(SoundManager.getInstance().manager,"Sound");
         TiphonEventsManager.addListener(SoundManager.getInstance().manager,"DataSound");
         this.initTheme();
         if(!CommandLineArguments.getInstance().hasArgument("functional-test"))
         {
            CustomLoadingScreenManager.getInstance().loadCustomScreenList(StoreDataManager.getInstance().getData(Constants.DATASTORE_COMPUTER_OPTIONS,"lastNickname"));
         }
      }
      
      private function initTheme() : void
      {
         var currentLang:String = null;
         var titleText:String = null;
         var contentText:String = null;
         var btnText:String = null;
         var customthemesPath:String = CustomSharedObject.getCustomSharedObjectDirectory() + File.separator + "ui" + File.separator + "themes" + File.separator;
         var officialthemesPath:String = File.applicationDirectory.nativePath + File.separator + LangManager.getInstance().getEntry("config.ui.common.themes").replace("file://","");
         ThemeManager.getInstance().init(officialthemesPath,customthemesPath,BuildInfos.BUILD_TYPE == BuildTypeEnum.RELEASE);
         ThemeManager.getInstance().applyTheme(OptionManager.getOptionManager("dofus").currentUiSkin);
         if(OptionManager.getOptionManager("dofus").currentUiSkin != ThemeManager.OFFICIAL_THEME_NAME)
         {
            currentLang = XmlConfig.getInstance().getEntry("config.lang.current");
            switch(currentLang)
            {
               case "fr":
                  titleText = "Thème d\'interface personnalisé";
                  contentText = "Vous n\'utilisez pas le thème d\'interface officiel. Utiliser un thème non mis à jour peut entrainer des soucis d\'affichage voire la disparition de certaines interfaces. Si vous rencontrez un problème, rétablissez le thème par défaut et contacter le créateur de votre thème d\'interface.";
                  btnText = "Rétablir le thème par défaut";
                  break;
               case "es":
                  titleText = "Tema de interfaz personalizado";
                  contentText = "No estás utilizando el tema de interfaz oficial. Utilizar un tema no actualizado, puede conllevar problemas de visualización o incluso la desaparición de ciertas interfaces. Si encuentras algún problema, restablece el tema por defecto y ponte en contacto con el creador de tu tema de interfaz.";
                  btnText = "Restablecer el tema predeterminado";
                  break;
               case "de":
                  titleText = "Benutzerdefiniertes Design für die Benutzeroberfläche";
                  contentText = "Ihr verwendet nicht das offizielle Design für die Benutzeroberfläche. Die Benutzung eines veralteten Designs kann zu Darstellungsproblemen bis hin zum Absturz der Benutzeroberfläche führen. Sollten bei euch Probleme auftreten, setzt das Design auf das Standarddesign zurück und wendet euch an den Hersteller eures Designs.";
                  btnText = "Standarddesign wiederherstellen";
                  break;
               case "it":
                  titleText = "Tema di interfaccia personalizzato";
                  contentText = "Non stai utilizzando il tema ufficiale per le interfacce. Utilizzare un tema non aggiornato può causare dei problemi di visualizzazione o persino la sparizione di alcune interfacce. Se riscontri un problema, ripristina il tema di base e contatta il creatore del tuo tema.";
                  btnText = "Ripristina il tema di base";
                  break;
               case "pt":
                  titleText = "Tema de interface personalizado";
                  contentText = "Você não está usando o tema de interface oficial. A utilização de um tema desatualizado pode ocasionar problemas na exibição e até mesmo o desaparecimento de algumas interfaces. Caso encontre um problema, restabeleça o tema padrão e contate o criador de seu tema de interface.";
                  btnText = "Restaurar o tema padrão";
                  break;
               case "en":
               default:
                  titleText = "Personalized theme interface";
                  contentText = "You\'re not using the official interface theme. Using a theme that is not up to date can lead to display issues, or even cause certain interfaces to disappear entirely. If you run into problems, restore the default theme and contact the creator of your interface theme.";
                  btnText = "Restore the default theme";
            }
            this._skinChangePop = new SystemPopupUI("skinChangePopup");
            this._skinChangePop.title = titleText;
            this._skinChangePop.content = contentText;
            this._skinChangePop.buttons = [{
               "label":btnText,
               "callback":function():void
               {
                  OptionManager.getOptionManager("dofus").currentUiSkin = ThemeManager.OFFICIAL_THEME_NAME;
                  Dofus.getInstance().clearCache(true,true);
               }
            }];
            this._skinChangePop.y = -400;
            this._skinChangePop.show();
         }
      }
      
      private function initPerformancesWatcher() : void
      {
         DofusFpsManager.init();
         FpsControler.Init(ScriptedAnimation);
      }
      
      private function initStaticConstants() : void
      {
         HookList.AuthenticationTicket;
         ChatHookList.ShowObjectLinked;
         PrismHookList.PrismsList;
         AlignmentHookList.AlignmentAreaUpdate;
         CraftHookList.ExchangeStartOkCraft;
         ExchangeHookList.AskExchangeMoveObject;
         FightHookList.AfkModeChanged;
         InventoryHookList.BankViewContent;
         LivingObjectHookList.LivingObjectAssociate;
         MountHookList.CertificateMountData;
         QuestHookList.QuestInfosUpdated;
         SocialHookList.AttackPlayer;
         TriggerHookList.CreaturesMode;
         CustomUiHookList.ActivateSound;
         RoleplayHookList.PlayerFightRequestSent;
         CraftHookList.DoNothing;
         ExternalGameHookList.DofusShopMoney;
         BreachHookList.BreachBranchesList;
         ApiActionList.AuthorizedCommand;
         ApiBreachActionList.BreachInvitationRequest;
         ApiChatActionList.ChannelEnabling;
         ApiCraftActionList.JobCrafterDirectoryDefineSettings;
         ApiSocialActionList.FriendsListRequest;
         ApiSocialActionList.ContactsListRequest;
         ApiRolePlayActionList.PlayerFightFriendlyAnswer;
         ApiExchangeActionList.BidHouseStringSearch;
         ApiMountActionList.MountFeedRequest;
         ApiLivingObjectActionList.LivingObjectChangeSkinRequest;
      }
      
      private function initModulesBindings() : void
      {
         ApiBinder.addApi("Ui",UiApi);
         ApiBinder.addApi("System",SystemApi);
         ApiBinder.addApi("Data",DataApi);
         ApiBinder.addApi("Time",TimeApi);
         ApiBinder.addApi("Tooltip",TooltipApi);
         ApiBinder.addApi("ContextMenu",ContextMenuApi);
         ApiBinder.addApi("Test",TestApi);
         ApiBinder.addApi("Jobs",JobsApi);
         ApiBinder.addApi("Storage",StorageApi);
         ApiBinder.addApi("Util",UtilApi);
         ApiBinder.addApi("Exchange",ExchangeApi);
         ApiBinder.addApi("Config",ConfigApi);
         ApiBinder.addApi("Binds",BindsApi);
         ApiBinder.addApi("Chat",ChatApi);
         ApiBinder.addApi("Sound",SoundApi);
         ApiBinder.addApi("Fight",FightApi);
         ApiBinder.addApi("PlayedCharacter",PlayedCharacterApi);
         ApiBinder.addApi("Connection",ConnectionApi);
         ApiBinder.addApi("Social",SocialApi);
         ApiBinder.addApi("Roleplay",RoleplayApi);
         ApiBinder.addApi("Map",MapApi);
         ApiBinder.addApi("Quest",QuestApi);
         ApiBinder.addApi("Alignment",AlignmentApi);
         ApiBinder.addApi("Inventory",InventoryApi);
         ApiBinder.addApi("Document",DocumentApi);
         ApiBinder.addApi("Mount",MountApi);
         ApiBinder.addApi("Party",PartyApi);
         ApiBinder.addApi("Highlight",HighlightApi);
         ApiBinder.addApi("File",FileApi);
         ApiBinder.addApi("Security",SecurityApi);
         ApiBinder.addApi("Capture",CaptureApi);
         ApiBinder.addApi("Notification",NotificationApi);
         ApiBinder.addApi("ExternalNotification",ExternalNotificationApi);
         ApiBinder.addApi("AveragePrices",AveragePricesApi);
         ApiBinder.addApi("Color",ColorApi);
         ApiBinder.addApi("UiTuto",UiTutoApi);
         ApiBinder.addApi("AbstractItemFilter",AbstractItemFilterApi);
         ApiBinder.addApi("EncyclopediaItemFilter",EncyclopediaItemFilterApi);
         ApiBinder.addApi("AuctionHouseItemFilter",AuctionHouseItemFilterApi);
         ApiBinder.addApi("Breach",BreachApi);
         TooltipsFactory.registerAssoc(String,"text");
         TooltipsFactory.registerAssoc(TextTooltipInfo,"textInfo");
         TooltipsFactory.registerAssoc(SpellWrapper,"spell");
         TooltipsFactory.registerAssoc(SpellPair,"spell");
         TooltipsFactory.registerAssoc(SpellTooltipInfo,"spellBanner");
         TooltipsFactory.registerAssoc(WeaponTooltipInfo,"weaponBanner");
         TooltipsFactory.registerAssoc(ItemWrapper,"item");
         TooltipsFactory.registerAssoc(WeaponWrapper,"item");
         TooltipsFactory.registerAssoc(QuantifiedItemWrapper,"item");
         TooltipsFactory.registerAssoc(SmileyWrapper,"smiley");
         TooltipsFactory.registerAssoc(ChatBubble,"chatBubble");
         TooltipsFactory.registerAssoc(ThinkBubble,"thinkBubble");
         TooltipsFactory.registerAssoc(GameRolePlayCharacterInformations,"player");
         TooltipsFactory.registerAssoc(GameRolePlayMutantInformations,"mutant");
         TooltipsFactory.registerAssoc(CharacterTooltipInformation,"player");
         TooltipsFactory.registerAssoc(MutantTooltipInformation,"mutant");
         TooltipsFactory.registerAssoc(GameRolePlayNpcInformations,"npc");
         TooltipsFactory.registerAssoc(GameRolePlayGroupMonsterInformations,"monsterGroup");
         TooltipsFactory.registerAssoc(GameRolePlayGroupMonsterWaveInformations,"monsterGroup");
         TooltipsFactory.registerAssoc(GameRolePlayMerchantInformations,"merchant");
         TooltipsFactory.registerAssoc(GroundObject,"groundObject");
         TooltipsFactory.registerAssoc(TaxCollectorTooltipInformation,"taxCollector");
         TooltipsFactory.registerAssoc(GameFightTaxCollectorInformations,"fightTaxCollector");
         TooltipsFactory.registerAssoc(EffectsWrapper,"effects");
         TooltipsFactory.registerAssoc(EffectsListWrapper,"effectsList");
         TooltipsFactory.registerAssoc(Vector.<String>,"texturesList");
         TooltipsFactory.registerAssoc(CraftSmileyItem,"craftSmiley");
         TooltipsFactory.registerAssoc(DelayedActionItem,"delayedAction");
         TooltipsFactory.registerAssoc(PrismTooltipInformation,"prism");
         TooltipsFactory.registerAssoc(PortalTooltipInformation,"portal");
         TooltipsFactory.registerAssoc(Object,"mount");
         TooltipsFactory.registerAssoc(MountWrapper,"item");
         TooltipsFactory.registerAssoc(GameContextPaddockItemInformations,"paddockItem");
         TooltipsFactory.registerAssoc(GameRolePlayMountInformations,"paddockMount");
         TooltipsFactory.registerAssoc(ChallengeWrapper,"challenge");
         TooltipsFactory.registerAssoc(PaddockWrapper,"paddock");
         TooltipsFactory.registerAssoc(GameFightCharacterInformations,"playerFighter");
         TooltipsFactory.registerAssoc(GameFightMonsterInformations,"monsterFighter");
         TooltipsFactory.registerAssoc(GameFightEntityInformation,"companionFighter");
         TooltipsFactory.registerAssoc(HouseWrapper,"house");
         TooltipsFactory.registerAssoc(SubhintWrapper,"simpleInterfaceTuto");
         MenusFactory.registerAssoc(GameRolePlayMerchantInformations,"humanVendor");
         MenusFactory.registerAssoc(ItemWrapper,"item");
         MenusFactory.registerAssoc(QuantifiedItemWrapper,"item");
         MenusFactory.registerAssoc(WeaponWrapper,"item");
         MenusFactory.registerAssoc(MountWrapper,"mount");
         MenusFactory.registerAssoc(GameRolePlayCharacterInformations,"player");
         MenusFactory.registerAssoc(GameRolePlayMutantInformations,"mutant");
         MenusFactory.registerAssoc(GameRolePlayNpcInformations,"npc");
         MenusFactory.registerAssoc(GameRolePlayNpcWithQuestInformations,"npc");
         MenusFactory.registerAssoc(GameRolePlayTaxCollectorInformations,"taxCollector");
         MenusFactory.registerAssoc(GameRolePlayPrismInformations,"prism");
         MenusFactory.registerAssoc(GameRolePlayPortalInformations,"portal");
         MenusFactory.registerAssoc(GameContextPaddockItemInformations,"paddockItem");
         MenusFactory.registerAssoc(GameRolePlayMountInformations,"mount");
         MenusFactory.registerAssoc(String,"player");
         MenusFactory.registerAssoc(GameRolePlayGroupMonsterInformations,"monsterGroup");
         MenusFactory.registerAssoc(GameFightEntityInformation,"companion");
         MenusFactory.registerAssoc(PartyCompanionWrapper,"companion");
         MenusFactory.registerAssoc(GameFightFighterInformations,"fightAlly");
         MenusFactory.registerAssoc(InteractiveElement,"interactiveElement");
         HyperlinkFactory.registerProtocol("ui",HyperlinkDisplayArrowManager.showArrow);
         HyperlinkFactory.registerProtocol("spell",HyperlinkSpellManager.showSpell,HyperlinkSpellManager.getSpellLevelName);
         HyperlinkFactory.registerProtocol("spellNoLvl",HyperlinkSpellManager.showSpellNoLevel,HyperlinkSpellManager.getSpellName);
         HyperlinkFactory.registerProtocol("spellPair",HyperlinkSpellManager.showSpellPair);
         HyperlinkFactory.registerProtocol("cell",HyperlinkShowCellManager.showCell);
         HyperlinkFactory.registerProtocol("entity",HyperlinkShowEntityManager.showEntity,HyperlinkShowEntityManager.getEntityName,null,true,HyperlinkShowEntityManager.rollOver);
         HyperlinkFactory.registerProtocol("recipe",HyperlinkShowRecipeManager.showRecipe,HyperlinkShowRecipeManager.getRecipeName,null,true,HyperlinkShowRecipeManager.rollOver);
         HyperlinkFactory.registerProtocol("player",HyperlinkShowPlayerMenuManager.showPlayerMenu,HyperlinkShowPlayerMenuManager.getPlayerName,null,true,HyperlinkShowPlayerMenuManager.rollOverPlayer);
         HyperlinkFactory.registerProtocol("account",HyperlinkShowAccountMenuManager.showAccountMenu,null,null,true);
         HyperlinkFactory.registerProtocol("item",HyperlinkItemManager.showItem,HyperlinkItemManager.getItemName,HyperlinkItemManager.insertItem);
         HyperlinkFactory.registerProtocol("map",HyperlinkMapPosition.showPosition,HyperlinkMapPosition.getText,null,true,HyperlinkMapPosition.rollOver);
         HyperlinkFactory.registerProtocol("chatitem",HyperlinkItemManager.showChatItem,null,HyperlinkItemManager.duplicateChatHyperlink,true,HyperlinkItemManager.rollOver);
         HyperlinkFactory.registerProtocol("guild",HyperlinkShowGuildManager.showGuild,HyperlinkShowGuildManager.getGuildName,null,true,HyperlinkShowGuildManager.rollOver);
         HyperlinkFactory.registerProtocol("alliance",HyperlinkShowAllianceManager.showAlliance,HyperlinkShowAllianceManager.getAllianceName,null,true,HyperlinkShowAllianceManager.rollOver);
         HyperlinkFactory.registerProtocol("openSocial",HyperlinkSocialManager.openSocial,null,null,true,HyperlinkSocialManager.rollOver);
         HyperlinkFactory.registerProtocol("chatLinkRelease",HyperlinkURLManager.chatLinkRelease,null,null,true,HyperlinkURLManager.rollOver);
         HyperlinkFactory.registerProtocol("chatWarning",HyperlinkURLManager.chatWarning);
         HyperlinkFactory.registerProtocol("subst",HyperlinkSubstitutionManager.openAnkabox,HyperlinkSubstitutionManager.substitute,null,true,HyperlinkItemManager.rollOver);
         HyperlinkFactory.registerProtocol("npc",HyperlinkShowNpcManager.showNpc);
         HyperlinkFactory.registerProtocol("monster",HyperlinkShowMonsterManager.showMonster,HyperlinkShowMonsterManager.getMonsterName);
         HyperlinkFactory.registerProtocol("monsterFight",HyperlinkShowMonsterFightManager.showEntity,null,null,true,HyperlinkShowMonsterFightManager.rollOver);
         HyperlinkFactory.registerProtocol("spellEffectArea",HyperlinkSpellManager.showSpellArea,null,null,true,HyperlinkSpellManager.rollOver);
         HyperlinkFactory.registerProtocol("chatquest",HyperlinkShowQuestManager.showQuest,null,null,true,HyperlinkShowQuestManager.rollOver);
         HyperlinkFactory.registerProtocol("chatachievement",HyperlinkShowAchievementManager.showAchievement,HyperlinkShowAchievementManager.getAchievementName,null,true,HyperlinkShowAchievementManager.rollOver);
         HyperlinkFactory.registerProtocol("chattitle",HyperlinkShowTitleManager.showTitle,null,null,true,HyperlinkShowTitleManager.rollOver);
         HyperlinkFactory.registerProtocol("chatornament",HyperlinkShowOrnamentManager.showOrnament,null,null,true,HyperlinkShowOrnamentManager.rollOver);
         HyperlinkFactory.registerProtocol("chatmonster",HyperlinkShowMonsterChatManager.showMonster,HyperlinkShowMonsterChatManager.getMonsterName,null,true,HyperlinkShowMonsterChatManager.rollOver);
         HyperlinkFactory.registerProtocol("bestiary",HyperlinkShowMonsterChatManager.showMonster,HyperlinkShowMonsterChatManager.getMonsterName,null,false,HyperlinkShowMonsterChatManager.rollOver);
         HyperlinkFactory.registerProtocol("bestiaryItem",HyperlinkItemManager.showBestiaryItem,HyperlinkItemManager.getItemName,HyperlinkItemManager.insertItem);
         HyperlinkFactory.registerProtocol("encyclopediaPinItem",HyperlinkItemManager.showPinnedItemTooltip,null,HyperlinkItemManager.insertItem,true);
         HyperlinkFactory.registerProtocol("HDVItem",null,null,HyperlinkItemManager.insertItem,true);
         HyperlinkFactory.registerProtocol("encyclopediaItem",HyperlinkItemManager.showResourceItem,HyperlinkItemManager.getItemName,HyperlinkItemManager.insertItem);
         HyperlinkFactory.registerProtocol("chatdare",HyperlinkShowDareChatManager.showDare,HyperlinkShowDareChatManager.getDareName,null,true,HyperlinkShowDareChatManager.rollOver);
         HyperlinkFactory.registerProtocol("subArea",HyperlinkShowSubArea.showSubArea,HyperlinkShowSubArea.getSubAreaName);
         HyperlinkFactory.registerProtocol("offlineSales",HyperlinkShowOfflineSales.showOfflineSales,null,null,false);
         HyperlinkFactory.registerProtocol("taxcollectorPosition",HyperlinkTaxCollectorPosition.showPosition,null,null,false,HyperlinkTaxCollectorPosition.rollOver);
         HyperlinkFactory.registerProtocol("taxcollectorCollected",HyperlinkTaxCollectorCollected.showCollectedTaxCollector,null,null,false,HyperlinkTaxCollectorCollected.rollOver);
         HyperlinkFactory.registerProtocol("swapPositionRequest",HyperlinkSwapPositionRequest.showMenu,null,null,false);
         HyperlinkFactory.registerProtocol("system",HyperlinkSystem.open,null,null,true);
         HyperlinkFactory.registerProtocol("monsterGroup",HyperlinkShowMonsterGroup.showMonsterGroup,HyperlinkShowMonsterGroup.getText,null,true,HyperlinkShowMonsterGroup.rollOver);
         HyperlinkFactory.registerProtocol("url",HyperlinkURLManager.openURL);
         HyperlinkFactory.registerProtocol("screenshot",HyperlinkScreenshot.click,null,null,true);
         HyperlinkFactory.registerProtocol("estate",HyperlinkShowEstate.click,null,null,true);
         HyperlinkFactory.registerProtocol("openOption",HyperlinkOptionManager.openOption,null,null,true);
         HyperlinkFactory.registerProtocol("highlightElement",SubhintInspector.selectElementInInspector,null,null,true,SubhintInspector.processRollOver);
         HyperlinkFactory.registerProtocol("openBook",HyperlinkOpenBook.open,null,null,true);
         HyperlinkFactory.registerProtocol("openFightResult",HyperlinkFightResultManager.open);
         HyperlinkFactory.registerProtocol("leaveBreach",HyperlinkBreachManager.leaveBreach);
         HyperlinkFactory.registerProtocol("invitGroup",HyperlinkBreachManager.invitGroup);
      }
      
      private function displayLoadingScreen() : void
      {
         this._loadingScreen = new LoadingScreen(false,true,!Dofus.getInstance().initialized && Dofus.getInstance().useMiniLoader);
         this._loadingScreen.closeMiniUiRequestHandler = this.closeMiniLoadingUi;
         this._loadingScreen.logCallbackHandler = this.onLog;
         Dofus.getInstance().addChild(this._loadingScreen);
      }
      
      private function closeMiniLoadingUi() : void
      {
         if(this._loadingScreen)
         {
            this._loadingScreen.hideMiniUi();
            StageShareManager.stage.nativeWindow.activate();
         }
      }
      
      private function onLog(text:String, level:uint) : void
      {
         if(level == LoadingScreen.ERROR)
         {
            this.closeMiniLoadingUi();
         }
      }
      
      private function initTubul() : void
      {
         SoundManager.getInstance().checkSoundDirectory();
      }
      
      private function checkInit() : void
      {
         var reste:uint = 0;
         var key:* = null;
         var lowdefMappings:Array = null;
         var skin:SkinMapping = null;
         var start:Boolean = true;
         for(key in this._aModuleInit)
         {
            start = start && this._aModuleInit[key];
            if(!this._aModuleInit[key])
            {
               reste++;
            }
         }
         if(reste == 3)
         {
            UiModuleManager.getInstance().init(Constants.COMMON_GAME_MODULE.concat(Constants.PRE_GAME_MODULE),true);
         }
         if(BuildInfos.BUILD_TYPE != BuildTypeEnum.DEBUG && StoreUserDataManager.getInstance().statsEnabled)
         {
            if(start && !Benchmark.hasCachedResults && !Benchmark.isDone)
            {
               Benchmark.run(StageShareManager.stage,this.checkInit);
               return;
            }
         }
         if(start)
         {
            CensoredContentManager.getInstance().init(CensoredContent.getCensoredContents(),XmlConfig.getInstance().getEntry("config.lang.current"));
            lowdefMappings = SkinMapping.getSkinMappings();
            for each(skin in lowdefMappings)
            {
               Skin.addAlternativeSkin(skin.id,skin.lowDefId);
            }
            _log.info("Initialization frame end");
            Constants.EVENT_MODE = LangManager.getInstance().getEntry("config.eventMode") == "true";
            Constants.EVENT_MODE_PARAM = LangManager.getInstance().getEntry("config.eventModeParams");
            Constants.CHARACTER_CREATION_ALLOWED = LangManager.getInstance().getEntry("config.characterCreationAllowed") == "true";
            Constants.FORCE_MAXIMIZED_WINDOW = LangManager.getInstance().getEntry("config.autoMaximize") == "true";
            if(Constants.FORCE_MAXIMIZED_WINDOW)
            {
               StageShareManager.stage.nativeWindow.maximize();
            }
            Berilia.getInstance().addEventListener(UiRenderEvent.UIRenderComplete,this.onUiLoaded);
            Kernel.getWorker().addFrame(new AuthentificationFrame());
            Kernel.getWorker().addFrame(new QueueFrame());
            Kernel.getWorker().addFrame(new GameStartingFrame());
            if(!UpdaterApi.isConnected() && BuildInfos.BUILD_TYPE != BuildTypeEnum.DEBUG)
            {
               KernelEventsManager.getInstance().processCallback(HookList.UpdaterConnectionFailed);
            }
         }
      }
      
      private function onUiLoaded(e:UiRenderEvent) : void
      {
         if(e.uiTarget.uiData.name == "login")
         {
            Kernel.getWorker().removeFrame(this);
         }
      }
      
      private function initFonts() : void
      {
         EmbedFontManager.getInstance().addEventListener(Event.COMPLETE,this.onFontsManagerInit);
         var fontList:Array = FontManager.getInstance().getFontUrlList();
         EmbedFontManager.getInstance().initialize(fontList);
      }
      
      private function setModulePercent(moduleName:String, prc:Number, add:Boolean = false) : void
      {
         var p:Number = NaN;
         if(!this._modPercents[moduleName])
         {
            this._modPercents[moduleName] = 0;
         }
         if(add)
         {
            this._modPercents[moduleName] = this._modPercents[moduleName] + prc;
         }
         else
         {
            this._modPercents[moduleName] = prc;
         }
         var totalPrc:Number = 0;
         for each(p in this._modPercents)
         {
            totalPrc = totalPrc + p / 100 * this._percentPerModule;
         }
         if(this._modPercents[moduleName] == 100)
         {
            this._loadingScreen.log(moduleName + " initialized",LoadingScreen.IMPORTANT);
         }
         this._loadingScreen.value = totalPrc;
      }
      
      private function onFontsManagerInit(e:Event) : void
      {
         FontManager.getInstance().activeType = OptionManager.getOptionManager("dofus")["smallScreenFont"] == true?"smallScreen":FontManager.DEFAULT_FONT_TYPE;
         this._aModuleInit["font"] = true;
         this.setModulePercent("font",100);
         this.checkInit();
      }
      
      private function onI18nReady(e:Event) : void
      {
         this._aModuleInit["i18n"] = true;
         this.setModulePercent("i18n",100);
         StoreDataManager.getInstance().setData(Constants.DATASTORE_LANG_VERSION,"lastLang",LangManager.getInstance().getEntry("config.lang.current"));
         this.checkInit();
         Input.numberStrSeparator = I18n.getUiText("ui.common.numberSeparator");
      }
      
      private function onGameDataReady(e:Event) : void
      {
         this._aModuleInit["gameData"] = true;
         this.setModulePercent("gameData",100);
         this.checkInit();
      }
      
      private function onGameDataPartialDataReady(e:LangFileEvent) : void
      {
         if(!this._loadingScreen)
         {
            this._loadingScreen = new LoadingScreen();
            Dofus.getInstance().addChild(this._loadingScreen);
         }
         this._loadingScreen.log("[GameData] " + FileUtils.getFileName(e.url) + " parsed",LoadingScreen.INFO);
         this.setModulePercent("gameData",this._percentPerModule / GameDataUpdater.getInstance().files.length,true);
      }
      
      private function onI18nPartialDataReady(e:LangFileEvent) : void
      {
         this._loadingScreen.log("[i18n] " + FileUtils.getFileName(e.url) + " parsed",LoadingScreen.INFO);
         this.setModulePercent("i18n",this._percentPerModule / I18nUpdater.getInstance().files.length,true);
      }
      
      private function onDataFileError(e:FileEvent) : void
      {
         this._loadingScreen.log("Unabled to load  " + e.file,LoadingScreen.ERROR);
      }
   }
}
