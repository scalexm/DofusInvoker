package spin.auth
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.ReadUtils;
   import com.netease.protobuf.WireType;
   import com.netease.protobuf.WriteUtils;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor_TYPE_STRING;
   import flash.utils.IDataInput;
   
   public final dynamic class Start extends Message
   {
      
      public static const UID:String = "C40C1CFD-0A58-4ED6-9C9F-B1F4A01DFAD0";
      
      public static const SCHEMES:RepeatedFieldDescriptor_TYPE_STRING = new RepeatedFieldDescriptor_TYPE_STRING("spin.auth.Start.schemes","schemes",1 << 3 | WireType.LENGTH_DELIMITED);
       
      
      public var schemes:Array;
      
      public function Start()
      {
         this.schemes = [];
         super();
      }
      
      public function get uid() : String
      {
         return UID;
      }
      
      override final function writeToBuffer(output:WritingBuffer) : void
      {
         var fieldKey:* = undefined;
         for(var schemes$index:uint = 0; schemes$index < this.schemes.length; schemes$index++)
         {
            WriteUtils.writeTag(output,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write_TYPE_STRING(output,this.schemes[schemes$index]);
         }
         for(fieldKey in this)
         {
            super.writeUnknown(output,fieldKey);
         }
      }
      
      override final function readFromSlice(input:IDataInput, bytesAfterSlice:uint) : void
      {
         var tag:uint = 0;
         while(input.bytesAvailable > bytesAfterSlice)
         {
            tag = ReadUtils.read_TYPE_UINT32(input);
            switch(tag >> 3)
            {
               case 1:
                  this.schemes.push(ReadUtils.read_TYPE_STRING(input));
                  continue;
               default:
                  super.readUnknown(input,tag);
                  continue;
            }
         }
      }
   }
}
