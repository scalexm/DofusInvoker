package spin.proxy.VersionsUsed
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.ReadUtils;
   import com.netease.protobuf.WireType;
   import com.netease.protobuf.WriteUtils;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor_TYPE_STRING;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor_TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final dynamic class Version extends Message
   {
      
      public static const MAJOR:FieldDescriptor_TYPE_UINT32 = new FieldDescriptor_TYPE_UINT32("spin.proxy.VersionsUsed.Version.major","major",1 << 3 | WireType.VARINT);
      
      public static const MINOR:FieldDescriptor_TYPE_UINT32 = new FieldDescriptor_TYPE_UINT32("spin.proxy.VersionsUsed.Version.minor","minor",2 << 3 | WireType.VARINT);
      
      public static const PATCH:FieldDescriptor_TYPE_UINT32 = new FieldDescriptor_TYPE_UINT32("spin.proxy.VersionsUsed.Version.patch","patch",3 << 3 | WireType.VARINT);
      
      public static const BUILD:FieldDescriptor_TYPE_UINT32 = new FieldDescriptor_TYPE_UINT32("spin.proxy.VersionsUsed.Version.build","build",4 << 3 | WireType.VARINT);
      
      public static const QUALIFIER:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("spin.proxy.VersionsUsed.Version.qualifier","qualifier",5 << 3 | WireType.LENGTH_DELIMITED);
       
      
      public var major:uint;
      
      private var minor$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var patch$field:uint;
      
      private var build$field:uint;
      
      private var qualifier$field:String;
      
      public function Version()
      {
         super();
      }
      
      public function clearMinor() : void
      {
         this.hasField$0 = this.hasField$0 & 4294967294;
         this.minor$field = new uint();
      }
      
      public function get hasMinor() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set minor(value:uint) : void
      {
         this.hasField$0 = this.hasField$0 | 1;
         this.minor$field = value;
      }
      
      public function get minor() : uint
      {
         return this.minor$field;
      }
      
      public function clearPatch() : void
      {
         this.hasField$0 = this.hasField$0 & 4294967293;
         this.patch$field = new uint();
      }
      
      public function get hasPatch() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set patch(value:uint) : void
      {
         this.hasField$0 = this.hasField$0 | 2;
         this.patch$field = value;
      }
      
      public function get patch() : uint
      {
         return this.patch$field;
      }
      
      public function clearBuild() : void
      {
         this.hasField$0 = this.hasField$0 & 4294967291;
         this.build$field = new uint();
      }
      
      public function get hasBuild() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set build(value:uint) : void
      {
         this.hasField$0 = this.hasField$0 | 4;
         this.build$field = value;
      }
      
      public function get build() : uint
      {
         return this.build$field;
      }
      
      public function clearQualifier() : void
      {
         this.qualifier$field = null;
      }
      
      public function get hasQualifier() : Boolean
      {
         return this.qualifier$field != null;
      }
      
      public function set qualifier(value:String) : void
      {
         this.qualifier$field = value;
      }
      
      public function get qualifier() : String
      {
         return this.qualifier$field;
      }
      
      override final function writeToBuffer(output:WritingBuffer) : void
      {
         var fieldKey:* = undefined;
         WriteUtils.writeTag(output,WireType.VARINT,1);
         WriteUtils.write_TYPE_UINT32(output,this.major);
         if(this.hasMinor)
         {
            WriteUtils.writeTag(output,WireType.VARINT,2);
            WriteUtils.write_TYPE_UINT32(output,this.minor$field);
         }
         if(this.hasPatch)
         {
            WriteUtils.writeTag(output,WireType.VARINT,3);
            WriteUtils.write_TYPE_UINT32(output,this.patch$field);
         }
         if(this.hasBuild)
         {
            WriteUtils.writeTag(output,WireType.VARINT,4);
            WriteUtils.write_TYPE_UINT32(output,this.build$field);
         }
         if(this.hasQualifier)
         {
            WriteUtils.writeTag(output,WireType.LENGTH_DELIMITED,5);
            WriteUtils.write_TYPE_STRING(output,this.qualifier$field);
         }
         for(fieldKey in this)
         {
            super.writeUnknown(output,fieldKey);
         }
      }
      
      override final function readFromSlice(input:IDataInput, bytesAfterSlice:uint) : void
      {
         var tag:uint = 0;
         var major$count:uint = 0;
         var minor$count:uint = 0;
         var patch$count:uint = 0;
         var build$count:uint = 0;
         var qualifier$count:uint = 0;
         while(input.bytesAvailable > bytesAfterSlice)
         {
            tag = ReadUtils.read_TYPE_UINT32(input);
            switch(tag >> 3)
            {
               case 1:
                  if(major$count != 0)
                  {
                     throw new IOError("Bad data format: Version.major cannot be set twice.");
                  }
                  major$count++;
                  this.major = ReadUtils.read_TYPE_UINT32(input);
                  continue;
               case 2:
                  if(minor$count != 0)
                  {
                     throw new IOError("Bad data format: Version.minor cannot be set twice.");
                  }
                  minor$count++;
                  this.minor = ReadUtils.read_TYPE_UINT32(input);
                  continue;
               case 3:
                  if(patch$count != 0)
                  {
                     throw new IOError("Bad data format: Version.patch cannot be set twice.");
                  }
                  patch$count++;
                  this.patch = ReadUtils.read_TYPE_UINT32(input);
                  continue;
               case 4:
                  if(build$count != 0)
                  {
                     throw new IOError("Bad data format: Version.build cannot be set twice.");
                  }
                  build$count++;
                  this.build = ReadUtils.read_TYPE_UINT32(input);
                  continue;
               case 5:
                  if(qualifier$count != 0)
                  {
                     throw new IOError("Bad data format: Version.qualifier cannot be set twice.");
                  }
                  qualifier$count++;
                  this.qualifier = ReadUtils.read_TYPE_STRING(input);
                  continue;
               default:
                  super.readUnknown(input,tag);
                  continue;
            }
         }
      }
   }
}
