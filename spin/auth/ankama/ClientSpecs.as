package spin.auth.ankama
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.ReadUtils;
   import com.netease.protobuf.WireType;
   import com.netease.protobuf.WriteUtils;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor_TYPE_ENUM;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor_TYPE_STRING;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   import spin.auth.ankama.ClientSpecs.ClientType;
   import spin.auth.ankama.ClientSpecs.Device;
   
   public final dynamic class ClientSpecs extends Message
   {
      
      public static const CLIENTTYPE:FieldDescriptor_TYPE_ENUM = new FieldDescriptor_TYPE_ENUM("spin.auth.ankama.ClientSpecs.clientType","clientType",1 << 3 | WireType.VARINT,ClientType);
      
      public static const OS:FieldDescriptor_TYPE_ENUM = new FieldDescriptor_TYPE_ENUM("spin.auth.ankama.ClientSpecs.os","os",2 << 3 | WireType.VARINT,spin.auth.ankama.ClientSpecs.OS);
      
      public static const DEVICE:FieldDescriptor_TYPE_ENUM = new FieldDescriptor_TYPE_ENUM("spin.auth.ankama.ClientSpecs.device","device",3 << 3 | WireType.VARINT,Device);
      
      public static const DEVICEID:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("spin.auth.ankama.ClientSpecs.deviceId","deviceId",4 << 3 | WireType.LENGTH_DELIMITED);
       
      
      private var clientType$field:int;
      
      private var hasField$0:uint = 0;
      
      private var os$field:int;
      
      private var device$field:int;
      
      private var deviceId$field:String;
      
      public function ClientSpecs()
      {
         super();
      }
      
      public function clearClientType() : void
      {
         this.hasField$0 = this.hasField$0 & 4294967294;
         this.clientType$field = new int();
      }
      
      public function get hasClientType() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set clientType(value:int) : void
      {
         this.hasField$0 = this.hasField$0 | 1;
         this.clientType$field = value;
      }
      
      public function get clientType() : int
      {
         if(!this.hasClientType)
         {
            return ClientType.STANDALONE;
         }
         return this.clientType$field;
      }
      
      public function clearOs() : void
      {
         this.hasField$0 = this.hasField$0 & 4294967293;
         this.os$field = new int();
      }
      
      public function get hasOs() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set os(value:int) : void
      {
         this.hasField$0 = this.hasField$0 | 2;
         this.os$field = value;
      }
      
      public function get os() : int
      {
         if(!this.hasOs)
         {
            return spin.auth.ankama.ClientSpecs.OS.WINDOWS;
         }
         return this.os$field;
      }
      
      public function clearDevice() : void
      {
         this.hasField$0 = this.hasField$0 & 4294967291;
         this.device$field = new int();
      }
      
      public function get hasDevice() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set device(value:int) : void
      {
         this.hasField$0 = this.hasField$0 | 4;
         this.device$field = value;
      }
      
      public function get device() : int
      {
         if(!this.hasDevice)
         {
            return Device.PC;
         }
         return this.device$field;
      }
      
      public function clearDeviceId() : void
      {
         this.deviceId$field = null;
      }
      
      public function get hasDeviceId() : Boolean
      {
         return this.deviceId$field != null;
      }
      
      public function set deviceId(value:String) : void
      {
         this.deviceId$field = value;
      }
      
      public function get deviceId() : String
      {
         if(!this.hasDeviceId)
         {
            return "";
         }
         return this.deviceId$field;
      }
      
      override final function writeToBuffer(output:WritingBuffer) : void
      {
         var fieldKey:* = undefined;
         if(this.hasClientType)
         {
            WriteUtils.writeTag(output,WireType.VARINT,1);
            WriteUtils.write_TYPE_ENUM(output,this.clientType$field);
         }
         if(this.hasOs)
         {
            WriteUtils.writeTag(output,WireType.VARINT,2);
            WriteUtils.write_TYPE_ENUM(output,this.os$field);
         }
         if(this.hasDevice)
         {
            WriteUtils.writeTag(output,WireType.VARINT,3);
            WriteUtils.write_TYPE_ENUM(output,this.device$field);
         }
         if(this.hasDeviceId)
         {
            WriteUtils.writeTag(output,WireType.LENGTH_DELIMITED,4);
            WriteUtils.write_TYPE_STRING(output,this.deviceId$field);
         }
         for(fieldKey in this)
         {
            super.writeUnknown(output,fieldKey);
         }
      }
      
      override final function readFromSlice(input:IDataInput, bytesAfterSlice:uint) : void
      {
         var tag:uint = 0;
         var clientType$count:uint = 0;
         var os$count:uint = 0;
         var device$count:uint = 0;
         var deviceId$count:uint = 0;
         while(input.bytesAvailable > bytesAfterSlice)
         {
            tag = ReadUtils.read_TYPE_UINT32(input);
            switch(tag >> 3)
            {
               case 1:
                  if(clientType$count != 0)
                  {
                     throw new IOError("Bad data format: ClientSpecs.clientType cannot be set twice.");
                  }
                  clientType$count++;
                  this.clientType = ReadUtils.read_TYPE_ENUM(input);
                  continue;
               case 2:
                  if(os$count != 0)
                  {
                     throw new IOError("Bad data format: ClientSpecs.os cannot be set twice.");
                  }
                  os$count++;
                  this.os = ReadUtils.read_TYPE_ENUM(input);
                  continue;
               case 3:
                  if(device$count != 0)
                  {
                     throw new IOError("Bad data format: ClientSpecs.device cannot be set twice.");
                  }
                  device$count++;
                  this.device = ReadUtils.read_TYPE_ENUM(input);
                  continue;
               case 4:
                  if(deviceId$count != 0)
                  {
                     throw new IOError("Bad data format: ClientSpecs.deviceId cannot be set twice.");
                  }
                  deviceId$count++;
                  this.deviceId = ReadUtils.read_TYPE_STRING(input);
                  continue;
               default:
                  super.readUnknown(input,tag);
                  continue;
            }
         }
      }
   }
}
