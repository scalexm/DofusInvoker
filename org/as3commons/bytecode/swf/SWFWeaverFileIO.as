package org.as3commons.bytecode.swf
{
   import flash.events.EventDispatcher;
   import flash.utils.ByteArray;
   import flash.utils.Dictionary;
   import flash.utils.Endian;
   import org.as3commons.bytecode.swf.event.SWFFileIOEvent;
   import org.as3commons.bytecode.tags.DoABCTag;
   import org.as3commons.bytecode.tags.ISWFTag;
   import org.as3commons.bytecode.tags.serialization.DoABCSerializer;
   import org.as3commons.bytecode.tags.serialization.ITagSerializer;
   import org.as3commons.bytecode.tags.serialization.RecordHeaderSerializer;
   import org.as3commons.bytecode.tags.serialization.StructSerializerFactory;
   import org.as3commons.bytecode.tags.serialization.UnsupportedSerializer;
   import org.as3commons.bytecode.tags.struct.RecordHeader;
   import org.as3commons.bytecode.util.AbcSpec;
   import org.as3commons.bytecode.util.SWFSpec;
   
   [Event(name="tagSerializerCreated",type="org.as3commons.bytecode.swf.event.SWFFileIOEvent")]
   public class SWFWeaverFileIO extends EventDispatcher implements ISWFFileIO
   {
      
      public static const SWF_SIGNATURE_COMPRESSED:String = "CWS";
      
      public static const SWF_SIGNATURE_UNCOMPRESSED:String = "FWS";
       
      
      private var _tagSerializers:Dictionary;
      
      private var _serializerInstances:Dictionary;
      
      protected var unsupportedTagSerializer:UnsupportedSerializer;
      
      protected var recordHeaderSerializer:RecordHeaderSerializer;
      
      protected var structSerializerFactory:StructSerializerFactory;
      
      public function SWFWeaverFileIO()
      {
         super();
         this.initSWFWeaverFileIO();
      }
      
      public function get serializerInstances() : Dictionary
      {
         return this._serializerInstances;
      }
      
      public function get tagSerializers() : Dictionary
      {
         return this._tagSerializers;
      }
      
      protected function initSWFWeaverFileIO() : void
      {
         this.unsupportedTagSerializer = new UnsupportedSerializer();
         this.recordHeaderSerializer = new RecordHeaderSerializer();
         this.structSerializerFactory = new StructSerializerFactory();
         this._tagSerializers = new Dictionary();
         this._serializerInstances = new Dictionary();
         this.tagSerializers[DoABCTag.TAG_ID] = DoABCSerializer;
      }
      
      public function createTagSerializer(tagId:uint) : ITagSerializer
      {
         var evt:SWFFileIOEvent = null;
         var serializer:ITagSerializer = this.serializerInstances[tagId];
         if(serializer == null)
         {
            if(this.tagSerializers[tagId] != null)
            {
               serializer = new this.tagSerializers[tagId](this.structSerializerFactory);
               evt = new SWFFileIOEvent(SWFFileIOEvent.TAG_SERIALIZER_CREATED,serializer);
               dispatchEvent(evt);
               serializer = evt.tagSerializer;
               this.serializerInstances[tagId] = serializer;
            }
            else
            {
               serializer = this.unsupportedTagSerializer;
            }
         }
         return serializer;
      }
      
      public function read(input:ByteArray) : SWFFile
      {
         var bytes:ByteArray = null;
         var compressed:Boolean = false;
         var tag:ISWFTag = null;
         var originalPosition:uint = input.position;
         var swfFile:SWFFile = new SWFFile();
         try
         {
            input.position = 0;
            bytes = AbcSpec.newByteArray();
            input.endian = bytes.endian;
            swfFile.signature = input.readUTFBytes(3);
            compressed = swfFile.signature == SWF_SIGNATURE_COMPRESSED;
            swfFile.version = SWFSpec.readSI8(input);
            swfFile.fileLength = SWFSpec.readUI32(input);
            input.readBytes(bytes);
            bytes.position = 0;
            if(compressed)
            {
               bytes.uncompress();
               bytes.position = 0;
            }
            this.readHeader(bytes,swfFile);
            while(bytes.bytesAvailable)
            {
               tag = this.readTag(bytes);
               if(tag != null)
               {
                  swfFile.addTag(tag);
               }
            }
         }
         finally
         {
            input.position = originalPosition;
         }
         return swfFile;
      }
      
      public function write(output:ByteArray, swf:SWFFile) : void
      {
         var tag:ISWFTag = null;
         var fileLength:int = 0;
         output.endian = Endian.LITTLE_ENDIAN;
         output.position = 0;
         output.writeUTFBytes(swf.signature);
         SWFSpec.writeSI8(output,swf.version);
         var ba:ByteArray = AbcSpec.newByteArray();
         this.writeHeader(ba,swf);
         for each(tag in swf.tags)
         {
            this.writeTag(ba,tag);
         }
         fileLength = ba.length;
         if(swf.signature == SWF_SIGNATURE_COMPRESSED)
         {
            ba.position = 0;
            ba.compress();
         }
         ba.position = 0;
         SWFSpec.writeUI32(output,fileLength);
         output.writeBytes(ba);
      }
      
      protected function readTag(input:ByteArray) : ISWFTag
      {
         var recordHeader:RecordHeader = this.recordHeaderSerializer.read(input) as RecordHeader;
         var serializer:ITagSerializer = this.createTagSerializer(recordHeader.id);
         if(serializer != null)
         {
            return serializer.read(input,recordHeader);
         }
         input.position = input.position + recordHeader.length;
         return null;
      }
      
      protected function writeTag(output:ByteArray, tag:ISWFTag) : void
      {
         var serializer:ITagSerializer = this.createTagSerializer(tag.id);
         var ba:ByteArray = new ByteArray();
         ba.endian = Endian.LITTLE_ENDIAN;
         serializer.write(ba,tag);
         ba.position = 0;
         var recordHeader:RecordHeader = new RecordHeader(tag.id,ba.length,ba.length > RecordHeaderSerializer.LONG_TAG);
         this.recordHeaderSerializer.write(output,recordHeader);
         output.writeBytes(ba);
         ba = null;
      }
      
      protected function readHeader(input:ByteArray, swf:SWFFile) : void
      {
         swf.frameSize = SWFSpec.readBitRect(input);
         swf.frameRate = SWFSpec.readUI16(input);
         swf.frameCount = SWFSpec.readUI16(input);
      }
      
      protected function writeHeader(output:ByteArray, swf:SWFFile) : void
      {
         SWFSpec.writeBitRect(output,swf.frameSize);
         SWFSpec.writeUI16(output,swf.frameRate);
         SWFSpec.writeUI16(output,swf.frameCount);
      }
   }
}
