package org.as3commons.bytecode.swf
{
   import org.as3commons.bytecode.tags.EndTag;
   import org.as3commons.bytecode.tags.FileAttributesTag;
   import org.as3commons.bytecode.tags.FrameLabelTag;
   import org.as3commons.bytecode.tags.MetadataTag;
   import org.as3commons.bytecode.tags.ProductInfoTag;
   import org.as3commons.bytecode.tags.ScriptLimitsTag;
   import org.as3commons.bytecode.tags.SetBackgroundColorTag;
   import org.as3commons.bytecode.tags.ShowFrameTag;
   import org.as3commons.bytecode.tags.SymbolClassTag;
   import org.as3commons.bytecode.tags.serialization.EndTagSerializer;
   import org.as3commons.bytecode.tags.serialization.FileAttributesSerializer;
   import org.as3commons.bytecode.tags.serialization.FrameLabelSerializer;
   import org.as3commons.bytecode.tags.serialization.MetadataSerializer;
   import org.as3commons.bytecode.tags.serialization.ProductInfoSerializer;
   import org.as3commons.bytecode.tags.serialization.ScriptLimitsSerializer;
   import org.as3commons.bytecode.tags.serialization.SetBackgroundColorSerializer;
   import org.as3commons.bytecode.tags.serialization.ShowFrameSerializer;
   import org.as3commons.bytecode.tags.serialization.SymbolClassSerializer;
   
   public class SWFFileIO extends SWFWeaverFileIO
   {
       
      
      public function SWFFileIO()
      {
         super();
      }
      
      override protected function initSWFWeaverFileIO() : void
      {
         super.initSWFWeaverFileIO();
         tagSerializers[EndTag.TAG_ID] = EndTagSerializer;
         tagSerializers[FileAttributesTag.TAG_ID] = FileAttributesSerializer;
         tagSerializers[FrameLabelTag.TAG_ID] = FrameLabelSerializer;
         tagSerializers[MetadataTag.TAG_ID] = MetadataSerializer;
         tagSerializers[ProductInfoTag.TAG_ID] = ProductInfoSerializer;
         tagSerializers[ScriptLimitsTag.TAG_ID] = ScriptLimitsSerializer;
         tagSerializers[SetBackgroundColorTag.TAG_ID] = SetBackgroundColorSerializer;
         tagSerializers[ShowFrameTag.TAG_ID] = ShowFrameSerializer;
         tagSerializers[SymbolClassTag.TAG_ID] = SymbolClassSerializer;
      }
   }
}
