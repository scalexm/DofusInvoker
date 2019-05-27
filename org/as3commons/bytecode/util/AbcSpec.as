package org.as3commons.bytecode.util
{
   import flash.utils.ByteArray;
   import flash.utils.Endian;
   import org.as3commons.lang.StringUtils;
   
   public final class AbcSpec
   {
      
      public static const U30:ReadWritePair = new ReadWritePair(readU30,writeU30);
      
      public static const U8:ReadWritePair = new ReadWritePair(readU8,writeU8);
      
      public static const S24:ReadWritePair = new ReadWritePair(readS24,writeS24);
      
      public static const S32:ReadWritePair = new ReadWritePair(readS32,writeS32);
      
      public static const S24_ARRAY:ReadWritePair = new ReadWritePair(readS24,writeS24);
      
      public static const UNSIGNED_BYTE:ReadWritePair = new ReadWritePair(readUnsigned,writeU8);
      
      private static const __VALUE_OUT_OF_RANGE_ERROR:String = "Value out of range, expected {0}, but got {1}";
      
      public static const TWOHUNDRED_FIFTYFIVE:uint = 255;
      
      public static const EIGHT:uint = 8;
      
      public static const SIXTEEN:uint = 16;
      
      public static const MAX_U8:uint = 256;
      
      public static const MAX_U16:uint = 65536;
      
      public static const MAX_U30:uint = 1073741824;
      
      public static const SEVEN:Number = 7;
      
      private static const FOURTEEN:Number = 14;
      
      private static const TWENTY_ONE:Number = 21;
      
      private static const TWENTY_EIGHT:Number = 28;
      
      private static const MAX_S24:Number = 8388607;
      
      private static var _illegalCount:int = 0;
       
      
      public function AbcSpec()
      {
         super();
      }
      
      public static function readUnsigned(bytes:ByteArray) : uint
      {
         return bytes.readUnsignedByte();
      }
      
      public static function newByteArray() : ByteArray
      {
         var byteArray:ByteArray = new ByteArray();
         byteArray.endian = Endian.LITTLE_ENDIAN;
         return byteArray;
      }
      
      public static function readU8(bytes:ByteArray) : uint
      {
         var value:uint = TWOHUNDRED_FIFTYFIVE & bytes[bytes.position++];
         return value;
      }
      
      public static function skipU8(bytes:ByteArray) : void
      {
         bytes.position++;
      }
      
      public static function readU16(bytes:ByteArray) : uint
      {
         var value:uint = readU8(bytes) | readU8(bytes) << EIGHT;
         return value;
      }
      
      public static function skipU16(bytes:ByteArray) : void
      {
         bytes.position = bytes.position + 2;
      }
      
      public static function readS24(bytes:ByteArray) : int
      {
         var value:* = int(bytes.readUnsignedByte());
         value = value | (bytes.readUnsignedByte() << EIGHT | bytes.readByte() << SIXTEEN);
         return value;
      }
      
      public static function skipS24(bytes:ByteArray) : void
      {
         bytes.readUnsignedByte();
         bytes.readUnsignedByte();
         bytes.readByte();
      }
      
      public static function readS32(bytes:ByteArray) : int
      {
         return readU32(bytes);
      }
      
      public static function skipS32(bytes:ByteArray) : void
      {
         skipU32(bytes);
      }
      
      public static function readU30(bytes:ByteArray) : uint
      {
         var value:uint = readU32(bytes) & 1073741823;
         return value;
      }
      
      public static function skipU30(bytes:ByteArray) : void
      {
         skipU32(bytes);
      }
      
      public static function readStringInfo(bytes:ByteArray) : String
      {
         var len:uint = readU32(bytes);
         var result:String = bytes.readUTFBytes(len);
         if(len != result.length)
         {
            result = "UTF8_BAD" + (_illegalCount++).toString();
         }
         return result;
      }
      
      public static function skipStringInfo(bytes:ByteArray) : void
      {
         bytes.position = bytes.position + readU32(bytes);
      }
      
      public static function readD64(bytes:ByteArray) : Number
      {
         return bytes.readDouble();
      }
      
      public static function skipD64(bytes:ByteArray) : void
      {
         bytes.readDouble();
      }
      
      public static function readU32(byteArray:ByteArray) : uint
      {
         var result:* = int(byteArray.readUnsignedByte());
         if(!(result & 128))
         {
            return result;
         }
         var nextByte:* = byteArray.readUnsignedByte() << SEVEN;
         result = result & 127 | nextByte;
         if(!(result & 16384))
         {
            return result;
         }
         nextByte = byteArray.readUnsignedByte() << FOURTEEN;
         result = result & 16383 | nextByte;
         if(!(result & 2097152))
         {
            return result;
         }
         nextByte = byteArray.readUnsignedByte() << TWENTY_ONE;
         result = result & 2097151 | nextByte;
         if(!(result & 268435456))
         {
            return result;
         }
         nextByte = byteArray.readUnsignedByte() << TWENTY_EIGHT;
         return result & 268435455 | nextByte;
      }
      
      public static function skipU32(byteArray:ByteArray) : void
      {
         var result:* = int(byteArray.readUnsignedByte());
         if(!(result & 128))
         {
            return;
         }
         var nextByte:* = byteArray.readUnsignedByte() << SEVEN;
         result = result & 127 | nextByte;
         if(!(result & 16384))
         {
            return;
         }
         nextByte = byteArray.readUnsignedByte() << FOURTEEN;
         result = result & 16383 | nextByte;
         if(!(result & 2097152))
         {
            return;
         }
         nextByte = byteArray.readUnsignedByte() << TWENTY_ONE;
         result = result & 2097151 | nextByte;
         if(!(result & 268435456))
         {
            return;
         }
         byteArray.readUnsignedByte();
      }
      
      public static function writeU32(value:uint, byteArray:ByteArray) : void
      {
         if(value < 128 && value > -1)
         {
            byteArray.writeByte(value);
         }
         else if(value < 16384 && value > -1)
         {
            byteArray.writeByte(value & 127 | 128);
            byteArray.writeByte(value >> SEVEN & 127);
         }
         else if(value < 2097152 && value > -1)
         {
            byteArray.writeByte(value & 127 | 128);
            byteArray.writeByte(value >> SEVEN | 128);
            byteArray.writeByte(value >> FOURTEEN & 127);
         }
         else if(value < 268435456 && value > -1)
         {
            byteArray.writeByte(value & 127 | 128);
            byteArray.writeByte(value >> SEVEN | 128);
            byteArray.writeByte(value >> FOURTEEN | 128);
            byteArray.writeByte(value >> TWENTY_ONE & 127);
         }
         else
         {
            byteArray.writeByte(value & 127 | 128);
            byteArray.writeByte(value >> SEVEN | 128);
            byteArray.writeByte(value >> FOURTEEN | 128);
            byteArray.writeByte(value >> TWENTY_ONE | 128);
            byteArray.writeByte(value >> TWENTY_EIGHT & 15);
         }
      }
      
      public static function writeU8(value:uint, byteArray:ByteArray) : void
      {
         byteArray.writeByte(value);
      }
      
      public static function writeU16(value:uint, byteArray:ByteArray) : void
      {
         byteArray.writeByte(value & 255);
         byteArray.writeByte(value >> EIGHT & 255);
      }
      
      public static function writeS24(value:int, byteArray:ByteArray) : void
      {
         var i:* = value & 255;
         byteArray.writeByte(i);
         i = value >> EIGHT & 255;
         byteArray.writeByte(i);
         i = value >> SIXTEEN & 255;
         byteArray.writeByte(i);
      }
      
      public static function writeU30(value:uint, byteArray:ByteArray) : void
      {
         writeU32(value,byteArray);
      }
      
      public static function writeS32(value:int, byteArray:ByteArray) : void
      {
         writeU32(uint(value),byteArray);
      }
      
      public static function writeD64(value:Number, byteArray:ByteArray) : void
      {
         byteArray.writeDouble(value);
      }
      
      public static function writeUTFBytes(string:String, byteArray:ByteArray) : void
      {
         byteArray.writeUTFBytes(string);
      }
      
      public static function writeStringInfo(string:String, byteArray:ByteArray) : void
      {
         var tmpArray:ByteArray = null;
         if(string.length > 0)
         {
            tmpArray = new ByteArray();
            tmpArray.endian = Endian.BIG_ENDIAN;
            tmpArray.writeUTFBytes(string);
            tmpArray.position = 0;
            writeU30(tmpArray.length,byteArray);
            byteArray.writeBytes(tmpArray);
         }
         else
         {
            writeU30(0,byteArray);
         }
      }
      
      public static function assertWithinRange(assertion:Boolean, expected:Number, gotten:Number) : void
      {
         if(!assertion)
         {
            throw new Error(StringUtils.substitute(__VALUE_OUT_OF_RANGE_ERROR,expected,gotten));
         }
      }
   }
}
