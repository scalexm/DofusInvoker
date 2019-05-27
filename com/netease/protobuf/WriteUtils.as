package com.netease.protobuf
{
   import flash.errors.IOError;
   import flash.utils.ByteArray;
   
   public final class WriteUtils
   {
       
      
      public function WriteUtils()
      {
         super();
      }
      
      private static function writeSingleUnknown(output:WritingBuffer, tag:uint, value:*) : void
      {
         WriteUtils.write_TYPE_UINT32(output,tag);
         switch(tag & 7)
         {
            case WireType.VARINT:
               WriteUtils.write_TYPE_UINT64(output,value);
               break;
            case WireType.FIXED_64_BIT:
               WriteUtils.write_TYPE_FIXED64(output,value);
               break;
            case WireType.LENGTH_DELIMITED:
               WriteUtils.write_TYPE_BYTES(output,value);
               break;
            case WireType.FIXED_32_BIT:
               WriteUtils.write_TYPE_FIXED32(output,value);
               break;
            default:
               throw new IOError("Invalid wire type: " + (tag & 7));
         }
      }
      
      public static function writeUnknownPair(output:WritingBuffer, tag:uint, value:*) : void
      {
         var element:* = undefined;
         var repeated:Array = value as Array;
         if(repeated)
         {
            for each(element in repeated)
            {
               writeSingleUnknown(output,tag,element);
            }
         }
         else
         {
            writeSingleUnknown(output,tag,value);
         }
      }
      
      private static function writeVarint64(output:WritingBuffer, low:uint, high:uint) : void
      {
         var i:uint = 0;
         if(high == 0)
         {
            write_TYPE_UINT32(output,low);
         }
         else
         {
            for(i = 0; i < 4; i++)
            {
               output.writeByte(low & 127 | 128);
               low = low >>> 7;
            }
            if((high & 268435455 << 3) == 0)
            {
               output.writeByte(high << 4 | low);
            }
            else
            {
               output.writeByte((high << 4 | low) & 127 | 128);
               write_TYPE_UINT32(output,high >>> 3);
            }
         }
      }
      
      public static function writeTag(output:WritingBuffer, wireType:uint, number:uint) : void
      {
         write_TYPE_UINT32(output,number << 3 | wireType);
      }
      
      public static function write_TYPE_DOUBLE(output:WritingBuffer, value:Number) : void
      {
         output.writeDouble(value);
      }
      
      public static function write_TYPE_FLOAT(output:WritingBuffer, value:Number) : void
      {
         output.writeFloat(value);
      }
      
      public static function write_TYPE_INT64(output:WritingBuffer, value:Int64) : void
      {
         writeVarint64(output,value.low,value.high);
      }
      
      public static function write_TYPE_UINT64(output:WritingBuffer, value:UInt64) : void
      {
         writeVarint64(output,value.low,value.high);
      }
      
      public static function write_TYPE_INT32(output:WritingBuffer, value:int) : void
      {
         if(value < 0)
         {
            writeVarint64(output,value,4294967295);
         }
         else
         {
            write_TYPE_UINT32(output,value);
         }
      }
      
      public static function write_TYPE_FIXED64(output:WritingBuffer, value:UInt64) : void
      {
         output.writeUnsignedInt(value.low);
         output.writeUnsignedInt(value.high);
      }
      
      public static function write_TYPE_FIXED32(output:WritingBuffer, value:uint) : void
      {
         output.writeUnsignedInt(value);
      }
      
      public static function write_TYPE_BOOL(output:WritingBuffer, value:Boolean) : void
      {
         output.writeByte(!!value?1:0);
      }
      
      public static function write_TYPE_STRING(output:WritingBuffer, value:String) : void
      {
         var i:uint = output.beginBlock();
         output.writeUTFBytes(value);
         output.endBlock(i);
      }
      
      public static function write_TYPE_BYTES(output:WritingBuffer, value:ByteArray) : void
      {
         write_TYPE_UINT32(output,value.length);
         output.writeBytes(value);
      }
      
      public static function write_TYPE_UINT32(output:WritingBuffer, value:uint) : void
      {
         while(value >= 128)
         {
            output.writeByte(value & 127 | 128);
            value = value >>> 7;
         }
         output.writeByte(value);
      }
      
      public static function write_TYPE_ENUM(output:WritingBuffer, value:int) : void
      {
         write_TYPE_INT32(output,value);
      }
      
      public static function write_TYPE_SFIXED32(output:WritingBuffer, value:int) : void
      {
         output.writeInt(value);
      }
      
      public static function write_TYPE_SFIXED64(output:WritingBuffer, value:Int64) : void
      {
         output.writeUnsignedInt(value.low);
         output.writeInt(value.high);
      }
      
      public static function write_TYPE_SINT32(output:WritingBuffer, value:int) : void
      {
         write_TYPE_UINT32(output,ZigZag.encode32(value));
      }
      
      public static function write_TYPE_SINT64(output:WritingBuffer, value:Int64) : void
      {
         writeVarint64(output,ZigZag.encode64low(value.low,value.high),ZigZag.encode64high(value.low,value.high));
      }
      
      public static function write_TYPE_MESSAGE(output:WritingBuffer, value:Message) : void
      {
         var i:uint = output.beginBlock();
         value.used_by_generated_code::writeToBuffer(output);
         output.endBlock(i);
      }
      
      public static function writePackedRepeated(output:WritingBuffer, writeFunction:Function, value:Array) : void
      {
         var i:uint = output.beginBlock();
         for(var j:uint = 0; j < value.length; j++)
         {
            writeFunction(output,value[j]);
         }
         output.endBlock(i);
      }
   }
}
