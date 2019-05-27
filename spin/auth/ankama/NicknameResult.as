package spin.auth.ankama
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.ReadUtils;
   import com.netease.protobuf.WireType;
   import com.netease.protobuf.WriteUtils;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor_TYPE_BOOL;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor_TYPE_STRING;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor_TYPE_STRING;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final dynamic class NicknameResult extends Message
   {
      
      public static const UID:String = "E553D4D2-663C-43EC-959D-ECD91E311B9B";
      
      public static const SUCCESS:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("spin.auth.ankama.NicknameResult.success","success",1 << 3 | WireType.VARINT);
      
      public static const SUGGESTS:RepeatedFieldDescriptor_TYPE_STRING = new RepeatedFieldDescriptor_TYPE_STRING("spin.auth.ankama.NicknameResult.suggests","suggests",2 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const KEY:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("spin.auth.ankama.NicknameResult.key","key",3 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const TEXT:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("spin.auth.ankama.NicknameResult.text","text",4 << 3 | WireType.LENGTH_DELIMITED);
       
      
      public var success:Boolean;
      
      public var suggests:Array;
      
      private var key$field:String;
      
      private var text$field:String;
      
      public function NicknameResult()
      {
         this.suggests = [];
         super();
      }
      
      public function get uid() : String
      {
         return UID;
      }
      
      public function clearKey() : void
      {
         this.key$field = null;
      }
      
      public function get hasKey() : Boolean
      {
         return this.key$field != null;
      }
      
      public function set key(value:String) : void
      {
         this.key$field = value;
      }
      
      public function get key() : String
      {
         return this.key$field;
      }
      
      public function clearText() : void
      {
         this.text$field = null;
      }
      
      public function get hasText() : Boolean
      {
         return this.text$field != null;
      }
      
      public function set text(value:String) : void
      {
         this.text$field = value;
      }
      
      public function get text() : String
      {
         return this.text$field;
      }
      
      override final function writeToBuffer(output:WritingBuffer) : void
      {
         var fieldKey:* = undefined;
         WriteUtils.writeTag(output,WireType.VARINT,1);
         WriteUtils.write_TYPE_BOOL(output,this.success);
         for(var suggests$index:uint = 0; suggests$index < this.suggests.length; suggests$index++)
         {
            WriteUtils.writeTag(output,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write_TYPE_STRING(output,this.suggests[suggests$index]);
         }
         if(this.hasKey)
         {
            WriteUtils.writeTag(output,WireType.LENGTH_DELIMITED,3);
            WriteUtils.write_TYPE_STRING(output,this.key$field);
         }
         if(this.hasText)
         {
            WriteUtils.writeTag(output,WireType.LENGTH_DELIMITED,4);
            WriteUtils.write_TYPE_STRING(output,this.text$field);
         }
         for(fieldKey in this)
         {
            super.writeUnknown(output,fieldKey);
         }
      }
      
      override final function readFromSlice(input:IDataInput, bytesAfterSlice:uint) : void
      {
         var tag:uint = 0;
         var success$count:uint = 0;
         var key$count:uint = 0;
         var text$count:uint = 0;
         while(input.bytesAvailable > bytesAfterSlice)
         {
            tag = ReadUtils.read_TYPE_UINT32(input);
            switch(tag >> 3)
            {
               case 1:
                  if(success$count != 0)
                  {
                     throw new IOError("Bad data format: NicknameResult.success cannot be set twice.");
                  }
                  success$count++;
                  this.success = ReadUtils.read_TYPE_BOOL(input);
                  continue;
               case 2:
                  this.suggests.push(ReadUtils.read_TYPE_STRING(input));
                  continue;
               case 3:
                  if(key$count != 0)
                  {
                     throw new IOError("Bad data format: NicknameResult.key cannot be set twice.");
                  }
                  key$count++;
                  this.key = ReadUtils.read_TYPE_STRING(input);
                  continue;
               case 4:
                  if(text$count != 0)
                  {
                     throw new IOError("Bad data format: NicknameResult.text cannot be set twice.");
                  }
                  text$count++;
                  this.text = ReadUtils.read_TYPE_STRING(input);
                  continue;
               default:
                  super.readUnknown(input,tag);
                  continue;
            }
         }
      }
   }
}
