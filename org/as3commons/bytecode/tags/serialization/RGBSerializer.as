package org.as3commons.bytecode.tags.serialization
{
   import flash.utils.ByteArray;
   import org.as3commons.bytecode.tags.struct.RGB;
   import org.as3commons.bytecode.util.SWFSpec;
   
   public class RGBSerializer extends AbstractStructSerializer
   {
       
      
      public function RGBSerializer()
      {
         super();
      }
      
      override public function read(input:ByteArray) : Object
      {
         SWFSpec.flushBits();
         var rgb:RGB = new RGB();
         this.readRGB(input,rgb);
         return rgb;
      }
      
      protected function readRGB(input:ByteArray, rgb:RGB) : void
      {
         rgb.red = input.readUnsignedByte();
         rgb.green = input.readUnsignedByte();
         rgb.blue = input.readUnsignedByte();
      }
      
      override public function write(output:ByteArray, struct:Object) : void
      {
         SWFSpec.flushBits();
         var rgb:RGB = struct as RGB;
         if(rgb != null)
         {
            output.writeByte(rgb.red);
            output.writeByte(rgb.green);
            output.writeByte(rgb.blue);
         }
      }
   }
}
