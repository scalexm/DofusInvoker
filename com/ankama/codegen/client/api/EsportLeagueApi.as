package com.ankama.codegen.client.api
{
   import com.ankama.codegen.client.api.event.ApiClientEvent;
   import com.ankama.codegen.client.model.EsportModelLeague;
   import flash.utils.Dictionary;
   
   public class EsportLeagueApi
   {
       
      
      private var forceImportModelList:ModelList = null;
      
      private var _apiClient:ApiClient;
      
      private var _returnObjectType:String;
      
      public function EsportLeagueApi(apiClient:ApiClient)
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
      
      public function deleteLeagueApiCall(leagueId:Number) : void
      {
         if(!verifyParam(leagueId))
         {
            throw new ApiError(400,"Missing the required parameter \'leagueId\' when calling deleteLeague");
         }
         var path:String = "/Esport/League/DeleteLeague".replace(/\{format\}/g,"json");
         var queryParams:Dictionary = new Dictionary();
         var headerParams:Dictionary = new Dictionary();
         var formParams:Dictionary = new Dictionary();
         var accepts:Array = new Array();
         var accept:String = this._apiClient.selectHeaderAccept(accepts);
         var contentTypes:Array = new Array("application/x-www-form-urlencoded");
         var contentType:String = this._apiClient.selectHeaderContentType(contentTypes);
         if(verifyParam(leagueId))
         {
            formParams["leagueId"] = this._apiClient.parameterToString(leagueId);
         }
         var authNames:Array = new Array("AuthPassword");
         this._returnObjectType = "null";
         this._apiClient.addEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_deleteLeague);
         this._apiClient.invokeAPI(path,"POST",queryParams,null,headerParams,formParams,accept,contentType,authNames);
      }
      
      public function onSuccess_deleteLeague(e:ApiClientEvent) : void
      {
         e.stopImmediatePropagation();
         this._apiClient.removeEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_deleteLeague);
         this._apiClient.deserialize(e.result,this._returnObjectType);
         this._returnObjectType = "";
      }
      
      public function getLeagueApiCall(leagueId:Number) : void
      {
         if(!verifyParam(leagueId))
         {
            throw new ApiError(400,"Missing the required parameter \'leagueId\' when calling getLeague");
         }
         var path:String = "/Esport/League/GetLeague".replace(/\{format\}/g,"json");
         var queryParams:Dictionary = new Dictionary();
         var headerParams:Dictionary = new Dictionary();
         var formParams:Dictionary = new Dictionary();
         if(verifyParam(leagueId))
         {
            queryParams["leagueId"] = this._apiClient.parameterToString(leagueId);
         }
         var accepts:Array = new Array();
         var accept:String = this._apiClient.selectHeaderAccept(accepts);
         var contentTypes:Array = new Array();
         var contentType:String = this._apiClient.selectHeaderContentType(contentTypes);
         var authNames:Array = new Array();
         var forceImport_EsportModelLeague:EsportModelLeague = undefined;
         this._returnObjectType = "com.ankama.codegen.client.model.EsportModelLeague";
         this._apiClient.addEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_getLeague);
         this._apiClient.invokeAPI(path,"GET",queryParams,null,headerParams,formParams,accept,contentType,authNames);
      }
      
      public function onSuccess_getLeague(e:ApiClientEvent) : void
      {
         e.stopImmediatePropagation();
         this._apiClient.removeEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_getLeague);
         this._apiClient.deserialize(e.result,this._returnObjectType);
         this._returnObjectType = "";
      }
      
      public function getLeaguesApiCall(visible:Boolean) : void
      {
         var path:String = "/Esport/League/GetLeagues".replace(/\{format\}/g,"json");
         var queryParams:Dictionary = new Dictionary();
         var headerParams:Dictionary = new Dictionary();
         var formParams:Dictionary = new Dictionary();
         if(verifyParam(visible))
         {
            queryParams["visible"] = this._apiClient.parameterToString(visible);
         }
         var accepts:Array = new Array();
         var accept:String = this._apiClient.selectHeaderAccept(accepts);
         var contentTypes:Array = new Array();
         var contentType:String = this._apiClient.selectHeaderContentType(contentTypes);
         var authNames:Array = new Array();
         var forceImport_Array:Array = undefined;
         this._returnObjectType = "com.ankama.codegen.client.model.EsportModelLeague";
         this._apiClient.addEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_getLeagues);
         this._apiClient.invokeAPI(path,"GET",queryParams,null,headerParams,formParams,accept,contentType,authNames);
      }
      
      public function onSuccess_getLeagues(e:ApiClientEvent) : void
      {
         e.stopImmediatePropagation();
         this._apiClient.removeEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_getLeagues);
         this._apiClient.deserialize(e.result,this._returnObjectType);
         this._returnObjectType = "";
      }
      
      public function patchLeagueApiCall(leagueId:Number, name:String, visible:Boolean, current:Boolean) : void
      {
         if(!verifyParam(leagueId))
         {
            throw new ApiError(400,"Missing the required parameter \'leagueId\' when calling patchLeague");
         }
         if(!verifyParam(name))
         {
            throw new ApiError(400,"Missing the required parameter \'name\' when calling patchLeague");
         }
         if(!verifyParam(visible))
         {
            throw new ApiError(400,"Missing the required parameter \'visible\' when calling patchLeague");
         }
         if(!verifyParam(current))
         {
            throw new ApiError(400,"Missing the required parameter \'current\' when calling patchLeague");
         }
         var path:String = "/Esport/League/PatchLeague".replace(/\{format\}/g,"json");
         var queryParams:Dictionary = new Dictionary();
         var headerParams:Dictionary = new Dictionary();
         var formParams:Dictionary = new Dictionary();
         var accepts:Array = new Array();
         var accept:String = this._apiClient.selectHeaderAccept(accepts);
         var contentTypes:Array = new Array("application/x-www-form-urlencoded");
         var contentType:String = this._apiClient.selectHeaderContentType(contentTypes);
         if(verifyParam(leagueId))
         {
            formParams["leagueId"] = this._apiClient.parameterToString(leagueId);
         }
         if(verifyParam(name))
         {
            formParams["name"] = this._apiClient.parameterToString(name);
         }
         if(verifyParam(visible))
         {
            formParams["visible"] = this._apiClient.parameterToString(visible);
         }
         if(verifyParam(current))
         {
            formParams["current"] = this._apiClient.parameterToString(current);
         }
         var authNames:Array = new Array("AuthPassword");
         var forceImport_EsportModelLeague:EsportModelLeague = undefined;
         this._returnObjectType = "com.ankama.codegen.client.model.EsportModelLeague";
         this._apiClient.addEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_patchLeague);
         this._apiClient.invokeAPI(path,"POST",queryParams,null,headerParams,formParams,accept,contentType,authNames);
      }
      
      public function onSuccess_patchLeague(e:ApiClientEvent) : void
      {
         e.stopImmediatePropagation();
         this._apiClient.removeEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_patchLeague);
         this._apiClient.deserialize(e.result,this._returnObjectType);
         this._returnObjectType = "";
      }
      
      public function postLeagueApiCall(name:String, visible:Boolean, current:Boolean) : void
      {
         if(!verifyParam(name))
         {
            throw new ApiError(400,"Missing the required parameter \'name\' when calling postLeague");
         }
         if(!verifyParam(visible))
         {
            throw new ApiError(400,"Missing the required parameter \'visible\' when calling postLeague");
         }
         if(!verifyParam(current))
         {
            throw new ApiError(400,"Missing the required parameter \'current\' when calling postLeague");
         }
         var path:String = "/Esport/League/PostLeague".replace(/\{format\}/g,"json");
         var queryParams:Dictionary = new Dictionary();
         var headerParams:Dictionary = new Dictionary();
         var formParams:Dictionary = new Dictionary();
         var accepts:Array = new Array();
         var accept:String = this._apiClient.selectHeaderAccept(accepts);
         var contentTypes:Array = new Array("application/x-www-form-urlencoded");
         var contentType:String = this._apiClient.selectHeaderContentType(contentTypes);
         if(verifyParam(name))
         {
            formParams["name"] = this._apiClient.parameterToString(name);
         }
         if(verifyParam(visible))
         {
            formParams["visible"] = this._apiClient.parameterToString(visible);
         }
         if(verifyParam(current))
         {
            formParams["current"] = this._apiClient.parameterToString(current);
         }
         var authNames:Array = new Array("AuthPassword");
         var forceImport_EsportModelLeague:EsportModelLeague = undefined;
         this._returnObjectType = "com.ankama.codegen.client.model.EsportModelLeague";
         this._apiClient.addEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_postLeague);
         this._apiClient.invokeAPI(path,"POST",queryParams,null,headerParams,formParams,accept,contentType,authNames);
      }
      
      public function onSuccess_postLeague(e:ApiClientEvent) : void
      {
         e.stopImmediatePropagation();
         this._apiClient.removeEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_postLeague);
         this._apiClient.deserialize(e.result,this._returnObjectType);
         this._returnObjectType = "";
      }
      
      public function putLeagueApiCall(leagueId:Number, name:String, visible:Boolean, current:Boolean) : void
      {
         if(!verifyParam(leagueId))
         {
            throw new ApiError(400,"Missing the required parameter \'leagueId\' when calling putLeague");
         }
         if(!verifyParam(name))
         {
            throw new ApiError(400,"Missing the required parameter \'name\' when calling putLeague");
         }
         if(!verifyParam(visible))
         {
            throw new ApiError(400,"Missing the required parameter \'visible\' when calling putLeague");
         }
         if(!verifyParam(current))
         {
            throw new ApiError(400,"Missing the required parameter \'current\' when calling putLeague");
         }
         var path:String = "/Esport/League/PutLeague".replace(/\{format\}/g,"json");
         var queryParams:Dictionary = new Dictionary();
         var headerParams:Dictionary = new Dictionary();
         var formParams:Dictionary = new Dictionary();
         var accepts:Array = new Array();
         var accept:String = this._apiClient.selectHeaderAccept(accepts);
         var contentTypes:Array = new Array("application/x-www-form-urlencoded");
         var contentType:String = this._apiClient.selectHeaderContentType(contentTypes);
         if(verifyParam(leagueId))
         {
            formParams["leagueId"] = this._apiClient.parameterToString(leagueId);
         }
         if(verifyParam(name))
         {
            formParams["name"] = this._apiClient.parameterToString(name);
         }
         if(verifyParam(visible))
         {
            formParams["visible"] = this._apiClient.parameterToString(visible);
         }
         if(verifyParam(current))
         {
            formParams["current"] = this._apiClient.parameterToString(current);
         }
         var authNames:Array = new Array("AuthPassword");
         var forceImport_EsportModelLeague:EsportModelLeague = undefined;
         this._returnObjectType = "com.ankama.codegen.client.model.EsportModelLeague";
         this._apiClient.addEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_putLeague);
         this._apiClient.invokeAPI(path,"POST",queryParams,null,headerParams,formParams,accept,contentType,authNames);
      }
      
      public function onSuccess_putLeague(e:ApiClientEvent) : void
      {
         e.stopImmediatePropagation();
         this._apiClient.removeEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_putLeague);
         this._apiClient.deserialize(e.result,this._returnObjectType);
         this._returnObjectType = "";
      }
   }
}
