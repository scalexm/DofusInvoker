package org.as3commons.bytecode.tags.serialization
{
   import flash.utils.ByteArray;
   import org.as3commons.bytecode.tags.struct.RGBA;
   import org.as3commons.bytecode.util.SWFSpec;
   
   public class RGBASerializer extends RGBSerializer
   {
       
      
      public function RGBASerializer()
      {
         super();
      }
      
      override public function read(input:ByteArray) : Object
      {
         SWFSpec.flushBits();
         var rgba:RGBA = new RGBA();
         readRGB(input,rgba);
         rgba.alpha = input.readUnsignedByte();
         return rgba;
      }
      
      override public function write(output:ByteArray, struct:Object) : void
      {
         super.write(output,struct);
         var rgba:RGBA = struct as RGBA;
         if(rgba != null)
         {
            output.writeByte(rgba.alpha);
         }
      }
   }
}
