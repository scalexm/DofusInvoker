package com.ankamagames.dofus.logic.game.common.managers
{
   import com.ankama.codegen.client.api.ApiClient;
   import com.ankama.codegen.client.api.EsportLeagueApi;
   import com.ankama.codegen.client.api.EsportMatchApi;
   import com.ankama.codegen.client.api.event.ApiClientEvent;
   import com.ankama.codegen.client.model.EsportModelLeague;
   import com.ankama.codegen.client.model.EsportModelMatch;
   import com.ankamagames.dofus.logic.common.managers.NotificationManager;
   import com.ankamagames.dofus.types.enums.NotificationTypeEnum;
   import com.ankamagames.jerakine.data.I18n;
   import com.ankamagames.jerakine.logger.Log;
   import com.ankamagames.jerakine.logger.Logger;
   import com.ankamagames.jerakine.managers.OptionManager;
   import com.ankamagames.jerakine.utils.errors.SingletonError;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import flash.utils.getQualifiedClassName;
   
   public class TimedNotificationManager
   {
      
      private static var _self:TimedNotificationManager;
      
      protected static const _log:Logger = Log.getLogger(getQualifiedClassName(AlmanaxManager));
       
      
      private var _happiClient:ApiClient;
      
      private var _matchDates:Array;
      
      private var _nextMatchTimer:Timer;
      
      public function TimedNotificationManager()
      {
         this._matchDates = new Array();
         super();
         if(_self)
         {
            throw new SingletonError();
         }
         this._happiClient = new ApiClient();
         this._happiClient.setBasePath("https://haapi.ankama." + "com" + "/json/Dofus/v1");
         this._happiClient.addEventListener(ApiClientEvent.API_CALL_RESULT,this.onSuccess);
         this._happiClient.addEventListener(ApiClientEvent.API_CALL_ERROR,this.onError);
         this._nextMatchTimer = new Timer(0,1);
         this._nextMatchTimer.addEventListener(TimerEvent.TIMER_COMPLETE,this.onMatchTimerComplete);
         this.getTournamentMatchDate();
      }
      
      public static function getInstance() : TimedNotificationManager
      {
         if(!_self)
         {
            _self = new TimedNotificationManager();
         }
         return _self;
      }
      
      private function getTournamentMatchDate() : void
      {
         var leagueApi:EsportLeagueApi = new EsportLeagueApi(this._happiClient);
         leagueApi.getLeaguesApiCall(true);
      }
      
      private function onSuccess(pEvent:ApiClientEvent) : void
      {
         if(pEvent.result is Array && pEvent.result.length > 0 && pEvent.result[0] is EsportModelLeague)
         {
            this.processSeasonsResult(pEvent.result as Array);
         }
         else if(pEvent.result is Array && pEvent.result.length > 0 && pEvent.result[0] is EsportModelMatch)
         {
            this.processMatchResult(pEvent.result as Array);
         }
      }
      
      private function processSeasonsResult(seasons:Array) : void
      {
         var league:EsportModelLeague = null;
         var season:Object = null;
         var esportMatchApi:EsportMatchApi = null;
         var runningSeasonId:Number = NaN;
         var runningSeasonsId:Array = new Array();
         for each(league in seasons)
         {
            if(league.visible && league.current)
            {
               for each(season in league.seasons)
               {
                  if(season.visible && season.current)
                  {
                     runningSeasonsId.push(season.id);
                  }
               }
            }
         }
         esportMatchApi = new EsportMatchApi(this._happiClient);
         for each(runningSeasonId in runningSeasonsId)
         {
            esportMatchApi.getNextMatchesBySeasonApiCall(runningSeasonId,NaN,NaN,null);
         }
      }
      
      private function processMatchResult(matchs:Array) : void
      {
         var match:EsportModelMatch = null;
         var currentTime:Date = new Date();
         for each(match in matchs)
         {
            if(match.streamingUrl && match.streamingUrl.length > 0 && match.teamOne && match.teamTwo && match.date && match.date.time > currentTime.time)
            {
               this._matchDates.push(match);
            }
         }
         this._matchDates.sort(this.sortMatchByDate);
         this.setNextMatchTimer();
      }
      
      private function setNextMatchTimer() : void
      {
         if(this._matchDates.length <= 0)
         {
            return;
         }
         var epoch:Number = new Date().time;
         var delay:Number = this._matchDates[0].date.time - epoch;
         if(delay < 0)
         {
            delay = 0;
         }
         this._nextMatchTimer.stop();
         this._nextMatchTimer.delay = delay;
         this._nextMatchTimer.start();
      }
      
      private function sortMatchByDate(a:EsportModelMatch, b:EsportModelMatch) : int
      {
         var date1:Number = a.date.time;
         var date2:Number = b.date.time;
         if(date1 < date2)
         {
            return -1;
         }
         if(date1 > date2)
         {
            return 1;
         }
         return 0;
      }
      
      private function onError(pEvent:ApiClientEvent) : void
      {
         _log.error("Failed to retrieve esports data, error:\n" + pEvent.errorMsg);
      }
      
      private function onMatchTimerComplete(pEvent:TimerEvent) : void
      {
         var notificationId:uint = 0;
         var notifMatch:EsportModelMatch = this._matchDates.shift();
         var leagueName:String = notifMatch.season.league.name;
         if(notifMatch.season.name && notifMatch.season.name.length > 0)
         {
            leagueName = leagueName + (" : " + notifMatch.season.name);
         }
         if(OptionManager.getOptionManager("dofus")["showEsportNotifications"])
         {
            notificationId = NotificationManager.getInstance().prepareNotification(I18n.getUiText("ui.esportTournament.tournament"),I18n.getUiText("ui.esportTournament.notificationText",[leagueName,notifMatch.teamOne.websiteUrl,notifMatch.teamOne.name,notifMatch.teamTwo.websiteUrl,notifMatch.teamTwo.name]),NotificationTypeEnum.SURVEY_INVITATION,"tournamentNotif");
            NotificationManager.getInstance().addButtonToNotification(notificationId,I18n.getUiText("ui.esportTournament.watchStreaming"),"GoToUrl",[notifMatch.websiteUrl],true,250,0,"action","icon_external_link",22);
            NotificationManager.getInstance().sendNotification(notificationId);
         }
         this.setNextMatchTimer();
      }
   }
}
