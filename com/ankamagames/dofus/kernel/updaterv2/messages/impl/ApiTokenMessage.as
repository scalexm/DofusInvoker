package com.ankamagames.dofus.kernel.updaterv2.messages.impl
{
   import com.ankamagames.dofus.kernel.updaterv2.messages.IUpdaterInputMessage;
   
   public class ApiTokenMessage implements IUpdaterInputMessage
   {
       
      
      private var _token:String;
      
      private var _error:int;
      
      public function ApiTokenMessage(token:String = null, error:int = 0)
      {
         super();
         this._token = token;
         this._error = error;
      }
      
      public function deserialize(data:Object) : void
      {
         this._token = data["token"];
         this._error = data["error"];
      }
      
      public function get error() : int
      {
         return this._error;
      }
      
      public function getToken() : String
      {
         return this._token;
      }
   }
}
