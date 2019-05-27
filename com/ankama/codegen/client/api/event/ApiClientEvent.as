package com.ankama.codegen.client.api.event
{
   import flash.events.Event;
   
   public class ApiClientEvent extends Event
   {
      
      public static const API_CALL_SUCCESS:String = "api_call_success";
      
      public static const API_CALL_ERROR:String = "api_call_error";
      
      public static const API_CALL_RESULT:String = "api_call_result";
       
      
      private var _result:Object;
      
      private var _errorMsg:String;
      
      public function ApiClientEvent(type:String, result:Object = null, errorMsg:String = "")
      {
         super(type,false,false);
         this._result = result;
         this._errorMsg = errorMsg;
      }
      
      public function get result() : Object
      {
         return this._result;
      }
      
      public function get errorMsg() : String
      {
         return this._errorMsg;
      }
   }
}
