package spin.auth.ankama
{
   import com.netease.protobuf.Int64;
   import com.netease.protobuf.Message;
   import com.netease.protobuf.ReadUtils;
   import com.netease.protobuf.WireType;
   import com.netease.protobuf.WriteUtils;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor_TYPE_BOOL;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor_TYPE_BYTES;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor_TYPE_SFIXED64;
   import flash.errors.IOError;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   
   public final dynamic class EncryptionDetails extends Message
   {
      
      public static const UID:String = "4F5301D0-1414-4093-9CE8-7FE6B9561696";
      
      public static const REQUIRED:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("spin.auth.ankama.EncryptionDetails.required","required",1 << 3 | WireType.VARINT);
      
      public static const CERT:FieldDescriptor_TYPE_BYTES = new FieldDescriptor_TYPE_BYTES("spin.auth.ankama.EncryptionDetails.cert","cert",2 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const SALT:FieldDescriptor_TYPE_SFIXED64 = new FieldDescriptor_TYPE_SFIXED64("spin.auth.ankama.EncryptionDetails.salt","salt",3 << 3 | WireType.FIXED_64_BIT);
       
      
      public var required:Boolean;
      
      public var cert:ByteArray;
      
      public var salt:Int64;
      
      public function EncryptionDetails()
      {
         super();
      }
      
      public function get uid() : String
      {
         return UID;
      }
      
      override final function writeToBuffer(output:WritingBuffer) : void
      {
         var fieldKey:* = undefined;
         WriteUtils.writeTag(output,WireType.VARINT,1);
         WriteUtils.write_TYPE_BOOL(output,this.required);
         WriteUtils.writeTag(output,WireType.LENGTH_DELIMITED,2);
         WriteUtils.write_TYPE_BYTES(output,this.cert);
         WriteUtils.writeTag(output,WireType.FIXED_64_BIT,3);
         WriteUtils.write_TYPE_SFIXED64(output,this.salt);
         for(fieldKey in this)
         {
            super.writeUnknown(output,fieldKey);
         }
      }
      
      override final function readFromSlice(input:IDataInput, bytesAfterSlice:uint) : void
      {
         var tag:uint = 0;
         var required$count:uint = 0;
         var cert$count:uint = 0;
         var salt$count:uint = 0;
         while(input.bytesAvailable > bytesAfterSlice)
         {
            tag = ReadUtils.read_TYPE_UINT32(input);
            switch(tag >> 3)
            {
               case 1:
                  if(required$count != 0)
                  {
                     throw new IOError("Bad data format: EncryptionDetails.required cannot be set twice.");
                  }
                  required$count++;
                  this.required = ReadUtils.read_TYPE_BOOL(input);
                  continue;
               case 2:
                  if(cert$count != 0)
                  {
                     throw new IOError("Bad data format: EncryptionDetails.cert cannot be set twice.");
                  }
                  cert$count++;
                  this.cert = ReadUtils.read_TYPE_BYTES(input);
                  continue;
               case 3:
                  if(salt$count != 0)
                  {
                     throw new IOError("Bad data format: EncryptionDetails.salt cannot be set twice.");
                  }
                  salt$count++;
                  this.salt = ReadUtils.read_TYPE_SFIXED64(input);
                  continue;
               default:
                  super.readUnknown(input,tag);
                  continue;
            }
         }
      }
   }
}
