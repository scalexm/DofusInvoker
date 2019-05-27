package com.ankama.codegen.client.api
{
   import com.ankama.codegen.client.api.event.ApiClientEvent;
   import com.ankama.codegen.client.model.Account;
   import com.ankama.codegen.client.model.ApiKey;
   import com.ankama.codegen.client.model.Avatar;
   import com.ankama.codegen.client.model.SessionAccount;
   import com.ankama.codegen.client.model.SessionAccountsPaged;
   import com.ankama.codegen.client.model.SessionLogin;
   import com.ankama.codegen.client.model.Token;
   import flash.utils.Dictionary;
   
   public class AccountApi
   {
       
      
      private var forceImportModelList:ModelList = null;
      
      private var _apiClient:ApiClient;
      
      private var _returnObjectType:String;
      
      public function AccountApi(apiClient:ApiClient)
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
      
      public function accountApiCall() : void
      {
         var path:String = "/Account/Account".replace(/\{format\}/g,"json");
         var queryParams:Dictionary = new Dictionary();
         var headerParams:Dictionary = new Dictionary();
         var formParams:Dictionary = new Dictionary();
         var accepts:Array = new Array();
         var accept:String = this._apiClient.selectHeaderAccept(accepts);
         var contentTypes:Array = new Array();
         var contentType:String = this._apiClient.selectHeaderContentType(contentTypes);
         var authNames:Array = new Array("AuthAnkamaApiKey");
         var forceImport_Account:Account = undefined;
         this._returnObjectType = "com.ankama.codegen.client.model.Account";
         this._apiClient.addEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_account);
         this._apiClient.invokeAPI(path,"GET",queryParams,null,headerParams,formParams,accept,contentType,authNames);
      }
      
      public function onSuccess_account(e:ApiClientEvent) : void
      {
         e.stopImmediatePropagation();
         this._apiClient.removeEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_account);
         this._apiClient.deserialize(e.result,this._returnObjectType);
         this._returnObjectType = "";
      }
      
      public function accountByNicknameWithPasswordApiCall(nickname:String) : void
      {
         if(!verifyParam(nickname))
         {
            throw new ApiError(400,"Missing the required parameter \'nickname\' when calling accountByNicknameWithPassword");
         }
         var path:String = "/Account/AccountByNicknameWithPassword".replace(/\{format\}/g,"json");
         var queryParams:Dictionary = new Dictionary();
         var headerParams:Dictionary = new Dictionary();
         var formParams:Dictionary = new Dictionary();
         if(verifyParam(nickname))
         {
            queryParams["nickname"] = this._apiClient.parameterToString(nickname);
         }
         var accepts:Array = new Array();
         var accept:String = this._apiClient.selectHeaderAccept(accepts);
         var contentTypes:Array = new Array();
         var contentType:String = this._apiClient.selectHeaderContentType(contentTypes);
         var authNames:Array = new Array("AuthPassword");
         var forceImport_Account:Account = undefined;
         this._returnObjectType = "com.ankama.codegen.client.model.Account";
         this._apiClient.addEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_accountByNicknameWithPassword);
         this._apiClient.invokeAPI(path,"GET",queryParams,null,headerParams,formParams,accept,contentType,authNames);
      }
      
      public function onSuccess_accountByNicknameWithPassword(e:ApiClientEvent) : void
      {
         e.stopImmediatePropagation();
         this._apiClient.removeEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_accountByNicknameWithPassword);
         this._apiClient.deserialize(e.result,this._returnObjectType);
         this._returnObjectType = "";
      }
      
      public function accountFromTokenApiCall(token:String, ip:String, gameId:Number) : void
      {
         if(!verifyParam(token))
         {
            throw new ApiError(400,"Missing the required parameter \'token\' when calling accountFromToken");
         }
         if(!verifyParam(ip))
         {
            throw new ApiError(400,"Missing the required parameter \'ip\' when calling accountFromToken");
         }
         if(!verifyParam(gameId))
         {
            throw new ApiError(400,"Missing the required parameter \'gameId\' when calling accountFromToken");
         }
         var path:String = "/Account/AccountFromToken".replace(/\{format\}/g,"json");
         var queryParams:Dictionary = new Dictionary();
         var headerParams:Dictionary = new Dictionary();
         var formParams:Dictionary = new Dictionary();
         if(verifyParam(token))
         {
            queryParams["token"] = this._apiClient.parameterToString(token);
         }
         if(verifyParam(ip))
         {
            queryParams["ip"] = this._apiClient.parameterToString(ip);
         }
         if(verifyParam(gameId))
         {
            queryParams["game_id"] = this._apiClient.parameterToString(gameId);
         }
         var accepts:Array = new Array();
         var accept:String = this._apiClient.selectHeaderAccept(accepts);
         var contentTypes:Array = new Array();
         var contentType:String = this._apiClient.selectHeaderContentType(contentTypes);
         var authNames:Array = new Array("AuthPassword");
         var forceImport_Account:Account = undefined;
         this._returnObjectType = "com.ankama.codegen.client.model.Account";
         this._apiClient.addEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_accountFromToken);
         this._apiClient.invokeAPI(path,"GET",queryParams,null,headerParams,formParams,accept,contentType,authNames);
      }
      
      public function onSuccess_accountFromToken(e:ApiClientEvent) : void
      {
         e.stopImmediatePropagation();
         this._apiClient.removeEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_accountFromToken);
         this._apiClient.deserialize(e.result,this._returnObjectType);
         this._returnObjectType = "";
      }
      
      public function accountWithPasswordApiCall(accountId:Number) : void
      {
         if(!verifyParam(accountId))
         {
            throw new ApiError(400,"Missing the required parameter \'accountId\' when calling accountWithPassword");
         }
         var path:String = "/Account/AccountWithPassword".replace(/\{format\}/g,"json");
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
         var authNames:Array = new Array("AuthPassword");
         var forceImport_Account:Account = undefined;
         this._returnObjectType = "com.ankama.codegen.client.model.Account";
         this._apiClient.addEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_accountWithPassword);
         this._apiClient.invokeAPI(path,"GET",queryParams,null,headerParams,formParams,accept,contentType,authNames);
      }
      
      public function onSuccess_accountWithPassword(e:ApiClientEvent) : void
      {
         e.stopImmediatePropagation();
         this._apiClient.removeEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_accountWithPassword);
         this._apiClient.deserialize(e.result,this._returnObjectType);
         this._returnObjectType = "";
      }
      
      public function avatarApiCall() : void
      {
         var path:String = "/Account/Avatar".replace(/\{format\}/g,"json");
         var queryParams:Dictionary = new Dictionary();
         var headerParams:Dictionary = new Dictionary();
         var formParams:Dictionary = new Dictionary();
         var accepts:Array = new Array();
         var accept:String = this._apiClient.selectHeaderAccept(accepts);
         var contentTypes:Array = new Array();
         var contentType:String = this._apiClient.selectHeaderContentType(contentTypes);
         var authNames:Array = new Array("AuthAnkamaApiKey");
         var forceImport_Avatar:Avatar = undefined;
         this._returnObjectType = "com.ankama.codegen.client.model.Avatar";
         this._apiClient.addEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_avatar);
         this._apiClient.invokeAPI(path,"GET",queryParams,null,headerParams,formParams,accept,contentType,authNames);
      }
      
      public function onSuccess_avatar(e:ApiClientEvent) : void
      {
         e.stopImmediatePropagation();
         this._apiClient.removeEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_avatar);
         this._apiClient.deserialize(e.result,this._returnObjectType);
         this._returnObjectType = "";
      }
      
      public function checkPasswordStrengthApiCall(password:String) : void
      {
         if(!verifyParam(password))
         {
            throw new ApiError(400,"Missing the required parameter \'password\' when calling checkPasswordStrength");
         }
         var path:String = "/Account/CheckPasswordStrength".replace(/\{format\}/g,"json");
         var queryParams:Dictionary = new Dictionary();
         var headerParams:Dictionary = new Dictionary();
         var formParams:Dictionary = new Dictionary();
         if(verifyParam(password))
         {
            queryParams["password"] = this._apiClient.parameterToString(password);
         }
         var accepts:Array = new Array();
         var accept:String = this._apiClient.selectHeaderAccept(accepts);
         var contentTypes:Array = new Array();
         var contentType:String = this._apiClient.selectHeaderContentType(contentTypes);
         var authNames:Array = new Array("AuthPassword");
         var forceImport_String:String = undefined;
         this._returnObjectType = "com.ankama.codegen.client.model.String";
         this._apiClient.addEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_checkPasswordStrength);
         this._apiClient.invokeAPI(path,"GET",queryParams,null,headerParams,formParams,accept,contentType,authNames);
      }
      
      public function onSuccess_checkPasswordStrength(e:ApiClientEvent) : void
      {
         e.stopImmediatePropagation();
         this._apiClient.removeEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_checkPasswordStrength);
         this._apiClient.deserialize(e.result,this._returnObjectType);
         this._returnObjectType = "";
      }
      
      public function createGhostApiCall(game:Number, lang:String, uid:String, ip:String) : void
      {
         if(!verifyParam(game))
         {
            throw new ApiError(400,"Missing the required parameter \'game\' when calling createGhost");
         }
         if(!verifyParam(lang))
         {
            throw new ApiError(400,"Missing the required parameter \'lang\' when calling createGhost");
         }
         if(!verifyParam(uid))
         {
            throw new ApiError(400,"Missing the required parameter \'uid\' when calling createGhost");
         }
         var path:String = "/Account/CreateGhost".replace(/\{format\}/g,"json");
         var queryParams:Dictionary = new Dictionary();
         var headerParams:Dictionary = new Dictionary();
         var formParams:Dictionary = new Dictionary();
         if(verifyParam(game))
         {
            queryParams["game"] = this._apiClient.parameterToString(game);
         }
         if(verifyParam(lang))
         {
            queryParams["lang"] = this._apiClient.parameterToString(lang);
         }
         if(verifyParam(uid))
         {
            queryParams["uid"] = this._apiClient.parameterToString(uid);
         }
         if(verifyParam(ip))
         {
            queryParams["ip"] = this._apiClient.parameterToString(ip);
         }
         var accepts:Array = new Array();
         var accept:String = this._apiClient.selectHeaderAccept(accepts);
         var contentTypes:Array = new Array();
         var contentType:String = this._apiClient.selectHeaderContentType(contentTypes);
         var authNames:Array = new Array("AuthPassword");
         var forceImport_Account:Account = undefined;
         this._returnObjectType = "com.ankama.codegen.client.model.Account";
         this._apiClient.addEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_createGhost);
         this._apiClient.invokeAPI(path,"GET",queryParams,null,headerParams,formParams,accept,contentType,authNames);
      }
      
      public function onSuccess_createGhost(e:ApiClientEvent) : void
      {
         e.stopImmediatePropagation();
         this._apiClient.removeEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_createGhost);
         this._apiClient.deserialize(e.result,this._returnObjectType);
         this._returnObjectType = "";
      }
      
      public function createGhostFromClientApiCall(game:Number, lang:String, uid:String, ip:String) : void
      {
         if(!verifyParam(game))
         {
            throw new ApiError(400,"Missing the required parameter \'game\' when calling createGhostFromClient");
         }
         if(!verifyParam(lang))
         {
            throw new ApiError(400,"Missing the required parameter \'lang\' when calling createGhostFromClient");
         }
         if(!verifyParam(uid))
         {
            throw new ApiError(400,"Missing the required parameter \'uid\' when calling createGhostFromClient");
         }
         var path:String = "/Account/CreateGhostFromClient".replace(/\{format\}/g,"json");
         var queryParams:Dictionary = new Dictionary();
         var headerParams:Dictionary = new Dictionary();
         var formParams:Dictionary = new Dictionary();
         if(verifyParam(game))
         {
            queryParams["game"] = this._apiClient.parameterToString(game);
         }
         if(verifyParam(lang))
         {
            queryParams["lang"] = this._apiClient.parameterToString(lang);
         }
         if(verifyParam(uid))
         {
            queryParams["uid"] = this._apiClient.parameterToString(uid);
         }
         if(verifyParam(ip))
         {
            queryParams["ip"] = this._apiClient.parameterToString(ip);
         }
         var accepts:Array = new Array();
         var accept:String = this._apiClient.selectHeaderAccept(accepts);
         var contentTypes:Array = new Array();
         var contentType:String = this._apiClient.selectHeaderContentType(contentTypes);
         var authNames:Array = new Array();
         var forceImport_ApiKey:ApiKey = undefined;
         this._returnObjectType = "com.ankama.codegen.client.model.ApiKey";
         this._apiClient.addEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_createGhostFromClient);
         this._apiClient.invokeAPI(path,"GET",queryParams,null,headerParams,formParams,accept,contentType,authNames);
      }
      
      public function onSuccess_createGhostFromClient(e:ApiClientEvent) : void
      {
         e.stopImmediatePropagation();
         this._apiClient.removeEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_createGhostFromClient);
         this._apiClient.deserialize(e.result,this._returnObjectType);
         this._returnObjectType = "";
      }
      
      public function createGuestApiCall(game:Number, lang:String, webParams:String, captchaToken:String) : void
      {
         if(!verifyParam(game))
         {
            throw new ApiError(400,"Missing the required parameter \'game\' when calling createGuest");
         }
         if(!verifyParam(lang))
         {
            throw new ApiError(400,"Missing the required parameter \'lang\' when calling createGuest");
         }
         if(!verifyParam(webParams))
         {
            throw new ApiError(400,"Missing the required parameter \'webParams\' when calling createGuest");
         }
         if(!verifyParam(captchaToken))
         {
            throw new ApiError(400,"Missing the required parameter \'captchaToken\' when calling createGuest");
         }
         var path:String = "/Account/CreateGuest".replace(/\{format\}/g,"json");
         var queryParams:Dictionary = new Dictionary();
         var headerParams:Dictionary = new Dictionary();
         var formParams:Dictionary = new Dictionary();
         if(verifyParam(game))
         {
            queryParams["game"] = this._apiClient.parameterToString(game);
         }
         if(verifyParam(lang))
         {
            queryParams["lang"] = this._apiClient.parameterToString(lang);
         }
         if(verifyParam(webParams))
         {
            queryParams["web_params"] = this._apiClient.parameterToString(webParams);
         }
         if(verifyParam(captchaToken))
         {
            queryParams["captcha_token"] = this._apiClient.parameterToString(captchaToken);
         }
         var accepts:Array = new Array();
         var accept:String = this._apiClient.selectHeaderAccept(accepts);
         var contentTypes:Array = new Array();
         var contentType:String = this._apiClient.selectHeaderContentType(contentTypes);
         var authNames:Array = new Array();
         var forceImport_Account:Account = undefined;
         this._returnObjectType = "com.ankama.codegen.client.model.Account";
         this._apiClient.addEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_createGuest);
         this._apiClient.invokeAPI(path,"GET",queryParams,null,headerParams,formParams,accept,contentType,authNames);
      }
      
      public function onSuccess_createGuest(e:ApiClientEvent) : void
      {
         e.stopImmediatePropagation();
         this._apiClient.removeEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_createGuest);
         this._apiClient.deserialize(e.result,this._returnObjectType);
         this._returnObjectType = "";
      }
      
      public function createTokenApiCall(game:Number) : void
      {
         if(!verifyParam(game))
         {
            throw new ApiError(400,"Missing the required parameter \'game\' when calling createToken");
         }
         var path:String = "/Account/CreateToken".replace(/\{format\}/g,"json");
         var queryParams:Dictionary = new Dictionary();
         var headerParams:Dictionary = new Dictionary();
         var formParams:Dictionary = new Dictionary();
         if(verifyParam(game))
         {
            queryParams["game"] = this._apiClient.parameterToString(game);
         }
         var accepts:Array = new Array();
         var accept:String = this._apiClient.selectHeaderAccept(accepts);
         var contentTypes:Array = new Array();
         var contentType:String = this._apiClient.selectHeaderContentType(contentTypes);
         var authNames:Array = new Array("AuthAnkamaApiKey");
         var forceImport_Token:Token = undefined;
         this._returnObjectType = "com.ankama.codegen.client.model.Token";
         this._apiClient.addEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_createToken);
         this._apiClient.invokeAPI(path,"GET",queryParams,null,headerParams,formParams,accept,contentType,authNames);
      }
      
      public function onSuccess_createToken(e:ApiClientEvent) : void
      {
         e.stopImmediatePropagation();
         this._apiClient.removeEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_createToken);
         this._apiClient.deserialize(e.result,this._returnObjectType);
         this._returnObjectType = "";
      }
      
      public function createTokenFromServerApiCall(accountId:Number, game:Number, ip:String, meta:String) : void
      {
         if(!verifyParam(accountId))
         {
            throw new ApiError(400,"Missing the required parameter \'accountId\' when calling createTokenFromServer");
         }
         if(!verifyParam(game))
         {
            throw new ApiError(400,"Missing the required parameter \'game\' when calling createTokenFromServer");
         }
         if(!verifyParam(ip))
         {
            throw new ApiError(400,"Missing the required parameter \'ip\' when calling createTokenFromServer");
         }
         var path:String = "/Account/CreateTokenFromServer".replace(/\{format\}/g,"json");
         var queryParams:Dictionary = new Dictionary();
         var headerParams:Dictionary = new Dictionary();
         var formParams:Dictionary = new Dictionary();
         if(verifyParam(accountId))
         {
            queryParams["account_id"] = this._apiClient.parameterToString(accountId);
         }
         if(verifyParam(game))
         {
            queryParams["game"] = this._apiClient.parameterToString(game);
         }
         if(verifyParam(ip))
         {
            queryParams["ip"] = this._apiClient.parameterToString(ip);
         }
         if(verifyParam(meta))
         {
            queryParams["meta"] = this._apiClient.parameterToString(meta);
         }
         var accepts:Array = new Array();
         var accept:String = this._apiClient.selectHeaderAccept(accepts);
         var contentTypes:Array = new Array();
         var contentType:String = this._apiClient.selectHeaderContentType(contentTypes);
         var authNames:Array = new Array("AuthPassword");
         var forceImport_Token:Token = undefined;
         this._returnObjectType = "com.ankama.codegen.client.model.Token";
         this._apiClient.addEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_createTokenFromServer);
         this._apiClient.invokeAPI(path,"GET",queryParams,null,headerParams,formParams,accept,contentType,authNames);
      }
      
      public function onSuccess_createTokenFromServer(e:ApiClientEvent) : void
      {
         e.stopImmediatePropagation();
         this._apiClient.removeEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_createTokenFromServer);
         this._apiClient.deserialize(e.result,this._returnObjectType);
         this._returnObjectType = "";
      }
      
      public function createTokenWithPasswordApiCall(login:String, password:String, game:Number) : void
      {
         if(!verifyParam(login))
         {
            throw new ApiError(400,"Missing the required parameter \'login\' when calling createTokenWithPassword");
         }
         if(!verifyParam(password))
         {
            throw new ApiError(400,"Missing the required parameter \'password\' when calling createTokenWithPassword");
         }
         if(!verifyParam(game))
         {
            throw new ApiError(400,"Missing the required parameter \'game\' when calling createTokenWithPassword");
         }
         var path:String = "/Account/CreateTokenWithPassword".replace(/\{format\}/g,"json");
         var queryParams:Dictionary = new Dictionary();
         var headerParams:Dictionary = new Dictionary();
         var formParams:Dictionary = new Dictionary();
         var accepts:Array = new Array();
         var accept:String = this._apiClient.selectHeaderAccept(accepts);
         var contentTypes:Array = new Array("application/x-www-form-urlencoded");
         var contentType:String = this._apiClient.selectHeaderContentType(contentTypes);
         if(verifyParam(login))
         {
            formParams["login"] = this._apiClient.parameterToString(login);
         }
         if(verifyParam(password))
         {
            formParams["password"] = this._apiClient.parameterToString(password);
         }
         if(verifyParam(game))
         {
            formParams["game"] = this._apiClient.parameterToString(game);
         }
         var authNames:Array = new Array();
         var forceImport_Token:Token = undefined;
         this._returnObjectType = "com.ankama.codegen.client.model.Token";
         this._apiClient.addEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_createTokenWithPassword);
         this._apiClient.invokeAPI(path,"POST",queryParams,null,headerParams,formParams,accept,contentType,authNames);
      }
      
      public function onSuccess_createTokenWithPassword(e:ApiClientEvent) : void
      {
         e.stopImmediatePropagation();
         this._apiClient.removeEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_createTokenWithPassword);
         this._apiClient.deserialize(e.result,this._returnObjectType);
         this._returnObjectType = "";
      }
      
      public function deleteGhostApiCall(game:Number, uid:String, newUid:String) : void
      {
         if(!verifyParam(game))
         {
            throw new ApiError(400,"Missing the required parameter \'game\' when calling deleteGhost");
         }
         if(!verifyParam(uid))
         {
            throw new ApiError(400,"Missing the required parameter \'uid\' when calling deleteGhost");
         }
         if(!verifyParam(newUid))
         {
            throw new ApiError(400,"Missing the required parameter \'newUid\' when calling deleteGhost");
         }
         var path:String = "/Account/DeleteGhost".replace(/\{format\}/g,"json");
         var queryParams:Dictionary = new Dictionary();
         var headerParams:Dictionary = new Dictionary();
         var formParams:Dictionary = new Dictionary();
         if(verifyParam(game))
         {
            queryParams["game"] = this._apiClient.parameterToString(game);
         }
         if(verifyParam(uid))
         {
            queryParams["uid"] = this._apiClient.parameterToString(uid);
         }
         if(verifyParam(newUid))
         {
            queryParams["new_uid"] = this._apiClient.parameterToString(newUid);
         }
         var accepts:Array = new Array();
         var accept:String = this._apiClient.selectHeaderAccept(accepts);
         var contentTypes:Array = new Array();
         var contentType:String = this._apiClient.selectHeaderContentType(contentTypes);
         var authNames:Array = new Array();
         this._returnObjectType = "null";
         this._apiClient.addEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_deleteGhost);
         this._apiClient.invokeAPI(path,"GET",queryParams,null,headerParams,formParams,accept,contentType,authNames);
      }
      
      public function onSuccess_deleteGhost(e:ApiClientEvent) : void
      {
         e.stopImmediatePropagation();
         this._apiClient.removeEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_deleteGhost);
         this._apiClient.deserialize(e.result,this._returnObjectType);
         this._returnObjectType = "";
      }
      
      public function getAccountStatusApiCall() : void
      {
         var path:String = "/Account/GetAccountStatus".replace(/\{format\}/g,"json");
         var queryParams:Dictionary = new Dictionary();
         var headerParams:Dictionary = new Dictionary();
         var formParams:Dictionary = new Dictionary();
         var accepts:Array = new Array();
         var accept:String = this._apiClient.selectHeaderAccept(accepts);
         var contentTypes:Array = new Array();
         var contentType:String = this._apiClient.selectHeaderContentType(contentTypes);
         var authNames:Array = new Array("AuthPassword");
         var forceImport_Array:Array = undefined;
         this._returnObjectType = "com.ankama.codegen.client.model.AccountStatusList";
         this._apiClient.addEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_getAccountStatus);
         this._apiClient.invokeAPI(path,"GET",queryParams,null,headerParams,formParams,accept,contentType,authNames);
      }
      
      public function onSuccess_getAccountStatus(e:ApiClientEvent) : void
      {
         e.stopImmediatePropagation();
         this._apiClient.removeEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_getAccountStatus);
         this._apiClient.deserialize(e.result,this._returnObjectType);
         this._returnObjectType = "";
      }
      
      public function getSecretQuestionApiCall(questionId:Number, accountId:Number) : void
      {
         var path:String = "/Account/GetSecretQuestion".replace(/\{format\}/g,"json");
         var queryParams:Dictionary = new Dictionary();
         var headerParams:Dictionary = new Dictionary();
         var formParams:Dictionary = new Dictionary();
         if(verifyParam(questionId))
         {
            queryParams["questionId"] = this._apiClient.parameterToString(questionId);
         }
         if(verifyParam(accountId))
         {
            queryParams["accountId"] = this._apiClient.parameterToString(accountId);
         }
         var accepts:Array = new Array();
         var accept:String = this._apiClient.selectHeaderAccept(accepts);
         var contentTypes:Array = new Array();
         var contentType:String = this._apiClient.selectHeaderContentType(contentTypes);
         var authNames:Array = new Array("AuthPassword");
         var forceImport_Array:Array = undefined;
         this._returnObjectType = "com.ankama.codegen.client.model.SecretQuestion";
         this._apiClient.addEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_getSecretQuestion);
         this._apiClient.invokeAPI(path,"GET",queryParams,null,headerParams,formParams,accept,contentType,authNames);
      }
      
      public function onSuccess_getSecretQuestion(e:ApiClientEvent) : void
      {
         e.stopImmediatePropagation();
         this._apiClient.removeEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_getSecretQuestion);
         this._apiClient.deserialize(e.result,this._returnObjectType);
         this._returnObjectType = "";
      }
      
      public function getSessionAccountsApiCall(accountId:Number, gameId:Number, page:Number, pageSize:Number, order:String, groupBy:String, ip:String, serverId:Number, minDate:String, maxDate:String, minIp:String, maxIp:String) : void
      {
         var path:String = "/Account/GetSessionAccounts".replace(/\{format\}/g,"json");
         var queryParams:Dictionary = new Dictionary();
         var headerParams:Dictionary = new Dictionary();
         var formParams:Dictionary = new Dictionary();
         var accepts:Array = new Array();
         var accept:String = this._apiClient.selectHeaderAccept(accepts);
         var contentTypes:Array = new Array("application/x-www-form-urlencoded");
         var contentType:String = this._apiClient.selectHeaderContentType(contentTypes);
         if(verifyParam(accountId))
         {
            formParams["account_id"] = this._apiClient.parameterToString(accountId);
         }
         if(verifyParam(gameId))
         {
            formParams["game_id"] = this._apiClient.parameterToString(gameId);
         }
         if(verifyParam(page))
         {
            formParams["page"] = this._apiClient.parameterToString(page);
         }
         if(verifyParam(pageSize))
         {
            formParams["page_size"] = this._apiClient.parameterToString(pageSize);
         }
         if(verifyParam(order))
         {
            formParams["order"] = this._apiClient.parameterToString(order);
         }
         if(verifyParam(groupBy))
         {
            formParams["group_by"] = this._apiClient.parameterToString(groupBy);
         }
         if(verifyParam(ip))
         {
            formParams["ip"] = this._apiClient.parameterToString(ip);
         }
         if(verifyParam(serverId))
         {
            formParams["server_id"] = this._apiClient.parameterToString(serverId);
         }
         if(verifyParam(minDate))
         {
            formParams["min_date"] = this._apiClient.parameterToString(minDate);
         }
         if(verifyParam(maxDate))
         {
            formParams["max_date"] = this._apiClient.parameterToString(maxDate);
         }
         if(verifyParam(minIp))
         {
            formParams["min_ip"] = this._apiClient.parameterToString(minIp);
         }
         if(verifyParam(maxIp))
         {
            formParams["max_ip"] = this._apiClient.parameterToString(maxIp);
         }
         var authNames:Array = new Array("AuthPassword");
         var forceImport_SessionAccountsPaged:SessionAccountsPaged = undefined;
         this._returnObjectType = "com.ankama.codegen.client.model.SessionAccountsPaged";
         this._apiClient.addEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_getSessionAccounts);
         this._apiClient.invokeAPI(path,"POST",queryParams,null,headerParams,formParams,accept,contentType,authNames);
      }
      
      public function onSuccess_getSessionAccounts(e:ApiClientEvent) : void
      {
         e.stopImmediatePropagation();
         this._apiClient.removeEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_getSessionAccounts);
         this._apiClient.deserialize(e.result,this._returnObjectType);
         this._returnObjectType = "";
      }
      
      public function sendDeviceInfosApiCall(sessionId:Number, connectionType:String, clientType:String, os:String, device:String, partner:String, deviceUid:String, sessionIdString:String) : void
      {
         if(!verifyParam(sessionId))
         {
            throw new ApiError(400,"Missing the required parameter \'sessionId\' when calling sendDeviceInfos");
         }
         if(!verifyParam(connectionType))
         {
            throw new ApiError(400,"Missing the required parameter \'connectionType\' when calling sendDeviceInfos");
         }
         if(!verifyParam(clientType))
         {
            throw new ApiError(400,"Missing the required parameter \'clientType\' when calling sendDeviceInfos");
         }
         var path:String = "/Account/SendDeviceInfos".replace(/\{format\}/g,"json");
         var queryParams:Dictionary = new Dictionary();
         var headerParams:Dictionary = new Dictionary();
         var formParams:Dictionary = new Dictionary();
         var accepts:Array = new Array();
         var accept:String = this._apiClient.selectHeaderAccept(accepts);
         var contentTypes:Array = new Array("application/x-www-form-urlencoded");
         var contentType:String = this._apiClient.selectHeaderContentType(contentTypes);
         if(verifyParam(sessionId))
         {
            formParams["session_id"] = this._apiClient.parameterToString(sessionId);
         }
         if(verifyParam(connectionType))
         {
            formParams["connection_type"] = this._apiClient.parameterToString(connectionType);
         }
         if(verifyParam(clientType))
         {
            formParams["client_type"] = this._apiClient.parameterToString(clientType);
         }
         if(verifyParam(os))
         {
            formParams["os"] = this._apiClient.parameterToString(os);
         }
         if(verifyParam(device))
         {
            formParams["device"] = this._apiClient.parameterToString(device);
         }
         if(verifyParam(partner))
         {
            formParams["partner"] = this._apiClient.parameterToString(partner);
         }
         if(verifyParam(deviceUid))
         {
            formParams["device_uid"] = this._apiClient.parameterToString(deviceUid);
         }
         if(verifyParam(sessionIdString))
         {
            formParams["session_id_string"] = this._apiClient.parameterToString(sessionIdString);
         }
         var authNames:Array = new Array("AuthAnkamaApiKey");
         this._returnObjectType = "null";
         this._apiClient.addEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_sendDeviceInfos);
         this._apiClient.invokeAPI(path,"POST",queryParams,null,headerParams,formParams,accept,contentType,authNames);
      }
      
      public function onSuccess_sendDeviceInfos(e:ApiClientEvent) : void
      {
         e.stopImmediatePropagation();
         this._apiClient.removeEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_sendDeviceInfos);
         this._apiClient.deserialize(e.result,this._returnObjectType);
         this._returnObjectType = "";
      }
      
      public function setNicknameApiCall(accountId:Number, nickname:String, lang:String) : void
      {
         if(!verifyParam(accountId))
         {
            throw new ApiError(400,"Missing the required parameter \'accountId\' when calling setNickname");
         }
         if(!verifyParam(nickname))
         {
            throw new ApiError(400,"Missing the required parameter \'nickname\' when calling setNickname");
         }
         var path:String = "/Account/SetNickname".replace(/\{format\}/g,"json");
         var queryParams:Dictionary = new Dictionary();
         var headerParams:Dictionary = new Dictionary();
         var formParams:Dictionary = new Dictionary();
         var accepts:Array = new Array();
         var accept:String = this._apiClient.selectHeaderAccept(accepts);
         var contentTypes:Array = new Array("application/x-www-form-urlencoded");
         var contentType:String = this._apiClient.selectHeaderContentType(contentTypes);
         if(verifyParam(accountId))
         {
            formParams["account_id"] = this._apiClient.parameterToString(accountId);
         }
         if(verifyParam(nickname))
         {
            formParams["nickname"] = this._apiClient.parameterToString(nickname);
         }
         if(verifyParam(lang))
         {
            formParams["lang"] = this._apiClient.parameterToString(lang);
         }
         var authNames:Array = new Array("AuthPassword");
         this._returnObjectType = "null";
         this._apiClient.addEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_setNickname);
         this._apiClient.invokeAPI(path,"POST",queryParams,null,headerParams,formParams,accept,contentType,authNames);
      }
      
      public function onSuccess_setNickname(e:ApiClientEvent) : void
      {
         e.stopImmediatePropagation();
         this._apiClient.removeEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_setNickname);
         this._apiClient.deserialize(e.result,this._returnObjectType);
         this._returnObjectType = "";
      }
      
      public function setNicknameWithApiKeyApiCall(nickname:String, lang:String) : void
      {
         if(!verifyParam(nickname))
         {
            throw new ApiError(400,"Missing the required parameter \'nickname\' when calling setNicknameWithApiKey");
         }
         var path:String = "/Account/SetNicknameWithApiKey".replace(/\{format\}/g,"json");
         var queryParams:Dictionary = new Dictionary();
         var headerParams:Dictionary = new Dictionary();
         var formParams:Dictionary = new Dictionary();
         var accepts:Array = new Array();
         var accept:String = this._apiClient.selectHeaderAccept(accepts);
         var contentTypes:Array = new Array("application/x-www-form-urlencoded");
         var contentType:String = this._apiClient.selectHeaderContentType(contentTypes);
         if(verifyParam(nickname))
         {
            formParams["nickname"] = this._apiClient.parameterToString(nickname);
         }
         if(verifyParam(lang))
         {
            formParams["lang"] = this._apiClient.parameterToString(lang);
         }
         var authNames:Array = new Array("AuthAnkamaApiKey");
         this._returnObjectType = "null";
         this._apiClient.addEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_setNicknameWithApiKey);
         this._apiClient.invokeAPI(path,"POST",queryParams,null,headerParams,formParams,accept,contentType,authNames);
      }
      
      public function onSuccess_setNicknameWithApiKey(e:ApiClientEvent) : void
      {
         e.stopImmediatePropagation();
         this._apiClient.removeEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_setNicknameWithApiKey);
         this._apiClient.deserialize(e.result,this._returnObjectType);
         this._returnObjectType = "";
      }
      
      public function setStatusApiCall(accountId:Number, statusKey:String, statusValue:Number) : void
      {
         if(!verifyParam(accountId))
         {
            throw new ApiError(400,"Missing the required parameter \'accountId\' when calling setStatus");
         }
         if(!verifyParam(statusKey))
         {
            throw new ApiError(400,"Missing the required parameter \'statusKey\' when calling setStatus");
         }
         if(!verifyParam(statusValue))
         {
            throw new ApiError(400,"Missing the required parameter \'statusValue\' when calling setStatus");
         }
         var path:String = "/Account/SetStatus".replace(/\{format\}/g,"json");
         var queryParams:Dictionary = new Dictionary();
         var headerParams:Dictionary = new Dictionary();
         var formParams:Dictionary = new Dictionary();
         if(verifyParam(accountId))
         {
            queryParams["account_id"] = this._apiClient.parameterToString(accountId);
         }
         if(verifyParam(statusKey))
         {
            queryParams["status_key"] = this._apiClient.parameterToString(statusKey);
         }
         if(verifyParam(statusValue))
         {
            queryParams["status_value"] = this._apiClient.parameterToString(statusValue);
         }
         var accepts:Array = new Array();
         var accept:String = this._apiClient.selectHeaderAccept(accepts);
         var contentTypes:Array = new Array();
         var contentType:String = this._apiClient.selectHeaderContentType(contentTypes);
         var authNames:Array = new Array("AuthPassword");
         var forceImport_Boolean:Boolean = undefined;
         this._returnObjectType = "com.ankama.codegen.client.model.Boolean";
         this._apiClient.addEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_setStatus);
         this._apiClient.invokeAPI(path,"GET",queryParams,null,headerParams,formParams,accept,contentType,authNames);
      }
      
      public function onSuccess_setStatus(e:ApiClientEvent) : void
      {
         e.stopImmediatePropagation();
         this._apiClient.removeEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_setStatus);
         this._apiClient.deserialize(e.result,this._returnObjectType);
         this._returnObjectType = "";
      }
      
      public function signOffApiCall(sessionId:Number, connectionType:String, clientType:String, os:String, device:String, partner:String, deviceUid:String, date:Date, sessionIdString:String) : void
      {
         if(!verifyParam(sessionId))
         {
            throw new ApiError(400,"Missing the required parameter \'sessionId\' when calling signOff");
         }
         if(!verifyParam(connectionType))
         {
            throw new ApiError(400,"Missing the required parameter \'connectionType\' when calling signOff");
         }
         if(!verifyParam(clientType))
         {
            throw new ApiError(400,"Missing the required parameter \'clientType\' when calling signOff");
         }
         var path:String = "/Account/SignOff".replace(/\{format\}/g,"json");
         var queryParams:Dictionary = new Dictionary();
         var headerParams:Dictionary = new Dictionary();
         var formParams:Dictionary = new Dictionary();
         var accepts:Array = new Array();
         var accept:String = this._apiClient.selectHeaderAccept(accepts);
         var contentTypes:Array = new Array("application/x-www-form-urlencoded");
         var contentType:String = this._apiClient.selectHeaderContentType(contentTypes);
         if(verifyParam(sessionId))
         {
            formParams["session_id"] = this._apiClient.parameterToString(sessionId);
         }
         if(verifyParam(connectionType))
         {
            formParams["connection_type"] = this._apiClient.parameterToString(connectionType);
         }
         if(verifyParam(clientType))
         {
            formParams["client_type"] = this._apiClient.parameterToString(clientType);
         }
         if(verifyParam(os))
         {
            formParams["os"] = this._apiClient.parameterToString(os);
         }
         if(verifyParam(device))
         {
            formParams["device"] = this._apiClient.parameterToString(device);
         }
         if(verifyParam(partner))
         {
            formParams["partner"] = this._apiClient.parameterToString(partner);
         }
         if(verifyParam(deviceUid))
         {
            formParams["device_uid"] = this._apiClient.parameterToString(deviceUid);
         }
         if(verifyParam(date))
         {
            formParams["date"] = this._apiClient.parameterToString(date);
         }
         if(verifyParam(sessionIdString))
         {
            formParams["session_id_string"] = this._apiClient.parameterToString(sessionIdString);
         }
         var authNames:Array = new Array("AuthPassword");
         this._returnObjectType = "null";
         this._apiClient.addEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_signOff);
         this._apiClient.invokeAPI(path,"POST",queryParams,null,headerParams,formParams,accept,contentType,authNames);
      }
      
      public function onSuccess_signOff(e:ApiClientEvent) : void
      {
         e.stopImmediatePropagation();
         this._apiClient.removeEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_signOff);
         this._apiClient.deserialize(e.result,this._returnObjectType);
         this._returnObjectType = "";
      }
      
      public function signOffWithApiKeyApiCall(sessionId:Number, connectionType:String, clientType:String, os:String, device:String, partner:String, deviceUid:String, date:Date, sessionIdString:String) : void
      {
         if(!verifyParam(sessionId))
         {
            throw new ApiError(400,"Missing the required parameter \'sessionId\' when calling signOffWithApiKey");
         }
         if(!verifyParam(connectionType))
         {
            throw new ApiError(400,"Missing the required parameter \'connectionType\' when calling signOffWithApiKey");
         }
         if(!verifyParam(clientType))
         {
            throw new ApiError(400,"Missing the required parameter \'clientType\' when calling signOffWithApiKey");
         }
         var path:String = "/Account/SignOffWithApiKey".replace(/\{format\}/g,"json");
         var queryParams:Dictionary = new Dictionary();
         var headerParams:Dictionary = new Dictionary();
         var formParams:Dictionary = new Dictionary();
         var accepts:Array = new Array();
         var accept:String = this._apiClient.selectHeaderAccept(accepts);
         var contentTypes:Array = new Array("application/x-www-form-urlencoded");
         var contentType:String = this._apiClient.selectHeaderContentType(contentTypes);
         if(verifyParam(sessionId))
         {
            formParams["session_id"] = this._apiClient.parameterToString(sessionId);
         }
         if(verifyParam(connectionType))
         {
            formParams["connection_type"] = this._apiClient.parameterToString(connectionType);
         }
         if(verifyParam(clientType))
         {
            formParams["client_type"] = this._apiClient.parameterToString(clientType);
         }
         if(verifyParam(os))
         {
            formParams["os"] = this._apiClient.parameterToString(os);
         }
         if(verifyParam(device))
         {
            formParams["device"] = this._apiClient.parameterToString(device);
         }
         if(verifyParam(partner))
         {
            formParams["partner"] = this._apiClient.parameterToString(partner);
         }
         if(verifyParam(deviceUid))
         {
            formParams["device_uid"] = this._apiClient.parameterToString(deviceUid);
         }
         if(verifyParam(date))
         {
            formParams["date"] = this._apiClient.parameterToString(date);
         }
         if(verifyParam(sessionIdString))
         {
            formParams["session_id_string"] = this._apiClient.parameterToString(sessionIdString);
         }
         var authNames:Array = new Array("AuthAnkamaApiKey");
         this._returnObjectType = "null";
         this._apiClient.addEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_signOffWithApiKey);
         this._apiClient.invokeAPI(path,"POST",queryParams,null,headerParams,formParams,accept,contentType,authNames);
      }
      
      public function onSuccess_signOffWithApiKey(e:ApiClientEvent) : void
      {
         e.stopImmediatePropagation();
         this._apiClient.removeEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_signOffWithApiKey);
         this._apiClient.deserialize(e.result,this._returnObjectType);
         this._returnObjectType = "";
      }
      
      public function signOnWithApiKeyApiCall(game:Number) : void
      {
         if(!verifyParam(game))
         {
            throw new ApiError(400,"Missing the required parameter \'game\' when calling signOnWithApiKey");
         }
         var path:String = "/Account/SignOnWithApiKey".replace(/\{format\}/g,"json");
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
         var authNames:Array = new Array("AuthAnkamaApiKey");
         var forceImport_SessionLogin:SessionLogin = undefined;
         this._returnObjectType = "com.ankama.codegen.client.model.SessionLogin";
         this._apiClient.addEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_signOnWithApiKey);
         this._apiClient.invokeAPI(path,"POST",queryParams,null,headerParams,formParams,accept,contentType,authNames);
      }
      
      public function onSuccess_signOnWithApiKey(e:ApiClientEvent) : void
      {
         e.stopImmediatePropagation();
         this._apiClient.removeEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_signOnWithApiKey);
         this._apiClient.deserialize(e.result,this._returnObjectType);
         this._returnObjectType = "";
      }
      
      public function signOnWithGhostUidApiCall(uid:String, game:Number, ip:String, date:Date, os:String, device:String, connectionType:String, clientType:String, partner:String, deviceUid:String) : void
      {
         if(!verifyParam(uid))
         {
            throw new ApiError(400,"Missing the required parameter \'uid\' when calling signOnWithGhostUid");
         }
         if(!verifyParam(game))
         {
            throw new ApiError(400,"Missing the required parameter \'game\' when calling signOnWithGhostUid");
         }
         var path:String = "/Account/SignOnWithGhostUid".replace(/\{format\}/g,"json");
         var queryParams:Dictionary = new Dictionary();
         var headerParams:Dictionary = new Dictionary();
         var formParams:Dictionary = new Dictionary();
         var accepts:Array = new Array();
         var accept:String = this._apiClient.selectHeaderAccept(accepts);
         var contentTypes:Array = new Array("application/x-www-form-urlencoded");
         var contentType:String = this._apiClient.selectHeaderContentType(contentTypes);
         if(verifyParam(uid))
         {
            formParams["uid"] = this._apiClient.parameterToString(uid);
         }
         if(verifyParam(game))
         {
            formParams["game"] = this._apiClient.parameterToString(game);
         }
         if(verifyParam(ip))
         {
            formParams["ip"] = this._apiClient.parameterToString(ip);
         }
         if(verifyParam(date))
         {
            formParams["date"] = this._apiClient.parameterToString(date);
         }
         if(verifyParam(os))
         {
            formParams["os"] = this._apiClient.parameterToString(os);
         }
         if(verifyParam(device))
         {
            formParams["device"] = this._apiClient.parameterToString(device);
         }
         if(verifyParam(connectionType))
         {
            formParams["connection_type"] = this._apiClient.parameterToString(connectionType);
         }
         if(verifyParam(clientType))
         {
            formParams["client_type"] = this._apiClient.parameterToString(clientType);
         }
         if(verifyParam(partner))
         {
            formParams["partner"] = this._apiClient.parameterToString(partner);
         }
         if(verifyParam(deviceUid))
         {
            formParams["device_uid"] = this._apiClient.parameterToString(deviceUid);
         }
         var authNames:Array = new Array("AuthPassword");
         var forceImport_SessionLogin:SessionLogin = undefined;
         this._returnObjectType = "com.ankama.codegen.client.model.SessionLogin";
         this._apiClient.addEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_signOnWithGhostUid);
         this._apiClient.invokeAPI(path,"POST",queryParams,null,headerParams,formParams,accept,contentType,authNames);
      }
      
      public function onSuccess_signOnWithGhostUid(e:ApiClientEvent) : void
      {
         e.stopImmediatePropagation();
         this._apiClient.removeEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_signOnWithGhostUid);
         this._apiClient.deserialize(e.result,this._returnObjectType);
         this._returnObjectType = "";
      }
      
      public function signOnWithPasswordApiCall(login:String, password:String, ip:String, game:Number) : void
      {
         if(!verifyParam(login))
         {
            throw new ApiError(400,"Missing the required parameter \'login\' when calling signOnWithPassword");
         }
         if(!verifyParam(password))
         {
            throw new ApiError(400,"Missing the required parameter \'password\' when calling signOnWithPassword");
         }
         if(!verifyParam(ip))
         {
            throw new ApiError(400,"Missing the required parameter \'ip\' when calling signOnWithPassword");
         }
         if(!verifyParam(game))
         {
            throw new ApiError(400,"Missing the required parameter \'game\' when calling signOnWithPassword");
         }
         var path:String = "/Account/SignOnWithPassword".replace(/\{format\}/g,"json");
         var queryParams:Dictionary = new Dictionary();
         var headerParams:Dictionary = new Dictionary();
         var formParams:Dictionary = new Dictionary();
         var accepts:Array = new Array();
         var accept:String = this._apiClient.selectHeaderAccept(accepts);
         var contentTypes:Array = new Array("application/x-www-form-urlencoded");
         var contentType:String = this._apiClient.selectHeaderContentType(contentTypes);
         if(verifyParam(login))
         {
            formParams["login"] = this._apiClient.parameterToString(login);
         }
         if(verifyParam(password))
         {
            formParams["password"] = this._apiClient.parameterToString(password);
         }
         if(verifyParam(ip))
         {
            formParams["ip"] = this._apiClient.parameterToString(ip);
         }
         if(verifyParam(game))
         {
            formParams["game"] = this._apiClient.parameterToString(game);
         }
         var authNames:Array = new Array("AuthPassword");
         var forceImport_SessionLogin:SessionLogin = undefined;
         this._returnObjectType = "com.ankama.codegen.client.model.SessionLogin";
         this._apiClient.addEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_signOnWithPassword);
         this._apiClient.invokeAPI(path,"POST",queryParams,null,headerParams,formParams,accept,contentType,authNames);
      }
      
      public function onSuccess_signOnWithPassword(e:ApiClientEvent) : void
      {
         e.stopImmediatePropagation();
         this._apiClient.removeEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_signOnWithPassword);
         this._apiClient.deserialize(e.result,this._returnObjectType);
         this._returnObjectType = "";
      }
      
      public function signOnWithTokenApiCall(token:String, ip:String, game:Number) : void
      {
         if(!verifyParam(token))
         {
            throw new ApiError(400,"Missing the required parameter \'token\' when calling signOnWithToken");
         }
         if(!verifyParam(ip))
         {
            throw new ApiError(400,"Missing the required parameter \'ip\' when calling signOnWithToken");
         }
         if(!verifyParam(game))
         {
            throw new ApiError(400,"Missing the required parameter \'game\' when calling signOnWithToken");
         }
         var path:String = "/Account/SignOnWithToken".replace(/\{format\}/g,"json");
         var queryParams:Dictionary = new Dictionary();
         var headerParams:Dictionary = new Dictionary();
         var formParams:Dictionary = new Dictionary();
         var accepts:Array = new Array();
         var accept:String = this._apiClient.selectHeaderAccept(accepts);
         var contentTypes:Array = new Array("application/x-www-form-urlencoded");
         var contentType:String = this._apiClient.selectHeaderContentType(contentTypes);
         if(verifyParam(token))
         {
            formParams["token"] = this._apiClient.parameterToString(token);
         }
         if(verifyParam(ip))
         {
            formParams["ip"] = this._apiClient.parameterToString(ip);
         }
         if(verifyParam(game))
         {
            formParams["game"] = this._apiClient.parameterToString(game);
         }
         var authNames:Array = new Array("AuthPassword");
         var forceImport_SessionLogin:SessionLogin = undefined;
         this._returnObjectType = "com.ankama.codegen.client.model.SessionLogin";
         this._apiClient.addEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_signOnWithToken);
         this._apiClient.invokeAPI(path,"POST",queryParams,null,headerParams,formParams,accept,contentType,authNames);
      }
      
      public function onSuccess_signOnWithToken(e:ApiClientEvent) : void
      {
         e.stopImmediatePropagation();
         this._apiClient.removeEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_signOnWithToken);
         this._apiClient.deserialize(e.result,this._returnObjectType);
         this._returnObjectType = "";
      }
      
      public function startSessionApiCall(accountId:Number, sessionId:Number, game:Number, ip:String, sessionIdString:String) : void
      {
         if(!verifyParam(accountId))
         {
            throw new ApiError(400,"Missing the required parameter \'accountId\' when calling startSession");
         }
         if(!verifyParam(sessionId))
         {
            throw new ApiError(400,"Missing the required parameter \'sessionId\' when calling startSession");
         }
         if(!verifyParam(game))
         {
            throw new ApiError(400,"Missing the required parameter \'game\' when calling startSession");
         }
         if(!verifyParam(ip))
         {
            throw new ApiError(400,"Missing the required parameter \'ip\' when calling startSession");
         }
         var path:String = "/Account/StartSession".replace(/\{format\}/g,"json");
         var queryParams:Dictionary = new Dictionary();
         var headerParams:Dictionary = new Dictionary();
         var formParams:Dictionary = new Dictionary();
         var accepts:Array = new Array();
         var accept:String = this._apiClient.selectHeaderAccept(accepts);
         var contentTypes:Array = new Array("application/x-www-form-urlencoded");
         var contentType:String = this._apiClient.selectHeaderContentType(contentTypes);
         if(verifyParam(accountId))
         {
            formParams["account_id"] = this._apiClient.parameterToString(accountId);
         }
         if(verifyParam(sessionId))
         {
            formParams["session_id"] = this._apiClient.parameterToString(sessionId);
         }
         if(verifyParam(game))
         {
            formParams["game"] = this._apiClient.parameterToString(game);
         }
         if(verifyParam(ip))
         {
            formParams["ip"] = this._apiClient.parameterToString(ip);
         }
         if(verifyParam(sessionIdString))
         {
            formParams["session_id_string"] = this._apiClient.parameterToString(sessionIdString);
         }
         var authNames:Array = new Array("AuthPassword");
         var forceImport_SessionAccount:SessionAccount = undefined;
         this._returnObjectType = "com.ankama.codegen.client.model.SessionAccount";
         this._apiClient.addEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_startSession);
         this._apiClient.invokeAPI(path,"POST",queryParams,null,headerParams,formParams,accept,contentType,authNames);
      }
      
      public function onSuccess_startSession(e:ApiClientEvent) : void
      {
         e.stopImmediatePropagation();
         this._apiClient.removeEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_startSession);
         this._apiClient.deserialize(e.result,this._returnObjectType);
         this._returnObjectType = "";
      }
      
      public function statusApiCall() : void
      {
         var path:String = "/Account/Status".replace(/\{format\}/g,"json");
         var queryParams:Dictionary = new Dictionary();
         var headerParams:Dictionary = new Dictionary();
         var formParams:Dictionary = new Dictionary();
         var accepts:Array = new Array();
         var accept:String = this._apiClient.selectHeaderAccept(accepts);
         var contentTypes:Array = new Array();
         var contentType:String = this._apiClient.selectHeaderContentType(contentTypes);
         var authNames:Array = new Array("AuthAnkamaApiKey");
         var forceImport_Array:Array = undefined;
         this._returnObjectType = "com.ankama.codegen.client.model.AccountPublicStatus";
         this._apiClient.addEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_status);
         this._apiClient.invokeAPI(path,"GET",queryParams,null,headerParams,formParams,accept,contentType,authNames);
      }
      
      public function onSuccess_status(e:ApiClientEvent) : void
      {
         e.stopImmediatePropagation();
         this._apiClient.removeEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_status);
         this._apiClient.deserialize(e.result,this._returnObjectType);
         this._returnObjectType = "";
      }
      
      public function statusByAccountIdApiCall(accountId:Number) : void
      {
         if(!verifyParam(accountId))
         {
            throw new ApiError(400,"Missing the required parameter \'accountId\' when calling statusByAccountId");
         }
         var path:String = "/Account/StatusByAccountId".replace(/\{format\}/g,"json");
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
         var authNames:Array = new Array("AuthPassword");
         var forceImport_Array:Array = undefined;
         this._returnObjectType = "com.ankama.codegen.client.model.AccountStatus";
         this._apiClient.addEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_statusByAccountId);
         this._apiClient.invokeAPI(path,"GET",queryParams,null,headerParams,formParams,accept,contentType,authNames);
      }
      
      public function onSuccess_statusByAccountId(e:ApiClientEvent) : void
      {
         e.stopImmediatePropagation();
         this._apiClient.removeEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_statusByAccountId);
         this._apiClient.deserialize(e.result,this._returnObjectType);
         this._returnObjectType = "";
      }
      
      public function validateGuestApiCall(lang:String, accountId:Number, gameId:Number, login:String, nickname:String, email:String, password:String) : void
      {
         if(!verifyParam(lang))
         {
            throw new ApiError(400,"Missing the required parameter \'lang\' when calling validateGuest");
         }
         if(!verifyParam(accountId))
         {
            throw new ApiError(400,"Missing the required parameter \'accountId\' when calling validateGuest");
         }
         if(!verifyParam(gameId))
         {
            throw new ApiError(400,"Missing the required parameter \'gameId\' when calling validateGuest");
         }
         if(!verifyParam(login))
         {
            throw new ApiError(400,"Missing the required parameter \'login\' when calling validateGuest");
         }
         if(!verifyParam(nickname))
         {
            throw new ApiError(400,"Missing the required parameter \'nickname\' when calling validateGuest");
         }
         if(!verifyParam(email))
         {
            throw new ApiError(400,"Missing the required parameter \'email\' when calling validateGuest");
         }
         if(!verifyParam(password))
         {
            throw new ApiError(400,"Missing the required parameter \'password\' when calling validateGuest");
         }
         var path:String = "/Account/ValidateGuest".replace(/\{format\}/g,"json");
         var queryParams:Dictionary = new Dictionary();
         var headerParams:Dictionary = new Dictionary();
         var formParams:Dictionary = new Dictionary();
         var accepts:Array = new Array();
         var accept:String = this._apiClient.selectHeaderAccept(accepts);
         var contentTypes:Array = new Array("application/x-www-form-urlencoded");
         var contentType:String = this._apiClient.selectHeaderContentType(contentTypes);
         if(verifyParam(lang))
         {
            formParams["lang"] = this._apiClient.parameterToString(lang);
         }
         if(verifyParam(accountId))
         {
            formParams["account_id"] = this._apiClient.parameterToString(accountId);
         }
         if(verifyParam(gameId))
         {
            formParams["game_id"] = this._apiClient.parameterToString(gameId);
         }
         if(verifyParam(login))
         {
            formParams["login"] = this._apiClient.parameterToString(login);
         }
         if(verifyParam(nickname))
         {
            formParams["nickname"] = this._apiClient.parameterToString(nickname);
         }
         if(verifyParam(email))
         {
            formParams["email"] = this._apiClient.parameterToString(email);
         }
         if(verifyParam(password))
         {
            formParams["password"] = this._apiClient.parameterToString(password);
         }
         var authNames:Array = new Array("AuthPassword");
         this._returnObjectType = "null";
         this._apiClient.addEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_validateGuest);
         this._apiClient.invokeAPI(path,"POST",queryParams,null,headerParams,formParams,accept,contentType,authNames);
      }
      
      public function onSuccess_validateGuest(e:ApiClientEvent) : void
      {
         e.stopImmediatePropagation();
         this._apiClient.removeEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_validateGuest);
         this._apiClient.deserialize(e.result,this._returnObjectType);
         this._returnObjectType = "";
      }
      
      public function validateSteamApiCall(lang:String, accountId:Number, gameId:Number, login:String, nickname:String, email:String, password:String) : void
      {
         if(!verifyParam(lang))
         {
            throw new ApiError(400,"Missing the required parameter \'lang\' when calling validateSteam");
         }
         if(!verifyParam(accountId))
         {
            throw new ApiError(400,"Missing the required parameter \'accountId\' when calling validateSteam");
         }
         if(!verifyParam(gameId))
         {
            throw new ApiError(400,"Missing the required parameter \'gameId\' when calling validateSteam");
         }
         if(!verifyParam(login))
         {
            throw new ApiError(400,"Missing the required parameter \'login\' when calling validateSteam");
         }
         if(!verifyParam(nickname))
         {
            throw new ApiError(400,"Missing the required parameter \'nickname\' when calling validateSteam");
         }
         if(!verifyParam(email))
         {
            throw new ApiError(400,"Missing the required parameter \'email\' when calling validateSteam");
         }
         if(!verifyParam(password))
         {
            throw new ApiError(400,"Missing the required parameter \'password\' when calling validateSteam");
         }
         var path:String = "/Account/ValidateSteam".replace(/\{format\}/g,"json");
         var queryParams:Dictionary = new Dictionary();
         var headerParams:Dictionary = new Dictionary();
         var formParams:Dictionary = new Dictionary();
         var accepts:Array = new Array();
         var accept:String = this._apiClient.selectHeaderAccept(accepts);
         var contentTypes:Array = new Array("application/x-www-form-urlencoded");
         var contentType:String = this._apiClient.selectHeaderContentType(contentTypes);
         if(verifyParam(lang))
         {
            formParams["lang"] = this._apiClient.parameterToString(lang);
         }
         if(verifyParam(accountId))
         {
            formParams["account_id"] = this._apiClient.parameterToString(accountId);
         }
         if(verifyParam(gameId))
         {
            formParams["game_id"] = this._apiClient.parameterToString(gameId);
         }
         if(verifyParam(login))
         {
            formParams["login"] = this._apiClient.parameterToString(login);
         }
         if(verifyParam(nickname))
         {
            formParams["nickname"] = this._apiClient.parameterToString(nickname);
         }
         if(verifyParam(email))
         {
            formParams["email"] = this._apiClient.parameterToString(email);
         }
         if(verifyParam(password))
         {
            formParams["password"] = this._apiClient.parameterToString(password);
         }
         var authNames:Array = new Array("AuthPassword");
         this._returnObjectType = "null";
         this._apiClient.addEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_validateSteam);
         this._apiClient.invokeAPI(path,"POST",queryParams,null,headerParams,formParams,accept,contentType,authNames);
      }
      
      public function onSuccess_validateSteam(e:ApiClientEvent) : void
      {
         e.stopImmediatePropagation();
         this._apiClient.removeEventListener(ApiClientEvent.API_CALL_SUCCESS,this.onSuccess_validateSteam);
         this._apiClient.deserialize(e.result,this._returnObjectType);
         this._returnObjectType = "";
      }
   }
}
