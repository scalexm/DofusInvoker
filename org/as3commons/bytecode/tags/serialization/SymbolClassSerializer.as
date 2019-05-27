package org.as3commons.bytecode.tags.serialization
{
   import flash.utils.ByteArray;
   import org.as3commons.bytecode.tags.ISWFTag;
   import org.as3commons.bytecode.tags.SymbolClassTag;
   import org.as3commons.bytecode.tags.struct.RecordHeader;
   import org.as3commons.bytecode.tags.struct.Symbol;
   import org.as3commons.bytecode.util.SWFSpec;
   
   public class SymbolClassSerializer extends AbstractTagSerializer
   {
       
      
      public function SymbolClassSerializer(serializerFactory:IStructSerializerFactory)
      {
         super(serializerFactory);
      }
      
      override public function read(input:ByteArray, recordHeader:RecordHeader) : ISWFTag
      {
         var numSymbols:uint = SWFSpec.readUI16(input);
         var tag:SymbolClassTag = new SymbolClassTag();
         var serializer:IStructSerializer = structSerializerFactory.createSerializer(Symbol);
         for(var i:uint = 0; i < numSymbols; i++)
         {
            tag.symbols[tag.symbols.length] = serializer.read(input);
         }
         return tag;
      }
      
      override public function write(output:ByteArray, tag:ISWFTag) : void
      {
         var symbolTag:SymbolClassTag = tag as SymbolClassTag;
         var serializer:IStructSerializer = structSerializerFactory.createSerializer(Symbol);
         var len:uint = symbolTag.symbols.length;
         SWFSpec.writeUI16(output,len);
         for(var i:uint = 0; i < len; i++)
         {
            serializer.write(output,symbolTag.symbols[i]);
         }
      }
   }
}
