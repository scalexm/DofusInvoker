package com.ankama.codegen.client.api
{
   import com.ankama.codegen.client.api.event.ApiClientEvent;
   import com.ankama.codegen.client.model.CharacterAddScreenshotResponse;
   import flash.utils.Dictionary;
   
   public class CharacterApi
   {
       
      
      private var forceImportModelList:ModelList = null;
      
      private var _apiClient:ApiClient;
      
      private var _returnObjectType:String;
      
      public function CharacterApi(apiClient:ApiClient)
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
      
      public function addScreenshotApiCall(screen:String, title:String, lang:String, character:Number, server:Number, map:Number, description:String, restype:String) : void
      {
         if(!verifyParam(screen))
         {
            throw new ApiError(400,"Missing the required parameter \'screen\' when calling addScreenshot");
         }
         if(!verifyParam(title))
         {
            throw new ApiError(400,"Missing the required parameter \'title\' when calling addScreenshot");
         }
         if(!verifyParam(lang))
         {
            throw new ApiError(400,"Missing the required parameter \'lang\' when calling addScreenshot");
         }
         if(!verifyParam(character))
         {
            throw new ApiError(400,"Missing the required parameter \'character\' when calling addScreenshot");
         }
         if(!verifyParam(server))
         {
            throw new ApiError(400,"Missing the required parameter \'server\' when calling addScreenshot");
         }
         if(!verifyParam(map))
         {
            throw new ApiError(400,"Missing the required parameter \'map\' when calling addScreenshot");
         }
         var path:String = "/Character/AddScreenshot".replace(/\{format\}/g,"json");
         var queryParams:Dictionary = new Dictionary();
         var headerParams:Dictionary = new Dictionary();
         var formParams:Dictionary = new Dictionary();
         var accepts:Array = new Array();
         var accept:String = this._apiClient.selectHeaderAccept(accepts);
         var contentTypes:Array = new Array("application/x-www-form-urlencoded");
         var contentType:String = this._apiClient.selectHeaderContentType(contentTypes);
         if(verifyParam(screen))
         {
            formParams["screen"] = this._apiClient.parameterToString(screen);
         }
         if(verifyParam(title))
         {
            formParams["title"] = this._apiClient.parameterToString(title);
         }
         if(verifyParam(description))
         {
            formParams["description"] = this._apiClient.parameterToString(description);
         }
         if(verifyParam(lang))
         {
            formParams["lang"] = this._apiClient.parameterToString(lang);
         }
         if(verifyParam(restype))
         {
            formParams["type"] = this._apiClient.parameterToString(restype);
         }
         if(verifyParam(character))
         {
            formParams["character"] = this._apiClient.parameterToString(character);
         }
         if(verifyParam(server))
         {
            formParams["server"] = this._apiClient.parameterToString(server);
         }
         if(verifyParam(map))
         {
            formParams["map"] = this._apiClient.parameterToString(map);
         }
         var authNames:Array = new Array("AuthAnkamaApiKey");
         var forceImport_CharacterAddScreenshotResponse:CharacterAddScreenshotResponse = undefined;
         this._returnObjectType = "com.ankama.codegen.client.model.CharacterAddScreenshotResponse";
         this._apiClient.addEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_addScreenshot);
         this._apiClient.invokeAPI(path,"POST",queryParams,null,headerParams,formParams,accept,contentType,authNames);
      }
      
      public function onSuccess_addScreenshot(e:ApiClientEvent) : void
      {
         e.stopImmediatePropagation();
         this._apiClient.removeEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_addScreenshot);
         this._apiClient.deserialize(e.result,this._returnObjectType);
         this._returnObjectType = "";
      }
      
      public function charactersApiCall(accountId:Number) : void
      {
         if(!verifyParam(accountId))
         {
            throw new ApiError(400,"Missing the required parameter \'accountId\' when calling characters");
         }
         var path:String = "/Character/Characters".replace(/\{format\}/g,"json");
         var queryParams:Dictionary = new Dictionary();
         var headerParams:Dictionary = new Dictionary();
         var formParams:Dictionary = new Dictionary();
         if(verifyParam(accountId))
         {
            queryParams["account_id"] = this._apiClient.parameterToString(accountId);
         }
         var accepts:Array = new Array();
         var accept:String = this._apiClient.selectHeaderAccept(accepts);
         var contentTypes:Array = new Array();
         var contentType:String = this._apiClient.selectHeaderContentType(contentTypes);
         var authNames:Array = new Array("AuthAnkamaApiKey");
         var forceImport_Array:Array = undefined;
         this._returnObjectType = "com.ankama.codegen.client.model.Character";
         this._apiClient.addEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_characters);
         this._apiClient.invokeAPI(path,"GET",queryParams,null,headerParams,formParams,accept,contentType,authNames);
      }
      
      public function onSuccess_characters(e:ApiClientEvent) : void
      {
         e.stopImmediatePropagation();
         this._apiClient.removeEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_characters);
         this._apiClient.deserialize(e.result,this._returnObjectType);
         this._returnObjectType = "";
      }
      
      public function getEntityLooksApiCall(accountId:Number) : void
      {
         if(!verifyParam(accountId))
         {
            throw new ApiError(400,"Missing the required parameter \'accountId\' when calling getEntityLooks");
         }
         var path:String = "/Character/GetEntityLooks".replace(/\{format\}/g,"json");
         var queryParams:Dictionary = new Dictionary();
         var headerParams:Dictionary = new Dictionary();
         var formParams:Dictionary = new Dictionary();
         if(verifyParam(accountId))
         {
            queryParams["account_id"] = this._apiClient.parameterToString(accountId);
         }
         var accepts:Array = new Array();
         var accept:String = this._apiClient.selectHeaderAccept(accepts);
         var contentTypes:Array = new Array();
         var contentType:String = this._apiClient.selectHeaderContentType(contentTypes);
         var authNames:Array = new Array();
         var forceImport_Array:Array = undefined;
         this._returnObjectType = "com.ankama.codegen.client.model.EntityLook";
         this._apiClient.addEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_getEntityLooks);
         this._apiClient.invokeAPI(path,"GET",queryParams,null,headerParams,formParams,accept,contentType,authNames);
      }
      
      public function onSuccess_getEntityLooks(e:ApiClientEvent) : void
      {
         e.stopImmediatePropagation();
         this._apiClient.removeEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_getEntityLooks);
         this._apiClient.deserialize(e.result,this._returnObjectType);
         this._returnObjectType = "";
      }
   }
}
