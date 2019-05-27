package com.ankama.chat
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.ReadUtils;
   import com.netease.protobuf.WireType;
   import com.netease.protobuf.WriteUtils;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor_TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final dynamic class SetEndpointOccupation extends Message
   {
      
      public static const UID:String = "BE698F93-FF50-4E9B-89C4-B83A1842C385";
      
      public static const OCCUPATION:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("com.ankama.chat.SetEndpointOccupation.occupation","occupation",1 << 3 | WireType.LENGTH_DELIMITED,function():Class
      {
         return EndpointOccupation;
      });
       
      
      private var occupation$field:EndpointOccupation;
      
      public function SetEndpointOccupation()
      {
         super();
      }
      
      public function get uid() : String
      {
         return UID;
      }
      
      public function clearOccupation() : void
      {
         this.occupation$field = null;
      }
      
      public function get hasOccupation() : Boolean
      {
         return this.occupation$field != null;
      }
      
      public function set occupation(value:EndpointOccupation) : void
      {
         this.occupation$field = value;
      }
      
      public function get occupation() : EndpointOccupation
      {
         return this.occupation$field;
      }
      
      override final function writeToBuffer(output:WritingBuffer) : void
      {
         var fieldKey:* = undefined;
         if(this.hasOccupation)
         {
            WriteUtils.writeTag(output,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write_TYPE_MESSAGE(output,this.occupation$field);
         }
         for(fieldKey in this)
         {
            super.writeUnknown(output,fieldKey);
         }
      }
      
      override final function readFromSlice(input:IDataInput, bytesAfterSlice:uint) : void
      {
         var tag:uint = 0;
         var occupation$count:uint = 0;
         while(input.bytesAvailable > bytesAfterSlice)
         {
            tag = ReadUtils.read_TYPE_UINT32(input);
            switch(tag >> 3)
            {
               case 1:
                  if(occupation$count != 0)
                  {
                     throw new IOError("Bad data format: SetEndpointOccupation.occupation cannot be set twice.");
                  }
                  occupation$count++;
                  this.occupation = new EndpointOccupation();
                  ReadUtils.read_TYPE_MESSAGE(input,this.occupation);
                  continue;
               default:
                  super.readUnknown(input,tag);
                  continue;
            }
         }
      }
   }
}
