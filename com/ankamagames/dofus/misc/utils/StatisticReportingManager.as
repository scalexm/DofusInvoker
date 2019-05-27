package com.ankamagames.dofus.misc.utils
{
   import by.blooddy.crypto.MD5;
   import com.ankamagames.dofus.BuildInfos;
   import com.ankamagames.dofus.logic.common.managers.PlayerManager;
   import com.ankamagames.jerakine.logger.Log;
   import com.ankamagames.jerakine.logger.Logger;
   import com.ankamagames.jerakine.managers.StoreDataManager;
   import com.ankamagames.jerakine.types.DataStoreType;
   import com.ankamagames.jerakine.types.enums.DataStoreEnum;
   import com.ankamagames.jerakine.utils.errors.SingletonError;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   import flash.net.URLRequestMethod;
   import flash.net.URLVariables;
   import flash.utils.getQualifiedClassName;
   
   public class StatisticReportingManager
   {
      
      private static var _self:StatisticReportingManager;
      
      private static var WEB_SERVICE:String = "https://www.ankama.com/stats/dofus";
       
      
      protected var _log:Logger;
      
      private var _dt:DataStoreType;
      
      public function StatisticReportingManager()
      {
         this._log = Log.getLogger(getQualifiedClassName(StatisticReportingManager));
         this._dt = new DataStoreType("StatisticReportingManager",true,DataStoreEnum.LOCATION_LOCAL,DataStoreEnum.BIND_COMPUTER);
         super();
         if(_self)
         {
            throw new SingletonError();
         }
      }
      
      public static function getInstance() : StatisticReportingManager
      {
         if(!_self)
         {
            _self = new StatisticReportingManager();
         }
         return _self;
      }
      
      public function report(key:String, value:String) : Boolean
      {
         var oldValue:String = null;
         var urlRequest:URLRequest = null;
         var urlLoader:URLLoader = null;
         if(!key)
         {
            return false;
         }
         try
         {
            oldValue = StoreDataManager.getInstance().getData(this._dt,key);
            if(oldValue && oldValue == value)
            {
               return false;
            }
            urlRequest = new URLRequest(WEB_SERVICE);
            urlRequest.method = URLRequestMethod.POST;
            urlRequest.data = new URLVariables();
            urlRequest.data.guid = MD5.hash(PlayerManager.getInstance().nickname);
            urlRequest.data.version = BuildInfos.BUILD_TYPE;
            urlRequest.data.key = key;
            urlRequest.data.value = value;
            urlLoader = new URLLoader();
            urlLoader.addEventListener(Event.COMPLETE,this.onSended);
            urlLoader.addEventListener(IOErrorEvent.IO_ERROR,this.onSendError);
            urlLoader.load(urlRequest);
            StoreDataManager.getInstance().setData(this._dt,key,value);
            return true;
         }
         catch(e:Error)
         {
         }
         return false;
      }
      
      public function isReported(key:String) : Boolean
      {
         var oldValue:String = StoreDataManager.getInstance().getData(this._dt,key);
         if(oldValue)
         {
            return true;
         }
         return false;
      }
      
      private function onSended(e:Event) : void
      {
      }
      
      private function onSendError(e:Event) : void
      {
      }
   }
}
