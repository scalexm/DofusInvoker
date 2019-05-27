package spin.proxy
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.ReadUtils;
   import com.netease.protobuf.WireType;
   import com.netease.protobuf.WriteUtils;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor_TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   import spin.proxy.VersionsUsed.Version;
   
   public final dynamic class VersionsUsed extends Message
   {
      
      public static const UID:String = "0E5F70E6-FE21-4025-88A8-578CE55F69E9";
      
      public static const SPIN:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("spin.proxy.VersionsUsed.spin","spin",1 << 3 | WireType.LENGTH_DELIMITED,function():Class
      {
         return Version;
      });
      
      public static const APP:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("spin.proxy.VersionsUsed.app","app",2 << 3 | WireType.LENGTH_DELIMITED,function():Class
      {
         return Version;
      });
       
      
      public var spin:Version;
      
      private var app$field:Version;
      
      public function VersionsUsed()
      {
         super();
      }
      
      public function get uid() : String
      {
         return UID;
      }
      
      public function clearApp() : void
      {
         this.app$field = null;
      }
      
      public function get hasApp() : Boolean
      {
         return this.app$field != null;
      }
      
      public function set app(value:Version) : void
      {
         this.app$field = value;
      }
      
      public function get app() : Version
      {
         return this.app$field;
      }
      
      override final function writeToBuffer(output:WritingBuffer) : void
      {
         var fieldKey:* = undefined;
         WriteUtils.writeTag(output,WireType.LENGTH_DELIMITED,1);
         WriteUtils.write_TYPE_MESSAGE(output,this.spin);
         if(this.hasApp)
         {
            WriteUtils.writeTag(output,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write_TYPE_MESSAGE(output,this.app$field);
         }
         for(fieldKey in this)
         {
            super.writeUnknown(output,fieldKey);
         }
      }
      
      override final function readFromSlice(input:IDataInput, bytesAfterSlice:uint) : void
      {
         var tag:uint = 0;
         var spin$count:uint = 0;
         var app$count:uint = 0;
         while(input.bytesAvailable > bytesAfterSlice)
         {
            tag = ReadUtils.read_TYPE_UINT32(input);
            switch(tag >> 3)
            {
               case 1:
                  if(spin$count != 0)
                  {
                     throw new IOError("Bad data format: VersionsUsed.spin cannot be set twice.");
                  }
                  spin$count++;
                  this.spin = new Version();
                  ReadUtils.read_TYPE_MESSAGE(input,this.spin);
                  continue;
               case 2:
                  if(app$count != 0)
                  {
                     throw new IOError("Bad data format: VersionsUsed.app cannot be set twice.");
                  }
                  app$count++;
                  this.app = new Version();
                  ReadUtils.read_TYPE_MESSAGE(input,this.app);
                  continue;
               default:
                  super.readUnknown(input,tag);
                  continue;
            }
         }
      }
   }
}
