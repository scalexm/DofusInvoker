package com.ankama.chat
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.ReadUtils;
   import com.netease.protobuf.WireType;
   import com.netease.protobuf.WriteUtils;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor_TYPE_ENUM;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final dynamic class SetUserOccupation extends Message
   {
      
      public static const UID:String = "8E011A34-FBAB-4CCF-B4C5-12D2066BE645";
      
      public static const OCCUPATION:FieldDescriptor_TYPE_ENUM = new FieldDescriptor_TYPE_ENUM("com.ankama.chat.SetUserOccupation.occupation","occupation",1 << 3 | WireType.VARINT,UserOccupation);
       
      
      public var occupation:int;
      
      public function SetUserOccupation()
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
         WriteUtils.write_TYPE_ENUM(output,this.occupation);
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
                     throw new IOError("Bad data format: SetUserOccupation.occupation cannot be set twice.");
                  }
                  occupation$count++;
                  this.occupation = ReadUtils.read_TYPE_ENUM(input);
                  continue;
               default:
                  super.readUnknown(input,tag);
                  continue;
            }
         }
      }
   }
}
