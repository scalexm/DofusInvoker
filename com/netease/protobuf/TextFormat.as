package com.netease.protobuf
{
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor_TYPE_BYTES;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor_TYPE_ENUM;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor_TYPE_BYTES;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor_TYPE_ENUM;
   import flash.errors.IOError;
   import flash.utils.ByteArray;
   import flash.utils.Dictionary;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import flash.utils.describeType;
   import flash.utils.getDefinitionByName;
   
   public final class TextFormat
   {
      
      private static const allEnumValues:Dictionary = new Dictionary();
      
      private static const allMessageFields:Dictionary = new Dictionary();
       
      
      public function TextFormat()
      {
         super();
      }
      
      private static function printHex(output:IDataOutput, value:uint) : void
      {
         var hexString:String = value.toString(16);
         output.writeUTFBytes("00000000".substring(0,8 - hexString.length));
         output.writeUTFBytes(hexString);
      }
      
      private static function printEnum(output:IDataOutput, value:int, enumType:Class) : void
      {
         var enumValues:Array = null;
         var enumTypeDescription:XML = null;
         var xmlNames:XMLList = null;
         var name:String = null;
         if(enumType in allEnumValues)
         {
            enumValues = allEnumValues[enumType];
         }
         else
         {
            enumTypeDescription = describeType(enumType);
            xmlNames = enumTypeDescription.*.@name;
            enumValues = [];
            for each(name in xmlNames)
            {
               enumValues[enumType[name]] = name;
            }
            allEnumValues[enumType] = enumValues;
         }
         if(value in enumValues)
         {
            output.writeUTFBytes(enumValues[value]);
            return;
         }
         throw new IOError(value + " is invalid for " + enumTypeDescription.@name);
      }
      
      private static function printBytes(output:IDataOutput, value:ByteArray) : void
      {
         var byte:int = 0;
         output.writeUTFBytes("\"");
         value.position = 0;
         while(value.bytesAvailable > 0)
         {
            byte = value.readByte();
            switch(byte)
            {
               case 7:
                  output.writeUTFBytes("\\a");
                  continue;
               case 8:
                  output.writeUTFBytes("\\b");
                  continue;
               case 12:
                  output.writeUTFBytes("\\f");
                  continue;
               case 10:
                  output.writeUTFBytes("\\n");
                  continue;
               case 13:
                  output.writeUTFBytes("\\r");
                  continue;
               case 9:
                  output.writeUTFBytes("\\t");
                  continue;
               case 11:
                  output.writeUTFBytes("\\v");
                  continue;
               case 92:
                  output.writeUTFBytes("\\\\");
                  continue;
               case 39:
                  output.writeUTFBytes("\\\'");
                  continue;
               case 34:
                  output.writeUTFBytes("\\\"");
                  continue;
               default:
                  if(byte >= 32)
                  {
                     output.writeByte(byte);
                  }
                  else
                  {
                     output.writeUTFBytes("\\");
                     output.writeByte("0".charCodeAt() + (byte >>> 6 & 3));
                     output.writeByte("0".charCodeAt() + (byte >>> 3 & 7));
                     output.writeByte("0".charCodeAt() + (byte & 7));
                  }
                  continue;
            }
         }
         output.writeUTFBytes("\"");
      }
      
      private static function printString(output:IDataOutput, value:String) : void
      {
         var buffer:ByteArray = new ByteArray();
         buffer.writeUTFBytes(value);
         printBytes(output,buffer);
      }
      
      private static function printUnknownField(output:IDataOutput, tag:uint, value:Object, printSetting:PrintSetting, currentIndent:String) : void
      {
         var k:int = 0;
         var unknownArray:Array = value as Array;
         if(unknownArray)
         {
            if(unknownArray.length > 0)
            {
               printSingleUnknownField(output,tag,unknownArray[k],printSetting,currentIndent);
               for(k = 1; k < unknownArray.length; k++)
               {
                  output.writeByte(printSetting.newLine);
                  printSingleUnknownField(output,tag,unknownArray[k],printSetting,currentIndent);
               }
            }
         }
         else
         {
            printSingleUnknownField(output,tag,value,printSetting,currentIndent);
         }
      }
      
      private static function printSingleUnknownField(output:IDataOutput, tag:uint, value:Object, printSetting:PrintSetting, currentIndent:String) : void
      {
         var u64:UInt64 = null;
         output.writeUTFBytes(currentIndent);
         output.writeUTFBytes(String(tag >>> 3));
         output.writeUTFBytes(printSetting.simpleFieldSeperator);
         switch(tag & 7)
         {
            case WireType.VARINT:
               output.writeUTFBytes(UInt64(value).toString());
               break;
            case WireType.FIXED_32_BIT:
               output.writeUTFBytes("0x");
               printHex(output,uint(value));
               break;
            case WireType.FIXED_64_BIT:
               u64 = UInt64(value);
               output.writeUTFBytes("0x");
               printHex(output,u64.high);
               printHex(output,u64.low);
               break;
            case WireType.LENGTH_DELIMITED:
               printBytes(output,ByteArray(value));
         }
      }
      
      private static function printMessageFields(output:IDataOutput, message:Message, printSetting:PrintSetting, currentIndent:String = "") : void
      {
         var isFirst:Boolean = false;
         var messageFields:XMLList = null;
         var fieldDescriptorName:String = null;
         var key:String = null;
         var description:XML = null;
         var fieldDescriptor:BaseFieldDescriptor = null;
         var shortName:String = null;
         var fieldValues:Array = null;
         var i:int = 0;
         var m:Array = null;
         var hasField:String = null;
         var extension:BaseFieldDescriptor = null;
         var extensionFieldValues:Array = null;
         var j:int = 0;
         isFirst = true;
         var type:Class = Object(message).constructor;
         if(type in allMessageFields)
         {
            messageFields = allMessageFields[type];
         }
         else
         {
            description = describeType(type);
            messageFields = description.*.(0 == String(@type).search(/^com.netease.protobuf.fieldDescriptors::(Repeated)?FieldDescriptor_/) && BaseFieldDescriptor(type[@name]).name.search(/\//) == -1).@name;
            allMessageFields[type] = messageFields;
         }
         for each(fieldDescriptorName in messageFields)
         {
            fieldDescriptor = type[fieldDescriptorName];
            shortName = fieldDescriptor.fullName.substring(fieldDescriptor.fullName.lastIndexOf(".") + 1);
            if(fieldDescriptor.type == Array)
            {
               fieldValues = message[fieldDescriptor.name];
               if(fieldValues)
               {
                  for(i = 0; i < fieldValues.length; i++)
                  {
                     if(isFirst)
                     {
                        isFirst = false;
                     }
                     else
                     {
                        output.writeByte(printSetting.newLine);
                     }
                     output.writeUTFBytes(currentIndent);
                     output.writeUTFBytes(shortName);
                     printValue(output,fieldDescriptor,fieldValues[i],printSetting,currentIndent);
                  }
               }
            }
            else
            {
               m = fieldDescriptor.name.match(/^(__)?(.)(.*)$/);
               m[0] = "";
               m[1] = "has";
               m[2] = m[2].toUpperCase();
               hasField = m.join("");
               try
               {
                  if(false === message[hasField])
                  {
                     continue;
                  }
               }
               catch(e:ReferenceError)
               {
               }
               if(isFirst)
               {
                  isFirst = false;
               }
               else
               {
                  output.writeByte(printSetting.newLine);
               }
               output.writeUTFBytes(currentIndent);
               output.writeUTFBytes(shortName);
               printValue(output,fieldDescriptor,message[fieldDescriptor.name],printSetting,currentIndent);
            }
         }
         for(key in message)
         {
            if(message.propertyIsEnumerable(key))
            {
               try
               {
                  extension = BaseFieldDescriptor.getExtensionByName(key);
               }
               catch(e:ReferenceError)
               {
                  if(key.search(/^[0-9]+$/) == 0)
                  {
                     if(isFirst)
                     {
                        isFirst = false;
                     }
                     else
                     {
                        output.writeByte(printSetting.newLine);
                     }
                     printUnknownField(output,uint(key),message[key],printSetting,currentIndent);
                     continue;
                  }
                  throw new IOError("Bad unknown field " + key);
               }
               if(extension.type == Array)
               {
                  extensionFieldValues = message[key];
                  for(j = 0; j < extensionFieldValues.length; j++)
                  {
                     if(isFirst)
                     {
                        isFirst = false;
                     }
                     else
                     {
                        output.writeByte(printSetting.newLine);
                     }
                     output.writeUTFBytes(currentIndent);
                     output.writeUTFBytes("[");
                     output.writeUTFBytes(extension.fullName);
                     output.writeUTFBytes("]");
                     printValue(output,extension,extensionFieldValues[j],printSetting,currentIndent);
                  }
               }
               else
               {
                  if(isFirst)
                  {
                     isFirst = false;
                  }
                  else
                  {
                     output.writeByte(printSetting.newLine);
                  }
                  output.writeUTFBytes(currentIndent);
                  output.writeUTFBytes("[");
                  output.writeUTFBytes(extension.fullName);
                  output.writeUTFBytes("]");
                  printValue(output,extension,message[key],printSetting,currentIndent);
               }
            }
         }
      }
      
      private static function printValue(output:IDataOutput, fieldDescriptor:BaseFieldDescriptor, value:Object, printSetting:PrintSetting, currentIndent:String = "") : void
      {
         var stringValue:String = null;
         var enumFieldDescriptor:FieldDescriptor_TYPE_ENUM = null;
         var enumRepeatedFieldDescriptor:RepeatedFieldDescriptor_TYPE_ENUM = null;
         var message:Message = value as Message;
         if(message)
         {
            if(printSetting == SINGLELINE_MODE)
            {
               output.writeUTFBytes("{");
            }
            else
            {
               output.writeUTFBytes(" {\n");
            }
            printMessageFields(output,message,printSetting,printSetting.indentChars + currentIndent);
            if(printSetting == SINGLELINE_MODE)
            {
               output.writeUTFBytes("}");
            }
            else
            {
               output.writeByte(printSetting.newLine);
               output.writeUTFBytes(currentIndent);
               output.writeUTFBytes("}");
            }
         }
         else
         {
            output.writeUTFBytes(printSetting.simpleFieldSeperator);
            stringValue = value as String;
            if(stringValue !== null)
            {
               printString(output,stringValue);
            }
            else
            {
               enumFieldDescriptor = fieldDescriptor as FieldDescriptor_TYPE_ENUM;
               if(enumFieldDescriptor)
               {
                  printEnum(output,int(value),enumFieldDescriptor.enumType);
               }
               else
               {
                  enumRepeatedFieldDescriptor = fieldDescriptor as RepeatedFieldDescriptor_TYPE_ENUM;
                  if(enumRepeatedFieldDescriptor)
                  {
                     printEnum(output,int(value),enumRepeatedFieldDescriptor.enumType);
                  }
                  else if(fieldDescriptor is FieldDescriptor_TYPE_BYTES || fieldDescriptor is RepeatedFieldDescriptor_TYPE_BYTES)
                  {
                     printBytes(output,ByteArray(value));
                  }
                  else
                  {
                     output.writeUTFBytes(value.toString());
                  }
               }
            }
         }
      }
      
      public static function printToUTFBytes(output:IDataOutput, message:Message, singleLineMode:Boolean = true, currentIndent:String = "") : void
      {
         printMessageFields(output,message,!!singleLineMode?SINGLELINE_MODE:MULTILINE_MODE,currentIndent);
      }
      
      public static function printToString(message:Message, singleLineMode:Boolean = true, currentIndent:String = "") : String
      {
         var ba:ByteArray = new ByteArray();
         printToUTFBytes(ba,message,singleLineMode,currentIndent);
         ba.position = 0;
         return ba.readUTFBytes(ba.length);
      }
      
      private static function skipWhitespace(source:ISource) : void
      {
         var b:int = 0;
         loop0:
         while(true)
         {
            b = source.read();
            switch(b)
            {
               case 32:
               case 9:
               case 10:
               case 13:
                  continue;
               case 35:
                  loop1:
                  while(true)
                  {
                     switch(source.read())
                     {
                        case 10:
                        case 13:
                           break loop1;
                        default:
                           continue;
                     }
                  }
                  continue;
               default:
                  break loop0;
            }
         }
         source.unread(b);
      }
      
      private static function toHexDigit(b:int) : int
      {
         if(b >= 48 && b <= 57)
         {
            return b - 48;
         }
         if(b >= 97 && b <= 102)
         {
            return b - 87;
         }
         if(b >= 65 && b <= 70)
         {
            return b - 55;
         }
         throw new IOError("Expect hex, got " + String.fromCharCode(b));
      }
      
      private static function toOctalDigit(b:int) : int
      {
         if(b >= 48 && b <= 55)
         {
            return b - 48;
         }
         throw new IOError("Expect digit, got " + String.fromCharCode(b));
      }
      
      private static function tryConsumeBytes(source:ISource) : ByteArray
      {
         var result:ByteArray = null;
         var b:int = 0;
         var b0:int = 0;
         var x0:int = 0;
         var x1:int = 0;
         var b1:int = 0;
         var b2:int = 0;
         skipWhitespace(source);
         var start:int = source.read();
         switch(start)
         {
            case 34:
            case 39:
               result = new ByteArray();
               loop0:
               while(true)
               {
                  b = source.read();
                  switch(b)
                  {
                     case start:
                        break loop0;
                     case 92:
                        b0 = source.read();
                        switch(b0)
                        {
                           case 97:
                              result.writeByte(7);
                              continue;
                           case 98:
                              result.writeByte(8);
                              continue;
                           case 102:
                              result.writeByte(12);
                              continue;
                           case 110:
                              result.writeByte(10);
                              continue;
                           case 114:
                              result.writeByte(13);
                              continue;
                           case 116:
                              result.writeByte(9);
                              continue;
                           case 118:
                              result.writeByte(11);
                              continue;
                           case 120:
                              x0 = source.read();
                              x1 = source.read();
                              result.writeByte(toHexDigit(x0) * 16 + toHexDigit(x1));
                              continue;
                           default:
                              if(b0 >= 48 && b0 <= 57)
                              {
                                 b1 = source.read();
                                 b2 = source.read();
                                 result.writeByte(toOctalDigit(b0) * 64 + toOctalDigit(b1) * 8 + toOctalDigit(b2));
                              }
                              else
                              {
                                 result.writeByte(b0);
                              }
                              continue;
                        }
                     default:
                        result.writeByte(b);
                        continue;
                  }
               }
               return result;
            default:
               source.unread(start);
               return null;
         }
      }
      
      private static function tryConsume(source:ISource, expected:int) : Boolean
      {
         skipWhitespace(source);
         var b:int = source.read();
         if(b == expected)
         {
            return true;
         }
         source.unread(b);
         return false;
      }
      
      private static function consume(source:ISource, expected:int) : void
      {
         skipWhitespace(source);
         var b:int = source.read();
         if(b != expected)
         {
            throw new IOError("Expect " + String.fromCharCode(expected) + ", got " + String.fromCharCode(b));
         }
      }
      
      private static function consumeIdentifier(source:ISource) : String
      {
         var b:int = 0;
         skipWhitespace(source);
         var nameBuffer:ByteArray = new ByteArray();
         while(true)
         {
            b = source.read();
            if(b >= 48 && b <= 57 || b >= 65 && b <= 90 || b >= 97 && b <= 122 || b == 46 || b == 95 || b == 45 || b < 0)
            {
               nameBuffer.writeByte(b);
               continue;
            }
            break;
         }
         if(nameBuffer.length == 0)
         {
            throw new IOError("Expect Identifier, got " + String.fromCharCode(b));
         }
         source.unread(b);
         nameBuffer.position = 0;
         return nameBuffer.readUTFBytes(nameBuffer.length);
      }
      
      private static function appendUnknown(message:Message, tag:uint, value:*) : void
      {
         var oldArray:Array = null;
         var oldValue:* = message[tag];
         if(oldValue === undefined)
         {
            message[tag] = value;
         }
         else
         {
            oldArray = oldValue as Array;
            if(oldArray)
            {
               oldArray.push(value);
            }
            else
            {
               message[tag] = [oldValue,value];
            }
         }
      }
      
      private static function consumeUnknown(source:ISource, message:Message, number:uint) : void
      {
         var identifier:String = null;
         var bytes:ByteArray = tryConsumeBytes(source);
         if(bytes)
         {
            appendUnknown(message,number << 3 | WireType.LENGTH_DELIMITED,bytes);
            return;
         }
         identifier = consumeIdentifier(source);
         var m:Array = identifier.match(/^0[xX]([0-9a-fA-F]{16}|[0-9a-fA-F]{8})$/);
         if(!m)
         {
            appendUnknown(message,number << 3 | WireType.VARINT,UInt64.parseUInt64(identifier));
            return;
         }
         var hex:String = m[1];
         if(hex.length == 8)
         {
            appendUnknown(message,number << 3 | WireType.FIXED_32_BIT,uint(parseInt(hex,16)));
         }
         else
         {
            appendUnknown(message,number << 3 | WireType.FIXED_64_BIT,UInt64.parseUInt64(hex,16));
         }
      }
      
      private static function consumeEnumFieldValue(source:ISource, enumType:Class) : int
      {
         var enumName:String = null;
         consume(source,58);
         enumName = consumeIdentifier(source);
         var result:* = enumType[enumName];
         if(result === undefined)
         {
            throw new IOError("Invalid enum name " + enumName);
         }
         return result;
      }
      
      private static function parseUnknown(message:Message) : void
      {
         var fieldName:* = null;
         var normalBuffer:ByteArray = null;
         var tag:uint = 0;
         var buffer:WritingBuffer = new WritingBuffer();
         for(fieldName in message)
         {
            tag = uint(fieldName);
            if(tag != 0)
            {
               WriteUtils.writeUnknownPair(buffer,tag,message[fieldName]);
               delete message[fieldName];
            }
         }
         normalBuffer = new ByteArray();
         buffer.toNormal(normalBuffer);
         normalBuffer.position = 0;
         message.mergeFrom(normalBuffer);
      }
      
      private static function consumeFieldValue(source:ISource, type:Class) : *
      {
         var bytes:ByteArray = null;
         var binaryString:ByteArray = null;
         var booleanString:String = null;
         var message:Message = null;
         switch(type)
         {
            case ByteArray:
               consume(source,58);
               bytes = tryConsumeBytes(source);
               if(bytes)
               {
                  bytes.position = 0;
                  return bytes;
               }
               throw new IOError("Expect quoted bytes");
            case String:
               consume(source,58);
               binaryString = tryConsumeBytes(source);
               if(binaryString)
               {
                  binaryString.position = 0;
                  return binaryString.readUTFBytes(binaryString.length);
               }
               throw new IOError("Expect quoted string");
            case Boolean:
               consume(source,58);
               booleanString = consumeIdentifier(source);
               switch(booleanString)
               {
                  case "true":
                     return true;
                  case "false":
                     return false;
                  default:
                     throw new IOError("Expect boolean, got " + booleanString);
               }
            case Int64:
               consume(source,58);
               return Int64.parseInt64(consumeIdentifier(source));
            case UInt64:
               consume(source,58);
               return UInt64.parseUInt64(consumeIdentifier(source));
            case uint:
               consume(source,58);
               return uint(parseInt(consumeIdentifier(source)));
            case int:
               consume(source,58);
               return int(parseInt(consumeIdentifier(source)));
            case Number:
               consume(source,58);
               return parseFloat(consumeIdentifier(source));
            default:
               tryConsume(source,58);
               consume(source,123);
               message = new type();
               while(!tryConsume(source,125))
               {
                  consumeField(source,message);
               }
               parseUnknown(message);
               return message;
         }
      }
      
      private static function consumeField(source:ISource, message:Message) : void
      {
         var name:String = null;
         var fieldDescriptor:BaseFieldDescriptor = null;
         var lastDotPosition:int = 0;
         var scope:String = null;
         var localName:String = null;
         var destination:Array = null;
         var enumRepeatedFieldDescriptor:RepeatedFieldDescriptor_TYPE_ENUM = null;
         var enumFieldDescriptor:FieldDescriptor_TYPE_ENUM = null;
         var isExtension:Boolean = tryConsume(source,91);
         name = consumeIdentifier(source);
         if(isExtension)
         {
            consume(source,93);
         }
         if(isExtension)
         {
            lastDotPosition = name.lastIndexOf(".");
            scope = name.substring(0,lastDotPosition);
            localName = name.substring(lastDotPosition + 1);
            try
            {
               fieldDescriptor = getDefinitionByName(scope)[localName.toUpperCase()];
            }
            catch(e:ReferenceError)
            {
               try
               {
                  fieldDescriptor = BaseFieldDescriptor(getDefinitionByName(scope + "." + localName.toUpperCase()));
               }
               catch(e:ReferenceError)
               {
                  throw new IOError("Unknown extension: " + name);
               }
            }
         }
         else
         {
            if(name.search(/[0-9]+/) == 0)
            {
               consume(source,58);
               consumeUnknown(source,message,uint(name));
               return;
            }
            fieldDescriptor = Object(message).constructor[name.toUpperCase()];
            if(!fieldDescriptor)
            {
               throw new IOError("Unknown field: " + name);
            }
         }
         var repeatedFieldDescriptor:RepeatedFieldDescriptor = fieldDescriptor as RepeatedFieldDescriptor;
         if(repeatedFieldDescriptor)
         {
            destination = message[fieldDescriptor.name] || (message[fieldDescriptor.name] = []);
            enumRepeatedFieldDescriptor = repeatedFieldDescriptor as RepeatedFieldDescriptor_TYPE_ENUM;
            destination.push(!!enumRepeatedFieldDescriptor?consumeEnumFieldValue(source,enumRepeatedFieldDescriptor.enumType):consumeFieldValue(source,repeatedFieldDescriptor.elementType));
         }
         else
         {
            enumFieldDescriptor = fieldDescriptor as FieldDescriptor_TYPE_ENUM;
            message[fieldDescriptor.name] = !!enumFieldDescriptor?consumeEnumFieldValue(source,enumFieldDescriptor.enumType):consumeFieldValue(source,fieldDescriptor.type);
         }
      }
      
      private static function mergeFromSource(source:ISource, message:Message) : void
      {
         while(!tryConsume(source,0))
         {
            consumeField(source,message);
         }
         parseUnknown(message);
      }
      
      public static function mergeFromUTFBytes(input:IDataInput, message:Message) : void
      {
         mergeFromSource(new WrappedSource(input),message);
      }
      
      public static function mergeFromString(text:String, message:Message) : void
      {
         var source:BufferedSource = new BufferedSource();
         source.writeUTFBytes(text);
         source.position = 0;
         mergeFromSource(source,message);
      }
   }
}

interface ISource
{
    
   
   function read() : int;
   
   function unread(param1:int) : void;
}

import flash.utils.ByteArray;

class BufferedSource extends ByteArray implements ISource
{
    
   
   function BufferedSource()
   {
      super();
   }
   
   public function unread(value:int) : void
   {
      if(value == 0 && bytesAvailable == 0)
      {
         return;
      }
      position--;
   }
   
   public function read() : int
   {
      if(bytesAvailable > 0)
      {
         return readByte();
      }
      return 0;
   }
}

import flash.errors.EOFError;
import flash.errors.IOError;
import flash.utils.IDataInput;

class WrappedSource implements ISource
{
    
   
   private var input:IDataInput;
   
   private var temp:int;
   
   function WrappedSource(input:IDataInput)
   {
      super();
      this.input = input;
   }
   
   public function unread(value:int) : void
   {
      if(this.temp)
      {
         throw new IOError("Cannot unread twice!");
      }
      this.temp = value;
   }
   
   public function read() : int
   {
      var result:int = 0;
      if(this.temp)
      {
         result = this.temp;
         this.temp = 0;
         return result;
      }
      try
      {
         return this.input.readByte();
      }
      catch(e:EOFError)
      {
      }
      return 0;
   }
}

class PrintSetting
{
    
   
   public var newLine:uint;
   
   public var indentChars:String;
   
   public var simpleFieldSeperator:String;
   
   function PrintSetting()
   {
      super();
   }
}

const SINGLELINE_MODE:PrintSetting = new PrintSetting();

const MULTILINE_MODE:PrintSetting = new PrintSetting();
