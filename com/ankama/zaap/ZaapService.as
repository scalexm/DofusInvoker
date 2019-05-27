package com.ankama.zaap
{
   public interface ZaapService
   {
       
      
      function connect(param1:String, param2:String, param3:int, param4:String, param5:Function, param6:Function) : void;
      
      function auth_getGameToken(param1:String, param2:int, param3:Function, param4:Function) : void;
      
      function updater_isUpdateAvailable(param1:String, param2:Function, param3:Function) : void;
      
      function settings_get(param1:String, param2:String, param3:Function, param4:Function) : void;
      
      function settings_set(param1:String, param2:String, param3:String, param4:Function, param5:Function) : void;
      
      function userInfo_get(param1:String, param2:Function, param3:Function) : void;
      
      function release_restartOnExit(param1:String, param2:Function, param3:Function) : void;
   }
}
