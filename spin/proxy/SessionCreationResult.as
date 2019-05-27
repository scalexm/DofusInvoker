package spin.proxy
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.ReadUtils;
   import com.netease.protobuf.WireType;
   import com.netease.protobuf.WriteUtils;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor_TYPE_BOOL;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor_TYPE_ENUM;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor_TYPE_MESSAGE;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor_TYPE_STRING;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor_TYPE_STRING;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   import spin.Uuid;
   import spin.auth.AuthenticationError;
   
   public final dynamic class SessionCreationResult extends Message
   {
      
      public static const UID:String = "AD9B5F18-73D1-468C-9BB3-2C48730C2B98";
      
      public static const SUCCESS:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("spin.proxy.SessionCreationResult.success","success",1 << 3 | WireType.VARINT);
      
      public static const SESSION:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("spin.proxy.SessionCreationResult.session","session",2 << 3 | WireType.LENGTH_DELIMITED,function():Class
      {
         return Uuid;
      });
      
      public static const ERROR:FieldDescriptor_TYPE_ENUM = new FieldDescriptor_TYPE_ENUM("spin.proxy.SessionCreationResult.error","error",3 << 3 | WireType.VARINT,AuthenticationError);
      
      public static const CUSTOMERROR:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("spin.proxy.SessionCreationResult.customError","customError",4 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const RECONNECTION:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("spin.proxy.SessionCreationResult.reconnection","reconnection",5 << 3 | WireType.VARINT);
      
      public static const RECONNECTIONTAGS:RepeatedFieldDescriptor_TYPE_STRING = new RepeatedFieldDescriptor_TYPE_STRING("spin.proxy.SessionCreationResult.reconnectionTags","reconnectionTags",6 << 3 | WireType.LENGTH_DELIMITED);
       
      
      public var success:Boolean;
      
      private var session$field:Uuid;
      
      private var error$field:int;
      
      private var hasField$0:uint = 0;
      
      private var customError$field:String;
      
      private var reconnection$field:Boolean;
      
      public var reconnectionTags:Array;
      
      public function SessionCreationResult()
      {
         this.reconnectionTags = [];
         super();
      }
      
      public function get uid() : String
      {
         return UID;
      }
      
      public function clearSession() : void
      {
         this.session$field = null;
      }
      
      public function get hasSession() : Boolean
      {
         return this.session$field != null;
      }
      
      public function set session(value:Uuid) : void
      {
         this.session$field = value;
      }
      
      public function get session() : Uuid
      {
         return this.session$field;
      }
      
      public function clearError() : void
      {
         this.hasField$0 = this.hasField$0 & 4294967294;
         this.error$field = new int();
      }
      
      public function get hasError() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set error(value:int) : void
      {
         this.hasField$0 = this.hasField$0 | 1;
         this.error$field = value;
      }
      
      public function get error() : int
      {
         return this.error$field;
      }
      
      public function clearCustomError() : void
      {
         this.customError$field = null;
      }
      
      public function get hasCustomError() : Boolean
      {
         return this.customError$field != null;
      }
      
      public function set customError(value:String) : void
      {
         this.customError$field = value;
      }
      
      public function get customError() : String
      {
         return this.customError$field;
      }
      
      public function clearReconnection() : void
      {
         this.hasField$0 = this.hasField$0 & 4294967293;
         this.reconnection$field = new Boolean();
      }
      
      public function get hasReconnection() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set reconnection(value:Boolean) : void
      {
         this.hasField$0 = this.hasField$0 | 2;
         this.reconnection$field = value;
      }
      
      public function get reconnection() : Boolean
      {
         if(!this.hasReconnection)
         {
            return false;
         }
         return this.reconnection$field;
      }
      
      override final function writeToBuffer(output:WritingBuffer) : void
      {
         var fieldKey:* = undefined;
         WriteUtils.writeTag(output,WireType.VARINT,1);
         WriteUtils.write_TYPE_BOOL(output,this.success);
         if(this.hasSession)
         {
            WriteUtils.writeTag(output,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write_TYPE_MESSAGE(output,this.session$field);
         }
         if(this.hasError)
         {
            WriteUtils.writeTag(output,WireType.VARINT,3);
            WriteUtils.write_TYPE_ENUM(output,this.error$field);
         }
         if(this.hasCustomError)
         {
            WriteUtils.writeTag(output,WireType.LENGTH_DELIMITED,4);
            WriteUtils.write_TYPE_STRING(output,this.customError$field);
         }
         if(this.hasReconnection)
         {
            WriteUtils.writeTag(output,WireType.VARINT,5);
            WriteUtils.write_TYPE_BOOL(output,this.reconnection$field);
         }
         for(var reconnectionTags$index:uint = 0; reconnectionTags$index < this.reconnectionTags.length; reconnectionTags$index++)
         {
            WriteUtils.writeTag(output,WireType.LENGTH_DELIMITED,6);
            WriteUtils.write_TYPE_STRING(output,this.reconnectionTags[reconnectionTags$index]);
         }
         for(fieldKey in this)
         {
            super.writeUnknown(output,fieldKey);
         }
      }
      
      override final function readFromSlice(input:IDataInput, bytesAfterSlice:uint) : void
      {
         var tag:uint = 0;
         var success$count:uint = 0;
         var session$count:uint = 0;
         var error$count:uint = 0;
         var customError$count:uint = 0;
         var reconnection$count:uint = 0;
         while(input.bytesAvailable > bytesAfterSlice)
         {
            tag = ReadUtils.read_TYPE_UINT32(input);
            switch(tag >> 3)
            {
               case 1:
                  if(success$count != 0)
                  {
                     throw new IOError("Bad data format: SessionCreationResult.success cannot be set twice.");
                  }
                  success$count++;
                  this.success = ReadUtils.read_TYPE_BOOL(input);
                  continue;
               case 2:
                  if(session$count != 0)
                  {
                     throw new IOError("Bad data format: SessionCreationResult.session cannot be set twice.");
                  }
                  session$count++;
                  this.session = new Uuid();
                  ReadUtils.read_TYPE_MESSAGE(input,this.session);
                  continue;
               case 3:
                  if(error$count != 0)
                  {
                     throw new IOError("Bad data format: SessionCreationResult.error cannot be set twice.");
                  }
                  error$count++;
                  this.error = ReadUtils.read_TYPE_ENUM(input);
                  continue;
               case 4:
                  if(customError$count != 0)
                  {
                     throw new IOError("Bad data format: SessionCreationResult.customError cannot be set twice.");
                  }
                  customError$count++;
                  this.customError = ReadUtils.read_TYPE_STRING(input);
                  continue;
               case 5:
                  if(reconnection$count != 0)
                  {
                     throw new IOError("Bad data format: SessionCreationResult.reconnection cannot be set twice.");
                  }
                  reconnection$count++;
                  this.reconnection = ReadUtils.read_TYPE_BOOL(input);
                  continue;
               case 6:
                  this.reconnectionTags.push(ReadUtils.read_TYPE_STRING(input));
                  continue;
               default:
                  super.readUnknown(input,tag);
                  continue;
            }
         }
      }
   }
}
