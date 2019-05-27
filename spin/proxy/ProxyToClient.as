package spin.proxy
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.ReadUtils;
   import com.netease.protobuf.WireType;
   import com.netease.protobuf.WriteUtils;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor_TYPE_BYTES;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor_TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import spin.Uuid;
   
   public final dynamic class ProxyToClient extends Message
   {
      
      public static const MESSAGEUUID:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("spin.proxy.ProxyToClient.messageUuid","messageUuid",1 << 3 | WireType.LENGTH_DELIMITED,function():Class
      {
         return Uuid;
      });
      
      public static const DATA:FieldDescriptor_TYPE_BYTES = new FieldDescriptor_TYPE_BYTES("spin.proxy.ProxyToClient.data","data",2 << 3 | WireType.LENGTH_DELIMITED);
       
      
      public var messageUuid:Uuid;
      
      public var data:ByteArray;
      
      public function ProxyToClient()
      {
         super();
      }
      
      override final function writeToBuffer(output:WritingBuffer) : void
      {
         var fieldKey:* = undefined;
         WriteUtils.writeTag(output,WireType.LENGTH_DELIMITED,1);
         WriteUtils.write_TYPE_MESSAGE(output,this.messageUuid);
         WriteUtils.writeTag(output,WireType.LENGTH_DELIMITED,2);
         WriteUtils.write_TYPE_BYTES(output,this.data);
         for(fieldKey in this)
         {
            super.writeUnknown(output,fieldKey);
         }
      }
      
      override final function readFromSlice(input:IDataInput, bytesAfterSlice:uint) : void
      {
         var tag:uint = 0;
         var messageUuid$count:uint = 0;
         var data$count:uint = 0;
         while(input.bytesAvailable > bytesAfterSlice)
         {
            tag = ReadUtils.read_TYPE_UINT32(input);
            switch(tag >> 3)
            {
               case 1:
                  if(messageUuid$count != 0)
                  {
                     throw new IOError("Bad data format: ProxyToClient.messageUuid cannot be set twice.");
                  }
                  messageUuid$count++;
                  this.messageUuid = new Uuid();
                  ReadUtils.read_TYPE_MESSAGE(input,this.messageUuid);
                  continue;
               case 2:
                  if(data$count != 0)
                  {
                     throw new IOError("Bad data format: ProxyToClient.data cannot be set twice.");
                  }
                  data$count++;
                  this.data = ReadUtils.read_TYPE_BYTES(input);
                  continue;
               default:
                  super.readUnknown(input,tag);
                  continue;
            }
         }
      }
   }
}
