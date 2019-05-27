package com.ankama.zaap
{
   import org.apache.thrift.TApplicationError;
   import org.apache.thrift.TError;
   import org.apache.thrift.protocol.TMessage;
   import org.apache.thrift.protocol.TMessageType;
   import org.apache.thrift.protocol.TProtocol;
   
   public class ZaapServiceImpl implements ZaapService
   {
       
      
      protected var iprot_:TProtocol;
      
      protected var oprot_:TProtocol;
      
      protected var seqid_:int;
      
      public function ZaapServiceImpl(param1:TProtocol, param2:TProtocol = null)
      {
         super();
         this.iprot_ = param1;
         if(param2 == null)
         {
            this.oprot_ = param1;
         }
         else
         {
            this.oprot_ = param2;
         }
      }
      
      public function getInputProtocol() : TProtocol
      {
         return this.iprot_;
      }
      
      public function getOutputProtocol() : TProtocol
      {
         return this.oprot_;
      }
      
      public function connect(param1:String, param2:String, param3:int, param4:String, param5:Function, param6:Function) : void
      {
         var gameName:String = param1;
         var releaseName:String = param2;
         var instanceId:int = param3;
         var hash:String = param4;
         var onError:Function = param5;
         var onSuccess:Function = param6;
         this.oprot_.writeMessageBegin(new TMessage("connect",TMessageType.CALL,this.seqid_));
         var args:connect_args = new connect_args();
         args.gameName = gameName;
         args.releaseName = releaseName;
         args.instanceId = instanceId;
         args.hash = hash;
         args.write(this.oprot_);
         this.oprot_.writeMessageEnd();
         this.oprot_.getTransport().flush(function(param1:Error):void
         {
            var msg:TMessage = null;
            var result:connect_result = null;
            var x:TApplicationError = null;
            var error:Error = param1;
            try
            {
               if(error != null)
               {
                  if(onError != null)
                  {
                     onError(error);
                  }
                  return;
               }
               msg = iprot_.readMessageBegin();
               if(msg.type == TMessageType.EXCEPTION)
               {
                  x = TApplicationError.read(iprot_);
                  iprot_.readMessageEnd();
                  if(onError != null)
                  {
                     onError(x);
                  }
                  return;
               }
               result = new connect_result();
               result.read(iprot_);
               iprot_.readMessageEnd();
               if(result.isSetSuccess())
               {
                  if(onSuccess != null)
                  {
                     onSuccess(result.success);
                  }
                  return;
               }
               if(result.error != null)
               {
                  if(onError != null)
                  {
                     onError(result.error);
                  }
                  return;
               }
               if(onError != null)
               {
                  onError(new TApplicationError(TApplicationError.MISSING_RESULT,"connect failed: unknown result"));
               }
               return;
            }
            catch(e:TError)
            {
               if(onError != null)
               {
                  onError(e);
               }
               return;
            }
         });
      }
      
      public function auth_getGameToken(param1:String, param2:int, param3:Function, param4:Function) : void
      {
         var gameSession:String = param1;
         var gameId:int = param2;
         var onError:Function = param3;
         var onSuccess:Function = param4;
         this.oprot_.writeMessageBegin(new TMessage("auth_getGameToken",TMessageType.CALL,this.seqid_));
         var args:auth_getGameToken_args = new auth_getGameToken_args();
         args.gameSession = gameSession;
         args.gameId = gameId;
         args.write(this.oprot_);
         this.oprot_.writeMessageEnd();
         this.oprot_.getTransport().flush(function(param1:Error):void
         {
            var msg:TMessage = null;
            var result:auth_getGameToken_result = null;
            var x:TApplicationError = null;
            var error:Error = param1;
            try
            {
               if(error != null)
               {
                  if(onError != null)
                  {
                     onError(error);
                  }
                  return;
               }
               msg = iprot_.readMessageBegin();
               if(msg.type == TMessageType.EXCEPTION)
               {
                  x = TApplicationError.read(iprot_);
                  iprot_.readMessageEnd();
                  if(onError != null)
                  {
                     onError(x);
                  }
                  return;
               }
               result = new auth_getGameToken_result();
               result.read(iprot_);
               iprot_.readMessageEnd();
               if(result.isSetSuccess())
               {
                  if(onSuccess != null)
                  {
                     onSuccess(result.success);
                  }
                  return;
               }
               if(result.error != null)
               {
                  if(onError != null)
                  {
                     onError(result.error);
                  }
                  return;
               }
               if(onError != null)
               {
                  onError(new TApplicationError(TApplicationError.MISSING_RESULT,"auth_getGameToken failed: unknown result"));
               }
               return;
            }
            catch(e:TError)
            {
               if(onError != null)
               {
                  onError(e);
               }
               return;
            }
         });
      }
      
      public function updater_isUpdateAvailable(param1:String, param2:Function, param3:Function) : void
      {
         var gameSession:String = param1;
         var onError:Function = param2;
         var onSuccess:Function = param3;
         this.oprot_.writeMessageBegin(new TMessage("updater_isUpdateAvailable",TMessageType.CALL,this.seqid_));
         var args:updater_isUpdateAvailable_args = new updater_isUpdateAvailable_args();
         args.gameSession = gameSession;
         args.write(this.oprot_);
         this.oprot_.writeMessageEnd();
         this.oprot_.getTransport().flush(function(param1:Error):void
         {
            var msg:TMessage = null;
            var result:updater_isUpdateAvailable_result = null;
            var x:TApplicationError = null;
            var error:Error = param1;
            try
            {
               if(error != null)
               {
                  if(onError != null)
                  {
                     onError(error);
                  }
                  return;
               }
               msg = iprot_.readMessageBegin();
               if(msg.type == TMessageType.EXCEPTION)
               {
                  x = TApplicationError.read(iprot_);
                  iprot_.readMessageEnd();
                  if(onError != null)
                  {
                     onError(x);
                  }
                  return;
               }
               result = new updater_isUpdateAvailable_result();
               result.read(iprot_);
               iprot_.readMessageEnd();
               if(result.isSetSuccess())
               {
                  if(onSuccess != null)
                  {
                     onSuccess(result.success);
                  }
                  return;
               }
               if(result.error != null)
               {
                  if(onError != null)
                  {
                     onError(result.error);
                  }
                  return;
               }
               if(onError != null)
               {
                  onError(new TApplicationError(TApplicationError.MISSING_RESULT,"updater_isUpdateAvailable failed: unknown result"));
               }
               return;
            }
            catch(e:TError)
            {
               if(onError != null)
               {
                  onError(e);
               }
               return;
            }
         });
      }
      
      public function settings_get(param1:String, param2:String, param3:Function, param4:Function) : void
      {
         var gameSession:String = param1;
         var key:String = param2;
         var onError:Function = param3;
         var onSuccess:Function = param4;
         this.oprot_.writeMessageBegin(new TMessage("settings_get",TMessageType.CALL,this.seqid_));
         var args:settings_get_args = new settings_get_args();
         args.gameSession = gameSession;
         args.key = key;
         args.write(this.oprot_);
         this.oprot_.writeMessageEnd();
         this.oprot_.getTransport().flush(function(param1:Error):void
         {
            var msg:TMessage = null;
            var result:settings_get_result = null;
            var x:TApplicationError = null;
            var error:Error = param1;
            try
            {
               if(error != null)
               {
                  if(onError != null)
                  {
                     onError(error);
                  }
                  return;
               }
               msg = iprot_.readMessageBegin();
               if(msg.type == TMessageType.EXCEPTION)
               {
                  x = TApplicationError.read(iprot_);
                  iprot_.readMessageEnd();
                  if(onError != null)
                  {
                     onError(x);
                  }
                  return;
               }
               result = new settings_get_result();
               result.read(iprot_);
               iprot_.readMessageEnd();
               if(result.isSetSuccess())
               {
                  if(onSuccess != null)
                  {
                     onSuccess(result.success);
                  }
                  return;
               }
               if(result.error != null)
               {
                  if(onError != null)
                  {
                     onError(result.error);
                  }
                  return;
               }
               if(onError != null)
               {
                  onError(new TApplicationError(TApplicationError.MISSING_RESULT,"settings_get failed: unknown result"));
               }
               return;
            }
            catch(e:TError)
            {
               if(onError != null)
               {
                  onError(e);
               }
               return;
            }
         });
      }
      
      public function settings_set(param1:String, param2:String, param3:String, param4:Function, param5:Function) : void
      {
         var gameSession:String = param1;
         var key:String = param2;
         var value:String = param3;
         var onError:Function = param4;
         var onSuccess:Function = param5;
         this.oprot_.writeMessageBegin(new TMessage("settings_set",TMessageType.CALL,this.seqid_));
         var args:settings_set_args = new settings_set_args();
         args.gameSession = gameSession;
         args.key = key;
         args.value = value;
         args.write(this.oprot_);
         this.oprot_.writeMessageEnd();
         this.oprot_.getTransport().flush(function(param1:Error):void
         {
            var msg:TMessage = null;
            var result:settings_set_result = null;
            var x:TApplicationError = null;
            var error:Error = param1;
            try
            {
               if(error != null)
               {
                  if(onError != null)
                  {
                     onError(error);
                  }
                  return;
               }
               msg = iprot_.readMessageBegin();
               if(msg.type == TMessageType.EXCEPTION)
               {
                  x = TApplicationError.read(iprot_);
                  iprot_.readMessageEnd();
                  if(onError != null)
                  {
                     onError(x);
                  }
                  return;
               }
               result = new settings_set_result();
               result.read(iprot_);
               iprot_.readMessageEnd();
               if(result.error != null)
               {
                  if(onError != null)
                  {
                     onError(result.error);
                  }
                  return;
               }
               if(onSuccess != null)
               {
                  onSuccess();
               }
               return;
               return;
            }
            catch(e:TError)
            {
               if(onError != null)
               {
                  onError(e);
               }
               return;
            }
         });
      }
      
      public function userInfo_get(param1:String, param2:Function, param3:Function) : void
      {
         var gameSession:String = param1;
         var onError:Function = param2;
         var onSuccess:Function = param3;
         this.oprot_.writeMessageBegin(new TMessage("userInfo_get",TMessageType.CALL,this.seqid_));
         var args:userInfo_get_args = new userInfo_get_args();
         args.gameSession = gameSession;
         args.write(this.oprot_);
         this.oprot_.writeMessageEnd();
         this.oprot_.getTransport().flush(function(param1:Error):void
         {
            var msg:TMessage = null;
            var result:userInfo_get_result = null;
            var x:TApplicationError = null;
            var error:Error = param1;
            try
            {
               if(error != null)
               {
                  if(onError != null)
                  {
                     onError(error);
                  }
                  return;
               }
               msg = iprot_.readMessageBegin();
               if(msg.type == TMessageType.EXCEPTION)
               {
                  x = TApplicationError.read(iprot_);
                  iprot_.readMessageEnd();
                  if(onError != null)
                  {
                     onError(x);
                  }
                  return;
               }
               result = new userInfo_get_result();
               result.read(iprot_);
               iprot_.readMessageEnd();
               if(result.isSetSuccess())
               {
                  if(onSuccess != null)
                  {
                     onSuccess(result.success);
                  }
                  return;
               }
               if(result.error != null)
               {
                  if(onError != null)
                  {
                     onError(result.error);
                  }
                  return;
               }
               if(onError != null)
               {
                  onError(new TApplicationError(TApplicationError.MISSING_RESULT,"userInfo_get failed: unknown result"));
               }
               return;
            }
            catch(e:TError)
            {
               if(onError != null)
               {
                  onError(e);
               }
               return;
            }
         });
      }
      
      public function release_restartOnExit(param1:String, param2:Function, param3:Function) : void
      {
         var gameSession:String = param1;
         var onError:Function = param2;
         var onSuccess:Function = param3;
         this.oprot_.writeMessageBegin(new TMessage("release_restartOnExit",TMessageType.CALL,this.seqid_));
         var args:release_restartOnExit_args = new release_restartOnExit_args();
         args.gameSession = gameSession;
         args.write(this.oprot_);
         this.oprot_.writeMessageEnd();
         this.oprot_.getTransport().flush(function(param1:Error):void
         {
            var msg:TMessage = null;
            var result:release_restartOnExit_result = null;
            var x:TApplicationError = null;
            var error:Error = param1;
            try
            {
               if(error != null)
               {
                  if(onError != null)
                  {
                     onError(error);
                  }
                  return;
               }
               msg = iprot_.readMessageBegin();
               if(msg.type == TMessageType.EXCEPTION)
               {
                  x = TApplicationError.read(iprot_);
                  iprot_.readMessageEnd();
                  if(onError != null)
                  {
                     onError(x);
                  }
                  return;
               }
               result = new release_restartOnExit_result();
               result.read(iprot_);
               iprot_.readMessageEnd();
               if(onSuccess != null)
               {
                  onSuccess();
               }
               return;
               return;
            }
            catch(e:TError)
            {
               if(onError != null)
               {
                  onError(e);
               }
               return;
            }
         });
      }
   }
}

import flash.utils.Dictionary;
import org.apache.thrift.TBase;
import org.apache.thrift.TFieldRequirementType;
import org.apache.thrift.meta_data.FieldMetaData;
import org.apache.thrift.meta_data.FieldValueMetaData;
import org.apache.thrift.protocol.TField;
import org.apache.thrift.protocol.TProtocol;
import org.apache.thrift.protocol.TProtocolUtil;
import org.apache.thrift.protocol.TStruct;
import org.apache.thrift.protocol.TType;

class connect_args implements TBase
{
   
   private static const STRUCT_DESC:TStruct = new TStruct("connect_args");
   
   private static const GAME_NAME_FIELD_DESC:TField = new TField("gameName",TType.STRING,1);
   
   private static const RELEASE_NAME_FIELD_DESC:TField = new TField("releaseName",TType.STRING,2);
   
   private static const INSTANCE_ID_FIELD_DESC:TField = new TField("instanceId",TType.I32,3);
   
   private static const HASH_FIELD_DESC:TField = new TField("hash",TType.STRING,4);
   
   public static const GAMENAME:int = 1;
   
   public static const RELEASENAME:int = 2;
   
   public static const INSTANCEID:int = 3;
   
   public static const HASH:int = 4;
   
   public static const metaDataMap:Dictionary = new Dictionary();
   
   {
      metaDataMap[GAMENAME] = new FieldMetaData("gameName",TFieldRequirementType.DEFAULT,new FieldValueMetaData(TType.STRING));
      metaDataMap[RELEASENAME] = new FieldMetaData("releaseName",TFieldRequirementType.DEFAULT,new FieldValueMetaData(TType.STRING));
      metaDataMap[INSTANCEID] = new FieldMetaData("instanceId",TFieldRequirementType.DEFAULT,new FieldValueMetaData(TType.I32));
      metaDataMap[HASH] = new FieldMetaData("hash",TFieldRequirementType.DEFAULT,new FieldValueMetaData(TType.STRING));
      FieldMetaData.addStructMetaDataMap(connect_args,metaDataMap);
   }
   
   private var _gameName:String;
   
   private var _releaseName:String;
   
   private var _instanceId:int;
   
   private var _hash:String;
   
   private var __isset_instanceId:Boolean = false;
   
   function connect_args()
   {
      super();
   }
   
   public function get gameName() : String
   {
      return this._gameName;
   }
   
   public function set gameName(param1:String) : void
   {
      this._gameName = param1;
   }
   
   public function unsetGameName() : void
   {
      this.gameName = null;
   }
   
   public function isSetGameName() : Boolean
   {
      return this.gameName != null;
   }
   
   public function get releaseName() : String
   {
      return this._releaseName;
   }
   
   public function set releaseName(param1:String) : void
   {
      this._releaseName = param1;
   }
   
   public function unsetReleaseName() : void
   {
      this.releaseName = null;
   }
   
   public function isSetReleaseName() : Boolean
   {
      return this.releaseName != null;
   }
   
   public function get instanceId() : int
   {
      return this._instanceId;
   }
   
   public function set instanceId(param1:int) : void
   {
      this._instanceId = param1;
      this.__isset_instanceId = true;
   }
   
   public function unsetInstanceId() : void
   {
      this.__isset_instanceId = false;
   }
   
   public function isSetInstanceId() : Boolean
   {
      return this.__isset_instanceId;
   }
   
   public function get hash() : String
   {
      return this._hash;
   }
   
   public function set hash(param1:String) : void
   {
      this._hash = param1;
   }
   
   public function unsetHash() : void
   {
      this.hash = null;
   }
   
   public function isSetHash() : Boolean
   {
      return this.hash != null;
   }
   
   public function setFieldValue(param1:int, param2:*) : void
   {
      switch(param1)
      {
         case GAMENAME:
            if(param2 == null)
            {
               this.unsetGameName();
               break;
            }
            this.gameName = param2;
            break;
         case RELEASENAME:
            if(param2 == null)
            {
               this.unsetReleaseName();
               break;
            }
            this.releaseName = param2;
            break;
         case INSTANCEID:
            if(param2 == null)
            {
               this.unsetInstanceId();
               break;
            }
            this.instanceId = param2;
            break;
         case HASH:
            if(param2 == null)
            {
               this.unsetHash();
               break;
            }
            this.hash = param2;
            break;
         default:
            throw new ArgumentError("Field " + param1 + " doesn\'t exist!");
      }
   }
   
   public function getFieldValue(param1:int) : *
   {
      switch(param1)
      {
         case GAMENAME:
            return this.gameName;
         case RELEASENAME:
            return this.releaseName;
         case INSTANCEID:
            return this.instanceId;
         case HASH:
            return this.hash;
         default:
            throw new ArgumentError("Field " + param1 + " doesn\'t exist!");
      }
   }
   
   public function isSet(param1:int) : Boolean
   {
      switch(param1)
      {
         case GAMENAME:
            return this.isSetGameName();
         case RELEASENAME:
            return this.isSetReleaseName();
         case INSTANCEID:
            return this.isSetInstanceId();
         case HASH:
            return this.isSetHash();
         default:
            throw new ArgumentError("Field " + param1 + " doesn\'t exist!");
      }
   }
   
   public function read(param1:TProtocol) : void
   {
      var _loc2_:TField = null;
      param1.readStructBegin();
      while(true)
      {
         _loc2_ = param1.readFieldBegin();
         if(_loc2_.type == TType.STOP)
         {
            break;
         }
         switch(_loc2_.id)
         {
            case GAMENAME:
               if(_loc2_.type == TType.STRING)
               {
                  this.gameName = param1.readString();
                  break;
               }
               TProtocolUtil.skip(param1,_loc2_.type);
               break;
            case RELEASENAME:
               if(_loc2_.type == TType.STRING)
               {
                  this.releaseName = param1.readString();
                  break;
               }
               TProtocolUtil.skip(param1,_loc2_.type);
               break;
            case INSTANCEID:
               if(_loc2_.type == TType.I32)
               {
                  this.instanceId = param1.readI32();
                  this.__isset_instanceId = true;
                  break;
               }
               TProtocolUtil.skip(param1,_loc2_.type);
               break;
            case HASH:
               if(_loc2_.type == TType.STRING)
               {
                  this.hash = param1.readString();
                  break;
               }
               TProtocolUtil.skip(param1,_loc2_.type);
               break;
            default:
               TProtocolUtil.skip(param1,_loc2_.type);
         }
         param1.readFieldEnd();
      }
      param1.readStructEnd();
      this.validate();
   }
   
   public function write(param1:TProtocol) : void
   {
      this.validate();
      param1.writeStructBegin(STRUCT_DESC);
      if(this.gameName != null)
      {
         param1.writeFieldBegin(GAME_NAME_FIELD_DESC);
         param1.writeString(this.gameName);
         param1.writeFieldEnd();
      }
      if(this.releaseName != null)
      {
         param1.writeFieldBegin(RELEASE_NAME_FIELD_DESC);
         param1.writeString(this.releaseName);
         param1.writeFieldEnd();
      }
      param1.writeFieldBegin(INSTANCE_ID_FIELD_DESC);
      param1.writeI32(this.instanceId);
      param1.writeFieldEnd();
      if(this.hash != null)
      {
         param1.writeFieldBegin(HASH_FIELD_DESC);
         param1.writeString(this.hash);
         param1.writeFieldEnd();
      }
      param1.writeFieldStop();
      param1.writeStructEnd();
   }
   
   public function toString() : String
   {
      var _loc1_:* = new String("connect_args(");
      var _loc2_:Boolean = true;
      _loc1_ = _loc1_ + "gameName:";
      if(this.gameName == null)
      {
         _loc1_ = _loc1_ + "null";
      }
      else
      {
         _loc1_ = _loc1_ + this.gameName;
      }
      _loc2_ = false;
      if(!_loc2_)
      {
         _loc1_ = _loc1_ + ", ";
      }
      _loc1_ = _loc1_ + "releaseName:";
      if(this.releaseName == null)
      {
         _loc1_ = _loc1_ + "null";
      }
      else
      {
         _loc1_ = _loc1_ + this.releaseName;
      }
      _loc2_ = false;
      if(!_loc2_)
      {
         _loc1_ = _loc1_ + ", ";
      }
      _loc1_ = _loc1_ + "instanceId:";
      _loc1_ = _loc1_ + this.instanceId;
      _loc2_ = false;
      if(!_loc2_)
      {
         _loc1_ = _loc1_ + ", ";
      }
      _loc1_ = _loc1_ + "hash:";
      if(this.hash == null)
      {
         _loc1_ = _loc1_ + "null";
      }
      else
      {
         _loc1_ = _loc1_ + this.hash;
      }
      _loc2_ = false;
      _loc1_ = _loc1_ + ")";
      return _loc1_;
   }
   
   public function validate() : void
   {
   }
}

import com.ankama.zaap.ZaapError;
import flash.utils.Dictionary;
import org.apache.thrift.TBase;
import org.apache.thrift.TFieldRequirementType;
import org.apache.thrift.meta_data.FieldMetaData;
import org.apache.thrift.meta_data.FieldValueMetaData;
import org.apache.thrift.meta_data.StructMetaData;
import org.apache.thrift.protocol.TField;
import org.apache.thrift.protocol.TProtocol;
import org.apache.thrift.protocol.TProtocolUtil;
import org.apache.thrift.protocol.TStruct;
import org.apache.thrift.protocol.TType;

class connect_result implements TBase
{
   
   private static const STRUCT_DESC:TStruct = new TStruct("connect_result");
   
   private static const SUCCESS_FIELD_DESC:TField = new TField("success",TType.STRING,0);
   
   private static const ERROR_FIELD_DESC:TField = new TField("error",TType.STRUCT,1);
   
   public static const SUCCESS:int = 0;
   
   public static const ERROR:int = 1;
   
   public static const metaDataMap:Dictionary = new Dictionary();
   
   {
      metaDataMap[SUCCESS] = new FieldMetaData("success",TFieldRequirementType.DEFAULT,new FieldValueMetaData(TType.STRING));
      metaDataMap[ERROR] = new FieldMetaData("error",TFieldRequirementType.DEFAULT,new StructMetaData(TType.STRUCT,ZaapError));
      FieldMetaData.addStructMetaDataMap(connect_result,metaDataMap);
   }
   
   private var _success:String;
   
   private var _error:ZaapError;
   
   function connect_result()
   {
      super();
   }
   
   public function get success() : String
   {
      return this._success;
   }
   
   public function set success(param1:String) : void
   {
      this._success = param1;
   }
   
   public function unsetSuccess() : void
   {
      this.success = null;
   }
   
   public function isSetSuccess() : Boolean
   {
      return this.success != null;
   }
   
   public function get error() : ZaapError
   {
      return this._error;
   }
   
   public function set error(param1:ZaapError) : void
   {
      this._error = param1;
   }
   
   public function unsetError() : void
   {
      this.error = null;
   }
   
   public function isSetError() : Boolean
   {
      return this.error != null;
   }
   
   public function setFieldValue(param1:int, param2:*) : void
   {
      switch(param1)
      {
         case SUCCESS:
            if(param2 == null)
            {
               this.unsetSuccess();
               break;
            }
            this.success = param2;
            break;
         case ERROR:
            if(param2 == null)
            {
               this.unsetError();
               break;
            }
            this.error = param2;
            break;
         default:
            throw new ArgumentError("Field " + param1 + " doesn\'t exist!");
      }
   }
   
   public function getFieldValue(param1:int) : *
   {
      switch(param1)
      {
         case SUCCESS:
            return this.success;
         case ERROR:
            return this.error;
         default:
            throw new ArgumentError("Field " + param1 + " doesn\'t exist!");
      }
   }
   
   public function isSet(param1:int) : Boolean
   {
      switch(param1)
      {
         case SUCCESS:
            return this.isSetSuccess();
         case ERROR:
            return this.isSetError();
         default:
            throw new ArgumentError("Field " + param1 + " doesn\'t exist!");
      }
   }
   
   public function read(param1:TProtocol) : void
   {
      var _loc2_:TField = null;
      param1.readStructBegin();
      while(true)
      {
         _loc2_ = param1.readFieldBegin();
         if(_loc2_.type == TType.STOP)
         {
            break;
         }
         switch(_loc2_.id)
         {
            case SUCCESS:
               if(_loc2_.type == TType.STRING)
               {
                  this.success = param1.readString();
                  break;
               }
               TProtocolUtil.skip(param1,_loc2_.type);
               break;
            case ERROR:
               if(_loc2_.type == TType.STRUCT)
               {
                  this.error = new ZaapError();
                  this.error.read(param1);
                  break;
               }
               TProtocolUtil.skip(param1,_loc2_.type);
               break;
            default:
               TProtocolUtil.skip(param1,_loc2_.type);
         }
         param1.readFieldEnd();
      }
      param1.readStructEnd();
      this.validate();
   }
   
   public function write(param1:TProtocol) : void
   {
      param1.writeStructBegin(STRUCT_DESC);
      if(this.isSetSuccess())
      {
         param1.writeFieldBegin(SUCCESS_FIELD_DESC);
         param1.writeString(this.success);
         param1.writeFieldEnd();
      }
      else if(this.isSetError())
      {
         param1.writeFieldBegin(ERROR_FIELD_DESC);
         this.error.write(param1);
         param1.writeFieldEnd();
      }
      param1.writeFieldStop();
      param1.writeStructEnd();
   }
   
   public function toString() : String
   {
      var _loc1_:* = new String("connect_result(");
      var _loc2_:Boolean = true;
      _loc1_ = _loc1_ + "success:";
      if(this.success == null)
      {
         _loc1_ = _loc1_ + "null";
      }
      else
      {
         _loc1_ = _loc1_ + this.success;
      }
      _loc2_ = false;
      if(!_loc2_)
      {
         _loc1_ = _loc1_ + ", ";
      }
      _loc1_ = _loc1_ + "error:";
      if(this.error == null)
      {
         _loc1_ = _loc1_ + "null";
      }
      else
      {
         _loc1_ = _loc1_ + this.error;
      }
      _loc2_ = false;
      _loc1_ = _loc1_ + ")";
      return _loc1_;
   }
   
   public function validate() : void
   {
   }
}

import flash.utils.Dictionary;
import org.apache.thrift.TBase;
import org.apache.thrift.TFieldRequirementType;
import org.apache.thrift.meta_data.FieldMetaData;
import org.apache.thrift.meta_data.FieldValueMetaData;
import org.apache.thrift.protocol.TField;
import org.apache.thrift.protocol.TProtocol;
import org.apache.thrift.protocol.TProtocolUtil;
import org.apache.thrift.protocol.TStruct;
import org.apache.thrift.protocol.TType;

class auth_getGameToken_args implements TBase
{
   
   private static const STRUCT_DESC:TStruct = new TStruct("auth_getGameToken_args");
   
   private static const GAME_SESSION_FIELD_DESC:TField = new TField("gameSession",TType.STRING,1);
   
   private static const GAME_ID_FIELD_DESC:TField = new TField("gameId",TType.I32,2);
   
   public static const GAMESESSION:int = 1;
   
   public static const GAMEID:int = 2;
   
   public static const metaDataMap:Dictionary = new Dictionary();
   
   {
      metaDataMap[GAMESESSION] = new FieldMetaData("gameSession",TFieldRequirementType.DEFAULT,new FieldValueMetaData(TType.STRING));
      metaDataMap[GAMEID] = new FieldMetaData("gameId",TFieldRequirementType.DEFAULT,new FieldValueMetaData(TType.I32));
      FieldMetaData.addStructMetaDataMap(auth_getGameToken_args,metaDataMap);
   }
   
   private var _gameSession:String;
   
   private var _gameId:int;
   
   private var __isset_gameId:Boolean = false;
   
   function auth_getGameToken_args()
   {
      super();
   }
   
   public function get gameSession() : String
   {
      return this._gameSession;
   }
   
   public function set gameSession(param1:String) : void
   {
      this._gameSession = param1;
   }
   
   public function unsetGameSession() : void
   {
      this.gameSession = null;
   }
   
   public function isSetGameSession() : Boolean
   {
      return this.gameSession != null;
   }
   
   public function get gameId() : int
   {
      return this._gameId;
   }
   
   public function set gameId(param1:int) : void
   {
      this._gameId = param1;
      this.__isset_gameId = true;
   }
   
   public function unsetGameId() : void
   {
      this.__isset_gameId = false;
   }
   
   public function isSetGameId() : Boolean
   {
      return this.__isset_gameId;
   }
   
   public function setFieldValue(param1:int, param2:*) : void
   {
      switch(param1)
      {
         case GAMESESSION:
            if(param2 == null)
            {
               this.unsetGameSession();
               break;
            }
            this.gameSession = param2;
            break;
         case GAMEID:
            if(param2 == null)
            {
               this.unsetGameId();
               break;
            }
            this.gameId = param2;
            break;
         default:
            throw new ArgumentError("Field " + param1 + " doesn\'t exist!");
      }
   }
   
   public function getFieldValue(param1:int) : *
   {
      switch(param1)
      {
         case GAMESESSION:
            return this.gameSession;
         case GAMEID:
            return this.gameId;
         default:
            throw new ArgumentError("Field " + param1 + " doesn\'t exist!");
      }
   }
   
   public function isSet(param1:int) : Boolean
   {
      switch(param1)
      {
         case GAMESESSION:
            return this.isSetGameSession();
         case GAMEID:
            return this.isSetGameId();
         default:
            throw new ArgumentError("Field " + param1 + " doesn\'t exist!");
      }
   }
   
   public function read(param1:TProtocol) : void
   {
      var _loc2_:TField = null;
      param1.readStructBegin();
      while(true)
      {
         _loc2_ = param1.readFieldBegin();
         if(_loc2_.type == TType.STOP)
         {
            break;
         }
         switch(_loc2_.id)
         {
            case GAMESESSION:
               if(_loc2_.type == TType.STRING)
               {
                  this.gameSession = param1.readString();
                  break;
               }
               TProtocolUtil.skip(param1,_loc2_.type);
               break;
            case GAMEID:
               if(_loc2_.type == TType.I32)
               {
                  this.gameId = param1.readI32();
                  this.__isset_gameId = true;
                  break;
               }
               TProtocolUtil.skip(param1,_loc2_.type);
               break;
            default:
               TProtocolUtil.skip(param1,_loc2_.type);
         }
         param1.readFieldEnd();
      }
      param1.readStructEnd();
      this.validate();
   }
   
   public function write(param1:TProtocol) : void
   {
      this.validate();
      param1.writeStructBegin(STRUCT_DESC);
      if(this.gameSession != null)
      {
         param1.writeFieldBegin(GAME_SESSION_FIELD_DESC);
         param1.writeString(this.gameSession);
         param1.writeFieldEnd();
      }
      param1.writeFieldBegin(GAME_ID_FIELD_DESC);
      param1.writeI32(this.gameId);
      param1.writeFieldEnd();
      param1.writeFieldStop();
      param1.writeStructEnd();
   }
   
   public function toString() : String
   {
      var _loc1_:* = new String("auth_getGameToken_args(");
      var _loc2_:Boolean = true;
      _loc1_ = _loc1_ + "gameSession:";
      if(this.gameSession == null)
      {
         _loc1_ = _loc1_ + "null";
      }
      else
      {
         _loc1_ = _loc1_ + this.gameSession;
      }
      _loc2_ = false;
      if(!_loc2_)
      {
         _loc1_ = _loc1_ + ", ";
      }
      _loc1_ = _loc1_ + "gameId:";
      _loc1_ = _loc1_ + this.gameId;
      _loc2_ = false;
      _loc1_ = _loc1_ + ")";
      return _loc1_;
   }
   
   public function validate() : void
   {
   }
}

import com.ankama.zaap.ZaapError;
import flash.utils.Dictionary;
import org.apache.thrift.TBase;
import org.apache.thrift.TFieldRequirementType;
import org.apache.thrift.meta_data.FieldMetaData;
import org.apache.thrift.meta_data.FieldValueMetaData;
import org.apache.thrift.meta_data.StructMetaData;
import org.apache.thrift.protocol.TField;
import org.apache.thrift.protocol.TProtocol;
import org.apache.thrift.protocol.TProtocolUtil;
import org.apache.thrift.protocol.TStruct;
import org.apache.thrift.protocol.TType;

class auth_getGameToken_result implements TBase
{
   
   private static const STRUCT_DESC:TStruct = new TStruct("auth_getGameToken_result");
   
   private static const SUCCESS_FIELD_DESC:TField = new TField("success",TType.STRING,0);
   
   private static const ERROR_FIELD_DESC:TField = new TField("error",TType.STRUCT,1);
   
   public static const SUCCESS:int = 0;
   
   public static const ERROR:int = 1;
   
   public static const metaDataMap:Dictionary = new Dictionary();
   
   {
      metaDataMap[SUCCESS] = new FieldMetaData("success",TFieldRequirementType.DEFAULT,new FieldValueMetaData(TType.STRING));
      metaDataMap[ERROR] = new FieldMetaData("error",TFieldRequirementType.DEFAULT,new StructMetaData(TType.STRUCT,ZaapError));
      FieldMetaData.addStructMetaDataMap(auth_getGameToken_result,metaDataMap);
   }
   
   private var _success:String;
   
   private var _error:ZaapError;
   
   function auth_getGameToken_result()
   {
      super();
   }
   
   public function get success() : String
   {
      return this._success;
   }
   
   public function set success(param1:String) : void
   {
      this._success = param1;
   }
   
   public function unsetSuccess() : void
   {
      this.success = null;
   }
   
   public function isSetSuccess() : Boolean
   {
      return this.success != null;
   }
   
   public function get error() : ZaapError
   {
      return this._error;
   }
   
   public function set error(param1:ZaapError) : void
   {
      this._error = param1;
   }
   
   public function unsetError() : void
   {
      this.error = null;
   }
   
   public function isSetError() : Boolean
   {
      return this.error != null;
   }
   
   public function setFieldValue(param1:int, param2:*) : void
   {
      switch(param1)
      {
         case SUCCESS:
            if(param2 == null)
            {
               this.unsetSuccess();
               break;
            }
            this.success = param2;
            break;
         case ERROR:
            if(param2 == null)
            {
               this.unsetError();
               break;
            }
            this.error = param2;
            break;
         default:
            throw new ArgumentError("Field " + param1 + " doesn\'t exist!");
      }
   }
   
   public function getFieldValue(param1:int) : *
   {
      switch(param1)
      {
         case SUCCESS:
            return this.success;
         case ERROR:
            return this.error;
         default:
            throw new ArgumentError("Field " + param1 + " doesn\'t exist!");
      }
   }
   
   public function isSet(param1:int) : Boolean
   {
      switch(param1)
      {
         case SUCCESS:
            return this.isSetSuccess();
         case ERROR:
            return this.isSetError();
         default:
            throw new ArgumentError("Field " + param1 + " doesn\'t exist!");
      }
   }
   
   public function read(param1:TProtocol) : void
   {
      var _loc2_:TField = null;
      param1.readStructBegin();
      while(true)
      {
         _loc2_ = param1.readFieldBegin();
         if(_loc2_.type == TType.STOP)
         {
            break;
         }
         switch(_loc2_.id)
         {
            case SUCCESS:
               if(_loc2_.type == TType.STRING)
               {
                  this.success = param1.readString();
                  break;
               }
               TProtocolUtil.skip(param1,_loc2_.type);
               break;
            case ERROR:
               if(_loc2_.type == TType.STRUCT)
               {
                  this.error = new ZaapError();
                  this.error.read(param1);
                  break;
               }
               TProtocolUtil.skip(param1,_loc2_.type);
               break;
            default:
               TProtocolUtil.skip(param1,_loc2_.type);
         }
         param1.readFieldEnd();
      }
      param1.readStructEnd();
      this.validate();
   }
   
   public function write(param1:TProtocol) : void
   {
      param1.writeStructBegin(STRUCT_DESC);
      if(this.isSetSuccess())
      {
         param1.writeFieldBegin(SUCCESS_FIELD_DESC);
         param1.writeString(this.success);
         param1.writeFieldEnd();
      }
      else if(this.isSetError())
      {
         param1.writeFieldBegin(ERROR_FIELD_DESC);
         this.error.write(param1);
         param1.writeFieldEnd();
      }
      param1.writeFieldStop();
      param1.writeStructEnd();
   }
   
   public function toString() : String
   {
      var _loc1_:* = new String("auth_getGameToken_result(");
      var _loc2_:Boolean = true;
      _loc1_ = _loc1_ + "success:";
      if(this.success == null)
      {
         _loc1_ = _loc1_ + "null";
      }
      else
      {
         _loc1_ = _loc1_ + this.success;
      }
      _loc2_ = false;
      if(!_loc2_)
      {
         _loc1_ = _loc1_ + ", ";
      }
      _loc1_ = _loc1_ + "error:";
      if(this.error == null)
      {
         _loc1_ = _loc1_ + "null";
      }
      else
      {
         _loc1_ = _loc1_ + this.error;
      }
      _loc2_ = false;
      _loc1_ = _loc1_ + ")";
      return _loc1_;
   }
   
   public function validate() : void
   {
   }
}

import flash.utils.Dictionary;
import org.apache.thrift.TBase;
import org.apache.thrift.TFieldRequirementType;
import org.apache.thrift.meta_data.FieldMetaData;
import org.apache.thrift.meta_data.FieldValueMetaData;
import org.apache.thrift.protocol.TField;
import org.apache.thrift.protocol.TProtocol;
import org.apache.thrift.protocol.TProtocolUtil;
import org.apache.thrift.protocol.TStruct;
import org.apache.thrift.protocol.TType;

class updater_isUpdateAvailable_args implements TBase
{
   
   private static const STRUCT_DESC:TStruct = new TStruct("updater_isUpdateAvailable_args");
   
   private static const GAME_SESSION_FIELD_DESC:TField = new TField("gameSession",TType.STRING,1);
   
   public static const GAMESESSION:int = 1;
   
   public static const metaDataMap:Dictionary = new Dictionary();
   
   {
      metaDataMap[GAMESESSION] = new FieldMetaData("gameSession",TFieldRequirementType.DEFAULT,new FieldValueMetaData(TType.STRING));
      FieldMetaData.addStructMetaDataMap(updater_isUpdateAvailable_args,metaDataMap);
   }
   
   private var _gameSession:String;
   
   function updater_isUpdateAvailable_args()
   {
      super();
   }
   
   public function get gameSession() : String
   {
      return this._gameSession;
   }
   
   public function set gameSession(param1:String) : void
   {
      this._gameSession = param1;
   }
   
   public function unsetGameSession() : void
   {
      this.gameSession = null;
   }
   
   public function isSetGameSession() : Boolean
   {
      return this.gameSession != null;
   }
   
   public function setFieldValue(param1:int, param2:*) : void
   {
      switch(param1)
      {
         case GAMESESSION:
            if(param2 == null)
            {
               this.unsetGameSession();
            }
            else
            {
               this.gameSession = param2;
            }
            return;
         default:
            throw new ArgumentError("Field " + param1 + " doesn\'t exist!");
      }
   }
   
   public function getFieldValue(param1:int) : *
   {
      switch(param1)
      {
         case GAMESESSION:
            return this.gameSession;
         default:
            throw new ArgumentError("Field " + param1 + " doesn\'t exist!");
      }
   }
   
   public function isSet(param1:int) : Boolean
   {
      switch(param1)
      {
         case GAMESESSION:
            return this.isSetGameSession();
         default:
            throw new ArgumentError("Field " + param1 + " doesn\'t exist!");
      }
   }
   
   public function read(param1:TProtocol) : void
   {
      var _loc2_:TField = null;
      param1.readStructBegin();
      while(true)
      {
         _loc2_ = param1.readFieldBegin();
         if(_loc2_.type == TType.STOP)
         {
            break;
         }
         switch(_loc2_.id)
         {
            case GAMESESSION:
               if(_loc2_.type == TType.STRING)
               {
                  this.gameSession = param1.readString();
                  break;
               }
               TProtocolUtil.skip(param1,_loc2_.type);
               break;
            default:
               TProtocolUtil.skip(param1,_loc2_.type);
         }
         param1.readFieldEnd();
      }
      param1.readStructEnd();
      this.validate();
   }
   
   public function write(param1:TProtocol) : void
   {
      this.validate();
      param1.writeStructBegin(STRUCT_DESC);
      if(this.gameSession != null)
      {
         param1.writeFieldBegin(GAME_SESSION_FIELD_DESC);
         param1.writeString(this.gameSession);
         param1.writeFieldEnd();
      }
      param1.writeFieldStop();
      param1.writeStructEnd();
   }
   
   public function toString() : String
   {
      var _loc1_:* = new String("updater_isUpdateAvailable_args(");
      var _loc2_:Boolean = true;
      _loc1_ = _loc1_ + "gameSession:";
      if(this.gameSession == null)
      {
         _loc1_ = _loc1_ + "null";
      }
      else
      {
         _loc1_ = _loc1_ + this.gameSession;
      }
      _loc2_ = false;
      _loc1_ = _loc1_ + ")";
      return _loc1_;
   }
   
   public function validate() : void
   {
   }
}

import com.ankama.zaap.ZaapError;
import flash.utils.Dictionary;
import org.apache.thrift.TBase;
import org.apache.thrift.TFieldRequirementType;
import org.apache.thrift.meta_data.FieldMetaData;
import org.apache.thrift.meta_data.FieldValueMetaData;
import org.apache.thrift.meta_data.StructMetaData;
import org.apache.thrift.protocol.TField;
import org.apache.thrift.protocol.TProtocol;
import org.apache.thrift.protocol.TProtocolUtil;
import org.apache.thrift.protocol.TStruct;
import org.apache.thrift.protocol.TType;

class updater_isUpdateAvailable_result implements TBase
{
   
   private static const STRUCT_DESC:TStruct = new TStruct("updater_isUpdateAvailable_result");
   
   private static const SUCCESS_FIELD_DESC:TField = new TField("success",TType.BOOL,0);
   
   private static const ERROR_FIELD_DESC:TField = new TField("error",TType.STRUCT,1);
   
   public static const SUCCESS:int = 0;
   
   public static const ERROR:int = 1;
   
   public static const metaDataMap:Dictionary = new Dictionary();
   
   {
      metaDataMap[SUCCESS] = new FieldMetaData("success",TFieldRequirementType.DEFAULT,new FieldValueMetaData(TType.BOOL));
      metaDataMap[ERROR] = new FieldMetaData("error",TFieldRequirementType.DEFAULT,new StructMetaData(TType.STRUCT,ZaapError));
      FieldMetaData.addStructMetaDataMap(updater_isUpdateAvailable_result,metaDataMap);
   }
   
   private var _success:Boolean;
   
   private var _error:ZaapError;
   
   private var __isset_success:Boolean = false;
   
   function updater_isUpdateAvailable_result()
   {
      super();
   }
   
   public function get success() : Boolean
   {
      return this._success;
   }
   
   public function set success(param1:Boolean) : void
   {
      this._success = param1;
      this.__isset_success = true;
   }
   
   public function unsetSuccess() : void
   {
      this.__isset_success = false;
   }
   
   public function isSetSuccess() : Boolean
   {
      return this.__isset_success;
   }
   
   public function get error() : ZaapError
   {
      return this._error;
   }
   
   public function set error(param1:ZaapError) : void
   {
      this._error = param1;
   }
   
   public function unsetError() : void
   {
      this.error = null;
   }
   
   public function isSetError() : Boolean
   {
      return this.error != null;
   }
   
   public function setFieldValue(param1:int, param2:*) : void
   {
      switch(param1)
      {
         case SUCCESS:
            if(param2 == null)
            {
               this.unsetSuccess();
               break;
            }
            this.success = param2;
            break;
         case ERROR:
            if(param2 == null)
            {
               this.unsetError();
               break;
            }
            this.error = param2;
            break;
         default:
            throw new ArgumentError("Field " + param1 + " doesn\'t exist!");
      }
   }
   
   public function getFieldValue(param1:int) : *
   {
      switch(param1)
      {
         case SUCCESS:
            return this.success;
         case ERROR:
            return this.error;
         default:
            throw new ArgumentError("Field " + param1 + " doesn\'t exist!");
      }
   }
   
   public function isSet(param1:int) : Boolean
   {
      switch(param1)
      {
         case SUCCESS:
            return this.isSetSuccess();
         case ERROR:
            return this.isSetError();
         default:
            throw new ArgumentError("Field " + param1 + " doesn\'t exist!");
      }
   }
   
   public function read(param1:TProtocol) : void
   {
      var _loc2_:TField = null;
      param1.readStructBegin();
      while(true)
      {
         _loc2_ = param1.readFieldBegin();
         if(_loc2_.type == TType.STOP)
         {
            break;
         }
         switch(_loc2_.id)
         {
            case SUCCESS:
               if(_loc2_.type == TType.BOOL)
               {
                  this.success = param1.readBool();
                  this.__isset_success = true;
                  break;
               }
               TProtocolUtil.skip(param1,_loc2_.type);
               break;
            case ERROR:
               if(_loc2_.type == TType.STRUCT)
               {
                  this.error = new ZaapError();
                  this.error.read(param1);
                  break;
               }
               TProtocolUtil.skip(param1,_loc2_.type);
               break;
            default:
               TProtocolUtil.skip(param1,_loc2_.type);
         }
         param1.readFieldEnd();
      }
      param1.readStructEnd();
      this.validate();
   }
   
   public function write(param1:TProtocol) : void
   {
      param1.writeStructBegin(STRUCT_DESC);
      if(this.isSetSuccess())
      {
         param1.writeFieldBegin(SUCCESS_FIELD_DESC);
         param1.writeBool(this.success);
         param1.writeFieldEnd();
      }
      else if(this.isSetError())
      {
         param1.writeFieldBegin(ERROR_FIELD_DESC);
         this.error.write(param1);
         param1.writeFieldEnd();
      }
      param1.writeFieldStop();
      param1.writeStructEnd();
   }
   
   public function toString() : String
   {
      var _loc1_:* = new String("updater_isUpdateAvailable_result(");
      var _loc2_:Boolean = true;
      _loc1_ = _loc1_ + "success:";
      _loc1_ = _loc1_ + this.success;
      _loc2_ = false;
      if(!_loc2_)
      {
         _loc1_ = _loc1_ + ", ";
      }
      _loc1_ = _loc1_ + "error:";
      if(this.error == null)
      {
         _loc1_ = _loc1_ + "null";
      }
      else
      {
         _loc1_ = _loc1_ + this.error;
      }
      _loc2_ = false;
      _loc1_ = _loc1_ + ")";
      return _loc1_;
   }
   
   public function validate() : void
   {
   }
}

import flash.utils.Dictionary;
import org.apache.thrift.TBase;
import org.apache.thrift.TFieldRequirementType;
import org.apache.thrift.meta_data.FieldMetaData;
import org.apache.thrift.meta_data.FieldValueMetaData;
import org.apache.thrift.protocol.TField;
import org.apache.thrift.protocol.TProtocol;
import org.apache.thrift.protocol.TProtocolUtil;
import org.apache.thrift.protocol.TStruct;
import org.apache.thrift.protocol.TType;

class settings_get_args implements TBase
{
   
   private static const STRUCT_DESC:TStruct = new TStruct("settings_get_args");
   
   private static const GAME_SESSION_FIELD_DESC:TField = new TField("gameSession",TType.STRING,1);
   
   private static const KEY_FIELD_DESC:TField = new TField("key",TType.STRING,2);
   
   public static const GAMESESSION:int = 1;
   
   public static const KEY:int = 2;
   
   public static const metaDataMap:Dictionary = new Dictionary();
   
   {
      metaDataMap[GAMESESSION] = new FieldMetaData("gameSession",TFieldRequirementType.DEFAULT,new FieldValueMetaData(TType.STRING));
      metaDataMap[KEY] = new FieldMetaData("key",TFieldRequirementType.DEFAULT,new FieldValueMetaData(TType.STRING));
      FieldMetaData.addStructMetaDataMap(settings_get_args,metaDataMap);
   }
   
   private var _gameSession:String;
   
   private var _key:String;
   
   function settings_get_args()
   {
      super();
   }
   
   public function get gameSession() : String
   {
      return this._gameSession;
   }
   
   public function set gameSession(param1:String) : void
   {
      this._gameSession = param1;
   }
   
   public function unsetGameSession() : void
   {
      this.gameSession = null;
   }
   
   public function isSetGameSession() : Boolean
   {
      return this.gameSession != null;
   }
   
   public function get key() : String
   {
      return this._key;
   }
   
   public function set key(param1:String) : void
   {
      this._key = param1;
   }
   
   public function unsetKey() : void
   {
      this.key = null;
   }
   
   public function isSetKey() : Boolean
   {
      return this.key != null;
   }
   
   public function setFieldValue(param1:int, param2:*) : void
   {
      switch(param1)
      {
         case GAMESESSION:
            if(param2 == null)
            {
               this.unsetGameSession();
               break;
            }
            this.gameSession = param2;
            break;
         case KEY:
            if(param2 == null)
            {
               this.unsetKey();
               break;
            }
            this.key = param2;
            break;
         default:
            throw new ArgumentError("Field " + param1 + " doesn\'t exist!");
      }
   }
   
   public function getFieldValue(param1:int) : *
   {
      switch(param1)
      {
         case GAMESESSION:
            return this.gameSession;
         case KEY:
            return this.key;
         default:
            throw new ArgumentError("Field " + param1 + " doesn\'t exist!");
      }
   }
   
   public function isSet(param1:int) : Boolean
   {
      switch(param1)
      {
         case GAMESESSION:
            return this.isSetGameSession();
         case KEY:
            return this.isSetKey();
         default:
            throw new ArgumentError("Field " + param1 + " doesn\'t exist!");
      }
   }
   
   public function read(param1:TProtocol) : void
   {
      var _loc2_:TField = null;
      param1.readStructBegin();
      while(true)
      {
         _loc2_ = param1.readFieldBegin();
         if(_loc2_.type == TType.STOP)
         {
            break;
         }
         switch(_loc2_.id)
         {
            case GAMESESSION:
               if(_loc2_.type == TType.STRING)
               {
                  this.gameSession = param1.readString();
                  break;
               }
               TProtocolUtil.skip(param1,_loc2_.type);
               break;
            case KEY:
               if(_loc2_.type == TType.STRING)
               {
                  this.key = param1.readString();
                  break;
               }
               TProtocolUtil.skip(param1,_loc2_.type);
               break;
            default:
               TProtocolUtil.skip(param1,_loc2_.type);
         }
         param1.readFieldEnd();
      }
      param1.readStructEnd();
      this.validate();
   }
   
   public function write(param1:TProtocol) : void
   {
      this.validate();
      param1.writeStructBegin(STRUCT_DESC);
      if(this.gameSession != null)
      {
         param1.writeFieldBegin(GAME_SESSION_FIELD_DESC);
         param1.writeString(this.gameSession);
         param1.writeFieldEnd();
      }
      if(this.key != null)
      {
         param1.writeFieldBegin(KEY_FIELD_DESC);
         param1.writeString(this.key);
         param1.writeFieldEnd();
      }
      param1.writeFieldStop();
      param1.writeStructEnd();
   }
   
   public function toString() : String
   {
      var _loc1_:* = new String("settings_get_args(");
      var _loc2_:Boolean = true;
      _loc1_ = _loc1_ + "gameSession:";
      if(this.gameSession == null)
      {
         _loc1_ = _loc1_ + "null";
      }
      else
      {
         _loc1_ = _loc1_ + this.gameSession;
      }
      _loc2_ = false;
      if(!_loc2_)
      {
         _loc1_ = _loc1_ + ", ";
      }
      _loc1_ = _loc1_ + "key:";
      if(this.key == null)
      {
         _loc1_ = _loc1_ + "null";
      }
      else
      {
         _loc1_ = _loc1_ + this.key;
      }
      _loc2_ = false;
      _loc1_ = _loc1_ + ")";
      return _loc1_;
   }
   
   public function validate() : void
   {
   }
}

import com.ankama.zaap.ZaapError;
import flash.utils.Dictionary;
import org.apache.thrift.TBase;
import org.apache.thrift.TFieldRequirementType;
import org.apache.thrift.meta_data.FieldMetaData;
import org.apache.thrift.meta_data.FieldValueMetaData;
import org.apache.thrift.meta_data.StructMetaData;
import org.apache.thrift.protocol.TField;
import org.apache.thrift.protocol.TProtocol;
import org.apache.thrift.protocol.TProtocolUtil;
import org.apache.thrift.protocol.TStruct;
import org.apache.thrift.protocol.TType;

class settings_get_result implements TBase
{
   
   private static const STRUCT_DESC:TStruct = new TStruct("settings_get_result");
   
   private static const SUCCESS_FIELD_DESC:TField = new TField("success",TType.STRING,0);
   
   private static const ERROR_FIELD_DESC:TField = new TField("error",TType.STRUCT,1);
   
   public static const SUCCESS:int = 0;
   
   public static const ERROR:int = 1;
   
   public static const metaDataMap:Dictionary = new Dictionary();
   
   {
      metaDataMap[SUCCESS] = new FieldMetaData("success",TFieldRequirementType.DEFAULT,new FieldValueMetaData(TType.STRING));
      metaDataMap[ERROR] = new FieldMetaData("error",TFieldRequirementType.DEFAULT,new StructMetaData(TType.STRUCT,ZaapError));
      FieldMetaData.addStructMetaDataMap(settings_get_result,metaDataMap);
   }
   
   private var _success:String;
   
   private var _error:ZaapError;
   
   function settings_get_result()
   {
      super();
   }
   
   public function get success() : String
   {
      return this._success;
   }
   
   public function set success(param1:String) : void
   {
      this._success = param1;
   }
   
   public function unsetSuccess() : void
   {
      this.success = null;
   }
   
   public function isSetSuccess() : Boolean
   {
      return this.success != null;
   }
   
   public function get error() : ZaapError
   {
      return this._error;
   }
   
   public function set error(param1:ZaapError) : void
   {
      this._error = param1;
   }
   
   public function unsetError() : void
   {
      this.error = null;
   }
   
   public function isSetError() : Boolean
   {
      return this.error != null;
   }
   
   public function setFieldValue(param1:int, param2:*) : void
   {
      switch(param1)
      {
         case SUCCESS:
            if(param2 == null)
            {
               this.unsetSuccess();
               break;
            }
            this.success = param2;
            break;
         case ERROR:
            if(param2 == null)
            {
               this.unsetError();
               break;
            }
            this.error = param2;
            break;
         default:
            throw new ArgumentError("Field " + param1 + " doesn\'t exist!");
      }
   }
   
   public function getFieldValue(param1:int) : *
   {
      switch(param1)
      {
         case SUCCESS:
            return this.success;
         case ERROR:
            return this.error;
         default:
            throw new ArgumentError("Field " + param1 + " doesn\'t exist!");
      }
   }
   
   public function isSet(param1:int) : Boolean
   {
      switch(param1)
      {
         case SUCCESS:
            return this.isSetSuccess();
         case ERROR:
            return this.isSetError();
         default:
            throw new ArgumentError("Field " + param1 + " doesn\'t exist!");
      }
   }
   
   public function read(param1:TProtocol) : void
   {
      var _loc2_:TField = null;
      param1.readStructBegin();
      while(true)
      {
         _loc2_ = param1.readFieldBegin();
         if(_loc2_.type == TType.STOP)
         {
            break;
         }
         switch(_loc2_.id)
         {
            case SUCCESS:
               if(_loc2_.type == TType.STRING)
               {
                  this.success = param1.readString();
                  break;
               }
               TProtocolUtil.skip(param1,_loc2_.type);
               break;
            case ERROR:
               if(_loc2_.type == TType.STRUCT)
               {
                  this.error = new ZaapError();
                  this.error.read(param1);
                  break;
               }
               TProtocolUtil.skip(param1,_loc2_.type);
               break;
            default:
               TProtocolUtil.skip(param1,_loc2_.type);
         }
         param1.readFieldEnd();
      }
      param1.readStructEnd();
      this.validate();
   }
   
   public function write(param1:TProtocol) : void
   {
      param1.writeStructBegin(STRUCT_DESC);
      if(this.isSetSuccess())
      {
         param1.writeFieldBegin(SUCCESS_FIELD_DESC);
         param1.writeString(this.success);
         param1.writeFieldEnd();
      }
      else if(this.isSetError())
      {
         param1.writeFieldBegin(ERROR_FIELD_DESC);
         this.error.write(param1);
         param1.writeFieldEnd();
      }
      param1.writeFieldStop();
      param1.writeStructEnd();
   }
   
   public function toString() : String
   {
      var _loc1_:* = new String("settings_get_result(");
      var _loc2_:Boolean = true;
      _loc1_ = _loc1_ + "success:";
      if(this.success == null)
      {
         _loc1_ = _loc1_ + "null";
      }
      else
      {
         _loc1_ = _loc1_ + this.success;
      }
      _loc2_ = false;
      if(!_loc2_)
      {
         _loc1_ = _loc1_ + ", ";
      }
      _loc1_ = _loc1_ + "error:";
      if(this.error == null)
      {
         _loc1_ = _loc1_ + "null";
      }
      else
      {
         _loc1_ = _loc1_ + this.error;
      }
      _loc2_ = false;
      _loc1_ = _loc1_ + ")";
      return _loc1_;
   }
   
   public function validate() : void
   {
   }
}

import flash.utils.Dictionary;
import org.apache.thrift.TBase;
import org.apache.thrift.TFieldRequirementType;
import org.apache.thrift.meta_data.FieldMetaData;
import org.apache.thrift.meta_data.FieldValueMetaData;
import org.apache.thrift.protocol.TField;
import org.apache.thrift.protocol.TProtocol;
import org.apache.thrift.protocol.TProtocolUtil;
import org.apache.thrift.protocol.TStruct;
import org.apache.thrift.protocol.TType;

class settings_set_args implements TBase
{
   
   private static const STRUCT_DESC:TStruct = new TStruct("settings_set_args");
   
   private static const GAME_SESSION_FIELD_DESC:TField = new TField("gameSession",TType.STRING,1);
   
   private static const KEY_FIELD_DESC:TField = new TField("key",TType.STRING,2);
   
   private static const VALUE_FIELD_DESC:TField = new TField("value",TType.STRING,3);
   
   public static const GAMESESSION:int = 1;
   
   public static const KEY:int = 2;
   
   public static const VALUE:int = 3;
   
   public static const metaDataMap:Dictionary = new Dictionary();
   
   {
      metaDataMap[GAMESESSION] = new FieldMetaData("gameSession",TFieldRequirementType.DEFAULT,new FieldValueMetaData(TType.STRING));
      metaDataMap[KEY] = new FieldMetaData("key",TFieldRequirementType.DEFAULT,new FieldValueMetaData(TType.STRING));
      metaDataMap[VALUE] = new FieldMetaData("value",TFieldRequirementType.DEFAULT,new FieldValueMetaData(TType.STRING));
      FieldMetaData.addStructMetaDataMap(settings_set_args,metaDataMap);
   }
   
   private var _gameSession:String;
   
   private var _key:String;
   
   private var _value:String;
   
   function settings_set_args()
   {
      super();
   }
   
   public function get gameSession() : String
   {
      return this._gameSession;
   }
   
   public function set gameSession(param1:String) : void
   {
      this._gameSession = param1;
   }
   
   public function unsetGameSession() : void
   {
      this.gameSession = null;
   }
   
   public function isSetGameSession() : Boolean
   {
      return this.gameSession != null;
   }
   
   public function get key() : String
   {
      return this._key;
   }
   
   public function set key(param1:String) : void
   {
      this._key = param1;
   }
   
   public function unsetKey() : void
   {
      this.key = null;
   }
   
   public function isSetKey() : Boolean
   {
      return this.key != null;
   }
   
   public function get value() : String
   {
      return this._value;
   }
   
   public function set value(param1:String) : void
   {
      this._value = param1;
   }
   
   public function unsetValue() : void
   {
      this.value = null;
   }
   
   public function isSetValue() : Boolean
   {
      return this.value != null;
   }
   
   public function setFieldValue(param1:int, param2:*) : void
   {
      switch(param1)
      {
         case GAMESESSION:
            if(param2 == null)
            {
               this.unsetGameSession();
               break;
            }
            this.gameSession = param2;
            break;
         case KEY:
            if(param2 == null)
            {
               this.unsetKey();
               break;
            }
            this.key = param2;
            break;
         case VALUE:
            if(param2 == null)
            {
               this.unsetValue();
               break;
            }
            this.value = param2;
            break;
         default:
            throw new ArgumentError("Field " + param1 + " doesn\'t exist!");
      }
   }
   
   public function getFieldValue(param1:int) : *
   {
      switch(param1)
      {
         case GAMESESSION:
            return this.gameSession;
         case KEY:
            return this.key;
         case VALUE:
            return this.value;
         default:
            throw new ArgumentError("Field " + param1 + " doesn\'t exist!");
      }
   }
   
   public function isSet(param1:int) : Boolean
   {
      switch(param1)
      {
         case GAMESESSION:
            return this.isSetGameSession();
         case KEY:
            return this.isSetKey();
         case VALUE:
            return this.isSetValue();
         default:
            throw new ArgumentError("Field " + param1 + " doesn\'t exist!");
      }
   }
   
   public function read(param1:TProtocol) : void
   {
      var _loc2_:TField = null;
      param1.readStructBegin();
      while(true)
      {
         _loc2_ = param1.readFieldBegin();
         if(_loc2_.type == TType.STOP)
         {
            break;
         }
         switch(_loc2_.id)
         {
            case GAMESESSION:
               if(_loc2_.type == TType.STRING)
               {
                  this.gameSession = param1.readString();
                  break;
               }
               TProtocolUtil.skip(param1,_loc2_.type);
               break;
            case KEY:
               if(_loc2_.type == TType.STRING)
               {
                  this.key = param1.readString();
                  break;
               }
               TProtocolUtil.skip(param1,_loc2_.type);
               break;
            case VALUE:
               if(_loc2_.type == TType.STRING)
               {
                  this.value = param1.readString();
                  break;
               }
               TProtocolUtil.skip(param1,_loc2_.type);
               break;
            default:
               TProtocolUtil.skip(param1,_loc2_.type);
         }
         param1.readFieldEnd();
      }
      param1.readStructEnd();
      this.validate();
   }
   
   public function write(param1:TProtocol) : void
   {
      this.validate();
      param1.writeStructBegin(STRUCT_DESC);
      if(this.gameSession != null)
      {
         param1.writeFieldBegin(GAME_SESSION_FIELD_DESC);
         param1.writeString(this.gameSession);
         param1.writeFieldEnd();
      }
      if(this.key != null)
      {
         param1.writeFieldBegin(KEY_FIELD_DESC);
         param1.writeString(this.key);
         param1.writeFieldEnd();
      }
      if(this.value != null)
      {
         param1.writeFieldBegin(VALUE_FIELD_DESC);
         param1.writeString(this.value);
         param1.writeFieldEnd();
      }
      param1.writeFieldStop();
      param1.writeStructEnd();
   }
   
   public function toString() : String
   {
      var _loc1_:* = new String("settings_set_args(");
      var _loc2_:Boolean = true;
      _loc1_ = _loc1_ + "gameSession:";
      if(this.gameSession == null)
      {
         _loc1_ = _loc1_ + "null";
      }
      else
      {
         _loc1_ = _loc1_ + this.gameSession;
      }
      _loc2_ = false;
      if(!_loc2_)
      {
         _loc1_ = _loc1_ + ", ";
      }
      _loc1_ = _loc1_ + "key:";
      if(this.key == null)
      {
         _loc1_ = _loc1_ + "null";
      }
      else
      {
         _loc1_ = _loc1_ + this.key;
      }
      _loc2_ = false;
      if(!_loc2_)
      {
         _loc1_ = _loc1_ + ", ";
      }
      _loc1_ = _loc1_ + "value:";
      if(this.value == null)
      {
         _loc1_ = _loc1_ + "null";
      }
      else
      {
         _loc1_ = _loc1_ + this.value;
      }
      _loc2_ = false;
      _loc1_ = _loc1_ + ")";
      return _loc1_;
   }
   
   public function validate() : void
   {
   }
}

import com.ankama.zaap.ZaapError;
import flash.utils.Dictionary;
import org.apache.thrift.TBase;
import org.apache.thrift.TFieldRequirementType;
import org.apache.thrift.meta_data.FieldMetaData;
import org.apache.thrift.meta_data.StructMetaData;
import org.apache.thrift.protocol.TField;
import org.apache.thrift.protocol.TProtocol;
import org.apache.thrift.protocol.TProtocolUtil;
import org.apache.thrift.protocol.TStruct;
import org.apache.thrift.protocol.TType;

class settings_set_result implements TBase
{
   
   private static const STRUCT_DESC:TStruct = new TStruct("settings_set_result");
   
   private static const ERROR_FIELD_DESC:TField = new TField("error",TType.STRUCT,1);
   
   public static const ERROR:int = 1;
   
   public static const metaDataMap:Dictionary = new Dictionary();
   
   {
      metaDataMap[ERROR] = new FieldMetaData("error",TFieldRequirementType.DEFAULT,new StructMetaData(TType.STRUCT,ZaapError));
      FieldMetaData.addStructMetaDataMap(settings_set_result,metaDataMap);
   }
   
   private var _error:ZaapError;
   
   function settings_set_result()
   {
      super();
   }
   
   public function get error() : ZaapError
   {
      return this._error;
   }
   
   public function set error(param1:ZaapError) : void
   {
      this._error = param1;
   }
   
   public function unsetError() : void
   {
      this.error = null;
   }
   
   public function isSetError() : Boolean
   {
      return this.error != null;
   }
   
   public function setFieldValue(param1:int, param2:*) : void
   {
      switch(param1)
      {
         case ERROR:
            if(param2 == null)
            {
               this.unsetError();
            }
            else
            {
               this.error = param2;
            }
            return;
         default:
            throw new ArgumentError("Field " + param1 + " doesn\'t exist!");
      }
   }
   
   public function getFieldValue(param1:int) : *
   {
      switch(param1)
      {
         case ERROR:
            return this.error;
         default:
            throw new ArgumentError("Field " + param1 + " doesn\'t exist!");
      }
   }
   
   public function isSet(param1:int) : Boolean
   {
      switch(param1)
      {
         case ERROR:
            return this.isSetError();
         default:
            throw new ArgumentError("Field " + param1 + " doesn\'t exist!");
      }
   }
   
   public function read(param1:TProtocol) : void
   {
      var _loc2_:TField = null;
      param1.readStructBegin();
      while(true)
      {
         _loc2_ = param1.readFieldBegin();
         if(_loc2_.type == TType.STOP)
         {
            break;
         }
         switch(_loc2_.id)
         {
            case ERROR:
               if(_loc2_.type == TType.STRUCT)
               {
                  this.error = new ZaapError();
                  this.error.read(param1);
                  break;
               }
               TProtocolUtil.skip(param1,_loc2_.type);
               break;
            default:
               TProtocolUtil.skip(param1,_loc2_.type);
         }
         param1.readFieldEnd();
      }
      param1.readStructEnd();
      this.validate();
   }
   
   public function write(param1:TProtocol) : void
   {
      param1.writeStructBegin(STRUCT_DESC);
      if(this.isSetError())
      {
         param1.writeFieldBegin(ERROR_FIELD_DESC);
         this.error.write(param1);
         param1.writeFieldEnd();
      }
      param1.writeFieldStop();
      param1.writeStructEnd();
   }
   
   public function toString() : String
   {
      var _loc1_:* = new String("settings_set_result(");
      var _loc2_:Boolean = true;
      _loc1_ = _loc1_ + "error:";
      if(this.error == null)
      {
         _loc1_ = _loc1_ + "null";
      }
      else
      {
         _loc1_ = _loc1_ + this.error;
      }
      _loc2_ = false;
      _loc1_ = _loc1_ + ")";
      return _loc1_;
   }
   
   public function validate() : void
   {
   }
}

import flash.utils.Dictionary;
import org.apache.thrift.TBase;
import org.apache.thrift.TFieldRequirementType;
import org.apache.thrift.meta_data.FieldMetaData;
import org.apache.thrift.meta_data.FieldValueMetaData;
import org.apache.thrift.protocol.TField;
import org.apache.thrift.protocol.TProtocol;
import org.apache.thrift.protocol.TProtocolUtil;
import org.apache.thrift.protocol.TStruct;
import org.apache.thrift.protocol.TType;

class userInfo_get_args implements TBase
{
   
   private static const STRUCT_DESC:TStruct = new TStruct("userInfo_get_args");
   
   private static const GAME_SESSION_FIELD_DESC:TField = new TField("gameSession",TType.STRING,1);
   
   public static const GAMESESSION:int = 1;
   
   public static const metaDataMap:Dictionary = new Dictionary();
   
   {
      metaDataMap[GAMESESSION] = new FieldMetaData("gameSession",TFieldRequirementType.DEFAULT,new FieldValueMetaData(TType.STRING));
      FieldMetaData.addStructMetaDataMap(userInfo_get_args,metaDataMap);
   }
   
   private var _gameSession:String;
   
   function userInfo_get_args()
   {
      super();
   }
   
   public function get gameSession() : String
   {
      return this._gameSession;
   }
   
   public function set gameSession(param1:String) : void
   {
      this._gameSession = param1;
   }
   
   public function unsetGameSession() : void
   {
      this.gameSession = null;
   }
   
   public function isSetGameSession() : Boolean
   {
      return this.gameSession != null;
   }
   
   public function setFieldValue(param1:int, param2:*) : void
   {
      switch(param1)
      {
         case GAMESESSION:
            if(param2 == null)
            {
               this.unsetGameSession();
            }
            else
            {
               this.gameSession = param2;
            }
            return;
         default:
            throw new ArgumentError("Field " + param1 + " doesn\'t exist!");
      }
   }
   
   public function getFieldValue(param1:int) : *
   {
      switch(param1)
      {
         case GAMESESSION:
            return this.gameSession;
         default:
            throw new ArgumentError("Field " + param1 + " doesn\'t exist!");
      }
   }
   
   public function isSet(param1:int) : Boolean
   {
      switch(param1)
      {
         case GAMESESSION:
            return this.isSetGameSession();
         default:
            throw new ArgumentError("Field " + param1 + " doesn\'t exist!");
      }
   }
   
   public function read(param1:TProtocol) : void
   {
      var _loc2_:TField = null;
      param1.readStructBegin();
      while(true)
      {
         _loc2_ = param1.readFieldBegin();
         if(_loc2_.type == TType.STOP)
         {
            break;
         }
         switch(_loc2_.id)
         {
            case GAMESESSION:
               if(_loc2_.type == TType.STRING)
               {
                  this.gameSession = param1.readString();
                  break;
               }
               TProtocolUtil.skip(param1,_loc2_.type);
               break;
            default:
               TProtocolUtil.skip(param1,_loc2_.type);
         }
         param1.readFieldEnd();
      }
      param1.readStructEnd();
      this.validate();
   }
   
   public function write(param1:TProtocol) : void
   {
      this.validate();
      param1.writeStructBegin(STRUCT_DESC);
      if(this.gameSession != null)
      {
         param1.writeFieldBegin(GAME_SESSION_FIELD_DESC);
         param1.writeString(this.gameSession);
         param1.writeFieldEnd();
      }
      param1.writeFieldStop();
      param1.writeStructEnd();
   }
   
   public function toString() : String
   {
      var _loc1_:* = new String("userInfo_get_args(");
      var _loc2_:Boolean = true;
      _loc1_ = _loc1_ + "gameSession:";
      if(this.gameSession == null)
      {
         _loc1_ = _loc1_ + "null";
      }
      else
      {
         _loc1_ = _loc1_ + this.gameSession;
      }
      _loc2_ = false;
      _loc1_ = _loc1_ + ")";
      return _loc1_;
   }
   
   public function validate() : void
   {
   }
}

import com.ankama.zaap.ZaapError;
import flash.utils.Dictionary;
import org.apache.thrift.TBase;
import org.apache.thrift.TFieldRequirementType;
import org.apache.thrift.meta_data.FieldMetaData;
import org.apache.thrift.meta_data.FieldValueMetaData;
import org.apache.thrift.meta_data.StructMetaData;
import org.apache.thrift.protocol.TField;
import org.apache.thrift.protocol.TProtocol;
import org.apache.thrift.protocol.TProtocolUtil;
import org.apache.thrift.protocol.TStruct;
import org.apache.thrift.protocol.TType;

class userInfo_get_result implements TBase
{
   
   private static const STRUCT_DESC:TStruct = new TStruct("userInfo_get_result");
   
   private static const SUCCESS_FIELD_DESC:TField = new TField("success",TType.STRING,0);
   
   private static const ERROR_FIELD_DESC:TField = new TField("error",TType.STRUCT,1);
   
   public static const SUCCESS:int = 0;
   
   public static const ERROR:int = 1;
   
   public static const metaDataMap:Dictionary = new Dictionary();
   
   {
      metaDataMap[SUCCESS] = new FieldMetaData("success",TFieldRequirementType.DEFAULT,new FieldValueMetaData(TType.STRING));
      metaDataMap[ERROR] = new FieldMetaData("error",TFieldRequirementType.DEFAULT,new StructMetaData(TType.STRUCT,ZaapError));
      FieldMetaData.addStructMetaDataMap(userInfo_get_result,metaDataMap);
   }
   
   private var _success:String;
   
   private var _error:ZaapError;
   
   function userInfo_get_result()
   {
      super();
   }
   
   public function get success() : String
   {
      return this._success;
   }
   
   public function set success(param1:String) : void
   {
      this._success = param1;
   }
   
   public function unsetSuccess() : void
   {
      this.success = null;
   }
   
   public function isSetSuccess() : Boolean
   {
      return this.success != null;
   }
   
   public function get error() : ZaapError
   {
      return this._error;
   }
   
   public function set error(param1:ZaapError) : void
   {
      this._error = param1;
   }
   
   public function unsetError() : void
   {
      this.error = null;
   }
   
   public function isSetError() : Boolean
   {
      return this.error != null;
   }
   
   public function setFieldValue(param1:int, param2:*) : void
   {
      switch(param1)
      {
         case SUCCESS:
            if(param2 == null)
            {
               this.unsetSuccess();
               break;
            }
            this.success = param2;
            break;
         case ERROR:
            if(param2 == null)
            {
               this.unsetError();
               break;
            }
            this.error = param2;
            break;
         default:
            throw new ArgumentError("Field " + param1 + " doesn\'t exist!");
      }
   }
   
   public function getFieldValue(param1:int) : *
   {
      switch(param1)
      {
         case SUCCESS:
            return this.success;
         case ERROR:
            return this.error;
         default:
            throw new ArgumentError("Field " + param1 + " doesn\'t exist!");
      }
   }
   
   public function isSet(param1:int) : Boolean
   {
      switch(param1)
      {
         case SUCCESS:
            return this.isSetSuccess();
         case ERROR:
            return this.isSetError();
         default:
            throw new ArgumentError("Field " + param1 + " doesn\'t exist!");
      }
   }
   
   public function read(param1:TProtocol) : void
   {
      var _loc2_:TField = null;
      param1.readStructBegin();
      while(true)
      {
         _loc2_ = param1.readFieldBegin();
         if(_loc2_.type == TType.STOP)
         {
            break;
         }
         switch(_loc2_.id)
         {
            case SUCCESS:
               if(_loc2_.type == TType.STRING)
               {
                  this.success = param1.readString();
                  break;
               }
               TProtocolUtil.skip(param1,_loc2_.type);
               break;
            case ERROR:
               if(_loc2_.type == TType.STRUCT)
               {
                  this.error = new ZaapError();
                  this.error.read(param1);
                  break;
               }
               TProtocolUtil.skip(param1,_loc2_.type);
               break;
            default:
               TProtocolUtil.skip(param1,_loc2_.type);
         }
         param1.readFieldEnd();
      }
      param1.readStructEnd();
      this.validate();
   }
   
   public function write(param1:TProtocol) : void
   {
      param1.writeStructBegin(STRUCT_DESC);
      if(this.isSetSuccess())
      {
         param1.writeFieldBegin(SUCCESS_FIELD_DESC);
         param1.writeString(this.success);
         param1.writeFieldEnd();
      }
      else if(this.isSetError())
      {
         param1.writeFieldBegin(ERROR_FIELD_DESC);
         this.error.write(param1);
         param1.writeFieldEnd();
      }
      param1.writeFieldStop();
      param1.writeStructEnd();
   }
   
   public function toString() : String
   {
      var _loc1_:* = new String("userInfo_get_result(");
      var _loc2_:Boolean = true;
      _loc1_ = _loc1_ + "success:";
      if(this.success == null)
      {
         _loc1_ = _loc1_ + "null";
      }
      else
      {
         _loc1_ = _loc1_ + this.success;
      }
      _loc2_ = false;
      if(!_loc2_)
      {
         _loc1_ = _loc1_ + ", ";
      }
      _loc1_ = _loc1_ + "error:";
      if(this.error == null)
      {
         _loc1_ = _loc1_ + "null";
      }
      else
      {
         _loc1_ = _loc1_ + this.error;
      }
      _loc2_ = false;
      _loc1_ = _loc1_ + ")";
      return _loc1_;
   }
   
   public function validate() : void
   {
   }
}

import flash.utils.Dictionary;
import org.apache.thrift.TBase;
import org.apache.thrift.TFieldRequirementType;
import org.apache.thrift.meta_data.FieldMetaData;
import org.apache.thrift.meta_data.FieldValueMetaData;
import org.apache.thrift.protocol.TField;
import org.apache.thrift.protocol.TProtocol;
import org.apache.thrift.protocol.TProtocolUtil;
import org.apache.thrift.protocol.TStruct;
import org.apache.thrift.protocol.TType;

class release_restartOnExit_args implements TBase
{
   
   private static const STRUCT_DESC:TStruct = new TStruct("release_restartOnExit_args");
   
   private static const GAME_SESSION_FIELD_DESC:TField = new TField("gameSession",TType.STRING,1);
   
   public static const GAMESESSION:int = 1;
   
   public static const metaDataMap:Dictionary = new Dictionary();
   
   {
      metaDataMap[GAMESESSION] = new FieldMetaData("gameSession",TFieldRequirementType.DEFAULT,new FieldValueMetaData(TType.STRING));
      FieldMetaData.addStructMetaDataMap(release_restartOnExit_args,metaDataMap);
   }
   
   private var _gameSession:String;
   
   function release_restartOnExit_args()
   {
      super();
   }
   
   public function get gameSession() : String
   {
      return this._gameSession;
   }
   
   public function set gameSession(param1:String) : void
   {
      this._gameSession = param1;
   }
   
   public function unsetGameSession() : void
   {
      this.gameSession = null;
   }
   
   public function isSetGameSession() : Boolean
   {
      return this.gameSession != null;
   }
   
   public function setFieldValue(param1:int, param2:*) : void
   {
      switch(param1)
      {
         case GAMESESSION:
            if(param2 == null)
            {
               this.unsetGameSession();
            }
            else
            {
               this.gameSession = param2;
            }
            return;
         default:
            throw new ArgumentError("Field " + param1 + " doesn\'t exist!");
      }
   }
   
   public function getFieldValue(param1:int) : *
   {
      switch(param1)
      {
         case GAMESESSION:
            return this.gameSession;
         default:
            throw new ArgumentError("Field " + param1 + " doesn\'t exist!");
      }
   }
   
   public function isSet(param1:int) : Boolean
   {
      switch(param1)
      {
         case GAMESESSION:
            return this.isSetGameSession();
         default:
            throw new ArgumentError("Field " + param1 + " doesn\'t exist!");
      }
   }
   
   public function read(param1:TProtocol) : void
   {
      var _loc2_:TField = null;
      param1.readStructBegin();
      while(true)
      {
         _loc2_ = param1.readFieldBegin();
         if(_loc2_.type == TType.STOP)
         {
            break;
         }
         switch(_loc2_.id)
         {
            case GAMESESSION:
               if(_loc2_.type == TType.STRING)
               {
                  this.gameSession = param1.readString();
                  break;
               }
               TProtocolUtil.skip(param1,_loc2_.type);
               break;
            default:
               TProtocolUtil.skip(param1,_loc2_.type);
         }
         param1.readFieldEnd();
      }
      param1.readStructEnd();
      this.validate();
   }
   
   public function write(param1:TProtocol) : void
   {
      this.validate();
      param1.writeStructBegin(STRUCT_DESC);
      if(this.gameSession != null)
      {
         param1.writeFieldBegin(GAME_SESSION_FIELD_DESC);
         param1.writeString(this.gameSession);
         param1.writeFieldEnd();
      }
      param1.writeFieldStop();
      param1.writeStructEnd();
   }
   
   public function toString() : String
   {
      var _loc1_:* = new String("release_restartOnExit_args(");
      var _loc2_:Boolean = true;
      _loc1_ = _loc1_ + "gameSession:";
      if(this.gameSession == null)
      {
         _loc1_ = _loc1_ + "null";
      }
      else
      {
         _loc1_ = _loc1_ + this.gameSession;
      }
      _loc2_ = false;
      _loc1_ = _loc1_ + ")";
      return _loc1_;
   }
   
   public function validate() : void
   {
   }
}

import flash.utils.Dictionary;
import org.apache.thrift.TBase;
import org.apache.thrift.meta_data.FieldMetaData;
import org.apache.thrift.protocol.TField;
import org.apache.thrift.protocol.TProtocol;
import org.apache.thrift.protocol.TProtocolUtil;
import org.apache.thrift.protocol.TStruct;
import org.apache.thrift.protocol.TType;

class release_restartOnExit_result implements TBase
{
   
   private static const STRUCT_DESC:TStruct = new TStruct("release_restartOnExit_result");
   
   public static const metaDataMap:Dictionary = new Dictionary();
   
   {
      FieldMetaData.addStructMetaDataMap(release_restartOnExit_result,metaDataMap);
   }
   
   function release_restartOnExit_result()
   {
      super();
   }
   
   public function setFieldValue(param1:int, param2:*) : void
   {
      if(0)
      {
      }
      throw new ArgumentError("Field " + param1 + " doesn\'t exist!");
   }
   
   public function getFieldValue(param1:int) : *
   {
      if(0)
      {
      }
      throw new ArgumentError("Field " + param1 + " doesn\'t exist!");
   }
   
   public function isSet(param1:int) : Boolean
   {
      if(0)
      {
      }
      throw new ArgumentError("Field " + param1 + " doesn\'t exist!");
   }
   
   public function read(param1:TProtocol) : void
   {
      var _loc2_:TField = null;
      param1.readStructBegin();
      while(true)
      {
         _loc2_ = param1.readFieldBegin();
         if(_loc2_.type == TType.STOP)
         {
            break;
         }
         if(0)
         {
         }
         TProtocolUtil.skip(param1,_loc2_.type);
         param1.readFieldEnd();
      }
      param1.readStructEnd();
      this.validate();
   }
   
   public function write(param1:TProtocol) : void
   {
      param1.writeStructBegin(STRUCT_DESC);
      param1.writeFieldStop();
      param1.writeStructEnd();
   }
   
   public function toString() : String
   {
      var _loc1_:* = new String("release_restartOnExit_result(");
      _loc1_ = _loc1_ + ")";
      return _loc1_;
   }
   
   public function validate() : void
   {
   }
}
