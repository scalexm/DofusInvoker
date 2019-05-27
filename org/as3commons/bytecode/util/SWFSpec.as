package org.as3commons.bytecode.util
{
   import flash.geom.Rectangle;
   import flash.utils.ByteArray;
   
   public final class SWFSpec
   {
      
      private static var _bitbuff:uint;
      
      private static var _bitleft:uint;
      
      public static const FLOAT16_EXPONENT_BASE:uint = 15;
      
      private static const FIXED_DIVISION:uint = 65536;
      
      private static const FIXED8_DIVISION:uint = 256;
      
      private static const THIRTY_TWO:uint = 32;
      
      private static const HEX_ZERO:uint = 0;
      
      private static const SIXTEEN:uint = 16;
       
      
      public function SWFSpec()
      {
         super();
      }
      
      public static function flushBits() : void
      {
         _bitleft = 0;
         _bitbuff = 0;
      }
      
      public static function readBitRect(input:ByteArray) : Rectangle
      {
         var bits:uint = readUB(input,5);
         var r:Rectangle = new Rectangle();
         r.x = readSB(input,bits);
         r.width = readSB(input,bits);
         r.y = readSB(input,bits);
         r.height = readSB(input,bits);
         flushBits();
         return r;
      }
      
      public static function writeBitRect(output:ByteArray, rect:Rectangle) : void
      {
         var numBits:uint = getMinSBits(rect.x,rect.width,rect.y,rect.height);
         flushBits();
         writeUB(output,5,numBits);
         writeSB(output,numBits,rect.x);
         writeSB(output,numBits,rect.width);
         writeSB(output,numBits,rect.y);
         writeSB(output,numBits,rect.height);
      }
      
      public static function readSI8(input:ByteArray) : int
      {
         flushBits();
         return input.readByte();
      }
      
      public static function writeSI8(input:ByteArray, value:int) : void
      {
         flushBits();
         input.writeByte(value);
      }
      
      public static function readSI16(input:ByteArray) : int
      {
         flushBits();
         return input.readShort();
      }
      
      public static function writeSI16(input:ByteArray, value:int) : void
      {
         flushBits();
         input.writeShort(value);
      }
      
      public static function readSI32(input:ByteArray) : int
      {
         flushBits();
         return input.readInt();
      }
      
      public static function writeSI32(input:ByteArray, value:int) : void
      {
         flushBits();
         input.writeInt(value);
      }
      
      public static function readUI8(input:ByteArray) : uint
      {
         flushBits();
         return input.readUnsignedByte();
      }
      
      public static function writeUI8(input:ByteArray, value:uint) : void
      {
         flushBits();
         input.writeByte(value);
      }
      
      public static function readUI16(input:ByteArray) : uint
      {
         flushBits();
         return input.readUnsignedShort();
      }
      
      public static function writeUI16(input:ByteArray, value:uint) : void
      {
         flushBits();
         input.writeShort(value);
      }
      
      public static function readUI24(input:ByteArray) : uint
      {
         flushBits();
         var loWord:uint = input.readUnsignedShort();
         var hiByte:uint = input.readUnsignedByte();
         return hiByte << SIXTEEN | loWord;
      }
      
      public static function writeUI24(input:ByteArray, value:uint) : void
      {
         flushBits();
         input.writeShort(value & 65535);
         input.writeByte(value >> SIXTEEN);
      }
      
      public static function readUI32(input:ByteArray) : uint
      {
         flushBits();
         return input.readUnsignedInt();
      }
      
      public static function writeUI32(input:ByteArray, value:uint) : void
      {
         flushBits();
         input.writeUnsignedInt(value);
      }
      
      public static function readFIXED(input:ByteArray) : Number
      {
         flushBits();
         return input.readInt() / FIXED_DIVISION;
      }
      
      public static function writeFIXED(input:ByteArray, value:Number) : void
      {
         flushBits();
         input.writeInt(int(value * FIXED_DIVISION));
      }
      
      public static function readFIXED8(input:ByteArray) : Number
      {
         flushBits();
         return input.readShort() / FIXED8_DIVISION;
      }
      
      public static function writeFIXED8(input:ByteArray, value:Number) : void
      {
         flushBits();
         input.writeShort(int(value * FIXED8_DIVISION));
      }
      
      public static function readFLOAT(input:ByteArray) : Number
      {
         flushBits();
         return input.readFloat();
      }
      
      public static function writeFLOAT(input:ByteArray, value:Number) : void
      {
         flushBits();
         input.writeFloat(value);
      }
      
      public static function readDOUBLE(input:ByteArray) : Number
      {
         flushBits();
         return input.readDouble();
      }
      
      public static function writeDOUBLE(input:ByteArray, value:Number) : void
      {
         flushBits();
         input.writeDouble(value);
      }
      
      public static function readBoolean(input:ByteArray) : Boolean
      {
         var ub:uint = readUB(input);
         return ub == 1;
      }
      
      public static function writeBoolean(input:ByteArray, value:Boolean) : void
      {
         writeUB(input,1,!!value?uint(1):uint(0));
      }
      
      public static function readUB(input:ByteArray, bits:uint = 1) : uint
      {
         var s:int = 0;
         if(bits == 0)
         {
            return 0;
         }
         if(_bitleft == 0)
         {
            _bitbuff = readUI8(input);
            _bitleft = 8;
         }
         var result:uint = 0;
         while(true)
         {
            s = bits - _bitleft;
            if(s > 0)
            {
               result = result | _bitbuff << s;
               bits = bits - _bitleft;
               _bitbuff = readUI8(input);
               _bitleft = 8;
               continue;
            }
            break;
         }
         result = result | _bitbuff >> -s;
         _bitleft = _bitleft - bits;
         _bitbuff = _bitbuff & 255 >> 8 - _bitleft;
         return result;
      }
      
      public static function writeUB(input:ByteArray, bits:uint, value:uint) : void
      {
         if(bits == 0)
         {
            return;
         }
         if(_bitleft == 0)
         {
            writeUI8(input,HEX_ZERO);
            _bitbuff = 0;
            _bitleft = 8;
         }
         while(bits > _bitleft)
         {
            input[input.position - 1] = (_bitbuff | value << THIRTY_TWO - bits >>> THIRTY_TWO - _bitleft) & 255;
            bits = bits - _bitleft;
            writeUI8(input,HEX_ZERO);
            _bitbuff = 0;
            _bitleft = 8;
         }
         input[input.position - 1] = (_bitbuff = _bitbuff | value << THIRTY_TWO - bits >>> THIRTY_TWO - _bitleft) & 255;
         _bitleft = _bitleft - bits;
      }
      
      public static function readSB(input:ByteArray, bits:uint) : int
      {
         var shift:uint = THIRTY_TWO - bits;
         return int(readUB(input,bits) << shift) >> shift;
      }
      
      public static function writeSB(input:ByteArray, bits:uint, value:int) : void
      {
         writeUB(input,bits,value | (value < 0?2147483648:0) >> THIRTY_TWO - bits);
      }
      
      public static function readFB(input:ByteArray, bits:uint) : Number
      {
         return Number(readSB(input,bits)) / FIXED_DIVISION;
      }
      
      public static function writeFB(input:ByteArray, bits:uint, value:Number) : void
      {
         writeSB(input,bits,value * FIXED_DIVISION);
      }
      
      public static function readString(input:ByteArray) : String
      {
         var str:Array = [];
         var chr:uint = input.readUnsignedByte();
         while(chr > 0)
         {
            str[str.length] = String.fromCharCode(chr);
            chr = input.readUnsignedByte();
         }
         flushBits();
         return str.join("");
      }
      
      public static function skipString(input:ByteArray) : void
      {
         var chr:uint = input.readUnsignedByte();
         while(chr > 0)
         {
            chr = input.readUnsignedByte();
         }
         flushBits();
      }
      
      public static function writeString(input:ByteArray, value:String) : void
      {
         if(value && value.length > 0)
         {
            input.writeUTFBytes(value);
         }
         input.writeByte(0);
      }
      
      public static function getMinBits(a:uint, b:uint = 0, c:uint = 0, d:uint = 0) : uint
      {
         var val:uint = a | b | c | d;
         var bits:uint = 1;
         do
         {
            val = val >>> 1;
            bits++;
         }
         while(val != 0);
         
         return bits;
      }
      
      public static function getMinSBits(a:int, b:int = 0, c:int = 0, d:int = 0) : uint
      {
         return getMinBits(Math.abs(a),Math.abs(b),Math.abs(c),Math.abs(d));
      }
   }
}
