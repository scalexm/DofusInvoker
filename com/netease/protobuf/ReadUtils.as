package com.netease.protobuf
{
   import flash.errors.IOError;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   
   public final class ReadUtils
   {
       
      
      public function ReadUtils()
      {
         super();
      }
      
      public static function skip(input:IDataInput, wireType:uint) : void
      {
         var i:uint = 0;
         switch(wireType)
         {
            case WireType.VARINT:
               while(input.readUnsignedByte() >= 128)
               {
               }
               break;
            case WireType.FIXED_64_BIT:
               input.readInt();
               input.readInt();
               break;
            case WireType.LENGTH_DELIMITED:
               for(i = read_TYPE_UINT32(input); i != 0; i--)
               {
                  input.readByte();
               }
               break;
            case WireType.FIXED_32_BIT:
               input.readInt();
               break;
            default:
               throw new IOError("Invalid wire type: " + wireType);
         }
      }
      
      public static function read_TYPE_DOUBLE(input:IDataInput) : Number
      {
         return input.readDouble();
      }
      
      public static function read_TYPE_FLOAT(input:IDataInput) : Number
      {
         return input.readFloat();
      }
      
      public static function read_TYPE_INT64(input:IDataInput) : Int64
      {
         var b:uint = 0;
         var result:Int64 = new Int64();
         var i:uint = 0;
         while(true)
         {
            b = input.readUnsignedByte();
            if(i == 28)
            {
               break;
            }
            if(b >= 128)
            {
               result.low = result.low | (b & 127) << i;
               i = i + 7;
               continue;
            }
            result.low = result.low | b << i;
            return result;
         }
         if(b >= 128)
         {
            b = b & 127;
            result.low = result.low | b << i;
            result.high = b >>> 4;
            i = 3;
            while(true)
            {
               b = input.readUnsignedByte();
               if(i < 32)
               {
                  if(b >= 128)
                  {
                     result.high = result.high | (b & 127) << i;
                  }
                  else
                  {
                     break;
                  }
               }
               i = i + 7;
            }
            result.high = result.high | b << i;
            return result;
         }
         result.low = result.low | b << i;
         result.high = b >>> 4;
         return result;
      }
      
      public static function read_TYPE_UINT64(input:IDataInput) : UInt64
      {
         var b:uint = 0;
         var result:UInt64 = new UInt64();
         var i:uint = 0;
         while(true)
         {
            b = input.readUnsignedByte();
            if(i == 28)
            {
               break;
            }
            if(b >= 128)
            {
               result.low = result.low | (b & 127) << i;
               i = i + 7;
               continue;
            }
            result.low = result.low | b << i;
            return result;
         }
         if(b >= 128)
         {
            b = b & 127;
            result.low = result.low | b << i;
            result.high = b >>> 4;
            i = 3;
            while(true)
            {
               b = input.readUnsignedByte();
               if(i < 32)
               {
                  if(b >= 128)
                  {
                     result.high = result.high | (b & 127) << i;
                  }
                  else
                  {
                     break;
                  }
               }
               i = i + 7;
            }
            result.high = result.high | b << i;
            return result;
         }
         result.low = result.low | b << i;
         result.high = b >>> 4;
         return result;
      }
      
      public static function read_TYPE_INT32(input:IDataInput) : int
      {
         return int(read_TYPE_UINT32(input));
      }
      
      public static function read_TYPE_FIXED64(input:IDataInput) : UInt64
      {
         var result:UInt64 = new UInt64();
         result.low = input.readUnsignedInt();
         result.high = input.readUnsignedInt();
         return result;
      }
      
      public static function read_TYPE_FIXED32(input:IDataInput) : uint
      {
         return input.readUnsignedInt();
      }
      
      public static function read_TYPE_BOOL(input:IDataInput) : Boolean
      {
         return read_TYPE_UINT32(input) != 0;
      }
      
      public static function read_TYPE_STRING(input:IDataInput) : String
      {
         var length:uint = read_TYPE_UINT32(input);
         return input.readUTFBytes(length);
      }
      
      public static function read_TYPE_BYTES(input:IDataInput) : ByteArray
      {
         var result:ByteArray = new ByteArray();
         var length:uint = read_TYPE_UINT32(input);
         if(length > 0)
         {
            input.readBytes(result,0,length);
         }
         return result;
      }
      
      public static function read_TYPE_UINT32(input:IDataInput) : uint
      {
         var b:uint = 0;
         var result:uint = 0;
         var i:uint = 0;
         while(true)
         {
            b = input.readUnsignedByte();
            if(i < 32)
            {
               if(b >= 128)
               {
                  result = result | (b & 127) << i;
                  i = i + 7;
                  continue;
               }
               result = result | b << i;
               break;
            }
            while(input.readUnsignedByte() >= 128)
            {
            }
            break;
         }
         return result;
      }
      
      public static function read_TYPE_ENUM(input:IDataInput) : int
      {
         return read_TYPE_INT32(input);
      }
      
      public static function read_TYPE_SFIXED32(input:IDataInput) : int
      {
         return input.readInt();
      }
      
      public static function read_TYPE_SFIXED64(input:IDataInput) : Int64
      {
         var result:Int64 = new Int64();
         result.low = input.readUnsignedInt();
         result.high = input.readInt();
         return result;
      }
      
      public static function read_TYPE_SINT32(input:IDataInput) : int
      {
         return ZigZag.decode32(read_TYPE_UINT32(input));
      }
      
      public static function read_TYPE_SINT64(input:IDataInput) : Int64
      {
         var result:Int64 = null;
         result = read_TYPE_INT64(input);
         var low:uint = result.low;
         var high:uint = result.high;
         result.low = ZigZag.decode64low(low,high);
         result.high = ZigZag.decode64high(low,high);
         return result;
      }
      
      public static function read_TYPE_MESSAGE(input:IDataInput, message:Message) : Message
      {
         var length:uint = read_TYPE_UINT32(input);
         if(input.bytesAvailable < length)
         {
            throw new IOError("Invalid message length: " + length);
         }
         var bytesAfterSlice:uint = input.bytesAvailable - length;
         message.used_by_generated_code::readFromSlice(input,bytesAfterSlice);
         if(input.bytesAvailable != bytesAfterSlice)
         {
            throw new IOError("Invalid nested message");
         }
         return message;
      }
      
      public static function readPackedRepeated(input:IDataInput, readFuntion:Function, value:Array) : void
      {
         var length:uint = read_TYPE_UINT32(input);
         if(input.bytesAvailable < length)
         {
            throw new IOError("Invalid message length: " + length);
         }
         var bytesAfterSlice:uint = input.bytesAvailable - length;
         while(input.bytesAvailable > bytesAfterSlice)
         {
            value.push(readFuntion(input));
         }
         if(input.bytesAvailable != bytesAfterSlice)
         {
            throw new IOError("Invalid packed repeated data");
         }
      }
   }
}
