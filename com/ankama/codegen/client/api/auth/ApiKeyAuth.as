package com.ankama.codegen.client.api.auth
{
   import flash.utils.Dictionary;
   
   public class ApiKeyAuth implements Authentication
   {
       
      
      private var location:String;
      
      private var paramName:String;
      
      private var apiKey:String;
      
      private var apiKeyPrefix:String;
      
      public function ApiKeyAuth(location:String, paramName:String)
      {
         super();
         this.location = location;
         this.paramName = paramName;
      }
      
      public function getLocation() : String
      {
         return this.location;
      }
      
      public function getParamName() : String
      {
         return this.paramName;
      }
      
      public function getApiKey() : String
      {
         return this.apiKey;
      }
      
      public function setApiKey(apiKey:String) : void
      {
         this.apiKey = apiKey;
      }
      
      public function getApiKeyPrefix() : String
      {
         return this.apiKeyPrefix;
      }
      
      public function setApiKeyPrefix(apiKeyPrefix:String) : void
      {
         this.apiKeyPrefix = apiKeyPrefix;
      }
      
      public function applyToParams(queryParams:Dictionary, headerParams:Dictionary) : void
      {
         var value:String = null;
         if(this.apiKeyPrefix != null)
         {
            value = this.apiKeyPrefix + " " + this.apiKey;
         }
         else
         {
            value = this.apiKey;
         }
         if(this.location == "query")
         {
            queryParams[this.paramName] = value;
         }
         else if(this.location == "header")
         {
            headerParams[this.paramName] = value;
         }
      }
   }
}
