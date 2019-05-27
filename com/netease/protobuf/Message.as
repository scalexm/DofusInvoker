package com.netease.protobuf
{
   import flash.errors.IOError;
   import flash.errors.IllegalOperationError;
   import flash.utils.Endian;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   public class Message
   {
       
      
      public function Message()
      {
         super();
      }
      
      public static function getExtensionByName(name:String) : IFieldDescriptor
      {
         return BaseFieldDescriptor.getExtensionByName(name);
      }
      
      public final function mergeFrom(input:IDataInput) : void
      {
         input.endian = Endian.LITTLE_ENDIAN;
         this.readFromSlice(input,0);
      }
      
      public final function mergeDelimitedFrom(input:IDataInput) : void
      {
         input.endian = Endian.LITTLE_ENDIAN;
         ReadUtils.read_TYPE_MESSAGE(input,this);
      }
      
      public final function writeTo(output:IDataOutput) : void
      {
         var buffer:WritingBuffer = new WritingBuffer();
         this.writeToBuffer(buffer);
         buffer.toNormal(output);
      }
      
      public final function writeDelimitedTo(output:IDataOutput) : void
      {
         var buffer:WritingBuffer = new WritingBuffer();
         WriteUtils.write_TYPE_MESSAGE(buffer,this);
         buffer.toNormal(output);
      }
      
      function readFromSlice(input:IDataInput, bytesAfterSlice:uint) : void
      {
         throw new IllegalOperationError("Not implemented!");
      }
      
      function writeToBuffer(output:WritingBuffer) : void
      {
         throw new IllegalOperationError("Not implemented!");
      }
      
      private function writeSingleUnknown(output:WritingBuffer, tag:uint, value:*) : void
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
      
      protected final function writeUnknown(output:WritingBuffer, fieldName:String) : void
      {
         var tag:uint = uint(fieldName);
         if(tag == 0)
         {
            throw new ArgumentError("Attemp to write an undefined string filed: " + fieldName);
         }
         WriteUtils.writeUnknownPair(output,tag,this[fieldName]);
      }
      
      protected final function writeExtensionOrUnknown(output:WritingBuffer, fieldName:String) : void
      {
         var fieldDescriptor:BaseFieldDescriptor = null;
         if(!this.propertyIsEnumerable(fieldName))
         {
            return;
         }
         try
         {
            fieldDescriptor = BaseFieldDescriptor.getExtensionByName(fieldName);
         }
         catch(e:ReferenceError)
         {
            writeUnknown(output,fieldName);
            return;
         }
         fieldDescriptor.write(output,this);
      }
      
      protected final function readUnknown(input:IDataInput, tag:uint) : void
      {
         var value:* = undefined;
         switch(tag & 7)
         {
            case WireType.VARINT:
               value = ReadUtils.read_TYPE_UINT64(input);
               break;
            case WireType.FIXED_64_BIT:
               value = ReadUtils.read_TYPE_FIXED64(input);
               break;
            case WireType.LENGTH_DELIMITED:
               value = ReadUtils.read_TYPE_BYTES(input);
               break;
            case WireType.FIXED_32_BIT:
               value = ReadUtils.read_TYPE_FIXED32(input);
               break;
            default:
               throw new IOError("Invalid wire type: " + (tag & 7));
         }
         var currentValue:* = this[tag];
         if(!currentValue)
         {
            this[tag] = value;
         }
         else if(currentValue is Array)
         {
            currentValue.push(value);
         }
         else
         {
            this[tag] = [currentValue,value];
         }
      }
      
      protected final function readExtensionOrUnknown(extensions:Array, input:IDataInput, tag:uint) : void
      {
         var readFunction:Function = extensions[tag];
         if(readFunction != null)
         {
            readFunction(input,this);
         }
         else
         {
            this.readUnknown(input,tag);
         }
      }
      
      public final function toString() : String
      {
         return TextFormat.printToString(this);
      }
   }
}
