package spin
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
   
   public final dynamic class Uuid extends Message
   {
      
      public static const HIGHBITS:FieldDescriptor_TYPE_FIXED64 = new FieldDescriptor_TYPE_FIXED64("spin.Uuid.highBits","highBits",1 << 3 | WireType.FIXED_64_BIT);
      
      public static const LOWBITS:FieldDescriptor_TYPE_FIXED64 = new FieldDescriptor_TYPE_FIXED64("spin.Uuid.lowBits","lowBits",2 << 3 | WireType.FIXED_64_BIT);
       
      
      public var highBits:UInt64;
      
      public var lowBits:UInt64;
      
      public function Uuid()
      {
         super();
      }
      
      override final function writeToBuffer(output:WritingBuffer) : void
      {
         var fieldKey:* = undefined;
         WriteUtils.writeTag(output,WireType.FIXED_64_BIT,1);
         WriteUtils.write_TYPE_FIXED64(output,this.highBits);
         WriteUtils.writeTag(output,WireType.FIXED_64_BIT,2);
         WriteUtils.write_TYPE_FIXED64(output,this.lowBits);
         for(fieldKey in this)
         {
            super.writeUnknown(output,fieldKey);
         }
      }
      
      override final function readFromSlice(input:IDataInput, bytesAfterSlice:uint) : void
      {
         var tag:uint = 0;
         var highBits$count:uint = 0;
         var lowBits$count:uint = 0;
         while(input.bytesAvailable > bytesAfterSlice)
         {
            tag = ReadUtils.read_TYPE_UINT32(input);
            switch(tag >> 3)
            {
               case 1:
                  if(highBits$count != 0)
                  {
                     throw new IOError("Bad data format: Uuid.highBits cannot be set twice.");
                  }
                  highBits$count++;
                  this.highBits = ReadUtils.read_TYPE_FIXED64(input);
                  continue;
               case 2:
                  if(lowBits$count != 0)
                  {
                     throw new IOError("Bad data format: Uuid.lowBits cannot be set twice.");
                  }
                  lowBits$count++;
                  this.lowBits = ReadUtils.read_TYPE_FIXED64(input);
                  continue;
               default:
                  super.readUnknown(input,tag);
                  continue;
            }
         }
      }
   }
}
