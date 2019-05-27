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
   
   public final dynamic class AuthSuccess extends Message
   {
      
      public static const UID:String = "65CA1894-82AB-4C1F-B48A-CB1B327F5221";
      
      public static const NICKNAME:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("spin.auth.ankama.AuthSuccess.nickName","nickName",1 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const LANG:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("spin.auth.ankama.AuthSuccess.lang","lang",2 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const COMMUNITY:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("spin.auth.ankama.AuthSuccess.community","community",3 << 3 | WireType.LENGTH_DELIMITED);
       
      
      private var nickName$field:String;
      
      public var lang:String;
      
      public var community:String;
      
      public function AuthSuccess()
      {
         super();
      }
      
      public function get uid() : String
      {
         return UID;
      }
      
      public function clearNickName() : void
      {
         this.nickName$field = null;
      }
      
      public function get hasNickName() : Boolean
      {
         return this.nickName$field != null;
      }
      
      public function set nickName(value:String) : void
      {
         this.nickName$field = value;
      }
      
      public function get nickName() : String
      {
         return this.nickName$field;
      }
      
      override final function writeToBuffer(output:WritingBuffer) : void
      {
         var fieldKey:* = undefined;
         if(this.hasNickName)
         {
            WriteUtils.writeTag(output,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write_TYPE_STRING(output,this.nickName$field);
         }
         WriteUtils.writeTag(output,WireType.LENGTH_DELIMITED,2);
         WriteUtils.write_TYPE_STRING(output,this.lang);
         WriteUtils.writeTag(output,WireType.LENGTH_DELIMITED,3);
         WriteUtils.write_TYPE_STRING(output,this.community);
         for(fieldKey in this)
         {
            super.writeUnknown(output,fieldKey);
         }
      }
      
      override final function readFromSlice(input:IDataInput, bytesAfterSlice:uint) : void
      {
         var tag:uint = 0;
         var nickName$count:uint = 0;
         var lang$count:uint = 0;
         var community$count:uint = 0;
         while(input.bytesAvailable > bytesAfterSlice)
         {
            tag = ReadUtils.read_TYPE_UINT32(input);
            switch(tag >> 3)
            {
               case 1:
                  if(nickName$count != 0)
                  {
                     throw new IOError("Bad data format: AuthSuccess.nickName cannot be set twice.");
                  }
                  nickName$count++;
                  this.nickName = ReadUtils.read_TYPE_STRING(input);
                  continue;
               case 2:
                  if(lang$count != 0)
                  {
                     throw new IOError("Bad data format: AuthSuccess.lang cannot be set twice.");
                  }
                  lang$count++;
                  this.lang = ReadUtils.read_TYPE_STRING(input);
                  continue;
               case 3:
                  if(community$count != 0)
                  {
                     throw new IOError("Bad data format: AuthSuccess.community cannot be set twice.");
                  }
                  community$count++;
                  this.community = ReadUtils.read_TYPE_STRING(input);
                  continue;
               default:
                  super.readUnknown(input,tag);
                  continue;
            }
         }
      }
   }
}
