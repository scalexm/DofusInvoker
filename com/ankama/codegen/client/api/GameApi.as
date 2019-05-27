package com.ankama.codegen.client.api
{
   import com.ankama.codegen.client.api.event.ApiClientEvent;
   import com.ankama.codegen.client.model.GameAdminRightResponse;
   import com.ankama.codegen.client.model.GameAdminRightWithApiKeyResponse;
   import flash.utils.Dictionary;
   
   public class GameApi
   {
       
      
      private var forceImportModelList:ModelList = null;
      
      private var _apiClient:ApiClient;
      
      private var _returnObjectType:String;
      
      public function GameApi(apiClient:ApiClient)
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
      
      public function adminRightApiCall(game:Number, account:Number, server:Number) : void
      {
         if(!verifyParam(game))
         {
            throw new ApiError(400,"Missing the required parameter \'game\' when calling adminRight");
         }
         if(!verifyParam(account))
         {
            throw new ApiError(400,"Missing the required parameter \'account\' when calling adminRight");
         }
         var path:String = "/Game/AdminRight".replace(/\{format\}/g,"json");
         var queryParams:Dictionary = new Dictionary();
         var headerParams:Dictionary = new Dictionary();
         var formParams:Dictionary = new Dictionary();
         var accepts:Array = new Array();
         var accept:String = this._apiClient.selectHeaderAccept(accepts);
         var contentTypes:Array = new Array("application/x-www-form-urlencoded");
         var contentType:String = this._apiClient.selectHeaderContentType(contentTypes);
         if(verifyParam(game))
         {
            formParams["game"] = this._apiClient.parameterToString(game);
         }
         if(verifyParam(account))
         {
            formParams["account"] = this._apiClient.parameterToString(account);
         }
         if(verifyParam(server))
         {
            formParams["server"] = this._apiClient.parameterToString(server);
         }
         var authNames:Array = new Array("AuthPassword");
         var forceImport_GameAdminRightResponse:GameAdminRightResponse = undefined;
         this._returnObjectType = "com.ankama.codegen.client.model.GameAdminRightResponse";
         this._apiClient.addEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_adminRight);
         this._apiClient.invokeAPI(path,"POST",queryParams,null,headerParams,formParams,accept,contentType,authNames);
      }
      
      public function onSuccess_adminRight(e:ApiClientEvent) : void
      {
         e.stopImmediatePropagation();
         this._apiClient.removeEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_adminRight);
         this._apiClient.deserialize(e.result,this._returnObjectType);
         this._returnObjectType = "";
      }
      
      public function adminRightWithApiKeyApiCall(game:Number, server:Number) : void
      {
         if(!verifyParam(game))
         {
            throw new ApiError(400,"Missing the required parameter \'game\' when calling adminRightWithApiKey");
         }
         var path:String = "/Game/AdminRightWithApiKey".replace(/\{format\}/g,"json");
         var queryParams:Dictionary = new Dictionary();
         var headerParams:Dictionary = new Dictionary();
         var formParams:Dictionary = new Dictionary();
         var accepts:Array = new Array();
         var accept:String = this._apiClient.selectHeaderAccept(accepts);
         var contentTypes:Array = new Array("application/x-www-form-urlencoded");
         var contentType:String = this._apiClient.selectHeaderContentType(contentTypes);
         if(verifyParam(game))
         {
            formParams["game"] = this._apiClient.parameterToString(game);
         }
         if(verifyParam(server))
         {
            formParams["server"] = this._apiClient.parameterToString(server);
         }
         var authNames:Array = new Array("AuthAnkamaApiKey");
         var forceImport_GameAdminRightWithApiKeyResponse:GameAdminRightWithApiKeyResponse = undefined;
         this._returnObjectType = "com.ankama.codegen.client.model.GameAdminRightWithApiKeyResponse";
         this._apiClient.addEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_adminRightWithApiKey);
         this._apiClient.invokeAPI(path,"POST",queryParams,null,headerParams,formParams,accept,contentType,authNames);
      }
      
      public function onSuccess_adminRightWithApiKey(e:ApiClientEvent) : void
      {
         e.stopImmediatePropagation();
         this._apiClient.removeEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_adminRightWithApiKey);
         this._apiClient.deserialize(e.result,this._returnObjectType);
         this._returnObjectType = "";
      }
      
      public function endSessionApiCall(sessionId:Number, subscriber:Boolean) : void
      {
         if(!verifyParam(sessionId))
         {
            throw new ApiError(400,"Missing the required parameter \'sessionId\' when calling endSession");
         }
         var path:String = "/Game/EndSession".replace(/\{format\}/g,"json");
         var queryParams:Dictionary = new Dictionary();
         var headerParams:Dictionary = new Dictionary();
         var formParams:Dictionary = new Dictionary();
         if(verifyParam(sessionId))
         {
            queryParams["session_id"] = this._apiClient.parameterToString(sessionId);
         }
         if(verifyParam(subscriber))
         {
            queryParams["subscriber"] = this._apiClient.parameterToString(subscriber);
         }
         var accepts:Array = new Array();
         var accept:String = this._apiClient.selectHeaderAccept(accepts);
         var contentTypes:Array = new Array();
         var contentType:String = this._apiClient.selectHeaderContentType(contentTypes);
         var authNames:Array = new Array("AuthPassword");
         this._returnObjectType = "null";
         this._apiClient.addEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_endSession);
         this._apiClient.invokeAPI(path,"GET",queryParams,null,headerParams,formParams,accept,contentType,authNames);
      }
      
      public function onSuccess_endSession(e:ApiClientEvent) : void
      {
         e.stopImmediatePropagation();
         this._apiClient.removeEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_endSession);
         this._apiClient.deserialize(e.result,this._returnObjectType);
         this._returnObjectType = "";
      }
      
      public function endSessionWithApiKeyApiCall(sessionId:Number, subscriber:Boolean, closeAccountSession:Boolean) : void
      {
         if(!verifyParam(sessionId))
         {
            throw new ApiError(400,"Missing the required parameter \'sessionId\' when calling endSessionWithApiKey");
         }
         var path:String = "/Game/EndSessionWithApiKey".replace(/\{format\}/g,"json");
         var queryParams:Dictionary = new Dictionary();
         var headerParams:Dictionary = new Dictionary();
         var formParams:Dictionary = new Dictionary();
         if(verifyParam(sessionId))
         {
            queryParams["session_id"] = this._apiClient.parameterToString(sessionId);
         }
         if(verifyParam(subscriber))
         {
            queryParams["subscriber"] = this._apiClient.parameterToString(subscriber);
         }
         if(verifyParam(closeAccountSession))
         {
            queryParams["close_account_session"] = this._apiClient.parameterToString(closeAccountSession);
         }
         var accepts:Array = new Array();
         var accept:String = this._apiClient.selectHeaderAccept(accepts);
         var contentTypes:Array = new Array();
         var contentType:String = this._apiClient.selectHeaderContentType(contentTypes);
         var authNames:Array = new Array("AuthAnkamaApiKey");
         this._returnObjectType = "null";
         this._apiClient.addEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_endSessionWithApiKey);
         this._apiClient.invokeAPI(path,"GET",queryParams,null,headerParams,formParams,accept,contentType,authNames);
      }
      
      public function onSuccess_endSessionWithApiKey(e:ApiClientEvent) : void
      {
         e.stopImmediatePropagation();
         this._apiClient.removeEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_endSessionWithApiKey);
         this._apiClient.deserialize(e.result,this._returnObjectType);
         this._returnObjectType = "";
      }
      
      public function gameFriendsApiCall(gameId:Number) : void
      {
         var path:String = "/Game/GameFriends".replace(/\{format\}/g,"json");
         var queryParams:Dictionary = new Dictionary();
         var headerParams:Dictionary = new Dictionary();
         var formParams:Dictionary = new Dictionary();
         var accepts:Array = new Array();
         var accept:String = this._apiClient.selectHeaderAccept(accepts);
         var contentTypes:Array = new Array("application/x-www-form-urlencoded");
         var contentType:String = this._apiClient.selectHeaderContentType(contentTypes);
         if(verifyParam(gameId))
         {
            formParams["game_id"] = this._apiClient.parameterToString(gameId);
         }
         var authNames:Array = new Array("AuthAnkamaApiKey");
         var forceImport_Array:Array = undefined;
         this._returnObjectType = "com.ankama.codegen.client.model.GameFriendModel";
         this._apiClient.addEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_gameFriends);
         this._apiClient.invokeAPI(path,"POST",queryParams,null,headerParams,formParams,accept,contentType,authNames);
      }
      
      public function onSuccess_gameFriends(e:ApiClientEvent) : void
      {
         e.stopImmediatePropagation();
         this._apiClient.removeEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_gameFriends);
         this._apiClient.deserialize(e.result,this._returnObjectType);
         this._returnObjectType = "";
      }
      
      public function gameRewardApiCall(account:Number, reward:String) : void
      {
         if(!verifyParam(account))
         {
            throw new ApiError(400,"Missing the required parameter \'account\' when calling gameReward");
         }
         if(!verifyParam(reward))
         {
            throw new ApiError(400,"Missing the required parameter \'reward\' when calling gameReward");
         }
         var path:String = "/Game/GameReward".replace(/\{format\}/g,"json");
         var queryParams:Dictionary = new Dictionary();
         var headerParams:Dictionary = new Dictionary();
         var formParams:Dictionary = new Dictionary();
         var accepts:Array = new Array();
         var accept:String = this._apiClient.selectHeaderAccept(accepts);
         var contentTypes:Array = new Array("application/x-www-form-urlencoded");
         var contentType:String = this._apiClient.selectHeaderContentType(contentTypes);
         if(verifyParam(account))
         {
            formParams["account"] = this._apiClient.parameterToString(account);
         }
         if(verifyParam(reward))
         {
            formParams["reward"] = this._apiClient.parameterToString(reward);
         }
         var authNames:Array = new Array("AuthPassword");
         this._returnObjectType = "null";
         this._apiClient.addEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_gameReward);
         this._apiClient.invokeAPI(path,"POST",queryParams,null,headerParams,formParams,accept,contentType,authNames);
      }
      
      public function onSuccess_gameReward(e:ApiClientEvent) : void
      {
         e.stopImmediatePropagation();
         this._apiClient.removeEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_gameReward);
         this._apiClient.deserialize(e.result,this._returnObjectType);
         this._returnObjectType = "";
      }
      
      public function requestBanApiCall(gameId:Number, serverId:Number, authorAccountId:Number, targetAccountId:Number, targetAccountCharacterId:Number, sanctionId:Number, authorAccountCharacterId:Number, locationId:Number, requestComment:String) : void
      {
         if(!verifyParam(gameId))
         {
            throw new ApiError(400,"Missing the required parameter \'gameId\' when calling requestBan");
         }
         if(!verifyParam(serverId))
         {
            throw new ApiError(400,"Missing the required parameter \'serverId\' when calling requestBan");
         }
         if(!verifyParam(authorAccountId))
         {
            throw new ApiError(400,"Missing the required parameter \'authorAccountId\' when calling requestBan");
         }
         if(!verifyParam(targetAccountId))
         {
            throw new ApiError(400,"Missing the required parameter \'targetAccountId\' when calling requestBan");
         }
         if(!verifyParam(targetAccountCharacterId))
         {
            throw new ApiError(400,"Missing the required parameter \'targetAccountCharacterId\' when calling requestBan");
         }
         if(!verifyParam(sanctionId))
         {
            throw new ApiError(400,"Missing the required parameter \'sanctionId\' when calling requestBan");
         }
         var path:String = "/Game/RequestBan".replace(/\{format\}/g,"json");
         var queryParams:Dictionary = new Dictionary();
         var headerParams:Dictionary = new Dictionary();
         var formParams:Dictionary = new Dictionary();
         var accepts:Array = new Array();
         var accept:String = this._apiClient.selectHeaderAccept(accepts);
         var contentTypes:Array = new Array("application/x-www-form-urlencoded");
         var contentType:String = this._apiClient.selectHeaderContentType(contentTypes);
         if(verifyParam(gameId))
         {
            formParams["game_id"] = this._apiClient.parameterToString(gameId);
         }
         if(verifyParam(serverId))
         {
            formParams["server_id"] = this._apiClient.parameterToString(serverId);
         }
         if(verifyParam(authorAccountId))
         {
            formParams["author_account_id"] = this._apiClient.parameterToString(authorAccountId);
         }
         if(verifyParam(authorAccountCharacterId))
         {
            formParams["author_account_character_id"] = this._apiClient.parameterToString(authorAccountCharacterId);
         }
         if(verifyParam(targetAccountId))
         {
            formParams["target_account_id"] = this._apiClient.parameterToString(targetAccountId);
         }
         if(verifyParam(targetAccountCharacterId))
         {
            formParams["target_account_character_id"] = this._apiClient.parameterToString(targetAccountCharacterId);
         }
         if(verifyParam(locationId))
         {
            formParams["location_id"] = this._apiClient.parameterToString(locationId);
         }
         if(verifyParam(sanctionId))
         {
            formParams["sanction_id"] = this._apiClient.parameterToString(sanctionId);
         }
         if(verifyParam(requestComment))
         {
            formParams["request_comment"] = this._apiClient.parameterToString(requestComment);
         }
         var authNames:Array = new Array("AuthPassword");
         this._returnObjectType = "null";
         this._apiClient.addEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_requestBan);
         this._apiClient.invokeAPI(path,"POST",queryParams,null,headerParams,formParams,accept,contentType,authNames);
      }
      
      public function onSuccess_requestBan(e:ApiClientEvent) : void
      {
         e.stopImmediatePropagation();
         this._apiClient.removeEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_requestBan);
         this._apiClient.deserialize(e.result,this._returnObjectType);
         this._returnObjectType = "";
      }
      
      public function sendEventApiCall(game:Number, sessionId:Number, eventId:Number, data:String, date:Date) : void
      {
         if(!verifyParam(game))
         {
            throw new ApiError(400,"Missing the required parameter \'game\' when calling sendEvent");
         }
         if(!verifyParam(sessionId))
         {
            throw new ApiError(400,"Missing the required parameter \'sessionId\' when calling sendEvent");
         }
         if(!verifyParam(eventId))
         {
            throw new ApiError(400,"Missing the required parameter \'eventId\' when calling sendEvent");
         }
         if(!verifyParam(data))
         {
            throw new ApiError(400,"Missing the required parameter \'data\' when calling sendEvent");
         }
         var path:String = "/Game/SendEvent".replace(/\{format\}/g,"json");
         var queryParams:Dictionary = new Dictionary();
         var headerParams:Dictionary = new Dictionary();
         var formParams:Dictionary = new Dictionary();
         var accepts:Array = new Array();
         var accept:String = this._apiClient.selectHeaderAccept(accepts);
         var contentTypes:Array = new Array("application/x-www-form-urlencoded");
         var contentType:String = this._apiClient.selectHeaderContentType(contentTypes);
         if(verifyParam(game))
         {
            formParams["game"] = this._apiClient.parameterToString(game);
         }
         if(verifyParam(sessionId))
         {
            formParams["session_id"] = this._apiClient.parameterToString(sessionId);
         }
         if(verifyParam(eventId))
         {
            formParams["event_id"] = this._apiClient.parameterToString(eventId);
         }
         if(verifyParam(data))
         {
            formParams["data"] = this._apiClient.parameterToString(data);
         }
         if(verifyParam(date))
         {
            formParams["date"] = this._apiClient.parameterToString(date);
         }
         var authNames:Array = new Array();
         var forceImport_Number:Number = undefined;
         this._returnObjectType = "com.ankama.codegen.client.model.Long";
         this._apiClient.addEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_sendEvent);
         this._apiClient.invokeAPI(path,"POST",queryParams,null,headerParams,formParams,accept,contentType,authNames);
      }
      
      public function onSuccess_sendEvent(e:ApiClientEvent) : void
      {
         e.stopImmediatePropagation();
         this._apiClient.removeEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_sendEvent);
         this._apiClient.deserialize(e.result,this._returnObjectType);
         this._returnObjectType = "";
      }
      
      public function sendEventsApiCall(game:Number, sessionId:Number, events:String) : void
      {
         if(!verifyParam(game))
         {
            throw new ApiError(400,"Missing the required parameter \'game\' when calling sendEvents");
         }
         if(!verifyParam(sessionId))
         {
            throw new ApiError(400,"Missing the required parameter \'sessionId\' when calling sendEvents");
         }
         if(!verifyParam(events))
         {
            throw new ApiError(400,"Missing the required parameter \'events\' when calling sendEvents");
         }
         var path:String = "/Game/SendEvents".replace(/\{format\}/g,"json");
         var queryParams:Dictionary = new Dictionary();
         var headerParams:Dictionary = new Dictionary();
         var formParams:Dictionary = new Dictionary();
         var accepts:Array = new Array();
         var accept:String = this._apiClient.selectHeaderAccept(accepts);
         var contentTypes:Array = new Array("application/x-www-form-urlencoded");
         var contentType:String = this._apiClient.selectHeaderContentType(contentTypes);
         if(verifyParam(game))
         {
            formParams["game"] = this._apiClient.parameterToString(game);
         }
         if(verifyParam(sessionId))
         {
            formParams["session_id"] = this._apiClient.parameterToString(sessionId);
         }
         if(verifyParam(events))
         {
            formParams["events"] = this._apiClient.parameterToString(events);
         }
         var authNames:Array = new Array();
         var forceImport_Number:Number = undefined;
         this._returnObjectType = "com.ankama.codegen.client.model.Long";
         this._apiClient.addEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_sendEvents);
         this._apiClient.invokeAPI(path,"POST",queryParams,null,headerParams,formParams,accept,contentType,authNames);
      }
      
      public function onSuccess_sendEvents(e:ApiClientEvent) : void
      {
         e.stopImmediatePropagation();
         this._apiClient.removeEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_sendEvents);
         this._apiClient.deserialize(e.result,this._returnObjectType);
         this._returnObjectType = "";
      }
      
      public function startSessionApiCall(sessionId:Number, serverId:Number, characterId:Number, date:Date, sessionIdString:String) : void
      {
         if(!verifyParam(sessionId))
         {
            throw new ApiError(400,"Missing the required parameter \'sessionId\' when calling startSession");
         }
         var path:String = "/Game/StartSession".replace(/\{format\}/g,"json");
         var queryParams:Dictionary = new Dictionary();
         var headerParams:Dictionary = new Dictionary();
         var formParams:Dictionary = new Dictionary();
         if(verifyParam(sessionId))
         {
            queryParams["session_id"] = this._apiClient.parameterToString(sessionId);
         }
         if(verifyParam(serverId))
         {
            queryParams["server_id"] = this._apiClient.parameterToString(serverId);
         }
         if(verifyParam(characterId))
         {
            queryParams["character_id"] = this._apiClient.parameterToString(characterId);
         }
         if(verifyParam(date))
         {
            queryParams["date"] = this._apiClient.parameterToString(date);
         }
         if(verifyParam(sessionIdString))
         {
            queryParams["session_id_string"] = this._apiClient.parameterToString(sessionIdString);
         }
         var accepts:Array = new Array();
         var accept:String = this._apiClient.selectHeaderAccept(accepts);
         var contentTypes:Array = new Array();
         var contentType:String = this._apiClient.selectHeaderContentType(contentTypes);
         var authNames:Array = new Array("AuthPassword");
         var forceImport_Number:Number = undefined;
         this._returnObjectType = "com.ankama.codegen.client.model.Long";
         this._apiClient.addEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_startSession);
         this._apiClient.invokeAPI(path,"GET",queryParams,null,headerParams,formParams,accept,contentType,authNames);
      }
      
      public function onSuccess_startSession(e:ApiClientEvent) : void
      {
         e.stopImmediatePropagation();
         this._apiClient.removeEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_startSession);
         this._apiClient.deserialize(e.result,this._returnObjectType);
         this._returnObjectType = "";
      }
      
      public function startSessionWithApiKeyApiCall(sessionId:Number, serverId:Number, characterId:Number, date:Date, sessionIdString:String) : void
      {
         if(!verifyParam(sessionId))
         {
            throw new ApiError(400,"Missing the required parameter \'sessionId\' when calling startSessionWithApiKey");
         }
         var path:String = "/Game/StartSessionWithApiKey".replace(/\{format\}/g,"json");
         var queryParams:Dictionary = new Dictionary();
         var headerParams:Dictionary = new Dictionary();
         var formParams:Dictionary = new Dictionary();
         if(verifyParam(sessionId))
         {
            queryParams["session_id"] = this._apiClient.parameterToString(sessionId);
         }
         if(verifyParam(serverId))
         {
            queryParams["server_id"] = this._apiClient.parameterToString(serverId);
         }
         if(verifyParam(characterId))
         {
            queryParams["character_id"] = this._apiClient.parameterToString(characterId);
         }
         if(verifyParam(date))
         {
            queryParams["date"] = this._apiClient.parameterToString(date);
         }
         if(verifyParam(sessionIdString))
         {
            queryParams["session_id_string"] = this._apiClient.parameterToString(sessionIdString);
         }
         var accepts:Array = new Array();
         var accept:String = this._apiClient.selectHeaderAccept(accepts);
         var contentTypes:Array = new Array();
         var contentType:String = this._apiClient.selectHeaderContentType(contentTypes);
         var authNames:Array = new Array("AuthAnkamaApiKey");
         var forceImport_Number:Number = undefined;
         this._returnObjectType = "com.ankama.codegen.client.model.Long";
         this._apiClient.addEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_startSessionWithApiKey);
         this._apiClient.invokeAPI(path,"GET",queryParams,null,headerParams,formParams,accept,contentType,authNames);
      }
      
      public function onSuccess_startSessionWithApiKey(e:ApiClientEvent) : void
      {
         e.stopImmediatePropagation();
         this._apiClient.removeEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_startSessionWithApiKey);
         this._apiClient.deserialize(e.result,this._returnObjectType);
         this._returnObjectType = "";
      }
      
      public function unrequestBanApiCall(gameId:Number, serverId:Number, authorAccountId:Number, targetAccountId:Number, authorAccountCharacterId:Number, targetAccountCharacterId:Number) : void
      {
         if(!verifyParam(gameId))
         {
            throw new ApiError(400,"Missing the required parameter \'gameId\' when calling unrequestBan");
         }
         if(!verifyParam(serverId))
         {
            throw new ApiError(400,"Missing the required parameter \'serverId\' when calling unrequestBan");
         }
         if(!verifyParam(authorAccountId))
         {
            throw new ApiError(400,"Missing the required parameter \'authorAccountId\' when calling unrequestBan");
         }
         if(!verifyParam(targetAccountId))
         {
            throw new ApiError(400,"Missing the required parameter \'targetAccountId\' when calling unrequestBan");
         }
         var path:String = "/Game/UnrequestBan".replace(/\{format\}/g,"json");
         var queryParams:Dictionary = new Dictionary();
         var headerParams:Dictionary = new Dictionary();
         var formParams:Dictionary = new Dictionary();
         var accepts:Array = new Array();
         var accept:String = this._apiClient.selectHeaderAccept(accepts);
         var contentTypes:Array = new Array("application/x-www-form-urlencoded");
         var contentType:String = this._apiClient.selectHeaderContentType(contentTypes);
         if(verifyParam(gameId))
         {
            formParams["game_id"] = this._apiClient.parameterToString(gameId);
         }
         if(verifyParam(serverId))
         {
            formParams["server_id"] = this._apiClient.parameterToString(serverId);
         }
         if(verifyParam(authorAccountId))
         {
            formParams["author_account_id"] = this._apiClient.parameterToString(authorAccountId);
         }
         if(verifyParam(targetAccountId))
         {
            formParams["target_account_id"] = this._apiClient.parameterToString(targetAccountId);
         }
         if(verifyParam(authorAccountCharacterId))
         {
            formParams["author_account_character_id"] = this._apiClient.parameterToString(authorAccountCharacterId);
         }
         if(verifyParam(targetAccountCharacterId))
         {
            formParams["target_account_character_id"] = this._apiClient.parameterToString(targetAccountCharacterId);
         }
         var authNames:Array = new Array("AuthPassword");
         this._returnObjectType = "null";
         this._apiClient.addEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_unrequestBan);
         this._apiClient.invokeAPI(path,"POST",queryParams,null,headerParams,formParams,accept,contentType,authNames);
      }
      
      public function onSuccess_unrequestBan(e:ApiClientEvent) : void
      {
         e.stopImmediatePropagation();
         this._apiClient.removeEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_unrequestBan);
         this._apiClient.deserialize(e.result,this._returnObjectType);
         this._returnObjectType = "";
      }
   }
}
