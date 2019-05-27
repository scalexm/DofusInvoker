package com.ankamagames.dofus.misc.utils
{
   import com.ankamagames.dofus.BuildInfos;
   import com.ankamagames.dofus.network.enums.BuildTypeEnum;
   import com.ankamagames.jerakine.logger.Log;
   import com.ankamagames.jerakine.logger.Logger;
   import flash.utils.getQualifiedClassName;
   
   public class RpcServiceCenter
   {
      
      protected static const _log:Logger = Log.getLogger(getQualifiedClassName(RpcServiceCenter));
      
      private static const WEB_API_BASE_URL:String = "https://api.ankama.";
      
      private static const AUTHORIZED_DOMAIN_EXTENSION:Array = ["com","lan","tst"];
      
      private static var _self:RpcServiceCenter;
      
      private static var _rpcServices:Vector.<RpcServiceManager>;
       
      
      private var _mainRpcServiceManager:RpcServiceManager;
      
      private var _currentApiDomain:String;
      
      private var _currentApiDomainExtension:String;
      
      public function RpcServiceCenter()
      {
         super();
      }
      
      public static function getInstance() : RpcServiceCenter
      {
         if(!_self)
         {
            _self = new RpcServiceCenter();
         }
         return _self;
      }
      
      public function makeRpcCall(serviceUrl:String, formatType:String, formatVersion:String, methodName:String, methodParams:*, callback:Function, newService:Boolean = true, retryOnTimedout:Boolean = true, ignoreTimedoutRequest:Boolean = true) : void
      {
         var rpcs:RpcServiceManager = null;
         if(newService)
         {
            _log.debug("makeRpcCall on a new service");
            rpcs = this.getRpcService(serviceUrl,formatType,formatVersion);
         }
         else
         {
            _log.debug("makeRpcCall on the main service");
            if(!this._mainRpcServiceManager)
            {
               this._mainRpcServiceManager = new RpcServiceManager(serviceUrl,formatType,formatVersion);
            }
            else
            {
               this._mainRpcServiceManager.type = formatType;
               this._mainRpcServiceManager.service = serviceUrl;
            }
            rpcs = this._mainRpcServiceManager;
         }
         rpcs.callMethod(methodName,methodParams,callback,retryOnTimedout,ignoreTimedoutRequest);
      }
      
      public function get apiDomain() : String
      {
         if(!this._currentApiDomain)
         {
            this._currentApiDomain = WEB_API_BASE_URL + this.apiDomainExtension;
         }
         return this._currentApiDomain;
      }
      
      public function get apiDomainExtension() : String
      {
         if(!this._currentApiDomainExtension)
         {
            switch(BuildInfos.BUILD_TYPE)
            {
               case BuildTypeEnum.BETA:
               case BuildTypeEnum.RELEASE:
                  this._currentApiDomainExtension = "com";
                  break;
               case BuildTypeEnum.TESTING:
                  this._currentApiDomainExtension = "lan";
                  break;
               default:
                  this._currentApiDomainExtension = "tst";
            }
         }
         return this._currentApiDomainExtension;
      }
      
      public function get secureApiDomain() : String
      {
         return this.apiDomain.replace("http:","https:");
      }
      
      private function getRpcService(serviceUrl:String, formatType:String, formatVersion:String) : RpcServiceManager
      {
         var rpcService:RpcServiceManager = null;
         var newServiceRcp:RpcServiceManager = null;
         if(!_rpcServices)
         {
            _rpcServices = new Vector.<RpcServiceManager>();
         }
         for each(rpcService in _rpcServices)
         {
            if(!rpcService.busy)
            {
               rpcService.service = serviceUrl;
               rpcService.type = formatType;
               return rpcService;
            }
         }
         newServiceRcp = new RpcServiceManager(serviceUrl,formatType,formatVersion);
         _rpcServices.push(newServiceRcp);
         return newServiceRcp;
      }
   }
}
