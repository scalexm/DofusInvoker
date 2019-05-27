package spin.auth.ankama
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.ReadUtils;
   import com.netease.protobuf.WireType;
   import com.netease.protobuf.WriteUtils;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor_TYPE_BOOL;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor_TYPE_BYTES;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor_TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   
   public final dynamic class ApiKey extends Message
   {
      
      public static const UID:String = "6125B545-F725-4746-AA7C-D80FD36913E8";
      
      public static const KEY:FieldDescriptor_TYPE_BYTES = new FieldDescriptor_TYPE_BYTES("spin.auth.ankama.ApiKey.key","key",1 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const ENCRYPTED:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("spin.auth.ankama.ApiKey.encrypted","encrypted",2 << 3 | WireType.VARINT);
      
      public static const CLIENT:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("spin.auth.ankama.ApiKey.client","client",3 << 3 | WireType.LENGTH_DELIMITED,function():Class
      {
         return ClientSpecs;
      });
       
      
      public var key:ByteArray;
      
      public var encrypted:Boolean;
      
      private var client$field:ClientSpecs;
      
      public function ApiKey()
      {
         super();
      }
      
      public function get uid() : String
      {
         return UID;
      }
      
      public function clearClient() : void
      {
         this.client$field = null;
      }
      
      public function get hasClient() : Boolean
      {
         return this.client$field != null;
      }
      
      public function set client(value:ClientSpecs) : void
      {
         this.client$field = value;
      }
      
      public function get client() : ClientSpecs
      {
         return this.client$field;
      }
      
      override final function writeToBuffer(output:WritingBuffer) : void
      {
         var fieldKey:* = undefined;
         WriteUtils.writeTag(output,WireType.LENGTH_DELIMITED,1);
         WriteUtils.write_TYPE_BYTES(output,this.key);
         WriteUtils.writeTag(output,WireType.VARINT,2);
         WriteUtils.write_TYPE_BOOL(output,this.encrypted);
         if(this.hasClient)
         {
            WriteUtils.writeTag(output,WireType.LENGTH_DELIMITED,3);
            WriteUtils.write_TYPE_MESSAGE(output,this.client$field);
         }
         for(fieldKey in this)
         {
            super.writeUnknown(output,fieldKey);
         }
      }
      
      override final function readFromSlice(input:IDataInput, bytesAfterSlice:uint) : void
      {
         var tag:uint = 0;
         var key$count:uint = 0;
         var encrypted$count:uint = 0;
         var client$count:uint = 0;
         while(input.bytesAvailable > bytesAfterSlice)
         {
            tag = ReadUtils.read_TYPE_UINT32(input);
            switch(tag >> 3)
            {
               case 1:
                  if(key$count != 0)
                  {
                     throw new IOError("Bad data format: ApiKey.key cannot be set twice.");
                  }
                  key$count++;
                  this.key = ReadUtils.read_TYPE_BYTES(input);
                  continue;
               case 2:
                  if(encrypted$count != 0)
                  {
                     throw new IOError("Bad data format: ApiKey.encrypted cannot be set twice.");
                  }
                  encrypted$count++;
                  this.encrypted = ReadUtils.read_TYPE_BOOL(input);
                  continue;
               case 3:
                  if(client$count != 0)
                  {
                     throw new IOError("Bad data format: ApiKey.client cannot be set twice.");
                  }
                  client$count++;
                  this.client = new ClientSpecs();
                  ReadUtils.read_TYPE_MESSAGE(input,this.client);
                  continue;
               default:
                  super.readUnknown(input,tag);
                  continue;
            }
         }
      }
   }
}
