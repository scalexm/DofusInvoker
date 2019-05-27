package com.ankama.codegen.client.api
{
   import flash.utils.Dictionary;
   
   public class ApiError extends Error
   {
       
      
      private var code:int = 0;
      
      private var responseHeaders:Dictionary = null;
      
      private var responseBody:String = "";
      
      public function ApiError(code:int = 0, message:String = "", responseHeaders:Dictionary = null, responseBody:String = "")
      {
         super();
         this.code = code;
         this.message = message;
         this.responseHeaders = responseHeaders;
         this.responseBody = responseBody;
      }
      
      public function getCode() : int
      {
         return this.code;
      }
      
      public function getMessage() : String
      {
         return message;
      }
      
      public function getResponseHeaders() : Dictionary
      {
         return this.responseHeaders;
      }
      
      public function getResponseBody() : String
      {
         return this.responseBody;
      }
      
      public function toString() : String
      {
         return "ApiError{" + this.responseBody + "\'" + "}";
      }
   }
}
