package com.ankama.codegen.client.api
{
   import com.ankama.codegen.client.api.auth.ApiKeyAuth;
   import com.ankama.codegen.client.api.auth.Authentication;
   import com.ankama.codegen.client.api.auth.HttpBasicAuth;
   import com.ankama.codegen.client.api.event.ApiClientEvent;
   import flash.events.ErrorEvent;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.HTTPStatusEvent;
   import flash.events.IOErrorEvent;
   import flash.events.SecurityErrorEvent;
   import flash.globalization.DateTimeFormatter;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   import flash.net.URLRequestHeader;
   import flash.net.URLRequestMethod;
   import flash.system.ApplicationDomain;
   import flash.utils.Dictionary;
   import flash.utils.getDefinitionByName;
   import mx.formatters.DateFormatter;
   import mx.utils.DescribeTypeCache;
   import mx.utils.DescribeTypeCacheRecord;
   
   public class ApiClient extends EventDispatcher
   {
       
      
      private var forceImportModelList:ModelList = null;
      
      private var _defaultHeaderMap:Dictionary;
      
      private var _debugging:Boolean = false;
      
      private var _basePath:String = "https://haapi.ankama.tst/json/Dofus/v1";
      
      private var _authentications:Dictionary;
      
      private var _dateFormat:DateTimeFormatter;
      
      private var _loader:URLLoader;
      
      public function ApiClient()
      {
         this._defaultHeaderMap = new Dictionary();
         super();
         this._dateFormat = new DateTimeFormatter("fr-FR");
         this._dateFormat.setDateTimePattern("yyyy-MM-dd\'T\'HH:mm:ss+00:00");
         this._authentications = new Dictionary();
         this._authentications["AuthAnkamaApiKey"] = new ApiKeyAuth("header","APIKEY");
         this._authentications["AuthPassword"] = new HttpBasicAuth();
      }
      
      public function getBasePath() : String
      {
         return this._basePath;
      }
      
      public function setBasePath(basePath:String) : ApiClient
      {
         this._basePath = basePath;
         return this;
      }
      
      public function setUserAgent(userAgent:String) : ApiClient
      {
         return this;
      }
      
      public function addDefaultHeader(key:String, value:String) : ApiClient
      {
         this._defaultHeaderMap[key] = value;
         return this;
      }
      
      public function getAuthentications() : Dictionary
      {
         return this._authentications;
      }
      
      public function getAuthentication(authName:String) : Authentication
      {
         return this._authentications[authName];
      }
      
      public function setUsername(username:String) : void
      {
         var auth:Authentication = null;
         for each(auth in this._authentications)
         {
            if(auth is HttpBasicAuth)
            {
               HttpBasicAuth(auth).setUsername(username);
               return;
            }
         }
         throw new Error("No HTTP basic authentication configured!");
      }
      
      public function setPassword(password:String) : void
      {
         var auth:Authentication = null;
         for each(auth in this._authentications)
         {
            if(auth is HttpBasicAuth)
            {
               HttpBasicAuth(auth).setPassword(password);
               return;
            }
         }
         throw new Error("No HTTP basic authentication configured!");
      }
      
      public function setApiKey(apiKey:String) : void
      {
         var auth:Authentication = null;
         for each(auth in this._authentications)
         {
            if(auth is ApiKeyAuth)
            {
               ApiKeyAuth(auth).setApiKey(apiKey);
               return;
            }
         }
         throw new Error("No API key authentication configured!");
      }
      
      public function setApiKeyPrefix(apiKeyPrefix:String) : void
      {
         var auth:Authentication = null;
         for each(auth in this._authentications)
         {
            if(auth is ApiKeyAuth)
            {
               ApiKeyAuth(auth).setApiKeyPrefix(apiKeyPrefix);
               return;
            }
         }
         throw new Error("No API key authentication configured!");
      }
      
      public function getDateFormat() : DateTimeFormatter
      {
         return this._dateFormat;
      }
      
      public function setDateFormat(sDateFormat:DateTimeFormatter) : ApiClient
      {
         this._dateFormat = sDateFormat;
         return this;
      }
      
      public function parseDate(str:String) : String
      {
         var date:Date = null;
         try
         {
            date = new Date(Date.parse(str));
            return this._dateFormat.formatUTC(date);
         }
         catch(e:Error)
         {
            throw new Error(e);
         }
         return "";
      }
      
      public function formatDate(date:Date) : String
      {
         return this._dateFormat.formatUTC(date);
      }
      
      public function parameterToString(param:Object) : String
      {
         var b:* = null;
         var o:Object = null;
         if(param == null)
         {
            return "";
         }
         if(param is Date)
         {
            return this.formatDate(param as Date);
         }
         if(param is Dictionary)
         {
            b = "";
            for each(o in Dictionary(param))
            {
               if(b.length > 0)
               {
                  b = b + ",";
               }
               b = b + String(o);
            }
            return b;
         }
         return String(param);
      }
      
      public function selectHeaderAccept(accepts:Array) : String
      {
         if(accepts.length == 0)
         {
            return null;
         }
         if(StringUtil.containsIgnoreCase(accepts,"application/json"))
         {
            return "application/json";
         }
         return StringUtil.join(accepts,",");
      }
      
      public function selectHeaderContentType(contentTypes:Array) : String
      {
         if(contentTypes.length == 0)
         {
            return "application/json";
         }
         if(StringUtil.containsIgnoreCase(contentTypes,"application/json"))
         {
            return "application/json";
         }
         return contentTypes[0];
      }
      
      public function escapeString(str:String) : String
      {
         try
         {
            return encodeURIComponent(str.replace(/\+/g,"%20"));
         }
         catch(e:Error)
         {
            return str;
         }
         return str;
      }
      
      public function invokeAPI(path:String, method:String, queryParams:Dictionary, body:Object, headerParams:Dictionary, formParams:Dictionary, accept:String, contentType:String, authNames:Array) : void
      {
         var key:* = null;
         var requestHeader:URLRequestHeader = null;
         var encodedFormParams:String = null;
         var value:String = null;
         this.updateParamsForAuth(authNames,queryParams,headerParams);
         var client:URLRequest = new URLRequest();
         var querystring:* = "";
         this._loader = new URLLoader();
         this._loader.addEventListener(Event.COMPLETE,this.onRequestComplete);
         this._loader.addEventListener(HTTPStatusEvent.HTTP_STATUS,dispatchEvent);
         this._loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onError);
         this._loader.addEventListener(IOErrorEvent.IO_ERROR,this.onError);
         for(key in queryParams)
         {
            value = queryParams[key];
            if(value != null)
            {
               if(querystring.length == 0)
               {
                  querystring = querystring + "?";
               }
               else
               {
                  querystring = querystring + "&";
               }
               querystring = querystring + this.escapeString(key) + "=" + this.escapeString(value);
            }
         }
         client.url = this._basePath + path + querystring;
         client.contentType = contentType;
         client.method = method;
         for(key in headerParams)
         {
            requestHeader = new URLRequestHeader(key,headerParams[key]);
            client.requestHeaders.push(requestHeader);
         }
         for(key in this._defaultHeaderMap)
         {
            if(headerParams[key] === undefined)
            {
               requestHeader = new URLRequestHeader(key,this._defaultHeaderMap[key]);
               client.requestHeaders.push(requestHeader);
            }
         }
         if(method == URLRequestMethod.GET)
         {
            client.method = method;
         }
         else if(method == URLRequestMethod.POST)
         {
            if(contentType.indexOf("application/x-www-form-urlencoded") == 0)
            {
               encodedFormParams = this.getXWWWFormUrlencodedParams(formParams);
               client.data = encodedFormParams;
            }
            else
            {
               client.data = JsonUtil.toJson(body);
            }
         }
         else if(method == URLRequestMethod.PUT)
         {
            if(contentType == "application/x-www-form-urlencoded")
            {
               encodedFormParams = this.getXWWWFormUrlencodedParams(formParams);
               client.data = encodedFormParams;
            }
            else
            {
               client.data = JsonUtil.toJson(body);
            }
         }
         else if(method == URLRequestMethod.DELETE)
         {
            if(contentType == "application/x-www-form-urlencoded" || body == null)
            {
               encodedFormParams = this.getXWWWFormUrlencodedParams(formParams);
               client.data = encodedFormParams;
            }
            else
            {
               client.data = JsonUtil.toJson(body);
            }
         }
         else
         {
            throw new ApiError(500,"unknown method type " + method);
         }
         this._loader.load(client);
      }
      
      public function deserialize(data:*, returnObjectType:String) : void
      {
         var returnObject:* = undefined;
         if(returnObjectType != "null" && returnObjectType != "" && ApplicationDomain.currentDomain.hasDefinition(returnObjectType))
         {
            returnObject = this.getTypedObject(data,returnObjectType);
         }
         else
         {
            returnObject = data;
         }
         dispatchEvent(new ApiClientEvent(ApiClientEvent.API_CALL_RESULT,returnObject,""));
      }
      
      private function getTypedObject(data:*, returnObjectType:String) : *
      {
         var variable:XML = null;
         var dateVar:Date = null;
         var resultArray:Array = null;
         var resultObject:* = undefined;
         var object:* = undefined;
         if(!data)
         {
            return;
         }
         if(data.hasOwnProperty("length") && data.length > 0)
         {
            resultArray = new Array();
            for each(resultObject in data)
            {
               resultArray.push(this.getTypedObject(resultObject,returnObjectType));
            }
            return resultArray;
         }
         var objectType:Class = getDefinitionByName(returnObjectType) as Class;
         var returnObject:* = new objectType();
         var description:DescribeTypeCacheRecord = DescribeTypeCache.describeType(returnObject);
         var variables:XMLList = description.typeDescription.variable;
         for each(variable in variables)
         {
            if(variable.@type == "Date")
            {
               dateVar = DateFormatter.parseDateString(data[variable.@name]);
               returnObject[variable.@name] = dateVar;
            }
            else if(variable.@type == "flash.utils::Dictionary")
            {
               for(object in data[variable.@name])
               {
                  returnObject[variable.@name] = new Dictionary();
                  returnObject[variable.@name][object] = data[variable.@name][object];
               }
            }
            else if(variable.@type.indexOf("com.ankama.codegen.client.model") != -1 && (ApplicationDomain.currentDomain.hasDefinition(returnObjectType) && data[variable.@name] != null))
            {
               returnObject[variable.@name] = this.getTypedObject(data[variable.@name],variable.@type);
            }
            else if(data)
            {
               returnObject[variable.@name] = data[variable.@name];
            }
         }
         return returnObject;
      }
      
      private function updateParamsForAuth(authNames:Array, queryParams:Dictionary, headerParams:Dictionary) : void
      {
         var authName:String = null;
         var auth:Authentication = null;
         for each(authName in authNames)
         {
            auth = this._authentications[authName];
            if(auth == null)
            {
               throw new Error("Authentication undefined: " + authName);
            }
            auth.applyToParams(queryParams,headerParams);
         }
      }
      
      private function onRequestComplete(e:Event) : void
      {
         var de:Object = null;
         var loaderComplete:URLLoader = URLLoader(e.currentTarget);
         try
         {
            de = JsonUtil.fromJson(loaderComplete.data);
            dispatchEvent(new ApiClientEvent(ApiClientEvent.API_CALL_SUCCESS,de));
         }
         catch(e:Error)
         {
            dispatchEvent(new ApiClientEvent(ApiClientEvent.API_CALL_ERROR,null,"Can\'t decode string, JSON required !!"));
         }
         if(de == null)
         {
            dispatchEvent(new ApiClientEvent(ApiClientEvent.API_CALL_ERROR,null,"No information received from the server ..."));
         }
         else if(de.hasOwnProperty("error") && de.error != null)
         {
            switch(typeof de.error)
            {
               case "string":
               case "number":
                  dispatchEvent(new ApiClientEvent(ApiClientEvent.API_CALL_ERROR,null,"ERROR HAAPI API SERVICE: " + de.error + (de.type != null?", " + de.type:"") + (de.message != null?", " + de.message:"")));
                  break;
               case "object":
                  dispatchEvent(new ApiClientEvent(ApiClientEvent.API_CALL_ERROR,null,(de.error.type != null?de.error.type:de.error.code) + " -> " + de.error.message));
                  break;
               default:
                  dispatchEvent(new ApiClientEvent(ApiClientEvent.API_CALL_ERROR,null,"ERROR HAAPI API SERVICE: " + de.error));
            }
         }
      }
      
      private function onError(pEvt:Event) : void
      {
         var errorText:String = "catched an Error type : " + pEvt.type;
         if(pEvt is ErrorEvent)
         {
            dispatchEvent(new ApiClientEvent(ApiClientEvent.API_CALL_ERROR,null,", " + ErrorEvent(pEvt).text + " " + pEvt.target.data));
         }
         else
         {
            dispatchEvent(new ApiClientEvent(ApiClientEvent.API_CALL_ERROR,null,"HAAPI API UNKNOW ERROR " + errorText));
         }
      }
      
      private function getXWWWFormUrlencodedParams(formParams:Dictionary) : String
      {
         var param:* = undefined;
         var encodedFormParams:String = null;
         var keyStr:String = null;
         var valueStr:String = null;
         var formParamBuilder:String = "";
         for(param in formParams)
         {
            keyStr = this.parameterToString(param);
            valueStr = this.parameterToString(formParams[param]);
            try
            {
               formParamBuilder = formParamBuilder + encodeURIComponent(keyStr) + "=" + encodeURIComponent(valueStr) + "&";
            }
            catch(e:Error)
            {
               continue;
            }
         }
         encodedFormParams = formParamBuilder.toString();
         if(encodedFormParams.charAt(encodedFormParams.length - 1) == "&")
         {
            encodedFormParams = encodedFormParams.substring(0,encodedFormParams.length - 1);
         }
         return encodedFormParams;
      }
   }
}
