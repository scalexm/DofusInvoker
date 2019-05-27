package com.ankamagames.dofus.kernel.updaterv2
{
   import com.ankama.zaap.ErrorCode;
   import com.ankama.zaap.ZaapClient;
   import com.ankama.zaap.ZaapError;
   import com.ankamagames.dofus.BuildInfos;
   import com.ankamagames.dofus.kernel.updaterv2.messages.IUpdaterInputMessage;
   import com.ankamagames.dofus.kernel.updaterv2.messages.IUpdaterOutputMessage;
   import com.ankamagames.dofus.kernel.updaterv2.messages.UpdaterMessageFactory;
   import com.ankamagames.dofus.kernel.updaterv2.messages.impl.ApiTokenMessage;
   import com.ankamagames.dofus.kernel.updaterv2.messages.impl.LanguageMessage;
   import com.ankamagames.dofus.kernel.updaterv2.messages.impl.RequestApiTokenMessage;
   import com.ankamagames.dofus.kernel.updaterv2.messages.impl.RequestLanguageMessage;
   import com.ankamagames.dofus.kernel.updaterv2.messages.impl.RequestZaapSettingMessage;
   import com.ankamagames.dofus.kernel.updaterv2.messages.impl.RequestZaapUserInfosMessage;
   import com.ankamagames.dofus.kernel.updaterv2.messages.impl.ZaapSettingMessage;
   import com.ankamagames.dofus.kernel.updaterv2.messages.impl.ZaapUserInfosMessage;
   import com.ankamagames.dofus.misc.utils.StatisticReportingManager;
   import com.ankamagames.jerakine.logger.Log;
   import com.ankamagames.jerakine.logger.Logger;
   import com.ankamagames.jerakine.managers.ErrorManager;
   import com.ankamagames.jerakine.utils.errors.Result;
   import com.ankamagames.jerakine.utils.system.CommandLineArguments;
   import flash.errors.IOError;
   import flash.events.ErrorEvent;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.net.Socket;
   import flash.utils.getQualifiedClassName;
   
   public class UpdaterConnexionHelper
   {
      
      private static const _log:Logger = Log.getLogger(getQualifiedClassName(UpdaterConnexionHelper));
      
      private static const LOCALHOST:String = "127.0.0.1";
       
      
      private var _socket:Socket;
      
      private var _port:int;
      
      private var _handlers:Vector.<IUpdaterMessageHandler>;
      
      private var _buffer:Vector.<IUpdaterOutputMessage>;
      
      private var _partialMsg:String;
      
      private var _zaap:ZaapClient;
      
      private var _zaapLogin:Boolean;
      
      private var _disconnected:Boolean;
      
      private var _waitingResponse:Boolean = false;
      
      public function UpdaterConnexionHelper()
      {
         super();
         this._handlers = new Vector.<IUpdaterMessageHandler>();
         this._buffer = new Vector.<IUpdaterOutputMessage>();
      }
      
      public static function hasZaapArguments() : Boolean
      {
         return CommandLineArguments.getInstance().hasArgument("port") && CommandLineArguments.getInstance().hasArgument("gameName") && CommandLineArguments.getInstance().hasArgument("gameRelease") && CommandLineArguments.getInstance().hasArgument("instanceId") && CommandLineArguments.getInstance().hasArgument("hash") && CommandLineArguments.getInstance().hasArgument("canLogin");
      }
      
      public static function hasUpdaterArgument() : Boolean
      {
         return CommandLineArguments.getInstance().hasArgument("update-server-port");
      }
      
      public static function hasUpdaterOrZaapArguments() : Boolean
      {
         return hasZaapArguments() || hasUpdaterArgument();
      }
      
      public function addObserver(handler:IUpdaterMessageHandler) : void
      {
         this._handlers.push(handler);
      }
      
      public function removeObserver(handler:IUpdaterMessageHandler) : void
      {
         this._handlers.slice(this._handlers.indexOf(handler),1);
      }
      
      public function removeObservers() : void
      {
         this._handlers.splice(0,this._handlers.length);
      }
      
      public function connect() : void
      {
         if(hasZaapArguments())
         {
            this._zaapLogin = CommandLineArguments.getInstance().getArgument("canLogin") == "true";
            if(this._zaap == null)
            {
               this._zaap = new ZaapClient();
            }
            if(this._zaap.connection == null)
            {
               this._zaap.connect(parseInt(CommandLineArguments.getInstance().getArgument("port")),CommandLineArguments.getInstance().getArgument("gameName"),CommandLineArguments.getInstance().getArgument("gameRelease"),parseInt(CommandLineArguments.getInstance().getArgument("instanceId")),CommandLineArguments.getInstance().getArgument("hash"),this.onError,this.onConnectionOpened,this.onConnectionClosed);
            }
         }
         else if(hasUpdaterArgument())
         {
            if(this._socket == null)
            {
               this._socket = new Socket();
               this._port = parseInt(CommandLineArguments.getInstance().getArgument("update-server-port"));
               this.setEventListeners();
            }
            if(!this._socket.connected)
            {
               this._socket.connect(LOCALHOST,this._port);
            }
         }
      }
      
      public function close() : void
      {
         if(this._socket && this._socket.connected)
         {
            this._socket.close();
         }
         if(this._zaap)
         {
            this._zaap.disconnect();
         }
      }
      
      public function isConnected() : Boolean
      {
         if(this._zaap && this._zaap.session != null)
         {
            return true;
         }
         if(this._socket && this._socket.connected)
         {
            return true;
         }
         return false;
      }
      
      public function isDisconnected() : Boolean
      {
         return this._disconnected;
      }
      
      public function isUsingZaap() : Boolean
      {
         return this._zaap != null && this._zaap.connection != null && this._zaap.connection.isOpen();
      }
      
      public function isUsingZaapLogin() : Boolean
      {
         return this._zaapLogin && this.isUsingZaap();
      }
      
      public function canLoginWithZaap() : Boolean
      {
         return this._zaapLogin;
      }
      
      public function disableZaapLogin() : void
      {
         this._zaapLogin = false;
      }
      
      public function sendMessage(msg:IUpdaterOutputMessage) : Boolean
      {
         var lang:String = null;
         var oldValue:Boolean = false;
         var setting:String = null;
         if(hasUpdaterArgument())
         {
            if(msg is RequestLanguageMessage)
            {
               lang = CommandLineArguments.getInstance().getArgument("lang");
               oldValue = this._waitingResponse;
               this.dispatchMessage(new LanguageMessage(lang));
               this._waitingResponse = oldValue;
               _log.info("Updater language: " + lang);
               return true;
            }
            if(msg is RequestZaapSettingMessage)
            {
               _log.warn("Cannot ask Zaap setting to updater.");
               return false;
            }
            if(msg is RequestZaapUserInfosMessage)
            {
               _log.warn("Cannot ask user infos to updater.");
               return false;
            }
         }
         if(!this.isConnected() || this._waitingResponse)
         {
            this._buffer.push(msg);
            return false;
         }
         if(this._zaap)
         {
            if(msg is RequestApiTokenMessage)
            {
               _log.info("Asking Zaap an API token...");
               this._zaap.client.auth_getGameToken(this._zaap.session,RequestApiTokenMessage(msg).gameId,this.onAuthTokenError,this.onAuthTokenSuccess);
               this._waitingResponse = true;
            }
            else if(msg is RequestLanguageMessage)
            {
               _log.info("Asking Zaap language...");
               this._zaap.client.settings_get(this._zaap.session,"language",this.onLanguageGetError,this.onLanguageGetSuccess);
               this._waitingResponse = true;
            }
            else if(msg is RequestZaapSettingMessage)
            {
               setting = RequestZaapSettingMessage(msg).name;
               _log.info("Asking Zaap parameter " + setting + "...");
               this._zaap.client.settings_get(this._zaap.session,setting,function(e:Error):void
               {
                  onSettingGetError(setting,e);
               },function(value:String):void
               {
                  onSettingGetSuccess(setting,value);
               });
               this._waitingResponse = true;
            }
            else if(msg is RequestZaapUserInfosMessage)
            {
               _log.info("Asking Zaap user infos...");
               this._zaap.client.userInfo_get(this._zaap.session,this.onUserInfosGetError,this.onUserInfosGetSuccess);
               this._waitingResponse = true;
            }
         }
         else
         {
            try
            {
               _log.info("Send to updater " + msg);
               _log.info(msg.serialize());
               this._socket.writeUTFBytes(msg.serialize());
               this._socket.flush();
               this._waitingResponse = true;
            }
            catch(e:Error)
            {
               _log.error("Sending updater message failed (reason : [" + e.errorID + "] " + e.message + ")");
               return false;
            }
         }
         return true;
      }
      
      public function requestZaapRestart(callback:Function) : void
      {
         this._zaap.client.release_restartOnExit(this._zaap.session,function(e:Error):void
         {
            onrequestZaapRestartError(e);
            callback();
         },callback);
      }
      
      private function onrequestZaapRestartError(e:Error) : void
      {
         if(e is ZaapError)
         {
            this.onError(new ErrorEvent(ErrorCode.VALUES_TO_NAMES[ZaapError(e).code],false,false,ZaapError(e).details,ZaapError(e).code));
         }
         else
         {
            this.onError(new ErrorEvent(e.name,false,false,e.message,e.errorID));
         }
      }
      
      private function onUserInfosGetError(e:Error) : void
      {
         if(e is ZaapError)
         {
            this.dispatchMessage(new ZaapUserInfosMessage(null,ZaapError(e).code));
         }
         else
         {
            this.onError(new ErrorEvent(e.name,false,false,e.message,e.errorID));
         }
      }
      
      private function onUserInfosGetSuccess(value:String) : void
      {
         var result:Result = ErrorManager.tryFunction(com.ankamagames.jerakine.json.JSON.decode,[value]);
         if(result.success)
         {
            this.dispatchMessage(new ZaapUserInfosMessage(result.result.login));
         }
         else
         {
            _log.warn("Error during Zaap JSON decoding for user infos : " + result.stackTrace);
            this.dispatchMessage(new ZaapUserInfosMessage(null,ErrorCode.UNKNOWN));
         }
      }
      
      private function onSettingGetError(name:String, e:Error) : void
      {
         if(e is ZaapError)
         {
            this.dispatchMessage(new ZaapSettingMessage(name,null,ZaapError(e).code));
         }
         else
         {
            this.onError(new ErrorEvent(e.name,false,false,e.message,e.errorID));
         }
      }
      
      private function onSettingGetSuccess(name:String, value:String) : void
      {
         var result:Result = ErrorManager.tryFunction(com.ankamagames.jerakine.json.JSON.decode,[value]);
         if(result.success)
         {
            value = result.result;
            _log.info("Zaap setting : " + name + " = " + value);
            this.dispatchMessage(new ZaapSettingMessage(name,value));
         }
         else
         {
            _log.warn("Error during Zaap JSON decoding for setting " + name + " : " + result.stackTrace);
            this.dispatchMessage(new ZaapSettingMessage(name,null,ErrorCode.UNKNOWN));
         }
      }
      
      private function onLanguageGetError(e:Error) : void
      {
         if(e is ZaapError)
         {
            this.dispatchMessage(new LanguageMessage(null,ZaapError(e).code));
         }
         else
         {
            this.onError(new ErrorEvent(e.name,false,false,e.message,e.errorID));
         }
      }
      
      private function onLanguageGetSuccess(value:String) : void
      {
         var result:Result = ErrorManager.tryFunction(com.ankamagames.jerakine.json.JSON.decode,[value]);
         if(result.success)
         {
            value = result.result;
            _log.info("Language: " + value);
            this.dispatchMessage(new LanguageMessage(value));
         }
         else
         {
            _log.warn("Error during language JSON decoding : " + result.stackTrace);
            this.dispatchMessage(new LanguageMessage(null,ErrorCode.UNKNOWN));
         }
      }
      
      private function onAuthTokenError(e:Error) : void
      {
         if(e is ZaapError)
         {
            this.dispatchMessage(new ApiTokenMessage(null,ZaapError(e).code));
         }
         else
         {
            this.onError(new ErrorEvent(e.name,false,false,e.message,e.errorID));
         }
      }
      
      private function onAuthTokenSuccess(token:String) : void
      {
         _log.info("Auth token: " + token);
         this.dispatchMessage(new ApiTokenMessage(token));
      }
      
      private function dispatchConnected() : void
      {
         for(var i:int = 0; i < this._handlers.length; i++)
         {
            this._handlers[i].handleConnectionOpened();
         }
      }
      
      private function dispatchRageQuit() : void
      {
         if(this._disconnected)
         {
            return;
         }
         this._disconnected = true;
         _log.info((!!hasZaapArguments()?"Zaap":"Updater") + " connection has been closed.");
         for(var i:int = 0; i < this._handlers.length; i++)
         {
            this._handlers[i].handleConnectionClosed();
         }
      }
      
      private function dispatchMessage(msg:IUpdaterInputMessage) : void
      {
         this._waitingResponse = false;
         for(var i:int = 0; i < this._handlers.length; i++)
         {
            this._handlers[i].handleMessage(msg);
         }
         this.resumeMessages();
      }
      
      private function resumeMessages() : void
      {
         for(var i:int = 0; i < this._buffer.length; i++)
         {
            this.sendMessage(this._buffer.shift());
         }
      }
      
      private function onConnectionOpened(event:Event = null) : void
      {
         if(this._zaap && this._zaap.session != null)
         {
            _log.info("Connected to Zaap on port : " + CommandLineArguments.getInstance().getArgument("port") + " with session " + this._zaap.session);
         }
         else
         {
            _log.info("Connected to the updater on port : " + this._port);
            this._socket.removeEventListener(Event.CONNECT,this.onConnectionOpened);
         }
         StatisticReportingManager.getInstance().report((this._zaap && this._zaap.session != null?"ZaapConnection":"UpdaterConnexion") + " - " + BuildInfos.BUILD_TYPE + " - " + BuildInfos.VERSION,"success");
         this.dispatchConnected();
         this.resumeMessages();
      }
      
      private function onConnectionClosed(event:Event) : void
      {
         this.removeEventListeners();
         this.dispatchRageQuit();
      }
      
      private function onError(event:ErrorEvent) : void
      {
         _log.error("Error : [" + event.errorID + "] " + event.text);
         if(hasZaapArguments())
         {
            StatisticReportingManager.getInstance().report("ZaapConnection - " + BuildInfos.BUILD_TYPE + " - " + BuildInfos.VERSION,"failed [" + event.text + "]");
         }
         else if(hasUpdaterArgument())
         {
            StatisticReportingManager.getInstance().report("UpdaterConnexion - " + BuildInfos.BUILD_TYPE + " - " + BuildInfos.VERSION,"failed [" + event.text + "]");
         }
         else
         {
            StatisticReportingManager.getInstance().report("UpdaterConnexion - " + BuildInfos.BUILD_TYPE + " - " + BuildInfos.VERSION,"noupdater [" + event.text + "]");
         }
         this.removeEventListeners();
         this.dispatchRageQuit();
      }
      
      private function onSocketData(event:ProgressEvent) : void
      {
         var content:String = null;
         var messages:Vector.<String> = null;
         var i:int = 0;
         var contentJSON:Object = null;
         var message:IUpdaterInputMessage = null;
         try
         {
            content = this._socket.readUTFBytes(this._socket.bytesAvailable);
            messages = this.splitPacket(content);
            for(i = 0; i < messages.length; )
            {
               try
               {
                  contentJSON = com.ankamagames.jerakine.json.JSON.decode(messages[i]);
                  message = UpdaterMessageFactory.getUpdaterMessage(contentJSON);
                  if(this._handlers.length == 0)
                  {
                     _log.error("No handler to process Updater input message : " + content);
                  }
                  else
                  {
                     this.dispatchMessage(message);
                  }
               }
               catch(e:Error)
               {
                  _log.error("Malformed updater packet : " + messages[i] + " [" + e.errorID + " " + e.message + "]");
               }
               i++;
            }
            return;
         }
         catch(ioe:IOError)
         {
            _log.error("Error during reading packet : [" + ioe.errorID + " " + ioe.message + "]");
            return;
         }
      }
      
      private function splitPacket(raw:String) : Vector.<String>
      {
         var c:String = null;
         if(this._partialMsg)
         {
            raw = this._partialMsg + raw;
            this._partialMsg = null;
         }
         var depth:int = 0;
         var message:String = "";
         var messages:Vector.<String> = new Vector.<String>();
         var currentMsgStartIdx:Number = 0;
         for(var i:int = 0; i < raw.length; )
         {
            c = raw.charAt(i);
            if(c == "{")
            {
               if(depth == 0)
               {
                  currentMsgStartIdx = i;
               }
               depth++;
            }
            else if(c == "}")
            {
               depth--;
            }
            message = message + c;
            if(depth == 0)
            {
               if(message != "\n")
               {
                  messages.push(message);
               }
               message = "";
            }
            i++;
         }
         if(depth != 0)
         {
            this._partialMsg = raw.substring(currentMsgStartIdx,raw.length);
         }
         return messages;
      }
      
      protected function setEventListeners() : void
      {
         if(this._socket)
         {
            this._socket.addEventListener(Event.CONNECT,this.onConnectionOpened);
            this._socket.addEventListener(Event.CLOSE,this.onConnectionClosed);
            this._socket.addEventListener(IOErrorEvent.IO_ERROR,this.onError);
            this._socket.addEventListener(ProgressEvent.SOCKET_DATA,this.onSocketData);
         }
      }
      
      protected function removeEventListeners() : void
      {
         if(this._socket)
         {
            this._socket.removeEventListener(Event.CONNECT,this.onConnectionOpened);
            this._socket.removeEventListener(Event.CLOSE,this.onConnectionClosed);
            this._socket.removeEventListener(IOErrorEvent.IO_ERROR,this.onError);
            this._socket.removeEventListener(ProgressEvent.SOCKET_DATA,this.onSocketData);
         }
      }
   }
}
