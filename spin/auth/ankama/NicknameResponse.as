package spin.auth.ankama
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.ReadUtils;
   import com.netease.protobuf.WireType;
   import com.netease.protobuf.WriteUtils;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor_TYPE_STRING;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final dynamic class NicknameResponse extends Message
   {
      
      public static const UID:String = "756733E8-70A2-4FD6-A614-CFD491FA1674";
      
      public static const NICKNAME:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("spin.auth.ankama.NicknameResponse.nickname","nickname",1 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const LANG:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("spin.auth.ankama.NicknameResponse.lang","lang",2 << 3 | WireType.LENGTH_DELIMITED);
       
      
      public var nickname:String;
      
      public var lang:String;
      
      public function NicknameResponse()
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
         WriteUtils.write_TYPE_STRING(output,this.nickname);
         WriteUtils.writeTag(output,WireType.LENGTH_DELIMITED,2);
         WriteUtils.write_TYPE_STRING(output,this.lang);
         for(fieldKey in this)
         {
            super.writeUnknown(output,fieldKey);
         }
      }
      
      override final function readFromSlice(input:IDataInput, bytesAfterSlice:uint) : void
      {
         var tag:uint = 0;
         var nickname$count:uint = 0;
         var lang$count:uint = 0;
         while(input.bytesAvailable > bytesAfterSlice)
         {
            tag = ReadUtils.read_TYPE_UINT32(input);
            switch(tag >> 3)
            {
               case 1:
                  if(nickname$count != 0)
                  {
                     throw new IOError("Bad data format: NicknameResponse.nickname cannot be set twice.");
                  }
                  nickname$count++;
                  this.nickname = ReadUtils.read_TYPE_STRING(input);
                  continue;
               case 2:
                  if(lang$count != 0)
                  {
                     throw new IOError("Bad data format: NicknameResponse.lang cannot be set twice.");
                  }
                  lang$count++;
                  this.lang = ReadUtils.read_TYPE_STRING(input);
                  continue;
               default:
                  super.readUnknown(input,tag);
                  continue;
            }
         }
      }
   }
}
