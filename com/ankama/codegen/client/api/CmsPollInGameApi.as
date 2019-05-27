package com.ankama.codegen.client.api
{
   import com.ankama.codegen.client.api.event.ApiClientEvent;
   import flash.utils.Dictionary;
   
   public class CmsPollInGameApi
   {
       
      
      private var forceImportModelList:ModelList = null;
      
      private var _apiClient:ApiClient;
      
      private var _returnObjectType:String;
      
      public function CmsPollInGameApi(apiClient:ApiClient)
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
      
      public function getApiCall(site:String, lang:String, page:Number, count:Number) : void
      {
         if(!verifyParam(site))
         {
            throw new ApiError(400,"Missing the required parameter \'site\' when calling get");
         }
         if(!verifyParam(lang))
         {
            throw new ApiError(400,"Missing the required parameter \'lang\' when calling get");
         }
         if(!verifyParam(page))
         {
            throw new ApiError(400,"Missing the required parameter \'page\' when calling get");
         }
         if(!verifyParam(count))
         {
            throw new ApiError(400,"Missing the required parameter \'count\' when calling get");
         }
         var path:String = "/Cms/PollInGame/Get".replace(/\{format\}/g,"json");
         var queryParams:Dictionary = new Dictionary();
         var headerParams:Dictionary = new Dictionary();
         var formParams:Dictionary = new Dictionary();
         if(verifyParam(site))
         {
            queryParams["site"] = this._apiClient.parameterToString(site);
         }
         if(verifyParam(lang))
         {
            queryParams["lang"] = this._apiClient.parameterToString(lang);
         }
         if(verifyParam(page))
         {
            queryParams["page"] = this._apiClient.parameterToString(page);
         }
         if(verifyParam(count))
         {
            queryParams["count"] = this._apiClient.parameterToString(count);
         }
         var accepts:Array = new Array();
         var accept:String = this._apiClient.selectHeaderAccept(accepts);
         var contentTypes:Array = new Array();
         var contentType:String = this._apiClient.selectHeaderContentType(contentTypes);
         var authNames:Array = new Array("AuthAnkamaApiKey");
         var forceImport_Array:Array = undefined;
         this._returnObjectType = "com.ankama.codegen.client.model.CmsPollInGame";
         this._apiClient.addEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_get);
         this._apiClient.invokeAPI(path,"GET",queryParams,null,headerParams,formParams,accept,contentType,authNames);
      }
      
      public function onSuccess_get(e:ApiClientEvent) : void
      {
         e.stopImmediatePropagation();
         this._apiClient.removeEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_get);
         this._apiClient.deserialize(e.result,this._returnObjectType);
         this._returnObjectType = "";
      }
      
      public function markAsReadApiCall(item:Number) : void
      {
         if(!verifyParam(item))
         {
            throw new ApiError(400,"Missing the required parameter \'item\' when calling markAsRead");
         }
         var path:String = "/Cms/PollInGame/MarkAsRead".replace(/\{format\}/g,"json");
         var queryParams:Dictionary = new Dictionary();
         var headerParams:Dictionary = new Dictionary();
         var formParams:Dictionary = new Dictionary();
         if(verifyParam(item))
         {
            queryParams["item"] = this._apiClient.parameterToString(item);
         }
         var accepts:Array = new Array();
         var accept:String = this._apiClient.selectHeaderAccept(accepts);
         var contentTypes:Array = new Array();
         var contentType:String = this._apiClient.selectHeaderContentType(contentTypes);
         var authNames:Array = new Array("AuthAnkamaApiKey");
         var forceImport_Boolean:Boolean = undefined;
         this._returnObjectType = "com.ankama.codegen.client.model.Boolean";
         this._apiClient.addEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_markAsRead);
         this._apiClient.invokeAPI(path,"GET",queryParams,null,headerParams,formParams,accept,contentType,authNames);
      }
      
      public function onSuccess_markAsRead(e:ApiClientEvent) : void
      {
         e.stopImmediatePropagation();
         this._apiClient.removeEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_markAsRead);
         this._apiClient.deserialize(e.result,this._returnObjectType);
         this._returnObjectType = "";
      }
   }
}
