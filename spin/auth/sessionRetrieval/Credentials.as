package spin.auth.sessionRetrieval
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.ReadUtils;
   import com.netease.protobuf.WireType;
   import com.netease.protobuf.WriteUtils;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor_TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   import spin.Uuid;
   
   public final dynamic class Credentials extends Message
   {
      
      public static const UID:String = "13716FCF-E66A-439B-9094-10E3DF4A6BE9";
      
      public static const SESSIONID:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("spin.auth.sessionRetrieval.Credentials.sessionId","sessionId",1 << 3 | WireType.LENGTH_DELIMITED,function():Class
      {
         return Uuid;
      });
       
      
      public var sessionId:Uuid;
      
      public function Credentials()
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
         WriteUtils.write_TYPE_MESSAGE(output,this.sessionId);
         for(fieldKey in this)
         {
            super.writeUnknown(output,fieldKey);
         }
      }
      
      override final function readFromSlice(input:IDataInput, bytesAfterSlice:uint) : void
      {
         var tag:uint = 0;
         var sessionId$count:uint = 0;
         while(input.bytesAvailable > bytesAfterSlice)
         {
            tag = ReadUtils.read_TYPE_UINT32(input);
            switch(tag >> 3)
            {
               case 1:
                  if(sessionId$count != 0)
                  {
                     throw new IOError("Bad data format: Credentials.sessionId cannot be set twice.");
                  }
                  sessionId$count++;
                  this.sessionId = new Uuid();
                  ReadUtils.read_TYPE_MESSAGE(input,this.sessionId);
                  continue;
               default:
                  super.readUnknown(input,tag);
                  continue;
            }
         }
      }
   }
}
