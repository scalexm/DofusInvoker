package com.ankama.codegen.client.api.auth
{
   import flash.utils.Dictionary;
   import mx.utils.Base64Encoder;
   
   public class HttpBasicAuth implements Authentication
   {
       
      
      private var username:String;
      
      private var password:String;
      
      public function HttpBasicAuth()
      {
         super();
      }
      
      public function getUsername() : String
      {
         return this.username;
      }
      
      public function setUsername(username:String) : void
      {
         this.username = username;
      }
      
      public function getPassword() : String
      {
         return this.password;
      }
      
      public function setPassword(password:String) : void
      {
         this.password = password;
      }
      
      public function applyToParams(queryParams:Dictionary, headerParams:Dictionary) : void
      {
         var b64:Base64Encoder = null;
         var str:String = (this.username == null?"":this.username) + ":" + (this.password == null?"":this.password);
         try
         {
            b64 = new Base64Encoder();
            b64.encodeUTFBytes(str);
            headerParams["Authorization"] = "Basic " + b64.toString();
         }
         catch(e:Error)
         {
            throw e;
         }
      }
   }
}
