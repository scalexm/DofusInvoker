package com.ankamagames.dofus.logic.connection.managers
{
   import com.ankama.zaap.ErrorCode;
   import com.ankamagames.berilia.managers.KernelEventsManager;
   import com.ankamagames.dofus.kernel.Kernel;
   import com.ankamagames.dofus.kernel.updaterv2.IUpdaterMessageHandler;
   import com.ankamagames.dofus.kernel.updaterv2.UpdaterApi;
   import com.ankamagames.dofus.kernel.updaterv2.messages.IUpdaterInputMessage;
   import com.ankamagames.dofus.kernel.updaterv2.messages.UpdaterAuthenticationErrorEnum;
   import com.ankamagames.dofus.kernel.updaterv2.messages.impl.ApiTokenMessage;
   import com.ankamagames.dofus.kernel.updaterv2.messages.impl.ZaapUserInfosMessage;
   import com.ankamagames.dofus.logic.common.managers.PlayerManager;
   import com.ankamagames.dofus.logic.connection.actions.LoginValidationAction;
   import com.ankamagames.dofus.logic.connection.actions.LoginValidationWithTicketAction;
   import com.ankamagames.dofus.misc.lists.HookList;
   import com.ankamagames.jerakine.logger.Log;
   import com.ankamagames.jerakine.logger.Logger;
   import com.ankamagames.jerakine.managers.OptionManager;
   import flash.utils.getQualifiedClassName;
   
   public class UpdaterConnectionManager implements IUpdaterMessageHandler
   {
      
      private static const _log:Logger = Log.getLogger(getQualifiedClassName(UpdaterConnectionManager));
      
      private static const instance:UpdaterConnectionManager = new UpdaterConnectionManager();
       
      
      private var _api:UpdaterApi;
      
      public function UpdaterConnectionManager()
      {
         super();
         if(!this._api)
         {
            this._api = new UpdaterApi(this);
         }
      }
      
      public static function getInstance() : UpdaterConnectionManager
      {
         return instance;
      }
      
      public function requestApiToken() : void
      {
         if(UpdaterApi.canLoginWithZaap())
         {
            this._api.getUserInfos();
         }
         else
         {
            this._api.getIdentificationToken();
         }
         KernelEventsManager.getInstance().processCallback(HookList.ConnectionTimerStart);
      }
      
      public function handleMessage(msg:IUpdaterInputMessage) : void
      {
         var zuim:ZaapUserInfosMessage = null;
         var atm:ApiTokenMessage = null;
         var lva:LoginValidationAction = null;
         var connectType:int = 0;
         _log.info("Received : " + getQualifiedClassName(msg));
         loop0:
         switch(true)
         {
            case msg is ZaapUserInfosMessage:
               zuim = msg as ZaapUserInfosMessage;
               if(zuim.login != null)
               {
                  AuthentificationManager.getInstance().username = zuim.login;
               }
               else
               {
                  _log.error("Error getting user infos from Zaap : " + ErrorCode.VALUES_TO_NAMES[zuim.error]);
               }
               this._api.getIdentificationToken();
               break;
            case msg is ApiTokenMessage:
               atm = msg as ApiTokenMessage;
               if(atm.getToken() != null)
               {
                  lva = AuthentificationManager.getInstance().loginValidationAction;
                  if(lva != null)
                  {
                     Kernel.getWorker().process(LoginValidationWithTicketAction.create(AuthentificationManager.getInstance().username,atm.getToken(),lva.autoSelectServer,lva.serverId));
                     break;
                  }
                  connectType = OptionManager.getOptionManager("dofus")["autoConnectType"];
                  if(connectType == 2)
                  {
                     PlayerManager.getInstance().allowAutoConnectCharacter = true;
                     PlayerManager.getInstance().autoConnectOfASpecificCharacterId = -1;
                  }
                  Kernel.getWorker().process(LoginValidationWithTicketAction.create(AuthentificationManager.getInstance().username,atm.getToken(),connectType != 0));
                  break;
               }
               if(UpdaterApi.isUsingZaapLogin())
               {
                  _log.error("Error getting token from Zaap : " + ErrorCode.VALUES_TO_NAMES[atm.error]);
                  break;
               }
               switch(atm.error)
               {
                  case UpdaterAuthenticationErrorEnum.AUTHENTICATION_FAILED:
                     _log.error("Echec de l\'authentification");
                     break loop0;
                  case UpdaterAuthenticationErrorEnum.AUTHENTICATION_DECLINED:
                     _log.error("Authentification Décliné");
                     break loop0;
                  case UpdaterAuthenticationErrorEnum.AUTHENTICATION_REQUIRED:
                     _log.error("Vous devez ètres authentifié pour vous authentifié Oo");
                     break loop0;
                  case UpdaterAuthenticationErrorEnum.ACCOUNT_BANNED:
                     _log.error("Votre compte à été banni");
                     break loop0;
                  case UpdaterAuthenticationErrorEnum.ACCOUNT_LOCKED:
                     _log.error("Votre compte à été vérouillé");
                     break loop0;
                  case UpdaterAuthenticationErrorEnum.ACCOUNT_DELETED:
                     _log.error("Ce compte à été supprimé");
                     break loop0;
                  case UpdaterAuthenticationErrorEnum.IP_BLACKLISTED:
                     _log.error("Votre Ip à été bannis");
                     break loop0;
                  case UpdaterAuthenticationErrorEnum.SERVER_UNREACHABLE:
                     _log.error("Impossilve de joindre les serveur d\'authentification");
                     break loop0;
                  default:
                     _log.error("Le service d\'authentification a rencontré un erreur inatendu");
                     break loop0;
               }
         }
      }
      
      public function handleConnectionOpened() : void
      {
      }
      
      public function handleConnectionClosed() : void
      {
      }
   }
}
