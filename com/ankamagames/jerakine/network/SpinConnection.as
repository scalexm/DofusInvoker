package com.ankamagames.jerakine.network
{
   import com.ankamagames.jerakine.logger.Log;
   import com.ankamagames.jerakine.logger.Logger;
   import com.ankamagames.jerakine.utils.crypto.X509Certificate;
   import com.ankamagames.jerakine.utils.misc.DeviceUtils;
   import com.ankamagames.jerakine.utils.spin.UuidUtils;
   import com.ankamagames.jerakine.utils.spin.VersionUtils;
   import com.hurlant.crypto.rsa.RSAKey;
   import com.netease.protobuf.Int64;
   import com.netease.protobuf.Message;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   import flash.events.TimerEvent;
   import flash.net.Socket;
   import flash.system.Capabilities;
   import flash.utils.ByteArray;
   import flash.utils.Dictionary;
   import flash.utils.Timer;
   import flash.utils.getQualifiedClassName;
   import spin.ServiceId;
   import spin.auth.Credentials;
   import spin.auth.SelectScheme;
   import spin.auth.Start;
   import spin.auth.ankama.AuthSuccess;
   import spin.auth.ankama.ClientSpecs;
   import spin.auth.ankama.ClientSpecs.ClientType;
   import spin.auth.ankama.ClientSpecs.Device;
   import spin.auth.ankama.ClientSpecs.OS;
   import spin.auth.ankama.EncryptionDetails;
   import spin.auth.ankama.EncryptionDetailsRequest;
   import spin.auth.ankama.Token;
   import spin.proxy.ClientToProxy;
   import spin.proxy.Disconnection;
   import spin.proxy.Heartbeat;
   import spin.proxy.Ping;
   import spin.proxy.Pong;
   import spin.proxy.ProxyToClient;
   import spin.proxy.SessionCreationResult;
   import spin.proxy.VersionsUsed;
   import spin.proxy.VersionsUsed.Version;
   
   public class SpinConnection
   {
      
      protected static const _log:Logger = Log.getLogger(getQualifiedClassName(SpinConnection));
      
      protected static const SIMPLE:String = "simple";
      
      protected static const LOGIN_PASSWORD:String = "ankama-login-password";
      
      protected static const TOKEN:String = "ankama-token";
      
      private static const SPIN_PROXY_SERVICE:String = "spin:proxy";
      
      private static const SPIN_AUTH_SERVICE:String = "spin:authentication";
      
      private static const MAX_RECONNECT_TRY_COUNT:uint = 3;
      
      private static const RECONNECT_TRY_DELAY:Number = 2000;
      
      private static const HEARTBEAT_DELAY:Number = 1000;
      
      private static const PING_DELAY:Number = 10000;
      
      private static const PONG_TIMEOUT:Number = 10000;
      
      private static const LOG_SIMPLE_MESSAGES:Boolean = false;
       
      
      protected var _nickname:String;
      
      protected var _selectedScheme:String;
      
      private var _socket:Socket;
      
      private var _messageTypes:Dictionary;
      
      private var _reconnectionTryCount:uint = 0;
      
      private var _reconnectTimer:Timer;
      
      private var _heartbeatTimer:Timer;
      
      private var _pingTimer:Timer;
      
      private var _pongTimer:Timer;
      
      private var _offline:Boolean = true;
      
      private var _authenticated:Boolean = true;
      
      private var _version:Version;
      
      private var _host:String;
      
      private var _port:int;
      
      public function SpinConnection(messageTypes:Dictionary, version:Version, host:String, port:int)
      {
         super();
         this._messageTypes = merge(merge(AnkamaAuthProtocol.messageTypes,SpinProtocol.messageTypes),messageTypes);
         this._version = version;
         this._host = host;
         this._port = port;
         this._socket = new Socket();
         this._socket.addEventListener(Event.CONNECT,this.onConnect);
         this._socket.addEventListener(ProgressEvent.SOCKET_DATA,this.onData);
         this._socket.addEventListener(IOErrorEvent.IO_ERROR,this.onIOError);
         this._socket.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onSecurityError);
         this._socket.addEventListener(Event.CLOSE,this.onClose);
         this._reconnectTimer = new Timer(RECONNECT_TRY_DELAY,1);
         this._reconnectTimer.addEventListener(TimerEvent.TIMER_COMPLETE,function(event:TimerEvent):void
         {
            connect();
         });
         this._heartbeatTimer = new Timer(HEARTBEAT_DELAY);
         this._heartbeatTimer.addEventListener(TimerEvent.TIMER,function(event:TimerEvent):void
         {
            sendHeartbeat();
         });
         this._pingTimer = new Timer(PING_DELAY);
         this._pingTimer.addEventListener(TimerEvent.TIMER,function(event:TimerEvent):void
         {
            sendPing();
         });
         this._pongTimer = new Timer(PONG_TIMEOUT,1);
         this._pongTimer.addEventListener(TimerEvent.TIMER_COMPLETE,this.onPongTimeout);
      }
      
      private static function merge(a:Dictionary, b:Dictionary) : Dictionary
      {
         var uuid:* = null;
         var result:Dictionary = new Dictionary();
         for(uuid in a)
         {
            result[uuid] = a[uuid];
         }
         for(uuid in b)
         {
            result[uuid] = b[uuid];
         }
         return result;
      }
      
      private static function get clientSpecs() : ClientSpecs
      {
         var result:ClientSpecs = new ClientSpecs();
         result.clientType = ClientType.STANDALONE;
         result.deviceId = DeviceUtils.deviceUniqueIdentifier;
         result.device = Device.PC;
         if(Capabilities.os.indexOf("Linux") != -1)
         {
            result.os = OS.LINUX;
         }
         else if(Capabilities.os.indexOf("Mac OS") != -1)
         {
            result.os = OS.MACOS;
         }
         else
         {
            result.os = OS.WINDOWS;
         }
         return result;
      }
      
      private function onSecurityError(event:SecurityErrorEvent) : void
      {
         _log.error("Connection security error : " + event.toString());
         this.tryReconnect();
      }
      
      private function onIOError(event:IOErrorEvent) : void
      {
         _log.error("Connection IO error : " + event.toString());
         this.tryReconnect();
      }
      
      private function onClose(event:Event) : void
      {
         _log.warn("Connection closed.");
         this.tryReconnect();
      }
      
      public function connect() : void
      {
         if(this._socket.connected)
         {
            _log.warn("Already connected, aborting");
            return;
         }
         this._offline = false;
         this._reconnectTimer.reset();
         _log.info("Connecting to " + this._host + ":" + this._port + "...");
         this._socket.connect(this._host,this._port);
      }
      
      public function disconnect() : void
      {
         this._offline = true;
         this._heartbeatTimer.reset();
         this._reconnectTimer.reset();
         this._pingTimer.reset();
         this._pongTimer.reset();
         this._reconnectionTryCount = 0;
         if(this._socket.connected)
         {
            this._socket.close();
         }
         if(this._authenticated)
         {
            this._authenticated = false;
            this.onDisconnected();
         }
      }
      
      protected function tryReconnect() : void
      {
         if(this._reconnectTimer.running)
         {
            return;
         }
         if(this._offline)
         {
            return;
         }
         this._heartbeatTimer.reset();
         this._pingTimer.reset();
         this._pongTimer.reset();
         if(this._socket.connected)
         {
            this._socket.close();
         }
         if(this._authenticated)
         {
            this._authenticated = false;
            this.onDisconnected();
         }
         if(this._reconnectionTryCount == MAX_RECONNECT_TRY_COUNT)
         {
            _log.warn("Max attempt exceeded, aborting connection");
            return;
         }
         this._reconnectionTryCount++;
         this._reconnectTimer.start();
         _log.info("Will try to reconnect, attempt " + this._reconnectionTryCount + "/" + MAX_RECONNECT_TRY_COUNT);
      }
      
      private function onData(event:ProgressEvent) : void
      {
         var length:uint = 0;
         var data:ByteArray = null;
         var msg:ProxyToClient = null;
         while(this._socket.connected && this._socket.bytesAvailable > 0)
         {
            length = this._socket.readUnsignedInt();
            data = new ByteArray();
            this._socket.readBytes(data,0,length - 4);
            msg = new ProxyToClient();
            msg.mergeFrom(data);
            this.parse(msg);
         }
      }
      
      private function onConnect(event:Event) : void
      {
         _log.info("Connected");
         var msg:VersionsUsed = new VersionsUsed();
         msg.app = this._version;
         msg.spin = VersionUtils.toVersion("2.0.3");
         this.send(msg,SPIN_PROXY_SERVICE);
      }
      
      protected function send(msg:Message, service:String = null) : void
      {
         var hideLog:Boolean = false;
         if(!this._socket.connected)
         {
            _log.warn("Socket is not connected, cannot send " + getQualifiedClassName(msg));
            return;
         }
         var data:ByteArray = new ByteArray();
         var wrapper:ClientToProxy = new ClientToProxy();
         wrapper.data = new ByteArray();
         msg.writeTo(wrapper.data);
         if(service)
         {
            wrapper.serviceId = new ServiceId();
            wrapper.serviceId.id = service;
         }
         wrapper.messageUuid = UuidUtils.stringToUuid(msg["uid"]);
         wrapper.writeTo(data);
         this._socket.writeUnsignedInt(data.length + 4);
         this._socket.writeBytes(data);
         var msgString:String = msg.toString();
         if(ServerConnection.DEBUG_VERBOSE)
         {
            hideLog = !LOG_SIMPLE_MESSAGES && (msg is Heartbeat || msg is Ping);
            if(!hideLog)
            {
               _log.info("Sending message " + getQualifiedClassName(msg) + (!!service?" to service " + service:" without service ") + (!!msgString?" => " + msgString:""));
            }
         }
         this._socket.flush();
      }
      
      private function parse(msg:ProxyToClient) : void
      {
         var messageType:Class = null;
         var msgString:String = null;
         var hideLog:Boolean = false;
         var uuid:String = UuidUtils.uuidToString(msg.messageUuid);
         messageType = this._messageTypes[uuid];
         if(!messageType)
         {
            _log.error("Unknown packet received (id : " + uuid + ")");
            return;
         }
         var message:Message = new messageType();
         try
         {
            message.mergeFrom(msg.data);
            msgString = message.toString();
            if(ServerConnection.DEBUG_VERBOSE)
            {
               hideLog = !LOG_SIMPLE_MESSAGES && message is Pong;
               if(!hideLog)
               {
                  _log.info("Received " + getQualifiedClassName(messageType) + (!!msgString?" => " + msgString:""));
               }
            }
         }
         catch(e:Error)
         {
            _log.error("Error during deserialization of message " + getQualifiedClassName(messageType) + " : " + e.message + "\n" + e.getStackTrace());
            return;
         }
         this.onMessage(message);
      }
      
      protected function onMessage(msg:Message) : void
      {
         var start:Start = null;
         var encryptionDetails:EncryptionDetails = null;
         var authSuccess:AuthSuccess = null;
         var sessionCreationResult:SessionCreationResult = null;
         switch(true)
         {
            case msg is Start:
               start = msg as Start;
               if(start.schemes.indexOf(TOKEN) != -1)
               {
                  this._selectedScheme = TOKEN;
                  _log.info("Selected scheme : " + this._selectedScheme);
                  this.requestAuthDetails();
                  break;
               }
               if(start.schemes.indexOf(LOGIN_PASSWORD) != -1)
               {
                  _log.error("Scheme " + LOGIN_PASSWORD + " is not handled.");
                  return;
               }
               if(start.schemes.indexOf(SIMPLE) != -1)
               {
                  _log.error("Scheme " + SIMPLE + " is not handled.");
                  return;
               }
               _log.error("No handled scheme available : " + start.schemes);
               return;
            case msg is EncryptionDetails:
               encryptionDetails = msg as EncryptionDetails;
               this.send(this.createAuthMessage(encryptionDetails,this.getAuthDetails()),SPIN_AUTH_SERVICE);
               break;
            case msg is AuthSuccess:
               authSuccess = msg as AuthSuccess;
               this._nickname = authSuccess.nickName;
               this._reconnectionTryCount = 0;
               break;
            case msg is SessionCreationResult:
               sessionCreationResult = msg as SessionCreationResult;
               if(sessionCreationResult.success)
               {
                  _log.info("Authentication success");
                  this._authenticated = true;
                  this._heartbeatTimer.start();
                  this._pingTimer.start();
                  this.onAuthenticated();
                  break;
               }
               _log.error("Session creation failed : " + sessionCreationResult);
               this.tryReconnect();
               break;
            case msg is Disconnection:
               this.tryReconnect();
               break;
            case msg is Pong:
               this._pongTimer.reset();
         }
      }
      
      protected function onAuthenticated() : void
      {
      }
      
      protected function onDisconnected() : void
      {
      }
      
      protected function requestAuthDetails() : void
      {
         throw new Error("requestAuthDetails() is an abstract method, it must be implemented and must call onAuthDetailsReady() when auth details are available");
      }
      
      protected function getAuthDetails() : Array
      {
         throw new Error("getAuthDetails() is an abstract method, it must be implemented");
      }
      
      protected function onAuthDetailsReady() : void
      {
         var selectScheme:SelectScheme = new SelectScheme();
         selectScheme.scheme = this._selectedScheme;
         this.send(selectScheme,SPIN_AUTH_SERVICE);
         this.send(new EncryptionDetailsRequest(),SPIN_AUTH_SERVICE);
      }
      
      private function sendHeartbeat() : void
      {
         this.send(new Heartbeat());
      }
      
      private function sendPing() : void
      {
         this.send(new Ping(),SPIN_PROXY_SERVICE);
         this._pongTimer.start();
      }
      
      private function onPongTimeout(event:TimerEvent) : void
      {
         _log.warn("Ping timeout, closing connection...");
         this.tryReconnect();
      }
      
      private function createAuthMessage(details:EncryptionDetails, args:Array) : Message
      {
         var rsa:RSAKey = null;
         var salt:Int64 = null;
         var simplePassword:String = null;
         var simpleAuth:spin.auth.Credentials = null;
         var login:String = null;
         var password:String = null;
         var loginBytes:ByteArray = null;
         var passwordBytes:ByteArray = null;
         var encryptedLogin:ByteArray = null;
         var encryptedPassword:ByteArray = null;
         var loginPasswordAuth:spin.auth.ankama.Credentials = null;
         var token:String = null;
         var tokenBytes:ByteArray = null;
         var encryptedToken:ByteArray = null;
         var tokenAuth:Token = null;
         switch(this._selectedScheme)
         {
            case SIMPLE:
               simplePassword = String(args[0]);
               simpleAuth = new spin.auth.Credentials();
               simpleAuth.password = simplePassword;
               return simpleAuth;
            case LOGIN_PASSWORD:
               login = String(args[0]);
               password = String(args[1]);
               details.cert.position = 0;
               rsa = X509Certificate.decode(details.cert);
               salt = details.salt;
               loginBytes = new ByteArray();
               loginBytes.writeUTFBytes(salt + login);
               passwordBytes = new ByteArray();
               passwordBytes.writeUTFBytes(salt + password);
               encryptedLogin = new ByteArray();
               rsa.encrypt(loginBytes,encryptedLogin,loginBytes.length);
               encryptedPassword = new ByteArray();
               rsa.encrypt(passwordBytes,encryptedPassword,passwordBytes.length);
               loginPasswordAuth = new spin.auth.ankama.Credentials();
               loginPasswordAuth.login = encryptedLogin;
               loginPasswordAuth.password = encryptedPassword;
               loginPasswordAuth.client = clientSpecs;
               loginPasswordAuth.encrypted = true;
               return loginPasswordAuth;
            case TOKEN:
               token = String(args[0]);
               details.cert.position = 0;
               rsa = X509Certificate.decode(details.cert);
               salt = details.salt;
               tokenBytes = new ByteArray();
               tokenBytes.writeUTFBytes(salt + token);
               encryptedToken = new ByteArray();
               rsa.encrypt(tokenBytes,encryptedToken,tokenBytes.length);
               tokenAuth = new Token();
               tokenAuth.token = encryptedToken;
               tokenAuth.client = clientSpecs;
               tokenAuth.encrypted = true;
               return tokenAuth;
            default:
               return null;
         }
      }
   }
}
