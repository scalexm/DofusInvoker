package org.as3commons.bytecode.tags.serialization
{
   import flash.utils.ByteArray;
   import org.as3commons.bytecode.io.AbcDeserializer;
   import org.as3commons.bytecode.io.AbcSerializer;
   import org.as3commons.bytecode.tags.DoABCTag;
   import org.as3commons.bytecode.tags.ISWFTag;
   import org.as3commons.bytecode.tags.struct.RecordHeader;
   import org.as3commons.bytecode.util.SWFSpec;
   
   public class DoABCSerializer extends AbstractTagSerializer
   {
       
      
      private var _deserializer:AbcDeserializer;
      
      private var _serializer:AbcSerializer;
      
      public function DoABCSerializer(serializerFactory:IStructSerializerFactory)
      {
         super(serializerFactory);
      }
      
      public function set deserializer(value:AbcDeserializer) : void
      {
         this._deserializer = value;
      }
      
      public function set serializer(value:AbcSerializer) : void
      {
         this._serializer = value;
      }
      
      public function get deserializer() : AbcDeserializer
      {
         if(this._deserializer == null)
         {
            this._deserializer = new AbcDeserializer();
         }
         return this._deserializer;
      }
      
      public function get serializer() : AbcSerializer
      {
         if(this._serializer == null)
         {
            this._serializer = new AbcSerializer();
         }
         return this._serializer;
      }
      
      override public function read(input:ByteArray, recordHeader:RecordHeader) : ISWFTag
      {
         var tag:DoABCTag = new DoABCTag();
         tag.flags = SWFSpec.readUI32(input);
         tag.byteCodeName = SWFSpec.readString(input);
         trace("Starting deserialization for ABC Tag " + tag.byteCodeName);
         this.deserializer.byteStream = input;
         tag.abcFile = this.deserializer.deserialize(input.position);
         return tag;
      }
      
      override public function write(output:ByteArray, tag:ISWFTag) : void
      {
         var abcTag:DoABCTag = DoABCTag(tag);
         this.writeTagHeader(output,abcTag);
         var serializedTag:ByteArray = this.serializer.serializeAbcFile(abcTag.abcFile);
         serializedTag.position = 0;
         output.writeBytes(serializedTag);
      }
      
      public function writeTagHeader(output:ByteArray, abcTag:DoABCTag) : void
      {
         SWFSpec.writeUI32(output,abcTag.flags);
         SWFSpec.writeString(output,abcTag.byteCodeName);
      }
   }
}
