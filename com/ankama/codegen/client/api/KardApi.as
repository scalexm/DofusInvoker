package com.ankama.codegen.client.api
{
   import com.ankama.codegen.client.api.event.ApiClientEvent;
   import com.ankama.codegen.client.model.KardTicket;
   import flash.utils.Dictionary;
   
   public class KardApi
   {
       
      
      private var forceImportModelList:ModelList = null;
      
      private var _apiClient:ApiClient;
      
      private var _returnObjectType:String;
      
      public function KardApi(apiClient:ApiClient)
      {
         super();
         this._apiClient = apiClient;
      }
      
      private static function verifyParam(param:*) : Boolean
      {
         if(param is int || param is uint)
         {
            return true;
         }
         if(param is Number)
         {
            return !isNaN(param);
         }
         return param != null;
      }
      
      public function getApiClient() : ApiClient
      {
         return this._apiClient;
      }
      
      public function setApiClient(apiClient:ApiClient) : void
      {
         this._apiClient = apiClient;
      }
      
      public function consumeByCodeApiCall(code:String, lang:String) : void
      {
         if(!verifyParam(code))
         {
            throw new ApiError(400,"Missing the required parameter \'code\' when calling consumeByCode");
         }
         if(!verifyParam(lang))
         {
            throw new ApiError(400,"Missing the required parameter \'lang\' when calling consumeByCode");
         }
         var path:String = "/Kard/ConsumeByCode".replace(/\{format\}/g,"json");
         var queryParams:Dictionary = new Dictionary();
         var headerParams:Dictionary = new Dictionary();
         var formParams:Dictionary = new Dictionary();
         if(verifyParam(code))
         {
            queryParams["code"] = this._apiClient.parameterToString(code);
         }
         if(verifyParam(lang))
         {
            queryParams["lang"] = this._apiClient.parameterToString(lang);
         }
         var accepts:Array = new Array();
         var accept:String = this._apiClient.selectHeaderAccept(accepts);
         var contentTypes:Array = new Array();
         var contentType:String = this._apiClient.selectHeaderContentType(contentTypes);
         var authNames:Array = new Array("AuthAnkamaApiKey");
         var forceImport_KardTicket:KardTicket = undefined;
         this._returnObjectType = "com.ankama.codegen.client.model.KardTicket";
         this._apiClient.addEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_consumeByCode);
         this._apiClient.invokeAPI(path,"GET",queryParams,null,headerParams,formParams,accept,contentType,authNames);
      }
      
      public function onSuccess_consumeByCode(e:ApiClientEvent) : void
      {
         e.stopImmediatePropagation();
         this._apiClient.removeEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_consumeByCode);
         this._apiClient.deserialize(e.result,this._returnObjectType);
         this._returnObjectType = "";
      }
      
      public function consumeByIdApiCall(lang:String, id:Number, gameId:Number) : void
      {
         if(!verifyParam(lang))
         {
            throw new ApiError(400,"Missing the required parameter \'lang\' when calling consumeById");
         }
         if(!verifyParam(id))
         {
            throw new ApiError(400,"Missing the required parameter \'id\' when calling consumeById");
         }
         if(!verifyParam(gameId))
         {
            throw new ApiError(400,"Missing the required parameter \'gameId\' when calling consumeById");
         }
         var path:String = "/Kard/ConsumeById".replace(/\{format\}/g,"json");
         var queryParams:Dictionary = new Dictionary();
         var headerParams:Dictionary = new Dictionary();
         var formParams:Dictionary = new Dictionary();
         if(verifyParam(lang))
         {
            queryParams["lang"] = this._apiClient.parameterToString(lang);
         }
         if(verifyParam(id))
         {
            queryParams["id"] = this._apiClient.parameterToString(id);
         }
         if(verifyParam(gameId))
         {
            queryParams["game_id"] = this._apiClient.parameterToString(gameId);
         }
         var accepts:Array = new Array();
         var accept:String = this._apiClient.selectHeaderAccept(accepts);
         var contentTypes:Array = new Array();
         var contentType:String = this._apiClient.selectHeaderContentType(contentTypes);
         var authNames:Array = new Array("AuthAnkamaApiKey");
         var forceImport_Array:Array = undefined;
         this._returnObjectType = "com.ankama.codegen.client.model.KardKard";
         this._apiClient.addEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_consumeById);
         this._apiClient.invokeAPI(path,"GET",queryParams,null,headerParams,formParams,accept,contentType,authNames);
      }
      
      public function onSuccess_consumeById(e:ApiClientEvent) : void
      {
         e.stopImmediatePropagation();
         this._apiClient.removeEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_consumeById);
         this._apiClient.deserialize(e.result,this._returnObjectType);
         this._returnObjectType = "";
      }
      
      public function consumeByOrderIdApiCall(lang:String, orderId:Number) : void
      {
         if(!verifyParam(lang))
         {
            throw new ApiError(400,"Missing the required parameter \'lang\' when calling consumeByOrderId");
         }
         if(!verifyParam(orderId))
         {
            throw new ApiError(400,"Missing the required parameter \'orderId\' when calling consumeByOrderId");
         }
         var path:String = "/Kard/ConsumeByOrderId".replace(/\{format\}/g,"json");
         var queryParams:Dictionary = new Dictionary();
         var headerParams:Dictionary = new Dictionary();
         var formParams:Dictionary = new Dictionary();
         if(verifyParam(lang))
         {
            queryParams["lang"] = this._apiClient.parameterToString(lang);
         }
         if(verifyParam(orderId))
         {
            queryParams["order_id"] = this._apiClient.parameterToString(orderId);
         }
         var accepts:Array = new Array();
         var accept:String = this._apiClient.selectHeaderAccept(accepts);
         var contentTypes:Array = new Array();
         var contentType:String = this._apiClient.selectHeaderContentType(contentTypes);
         var authNames:Array = new Array("AuthAnkamaApiKey");
         var forceImport_Array:Array = undefined;
         this._returnObjectType = "com.ankama.codegen.client.model.KardKard";
         this._apiClient.addEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_consumeByOrderId);
         this._apiClient.invokeAPI(path,"GET",queryParams,null,headerParams,formParams,accept,contentType,authNames);
      }
      
      public function onSuccess_consumeByOrderId(e:ApiClientEvent) : void
      {
         e.stopImmediatePropagation();
         this._apiClient.removeEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_consumeByOrderId);
         this._apiClient.deserialize(e.result,this._returnObjectType);
         this._returnObjectType = "";
      }
      
      public function getByAccountIdApiCall(accountId:Number, lang:String, collectionId:Number) : void
      {
         if(!verifyParam(accountId))
         {
            throw new ApiError(400,"Missing the required parameter \'accountId\' when calling getByAccountId");
         }
         if(!verifyParam(lang))
         {
            throw new ApiError(400,"Missing the required parameter \'lang\' when calling getByAccountId");
         }
         var path:String = "/Kard/GetByAccountId".replace(/\{format\}/g,"json");
         var queryParams:Dictionary = new Dictionary();
         var headerParams:Dictionary = new Dictionary();
         var formParams:Dictionary = new Dictionary();
         if(verifyParam(accountId))
         {
            queryParams["account_id"] = this._apiClient.parameterToString(accountId);
         }
         if(verifyParam(lang))
         {
            queryParams["lang"] = this._apiClient.parameterToString(lang);
         }
         if(verifyParam(collectionId))
         {
            queryParams["collection_id"] = this._apiClient.parameterToString(collectionId);
         }
         var accepts:Array = new Array();
         var accept:String = this._apiClient.selectHeaderAccept(accepts);
         var contentTypes:Array = new Array();
         var contentType:String = this._apiClient.selectHeaderContentType(contentTypes);
         var authNames:Array = new Array("AuthPassword");
         var forceImport_Array:Array = undefined;
         this._returnObjectType = "com.ankama.codegen.client.model.KardKardStock";
         this._apiClient.addEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_getByAccountId);
         this._apiClient.invokeAPI(path,"GET",queryParams,null,headerParams,formParams,accept,contentType,authNames);
      }
      
      public function onSuccess_getByAccountId(e:ApiClientEvent) : void
      {
         e.stopImmediatePropagation();
         this._apiClient.removeEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_getByAccountId);
         this._apiClient.deserialize(e.result,this._returnObjectType);
         this._returnObjectType = "";
      }
   }
}
