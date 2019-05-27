package spin.proxy
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.ReadUtils;
   import com.netease.protobuf.WireType;
   import com.netease.protobuf.WriteUtils;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor_TYPE_ENUM;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final dynamic class Disconnection extends Message
   {
      
      public static const UID:String = "8CB21025-0300-42AE-9601-DFD7AA90611A";
      
      public static const REASON:FieldDescriptor_TYPE_ENUM = new FieldDescriptor_TYPE_ENUM("spin.proxy.Disconnection.reason","reason",1 << 3 | WireType.VARINT,DisconnectionReason);
       
      
      private var reason$field:int;
      
      private var hasField$0:uint = 0;
      
      public function Disconnection()
      {
         super();
      }
      
      public function get uid() : String
      {
         return UID;
      }
      
      public function clearReason() : void
      {
         this.hasField$0 = this.hasField$0 & 4294967294;
         this.reason$field = new int();
      }
      
      public function get hasReason() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set reason(value:int) : void
      {
         this.hasField$0 = this.hasField$0 | 1;
         this.reason$field = value;
      }
      
      public function get reason() : int
      {
         return this.reason$field;
      }
      
      override final function writeToBuffer(output:WritingBuffer) : void
      {
         var fieldKey:* = undefined;
         if(this.hasReason)
         {
            WriteUtils.writeTag(output,WireType.VARINT,1);
            WriteUtils.write_TYPE_ENUM(output,this.reason$field);
         }
         for(fieldKey in this)
         {
            super.writeUnknown(output,fieldKey);
         }
      }
      
      override final function readFromSlice(input:IDataInput, bytesAfterSlice:uint) : void
      {
         var tag:uint = 0;
         var reason$count:uint = 0;
         while(input.bytesAvailable > bytesAfterSlice)
         {
            tag = ReadUtils.read_TYPE_UINT32(input);
            switch(tag >> 3)
            {
               case 1:
                  if(reason$count != 0)
                  {
                     throw new IOError("Bad data format: Disconnection.reason cannot be set twice.");
                  }
                  reason$count++;
                  this.reason = ReadUtils.read_TYPE_ENUM(input);
                  continue;
               default:
                  super.readUnknown(input,tag);
                  continue;
            }
         }
      }
   }
}
