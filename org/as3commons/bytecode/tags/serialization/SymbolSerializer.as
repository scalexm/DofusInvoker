package org.as3commons.bytecode.tags.serialization
{
   import flash.utils.ByteArray;
   import org.as3commons.bytecode.tags.struct.Symbol;
   import org.as3commons.bytecode.util.SWFSpec;
   
   public class SymbolSerializer extends AbstractStructSerializer
   {
       
      
      public function SymbolSerializer()
      {
         super();
      }
      
      override public function read(input:ByteArray) : Object
      {
         var struct:Symbol = new Symbol();
         struct.tagId = SWFSpec.readUI16(input);
         struct.symbolClassName = SWFSpec.readString(input);
         return struct;
      }
      
      override public function write(output:ByteArray, struct:Object) : void
      {
         var symbol:Symbol = struct as Symbol;
         SWFSpec.writeUI16(output,symbol.tagId);
         SWFSpec.writeString(output,symbol.symbolClassName);
      }
   }
}
