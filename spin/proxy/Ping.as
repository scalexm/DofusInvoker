package spin.proxy
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.ReadUtils;
   import com.netease.protobuf.UInt64;
   import com.netease.protobuf.WireType;
   import com.netease.protobuf.WriteUtils;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor_TYPE_FIXED64;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final dynamic class Ping extends Message
   {
      
      public static const UID:String = "16A34544-1006-4A93-B9F2-E532D48C418C";
      
      public static const TIMESTAMP:FieldDescriptor_TYPE_FIXED64 = new FieldDescriptor_TYPE_FIXED64("spin.proxy.Ping.timestamp","timestamp",1 << 3 | WireType.FIXED_64_BIT);
      
      public static const ID:FieldDescriptor_TYPE_FIXED64 = new FieldDescriptor_TYPE_FIXED64("spin.proxy.Ping.id","id",2 << 3 | WireType.FIXED_64_BIT);
       
      
      private var timestamp$field:UInt64;
      
      private var id$field:UInt64;
      
      public function Ping()
      {
         super();
      }
      
      public function get uid() : String
      {
         return UID;
      }
      
      public function clearTimestamp() : void
      {
         this.timestamp$field = null;
      }
      
      public function get hasTimestamp() : Boolean
      {
         return this.timestamp$field != null;
      }
      
      public function set timestamp(value:UInt64) : void
      {
         this.timestamp$field = value;
      }
      
      public function get timestamp() : UInt64
      {
         if(!this.hasTimestamp)
         {
            return new UInt64(0,0);
         }
         return this.timestamp$field;
      }
      
      public function clearId() : void
      {
         this.id$field = null;
      }
      
      public function get hasId() : Boolean
      {
         return this.id$field != null;
      }
      
      public function set id(value:UInt64) : void
      {
         this.id$field = value;
      }
      
      public function get id() : UInt64
      {
         if(!this.hasId)
         {
            return new UInt64(0,0);
         }
         return this.id$field;
      }
      
      override final function writeToBuffer(output:WritingBuffer) : void
      {
         var fieldKey:* = undefined;
         if(this.hasTimestamp)
         {
            WriteUtils.writeTag(output,WireType.FIXED_64_BIT,1);
            WriteUtils.write_TYPE_FIXED64(output,this.timestamp$field);
         }
         if(this.hasId)
         {
            WriteUtils.writeTag(output,WireType.FIXED_64_BIT,2);
            WriteUtils.write_TYPE_FIXED64(output,this.id$field);
         }
         for(fieldKey in this)
         {
            super.writeUnknown(output,fieldKey);
         }
      }
      
      override final function readFromSlice(input:IDataInput, bytesAfterSlice:uint) : void
      {
         var tag:uint = 0;
         var timestamp$count:uint = 0;
         var id$count:uint = 0;
         while(input.bytesAvailable > bytesAfterSlice)
         {
            tag = ReadUtils.read_TYPE_UINT32(input);
            switch(tag >> 3)
            {
               case 1:
                  if(timestamp$count != 0)
                  {
                     throw new IOError("Bad data format: Ping.timestamp cannot be set twice.");
                  }
                  timestamp$count++;
                  this.timestamp = ReadUtils.read_TYPE_FIXED64(input);
                  continue;
               case 2:
                  if(id$count != 0)
                  {
                     throw new IOError("Bad data format: Ping.id cannot be set twice.");
                  }
                  id$count++;
                  this.id = ReadUtils.read_TYPE_FIXED64(input);
                  continue;
               default:
                  super.readUnknown(input,tag);
                  continue;
            }
         }
      }
   }
}
