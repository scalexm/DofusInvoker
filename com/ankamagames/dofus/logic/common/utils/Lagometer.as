package com.ankamagames.dofus.logic.common.utils
{
   import com.ankamagames.berilia.frames.UiStatsFrame;
   import com.ankamagames.berilia.managers.KernelEventsManager;
   import com.ankamagames.dofus.misc.lists.HookList;
   import com.ankamagames.jerakine.logger.Log;
   import com.ankamagames.jerakine.logger.Logger;
   import com.ankamagames.jerakine.network.ILagometer;
   import com.ankamagames.jerakine.network.INetworkMessage;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import flash.utils.getQualifiedClassName;
   
   public class Lagometer implements ILagometer
   {
      
      protected static const _log:Logger = Log.getLogger(getQualifiedClassName(Lagometer));
      
      protected static const SHOW_LAG_DELAY:uint = 2 * 1000;
       
      
      protected var _timer:Timer;
      
      protected var _lagging:Boolean = false;
      
      public function Lagometer()
      {
         super();
         this._timer = new Timer(SHOW_LAG_DELAY,1);
         this._timer.addEventListener(TimerEvent.TIMER_COMPLETE,this.onTimerComplete);
      }
      
      public function ping(msg:INetworkMessage = null) : void
      {
         this._timer.start();
      }
      
      public function pong(msg:INetworkMessage = null) : void
      {
         if(this._lagging)
         {
            this.stopLag();
         }
         if(this._timer.running)
         {
            this._timer.stop();
         }
      }
      
      public function stop() : void
      {
         if(this._timer.running)
         {
            this._timer.stop();
         }
      }
      
      protected function onTimerComplete(e:TimerEvent) : void
      {
         this.startLag();
      }
      
      protected function startLag() : void
      {
         if(!this._lagging)
         {
            UiStatsFrame.addStat("server_lag");
            UiStatsFrame.setDateStat("last_server_lag");
         }
         this._lagging = true;
         this.updateUi();
      }
      
      protected function updateUi() : void
      {
         KernelEventsManager.getInstance().processCallback(HookList.LaggingNotification,this._lagging);
      }
      
      protected function stopLag() : void
      {
         this._lagging = false;
         this.updateUi();
      }
   }
}
