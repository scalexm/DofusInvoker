package org.as3commons.bytecode.tags.serialization
{
   import flash.utils.ByteArray;
   import org.as3commons.bytecode.tags.ISWFTag;
   import org.as3commons.bytecode.tags.ProductInfoTag;
   import org.as3commons.bytecode.tags.struct.RecordHeader;
   import org.as3commons.bytecode.util.SWFSpec;
   
   public class ProductInfoSerializer extends AbstractTagSerializer
   {
       
      
      public function ProductInfoSerializer(serializerFactory:IStructSerializerFactory)
      {
         super(serializerFactory);
      }
      
      override public function read(input:ByteArray, recordHeader:RecordHeader) : ISWFTag
      {
         var tag:ProductInfoTag = new ProductInfoTag();
         tag.productId = SWFSpec.readUI32(input);
         tag.edition = SWFSpec.readUI32(input);
         tag.majorVersion = SWFSpec.readUI8(input);
         tag.minorVersion = SWFSpec.readUI8(input);
         tag.minorBuild = SWFSpec.readUI32(input);
         tag.majorBuild = SWFSpec.readUI32(input);
         tag.compileDatePart1 = SWFSpec.readUI32(input);
         tag.compileDatePart2 = SWFSpec.readUI32(input);
         return tag;
      }
      
      override public function write(output:ByteArray, tag:ISWFTag) : void
      {
         var productInfo:ProductInfoTag = tag as ProductInfoTag;
         SWFSpec.writeUI32(output,productInfo.productId);
         SWFSpec.writeUI32(output,productInfo.edition);
         SWFSpec.writeUI8(output,productInfo.majorVersion);
         SWFSpec.writeUI8(output,productInfo.minorVersion);
         SWFSpec.writeUI32(output,productInfo.minorBuild);
         SWFSpec.writeUI32(output,productInfo.majorBuild);
         SWFSpec.writeUI32(output,productInfo.compileDatePart1);
         SWFSpec.writeUI32(output,productInfo.compileDatePart2);
      }
   }
}
