package com.ankama.codegen.client.api
{
   import com.ankama.codegen.client.api.event.ApiClientEvent;
   import com.ankama.codegen.client.model.EsportModelMatch;
   import flash.utils.Dictionary;
   
   public class EsportMatchApi
   {
       
      
      private var forceImportModelList:ModelList = null;
      
      private var _apiClient:ApiClient;
      
      private var _returnObjectType:String;
      
      public function EsportMatchApi(apiClient:ApiClient)
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
      
      public function deleteMatchApiCall(matchId:Number) : void
      {
         if(!verifyParam(matchId))
         {
            throw new ApiError(400,"Missing the required parameter \'matchId\' when calling deleteMatch");
         }
         var path:String = "/Esport/Match/DeleteMatch".replace(/\{format\}/g,"json");
         var queryParams:Dictionary = new Dictionary();
         var headerParams:Dictionary = new Dictionary();
         var formParams:Dictionary = new Dictionary();
         var accepts:Array = new Array();
         var accept:String = this._apiClient.selectHeaderAccept(accepts);
         var contentTypes:Array = new Array("application/x-www-form-urlencoded");
         var contentType:String = this._apiClient.selectHeaderContentType(contentTypes);
         if(verifyParam(matchId))
         {
            formParams["matchId"] = this._apiClient.parameterToString(matchId);
         }
         var authNames:Array = new Array("AuthPassword");
         this._returnObjectType = "null";
         this._apiClient.addEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_deleteMatch);
         this._apiClient.invokeAPI(path,"POST",queryParams,null,headerParams,formParams,accept,contentType,authNames);
      }
      
      public function onSuccess_deleteMatch(e:ApiClientEvent) : void
      {
         e.stopImmediatePropagation();
         this._apiClient.removeEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_deleteMatch);
         this._apiClient.deserialize(e.result,this._returnObjectType);
         this._returnObjectType = "";
      }
      
      public function generateTreeApiCall(seasonId:Number, nbTeam:Number) : void
      {
         if(!verifyParam(seasonId))
         {
            throw new ApiError(400,"Missing the required parameter \'seasonId\' when calling generateTree");
         }
         if(!verifyParam(nbTeam))
         {
            throw new ApiError(400,"Missing the required parameter \'nbTeam\' when calling generateTree");
         }
         var path:String = "/Esport/Match/GenerateTree".replace(/\{format\}/g,"json");
         var queryParams:Dictionary = new Dictionary();
         var headerParams:Dictionary = new Dictionary();
         var formParams:Dictionary = new Dictionary();
         var accepts:Array = new Array();
         var accept:String = this._apiClient.selectHeaderAccept(accepts);
         var contentTypes:Array = new Array("application/x-www-form-urlencoded");
         var contentType:String = this._apiClient.selectHeaderContentType(contentTypes);
         if(verifyParam(seasonId))
         {
            formParams["seasonId"] = this._apiClient.parameterToString(seasonId);
         }
         if(verifyParam(nbTeam))
         {
            formParams["nbTeam"] = this._apiClient.parameterToString(nbTeam);
         }
         var authNames:Array = new Array("AuthPassword");
         var forceImport_Array:Array = undefined;
         this._returnObjectType = "com.ankama.codegen.client.model.EsportModelMatch";
         this._apiClient.addEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_generateTree);
         this._apiClient.invokeAPI(path,"POST",queryParams,null,headerParams,formParams,accept,contentType,authNames);
      }
      
      public function onSuccess_generateTree(e:ApiClientEvent) : void
      {
         e.stopImmediatePropagation();
         this._apiClient.removeEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_generateTree);
         this._apiClient.deserialize(e.result,this._returnObjectType);
         this._returnObjectType = "";
      }
      
      public function getLastMatchesBySeasonApiCall(seasonId:Number, teamId:Number, limit:Number, locale:String) : void
      {
         if(!verifyParam(seasonId))
         {
            throw new ApiError(400,"Missing the required parameter \'seasonId\' when calling getLastMatchesBySeason");
         }
         var path:String = "/Esport/Match/GetLastMatchesBySeason".replace(/\{format\}/g,"json");
         var queryParams:Dictionary = new Dictionary();
         var headerParams:Dictionary = new Dictionary();
         var formParams:Dictionary = new Dictionary();
         if(verifyParam(seasonId))
         {
            queryParams["seasonId"] = this._apiClient.parameterToString(seasonId);
         }
         if(verifyParam(teamId))
         {
            queryParams["teamId"] = this._apiClient.parameterToString(teamId);
         }
         if(verifyParam(limit))
         {
            queryParams["limit"] = this._apiClient.parameterToString(limit);
         }
         if(verifyParam(locale))
         {
            queryParams["_locale"] = this._apiClient.parameterToString(locale);
         }
         var accepts:Array = new Array();
         var accept:String = this._apiClient.selectHeaderAccept(accepts);
         var contentTypes:Array = new Array();
         var contentType:String = this._apiClient.selectHeaderContentType(contentTypes);
         var authNames:Array = new Array();
         var forceImport_Array:Array = undefined;
         this._returnObjectType = "com.ankama.codegen.client.model.EsportModelMatch";
         this._apiClient.addEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_getLastMatchesBySeason);
         this._apiClient.invokeAPI(path,"GET",queryParams,null,headerParams,formParams,accept,contentType,authNames);
      }
      
      public function onSuccess_getLastMatchesBySeason(e:ApiClientEvent) : void
      {
         e.stopImmediatePropagation();
         this._apiClient.removeEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_getLastMatchesBySeason);
         this._apiClient.deserialize(e.result,this._returnObjectType);
         this._returnObjectType = "";
      }
      
      public function getMatchApiCall(matchId:Number, locale:String) : void
      {
         if(!verifyParam(matchId))
         {
            throw new ApiError(400,"Missing the required parameter \'matchId\' when calling getMatch");
         }
         var path:String = "/Esport/Match/GetMatch".replace(/\{format\}/g,"json");
         var queryParams:Dictionary = new Dictionary();
         var headerParams:Dictionary = new Dictionary();
         var formParams:Dictionary = new Dictionary();
         if(verifyParam(matchId))
         {
            queryParams["matchId"] = this._apiClient.parameterToString(matchId);
         }
         if(verifyParam(locale))
         {
            queryParams["_locale"] = this._apiClient.parameterToString(locale);
         }
         var accepts:Array = new Array();
         var accept:String = this._apiClient.selectHeaderAccept(accepts);
         var contentTypes:Array = new Array();
         var contentType:String = this._apiClient.selectHeaderContentType(contentTypes);
         var authNames:Array = new Array();
         var forceImport_EsportModelMatch:EsportModelMatch = undefined;
         this._returnObjectType = "com.ankama.codegen.client.model.EsportModelMatch";
         this._apiClient.addEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_getMatch);
         this._apiClient.invokeAPI(path,"GET",queryParams,null,headerParams,formParams,accept,contentType,authNames);
      }
      
      public function onSuccess_getMatch(e:ApiClientEvent) : void
      {
         e.stopImmediatePropagation();
         this._apiClient.removeEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_getMatch);
         this._apiClient.deserialize(e.result,this._returnObjectType);
         this._returnObjectType = "";
      }
      
      public function getMatchesApiCall(seasonId:Number, restype:String, locale:String) : void
      {
         if(!verifyParam(seasonId))
         {
            throw new ApiError(400,"Missing the required parameter \'seasonId\' when calling getMatches");
         }
         var path:String = "/Esport/Match/GetMatches".replace(/\{format\}/g,"json");
         var queryParams:Dictionary = new Dictionary();
         var headerParams:Dictionary = new Dictionary();
         var formParams:Dictionary = new Dictionary();
         if(verifyParam(seasonId))
         {
            queryParams["seasonId"] = this._apiClient.parameterToString(seasonId);
         }
         if(verifyParam(restype))
         {
            queryParams["type"] = this._apiClient.parameterToString(restype);
         }
         if(verifyParam(locale))
         {
            queryParams["_locale"] = this._apiClient.parameterToString(locale);
         }
         var accepts:Array = new Array();
         var accept:String = this._apiClient.selectHeaderAccept(accepts);
         var contentTypes:Array = new Array();
         var contentType:String = this._apiClient.selectHeaderContentType(contentTypes);
         var authNames:Array = new Array();
         var forceImport_Array:Array = undefined;
         this._returnObjectType = "com.ankama.codegen.client.model.EsportModelMatch";
         this._apiClient.addEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_getMatches);
         this._apiClient.invokeAPI(path,"GET",queryParams,null,headerParams,formParams,accept,contentType,authNames);
      }
      
      public function onSuccess_getMatches(e:ApiClientEvent) : void
      {
         e.stopImmediatePropagation();
         this._apiClient.removeEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_getMatches);
         this._apiClient.deserialize(e.result,this._returnObjectType);
         this._returnObjectType = "";
      }
      
      public function getNextMatchesBySeasonApiCall(seasonId:Number, teamId:Number, limit:Number, locale:String) : void
      {
         if(!verifyParam(seasonId))
         {
            throw new ApiError(400,"Missing the required parameter \'seasonId\' when calling getNextMatchesBySeason");
         }
         var path:String = "/Esport/Match/GetNextMatchesBySeason".replace(/\{format\}/g,"json");
         var queryParams:Dictionary = new Dictionary();
         var headerParams:Dictionary = new Dictionary();
         var formParams:Dictionary = new Dictionary();
         if(verifyParam(seasonId))
         {
            queryParams["seasonId"] = this._apiClient.parameterToString(seasonId);
         }
         if(verifyParam(teamId))
         {
            queryParams["teamId"] = this._apiClient.parameterToString(teamId);
         }
         if(verifyParam(limit))
         {
            queryParams["limit"] = this._apiClient.parameterToString(limit);
         }
         if(verifyParam(locale))
         {
            queryParams["_locale"] = this._apiClient.parameterToString(locale);
         }
         var accepts:Array = new Array();
         var accept:String = this._apiClient.selectHeaderAccept(accepts);
         var contentTypes:Array = new Array();
         var contentType:String = this._apiClient.selectHeaderContentType(contentTypes);
         var authNames:Array = new Array();
         var forceImport_Array:Array = undefined;
         this._returnObjectType = "com.ankama.codegen.client.model.EsportModelMatch";
         this._apiClient.addEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_getNextMatchesBySeason);
         this._apiClient.invokeAPI(path,"GET",queryParams,null,headerParams,formParams,accept,contentType,authNames);
      }
      
      public function onSuccess_getNextMatchesBySeason(e:ApiClientEvent) : void
      {
         e.stopImmediatePropagation();
         this._apiClient.removeEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_getNextMatchesBySeason);
         this._apiClient.deserialize(e.result,this._returnObjectType);
         this._returnObjectType = "";
      }
      
      public function getParentMatchesApiCall(matchId:Number) : void
      {
         if(!verifyParam(matchId))
         {
            throw new ApiError(400,"Missing the required parameter \'matchId\' when calling getParentMatches");
         }
         var path:String = "/Esport/Match/GetParentMatches".replace(/\{format\}/g,"json");
         var queryParams:Dictionary = new Dictionary();
         var headerParams:Dictionary = new Dictionary();
         var formParams:Dictionary = new Dictionary();
         if(verifyParam(matchId))
         {
            queryParams["matchId"] = this._apiClient.parameterToString(matchId);
         }
         var accepts:Array = new Array();
         var accept:String = this._apiClient.selectHeaderAccept(accepts);
         var contentTypes:Array = new Array();
         var contentType:String = this._apiClient.selectHeaderContentType(contentTypes);
         var authNames:Array = new Array();
         var forceImport_Array:Array = undefined;
         this._returnObjectType = "com.ankama.codegen.client.model.EsportModelMatch";
         this._apiClient.addEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_getParentMatches);
         this._apiClient.invokeAPI(path,"GET",queryParams,null,headerParams,formParams,accept,contentType,authNames);
      }
      
      public function onSuccess_getParentMatches(e:ApiClientEvent) : void
      {
         e.stopImmediatePropagation();
         this._apiClient.removeEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_getParentMatches);
         this._apiClient.deserialize(e.result,this._returnObjectType);
         this._returnObjectType = "";
      }
      
      public function linkParentMatchesApiCall(matchId:Number, firstParentMatchId:Number, secondParentMatchId:Number) : void
      {
         if(!verifyParam(matchId))
         {
            throw new ApiError(400,"Missing the required parameter \'matchId\' when calling linkParentMatches");
         }
         if(!verifyParam(firstParentMatchId))
         {
            throw new ApiError(400,"Missing the required parameter \'firstParentMatchId\' when calling linkParentMatches");
         }
         if(!verifyParam(secondParentMatchId))
         {
            throw new ApiError(400,"Missing the required parameter \'secondParentMatchId\' when calling linkParentMatches");
         }
         var path:String = "/Esport/Match/LinkParentMatches".replace(/\{format\}/g,"json");
         var queryParams:Dictionary = new Dictionary();
         var headerParams:Dictionary = new Dictionary();
         var formParams:Dictionary = new Dictionary();
         var accepts:Array = new Array();
         var accept:String = this._apiClient.selectHeaderAccept(accepts);
         var contentTypes:Array = new Array("application/x-www-form-urlencoded");
         var contentType:String = this._apiClient.selectHeaderContentType(contentTypes);
         if(verifyParam(matchId))
         {
            formParams["matchId"] = this._apiClient.parameterToString(matchId);
         }
         if(verifyParam(firstParentMatchId))
         {
            formParams["firstParentMatchId"] = this._apiClient.parameterToString(firstParentMatchId);
         }
         if(verifyParam(secondParentMatchId))
         {
            formParams["secondParentMatchId"] = this._apiClient.parameterToString(secondParentMatchId);
         }
         var authNames:Array = new Array("AuthPassword");
         var forceImport_Array:Array = undefined;
         this._returnObjectType = "com.ankama.codegen.client.model.EsportModelMatchMatch";
         this._apiClient.addEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_linkParentMatches);
         this._apiClient.invokeAPI(path,"POST",queryParams,null,headerParams,formParams,accept,contentType,authNames);
      }
      
      public function onSuccess_linkParentMatches(e:ApiClientEvent) : void
      {
         e.stopImmediatePropagation();
         this._apiClient.removeEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_linkParentMatches);
         this._apiClient.deserialize(e.result,this._returnObjectType);
         this._returnObjectType = "";
      }
      
      public function patchMatchApiCall(matchId:Number, seasonId:Number, teamOneScore:Number, teamTwoScore:Number, date:String, restype:String, ended:Boolean, maxRound:Number, teamOneId:Number, teamTwoId:Number, step:String, streamingUrl:String) : void
      {
         if(!verifyParam(matchId))
         {
            throw new ApiError(400,"Missing the required parameter \'matchId\' when calling patchMatch");
         }
         if(!verifyParam(seasonId))
         {
            throw new ApiError(400,"Missing the required parameter \'seasonId\' when calling patchMatch");
         }
         if(!verifyParam(teamOneScore))
         {
            throw new ApiError(400,"Missing the required parameter \'teamOneScore\' when calling patchMatch");
         }
         if(!verifyParam(teamTwoScore))
         {
            throw new ApiError(400,"Missing the required parameter \'teamTwoScore\' when calling patchMatch");
         }
         if(!verifyParam(date))
         {
            throw new ApiError(400,"Missing the required parameter \'date\' when calling patchMatch");
         }
         if(!verifyParam(restype))
         {
            throw new ApiError(400,"Missing the required parameter \'restype\' when calling patchMatch");
         }
         if(!verifyParam(ended))
         {
            throw new ApiError(400,"Missing the required parameter \'ended\' when calling patchMatch");
         }
         if(!verifyParam(maxRound))
         {
            throw new ApiError(400,"Missing the required parameter \'maxRound\' when calling patchMatch");
         }
         var path:String = "/Esport/Match/PatchMatch".replace(/\{format\}/g,"json");
         var queryParams:Dictionary = new Dictionary();
         var headerParams:Dictionary = new Dictionary();
         var formParams:Dictionary = new Dictionary();
         var accepts:Array = new Array();
         var accept:String = this._apiClient.selectHeaderAccept(accepts);
         var contentTypes:Array = new Array("application/x-www-form-urlencoded");
         var contentType:String = this._apiClient.selectHeaderContentType(contentTypes);
         if(verifyParam(matchId))
         {
            formParams["matchId"] = this._apiClient.parameterToString(matchId);
         }
         if(verifyParam(seasonId))
         {
            formParams["seasonId"] = this._apiClient.parameterToString(seasonId);
         }
         if(verifyParam(teamOneScore))
         {
            formParams["teamOneScore"] = this._apiClient.parameterToString(teamOneScore);
         }
         if(verifyParam(teamTwoScore))
         {
            formParams["teamTwoScore"] = this._apiClient.parameterToString(teamTwoScore);
         }
         if(verifyParam(date))
         {
            formParams["date"] = this._apiClient.parameterToString(date);
         }
         if(verifyParam(restype))
         {
            formParams["type"] = this._apiClient.parameterToString(restype);
         }
         if(verifyParam(ended))
         {
            formParams["ended"] = this._apiClient.parameterToString(ended);
         }
         if(verifyParam(maxRound))
         {
            formParams["maxRound"] = this._apiClient.parameterToString(maxRound);
         }
         if(verifyParam(teamOneId))
         {
            formParams["teamOneId"] = this._apiClient.parameterToString(teamOneId);
         }
         if(verifyParam(teamTwoId))
         {
            formParams["teamTwoId"] = this._apiClient.parameterToString(teamTwoId);
         }
         if(verifyParam(step))
         {
            formParams["step"] = this._apiClient.parameterToString(step);
         }
         if(verifyParam(streamingUrl))
         {
            formParams["streamingUrl"] = this._apiClient.parameterToString(streamingUrl);
         }
         var authNames:Array = new Array("AuthPassword");
         var forceImport_EsportModelMatch:EsportModelMatch = undefined;
         this._returnObjectType = "com.ankama.codegen.client.model.EsportModelMatch";
         this._apiClient.addEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_patchMatch);
         this._apiClient.invokeAPI(path,"POST",queryParams,null,headerParams,formParams,accept,contentType,authNames);
      }
      
      public function onSuccess_patchMatch(e:ApiClientEvent) : void
      {
         e.stopImmediatePropagation();
         this._apiClient.removeEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_patchMatch);
         this._apiClient.deserialize(e.result,this._returnObjectType);
         this._returnObjectType = "";
      }
      
      public function postMatchApiCall(seasonId:Number, teamOneScore:Number, teamTwoScore:Number, date:String, restype:String, ended:Boolean, maxRound:Number, teamOneId:Number, teamTwoId:Number, step:String, streamingUrl:String) : void
      {
         if(!verifyParam(seasonId))
         {
            throw new ApiError(400,"Missing the required parameter \'seasonId\' when calling postMatch");
         }
         if(!verifyParam(teamOneScore))
         {
            throw new ApiError(400,"Missing the required parameter \'teamOneScore\' when calling postMatch");
         }
         if(!verifyParam(teamTwoScore))
         {
            throw new ApiError(400,"Missing the required parameter \'teamTwoScore\' when calling postMatch");
         }
         if(!verifyParam(date))
         {
            throw new ApiError(400,"Missing the required parameter \'date\' when calling postMatch");
         }
         if(!verifyParam(restype))
         {
            throw new ApiError(400,"Missing the required parameter \'restype\' when calling postMatch");
         }
         if(!verifyParam(ended))
         {
            throw new ApiError(400,"Missing the required parameter \'ended\' when calling postMatch");
         }
         if(!verifyParam(maxRound))
         {
            throw new ApiError(400,"Missing the required parameter \'maxRound\' when calling postMatch");
         }
         var path:String = "/Esport/Match/PostMatch".replace(/\{format\}/g,"json");
         var queryParams:Dictionary = new Dictionary();
         var headerParams:Dictionary = new Dictionary();
         var formParams:Dictionary = new Dictionary();
         var accepts:Array = new Array();
         var accept:String = this._apiClient.selectHeaderAccept(accepts);
         var contentTypes:Array = new Array("application/x-www-form-urlencoded");
         var contentType:String = this._apiClient.selectHeaderContentType(contentTypes);
         if(verifyParam(seasonId))
         {
            formParams["seasonId"] = this._apiClient.parameterToString(seasonId);
         }
         if(verifyParam(teamOneScore))
         {
            formParams["teamOneScore"] = this._apiClient.parameterToString(teamOneScore);
         }
         if(verifyParam(teamTwoScore))
         {
            formParams["teamTwoScore"] = this._apiClient.parameterToString(teamTwoScore);
         }
         if(verifyParam(date))
         {
            formParams["date"] = this._apiClient.parameterToString(date);
         }
         if(verifyParam(restype))
         {
            formParams["type"] = this._apiClient.parameterToString(restype);
         }
         if(verifyParam(ended))
         {
            formParams["ended"] = this._apiClient.parameterToString(ended);
         }
         if(verifyParam(maxRound))
         {
            formParams["maxRound"] = this._apiClient.parameterToString(maxRound);
         }
         if(verifyParam(teamOneId))
         {
            formParams["teamOneId"] = this._apiClient.parameterToString(teamOneId);
         }
         if(verifyParam(teamTwoId))
         {
            formParams["teamTwoId"] = this._apiClient.parameterToString(teamTwoId);
         }
         if(verifyParam(step))
         {
            formParams["step"] = this._apiClient.parameterToString(step);
         }
         if(verifyParam(streamingUrl))
         {
            formParams["streamingUrl"] = this._apiClient.parameterToString(streamingUrl);
         }
         var authNames:Array = new Array("AuthPassword");
         var forceImport_EsportModelMatch:EsportModelMatch = undefined;
         this._returnObjectType = "com.ankama.codegen.client.model.EsportModelMatch";
         this._apiClient.addEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_postMatch);
         this._apiClient.invokeAPI(path,"POST",queryParams,null,headerParams,formParams,accept,contentType,authNames);
      }
      
      public function onSuccess_postMatch(e:ApiClientEvent) : void
      {
         e.stopImmediatePropagation();
         this._apiClient.removeEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_postMatch);
         this._apiClient.deserialize(e.result,this._returnObjectType);
         this._returnObjectType = "";
      }
      
      public function putMatchApiCall(matchId:Number, seasonId:Number, teamOneScore:Number, teamTwoScore:Number, date:String, restype:String, ended:Boolean, maxRound:Number, teamOneId:Number, teamTwoId:Number, step:String, streamingUrl:String) : void
      {
         if(!verifyParam(matchId))
         {
            throw new ApiError(400,"Missing the required parameter \'matchId\' when calling putMatch");
         }
         if(!verifyParam(seasonId))
         {
            throw new ApiError(400,"Missing the required parameter \'seasonId\' when calling putMatch");
         }
         if(!verifyParam(teamOneScore))
         {
            throw new ApiError(400,"Missing the required parameter \'teamOneScore\' when calling putMatch");
         }
         if(!verifyParam(teamTwoScore))
         {
            throw new ApiError(400,"Missing the required parameter \'teamTwoScore\' when calling putMatch");
         }
         if(!verifyParam(date))
         {
            throw new ApiError(400,"Missing the required parameter \'date\' when calling putMatch");
         }
         if(!verifyParam(restype))
         {
            throw new ApiError(400,"Missing the required parameter \'restype\' when calling putMatch");
         }
         if(!verifyParam(ended))
         {
            throw new ApiError(400,"Missing the required parameter \'ended\' when calling putMatch");
         }
         if(!verifyParam(maxRound))
         {
            throw new ApiError(400,"Missing the required parameter \'maxRound\' when calling putMatch");
         }
         var path:String = "/Esport/Match/PutMatch".replace(/\{format\}/g,"json");
         var queryParams:Dictionary = new Dictionary();
         var headerParams:Dictionary = new Dictionary();
         var formParams:Dictionary = new Dictionary();
         var accepts:Array = new Array();
         var accept:String = this._apiClient.selectHeaderAccept(accepts);
         var contentTypes:Array = new Array("application/x-www-form-urlencoded");
         var contentType:String = this._apiClient.selectHeaderContentType(contentTypes);
         if(verifyParam(matchId))
         {
            formParams["matchId"] = this._apiClient.parameterToString(matchId);
         }
         if(verifyParam(seasonId))
         {
            formParams["seasonId"] = this._apiClient.parameterToString(seasonId);
         }
         if(verifyParam(teamOneScore))
         {
            formParams["teamOneScore"] = this._apiClient.parameterToString(teamOneScore);
         }
         if(verifyParam(teamTwoScore))
         {
            formParams["teamTwoScore"] = this._apiClient.parameterToString(teamTwoScore);
         }
         if(verifyParam(date))
         {
            formParams["date"] = this._apiClient.parameterToString(date);
         }
         if(verifyParam(restype))
         {
            formParams["type"] = this._apiClient.parameterToString(restype);
         }
         if(verifyParam(ended))
         {
            formParams["ended"] = this._apiClient.parameterToString(ended);
         }
         if(verifyParam(maxRound))
         {
            formParams["maxRound"] = this._apiClient.parameterToString(maxRound);
         }
         if(verifyParam(teamOneId))
         {
            formParams["teamOneId"] = this._apiClient.parameterToString(teamOneId);
         }
         if(verifyParam(teamTwoId))
         {
            formParams["teamTwoId"] = this._apiClient.parameterToString(teamTwoId);
         }
         if(verifyParam(step))
         {
            formParams["step"] = this._apiClient.parameterToString(step);
         }
         if(verifyParam(streamingUrl))
         {
            formParams["streamingUrl"] = this._apiClient.parameterToString(streamingUrl);
         }
         var authNames:Array = new Array("AuthPassword");
         var forceImport_EsportModelMatch:EsportModelMatch = undefined;
         this._returnObjectType = "com.ankama.codegen.client.model.EsportModelMatch";
         this._apiClient.addEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_putMatch);
         this._apiClient.invokeAPI(path,"POST",queryParams,null,headerParams,formParams,accept,contentType,authNames);
      }
      
      public function onSuccess_putMatch(e:ApiClientEvent) : void
      {
         e.stopImmediatePropagation();
         this._apiClient.removeEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_putMatch);
         this._apiClient.deserialize(e.result,this._returnObjectType);
         this._returnObjectType = "";
      }
   }
}
