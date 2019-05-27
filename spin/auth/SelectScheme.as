package spin.auth
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.ReadUtils;
   import com.netease.protobuf.WireType;
   import com.netease.protobuf.WriteUtils;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor_TYPE_STRING;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final dynamic class SelectScheme extends Message
   {
      
      public static const UID:String = "24465F8E-B211-4AD7-B5D4-5040F0542CF3";
      
      public static const SCHEME:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("spin.auth.SelectScheme.scheme","scheme",1 << 3 | WireType.LENGTH_DELIMITED);
       
      
      public var scheme:String;
      
      public function SelectScheme()
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
         WriteUtils.writeTag(output,WireType.LENGTH_DELIMITED,1);
         WriteUtils.write_TYPE_STRING(output,this.scheme);
         for(fieldKey in this)
         {
            super.writeUnknown(output,fieldKey);
         }
      }
      
      override final function readFromSlice(input:IDataInput, bytesAfterSlice:uint) : void
      {
         var tag:uint = 0;
         var scheme$count:uint = 0;
         while(input.bytesAvailable > bytesAfterSlice)
         {
            tag = ReadUtils.read_TYPE_UINT32(input);
            switch(tag >> 3)
            {
               case 1:
                  if(scheme$count != 0)
                  {
                     throw new IOError("Bad data format: SelectScheme.scheme cannot be set twice.");
                  }
                  scheme$count++;
                  this.scheme = ReadUtils.read_TYPE_STRING(input);
                  continue;
               default:
                  super.readUnknown(input,tag);
                  continue;
            }
         }
      }
   }
}
